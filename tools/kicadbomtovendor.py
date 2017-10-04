#!/usr/bin/python3
#
#   KiCAD BOM to DigiKey BOM conversion
#
#   John Nagle
#   October, 2016
#   License: GPL
#
#   Output is a tab-delimited file.
#
#   
#
import re
import sys
import argparse
import xml.etree.ElementTree
#
#   Main program
#
def main() :
    #   Get command line arguments
    parser = argparse.ArgumentParser(description="KiCAD XML bill of materials converter to .CSV format")
    parser.add_argument("--verbose", default=False, action="store_true", help="set verbose mode")
    parser.add_argument("--split", metavar="COLUMN", help="Split BOM into multiple output files based on this column")
    parser.add_argument("--select", action="append", metavar="COLUMN=VALUE", help="COLUMN=VALUE to select")
    parser.add_argument("files", action="append", help="XML file")
    args = parser.parse_args()                              # parse command line
    print(args)
    verbose = args.verbose
    selects = {}                                            # dict of (k, set(v))
    splitcol = args.split                                   # split on this arg
    if splitcol is not None :
        splitcol = splitcol.upper()                         # upper case column name
        print('Split on column "%s".' % (splitcol,))        # split on this column    
    #   Accumulate select keys
    if args.select is not None :
        for select in args.select :
            parts = select.split("=")                       # split at "="
            if len(parts) != 2 :                            # must be COLUMN=VALUE
                print('"--select COLUMN=VALUE" required.')
                parser.print_help()
                exit(1)
            k = parts[0].strip().upper()
            v = parts[1].strip().upper()                    # save selects as upper case
            if k not in selects :
                selects[k] = set()                          # need set for this key
            selects[k].add(v)                               # add value to set for this key
        print("Selection rules: ")
        for (k, sset) in selects.items() :
            print('  Select if %s is in %s.' % (k, list(sset)))
    #   Process all files on command line
    for infname in args.files :
        print(infname)
        try : 
            (outfname, suffix) = infname.rsplit(".",1)  # remove suffix
        except ValueError :
            print("Input must be a .xml file.")
            parser.print_help()
            exit(1)
        if suffix.lower() != "xml" :                    # must be XML
            print("Input must be a .xml file.")
            parser.print_help()
            exit(1)
        cv = Converter(selects, splitcol, verbose)
        cv.convert(infname, outfname)
 
