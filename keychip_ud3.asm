        * = $9000

L0070           = $0070
L03A9           = $03A9
LB000           = $B000
LC442           = $C442
LC52C           = $C52C
LC873           = $C873
LDB55           = $DB55
LDCE9           = $DCE9
LE229           = $E229
LE53F           = $E53F
LE5BA           = $E5BA
LE62E           = $E62E
LE6E4           = $E6E4
LF232           = $F232
LFFC9           = $FFC9
LFFCC           = $FFCC

L9000:
    sta     $5F
    stx     $60
    ldx     #$90
    sec
    jsr     LDB55
    jsr     LDCE9
    rts

table_1:
    !byte $05, $97, $E4
    !byte $07, $98, $13
    !byte $0C, $98, $1F
    !byte $0E, $98, $35
    !byte $2C, $98, $4B
    !byte $37, $98, $4F
    !byte $4B, $9E, $D6
    !byte $0F, $98, $70
    !byte $50, $98, $5B
    !byte $42, $9A, $13
    !byte $49, $9A, $17
    !byte $41, $9A, $21
    !byte $4F, $98, $8A
    !byte $47, $98, $8B
    !byte $46, $98, $A6
    !byte $4E, $98, $BB
    !byte $4C, $98, $FF
    !byte $45, $99, $01
    !byte $44, $99, $08
    !byte $4D, $99, $4E
    !byte $48, $99, $71
    !byte $4A, $99, $78
    !byte $39, $99, $C2
    !byte $32, $99, $C3
    !byte $3A, $99, $C4
    !byte $29, $99, $C5
    !byte $22, $99, $C6
    !byte $2A, $99, $C7
    !byte $19, $99, $C8
    !byte $12, $99, $C9
    !byte $1A, $99, $CA
    !byte $0A, $99, $CB
    !byte $1F, $9F, $0A
    !byte $14, $9F, $0E

table_2:
    !byte $92, $05, $03, $01, $0C, $0C, $93, $17
    !byte $01, $10, $84, $05, $0C, $05, $14, $05
    !byte $93, $01, $16, $05, $93, $01, $16, $05
    !byte $20, $1E, $03, $93, $01, $16, $05, $20
    !byte $02, $0F, $18, $8F, $06, $06, $92, $3E
    !byte $0C, $82, $3E, $14, $8D, $05, $0D, $20
    !byte $06, $15, $0C, $0C, $80

table_3:
    !byte $13, $88, $11, $96, $1D, $BE, $20, $A4
    !byte $14, $84, $03, $93, $93, $83, $91, $9E
    !byte $9D, $BC, $92, $8F, $94, $89

table_4:
    !byte $21, $58, $0D, $91, $20, $20, $9D, $9D
    !byte $93, $21, $4C, $0D, $93, $21, $52

table_5:
    !byte $0D, $C9, $3A, $B0, $0A, $C9, $20, $F0
    !byte $EF

L90D7:  sec
        sbc     #$30
        sec
        sbc     #$D0
L90DD:  rts

L90DE:  cmp     #$3A
        bcs     L90DD

L90E2:
        cmp     #$20
        bne     L90D7
        jmp     L0070

L90E9:  ldx     #$0F
L90EB:  lda     table_5,x
        sta     $78,x
        dex
        bne     L90EB
        rts

;install chrget wedge
L90F4:  ldx     #$4C        ;JMP $90E2
        stx     $7D
        lda     #<L90E2
        sta     $7E
        lda     #>L90E2
        sta     $7F
        cpx     $79
        beq     L910C
        stx     $79
L9106:  ldx     #$DE
        ldy     #$90
        bne     L9118
L910C:  ldx     $7A
        ldy     $7B
        cpy     #$90
        bcc     L9118
        cpy     #$A0
        bcc     L9106
L9118:  stx     L03A9
        sty     $03AA
        lda     #$8B
        sta     $7A
        lda     #$97
        sta     $7B
        rts

L9127:  ldx     #$2E
        ldy     #$E6
L912B:  sei
        stx     $90
        sty     $91
        cli
        rts

L9132:  ldx     #$66
        ldy     #$96
        bne     L912B
L9138:  lda     LB000
        cmp     #$4C
        bne     L9149
        lda     $B003
        cmp     #$A9
        bne     L9149
        jsr     LB000
L9149:  sei
        ldx     #$49
        lda     #$00
L914E:  sta     $0377,x
        dex
        bne     L914E
        lda     #$64
        sta     $03B1
        lda     #$1E
        sta     $03A3
        lda     #$05
        sta     $03A2
        jsr     L90F4
        jsr     L9132
        jmp     L9FB4

L916C:  lda     $03BB
        sta     $03BC
        lda     $97
        sta     $03BB
        cmp     #$16
        bne     L9185
        ldx     #$0A
        ldy     #$03
        jsr     L9F99
        jmp     L921E

L9185:  ldy     $03BC
        iny
        bne     L91BD
        cmp     #$28
        bne     L9195
        inc     $03C0
        jmp     L9256

L9195:  cmp     #$48
        bne     L919F
        inc     $0386
        jmp     L9256

L919F:  cmp     #$47
        bne     L91A9
        inc     $0385
        jmp     L9256

L91A9:  cmp     #$37
        bne     L91B3
        inc     $03BF
        jmp     L9256

L91B3:  cmp     #$35
        bne     L91BD
        inc     $03B6
        jmp     L9256

L91BD:  jsr     L9FAA
        cpy     #$FE
        beq     L91FB
        cpy     #$DF
        bne     L91D1
        ldx     $03B1
L91CB:  iny
        bne     L91CB
        inx
        bne     L91CB
L91D1:  cmp     #$4A
        bne     L91D8
L91D5:  jmp     L99DB

