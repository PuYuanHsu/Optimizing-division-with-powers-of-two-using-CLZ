00000000 <divisor>:
    0:        0008            c.addi4spn x10 0
    2:        0000            c.addi4spn x8 0

00000004 <dividend>:
    4:        00000013        addi x0 x0 0

00000008 <main>:
    8:        00000517        auipc x10 0x0 <divisor>
    c:        ff852503        lw x10 -8 x10
    10:        00000297        auipc x5 0x0 <divisor>
    14:        ff42a283        lw x5 -12 x5
    18:        00000097        auipc x1 0x0 <divisor>
    1c:        068080e7        jalr x1 x1 104
    20:        01f00393        addi x7 x0 31
    24:        40a38533        sub x10 x7 x10
    28:        00a2d633        srl x12 x5 x10
    2c:        00000517        auipc x10 0x0 <divisor>
    30:        fd452503        lw x10 -44 x10
    34:        00100313        addi x6 x0 1
    38:        40650333        sub x6 x10 x6
    3c:        0062f6b3        and x13 x5 x6
    40:        00400893        addi x17 x0 4
    44:        10000517        auipc x10 0x10000
    48:        fbc50513        addi x10 x10 -68
    4c:        00000073        ecall
    50:        00100893        addi x17 x0 1
    54:        00060513        addi x10 x12 0
    58:        00000073        ecall
    5c:        00400893        addi x17 x0 4
    60:        10000517        auipc x10 0x10000
    64:        faa50513        addi x10 x10 -86
    68:        00000073        ecall
    6c:        00100893        addi x17 x0 1
    70:        00068513        addi x10 x13 0
    74:        00000073        ecall
    78:        00a00893        addi x17 x0 10
    7c:        00000073        ecall

00000080 <count_leading_zeros>:
    80:        01100313        addi x6 x0 17
    84:        00100393        addi x7 x0 1

00000088 <shift_or_loop>:
    88:        00755e33        srl x28 x10 x7
    8c:        01c56533        or x10 x10 x28
    90:        00139393        slli x7 x7 1
    94:        fe63cae3        blt x7 x6 -12 <shift_or_loop>
    98:        55555337        lui x6 0x55555
    9c:        55530313        addi x6 x6 1365
    a0:        00155393        srli x7 x10 1
    a4:        0063f3b3        and x7 x7 x6
    a8:        40750533        sub x10 x10 x7
    ac:        33333337        lui x6 0x33333
    b0:        33330313        addi x6 x6 819
    b4:        00255393        srli x7 x10 2
    b8:        0063f3b3        and x7 x7 x6
    bc:        00657e33        and x28 x10 x6
    c0:        01c38533        add x10 x7 x28
    c4:        0f0f1337        lui x6 0xf0f1
    c8:        f0f30313        addi x6 x6 -241
    cc:        00455393        srli x7 x10 4
    d0:        00a38533        add x10 x7 x10
    d4:        00657533        and x10 x10 x6
    d8:        00855393        srli x7 x10 8
    dc:        00750533        add x10 x10 x7
    e0:        01055393        srli x7 x10 16
    e4:        00750533        add x10 x10 x7
    e8:        03f57513        andi x10 x10 63
    ec:        02000313        addi x6 x0 32
    f0:        40a30533        sub x10 x6 x10
    f4:        00008067        jalr x0 x1 0