svg2mod=~/src/downloaded/svg2mod/svg2mod/svg2mod.py

tmp_koncar=/tmp/koncar.svg
out_koncar=../koncar.pretty/koncar.kicad_mod

# svg2mod won't convert it correctly
tmp_grb=/tmp/hrvatski_grb.svg
out_grb=/tmp/hrvatski_grb.kicad_mod

all: $(out_koncar)

$(tmp_koncar): Koncar_Logo.svg
	sed -e "s/Layer 1/SilkS/g" $< > $@

$(out_koncar): $(tmp_koncar)
	$(svg2mod) --front-only --name koncar --value koncar -f 0.09 -i $< -o $@

$(tmp_grb): Hrvatski_Grb.svg
	sed -e "s/_201329768/SilkS/g" $< > $@

$(out_grb): $(tmp_grb)
	$(svg2mod) --front-only --name hrvatski_grb --value hrvatski_grb -f 1.5 -i $< -o $@

clean:
	rm -f $(tmp_koncar) $(tmp_grb)
	rm -f $(out_koncar) $(out_grb)
	rm -f *~