L91D8:  cmp     #$42
        bne     L91E2
        ldy     $03BC
        iny
        beq     L91D5
L91E2:  ldx     $03AE
        bmi     L91F8
        cmp     #$41
        bne     L91EE
L91EB:  jmp     L92B0

L91EE:  cmp     #$49
        bne     L91F8
        ldy     $03BC
        iny
        beq     L91EB
L91F8:  jmp     L916C

L91FB:  ldx     $97
        inx
        bne     L91FB
        jsr     L9513
        ldy     #$02
        lda     ($5C),y
        sta     $03B5
        iny
        lda     ($5C),y
        sta     $03B8
        !byte   $A0
L9211:  brk
        sty     $9E
        ldx     #$0C
        lda     $E0,x
        bmi     L921B
        inx
L921B:  jsr     L9986
L921E:  jmp     L97CC

L9221:  lda     $0402
        beq     L921E
        lda     $03B5
        sta     $11
        lda     $03B8
        sta     $12
        jmp     L9245

L9233:  lda     $0402
        beq     L921E
        sec
        ror     $03A1
        jsr     L0070
        jsr     L0070
        jsr     LC873
L9245:  jsr     LC52C
        lsr     $03A1
        jsr     L95A2
        bne     L9259
        jsr     L94AB
        jmp     L9259

L9256:  jsr     L9513
L9259:  lda     #$00
        sta     $03AE
        sta     $03AF
        sta     $03B0
        sta     $03BB
        sta     $03BE
        sta     $01
        lda     #$80
        sta     $02
        sta     $03B9
        jsr     LE229
L9276:  jsr     L9320
        lda     $03BE
        cmp     #$18
        beq     L9285
        lda     $03AF
        bpl     L9294
L9285:  jsr     L9513
L9288:  lda     $98
        bne     L9288
        ldx     $97
        inx
        bne     L9288
        jmp     L916C

L9294:  jsr     L9552
        lda     $03C0
        lsr     ;a
        bcs     L92A3
L929D:  jsr     L949D
        jmp     L9276

L92A3:  lda     $03BE
        cmp     #$18
        beq     L9285
        jsr     L9552
        jmp     L929D

L92B0:  jsr     L9517
        lda     $03B0
        bmi     L92CC
        cpx     #$03
        bne     L92C1
L92BC:  jsr     L952B
        ldx     #$02
L92C1:  cpx     #$02
        beq     L92D8
        sec
        ror     $03B0
        txa
        beq     L92D2
L92CC:  jsr     L952B
        jsr     L94AB
L92D2:  lda     $03C0
        lsr     ;a
        bcc     L92DB
L92D8:  jsr     L952B
L92DB:  jsr     L9320
        sec
        ror     $03B0
        jmp     L916C

L92E5:  sec
        ror     $03AD
        lda     $03B0
        bpl     L9306
        jsr     L94FC
L92F1:  cpx     #$01
        beq     L92FC
        cpx     #$02
        bne     L9302
        jsr     L958B
L92FC:  lsr     $03AD
        jmp     L9315

L9302:  !byte   $E0
L9303:  !byte   $03
        bne     L9309
L9306:  jsr     L953E
L9309:  jsr     L949D
        lda     $03C0
        lsr     ;a
        bcc     L9315
        jsr     L953E
L9315:  jsr     L9320
        lda     $03AD
        bpl     L9306
        jmp     L916C

L9320:  lda     #$80
        sta     $03BA
        asl     ;a
        sta     $03B3
        ldy     #$02
        lda     ($5C),y
        tax
        iny
        lda     ($5C),y
        jsr     L9000
        ldx     #$00
        ldy     #$00
        jsr     L959A
L933B:  lda     $0101,x
        pha
        beq     L9355
        lda     $03BF
        lsr     ;a
        bcc     L934D
        pla
        ora     #$80
        jmp     L934E

L934D:  pla
L934E:  sta     ($01),y
        iny
        inx
        jmp     L933B

L9355:  pla
        jsr     L959A
        sty     $03B7
        lda     #$04
        pha
L935F:  sty     $03B2
        pla
        tay
        lda     ($5C),y
        tax
        iny
        lda     ($5C),y
        sta     $03BD
        sta     $03B4
        tya
        bpl     L9378
        pla
        pla
        jmp     L9211

L9378:  pha
        ldy     $03B2
        cpx     #$00
        bne     L9388
L9380:  pla
        jsr     L9572
        jsr     L9561
        rts

L9388:  cpx     #$22
        bne     L939A
        inc     $03B3
L938F:  txa
L9390:  and     #$BF
L9392:  pha
        jsr     L943C
        pla
        jmp     L935F

L939A:  lda     $03B3
        lsr     ;a
        bcc     L93E8
        lda     $0386
        lsr     ;a
        bcc     L93C8
        txa
        pha
        ldx     #$00
L93AA:  cmp     table_3,x
        bne     L93C0
        lda     $0385
        lsr     ;a
        bcs     L93B9
        cpx     #$06
        beq     L93C6
L93B9:  pla
        inx
        lda     table_3,x
        bne     L9392
L93C0:  inx
        inx
        cpx     #$16
        bne     L93AA
L93C6:  pla
        tax
L93C8:  cpx     #$FF
        bne     L93CE
L93CC:  ldx     #$DE
L93CE:  txa
        cmp     #$20
        bcc     L93E4
        txa
        bpl     L9390
        cmp     #$A0
        bcs     L93DE
        ora     #$40
        bne     L9392
L93DE:  cmp     #$C0
        bcs     L93E4
        ora     #$40
L93E4:  eor     #$80
        bne     L9392
L93E8:  inx
        beq     L93CC
        dex
        bpl     L938F
        sty     $11
        ldy     #$00
        lda     #$C0
        sta     $60
        lda     #$91
        sta     $5F
        sta     $03BD
