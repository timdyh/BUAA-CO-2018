li $s0, 0
li $s1, 3
li $s2, -3
li $s3, 0
li $s4, -2
la $t0, label70
la $t1, label114
la $t2, label150
la $t3, label235
la $t4, label289
la $t5, label345
la $t6, label390
la $t7, label448
la $t8, label457
la $t9, label500
label0: addi $s2, $s5, 8
label1: mtlo $s1
label2: lb $s4, 10($0)
label3: xor $s1, $0, $s4
label4: sll $0, $s4, 5
label5: slti $s2, $s3, -3
label6: jal label10
label7: slti $0, $s2, 3
label8: sll $s2, $s2, 11
label9: bgez $s1, label12
label10: mult $s1, $s1
label11: jal label20
label12: xor $s4, $s2, $s3
label13: addiu $s5, $s5, 1
label14: sllv $s3, $s3, $s4
label15: jalr $s4, $t0
label16: slti $s4, $s3, 6
label17: beq $0, $s3, label24
label18: addu $s2, $s5, $0
label19: sltu $s2, $0, $s4
label20: mflo $0
label21: jr $t0
label22: srl $s2, $s4, 15
label23: ori $s1, $s3, 2
label24: add $0, $s2, $s3
label25: bgez $s2, label32
label26: lb $s5, 5($0)
label27: jr $t0
label28: lbu $0, 6($0)
label29: xor $s3, $s2, $s1
label30: multu $s5, $0
label31: sb $s5, 5($0)
label32: addu $0, $s5, $s1
label33: bne $s1, $s5, label42
label34: and $s1, $s1, $s1
label35: sb $s3, 5($0)
label36: bgtz $0, label43
label37: mflo $s5
label38: sltiu $s5, $s4, -9
label39: jalr $0, $t0
label40: slt $s4, $s5, $0
label41: srlv $s2, $0, $s4
label42: sh $0, 6($0)
label43: mthi $s3
label44: nor $0, $s3, $s3
label45: addi $0, $s5, -8
label46: slti $s4, $s4, -10
label47: slti $s3, $s2, -4
label48: ori $s5, $s5, 6
label49: srlv $s1, $s3, $s4
label50: andi $s5, $s4, -3
label51: bltz $s3, label56
label52: xori $s3, $s2, 0
label53: jalr $s1, $t1
label54: subu $s2, $s2, $s5
label55: mult $s3, $s3
label56: jalr $s2, $t1
label57: sub $s2, $s3, $s1
label58: bne $0, $s2, label68
label59: slt $0, $s4, $s1
label60: sltiu $s3, $s1, -2
label61: addi $0, $s1, -10
label62: sll $s3, $0, 17
label63: sw $s3, 8($0)
label64: sh $s3, 8($0)
label65: or $s1, $s1, $s1
label66: bltz $s2, label73
label67: sb $s1, 3($0)
label68: add $0, $s3, $s4
label69: or $s1, $s1, $s5
label70: mtlo $s3
label71: blez $s1, label73
label72: mtlo $s5
label73: sw $s1, 0($0)
label74: sltu $s2, $s1, $s4
label75: j label77
label76: add $0, $s2, $0
label77: mtlo $s2
label78: lui $s3, 153
label79: bgez $s5, label86
label80: sb $s2, 9($0)
label81: lw $s3, 0($0)
label82: lb $s2, 7($0)
label83: sw $s1, 0($0)
label84: sra $s4, $0, 11
label85: mflo $s4
label86: mult $0, $s3
label87: lui $s3, 28
label88: bgez $s4, label91
label89: add $s5, $s4, $s3
label90: srav $s3, $s1, $s1
label91: subu $0, $0, $0
label92: lhu $s3, 2($0)
label93: srlv $s2, $s3, $s3
label94: lw $s4, 4($0)
label95: sub $s5, $0, $s3
label96: sllv $s5, $s1, $s5
label97: mfhi $s2
label98: subu $s1, $s1, $s4
label99: mtlo $s1
label100: add $s3, $s4, $s3
label101: bltz $s2, label111
label102: sllv $s1, $s2, $s2
label103: subu $0, $s1, $s3
label104: lui $s3, 165
label105: slti $s1, $s4, -5
label106: beq $s2, $0, label113
label107: sh $s4, 2($0)
label108: srlv $0, $0, $s3
label109: sb $s5, 9($0)
label110: jr $t2
label111: mflo $s4
label112: sh $s5, 10($0)
label113: slti $s5, $s1, -1
label114: blez $s4, label121
label115: lw $s3, 0($0)
label116: sub $s3, $s1, $0
label117: srl $0, $s4, 20
label118: beq $0, $s1, label124
label119: xori $s1, $s2, 8
label120: mflo $s1
label121: addu $s1, $s5, $s2
label122: blez $s3, label123
label123: sub $s4, $s1, $s5
label124: sh $0, 6($0)
label125: nor $s5, $s3, $s2
label126: lhu $s1, 8($0)
label127: and $s1, $s3, $0
label128: nor $s1, $s1, $s2
label129: sll $s2, $s3, 4
label130: ori $s5, $s2, 10
label131: mflo $s4
label132: srl $s2, $s1, 18
label133: ori $s3, $s1, 0
label134: bgez $s1, label142
label135: lhu $0, 2($0)
label136: addiu $s3, $s1, -5
label137: sltiu $s1, $s1, -4
label138: mtlo $s3
label139: bltz $s3, label143
label140: addiu $s3, $s1, 10
label141: slt $0, $s5, $s2
label142: lhu $s4, 8($0)
label143: lb $s3, 1($0)
label144: mfhi $s4
label145: jal label153
label146: xor $s4, $0, $s2
label147: or $s5, $s2, $s5
label148: bltz $s1, label153
label149: xor $0, $0, $s4
label150: lh $0, 2($0)
label151: sllv $s1, $s4, $s4
label152: nor $s4, $s1, $s5
label153: slti $s3, $0, -7
label154: sra $s3, $s2, 1
label155: sh $s5, 10($0)
label156: lh $s4, 2($0)
label157: srl $s1, $s4, 14
label158: sltu $s3, $s2, $0
label159: bgez $s5, label165
label160: and $s4, $s1, $s4
label161: srl $s5, $s1, 2
label162: jal label170
label163: sb $0, 1($0)
label164: or $s1, $s5, $s5
label165: lhu $s5, 4($0)
label166: blez $s4, label172
label167: mthi $0
label168: j label173
label169: andi $0, $s5, 2
label170: srav $s1, $s4, $s4
label171: jr $t3
label172: lw $0, 8($0)
label173: lui $0, 148
label174: srlv $0, $0, $s1
label175: lh $s2, 0($0)
label176: sb $s1, 0($0)
label177: xori $s1, $s1, 4
label178: bltz $s3, label179
label179: mflo $s1
label180: xor $s1, $s3, $s4
label181: beq $s5, $s4, label190
label182: lb $0, 0($0)
label183: addi $s1, $s3, 4
label184: addiu $s2, $0, 9
label185: jr $t3
label186: srl $s4, $s4, 2
label187: addu $s1, $s2, $0
label188: addu $s2, $0, $s3
label189: or $s4, $s1, $s3
label190: addiu $s1, $s4, 7
label191: mthi $s3
label192: nor $s1, $s2, $0
label193: srl $s3, $s4, 28
label194: srl $s3, $s4, 5
label195: sw $s1, 8($0)
label196: jr $t3
label197: xori $s1, $s2, 0
label198: addi $s2, $s3, -10
label199: jalr $s2, $t3
label200: or $s5, $s1, $s1
label201: blez $s1, label203
label202: lbu $s1, 4($0)
label203: and $s5, $s2, $s2
label204: srav $s2, $s5, $s1
label205: j label215
label206: subu $0, $s1, $0
label207: srl $s3, $s4, 9
label208: sh $s4, 2($0)
label209: sub $s3, $0, $s4
label210: subu $0, $s3, $s1
label211: slt $s2, $s4, $s2
label212: sra $s4, $s2, 25
label213: sh $0, 0($0)
label214: mthi $s1
label215: subu $s2, $s2, $0
label216: sltiu $s1, $s4, 3
label217: ori $0, $s1, 1
label218: mult $s3, $s5
label219: subu $0, $s2, $s1
label220: mthi $s2
label221: sh $s4, 6($0)
label222: nor $0, $s4, $s5
label223: lb $s2, 5($0)
label224: bgez $s4, label231
label225: andi $s2, $s2, 4
label226: bltz $s3, label232
label227: sh $s5, 4($0)
label228: bgez $s4, label238
label229: sw $s4, 8($0)
label230: beq $s3, $0, label234
label231: srav $0, $s1, $s4
label232: sh $0, 2($0)
label233: sra $0, $s3, 20
label234: bltz $s2, label239
label235: add $0, $s2, $s2
label236: lbu $s5, 1($0)
label237: sb $s5, 2($0)
label238: sltu $s5, $s4, $s5
label239: addi $s3, $s3, 6
label240: bltz $s5, label248
label241: ori $0, $s5, 7
label242: srav $s2, $s3, $s5
label243: srav $s1, $s5, $s2
label244: add $s2, $s3, $s4
label245: jr $t4
label246: xor $s4, $s3, $s2
label247: bgez $s2, label257
label248: sub $s1, $s3, $s5
label249: lb $s3, 1($0)
label250: sltu $s4, $s3, $s4
label251: srlv $0, $s1, $s4
label252: xor $s5, $s1, $s1
label253: mult $s2, $s2
label254: sra $s1, $s1, 9
label255: mfhi $s3
label256: sb $s5, 0($0)
label257: lb $s5, 5($0)
label258: sll $s2, $0, 2
label259: addiu $s3, $s5, -1
label260: lw $s2, 8($0)
label261: sra $s5, $s2, 26
label262: lw $s2, 0($0)
label263: jal label272
label264: sw $s4, 4($0)
label265: lhu $s5, 4($0)
label266: bne $s4, $s4, label271
label267: lh $s1, 8($0)
label268: mult $s5, $s1
label269: addu $s4, $s5, $s2
label270: mult $0, $s3
label271: lh $0, 8($0)
label272: mult $s1, $0
label273: beq $s2, $s1, label274
label274: nor $s5, $s1, $s1
label275: andi $0, $s4, -10
label276: multu $s4, $s4
label277: srl $s4, $s3, 8
label278: bltz $s2, label287
label279: nor $s1, $0, $s4
label280: lbu $s1, 3($0)
label281: sb $s4, 4($0)
label282: sll $0, $s2, 20
label283: lh $0, 2($0)
label284: sllv $s4, $s3, $s4
label285: lw $s5, 0($0)
label286: sltiu $s1, $s4, 8
label287: beq $s2, $s4, label292
label288: subu $s3, $s3, $s2
label289: subu $s5, $s5, $s4
label290: addu $0, $0, $0
label291: sb $s3, 3($0)
label292: sllv $s3, $s4, $s1
label293: add $0, $0, $0
label294: subu $s3, $s2, $s1
label295: sltiu $s1, $0, 2
label296: addu $s5, $s3, $s3
label297: mfhi $s2
label298: sltu $s4, $s5, $s2
label299: addi $0, $s5, 9
label300: lh $s4, 8($0)
label301: mthi $s5
label302: srl $s5, $0, 20
label303: sb $s4, 2($0)
label304: lh $s1, 6($0)
label305: add $0, $s5, $s2
label306: xor $0, $s1, $s3
label307: addu $s3, $s4, $0
label308: xor $s2, $0, $s2
label309: beq $0, $s2, label311
label310: and $s4, $s4, $s5
label311: xori $s2, $0, 9
label312: jr $t6
label313: sltu $s5, $s3, $s2
label314: mthi $0
label315: or $s2, $s3, $s1
label316: bgtz $s5, label323
label317: sllv $s2, $s5, $s2
label318: sub $s3, $s1, $s2
label319: mthi $s5
label320: beq $s1, $s2, label323
label321: addu $s2, $s1, $s4
label322: mult $s1, $s1
label323: multu $s2, $s1
label324: sll $s2, $s2, 13
label325: sb $0, 3($0)
label326: andi $s5, $s3, 8
label327: sll $0, $s2, 9
label328: mflo $0
label329: j label333
label330: xor $s1, $0, $s3
label331: lb $s5, 3($0)
label332: mflo $s2
label333: lhu $s1, 6($0)
label334: srlv $s1, $s5, $0
label335: jr $t6
label336: or $s1, $s3, $s1
label337: nor $s5, $s2, $s3
label338: beq $s1, $0, label346
label339: sra $s3, $s5, 31
label340: addi $s2, $s4, 8
label341: addiu $s4, $s1, -8
label342: and $0, $s2, $0
label343: slti $s3, $0, -4
label344: srav $s2, $s2, $s1
label345: mult $s4, $s4
label346: sltu $s4, $s3, $s1
label347: bgez $s1, label356
label348: lhu $s5, 0($0)
label349: lui $s4, 171
label350: addi $s2, $s2, 8
label351: subu $s1, $s5, $s4
label352: lhu $s2, 0($0)
label353: srav $s4, $s1, $s5
label354: subu $s5, $s4, $s3
label355: sub $s3, $s5, $s4
label356: sll $0, $s4, 10
label357: mtlo $s2
label358: addu $s1, $0, $s1
label359: sltu $s3, $s3, $s1
label360: sw $s1, 8($0)
label361: slti $s1, $s4, 1
label362: j label364
label363: mult $s3, $s1
label364: sb $s3, 0($0)
label365: sw $s1, 4($0)
label366: jr $t7
label367: lhu $s1, 6($0)
label368: mtlo $s3
label369: mfhi $s3
label370: lw $s5, 0($0)
label371: beq $s1, $0, label373
label372: sltu $s1, $s4, $s5
label373: or $0, $s4, $s1
label374: addu $s5, $s3, $s3
label375: xor $s2, $s5, $s5
label376: xori $s4, $s5, 7
label377: xor $s1, $s2, $s5
label378: mfhi $s3
label379: or $s5, $0, $s1
label380: jal label385
label381: sltu $s2, $s1, $s5
label382: lhu $s1, 4($0)
label383: and $s3, $s5, $s3
label384: lui $s3, 70
label385: addiu $s1, $s1, 5
label386: lbu $0, 8($0)
label387: andi $0, $s3, 2
label388: slti $s1, $s2, 8
label389: sub $s5, $s3, $s4
label390: addiu $s2, $s4, 2
label391: sltiu $s5, $s3, 3
label392: sh $s2, 0($0)
label393: add $s3, $s4, $s3
label394: mult $s1, $s4
label395: beq $s5, $0, label404
label396: sh $0, 8($0)
label397: add $s2, $s4, $s4
label398: bgtz $s1, label407
label399: xor $s2, $s3, $0
label400: jal label401
label401: slt $s4, $0, $s2
label402: lh $s3, 8($0)
label403: bgtz $s4, label408
label404: mtlo $s1
label405: subu $0, $s3, $s3
label406: lui $s2, 65
label407: sltu $s1, $0, $s1
label408: lhu $0, 0($0)
label409: sltiu $s1, $s5, 4
label410: sltiu $s1, $s4, 1
label411: mthi $s5
label412: jr $t8
label413: lh $s3, 2($0)
label414: bltz $s1, label422
label415: multu $s3, $s5
label416: mflo $s3
label417: jalr $s5, $t8
label418: slti $s2, $0, -7
label419: srav $0, $s2, $s5
label420: multu $s2, $s2
label421: sh $0, 2($0)
label422: xor $0, $s1, $s5
label423: srl $s5, $s1, 13
label424: sll $s2, $0, 1
label425: lbu $s3, 2($0)
label426: subu $s2, $s4, $s3
label427: and $s5, $s5, $0
label428: lw $s2, 8($0)
label429: subu $s4, $s1, $s2
label430: add $s5, $0, $s2
label431: bltz $s3, label434
label432: sll $s5, $s2, 16
label433: sltu $s3, $s3, $s1
label434: add $s4, $s1, $s5
label435: beq $s2, $0, label436
label436: andi $s5, $s2, -6
label437: bgez $s3, label446
label438: mfhi $s5
label439: lui $0, 91
label440: and $s2, $s5, $s1
label441: add $s4, $s5, $s3
label442: sw $s2, 8($0)
label443: mtlo $s2
label444: bgtz $s2, label451
label445: sb $0, 5($0)
label446: srav $s4, $s1, $s5
label447: j label455
label448: lw $s2, 4($0)
label449: lui $s3, 19
label450: lb $s5, 7($0)
label451: srl $0, $s4, 11
label452: mult $s3, $s4
label453: nor $s4, $0, $s2
label454: sltu $s2, $s1, $s5
label455: and $s3, $s4, $0
label456: srav $s2, $s2, $s2
label457: sw $s4, 4($0)
label458: sub $0, $0, $0
label459: jr $t9
label460: xori $s3, $s2, 1
label461: mfhi $s4
label462: sb $s1, 8($0)
label463: srl $s5, $0, 10
label464: nor $s1, $s3, $s4
label465: bltz $s1, label467
label466: sb $s3, 8($0)
label467: srlv $s1, $s4, $s1
label468: j label478
label469: add $s4, $0, $s2
label470: sllv $s4, $s4, $s1
label471: mfhi $s2
label472: sub $s3, $s3, $s2
label473: addiu $s2, $s5, -10
label474: j label475
label475: xori $s3, $s2, 1
label476: bne $0, $s2, label485
label477: mfhi $s5
label478: lb $s5, 1($0)
label479: and $s2, $s5, $s3
label480: bgtz $s3, label484
label481: ori $s5, $0, 8
label482: add $s3, $0, $s2
label483: mflo $s4
label484: jr $t9
label485: add $s4, $s5, $s1
label486: bne $s4, $0, label495
label487: sll $s4, $s5, 0
label488: slti $s5, $s2, -2
label489: srlv $s5, $0, $s3
label490: lw $0, 4($0)
label491: lh $s1, 2($0)
label492: andi $s3, $s5, -2
label493: xori $0, $0, 0
label494: sllv $s3, $s3, $s4
label495: sh $s2, 10($0)
label496: sltu $0, $s3, $0
label497: sub $s2, $s3, $s1
label498: jalr $s3, $t9
label499: slti $s5, $s4, -6
label500: