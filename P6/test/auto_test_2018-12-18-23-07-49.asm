li $sp, 0x2ffc
li $s0, 2
li $s1, -2
li $s2, 5
li $s3, -7
li $s4, -6
la $t0, label71
la $t1, label136
la $t2, label200
la $t3, label241
la $t4, label273
la $t5, label324
la $t6, label398
la $t7, label429
la $t8, label456
la $t9, label500
label0: mtlo $s1
label1: nor $s5, $0, $s4
label2: slt $s1, $s1, $s5
label3: lbu $s1, 2($0)
label4: blez $s5, label13
label5: lui $0, 53
label6: slti $s5, $s2, 4
label7: sltiu $s2, $0, -4
label8: lb $s4, 1($0)
label9: jr $t0
label10: mthi $s2
label11: sltiu $s5, $0, -3
label12: xor $s5, $s5, $s4
label13: lw $s2, 4($0)
label14: sltu $s4, $s5, $s2
label15: sw $s4, 8($0)
label16: subu $s4, $s3, $s3
label17: subu $0, $0, $s1
label18: lb $s3, 3($0)
label19: lui $s3, 2
label20: lh $s3, 10($0)
label21: xor $s1, $0, $s2
label22: sltu $s1, $s1, $s2
label23: multu $s3, $s1
label24: blez $0, label33
label25: and $s2, $s3, $s2
label26: blez $s3, label32
label27: or $s5, $s2, $s5
label28: beq $s5, $s5, label34
label29: mult $s2, $s5
label30: xori $s2, $0, 2
label31: slti $0, $s2, 6
label32: nor $s1, $s3, $s5
label33: srl $s2, $s2, 30
label34: sll $0, $s1, 23
label35: mult $s5, $s5
label36: sw $s3, 4($0)
label37: mthi $s4
label38: lhu $s4, 8($0)
label39: srav $0, $s5, $s4
label40: lb $s4, 6($0)
label41: beq $s1, $s4, label43
label42: srav $s5, $s5, $s1
label43: andi $s4, $s5, 8
label44: subu $s1, $s4, $s4
label45: subu $s1, $s1, $s4
label46: xor $s5, $s4, $s2
label47: sllv $s2, $s4, $s2
label48: lhu $s2, 10($0)
label49: srlv $s5, $0, $s3
label50: addu $s1, $s5, $s1
label51: mfhi $s1
label52: bgtz $s5, label61
label53: sltu $s5, $s2, $s5
label54: xor $s3, $0, $s1
label55: beq $s2, $s3, label65
label56: mfhi $s5
label57: jalr $s4, $t1
label58: multu $s5, $s1
label59: mthi $s2
label60: divu $s1, $s1
label61: subu $s4, $s1, $s4
label62: nor $s1, $s2, $s2
label63: bgtz $s5, label64
label64: or $s2, $s3, $s3
label65: bgtz $s1, label71
label66: div $s3, $s1
label67: lbu $s5, 4($0)
label68: sltu $s4, $s5, $s2
label69: divu $s3, $s1
label70: sb $s2, 5($0)
label71: sllv $s5, $s5, $0
label72: mflo $s3
label73: sw $0, 8($0)
label74: sh $s5, 0($0)
label75: addiu $s1, $0, -8
label76: mthi $s4
label77: bgtz $s1, label80
label78: divu $s2, $0
label79: andi $0, $s5, -3
label80: divu $s5, $s2
label81: addu $0, $s2, $s2
label82: divu $s2, $s3
label83: nor $s1, $s5, $s4
label84: srlv $s2, $s1, $s5
label85: jr $t1
label86: sllv $s1, $s3, $s1
label87: jr $t1
label88: lbu $s1, 7($0)
label89: lh $s4, 0($0)
label90: sh $s5, 6($0)
label91: addiu $s3, $s2, 6
label92: srl $s3, $s3, 1
label93: andi $s5, $0, -4
label94: slti $s3, $s2, -8
label95: sltu $0, $s4, $s4
label96: ori $s2, $0, 2
label97: addiu $0, $s3, -8
label98: div $s2, $s1
label99: sllv $s5, $s2, $s3
label100: sw $s2, 8($0)
label101: sltu $s2, $s5, $0
label102: srl $s1, $0, 24
label103: jalr $0, $t2
label104: lui $s5, 97
label105: bgtz $s4, label108
label106: sb $0, 10($0)
label107: beq $s1, $s1, label109
label108: srav $s5, $s1, $s1
label109: multu $s4, $s1
label110: sll $s4, $s4, 10
label111: lui $s5, 49
label112: sra $s2, $s4, 13
label113: xor $s3, $s2, $s2
label114: lb $s3, 7($0)
label115: sb $s3, 2($0)
label116: slt $s5, $s5, $s5
label117: sw $s4, 8($0)
label118: slt $0, $s3, $s1
label119: and $s1, $s2, $s2
label120: xori $s5, $s1, 6
label121: div $s2, $s1
label122: addiu $s3, $s3, -3
label123: sltu $s3, $s5, $s5
label124: mthi $s4
label125: lhu $0, 0($0)
label126: bgtz $s3, label136
label127: slt $s5, $s5, $0
label128: sltiu $s1, $s1, 6
label129: divu $s3, $s5
label130: bltz $s3, label134
label131: xori $s1, $s3, 6
label132: bgtz $s1, label134
label133: andi $s4, $0, -10
label134: slt $s2, $s2, $s2
label135: bgtz $s1, label142
label136: mult $s3, $s3
label137: mult $s4, $s1
label138: bltz $s1, label145
label139: srav $s2, $s2, $0
label140: mult $s3, $s1
label141: sw $s5, 0($0)
label142: lhu $s3, 10($0)
label143: bltz $s3, label144
label144: subu $s4, $s1, $s5
label145: beq $s1, $0, label146
label146: divu $s3, $s3
label147: bne $0, $s3, label153
label148: andi $s3, $s4, 10
label149: sll $0, $0, 2
label150: sw $0, 0($0)
label151: addiu $s3, $s1, 4
label152: slti $s4, $s1, -7
label153: xor $0, $s1, $s5
label154: bltz $s3, label155
label155: or $s3, $s1, $s5
label156: bne $s4, $s2, label166
label157: lw $0, 4($0)
label158: srl $s2, $s2, 6
label159: ori $s5, $0, 7
label160: bgez $0, label168
label161: mult $s3, $s4
label162: sra $s3, $s1, 23
label163: beq $s3, $s1, label169
label164: slti $s2, $s1, 6
label165: jal label170
label166: lw $s4, 0($0)
label167: addiu $s3, $s5, -7
label168: lh $s3, 4($0)
label169: sb $s1, 3($0)
label170: andi $s5, $s3, 7
label171: jr $t3
label172: sh $s2, 2($0)
label173: mult $s3, $s5
label174: lb $s4, 3($0)
label175: divu $s4, $0
label176: mflo $0
label177: sw $s4, 0($0)
label178: and $s3, $0, $s5
label179: sll $0, $s4, 22
label180: sllv $0, $s2, $0
label181: sll $s2, $s4, 9
label182: sltiu $s2, $s3, -9
label183: sra $s5, $s3, 27
label184: sltiu $s3, $s2, 7
label185: mthi $s1
label186: multu $s1, $0
label187: mthi $s3
label188: srl $s4, $0, 10
label189: blez $s4, label198
label190: lh $0, 4($0)
label191: mflo $s3
label192: xor $s3, $s1, $s3
label193: ori $s4, $0, 9
label194: lhu $s3, 4($0)
label195: lh $s2, 6($0)
label196: mthi $s5
label197: addu $s1, $s2, $s3
label198: andi $0, $s2, 6
label199: divu $s4, $0
label200: xor $s2, $s3, $s2
label201: nor $0, $s5, $s5
label202: jalr $s4, $t4
label203: mult $0, $0
label204: and $s5, $s5, $s1
label205: mult $s5, $s5
label206: sh $0, 0($0)
label207: srl $s4, $0, 5
label208: srlv $s5, $0, $s2
label209: div $s5, $s5
label210: bgez $0, label216
label211: mult $s1, $s2
label212: jr $t4
label213: sll $s4, $s4, 8
label214: mult $s4, $s1
label215: beq $s3, $s1, label224
label216: lw $s5, 0($0)
label217: multu $0, $s1
label218: nor $s1, $s5, $s1
label219: andi $0, $s2, 9
label220: jr $t4
label221: lui $s3, 250
label222: srl $s4, $0, 18
label223: multu $s1, $s1
label224: or $s5, $s4, $s3
label225: addiu $s1, $s2, -6
label226: bgez $s5, label234
label227: mflo $s2
label228: mthi $s4
label229: jal label238
label230: slt $s1, $s4, $s5
label231: lui $s4, 182
label232: xor $s5, $s2, $s1
label233: lui $0, 167
label234: sra $s1, $s5, 0
label235: mfhi $0
label236: slti $s4, $s3, 1
label237: and $s3, $0, $s4
label238: nor $0, $s3, $s3
label239: or $s3, $s1, $s2
label240: lui $0, 190
label241: jalr $0, $t4
label242: srl $s4, $s5, 4
label243: nor $s2, $s1, $0
label244: srav $0, $s1, $0
label245: divu $s3, $s3
label246: sb $0, 9($0)
label247: div $0, $s3
label248: mflo $0
label249: and $s5, $s3, $s4
label250: mult $s2, $s5
label251: or $s3, $s2, $s3
label252: sw $s1, 0($0)
label253: mtlo $s4
label254: sra $s3, $s1, 24
label255: sltu $s2, $s3, $0
label256: srlv $s3, $s5, $s3
label257: slt $s1, $s2, $s2
label258: beq $s3, $0, label261
label259: mult $s3, $s5
label260: srl $s4, $0, 11
label261: jal label262
label262: srlv $s5, $s2, $0
label263: sll $s1, $0, 25
label264: div $s3, $s3
label265: sll $s4, $s1, 21
label266: or $s1, $s1, $0
label267: srl $s4, $s3, 17
label268: or $s1, $s4, $s1
label269: ori $0, $s3, 6
label270: sll $s4, $s3, 17
label271: bgez $s4, label281
label272: sllv $s4, $s5, $s4
label273: lw $s2, 4($0)
label274: mult $s4, $s1
label275: mflo $s5
label276: slt $s1, $s4, $s5
label277: jalr $s3, $t5
label278: srlv $s5, $0, $s2
label279: divu $s2, $s4
label280: srav $s3, $s4, $s3
label281: divu $s2, $s3
label282: slt $s1, $s3, $s3
label283: sw $s4, 4($0)
label284: beq $s3, $s4, label289
label285: and $0, $s2, $s1
label286: jal label288
label287: mflo $s2
label288: slt $0, $s4, $0
label289: jal label293
label290: lb $s5, 2($0)
label291: divu $s1, $s3
label292: lui $0, 135
label293: srl $s5, $0, 0
label294: xor $s2, $s1, $s5
label295: mtlo $s3
label296: divu $s2, $s3
label297: sh $s3, 4($0)
label298: bne $s4, $s1, label300
label299: sltu $s5, $0, $s1
label300: xori $s1, $0, 4
label301: srlv $s5, $0, $s1
label302: multu $0, $s2
label303: srav $s3, $0, $s3
label304: bltz $0, label310
label305: subu $s5, $0, $s1
label306: multu $s3, $s3
label307: srav $s5, $s4, $s1
label308: srl $s3, $s4, 15
label309: andi $s5, $s1, 3
label310: lb $s4, 2($0)
label311: sh $s2, 2($0)
label312: sll $s5, $s5, 21
label313: sw $s5, 0($0)
label314: j label319
label315: sw $s1, 4($0)
label316: nor $s4, $s3, $s4
label317: subu $s1, $s4, $s4
label318: mult $s4, $s4
label319: nor $s1, $s2, $s2
label320: jr $t6
label321: lw $s3, 4($0)
label322: subu $s1, $s2, $s5
label323: jr $t6
label324: xor $s4, $s5, $s1
label325: sh $s2, 4($0)
label326: sb $s1, 4($0)
label327: ori $s5, $s3, 8
label328: xori $s1, $s1, 5
label329: lhu $s1, 4($0)
label330: subu $s5, $s2, $s2
label331: addu $s2, $0, $0
label332: divu $s1, $0
label333: lh $s5, 8($0)
label334: nor $0, $s1, $s5
label335: srav $s2, $0, $s1
label336: lui $0, 240
label337: mtlo $s5
label338: bltz $s4, label343
label339: lhu $0, 10($0)
label340: ori $0, $0, 5
label341: sll $s2, $s2, 20
label342: lhu $s2, 2($0)
label343: sra $s5, $s1, 27
label344: sh $s3, 10($0)
label345: sltiu $s2, $s4, -3
label346: mult $s3, $s1
label347: sll $s3, $s3, 13
label348: mtlo $s5
label349: lb $s4, 0($0)
label350: srl $0, $s2, 10
label351: srlv $0, $s5, $s1
label352: j label360
label353: mtlo $s4
label354: mflo $s2
label355: srl $s3, $0, 18
label356: lui $0, 60
label357: sh $s4, 10($0)
label358: andi $s3, $s3, 5
label359: srl $0, $s5, 9
label360: and $s1, $s5, $s2
label361: bgez $s4, label367
label362: lh $s2, 0($0)
label363: lw $s4, 8($0)
label364: sllv $s2, $s2, $s2
label365: bgez $0, label375
label366: slt $s2, $s3, $s4
label367: ori $s2, $s2, 8
label368: mult $s3, $s5
label369: bne $s5, $s3, label371
label370: lbu $s3, 6($0)
label371: sra $0, $s1, 14
label372: mflo $0
label373: slti $0, $s3, -10
label374: srav $s1, $s1, $s4
label375: jalr $s3, $t7
label376: slti $s3, $s3, -7
label377: sllv $s1, $s5, $s1
label378: divu $s2, $s3
label379: sb $s1, 9($0)
label380: nor $s2, $s3, $s3
label381: lw $s3, 4($0)
label382: lhu $s2, 6($0)
label383: jal label384
label384: xori $s2, $0, 4
label385: sllv $s1, $s5, $s5
label386: divu $s3, $s2
label387: srlv $s3, $s1, $s4
label388: lhu $s2, 2($0)
label389: mtlo $0
label390: srav $s3, $s2, $0
label391: sll $s5, $0, 18
label392: jalr $s5, $t7
label393: subu $s2, $0, $s4
label394: slt $s3, $s3, $0
label395: slt $s2, $s3, $s2
label396: lui $s5, 77
label397: addu $s5, $s5, $s3
label398: bltz $s4, label403
label399: srlv $s2, $s3, $s5
label400: jalr $s3, $t8
label401: srl $s2, $s1, 12
label402: mult $s4, $s5
label403: xori $s3, $s2, 2
label404: addiu $s2, $s1, 0
label405: sltiu $s2, $s4, -8
label406: addu $0, $s1, $s4
label407: nor $s2, $s5, $s2
label408: jalr $s1, $t8
label409: lui $s5, 78
label410: jal label420
label411: ori $0, $s3, 8
label412: sllv $s1, $s1, $s1
label413: bgtz $s4, label422
label414: or $s1, $0, $s5
label415: lw $s1, 8($0)
label416: lbu $s4, 7($0)
label417: lw $s4, 4($0)
label418: xori $s2, $s3, 8
label419: srav $s5, $s5, $s5
label420: sra $s2, $s5, 31
label421: lb $s1, 1($0)
label422: srlv $s4, $s4, $s1
label423: slti $s3, $s4, 4
label424: addu $s4, $0, $s1
label425: andi $0, $0, 4
label426: addu $s2, $s4, $s1
label427: sra $s2, $s3, 14
label428: blez $0, label436
label429: addu $0, $s2, $s4
label430: multu $0, $0
label431: lhu $s2, 6($0)
label432: divu $s5, $s3
label433: divu $s3, $s5
label434: sltiu $s5, $0, 0
label435: lb $s5, 2($0)
label436: lb $s4, 2($0)
label437: sllv $s3, $s4, $s1
label438: sllv $s1, $s1, $s2
label439: bltz $s5, label444
label440: srlv $s5, $s2, $s1
label441: div $0, $s2
label442: or $s4, $s3, $s4
label443: bgez $s2, label451
label444: lbu $s1, 0($0)
label445: ori $s3, $s1, 3
label446: sw $0, 8($0)
label447: bltz $s5, label449
label448: srav $0, $s5, $s5
label449: nor $s1, $s1, $s1
label450: and $s3, $s5, $s3
label451: bgez $s1, label454
label452: addiu $s5, $s3, -2
label453: sw $s5, 4($0)
label454: slt $s5, $s3, $s3
label455: andi $s4, $s5, -2
label456: slti $s4, $s1, 9
label457: bne $s2, $s4, label461
label458: sll $s4, $s2, 15
label459: addu $s5, $s3, $s2
label460: sw $s3, 4($0)
label461: addiu $s5, $0, 9
label462: subu $s1, $s5, $s1
label463: sra $s3, $s2, 18
label464: and $s2, $s5, $s4
label465: mult $0, $0
label466: ori $0, $s3, 3
label467: srlv $s3, $s5, $s5
label468: sltu $s2, $0, $0
label469: div $0, $s2
label470: jr $t9
label471: nor $s4, $0, $s4
label472: bltz $s5, label473
label473: sltiu $s1, $s1, 2
label474: sh $s5, 0($0)
label475: mthi $s3
label476: slt $s5, $0, $0
label477: ori $s1, $s5, 3
label478: mult $s3, $s4
label479: sltu $s4, $s2, $s1
label480: lbu $s1, 1($0)
label481: and $s4, $s3, $s1
label482: bne $s3, $s2, label483
label483: mfhi $s4
label484: xori $0, $s4, 8
label485: sll $s1, $s2, 17
label486: slti $0, $s4, 9
label487: slt $s4, $s1, $s2
label488: sh $0, 6($0)
label489: sh $0, 6($0)
label490: sltu $0, $0, $s3
label491: addiu $s2, $s1, 9
label492: beq $s1, $s4, label497
label493: sltiu $s5, $s2, -10
label494: jalr $0, $t9
label495: divu $s2, $s1
label496: multu $s2, $s1
label497: slt $s5, $s2, $s3
label498: lb $s2, 10($0)
label499: addiu $0, $s4, 3
label500:
