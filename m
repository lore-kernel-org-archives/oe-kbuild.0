Content-Type: multipart/mixed; boundary="===============1795834032903340907=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] bpf: move interpreter into separate source file
Date: Thu, 29 Oct 2020 12:26:54 +0800
Message-ID: <202010291225.RONVAo77-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1795834032903340907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20201028171506.15682-3-ardb@kernel.org>
References: <20201028171506.15682-3-ardb@kernel.org>
TO: Ard Biesheuvel <ardb@kernel.org>
TO: linux-kernel(a)vger.kernel.org
CC: netdev(a)vger.kernel.org
CC: bpf(a)vger.kernel.org
CC: arnd(a)arndb.de
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Arvind Sankar <nivedita@alum.mit.edu>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: Josh Poimboeuf <jpoimboe@redhat.com>
CC: Thomas Gleixner <tglx@linutronix.de>

Hi Ard,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master linus/master linux/master v5.10-rc1 =
next-20201028]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ard-Biesheuvel/bpf-don-t-r=
ely-on-GCC-__attribute__-optimize-to-disable-GCSE/20201029-060312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: i386-randconfig-m021-20201028 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/interp.c:277 ___bpf_prog_run() warn: should 'regs[insn->dst_reg]=
 << regs[insn->src_reg]' be a 64 bit type?
kernel/bpf/interp.c:277 ___bpf_prog_run() warn: should 'regs[insn->dst_reg]=
 << insn->imm' be a 64 bit type?

vim +277 kernel/bpf/interp.c

11087cf7f27f46 Ard Biesheuvel 2020-10-28  254  =

11087cf7f27f46 Ard Biesheuvel 2020-10-28  255  select_insn:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  256  	goto *jumptable[insn->code];
11087cf7f27f46 Ard Biesheuvel 2020-10-28  257  =

11087cf7f27f46 Ard Biesheuvel 2020-10-28  258  	/* ALU */
11087cf7f27f46 Ard Biesheuvel 2020-10-28  259  #define ALU(OPCODE, OP)			\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  260  	ALU64_##OPCODE##_X:		\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  261  		DST =3D DST OP SRC;	\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  262  		CONT;			\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  263  	ALU_##OPCODE##_X:		\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  264  		DST =3D (u32) DST OP (u32)=
 SRC;	\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  265  		CONT;			\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  266  	ALU64_##OPCODE##_K:		\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  267  		DST =3D DST OP IMM;		\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  268  		CONT;			\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  269  	ALU_##OPCODE##_K:		\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  270  		DST =3D (u32) DST OP (u32)=
 IMM;	\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  271  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  272  =

