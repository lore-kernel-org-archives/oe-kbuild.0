Content-Type: multipart/mixed; boundary="===============0678727372481734532=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next] bpf: Rename fixup_bpf_calls and add some comments
Date: Wed, 17 Feb 2021 19:28:53 +0800
Message-ID: <202102171945.ZeL2oe26-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0678727372481734532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210217104509.2423183-1-jackmanb@google.com>
References: <20210217104509.2423183-1-jackmanb@google.com>
TO: Brendan Jackman <jackmanb@google.com>
TO: bpf(a)vger.kernel.org
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Andrii Nakryiko <andrii.nakryiko@gmail.com>
CC: KP Singh <kpsingh@chromium.org>
CC: Florent Revest <revest@chromium.org>
CC: Brendan Jackman <jackmanb@google.com>

Hi Brendan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 45159b27637b0fef6d5ddb86fc7c46b13c77960f]

url:    https://github.com/0day-ci/linux/commits/Brendan-Jackman/bpf-Rename=
-fixup_bpf_calls-and-add-some-comments/20210217-185208
base:   45159b27637b0fef6d5ddb86fc7c46b13c77960f
:::::: branch date: 37 minutes ago
:::::: commit date: 37 minutes ago
config: x86_64-randconfig-m001-20210215 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/verifier.c:11832 do_misc_fixups() warn: ignoring unreachable cod=
e.

vim +11832 kernel/bpf/verifier.c

1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  11533  =