L93FD:  dex
        bpl     L940F
        bmi     L9406
L9402:  lda     ($5F),y
        bmi     L93FD
L9406:  inc     $5F
        bne     L9402
        inc     $60
        jmp     L9402

L940F:  ldy     $11
        lda     #$01
        sta     $11
L9415:  tya
        ldy     $11
        sta     $11
        lda     ($5F),y
        tax
        iny
        tya
        ldy     $11
        sta     $11
        txa
        pha
        bpl     L9431
        ldx     $03B4
        bne     L9431
        ldx     #$00
        stx     $03BD
L9431:  and     #$3F
        jsr     L943C
        pla
        bpl     L9415
        jmp     L935F

L943C:  sta     ($01),y
        iny
        cpy     #$28
        beq     L9444
L9443:  rts

L9444:  lda     $03BD
        beq     L9443
        lda     $03BE
        cmp     #$18
        bne     L9461
        lda     $03BB
        bne     L945B
        pla
        pla
        pla
        jmp     L9380

L945B:  jsr     L953E
        jmp     L9471

L9461:  lda     $03B0
        bpl     L946E
        lda     $03BE
        sta     $D8
        jsr     L952F
L946E:  jsr     L9552
L9471:  ldy     $03BE
        lda     $03BA
        bmi     L9487
        lda     $02
        sta     $E0,y
        ldy     #$00
        lda     #$9F
        sta     ($01),y
        iny
        bne     L9493
L9487:  lda     $02
        and     #$7F
        sta     $E0,y
        sta     $03BA
        ldy     #$00
L9493:  lda     $03B6
        lsr     ;a
        bcc     L949C
        ldy     $03B7
L949C:  rts

L949D:  ldy     #$00
        lda     ($5C),y
        pha
        iny
        lda     ($5C),y
        sta     $5D
        pla
        sta     $5C
        rts

L94AB:  ldx     $5D
        dec     $5D
        ldy     #$01
L94B1:  dey
L94B2:  dey
L94B3:  dey
        lda     ($5C),y
        bne     L94B3
        iny
        lda     $5C
        cmp     ($5C),y
        bne     L94B2
        iny
        txa
        cmp     ($5C),y
        bne     L94B1
        dey
        tya
        clc
        adc     $5C
        sta     $5C
        bcc     L94D0
        inc     $5D
L94D0:  rts

L94D1:  ldx     #$03
        lda     $03BE
        bne     L94DE
        lda     $03B9
        jmp     L94E4

L94DE:  ldy     $03BE
        lda     $E0,y
L94E4:  bpl     L94FA
        ldy     #$00
        lda     ($01),y
        cmp     #$9F
        beq     L94FB
        asl     ;a
        bmi     L94F9
        iny
        lda     ($01),y
        cmp     #$20
        bne     L94F9
        dex
L94F9:  dex
L94FA:  dex
L94FB:  rts

L94FC:  lsr     $03B0
L94FF:  jsr     L9552
        jsr     L94D1
        cpx     #$01
        bne     L950C
        jsr     L949D
L950C:  lda     $01
        cmp     #$C0
        bne     L94FF
        rts

L9513:  sec
        ror     $03B0
L9517:  jsr     L94D1
        lda     $01
        beq     L94FB
        cpx     #$01
        bne     L9525
        jsr     L94AB
L9525:  jsr     L958B
        jmp     L9517

L952B:  lda     #$FF
L952D:  sta     $D8
L952F:  lda     #$00
        sta     $C6
        jsr     LE5BA
        lda     #$80
        sta     $E0
        sta     $03B9
        rts

L953E:  lda     $E1
        sta     $03B9
        lda     #$80
        sta     $E1
        jsr     LE53F
        sec
        ror     $03AD
        lsr     $03AE
        rts

L9552:  inc     $03BE
        clc
        lda     $01
        adc     #$28
        sta     $01
        bcc     L9571
        inc     $02
        rts

L9561:  lda     $5C
        cmp     #$01
        bne     L9571
        lda     $5D
        cmp     #$04
        bne     L9571
        sec
        ror     $03AE
L9571:  rts

L9572:  lda     $5C
        pha
        lda     $5D
        pha
        jsr     L949D
        jsr     L95A2
        bne     L9584
        sec
        ror     $03AF
L9584:  pla
        sta     $5D
        pla
        sta     $5C
        rts

L958B:  dec     $03BE
        sec
        lda     $01
        sbc     #$28
        sta     $01
        bcs     L9571
        dec     $02
        rts

L959A:  lda     $03BF
        lsr     ;a
        bcs     L95A1
        iny
L95A1:  rts

L95A2:  ldy     #$00
        lda     ($5C),y
        bne     L9571
        iny
        lda     ($5C),y
        rts

L95AC:  dex
L95AD:  stx     $5F
        lda     #$04
        sta     $12
        lda     #$00
        tay
        tax
        sta     $11
L95B9:  sta     $10
        tya
        beq     L95E9
        lda     $11
        sta     $5C
        lda     $12
        sta     $5D
        lda     $2A
        sty     $2A
        sec
        sbc     $2A
        sta     $2A
        bcs     L95D3
        dec     $2B
L95D3:  inc     $5C
        bne     L95D9
        inc     $5D
L95D9:  lda     ($5C),y
        sta     ($5C,x)
        lda     $5D
        cmp     $2B
        bne     L95D3
        lda     $5C
        cmp     $2A
        bne     L95D3
L95E9:  ldy     #$02
        lda     ($11),y
        bne     L95F2
        jmp     LC442

L95F2:  ldy     #$05
        lda     ($11),y
        cmp     #$3A
        beq     L95FE
        cmp     #$83
        bne     L9600