#
#   converter -- converts file
#    
class Converter(object) :
    FIXEDFIELDS = ["REF","FOOTPRINT","VALUE", "QUANTITY"]           # fields we always want
    NOTDIFFERENTPART = set(["REF"])                      # still same part if this doesn't match
    OUTPUTSUFFIX = ".csv"                               # file output suffix

    def __init__(self, selects, splitcol, verbose = False) :
        self.selects = selects                          # selection list
        self.splitcol = splitcol                        # split output into multiple files based on this
        self.verbose = verbose                          # debug info
        self.tree = None                                # no tree yet
        self.fieldset = set(self.FIXEDFIELDS)           # set of all field names found
        self.fieldlist = None                           # list of column headings
        
    def cleanstr(self, s) :
        """
        Clean up a string to avoid CSV format problems
        """
        return(re.sub(r'\s+|,',' ', s).strip()) # remove tabs, newlines, and commas
                
    def handlecomp1(self, comp) :
        """
        Handle one component entry, pass 1 - find all field names
        """
        for field in comp.iter("field") :               # for all "field" items
            name = field.get("name")                    # get all "name" names
            name = name.upper()
            self.fieldset.add(name)
            
    def selectitem(self, fieldvals) :
        """
        Given a set of field values, decide if we want to keep this one.
        
        All SELECTs must be true.
        """
        for k in self.selects :                         # for all select rules
            if k not in fieldvals :                     # if not found, fail, unless missing allowed
                if "" not in self.selects[k] :          # if "--select FOO=" allow
                    return(False)                       # fails
            if fieldvals[k].upper() not in self.selects[k] :# if no find
                return(False)
        return(True)                                    # no select succeeded            
            
    def handlecomp2(self, comp) :
        """
        Handle one component entry, pass 2 - Collect and output fields
        """
        fieldvals = dict()
        try :
            ref = comp.attrib.get("ref")
            footprint = getattr(comp.find("footprint"),"text","")
            value = comp.find("value").text
        except (ValueError, AttributeError) as message :
            print("Required field missing from %s" % (comp.attrib))
            exit(1)
        fieldvals["REF"] = ref
        fieldvals["FOOTPRINT"] = footprint
        fieldvals["VALUE"] = value
        fieldvals["QUANTITY"] = "1"                 # one item at this point
        if self.verbose :
            print("%s" % (fieldvals,))
        #   Get user-defined fields    
        for field in comp.iter("field") :
            name = field.get("name")
            name = name.upper()
            fieldvals[name] = field.text
        if self.verbose :
            print("%s" % (fieldvals,))
        if self.selectitem(fieldvals) :             # if we want this item
            return(self.assembleline(fieldvals))    # return list of fields
        return(None)
            
    def assembleline(self, fieldvals) :
        """
        Assemble output fields into a list
        """
        s = ''                              # empty line
        outfields = []                      # output fields
        for fname in self.fieldlist :       # for all fields
            if fname in fieldvals :
                val = fieldvals[fname]      # get value
            else :
                val = ""                    # empty string otherwise
            outfields.append(self.cleanstr(val))     # remove things not desirable in CSV files
        return(outfields)                   # ordered list of fields
        
    def issamepart(self, rowa, rowb) :
        """
        True if both lists represent the same part        
        """
        if rowa is None or rowb is None :
            return(False)                       # None doesn't match
        for i in range(len(self.fieldlist)) :   # across 3 lists in sync
            if self.fieldlist[i] in self.NOTDIFFERENTPART : # some fields, such as REF, don't mean a new part
                continue
            if rowa[i] != rowb[i] :
                return(False)
        return(True)                            # all important fields matched
        
    def additems(self, rows) :               
        """
        Combine multiple instances of same part, adding to quantity
        """
        quanpos = self.fieldlist.index("QUANTITY")   # get index of quantity column
        refpos = self.fieldlist.index("REF")    # get index of ref column
        outrows = []
        prevrow = None
        quan = 0
        refs = []                               # concat REF fields
        for row in rows :                       # for all rows
            if not self.issamepart(prevrow, row) :  # if control break
                if prevrow is not None :
                    prevrow[quanpos] = str(quan) # set quantity
                    prevrow[refpos] = " ".join(refs) # set list of refs
                    outrows.append(prevrow)     # output stored row
                    quan = 0
                    refs = []   
            prevrow = row                       # process new row
            quan = quan + int(row[quanpos])     # add this quantity
            refs.append(row[refpos])            # add to list of refs

        if prevrow is not None :                # end of file
            prevrow[quanpos] = str(quan)        # do last item
            prevrow[refpos] = " ".join(refs) # set list of refs
            outrows.append(prevrow)             # output stored row
        return(outrows)                         # return summed rows
                
    def outputfile(self, rows, outfname) :
        """
        Output one file containing given rows
        """
        heading = ",".join(self.fieldlist)      # heading line
        outf = open(outfname,"w")               # open output file
        outf.write(heading + "\n")              # heading line
        for row in rows :                       # output all rows
            s = ",".join(row)            
            outf.write(s + "\n")                # print to file
        outf.close()                            # done
        print('Created file "%s".' % (outfname),)   # report
        
    def splitrows(self, splitcol, rows) :
        """
        Split rows into multiple lists of rows based on values in selected column
        
        Usually used to break up a BOM by vendor
        """
        rowsets = {}                            # col value, [rows]
        splitpos = self.fieldlist.index(splitcol)   # get index of split column
        if splitpos is None :                   # must find
            print('Column "%s" from --split not found in BOM' % (splitcol,))
            exit(1)
        for row in rows :
            k = row[splitpos]                   # get split column value
            if k is None or k == "" :
                k = "NONE"                      # use NONE if no value available
            k = k.upper()                       # always in upper case
            if k not in rowsets :
                rowsets[k] = []                 # add new output file
            rowsets[k].append(row)              # add this row to appropriate output file
        return(rowsets)                         # returns col value, [rows]
                                          
    def convert(self, infname, outfname) :
        """
        Convert one file
        """
        self.tree = xml.etree.ElementTree.parse(infname)
        root = self.tree.getroot()              # root element
        #   Pass 1 - inventory fields
        for comp in root.iter("comp") :
            self.handlecomp1(comp)
        if self.verbose :
            print("Field names found: %s" % (self.fieldset))
        self.fieldlist = list(self.fieldset)
        self.fieldlist.sort()                   # sort in place
        #   Pass 2 - accumulate rows
        rows = []
        for comp in root.iter("comp") : 
            row = self.handlecomp2(comp)
            if row is not None :
                rows.append(row)
        #   Pass 3 - combine rows of same items
        rows.sort()
        rows = self.additems(rows)              # combine items
        #   Pass 4 - output rows
        if self.splitcol is None :                   # all in one file
            self.outputfile(rows, outfname + self.OUTPUTSUFFIX)   # one file
        else :                                  # one file per column value
            rowsets = self.splitrows(self.splitcol, rows)
            for (colval, rows) in rowsets.items() :    # output multiple files
                self.outputfile(rows, outfname + "-" + colval + self.OUTPUTSUFFIX)
             

if __name__ == "__main__" :
    main()    