f64cacf58f39b9 Brendan Jackman    2021-02-17  11534  /* Do various post-ver=
ification rewrites in a single program pass.
f64cacf58f39b9 Brendan Jackman    2021-02-17  11535   * These rewrites simp=
lify JIT and interpreter implementations.
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11536   */
f64cacf58f39b9 Brendan Jackman    2021-02-17  11537  static int do_misc_fix=
ups(struct bpf_verifier_env *env)
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11538  {
79741b3bdec01a Alexei Starovoitov 2017-03-15  11539  	struct bpf_prog *prog=
 =3D env->prog;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11540  	bool expect_blinding =
=3D bpf_jit_blinding_enabled(prog);
79741b3bdec01a Alexei Starovoitov 2017-03-15  11541  	struct bpf_insn *insn=
 =3D prog->insnsi;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11542  	const struct bpf_func=
_proto *fn;
79741b3bdec01a Alexei Starovoitov 2017-03-15  11543  	const int insn_cnt =
=3D prog->len;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11544  	const struct bpf_map_=
ops *ops;
c93552c443ebc6 Daniel Borkmann    2018-05-24  11545  	struct bpf_insn_aux_d=
ata *aux;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11546  	struct bpf_insn insn_=
buf[16];
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11547  	struct bpf_prog *new_=
prog;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11548  	struct bpf_map *map_p=
tr;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11549  	int i, ret, cnt, delt=
a =3D 0;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11550  =

79741b3bdec01a Alexei Starovoitov 2017-03-15  11551  	for (i =3D 0; i < ins=
n_cnt; i++, insn++) {
f64cacf58f39b9 Brendan Jackman    2021-02-17  11552  		/* Make divide-by-ze=
ro exceptions impossible. */
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11553  		if (insn->code =3D=
=3D (BPF_ALU64 | BPF_MOD | BPF_X) ||
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11554  		    insn->code =3D=
=3D (BPF_ALU64 | BPF_DIV | BPF_X) ||
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11555  		    insn->code =3D=
=3D (BPF_ALU | BPF_MOD | BPF_X) ||
68fda450a7df51 Alexei Starovoitov 2018-01-12  11556  		    insn->code =3D=
=3D (BPF_ALU | BPF_DIV | BPF_X)) {
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11557  			bool is64 =3D BPF_C=
LASS(insn->code) =3D=3D BPF_ALU64;
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11558  			struct bpf_insn mas=
k_and_div[] =3D {
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11559  				BPF_MOV32_REG(insn=
->src_reg, insn->src_reg),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11560  				/* Rx div 0 -> 0 */
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11561  				BPF_JMP_IMM(BPF_JN=
E, insn->src_reg, 0, 2),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11562  				BPF_ALU32_REG(BPF_=
XOR, insn->dst_reg, insn->dst_reg),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11563  				BPF_JMP_IMM(BPF_JA=
, 0, 0, 1),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11564  				*insn,
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11565  			};
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11566  			struct bpf_insn mas=
k_and_mod[] =3D {
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11567  				BPF_MOV32_REG(insn=
->src_reg, insn->src_reg),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11568  				/* Rx mod 0 -> Rx =
*/
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11569  				BPF_JMP_IMM(BPF_JE=
Q, insn->src_reg, 0, 1),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11570  				*insn,
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11571  			};
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11572  			struct bpf_insn *pa=
tchlet;
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11573  =

f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11574  			if (insn->code =3D=
=3D (BPF_ALU64 | BPF_DIV | BPF_X) ||
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11575  			    insn->code =3D=
=3D (BPF_ALU | BPF_DIV | BPF_X)) {
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11576  				patchlet =3D mask_=
and_div + (is64 ? 1 : 0);
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11577  				cnt =3D ARRAY_SIZE=
(mask_and_div) - (is64 ? 1 : 0);
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11578  			} else {
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11579  				patchlet =3D mask_=
and_mod + (is64 ? 1 : 0);
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11580  				cnt =3D ARRAY_SIZE=
(mask_and_mod) - (is64 ? 1 : 0);
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11581  			}
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11582  =

f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  11583  			new_prog =3D bpf_pa=
tch_insn_data(env, i + delta, patchlet, cnt);
68fda450a7df51 Alexei Starovoitov 2018-01-12  11584  			if (!new_prog)
68fda450a7df51 Alexei Starovoitov 2018-01-12  11585  				return -ENOMEM;
68fda450a7df51 Alexei Starovoitov 2018-01-12  11586  =

68fda450a7df51 Alexei Starovoitov 2018-01-12  11587  			delta    +=3D cnt -=
 1;
68fda450a7df51 Alexei Starovoitov 2018-01-12  11588  			env->prog =3D prog =
=3D new_prog;
68fda450a7df51 Alexei Starovoitov 2018-01-12  11589  			insn      =3D new_p=
rog->insnsi + i + delta;
68fda450a7df51 Alexei Starovoitov 2018-01-12  11590  			continue;
68fda450a7df51 Alexei Starovoitov 2018-01-12  11591  		}
68fda450a7df51 Alexei Starovoitov 2018-01-12  11592  =

f64cacf58f39b9 Brendan Jackman    2021-02-17  11593  		/* Implement LD_ABS =
and LD_IND with a rewrite, if supported by the program type. */
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11594  		if (BPF_CLASS(insn->=
code) =3D=3D BPF_LD &&
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11595  		    (BPF_MODE(insn->=
code) =3D=3D BPF_ABS ||
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11596  		     BPF_MODE(insn->=
code) =3D=3D BPF_IND)) {
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11597  			cnt =3D env->ops->g=
en_ld_abs(insn, insn_buf);
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11598  			if (cnt =3D=3D 0 ||=
 cnt >=3D ARRAY_SIZE(insn_buf)) {
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11599  				verbose(env, "bpf =
verifier is misconfigured\n");
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11600  				return -EINVAL;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11601  			}
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11602  =

e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11603  			new_prog =3D bpf_pa=
tch_insn_data(env, i + delta, insn_buf, cnt);
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11604  			if (!new_prog)
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11605  				return -ENOMEM;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11606  =

e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11607  			delta    +=3D cnt -=
 1;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11608  			env->prog =3D prog =
=3D new_prog;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11609  			insn      =3D new_p=
rog->insnsi + i + delta;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11610  			continue;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11611  		}
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  11612  =

f64cacf58f39b9 Brendan Jackman    2021-02-17  11613  		/* Rewrite pointer a=
rithmetic to mitigate speculation attacks. */
979d63d50c0c0f Daniel Borkmann    2019-01-03  11614  		if (insn->code =3D=
=3D (BPF_ALU64 | BPF_ADD | BPF_X) ||
979d63d50c0c0f Daniel Borkmann    2019-01-03  11615  		    insn->code =3D=
=3D (BPF_ALU64 | BPF_SUB | BPF_X)) {
979d63d50c0c0f Daniel Borkmann    2019-01-03  11616  			const u8 code_add =
=3D BPF_ALU64 | BPF_ADD | BPF_X;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11617  			const u8 code_sub =
=3D BPF_ALU64 | BPF_SUB | BPF_X;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11618  			struct bpf_insn ins=
n_buf[16];
979d63d50c0c0f Daniel Borkmann    2019-01-03  11619  			struct bpf_insn *pa=
tch =3D &insn_buf[0];
979d63d50c0c0f Daniel Borkmann    2019-01-03  11620  			bool issrc, isneg;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11621  			u32 off_reg;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11622  =

979d63d50c0c0f Daniel Borkmann    2019-01-03  11623  			aux =3D &env->insn_=
aux_data[i + delta];
3612af783cf52c Daniel Borkmann    2019-03-01  11624  			if (!aux->alu_state=
 ||
3612af783cf52c Daniel Borkmann    2019-03-01  11625  			    aux->alu_state =
=3D=3D BPF_ALU_NON_POINTER)
979d63d50c0c0f Daniel Borkmann    2019-01-03  11626  				continue;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11627  =

979d63d50c0c0f Daniel Borkmann    2019-01-03  11628  			isneg =3D aux->alu_=
state & BPF_ALU_NEG_VALUE;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11629  			issrc =3D (aux->alu=
_state & BPF_ALU_SANITIZE) =3D=3D
979d63d50c0c0f Daniel Borkmann    2019-01-03  11630  				BPF_ALU_SANITIZE_S=
RC;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11631  =

979d63d50c0c0f Daniel Borkmann    2019-01-03  11632  			off_reg =3D issrc ?=
 insn->src_reg : insn->dst_reg;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11633  			if (isneg)
979d63d50c0c0f Daniel Borkmann    2019-01-03  11634  				*patch++ =3D BPF_A=
LU64_IMM(BPF_MUL, off_reg, -1);
979d63d50c0c0f Daniel Borkmann    2019-01-03  11635  			*patch++ =3D BPF_MO=
V32_IMM(BPF_REG_AX, aux->alu_limit - 1);
979d63d50c0c0f Daniel Borkmann    2019-01-03  11636  			*patch++ =3D BPF_AL=
U64_REG(BPF_SUB, BPF_REG_AX, off_reg);
979d63d50c0c0f Daniel Borkmann    2019-01-03  11637  			*patch++ =3D BPF_AL=
U64_REG(BPF_OR, BPF_REG_AX, off_reg);
979d63d50c0c0f Daniel Borkmann    2019-01-03  11638  			*patch++ =3D BPF_AL=
U64_IMM(BPF_NEG, BPF_REG_AX, 0);
979d63d50c0c0f Daniel Borkmann    2019-01-03  11639  			*patch++ =3D BPF_AL=
U64_IMM(BPF_ARSH, BPF_REG_AX, 63);
979d63d50c0c0f Daniel Borkmann    2019-01-03  11640  			if (issrc) {
979d63d50c0c0f Daniel Borkmann    2019-01-03  11641  				*patch++ =3D BPF_A=
LU64_REG(BPF_AND, BPF_REG_AX,
979d63d50c0c0f Daniel Borkmann    2019-01-03  11642  							 off_reg);
979d63d50c0c0f Daniel Borkmann    2019-01-03  11643  				insn->src_reg =3D =
BPF_REG_AX;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11644  			} else {
979d63d50c0c0f Daniel Borkmann    2019-01-03  11645  				*patch++ =3D BPF_A=
LU64_REG(BPF_AND, off_reg,
979d63d50c0c0f Daniel Borkmann    2019-01-03  11646  							 BPF_REG_AX);
979d63d50c0c0f Daniel Borkmann    2019-01-03  11647  			}
979d63d50c0c0f Daniel Borkmann    2019-01-03  11648  			if (isneg)
979d63d50c0c0f Daniel Borkmann    2019-01-03  11649  				insn->code =3D ins=
n->code =3D=3D code_add ?
979d63d50c0c0f Daniel Borkmann    2019-01-03  11650  					     code_sub : c=
ode_add;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11651  			*patch++ =3D *insn;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11652  			if (issrc && isneg)
979d63d50c0c0f Daniel Borkmann    2019-01-03  11653  				*patch++ =3D BPF_A=
LU64_IMM(BPF_MUL, off_reg, -1);
979d63d50c0c0f Daniel Borkmann    2019-01-03  11654  			cnt =3D patch - ins=
n_buf;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11655  =

979d63d50c0c0f Daniel Borkmann    2019-01-03  11656  			new_prog =3D bpf_pa=
tch_insn_data(env, i + delta, insn_buf, cnt);
979d63d50c0c0f Daniel Borkmann    2019-01-03  11657  			if (!new_prog)
979d63d50c0c0f Daniel Borkmann    2019-01-03  11658  				return -ENOMEM;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11659  =

979d63d50c0c0f Daniel Borkmann    2019-01-03  11660  			delta    +=3D cnt -=
 1;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11661  			env->prog =3D prog =
=3D new_prog;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11662  			insn      =3D new_p=
rog->insnsi + i + delta;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11663  			continue;
979d63d50c0c0f Daniel Borkmann    2019-01-03  11664  		}
979d63d50c0c0f Daniel Borkmann    2019-01-03  11665  =

79741b3bdec01a Alexei Starovoitov 2017-03-15  11666  		if (insn->code !=3D =
(BPF_JMP | BPF_CALL))
79741b3bdec01a Alexei Starovoitov 2017-03-15  11667  			continue;
cc8b0b92a1699b Alexei Starovoitov 2017-12-14  11668  		if (insn->src_reg =
=3D=3D BPF_PSEUDO_CALL)
cc8b0b92a1699b Alexei Starovoitov 2017-12-14  11669  			continue;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11670  =

e245c5c6a5656e Alexei Starovoitov 2017-03-15  11671  		if (insn->imm =3D=3D=
 BPF_FUNC_get_route_realm)
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11672  			prog->dst_needed =
=3D 1;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11673  		if (insn->imm =3D=3D=
 BPF_FUNC_get_prandom_u32)
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11674  			bpf_user_rnd_init_o=
nce();
9802d86585db91 Josef Bacik        2017-12-11  11675  		if (insn->imm =3D=3D=
 BPF_FUNC_override_return)
9802d86585db91 Josef Bacik        2017-12-11  11676  			prog->kprobe_overri=
de =3D 1;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11677  		if (insn->imm =3D=3D=
 BPF_FUNC_tail_call) {
7b9f6da175f938 David S. Miller    2017-04-20  11678  			/* If we tail call =
into other programs, we
7b9f6da175f938 David S. Miller    2017-04-20  11679  			 * cannot make any =
assumptions since they can
7b9f6da175f938 David S. Miller    2017-04-20  11680  			 * be replaced dyna=
mically during runtime in
7b9f6da175f938 David S. Miller    2017-04-20  11681  			 * the program arra=
y.
7b9f6da175f938 David S. Miller    2017-04-20  11682  			 */
7b9f6da175f938 David S. Miller    2017-04-20  11683  			prog->cb_access =3D=
 1;
e411901c0b775a Maciej Fijalkowski 2020-09-16  11684  			if (!allow_tail_cal=
l_in_subprogs(env))
e411901c0b775a Maciej Fijalkowski 2020-09-16  11685  				prog->aux->stack_d=
epth =3D MAX_BPF_STACK;
e411901c0b775a Maciej Fijalkowski 2020-09-16  11686  			prog->aux->max_pkt_=
offset =3D MAX_PACKET_OFF;
7b9f6da175f938 David S. Miller    2017-04-20  11687  =

79741b3bdec01a Alexei Starovoitov 2017-03-15  11688  			/* mark bpf_tail_ca=
ll as different opcode to avoid
79741b3bdec01a Alexei Starovoitov 2017-03-15  11689  			 * conditional bran=
ch in the interpeter for every normal
79741b3bdec01a Alexei Starovoitov 2017-03-15  11690  			 * call and to prev=
ent accidental JITing by JIT compiler
79741b3bdec01a Alexei Starovoitov 2017-03-15  11691  			 * that doesn't sup=
port bpf_tail_call yet
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11692  			 */
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11693  			insn->imm =3D 0;
71189fa9b092ef Alexei Starovoitov 2017-05-30  11694  			insn->code =3D BPF_=
JMP | BPF_TAIL_CALL;
b2157399cc9898 Alexei Starovoitov 2018-01-07  11695  =

c93552c443ebc6 Daniel Borkmann    2018-05-24  11696  			aux =3D &env->insn_=
aux_data[i + delta];
2c78ee898d8f10 Alexei Starovoitov 2020-05-13  11697  			if (env->bpf_capabl=
e && !expect_blinding &&
cc52d9140aa920 Daniel Borkmann    2019-12-19  11698  			    prog->jit_reque=
sted &&
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11699  			    !bpf_map_key_po=
isoned(aux) &&
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11700  			    !bpf_map_ptr_po=
isoned(aux) &&
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11701  			    !bpf_map_ptr_un=
priv(aux)) {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11702  				struct bpf_jit_pok=
e_descriptor desc =3D {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11703  					.reason =3D BPF_P=
OKE_REASON_TAIL_CALL,
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11704  					.tail_call.map =
=3D BPF_MAP_PTR(aux->map_ptr_state),
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11705  					.tail_call.key =
=3D bpf_map_key_immediate(aux),
a748c6975dea32 Maciej Fijalkowski 2020-09-16  11706  					.insn_idx =3D i +=
 delta,
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11707  				};
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11708  =

d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11709  				ret =3D bpf_jit_ad=
d_poke_descriptor(prog, &desc);
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11710  				if (ret < 0) {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11711  					verbose(env, "add=
ing tail call poke descriptor failed\n");
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11712  					return ret;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11713  				}
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11714  =

d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11715  				insn->imm =3D ret =
+ 1;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11716  				continue;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11717  			}
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11718  =

c93552c443ebc6 Daniel Borkmann    2018-05-24  11719  			if (!bpf_map_ptr_un=
priv(aux))
c93552c443ebc6 Daniel Borkmann    2018-05-24  11720  				continue;
c93552c443ebc6 Daniel Borkmann    2018-05-24  11721  =

b2157399cc9898 Alexei Starovoitov 2018-01-07  11722  			/* instead of chang=
ing every JIT dealing with tail_call
b2157399cc9898 Alexei Starovoitov 2018-01-07  11723  			 * emit two extra i=
nsns:
b2157399cc9898 Alexei Starovoitov 2018-01-07  11724  			 * if (index >=3D m=
ax_entries) goto out;
b2157399cc9898 Alexei Starovoitov 2018-01-07  11725  			 * index &=3D array=
->index_mask;
b2157399cc9898 Alexei Starovoitov 2018-01-07  11726  			 * to avoid out-of-=
bounds cpu speculation
b2157399cc9898 Alexei Starovoitov 2018-01-07  11727  			 */
c93552c443ebc6 Daniel Borkmann    2018-05-24  11728  			if (bpf_map_ptr_poi=
soned(aux)) {
40950343932879 Colin Ian King     2018-01-10  11729  				verbose(env, "tail=
_call abusing map_ptr\n");
b2157399cc9898 Alexei Starovoitov 2018-01-07  11730  				return -EINVAL;
b2157399cc9898 Alexei Starovoitov 2018-01-07  11731  			}
c93552c443ebc6 Daniel Borkmann    2018-05-24  11732  =

d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11733  			map_ptr =3D BPF_MAP=
_PTR(aux->map_ptr_state);
b2157399cc9898 Alexei Starovoitov 2018-01-07  11734  			insn_buf[0] =3D BPF=
_JMP_IMM(BPF_JGE, BPF_REG_3,
b2157399cc9898 Alexei Starovoitov 2018-01-07  11735  						  map_ptr->max_e=
ntries, 2);
b2157399cc9898 Alexei Starovoitov 2018-01-07  11736  			insn_buf[1] =3D BPF=
_ALU32_IMM(BPF_AND, BPF_REG_3,
b2157399cc9898 Alexei Starovoitov 2018-01-07  11737  						    container_of=
(map_ptr,
b2157399cc9898 Alexei Starovoitov 2018-01-07  11738  								 struct bpf_ar=
ray,
b2157399cc9898 Alexei Starovoitov 2018-01-07  11739  								 map)->index_m=
ask);
b2157399cc9898 Alexei Starovoitov 2018-01-07  11740  			insn_buf[2] =3D *in=
sn;
b2157399cc9898 Alexei Starovoitov 2018-01-07  11741  			cnt =3D 3;
b2157399cc9898 Alexei Starovoitov 2018-01-07  11742  			new_prog =3D bpf_pa=
tch_insn_data(env, i + delta, insn_buf, cnt);
b2157399cc9898 Alexei Starovoitov 2018-01-07  11743  			if (!new_prog)
b2157399cc9898 Alexei Starovoitov 2018-01-07  11744  				return -ENOMEM;
b2157399cc9898 Alexei Starovoitov 2018-01-07  11745  =

b2157399cc9898 Alexei Starovoitov 2018-01-07  11746  			delta    +=3D cnt -=
 1;
b2157399cc9898 Alexei Starovoitov 2018-01-07  11747  			env->prog =3D prog =
=3D new_prog;
b2157399cc9898 Alexei Starovoitov 2018-01-07  11748  			insn      =3D new_p=
rog->insnsi + i + delta;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11749  			continue;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11750  		}
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11751  =

89c63074c2bc25 Daniel Borkmann    2017-08-19  11752  		/* BPF_EMIT_CALL() a=
ssumptions in some of the map_gen_lookup
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11753  		 * and other inlinin=
g handlers are currently limited to 64 bit
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11754  		 * only.
89c63074c2bc25 Daniel Borkmann    2017-08-19  11755  		 */
60b58afc96c9df Alexei Starovoitov 2017-12-14  11756  		if (prog->jit_reques=
ted && BITS_PER_LONG =3D=3D 64 &&
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11757  		    (insn->imm =3D=
=3D BPF_FUNC_map_lookup_elem ||
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11758  		     insn->imm =3D=
=3D BPF_FUNC_map_update_elem ||
84430d4232c36c Daniel Borkmann    2018-10-21  11759  		     insn->imm =3D=
=3D BPF_FUNC_map_delete_elem ||
84430d4232c36c Daniel Borkmann    2018-10-21  11760  		     insn->imm =3D=
=3D BPF_FUNC_map_push_elem   ||
84430d4232c36c Daniel Borkmann    2018-10-21  11761  		     insn->imm =3D=
=3D BPF_FUNC_map_pop_elem    ||
84430d4232c36c Daniel Borkmann    2018-10-21  11762  		     insn->imm =3D=
=3D BPF_FUNC_map_peek_elem)) {
c93552c443ebc6 Daniel Borkmann    2018-05-24  11763  			aux =3D &env->insn_=
aux_data[i + delta];
c93552c443ebc6 Daniel Borkmann    2018-05-24  11764  			if (bpf_map_ptr_poi=
soned(aux))
c93552c443ebc6 Daniel Borkmann    2018-05-24  11765  				goto patch_call_im=
m;
c93552c443ebc6 Daniel Borkmann    2018-05-24  11766  =

d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11767  			map_ptr =3D BPF_MAP=
_PTR(aux->map_ptr_state);
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11768  			ops =3D map_ptr->op=
s;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11769  			if (insn->imm =3D=
=3D BPF_FUNC_map_lookup_elem &&
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11770  			    ops->map_gen_lo=
okup) {
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11771  				cnt =3D ops->map_g=
en_lookup(map_ptr, insn_buf);
4a8f87e60f6db4 Daniel Borkmann    2020-10-11  11772  				if (cnt =3D=3D -EO=
PNOTSUPP)
4a8f87e60f6db4 Daniel Borkmann    2020-10-11  11773  					goto patch_map_op=
s_generic;
4a8f87e60f6db4 Daniel Borkmann    2020-10-11  11774  				if (cnt <=3D 0 || =
cnt >=3D ARRAY_SIZE(insn_buf)) {
61bd5218eef349 Jakub Kicinski     2017-10-09  11775  					verbose(env, "bpf=
 verifier is misconfigured\n");
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11776  					return -EINVAL;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11777  				}
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11778  =

09772d92cd5ad9 Daniel Borkmann    2018-06-02  11779  				new_prog =3D bpf_p=
atch_insn_data(env, i + delta,
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11780  							       insn_buf=
, cnt);
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11781  				if (!new_prog)
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11782  					return -ENOMEM;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11783  =

81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11784  				delta    +=3D cnt =
- 1;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11785  				env->prog =3D prog=
 =3D new_prog;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11786  				insn      =3D new_=
prog->insnsi + i + delta;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11787  				continue;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11788  			}
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11789  =

09772d92cd5ad9 Daniel Borkmann    2018-06-02  11790  			BUILD_BUG_ON(!__sam=
e_type(ops->map_lookup_elem,
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11791  				     (void *(*)(st=
ruct bpf_map *map, void *key))NULL));
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11792  			BUILD_BUG_ON(!__sam=
e_type(ops->map_delete_elem,
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11793  				     (int (*)(stru=
ct bpf_map *map, void *key))NULL));
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11794  			BUILD_BUG_ON(!__sam=
e_type(ops->map_update_elem,
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11795  				     (int (*)(stru=
ct bpf_map *map, void *key, void *value,
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11796  					      u64 flags))=
NULL));
84430d4232c36c Daniel Borkmann    2018-10-21  11797  			BUILD_BUG_ON(!__sam=
e_type(ops->map_push_elem,
84430d4232c36c Daniel Borkmann    2018-10-21  11798  				     (int (*)(stru=
ct bpf_map *map, void *value,
84430d4232c36c Daniel Borkmann    2018-10-21  11799  					      u64 flags))=
NULL));
84430d4232c36c Daniel Borkmann    2018-10-21  11800  			BUILD_BUG_ON(!__sam=
e_type(ops->map_pop_elem,
84430d4232c36c Daniel Borkmann    2018-10-21  11801  				     (int (*)(stru=
ct bpf_map *map, void *value))NULL));
84430d4232c36c Daniel Borkmann    2018-10-21  11802  			BUILD_BUG_ON(!__sam=
e_type(ops->map_peek_elem,
84430d4232c36c Daniel Borkmann    2018-10-21  11803  				     (int (*)(stru=
ct bpf_map *map, void *value))NULL));
4a8f87e60f6db4 Daniel Borkmann    2020-10-11  11804  patch_map_ops_generic:
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11805  			switch (insn->imm) {
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11806  			case BPF_FUNC_map_l=
ookup_elem:
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11807  				insn->imm =3D BPF_=
CAST_CALL(ops->map_lookup_elem) -
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11808  					    __bpf_call_ba=
se;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11809  				continue;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11810  			case BPF_FUNC_map_u=
pdate_elem:
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11811  				insn->imm =3D BPF_=
CAST_CALL(ops->map_update_elem) -
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11812  					    __bpf_call_ba=
se;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11813  				continue;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11814  			case BPF_FUNC_map_d=
elete_elem:
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11815  				insn->imm =3D BPF_=
CAST_CALL(ops->map_delete_elem) -
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11816  					    __bpf_call_ba=
se;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11817  				continue;
84430d4232c36c Daniel Borkmann    2018-10-21  11818  			case BPF_FUNC_map_p=
ush_elem:
84430d4232c36c Daniel Borkmann    2018-10-21  11819  				insn->imm =3D BPF_=
CAST_CALL(ops->map_push_elem) -
84430d4232c36c Daniel Borkmann    2018-10-21  11820  					    __bpf_call_ba=
se;
84430d4232c36c Daniel Borkmann    2018-10-21  11821  				continue;
84430d4232c36c Daniel Borkmann    2018-10-21  11822  			case BPF_FUNC_map_p=
op_elem:
84430d4232c36c Daniel Borkmann    2018-10-21  11823  				insn->imm =3D BPF_=
CAST_CALL(ops->map_pop_elem) -
84430d4232c36c Daniel Borkmann    2018-10-21  11824  					    __bpf_call_ba=
se;
84430d4232c36c Daniel Borkmann    2018-10-21  11825  				continue;
84430d4232c36c Daniel Borkmann    2018-10-21  11826  			case BPF_FUNC_map_p=
eek_elem:
84430d4232c36c Daniel Borkmann    2018-10-21  11827  				insn->imm =3D BPF_=
CAST_CALL(ops->map_peek_elem) -
84430d4232c36c Daniel Borkmann    2018-10-21  11828  					    __bpf_call_ba=
se;
84430d4232c36c Daniel Borkmann    2018-10-21  11829  				continue;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11830  			}
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11831  =

09772d92cd5ad9 Daniel Borkmann    2018-06-02 @11832  			goto patch_call_imm;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11833  		}
09772d92cd5ad9 Daniel Borkmann    2018-06-02  11834  =

f64cacf58f39b9 Brendan Jackman    2021-02-17  11835  		/* Implement bpf_jif=
fies64 inline. */
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11836  		if (prog->jit_reques=
ted && BITS_PER_LONG =3D=3D 64 &&
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11837  		    insn->imm =3D=3D=
 BPF_FUNC_jiffies64) {
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11838  			struct bpf_insn ld_=
jiffies_addr[2] =3D {
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11839  				BPF_LD_IMM64(BPF_R=
EG_0,
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11840  					     (unsigned lo=
ng)&jiffies),
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11841  			};
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11842  =

5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11843  			insn_buf[0] =3D ld_=
jiffies_addr[0];
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11844  			insn_buf[1] =3D ld_=
jiffies_addr[1];
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11845  			insn_buf[2] =3D BPF=
_LDX_MEM(BPF_DW, BPF_REG_0,
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11846  						  BPF_REG_0, 0);
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11847  			cnt =3D 3;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11848  =

5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11849  			new_prog =3D bpf_pa=
tch_insn_data(env, i + delta, insn_buf,
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11850  						       cnt);
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11851  			if (!new_prog)
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11852  				return -ENOMEM;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11853  =

5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11854  			delta    +=3D cnt -=
 1;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11855  			env->prog =3D prog =
=3D new_prog;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11856  			insn      =3D new_p=
rog->insnsi + i + delta;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11857  			continue;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11858  		}
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  11859  =

81ed18ab3098b6 Alexei Starovoitov 2017-03-15  11860  patch_call_imm:
5e43f899b03a34 Andrey Ignatov     2018-03-30  11861  		fn =3D env->ops->get=
_func_proto(insn->imm, env->prog);
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11862  		/* all functions tha=
t have prototype and verifier allowed
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11863  		 * programs to call =
them, must be real in-kernel functions
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11864  		 */
79741b3bdec01a Alexei Starovoitov 2017-03-15  11865  		if (!fn->func) {
61bd5218eef349 Jakub Kicinski     2017-10-09  11866  			verbose(env,
61bd5218eef349 Jakub Kicinski     2017-10-09  11867  				"kernel subsystem =
misconfigured func %s#%d\n",
79741b3bdec01a Alexei Starovoitov 2017-03-15  11868  				func_id_name(insn-=
>imm), insn->imm);
79741b3bdec01a Alexei Starovoitov 2017-03-15  11869  			return -EFAULT;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11870  		}
79741b3bdec01a Alexei Starovoitov 2017-03-15  11871  		insn->imm =3D fn->fu=
nc - __bpf_call_base;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11872  	}
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11873  =

d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11874  	/* Since poke tab is =
now finalized, publish aux to tracker. */
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11875  	for (i =3D 0; i < pro=
g->aux->size_poke_tab; i++) {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11876  		map_ptr =3D prog->au=
x->poke_tab[i].tail_call.map;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11877  		if (!map_ptr->ops->m=
ap_poke_track ||
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11878  		    !map_ptr->ops->m=
ap_poke_untrack ||
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11879  		    !map_ptr->ops->m=
ap_poke_run) {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11880  			verbose(env, "bpf v=
erifier is misconfigured\n");
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11881  			return -EINVAL;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11882  		}
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11883  =

d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11884  		ret =3D map_ptr->ops=
->map_poke_track(map_ptr, prog->aux);
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11885  		if (ret < 0) {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11886  			verbose(env, "track=
ing tail call prog failed\n");
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11887  			return ret;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11888  		}
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11889  	}
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  11890  =

79741b3bdec01a Alexei Starovoitov 2017-03-15  11891  	return 0;
79741b3bdec01a Alexei Starovoitov 2017-03-15  11892  }
e245c5c6a5656e Alexei Starovoitov 2017-03-15  11893  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============0678727372481734532==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICO74LGAAAy5jb25maWcAjFzLc9w20r/nr5hyLskhWUmWppz6SgeQBIewSIIByNGMLihFHntV
K0v59NjY//12A3wAYHOSPWw86Cae/fh1o6Eff/hxxd5en77evt7f3T48fF99OTwenm9fD59Wn+8f
Dv+3yuSqlu2KZ6L9FZjL+8e3b//69mFt1ueri19PT389+eX57nx1dXh+PDys0qfHz/df3qCD+6fH
H378IZV1LjYmTc2WKy1kbVq+ay/ffbm7++W31U/Z4Y/728fVb7++h25OL352/3rnfSa02aTp5feh
aTN1dfnbyfuTk4FQZmP72fuLE/u/sZ+S1ZuRPH3ifXPijZmy2pSivppG9RqNblkr0oBWMG2YrsxG
tpIkiBo+5R5J1rpVXdpKpadWoX4311J54yadKLNWVNy0LCm50VK1E7UtFGcZdJ5L+D9g0fgp7PqP
q409xYfVy+H17c/pHEQtWsPrrWEKli8q0V6+PwP2cVpVI2CYlut2df+yenx6xR4mho41whQwKFcz
pmFTZcrKYVffvaOaDev8fbKLNJqVrcdfsC03V1zVvDSbG9FM7D4lAcoZTSpvKkZTdjdLX8glwjlN
uNFtBpRxe7z5ktvnz/oYA879GH13c/xreZx8ThxbuKK+MeM568rWio13NkNzIXVbs4pfvvvp8enx
8PPIoPd6KxpPR/oG/G/alv6WNVKLnal+73jHiWldszYtjKV62qOk1qbilVR7w9qWpYXfZad5KRJy
C1gHZowYxh4qUzCU5cBpsrIclAn0cvXy9sfL95fXw9dJmTa85kqkVm0bJRNvhj5JF/KapvA852kr
cOg8N5VT34iv4XUmamsb6E4qsVFgkEDZSLKoP+IYPrlgKgOSNvraKK5hgNAEZbJiog7btKgoJlMI
rnDf9guTY62C44W9BPUHY0dz4STU1i7CVDLj4Ui5VCnPemMHW+FJVcOU5stbk/Gk2+Taysbh8dPq
6XN0lJN/kOmVlh0M5CQuk94wVi58FqsO36mPt6wUGWu5KZluTbpPS0IorD3fTjIWkW1/fMvrVh8l
mkRJlqUw0HG2Co6JZR87kq+S2nQNTjmycE4v06az01XaepfBO1mtaO+/Hp5fKMUA93hlZM1B8r0x
a2mKG3QxlRXGUSehsYHJyEykpM6670RWUvbBEfPO30j4D4IM0yqWXjmB8TxcSHPStdRxME2xKVBS
+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
--===============0678727372481734532==--