11087cf7f27f46 Ard Biesheuvel 2020-10-28  273  	ALU(ADD,  +)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  274  	ALU(SUB,  -)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  275  	ALU(AND,  &)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  276  	ALU(OR,   |)
11087cf7f27f46 Ard Biesheuvel 2020-10-28 @277  	ALU(LSH, <<)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  278  	ALU(RSH, >>)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  279  	ALU(XOR,  ^)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  280  	ALU(MUL,  *)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  281  #undef ALU
11087cf7f27f46 Ard Biesheuvel 2020-10-28  282  	ALU_NEG:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  283  		DST =3D (u32) -DST;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  284  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  285  	ALU64_NEG:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  286  		DST =3D -DST;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  287  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  288  	ALU_MOV_X:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  289  		DST =3D (u32) SRC;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  290  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  291  	ALU_MOV_K:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  292  		DST =3D (u32) IMM;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  293  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  294  	ALU64_MOV_X:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  295  		DST =3D SRC;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  296  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  297  	ALU64_MOV_K:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  298  		DST =3D IMM;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  299  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  300  	LD_IMM_DW:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  301  		DST =3D (u64) (u32) insn[0=
].imm | ((u64) (u32) insn[1].imm) << 32;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  302  		insn++;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  303  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  304  	ALU_ARSH_X:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  305  		DST =3D (u64) (u32) (((s32=
) DST) >> SRC);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  306  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  307  	ALU_ARSH_K:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  308  		DST =3D (u64) (u32) (((s32=
) DST) >> IMM);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  309  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  310  	ALU64_ARSH_X:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  311  		(*(s64 *) &DST) >>=3D SRC;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  312  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  313  	ALU64_ARSH_K:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  314  		(*(s64 *) &DST) >>=3D IMM;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  315  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  316  	ALU64_MOD_X:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  317  		div64_u64_rem(DST, SRC, &A=
X);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  318  		DST =3D AX;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  319  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  320  	ALU_MOD_X:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  321  		AX =3D (u32) DST;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  322  		DST =3D do_div(AX, (u32) S=
RC);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  323  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  324  	ALU64_MOD_K:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  325  		div64_u64_rem(DST, IMM, &A=
X);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  326  		DST =3D AX;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  327  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  328  	ALU_MOD_K:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  329  		AX =3D (u32) DST;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  330  		DST =3D do_div(AX, (u32) I=
MM);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  331  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  332  	ALU64_DIV_X:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  333  		DST =3D div64_u64(DST, SRC=
);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  334  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  335  	ALU_DIV_X:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  336  		AX =3D (u32) DST;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  337  		do_div(AX, (u32) SRC);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  338  		DST =3D (u32) AX;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  339  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  340  	ALU64_DIV_K:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  341  		DST =3D div64_u64(DST, IMM=
);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  342  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  343  	ALU_DIV_K:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  344  		AX =3D (u32) DST;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  345  		do_div(AX, (u32) IMM);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  346  		DST =3D (u32) AX;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  347  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  348  	ALU_END_TO_BE:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  349  		switch (IMM) {
11087cf7f27f46 Ard Biesheuvel 2020-10-28  350  		case 16:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  351  			DST =3D (__force u16) cpu=
_to_be16(DST);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  352  			break;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  353  		case 32:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  354  			DST =3D (__force u32) cpu=
_to_be32(DST);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  355  			break;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  356  		case 64:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  357  			DST =3D (__force u64) cpu=
_to_be64(DST);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  358  			break;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  359  		}
11087cf7f27f46 Ard Biesheuvel 2020-10-28  360  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  361  	ALU_END_TO_LE:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  362  		switch (IMM) {
11087cf7f27f46 Ard Biesheuvel 2020-10-28  363  		case 16:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  364  			DST =3D (__force u16) cpu=
_to_le16(DST);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  365  			break;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  366  		case 32:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  367  			DST =3D (__force u32) cpu=
_to_le32(DST);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  368  			break;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  369  		case 64:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  370  			DST =3D (__force u64) cpu=
_to_le64(DST);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  371  			break;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  372  		}
11087cf7f27f46 Ard Biesheuvel 2020-10-28  373  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  374  =

11087cf7f27f46 Ard Biesheuvel 2020-10-28  375  	/* CALL */
11087cf7f27f46 Ard Biesheuvel 2020-10-28  376  	JMP_CALL:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  377  		/* Function call scratches=
 BPF_R1-BPF_R5 registers,
11087cf7f27f46 Ard Biesheuvel 2020-10-28  378  		 * preserves BPF_R6-BPF_R9=
, and stores return value
11087cf7f27f46 Ard Biesheuvel 2020-10-28  379  		 * into BPF_R0.
11087cf7f27f46 Ard Biesheuvel 2020-10-28  380  		 */
11087cf7f27f46 Ard Biesheuvel 2020-10-28  381  		BPF_R0 =3D (__bpf_call_bas=
e + insn->imm)(BPF_R1, BPF_R2, BPF_R3,
11087cf7f27f46 Ard Biesheuvel 2020-10-28  382  						       BPF_R4, BPF_R5);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  383  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  384  =

11087cf7f27f46 Ard Biesheuvel 2020-10-28  385  	JMP_CALL_ARGS:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  386  		BPF_R0 =3D (__bpf_call_bas=
e_args + insn->imm)(BPF_R1, BPF_R2,
11087cf7f27f46 Ard Biesheuvel 2020-10-28  387  							    BPF_R3, BPF_R4,
11087cf7f27f46 Ard Biesheuvel 2020-10-28  388  							    BPF_R5,
11087cf7f27f46 Ard Biesheuvel 2020-10-28  389  							    insn + insn->off =
+ 1);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  390  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  391  =