L95FE:  inc     $10
L9600:  lda     $5F
        bmi     L960A
        lda     ($11),y
        cmp     #$8F
        beq     L9621
L960A:  clc
        lda     $11
        adc     #$04
        sta     $11
        bcc     L9615
        inc     $12
L9615:  ldy     #$00
        sty     $60
        sty     $0F
L961B:  inc     $11
        bne     L9621
        inc     $12
L9621:  lda     ($11),y
        sta     ($11,x)
        beq     L95B9
        lda     $10
        bne     L961B
        lda     $60
        bmi     L9646
        lda     ($11),y
        cmp     #$3A
        bne     L963F
        iny
        lda     ($11),y
        dey
        cmp     #$8F
        beq     L9646
        lda     ($11),y
L963F:  cmp     #$8F
        bne     L964C
        sec
        ror     $60
L9646:  lda     $5F
        bmi     L961B
        bpl     L9663
L964C:  cmp     #$22
        bne     L9654
        inc     $0F
        bne     L961B
L9654:  lda     $0F
        lsr     ;a
        bcs     L961B
        lda     $5F
        bpl     L961B
        lda     ($11),y
        cmp     #$20
        bne     L961B
L9663:  iny
        bne     L9621
        ldx     $97
        inx
        bne     L9677
        lda     $03A3
        sta     $03A6
L9671:  dec     $03A6
        jmp     L96B3

L9677:  lda     $03A6
        bne     L9671
        cpx     #$1C
        beq     L96B3
        cpx     #$09
        beq     L96B3
        lda     $03AC
        bmi     L96B3
        beq     L969B
        cpx     #$43
        beq     L969B
        cpx     #$4A
        beq     L969B
        cpx     #$42
        beq     L969B
        cpx     #$07
        bne     L96B3
L969B:  ldy     $AA
        bne     L96A2
        iny
        sty     $A8
L96A2:  ldy     $03A5
        bne     L96B0
        iny
        sty     $97
        lda     $03A2
        sta     $03A5
L96B0:  dec     $03A5
L96B3:  tsx
        lda     $0108,x
        cmp     #$F8
        bne     L96D4
        lda     $0107,x
        cmp     #$E8
        bne     L96D4
        ldx     $37
        inx
        bne     L96CE
        ldx     #$07
        ldy     #$08
        jsr     L9F99
L96CE:  jsr     L9127
L96D1:  jmp     LE62E

L96D4:  lda     $98
        beq     L96D1
        jsr     L9FAA
        tya
        and     #$01
        bne     L96D1
        lda     $03AB
        bpl     L96EC
        lda     $03A1
        bpl     L96D1
        bmi     L96FE
L96EC:  lda     $0387
        lsr     ;a
        bcc     L96F8
        cpy     #$DE
        beq     L96FE
        bne     L96D1
L96F8:  lda     $97
        cmp     #$14
        beq     L9717
L96FE:  lda     $A4
        bne     L96D1
        lda     $03A1
        bpl     L9710
        lsr     $03AB
        lsr     $03A1
        jmp     L96D1

L9710:  cpy     #$DE
        bne     L9717
        inc     $0387
L9717:  sec
        ror     $03AB
        lda     #$97
        pha
        lda     #$36
        pha
        lda     #$00
        pha
        pha
        pha
        pha
        beq     L96D1
L9729:  ldx     $97
        inx
        bne     L9729
        stx     $9E
L9730:  lsr     $03AB
        jmp     LE6E4

        lda     #$00
        sta     $A7
        sta     $DC
L973C:  ldx     $97
        cpx     #$14
        beq     L9745
        inx
        bne     L973C
L9745:  ldx     $98
        lda     $97
        cmp     #$FF
        bne     L9756
        txa
        bne     L9745
        lda     $97
        cmp     #$FF
        beq     L9729

L9756:  ldx     #$00
L9758:  cmp     table_1,x
        beq     L9766
        inx
        inx
        inx
        cpx     #$66
        bne     L9758
        beq     L9745
L9766:  lda     #$97
        pha
        lda     #$35
        pha
        inx
        lda     table_1,x
        pha
        inx
        lda     table_1,x
        pha
        inc     $A7
        lda     $A4
        bne     L978A
        ldy     $C6
        lda     $A9
        sta     ($C4),y
        lsr     $AA
        jsr     L99A8
        txa
        ldx     #$00
L978A:  rts

        cmp     #$21
        bne     L97E2
        lda     $03AB
        asl     ;a
        lda     #$21
        bcs     L97D1
        sty     $03A0
        stx     $039F
        tsx
        lda     $0102,x
        cmp     #$C5
        bcs     L97D7
        sec
        ror     $03AB
        ldy     #$01
        lda     ($77),y
        tax
        beq     L97D7
        iny
        lda     ($77),y
        cmp     #$3A
        bcs     L97D4
L97B7:  cpx     #$4C
        bne     L97BE
        jmp     L9233

L97BE:  cpx     #$52
        bne     L97C5
        jmp     L9221

L97C5:  cpx     #$58
        bne     L97D7
        jsr     L9132
L97CC:  lda     #$00
        lsr     $03AB
L97D1:  jmp     L90DE

L97D4:  tay
        beq     L97B7
L97D7:  ldy     $03A0
        ldx     $039F
        lda     #$21
        lsr     $03AB
L97E2:  jmp     (L03A9)

L97E5:  ldy     #$00
        lda     ($C4),y
        cmp     #$20
        bne     L97EE
L97ED:  iny
L97EE:  lda     ($C4),y
        and     #$7F
        cmp     #$30
        bcc     L97FA
        cmp     #$3A
        bcc     L97ED
L97FA:  txa
        beq     L97FE
        rts

L97FE:  cpy     $C6
        beq     L9804
        bcs     L9813
L9804:  lda     #$20
        cpy     $C6
        beq     L980F
        sta     ($C4),y
        iny
        bne     L9804
L980F:  sta     ($C4),y
        sta     $A9
L9813:  rts

        ldy     #$28
        ldx     $C6
        cpx     #$28
        bcs     L9804
        ldy     #$00
        beq     L9804
        ldx     #$80
        jsr     L97E5
        lda     #$20
        cpy     $C6
        bcs     L982D
        ldy     $C6
L982D:  cpy     $D5
        beq     L980F
        sta     ($C4),y
        iny
        bne     L982D
        ldy     #$27
        lda     $C6
        cmp     #$28
        bcc     L9840
        ldy     #$4F
L9840:  lda     #$20
L9842:  cpy     $C6
        beq     L980F
        sta     ($C4),y
        dey
        jmp     L9842

        ldx     #$0B
        bne     L9852
        ldx     #$0F
L9852:  pla
        pla
        ldy     #$04
        jsr     L9F99
        jmp     L9730

        tax
        cpy     #$14
        bcs     L9865
        ldy     #$14
        bne     L9884
L9865:  cpy     #$27
        bcs     L986D
        ldy     #$27
        bne     L9884
L986D:  ldy     #$00
        beq     L9884
        tax
        cpx     #$0C
        bcs     L987A
        ldx     #$0C
        bne     L9884
L987A:  cpx     #$18
        bcs     L9882
        ldx     #$18
        bne     L9884
L9882:  ldx     #$00
L9884:  lda     #$01
        sta     $A8
        jmp     L989F

        inx
        pha
        tya
        pha
        txa
        bne     L9898
        jsr     L952B
        jmp     L989B

L9898:  jsr     L953E
L989B:  pla
        tay
        pla
        tax
L989F:  jsr     L9986
        lda     ($C4),y
        sta     $A9
L98A6:  rts

        tax
        pha
        tya
        pha
        dex
        txa
        jsr     L952D
        pla
        tay
        pla
        tax
        asl     $E0,x
        sec
        ror     $E0,x
        jmp     L989F

        tax
        beq     L98A6
        dex
        txa
        pha
        tya
        pha
        asl     $E1,x
        sec
        ror     $E1,x
L98C9:  jsr     L99B7
        txa
        pha
        asl     $E0,x
        lda     $E1,x
        asl     ;a
        ror     $E0,x
        ldx     #$28
L98D7:  ldy     #$28
        lda     ($C4),y
        ldy     #$00
        sta     ($C4),y
        inc     $C4
        bne     L98E5
        inc     $C5
L98E5:  dex
        bne     L98D7
        pla
        tax
        inx
        cpx     #$18
        bne     L98C9
        lda     #$83
        sta     $F8
        ldx     #$27
        lda     #$20
L98F7:  sta     $83C0,x
        dex
        bpl     L98F7
        jmp     L989B

        ldx     #$18
        stx     $039D
        sec
        ror     $039E
        ldx     $039E
        bmi     L9916
        sta     $039D
        sec
        ror     $039E
        rts

L9916:  tax
        pha
        tya
        pha
        lsr     $039E
        cpx     $039D
        bcc     L992B
        lda     $039D
        pha
        stx     $039D
        pla
        tax
L992B:  dex
L992C:  inx
        jsr     L99B7
        lda     #$20
        asl     $E0,x
        sec
        ror     $E0,x
        ldy     #$27
L9939:  sta     ($C4),y
        dey
        bpl     L9939
        cpx     $039D
        bne     L992C
        cpx     #$18
        beq     L994C
        asl     $E1,x
        sec
        ror     $E1,x
L994C:  jmp     L989B

        tax
        beq     L99B6
        pha
        tya
        pha
        lda     $DF,x
        bpl     L996F
        cpx     #$18
        beq     L9961
        lda     $E1,x
        bpl     L996F
L9961:  ldy     $E0,x
        asl     $E0,x
        sec
        ror     $E0,x
        tya
        bpl     L996F
        asl     $E0,x
        lsr     $E0,x
L996F:  jmp     L989B

        lsr     $CD
        bcs     L9978
        inc     $CD
L9978:  rts

        ldx     #$0C
        cpx     $E84C
        bne     L9982
        ldx     #$0E
L9982:  stx     $E84C
        rts

L9986:  lda     $E0,x
        bmi     L9990
        dex
        tya
        clc
        adc     #$28
        tay
L9990:  sty     $C6
        stx     $D8
        lda     #$27
        sta     $D5
        cpx     #$18
        beq     L99A4
        lda     $E1,x
        bmi     L99A4
        lda     #$4F
        sta     $D5
L99A4:  jsr     L99B7
        rts

L99A8:  ldx     $D8
        ldy     $C6
        cpy     #$28
        bcc     L99B6
        tya
        sec
        sbc     #$28
        tay
        inx
L99B6:  rts

L99B7:  lda     $E0,x
        ora     #$80
        sta     $C5
        lda     $E748,x
        sta     $C4
        rts

        inx
        inx
        inx
        inx
        inx
        inx
        inx
        inx
        inx
        txa
        asl     ;a
        tax
        lda     $0388,x
        beq     L99DA
        pha
        inx
        lda     $0388,x
        pha
L99DA:  rts

L99DB:  lda     $03AF
        bmi     L99E3
        jmp     L92E5

L99E3:  lda     $03B0
        bpl     L99EB
        jsr     L94FC
L99EB:  lsr     $03AF
        jsr     L9572
        lda     $03AF
        bmi     L99FD
        sec
        ror     $03AD
        jmp     L92F1

L99FD:  jsr     L94D1
        cpx     #$02
        bne     L9A0A
        jsr     L958B
        jmp     L9A0E

L9A0A:  cpx     #$01
        bne     L9A11
L9A0E:  jsr     L9320
L9A11:  jmp     L916C

        ldy     #$03
        bne     L9A1A
        ldy     #$00
L9A1A:  lda     $037D
        bne     L9A22
        sty     $0380
L9A22:  lda     $0384
        bpl     L99DA
        jsr     L9E29
        jsr     L9E87
        lda     $97
        sta     $53
        jmp     L9AEF

L9A34:  lda     $97
        cmp     $53
        bne     L9A53
        ldx     #$00
        ldy     $97
        iny
        bne     L9A56
        lda     $98
        bne     L9A56
        ldy     $97
        iny
        bne     L9A56
        stx     $037D
        jsr     L9E79
        jmp     L9CCA

L9A53:  tax
        sta     $53
L9A56:  cpx     #$06
        bne     L9A5D
        jmp     L9B0B

L9A5D:  lda     $037D
        beq     L9A63
        tax
L9A63:  ldy     #$A0
        lda     $0380
        cmp     #$03
        bcs     L9A82
        cpx     #$37
        bne     L9A78
        lda     #$80
        eor     $037F
        sta     $037F
L9A78:  lda     $037F
        beq     L9A7F
        ldy     #$92
L9A7F:  sty     $8000
L9A82:  ldy     $0380
        cpy     #$06
        beq     L9AD3
        lda     $E6F7,x
        cmp     #$30
        bcc     L9AA1
        cmp     #$3A
        bcs     L9AA1
        sec
        sbc     #$30
        cmp     $0381
        beq     L9A9E
        bcs     L9AD3
L9A9E:  sta     $037E
L9AA1:  cpy     #$03
        bcs     L9AB5
        lda     $037E
        cmp     $0381
        bcc     L9AB5
        lda     $0381
        beq     L9AB5
        dec     $037E
L9AB5:  lda     $037E
        clc
        adc     #$B0
        cmp     #$B9
        bne     L9AD0
        lda     $0381
        cmp     #$0A
        sec
        bne     L9ACD
        lda     $8F
        ror     ;a
        ror     ;a
        ror     ;a
        ror     ;a
L9ACD:  lda     #$72
        ror     ;a
L9AD0:  sta     $8001
L9AD3:  cpx     #$41
        beq     L9AE5
        ldy     #$00
        cpx     #$49
        beq     L9AEC
        ldy     #$03
        cpx     #$42
        beq     L9AEC
        bne     L9AF5
L9AE5:  iny
        cpy     #$07
        bne     L9AEC
        ldy     #$00
L9AEC:  sty     $0380
L9AEF:  ldx     $0380
        jsr     L9DBB
L9AF5:  lda     $0380
        cmp     #$05
        bne     L9B08
        ldx     #$F0
        lda     $037D
        beq     L9B05
        ldx     #$FD
L9B05:  stx     $8000
L9B08:  jmp     L9A34

L9B0B:  jsr     L9E79
        jsr     L99A8
        lda     $0380
        cmp     #$05
        bne     L9B58
        lsr     $037D
        bcs     L9B29
        inc     $037D
        sty     $037B
        stx     $037A
        jmp     L9CCA

L9B29:  lda     #$07
        cpy     $037B
        bcc     L9B37
        lda     #$08
        cpx     $037A
        bcs     L9B47
L9B37:  tax
        jsr     L9DBB
L9B3B:  lda     $97
        cmp     #$41
        bne     L9B3B
        jsr     L9E79
        jmp     L9CCA

L9B47:  sty     $4C
        stx     $4A
        lda     $037B
        sta     $4B
        lda     $037A
        sta     $49
        jmp     L9B76

L9B58:  ldy     #$00
        cmp     #$04
        bne     L9B63
        stx     $4A
        jmp     L9B6E

L9B63:  cmp     #$03
        beq     L9B6A
        jmp     L9CD7

L9B6A:  lda     #$18
        sta     $4A
L9B6E:  sty     $4B
        sty     $49
        lda     #$27
        sta     $4C
L9B76:  jsr     L9E45
        lda     #$00
        sta     $4E
        lda     #$19
        sta     $4D
        jsr     L9DE1
L9B84:  jsr     L9DEE
        tya
        bpl     L9B84
        lda     $037E
        asl     ;a
        tay
        iny
        sty     $5C
        lda     ($01),y
        sta     $56
        iny
        lda     ($01),y
        sta     $57
        lda     $4E
        cmp     $57
        bcc     L9C13
        bne     L9BA9
        lda     $4D
        cmp     $56
        bcc     L9C13
L9BA9:  lda     $4D
        sec
        sbc     $56
        sta     $5A
        lda     $4E
        sbc     $57
        sta     $5B
        lda     $58
        sta     $54
        lda     $59
        sta     $55
        sec
        lda     $54
        sbc     $5A
        sta     $56
        lda     $55
        sbc     $5B
        sta     $57
        cmp     $2B
        bcc     L9BD7
        bne     L9BDC
        lda     $56
        cmp     $2A
        bcs     L9BDC
L9BD7:  lda     #$09
        jmp     L9B37

L9BDC:  jsr     L9E52
        ldy     #$01
L9BE1:  lda     ($54),y
        sta     ($56),y
        inc     $54
        bne     L9BEB
        inc     $55
L9BEB:  inc     $56
        bne     L9BF1
        inc     $57
L9BF1:  lda     $55
        cmp     $59
        bcc     L9BE1
        bne     L9BFF
        lda     $54
        cmp     $58
        bcc     L9BE1
L9BFF:  sec
        lda     $34
        sbc     $5A
        sta     $34
        sta     $30
        lda     $35
        sbc     $5B
        sta     $35
        sta     $31
        jmp     L9C6D

