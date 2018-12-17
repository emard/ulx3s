# Minimal required parts

When manually assembling boards, it is good to know
the minimal parts list that has to be assembled for the
board to respond and be programmed.

FPGA

    U1

Switching power supplies:

    C1,U3,L1,C2,RA1,RB1,C3,C4,C22,C17
    C9,U4,L2,C10,RA2,RB2,C11,C12,C23,C19
    C5,U5,L3,C6,RA3,RB3,C7,C8,C24,C20

Power-up and hold circuit:

    US1               - USB connector
    D8                - US1 power routing diode
    R10,D12           - USB power up
    D16,R3,B0         - BTN0 power up
    R6,Q1,D13,D10,R1  - power up transistor
    D11,R4,R2         - power hold

FPGA decoupling capacitors, board could probably
work without them:

    C17,C19,C20,C25,C26,C31,C32,C27,C28,C29,C30

USB-serial to program FPGA over USB. FPGA can also
be programmed without USB-serial chip using J4 JTAG header
and external JTAG programmer:

    R49,R50,R9,U6

Clock 25MHz to properly clock examples.
FPGA will respond with JTAG ID and can be
programmed even work for combinatorial-only
examples (no registers) without this clock.

    Y1