11087cf7f27f46 Ard Biesheuvel 2020-10-28  392  	JMP_TAIL_CALL: {
11087cf7f27f46 Ard Biesheuvel 2020-10-28  393  		struct bpf_map *map =3D (s=
truct bpf_map *) (unsigned long) BPF_R2;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  394  		struct bpf_array *array =
=3D container_of(map, struct bpf_array, map);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  395  		struct bpf_prog *prog;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  396  		u32 index =3D BPF_R3;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  397  =

11087cf7f27f46 Ard Biesheuvel 2020-10-28  398  		if (unlikely(index >=3D ar=
ray->map.max_entries))
11087cf7f27f46 Ard Biesheuvel 2020-10-28  399  			goto out;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  400  		if (unlikely(tail_call_cnt=
 > MAX_TAIL_CALL_CNT))
11087cf7f27f46 Ard Biesheuvel 2020-10-28  401  			goto out;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  402  =

11087cf7f27f46 Ard Biesheuvel 2020-10-28  403  		tail_call_cnt++;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  404  =

11087cf7f27f46 Ard Biesheuvel 2020-10-28  405  		prog =3D READ_ONCE(array->=
ptrs[index]);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  406  		if (!prog)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  407  			goto out;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  408  =

11087cf7f27f46 Ard Biesheuvel 2020-10-28  409  		/* ARG1 at this point is g=
uaranteed to point to CTX from
11087cf7f27f46 Ard Biesheuvel 2020-10-28  410  		 * the verifier side due t=
o the fact that the tail call is
11087cf7f27f46 Ard Biesheuvel 2020-10-28  411  		 * handled like a helper, =
that is, bpf_tail_call_proto,
11087cf7f27f46 Ard Biesheuvel 2020-10-28  412  		 * where arg1_type is ARG_=
PTR_TO_CTX.
11087cf7f27f46 Ard Biesheuvel 2020-10-28  413  		 */
11087cf7f27f46 Ard Biesheuvel 2020-10-28  414  		insn =3D prog->insnsi;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  415  		goto select_insn;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  416  out:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  417  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  418  	}
11087cf7f27f46 Ard Biesheuvel 2020-10-28  419  	JMP_JA:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  420  		insn +=3D insn->off;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  421  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  422  	JMP_EXIT:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  423  		return BPF_R0;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  424  	/* JMP */
11087cf7f27f46 Ard Biesheuvel 2020-10-28  425  #define COND_JMP(SIGN, OPCOD=
E, CMP_OP)				\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  426  	JMP_##OPCODE##_X:					\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  427  		if ((SIGN##64) DST CMP_OP =
(SIGN##64) SRC) {	\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  428  			insn +=3D insn->off;			\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  429  			CONT_JMP;				\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  430  		}						\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  431  		CONT;						\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  432  	JMP32_##OPCODE##_X:					\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  433  		if ((SIGN##32) DST CMP_OP =
(SIGN##32) SRC) {	\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  434  			insn +=3D insn->off;			\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  435  			CONT_JMP;				\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  436  		}						\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  437  		CONT;						\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  438  	JMP_##OPCODE##_K:					\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  439  		if ((SIGN##64) DST CMP_OP =
(SIGN##64) IMM) {	\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  440  			insn +=3D insn->off;			\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  441  			CONT_JMP;				\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  442  		}						\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  443  		CONT;						\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  444  	JMP32_##OPCODE##_K:					\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  445  		if ((SIGN##32) DST CMP_OP =
(SIGN##32) IMM) {	\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  446  			insn +=3D insn->off;			\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  447  			CONT_JMP;				\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  448  		}						\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  449  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  450  	COND_JMP(u, JEQ, =3D=3D)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  451  	COND_JMP(u, JNE, !=3D)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  452  	COND_JMP(u, JGT, >)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  453  	COND_JMP(u, JLT, <)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  454  	COND_JMP(u, JGE, >=3D)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  455  	COND_JMP(u, JLE, <=3D)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  456  	COND_JMP(u, JSET, &)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  457  	COND_JMP(s, JSGT, >)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  458  	COND_JMP(s, JSLT, <)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  459  	COND_JMP(s, JSGE, >=3D)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  460  	COND_JMP(s, JSLE, <=3D)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  461  #undef COND_JMP
11087cf7f27f46 Ard Biesheuvel 2020-10-28  462  	/* STX and ST and LDX*/
11087cf7f27f46 Ard Biesheuvel 2020-10-28  463  #define LDST(SIZEOP, SIZE)		=
				\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  464  	STX_MEM_##SIZEOP:						\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  465  		*(SIZE *)(unsigned long) (=
DST + insn->off) =3D SRC;	\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  466  		CONT;							\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  467  	ST_MEM_##SIZEOP:						\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  468  		*(SIZE *)(unsigned long) (=
DST + insn->off) =3D IMM;	\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  469  		CONT;							\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  470  	LDX_MEM_##SIZEOP:						\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  471  		DST =3D *(SIZE *)(unsigned=
 long) (SRC + insn->off);	\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  472  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  473  =

11087cf7f27f46 Ard Biesheuvel 2020-10-28  474  	LDST(B,   u8)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  475  	LDST(H,  u16)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  476  	LDST(W,  u32)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  477  	LDST(DW, u64)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  478  #undef LDST
11087cf7f27f46 Ard Biesheuvel 2020-10-28  479  #define LDX_PROBE(SIZEOP, SI=
ZE)							\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  480  	LDX_PROBE_MEM_##SIZEOP:				=
			\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  481  		bpf_probe_read_kernel(&DST=
, SIZE, (const void *)(long) (SRC + insn->off));	\
11087cf7f27f46 Ard Biesheuvel 2020-10-28  482  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  483  	LDX_PROBE(B,  1)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  484  	LDX_PROBE(H,  2)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  485  	LDX_PROBE(W,  4)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  486  	LDX_PROBE(DW, 8)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  487  #undef LDX_PROBE
11087cf7f27f46 Ard Biesheuvel 2020-10-28  488  =