L9C13:  sec
        lda     $56
        sbc     $4D
        sta     $5A
        lda     $57
        sbc     $4E
        sta     $5B
        lda     $58
        sta     $54
        lda     $59
        sta     $55
        jsr     L9E52
        clc
        lda     $58
        adc     $5A
        sta     $56
        lda     $59
        adc     $5B
        sta     $57
        ldy     #$00
L9C3A:  lda     ($58),y
        sta     ($56),y
        lda     $56
        bne     L9C44
        dec     $57
L9C44:  dec     $56
        lda     $58
        bne     L9C4C
        dec     $59
L9C4C:  dec     $58
        lda     $55
        cmp     $59
        bcc     L9C3A
        bne     L9C5C
        lda     $54
        cmp     $58
        bcc     L9C3A
L9C5C:  clc
        lda     $34
        adc     $5A
        sta     $34
        sta     $30
        lda     $35
        adc     $5B
        sta     $35
        sta     $31
L9C6D:  ldy     $5C
        lda     $4D
        sta     ($01),y
        iny
        lda     $4E
        sta     ($01),y
        jsr     L9DE1
        jsr     L9E52
        lda     $58
        sta     $4D
        lda     $59
        sta     $4E
        ldy     #$00
        ldx     #$00
L9C8A:  inc     $4D
        bne     L9C90
        inc     $4E
L9C90:  lda     $E0,x
        sta     ($4D),y
        inx
        cpx     #$19
        bne     L9C8A
L9C99:  jsr     L9DEE
        tya
        bmi     L9CA8
        lda     ($4F),y
        ldy     #$00
        sta     ($4D),y
        jmp     L9C99

L9CA8:  jsr     L9DA1
        ldx     #$03
L9CAD:  lda     $49,x
        sta     ($01),y
        iny
        dex
        bpl     L9CAD
        lda     $0381
        jmp     L9CBE

        jmp     L9138

L9CBE:  cmp     #$0A
        beq     L9CCA
        cmp     $037E
        bne     L9CCA
        inc     $0381
L9CCA:  ldy     #$49
L9CCC:  lda     ($01),y
        sta     $00,y
        iny
        cpy     #$5D
        bne     L9CCC
        rts

L9CD7:  cmp     #$06
        bne     L9CEF
        lsr     $0384
        lda     $0383
        sta     $34
        sta     $30
        lda     $0382
        sta     $35
        sta     $31
L9CEC:  jmp     L9CCA

L9CEF:  sta     $5C
        lda     $0381
        beq     L9CEC
        jsr     L9DA1
        jsr     L9DB0
        jsr     L9E52
        lda     $0378
        bne     L9D0E
        lda     $4B
        bne     L9D3D
        lda     $4C
        cmp     #$27
        bne     L9D3D
L9D0E:  ldy     #$00
L9D10:  iny
        dey
        cpy     $49
        bcs     L9D19
        iny
        bne     L9D10
L9D19:  cpy     $4A
        beq     L9D1F
        bcs     L9D3D
L9D1F:  iny
        lda     $DF,y
        pha
        ora     #$80
        ldx     $5C
        cpx     #$02
        beq     L9D2E
        lda     ($58),y
L9D2E:  sta     $DF,y
        pla
        cpx     #$01
        bne     L9D10
        sta     ($58),y
        jmp     L9D10

        ldy     #$02
L9D3D:  ldx     $49
        beq     L9D4D
        lda     $DF,x
        bmi     L9D4D
        lda     $E0,x
        bmi     L9D4D
        ora     #$80
        sta     $E0,x
L9D4D:  ldx     $4A
        cpx     #$18
        beq     L9D5F
        lda     $E1,x
        bmi     L9D5F
        lda     $E0,x
        bmi     L9D5F
        ora     #$80
        sta     $E0,x
L9D5F:  clc
        lda     $58
        adc     #$19
        sta     $4D
        lda     $59
        adc     #$00
        sta     $4E
        jsr     L9DE1
L9D6F:  jsr     L9DEE
        tya
        bpl     L9D7E
        jsr     L99A8
        jsr     L9986
        jmp     L9CCA

L9D7E:  lda     ($4F),y
        pha
        lda     $0379
        ldx     $5C
        cpx     #$02
        beq     L9D8E
        ldx     #$00
        lda     ($4D,x)
L9D8E:  eor     $037F
        sta     ($4F),y
        pla
        ldx     $5C
        cpx     #$01
        bne     L9D6F
        ldx     #$00
        !byte   $81
L9D9D:  eor     $6F4C
        !byte   $9D
L9DA1:  ldx     $037E
        lda     #$11
L9DA6:  clc
        adc     #$04
        dex
        bpl     L9DA6
        tay
        rts

        ldy     #$03
L9DB0:  ldx     #$03
L9DB2:  lda     ($01),y
        sta     $49,x
        iny
        dex
        bpl     L9DB2
        rts

L9DBB:  ldy     #$0B
        lda     #$A0
L9DBF:  sta     $8000,y
        dey
        bpl     L9DBF
        ldy     #$FF
L9DC7:  dex
L9DC8:  iny
        lda     table_2,y
        bpl     L9DC8
        cpx     #$80
        bcc     L9DC7
        ldx     #$00
L9DD4:  ora     #$80
        sta     $8003,x
        iny
        inx
        lda     table_2,y
        bpl     L9DD4
        rts

L9DE1:  lda     #$80
        sta     $50
        lda     #$00
        sta     $51
        sta     $52
        sta     $4F
        rts

L9DEE:  ldy     #$80
        lda     $51
        cmp     $4A
        beq     L9DF8
        bcs     L9E28
