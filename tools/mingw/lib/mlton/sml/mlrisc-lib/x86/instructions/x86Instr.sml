(*
 * WARNING: This file was automatically generated by MDLGen (v3.0)
 * from the machine description file "x86/x86.mdl".
 * DO NOT EDIT this file directly
 *)


signature X86INSTR =
sig
   structure C : X86CELLS
   structure CB : CELLS_BASIS (* = CellsBasis *)
                  where type CellSet.cellset = CellsBasis.CellSet.cellset
                    and type 'a ColorTable.hash_table = 'a CellsBasis.ColorTable.hash_table
                    and type 'a HashTable.hash_table = 'a CellsBasis.HashTable.hash_table
                    and type SortedCells.sorted_cells = CellsBasis.SortedCells.sorted_cells
                    and type cell = CellsBasis.cell
                    and type cellColor = CellsBasis.cellColor
                    and type cellkind = CellsBasis.cellkind
                    and type cellkindDesc = CellsBasis.cellkindDesc
                    and type cellkindInfo = CellsBasis.cellkindInfo
   structure T : MLTREE
   structure Constant: CONSTANT
   structure Region : REGION
      sharing Constant = T.Constant
      sharing Region = T.Region
   datatype operand =
     Immed of Int32.int
   | ImmedLabel of T.labexp
   | Relative of int
   | LabelEA of T.labexp
   | Direct of CellsBasis.cell
   | FDirect of CellsBasis.cell
   | FPR of CellsBasis.cell
   | ST of CellsBasis.cell
   | MemReg of CellsBasis.cell
   | Displace of {base:CellsBasis.cell, disp:operand, mem:Region.region}
   | Indexed of {base:(CellsBasis.cell) option, index:CellsBasis.cell, scale:int, 
        disp:operand, mem:Region.region}
   type addressing_mode = operand
   type ea = operand
   datatype cond =
     EQ
   | NE
   | LT
   | LE
   | GT
   | GE
   | B
   | BE
   | A
   | AE
   | C
   | NC
   | P
   | NP
   | O
   | NO
   datatype binaryOp =
     ADDL
   | SUBL
   | ANDL
   | ORL
   | XORL
   | SHLL
   | SARL
   | SHRL
   | MULL
   | IMULL
   | ADCL
   | SBBL
   | ADDW
   | SUBW
   | ANDW
   | ORW
   | XORW
   | SHLW
   | SARW
   | SHRW
   | MULW
   | IMULW
   | ADDB
   | SUBB
   | ANDB
   | ORB
   | XORB
   | SHLB
   | SARB
   | SHRB
   | MULB
   | IMULB
   | BTSW
   | BTCW
   | BTRW
   | BTSL
   | BTCL
   | BTRL
   | ROLW
   | RORW
   | ROLL
   | RORL
   | XCHGB
   | XCHGW
   | XCHGL
   | LOCK_ADCW
   | LOCK_ADCL
   | LOCK_ADDW
   | LOCK_ADDL
   | LOCK_ANDW
   | LOCK_ANDL
   | LOCK_BTSW
   | LOCK_BTSL
   | LOCK_BTRW
   | LOCK_BTRL
   | LOCK_BTCW
   | LOCK_BTCL
   | LOCK_ORW
   | LOCK_ORL
   | LOCK_SBBW
   | LOCK_SBBL
   | LOCK_SUBW
   | LOCK_SUBL
   | LOCK_XORW
   | LOCK_XORL
   | LOCK_XADDB
   | LOCK_XADDW
   | LOCK_XADDL
   datatype multDivOp =
     IMULL1
   | MULL1
   | IDIVL1
   | DIVL1
   datatype unaryOp =
     DECL
   | INCL
   | NEGL
   | NOTL
   | DECW
   | INCW
   | NEGW
   | NOTW
   | DECB
   | INCB
   | NEGB
   | NOTB
   | LOCK_DECL
   | LOCK_INCL
   | LOCK_NEGL
   | LOCK_NOTL
   datatype shiftOp =
     SHLDL
   | SHRDL
   datatype bitOp =
     BTW
   | BTL
   | LOCK_BTW
   | LOCK_BTL
   datatype move =
     MOVL
   | MOVB
   | MOVW
   | MOVSWL
   | MOVZWL
   | MOVSBL
   | MOVZBL
   datatype fbinOp =
     FADDP
   | FADDS
   | FMULP
   | FMULS
   | FCOMS
   | FCOMPS
   | FSUBP
   | FSUBS
   | FSUBRP
   | FSUBRS
   | FDIVP
   | FDIVS
   | FDIVRP
   | FDIVRS
   | FADDL
   | FMULL
   | FCOML
   | FCOMPL
   | FSUBL
   | FSUBRL
   | FDIVL
   | FDIVRL
   datatype fibinOp =
     FIADDS
   | FIMULS
   | FICOMS
   | FICOMPS
   | FISUBS
   | FISUBRS
   | FIDIVS
   | FIDIVRS
   | FIADDL
   | FIMULL
   | FICOML
   | FICOMPL
   | FISUBL
   | FISUBRL
   | FIDIVL
   | FIDIVRL
   datatype funOp =
     FCHS
   | FABS
   | FTST
   | FXAM
   | FPTAN
   | FPATAN
   | FXTRACT
   | FPREM1
   | FDECSTP
   | FINCSTP
   | FPREM
   | FYL2XP1
   | FSQRT
   | FSINCOS
   | FRNDINT
   | FSCALE
   | FSIN
   | FCOS
   datatype fenvOp =
     FLDENV
   | FNLDENV
   | FSTENV
   | FNSTENV
   datatype fsize =
     FP32
   | FP64
   | FP80
   datatype isize =
     I8
   | I16
   | I32
   | I64
   datatype instr =
     NOP
   | JMP of operand * Label.label list
   | JCC of {cond:cond, opnd:operand}
   | CALL of {opnd:operand, defs:C.cellset, uses:C.cellset, return:C.cellset, 
        cutsTo:Label.label list, mem:Region.region, pops:Int32.int}
   | ENTER of {src1:operand, src2:operand}
   | LEAVE
   | RET of operand option
   | MOVE of {mvOp:move, src:operand, dst:operand}
   | LEA of {r32:CellsBasis.cell, addr:operand}
   | CMPL of {lsrc:operand, rsrc:operand}
   | CMPW of {lsrc:operand, rsrc:operand}
   | CMPB of {lsrc:operand, rsrc:operand}
   | TESTL of {lsrc:operand, rsrc:operand}
   | TESTW of {lsrc:operand, rsrc:operand}
   | TESTB of {lsrc:operand, rsrc:operand}
   | BITOP of {bitOp:bitOp, lsrc:operand, rsrc:operand}
   | BINARY of {binOp:binaryOp, src:operand, dst:operand}
   | SHIFT of {shiftOp:shiftOp, src:operand, dst:operand, count:operand}
   | CMPXCHG of {lock:bool, sz:isize, src:operand, dst:operand}
   | MULTDIV of {multDivOp:multDivOp, src:operand}
   | MUL3 of {dst:CellsBasis.cell, src2:Int32.int, src1:operand}
   | UNARY of {unOp:unaryOp, opnd:operand}
   | SET of {cond:cond, opnd:operand}
   | CMOV of {cond:cond, src:operand, dst:CellsBasis.cell}
   | PUSHL of operand
   | PUSHW of operand
   | PUSHB of operand
   | PUSHFD
   | POPFD
   | POP of operand
   | CDQ
   | INTO
   | FBINARY of {binOp:fbinOp, src:operand, dst:operand}
   | FIBINARY of {binOp:fibinOp, src:operand}
   | FUNARY of funOp
   | FUCOM of operand
   | FUCOMP of operand
   | FUCOMPP
   | FCOMPP
   | FCOMI of operand
   | FCOMIP of operand
   | FUCOMI of operand
   | FUCOMIP of operand
   | FXCH of {opnd:CellsBasis.cell}
   | FSTPL of operand
   | FSTPS of operand
   | FSTPT of operand
   | FSTL of operand
   | FSTS of operand
   | FLD1
   | FLDL2E
   | FLDL2T
   | FLDLG2
   | FLDLN2
   | FLDPI
   | FLDZ
   | FLDL of operand
   | FLDS of operand
   | FLDT of operand
   | FILD of operand
   | FILDL of operand
   | FILDLL of operand
   | FNSTSW
   | FENV of {fenvOp:fenvOp, opnd:operand}
   | FMOVE of {fsize:fsize, src:operand, dst:operand}
   | FILOAD of {isize:isize, ea:operand, dst:operand}
   | FBINOP of {fsize:fsize, binOp:fbinOp, lsrc:operand, rsrc:operand, dst:operand}
   | FIBINOP of {isize:isize, binOp:fibinOp, lsrc:operand, rsrc:operand, dst:operand}
   | FUNOP of {fsize:fsize, unOp:funOp, src:operand, dst:operand}
   | FCMP of {i:bool, fsize:fsize, lsrc:operand, rsrc:operand}
   | SAHF
   | LAHF
   | SOURCE of {}
   | SINK of {}
   | PHI of {}
   and instruction =
     LIVE of {regs: C.cellset, spilled: C.cellset}
   | KILL of {regs: C.cellset, spilled: C.cellset}
   | COPY of {k: CellsBasis.cellkind, 
              sz: int,          (* in bits *)
              dst: CellsBasis.cell list,
              src: CellsBasis.cell list,
              tmp: ea option (* NONE if |dst| = {src| = 1 *)}
   | ANNOTATION of {i:instruction, a:Annotations.annotation}
   | INSTR of instr
   val nop : instruction
   val jmp : operand * Label.label list -> instruction
   val jcc : {cond:cond, opnd:operand} -> instruction
   val call : {opnd:operand, defs:C.cellset, uses:C.cellset, return:C.cellset, 
      cutsTo:Label.label list, mem:Region.region, pops:Int32.int} -> instruction
   val enter : {src1:operand, src2:operand} -> instruction
   val leave : instruction
   val ret : operand option -> instruction
   val move : {mvOp:move, src:operand, dst:operand} -> instruction
   val lea : {r32:CellsBasis.cell, addr:operand} -> instruction
   val cmpl : {lsrc:operand, rsrc:operand} -> instruction
   val cmpw : {lsrc:operand, rsrc:operand} -> instruction
   val cmpb : {lsrc:operand, rsrc:operand} -> instruction
   val testl : {lsrc:operand, rsrc:operand} -> instruction
   val testw : {lsrc:operand, rsrc:operand} -> instruction
   val testb : {lsrc:operand, rsrc:operand} -> instruction
   val bitop : {bitOp:bitOp, lsrc:operand, rsrc:operand} -> instruction
   val binary : {binOp:binaryOp, src:operand, dst:operand} -> instruction
   val shift : {shiftOp:shiftOp, src:operand, dst:operand, count:operand} -> instruction
   val cmpxchg : {lock:bool, sz:isize, src:operand, dst:operand} -> instruction
   val multdiv : {multDivOp:multDivOp, src:operand} -> instruction
   val mul3 : {dst:CellsBasis.cell, src2:Int32.int, src1:operand} -> instruction
   val unary : {unOp:unaryOp, opnd:operand} -> instruction
   val set : {cond:cond, opnd:operand} -> instruction
   val cmov : {cond:cond, src:operand, dst:CellsBasis.cell} -> instruction
   val pushl : operand -> instruction
   val pushw : operand -> instruction
   val pushb : operand -> instruction
   val pushfd : instruction
   val popfd : instruction
   val pop : operand -> instruction
   val cdq : instruction
   val into : instruction
   val fbinary : {binOp:fbinOp, src:operand, dst:operand} -> instruction
   val fibinary : {binOp:fibinOp, src:operand} -> instruction
   val funary : funOp -> instruction
   val fucom : operand -> instruction
   val fucomp : operand -> instruction
   val fucompp : instruction
   val fcompp : instruction
   val fcomi : operand -> instruction
   val fcomip : operand -> instruction
   val fucomi : operand -> instruction
   val fucomip : operand -> instruction
   val fxch : {opnd:CellsBasis.cell} -> instruction
   val fstpl : operand -> instruction
   val fstps : operand -> instruction
   val fstpt : operand -> instruction
   val fstl : operand -> instruction
   val fsts : operand -> instruction
   val fld1 : instruction
   val fldl2e : instruction
   val fldl2t : instruction
   val fldlg2 : instruction
   val fldln2 : instruction
   val fldpi : instruction
   val fldz : instruction
   val fldl : operand -> instruction
   val flds : operand -> instruction
   val fldt : operand -> instruction
   val fild : operand -> instruction
   val fildl : operand -> instruction
   val fildll : operand -> instruction
   val fnstsw : instruction
   val fenv : {fenvOp:fenvOp, opnd:operand} -> instruction
   val fmove : {fsize:fsize, src:operand, dst:operand} -> instruction
   val fiload : {isize:isize, ea:operand, dst:operand} -> instruction
   val fbinop : {fsize:fsize, binOp:fbinOp, lsrc:operand, rsrc:operand, dst:operand} -> instruction
   val fibinop : {isize:isize, binOp:fibinOp, lsrc:operand, rsrc:operand, dst:operand} -> instruction
   val funop : {fsize:fsize, unOp:funOp, src:operand, dst:operand} -> instruction
   val fcmp : {i:bool, fsize:fsize, lsrc:operand, rsrc:operand} -> instruction
   val sahf : instruction
   val lahf : instruction
   val source : {} -> instruction
   val sink : {} -> instruction
   val phi : {} -> instruction
end

functor X86Instr(T: MLTREE
                ) : X86INSTR =
struct
   structure C = X86Cells
   structure CB = CellsBasis
   structure T = T
   structure Region = T.Region
   structure Constant = T.Constant
   datatype operand =
     Immed of Int32.int
   | ImmedLabel of T.labexp
   | Relative of int
   | LabelEA of T.labexp
   | Direct of CellsBasis.cell
   | FDirect of CellsBasis.cell
   | FPR of CellsBasis.cell
   | ST of CellsBasis.cell
   | MemReg of CellsBasis.cell
   | Displace of {base:CellsBasis.cell, disp:operand, mem:Region.region}
   | Indexed of {base:(CellsBasis.cell) option, index:CellsBasis.cell, scale:int, 
        disp:operand, mem:Region.region}
   type addressing_mode = operand
   type ea = operand
   datatype cond =
     EQ
   | NE
   | LT
   | LE
   | GT
   | GE
   | B
   | BE
   | A
   | AE
   | C
   | NC
   | P
   | NP
   | O
   | NO
   datatype binaryOp =
     ADDL
   | SUBL
   | ANDL
   | ORL
   | XORL
   | SHLL
   | SARL
   | SHRL
   | MULL
   | IMULL
   | ADCL
   | SBBL
   | ADDW
   | SUBW
   | ANDW
   | ORW
   | XORW
   | SHLW
   | SARW
   | SHRW
   | MULW
   | IMULW
   | ADDB
   | SUBB
   | ANDB
   | ORB
   | XORB
   | SHLB
   | SARB
   | SHRB
   | MULB
   | IMULB
   | BTSW
   | BTCW
   | BTRW
   | BTSL
   | BTCL
   | BTRL
   | ROLW
   | RORW
   | ROLL
   | RORL
   | XCHGB
   | XCHGW
   | XCHGL
   | LOCK_ADCW
   | LOCK_ADCL
   | LOCK_ADDW
   | LOCK_ADDL
   | LOCK_ANDW
   | LOCK_ANDL
   | LOCK_BTSW
   | LOCK_BTSL
   | LOCK_BTRW
   | LOCK_BTRL
   | LOCK_BTCW
   | LOCK_BTCL
   | LOCK_ORW
   | LOCK_ORL
   | LOCK_SBBW
   | LOCK_SBBL
   | LOCK_SUBW
   | LOCK_SUBL
   | LOCK_XORW
   | LOCK_XORL
   | LOCK_XADDB
   | LOCK_XADDW
   | LOCK_XADDL
   datatype multDivOp =
     IMULL1
   | MULL1
   | IDIVL1
   | DIVL1
   datatype unaryOp =
     DECL
   | INCL
   | NEGL
   | NOTL
   | DECW
   | INCW
   | NEGW
   | NOTW
   | DECB
   | INCB
   | NEGB
   | NOTB
   | LOCK_DECL
   | LOCK_INCL
   | LOCK_NEGL
   | LOCK_NOTL
   datatype shiftOp =
     SHLDL
   | SHRDL
   datatype bitOp =
     BTW
   | BTL
   | LOCK_BTW
   | LOCK_BTL
   datatype move =
     MOVL
   | MOVB
   | MOVW
   | MOVSWL
   | MOVZWL
   | MOVSBL
   | MOVZBL
   datatype fbinOp =
     FADDP
   | FADDS
   | FMULP
   | FMULS
   | FCOMS
   | FCOMPS
   | FSUBP
   | FSUBS
   | FSUBRP
   | FSUBRS
   | FDIVP
   | FDIVS
   | FDIVRP
   | FDIVRS
   | FADDL
   | FMULL
   | FCOML
   | FCOMPL
   | FSUBL
   | FSUBRL
   | FDIVL
   | FDIVRL
   datatype fibinOp =
     FIADDS
   | FIMULS
   | FICOMS
   | FICOMPS
   | FISUBS
   | FISUBRS
   | FIDIVS
   | FIDIVRS
   | FIADDL
   | FIMULL
   | FICOML
   | FICOMPL
   | FISUBL
   | FISUBRL
   | FIDIVL
   | FIDIVRL
   datatype funOp =
     FCHS
   | FABS
   | FTST
   | FXAM
   | FPTAN
   | FPATAN
   | FXTRACT
   | FPREM1
   | FDECSTP
   | FINCSTP
   | FPREM
   | FYL2XP1
   | FSQRT
   | FSINCOS
   | FRNDINT
   | FSCALE
   | FSIN
   | FCOS
   datatype fenvOp =
     FLDENV
   | FNLDENV
   | FSTENV
   | FNSTENV
   datatype fsize =
     FP32
   | FP64
   | FP80
   datatype isize =
     I8
   | I16
   | I32
   | I64
   datatype instr =
     NOP
   | JMP of operand * Label.label list
   | JCC of {cond:cond, opnd:operand}
   | CALL of {opnd:operand, defs:C.cellset, uses:C.cellset, return:C.cellset, 
        cutsTo:Label.label list, mem:Region.region, pops:Int32.int}
   | ENTER of {src1:operand, src2:operand}
   | LEAVE
   | RET of operand option
   | MOVE of {mvOp:move, src:operand, dst:operand}
   | LEA of {r32:CellsBasis.cell, addr:operand}
   | CMPL of {lsrc:operand, rsrc:operand}
   | CMPW of {lsrc:operand, rsrc:operand}
   | CMPB of {lsrc:operand, rsrc:operand}
   | TESTL of {lsrc:operand, rsrc:operand}
   | TESTW of {lsrc:operand, rsrc:operand}
   | TESTB of {lsrc:operand, rsrc:operand}
   | BITOP of {bitOp:bitOp, lsrc:operand, rsrc:operand}
   | BINARY of {binOp:binaryOp, src:operand, dst:operand}
   | SHIFT of {shiftOp:shiftOp, src:operand, dst:operand, count:operand}
   | CMPXCHG of {lock:bool, sz:isize, src:operand, dst:operand}
   | MULTDIV of {multDivOp:multDivOp, src:operand}
   | MUL3 of {dst:CellsBasis.cell, src2:Int32.int, src1:operand}
   | UNARY of {unOp:unaryOp, opnd:operand}
   | SET of {cond:cond, opnd:operand}
   | CMOV of {cond:cond, src:operand, dst:CellsBasis.cell}
   | PUSHL of operand
   | PUSHW of operand
   | PUSHB of operand
   | PUSHFD
   | POPFD
   | POP of operand
   | CDQ
   | INTO
   | FBINARY of {binOp:fbinOp, src:operand, dst:operand}
   | FIBINARY of {binOp:fibinOp, src:operand}
   | FUNARY of funOp
   | FUCOM of operand
   | FUCOMP of operand
   | FUCOMPP
   | FCOMPP
   | FCOMI of operand
   | FCOMIP of operand
   | FUCOMI of operand
   | FUCOMIP of operand
   | FXCH of {opnd:CellsBasis.cell}
   | FSTPL of operand
   | FSTPS of operand
   | FSTPT of operand
   | FSTL of operand
   | FSTS of operand
   | FLD1
   | FLDL2E
   | FLDL2T
   | FLDLG2
   | FLDLN2
   | FLDPI
   | FLDZ
   | FLDL of operand
   | FLDS of operand
   | FLDT of operand
   | FILD of operand
   | FILDL of operand
   | FILDLL of operand
   | FNSTSW
   | FENV of {fenvOp:fenvOp, opnd:operand}
   | FMOVE of {fsize:fsize, src:operand, dst:operand}
   | FILOAD of {isize:isize, ea:operand, dst:operand}
   | FBINOP of {fsize:fsize, binOp:fbinOp, lsrc:operand, rsrc:operand, dst:operand}
   | FIBINOP of {isize:isize, binOp:fibinOp, lsrc:operand, rsrc:operand, dst:operand}
   | FUNOP of {fsize:fsize, unOp:funOp, src:operand, dst:operand}
   | FCMP of {i:bool, fsize:fsize, lsrc:operand, rsrc:operand}
   | SAHF
   | LAHF
   | SOURCE of {}
   | SINK of {}
   | PHI of {}
   and instruction =
     LIVE of {regs: C.cellset, spilled: C.cellset}
   | KILL of {regs: C.cellset, spilled: C.cellset}
   | COPY of {k: CellsBasis.cellkind, 
              sz: int,          (* in bits *)
              dst: CellsBasis.cell list,
              src: CellsBasis.cell list,
              tmp: ea option (* NONE if |dst| = {src| = 1 *)}
   | ANNOTATION of {i:instruction, a:Annotations.annotation}
   | INSTR of instr
   val nop = INSTR NOP
   and jmp = INSTR o JMP
   and jcc = INSTR o JCC
   and call = INSTR o CALL
   and enter = INSTR o ENTER
   and leave = INSTR LEAVE
   and ret = INSTR o RET
   and move = INSTR o MOVE
   and lea = INSTR o LEA
   and cmpl = INSTR o CMPL
   and cmpw = INSTR o CMPW
   and cmpb = INSTR o CMPB
   and testl = INSTR o TESTL
   and testw = INSTR o TESTW
   and testb = INSTR o TESTB
   and bitop = INSTR o BITOP
   and binary = INSTR o BINARY
   and shift = INSTR o SHIFT
   and cmpxchg = INSTR o CMPXCHG
   and multdiv = INSTR o MULTDIV
   and mul3 = INSTR o MUL3
   and unary = INSTR o UNARY
   and set = INSTR o SET
   and cmov = INSTR o CMOV
   and pushl = INSTR o PUSHL
   and pushw = INSTR o PUSHW
   and pushb = INSTR o PUSHB
   and pushfd = INSTR PUSHFD
   and popfd = INSTR POPFD
   and pop = INSTR o POP
   and cdq = INSTR CDQ
   and into = INSTR INTO
   and fbinary = INSTR o FBINARY
   and fibinary = INSTR o FIBINARY
   and funary = INSTR o FUNARY
   and fucom = INSTR o FUCOM
   and fucomp = INSTR o FUCOMP
   and fucompp = INSTR FUCOMPP
   and fcompp = INSTR FCOMPP
   and fcomi = INSTR o FCOMI
   and fcomip = INSTR o FCOMIP
   and fucomi = INSTR o FUCOMI
   and fucomip = INSTR o FUCOMIP
   and fxch = INSTR o FXCH
   and fstpl = INSTR o FSTPL
   and fstps = INSTR o FSTPS
   and fstpt = INSTR o FSTPT
   and fstl = INSTR o FSTL
   and fsts = INSTR o FSTS
   and fld1 = INSTR FLD1
   and fldl2e = INSTR FLDL2E
   and fldl2t = INSTR FLDL2T
   and fldlg2 = INSTR FLDLG2
   and fldln2 = INSTR FLDLN2
   and fldpi = INSTR FLDPI
   and fldz = INSTR FLDZ
   and fldl = INSTR o FLDL
   and flds = INSTR o FLDS
   and fldt = INSTR o FLDT
   and fild = INSTR o FILD
   and fildl = INSTR o FILDL
   and fildll = INSTR o FILDLL
   and fnstsw = INSTR FNSTSW
   and fenv = INSTR o FENV
   and fmove = INSTR o FMOVE
   and fiload = INSTR o FILOAD
   and fbinop = INSTR o FBINOP
   and fibinop = INSTR o FIBINOP
   and funop = INSTR o FUNOP
   and fcmp = INSTR o FCMP
   and sahf = INSTR SAHF
   and lahf = INSTR LAHF
   and source = INSTR o SOURCE
   and sink = INSTR o SINK
   and phi = INSTR o PHI
end