11087cf7f27f46 Ard Biesheuvel 2020-10-28  489  	STX_XADD_W: /* lock xadd *(=
u32 *)(dst_reg + off16) +=3D src_reg */
11087cf7f27f46 Ard Biesheuvel 2020-10-28  490  		atomic_add((u32) SRC, (ato=
mic_t *)(unsigned long)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  491  			   (DST + insn->off));
11087cf7f27f46 Ard Biesheuvel 2020-10-28  492  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  493  	STX_XADD_DW: /* lock xadd *=
(u64 *)(dst_reg + off16) +=3D src_reg */
11087cf7f27f46 Ard Biesheuvel 2020-10-28  494  		atomic64_add((u64) SRC, (a=
tomic64_t *)(unsigned long)
11087cf7f27f46 Ard Biesheuvel 2020-10-28  495  			     (DST + insn->off));
11087cf7f27f46 Ard Biesheuvel 2020-10-28  496  		CONT;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  497  =

11087cf7f27f46 Ard Biesheuvel 2020-10-28  498  	default_label:
11087cf7f27f46 Ard Biesheuvel 2020-10-28  499  		/* If we ever reach this, =
we have a bug somewhere. Die hard here
11087cf7f27f46 Ard Biesheuvel 2020-10-28  500  		 * instead of just returni=
ng 0; we could be somewhere in a subprog,
11087cf7f27f46 Ard Biesheuvel 2020-10-28  501  		 * so execution could cont=
inue otherwise which we do /not/ want.
11087cf7f27f46 Ard Biesheuvel 2020-10-28  502  		 *
11087cf7f27f46 Ard Biesheuvel 2020-10-28  503  		 * Note, verifier whitelis=
ts all opcodes in bpf_opcode_in_insntable().
11087cf7f27f46 Ard Biesheuvel 2020-10-28  504  		 */
11087cf7f27f46 Ard Biesheuvel 2020-10-28  505  		pr_warn("BPF interpreter: =
unknown opcode %02x\n", insn->code);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  506  		BUG_ON(1);
11087cf7f27f46 Ard Biesheuvel 2020-10-28  507  		return 0;
11087cf7f27f46 Ard Biesheuvel 2020-10-28  508  }
11087cf7f27f46 Ard Biesheuvel 2020-10-28  509  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1795834032903340907==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
E9merYYfPUGdZETlSv0/Yn2zijy+AQA=
--===============1795834032903340907==--