L9DF8:  cmp     $49
        bcs     L9E0F
L9DFC:  inc     $51
        lda     #$00
        sta     $52
        clc
        lda     $4F
        adc     #$28
        sta     $4F
        bcc     L9DEE
        inc     $50
        bne     L9DEE
L9E0F:  lda     $52
        cmp     $4B
        bcs     L9E19
        inc     $52
        bne     L9E0F
L9E19:  tay
        cmp     $4C
        beq     L9E20
        bcs     L9DFC
L9E20:  inc     $52
        inc     $4D
        bne     L9E28
        inc     $4E
L9E28:  rts

L9E29:  sec
        lda     $0383
        sbc     #$5D
        sta     $01
        lda     $0382
        sbc     #$00
        sta     $02
        ldy     #$49
L9E3A:  lda     $00,y
        sta     ($01),y
        iny
        cpy     #$5D
        bne     L9E3A
        rts

L9E45:  ldx     $0381
        cpx     #$0A
        bne     L9E55
        dex
        bne     L9E55
        lda     $C188
L9E52:  ldx     $037E
L9E55:  txa
        asl     ;a
        adc     #$03
        sta     $53
        ldy     #$01
        lda     $01
        sta     $58
        lda     $02
        sta     $59
L9E65:  sec
        lda     $58
        sbc     ($01),y
        sta     $58
        iny
        lda     $59
        sbc     ($01),y
        sta     $59
        iny
        cpy     $53
        bne     L9E65
        rts

L9E79:  ldy     #$3D
        ldx     #$0B
L9E7D:  lda     ($01),y
        sta     $8000,x
        iny
        dex
        bpl     L9E7D
        rts

L9E87:  ldy     #$3D
        ldx     #$0B
L9E8B:  lda     $8000,x
        sta     ($01),y
        iny
        dex
        bpl     L9E8B
        rts

L9E95:  lda     $0384
        bmi     L9ED6
        sec
        lda     $34
        sta     $0383
        sbc     #$5D
        tax
        lda     $35
        sta     $0382
        sbc     #$00
        tay
        cpy     $2B
        beq     L9ED6
        bcc     L9ED6
        sec
        ror     $0384
        sty     $31
        stx     $30
        sty     $35
        sty     $02
        stx     $34
        stx     $01
        lda     #$20
        sta     $0379
        lda     #$00
        tay
        sta     $037E
        sta     $0381
L9ECF:  sta     ($01),y
        iny
        cpy     #$49
        bne     L9ECF
L9ED6:  rts

L9ED7:  ldx     $97
        inx
        bne     L9ED7
L9EDC:  lda     $97
        cmp     #$FF
        beq     L9EDC
        cmp     #$28
        bne     L9EE9
        jmp     L95AC

L9EE9:  cmp     #$37
        bne     L9EF0
        jmp     L95AD

L9EF0:  cmp     #$41
        bne     L9EF7
        jmp     L9E95

L9EF7:  cmp     #$08
        bne     L9F06
        lda     $0384
        bmi     L9F06
        jsr     L90E9
        jsr     L9127
L9F06:  pla
        pla
        jmp     L9729

        lsr     $039E
        rts

        ldy     $AE
        lda     #$FF
        tax
        sta     $0251,y
        lda     #$00
        sta     $0F
        lda     #$60
        sta     $0265,y
        inc     $AE
        lda     #$04
        sta     $025B,y
        jsr     LFFC9
        lda     #$80
        sta     $10
L9F2E:  lda     #$91
        ldy     #$0C
        ldx     #$62
        cpy     $E84C
        beq     L9F3D
        lda     #$11
        ldx     #$E2
L9F3D:  stx     $FD
        jsr     LF232
        ldy     #$00
L9F44:  lda     ($0F),y
        tax
        eor     #$FF
        asl     ;a
        lda     #$24
        ror     ;a
        jsr     LF232
        txa
        and     #$7F
        cmp     #$20
        bcc     L9F61
        cmp     #$40
        bcc     L9F64
        cmp     #$60
        bcs     L9F61
        adc     #$40
L9F61:  clc
        adc     #$40
L9F64:  cmp     #$22
        bne     L9F6A
        lda     $FD
L9F6A:  jsr     LF232
        iny
        cpy     #$28
        bne     L9F44
        lda     #$0D
        jsr     LF232
        lda     #$0A
        jsr     LF232
        ldy     $97
        cpy     #$06
        beq     L9F91
        clc
        lda     $0F
        adc     #$28
        sta     $0F
        bcc     L9F8D
        inc     $10
L9F8D:  cmp     #$E8
        bne     L9F2E
L9F91:  jsr     LFFCC
        dec     $AE
        jmp     L9F06

L9F99:  sei
        sty     $9E
L9F9C:  lda     table_4,x
        sta     $026E,y
        dex
        dey
        bne     L9F9C
        sty     $CD
        cli
        rts

L9FAA:  dec     $E810
        ldy     $E812
        inc     $E810
        rts

L9FB4:  jsr     LE229
        ldx     #$23
        ldy     #$61
L9FBB:  cpy     #$47
        bne     L9FC1
        ldy     #$09
L9FC1:  lda     banner,x
        sta     $814F,y
        dex
        dey
        bpl     L9FBB
L9FCB:  ldx     $97
        cpx     #$06
        bne     L9FCB
        jmp     LE229

banner:
    ;"  keychip (c) wirt microsystems 1981" in screen codes
    !byte $20,$20,$0b,$05,$19,$03,$08,$09,$10,$20,$28,$03,$29,$20,$17,$09
    !byte $12,$14,$20,$0D,$09,$03,$12,$0F,$13,$19,$13,$14,$05,$0D,$13,$20
    !byte $31,$39,$38,$31
filler:
    !byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
