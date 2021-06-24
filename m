Content-Type: multipart/mixed; boundary="===============5129674221398921620=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ast:timer 1/5] kernel/bpf/verifier.c:12619 do_misc_fixups() warn: mask and shift to zero
Date: Thu, 24 Jun 2021 20:03:06 +0800
Message-ID: <202106242055.VSYxVKxg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5129674221398921620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git timer
head:   8b4fedbf17fa8b6129fa4c61607c574595348fe9
commit: 068cd1f2f98ebc27a36e40a177464f9dae8f7f98 [1/5] bpf: Introduce bpf t=
imers.
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-m021-20210622 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/verifier.c:12619 do_misc_fixups() warn: mask and shift to zero

vim +12619 kernel/bpf/verifier.c

e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  12385  =

e6ac593372aada Brendan Jackman    2021-02-17  12386  /* Do various post-ver=
ification rewrites in a single program pass.
e6ac593372aada Brendan Jackman    2021-02-17  12387   * These rewrites simp=
lify JIT and interpreter implementations.
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12388   */
e6ac593372aada Brendan Jackman    2021-02-17  12389  static int do_misc_fix=
ups(struct bpf_verifier_env *env)
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12390  {
79741b3bdec01a Alexei Starovoitov 2017-03-15  12391  	struct bpf_prog *prog=
 =3D env->prog;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12392  	bool expect_blinding =
=3D bpf_jit_blinding_enabled(prog);
79741b3bdec01a Alexei Starovoitov 2017-03-15  12393  	struct bpf_insn *insn=
 =3D prog->insnsi;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12394  	const struct bpf_func=
_proto *fn;
79741b3bdec01a Alexei Starovoitov 2017-03-15  12395  	const int insn_cnt =
=3D prog->len;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12396  	const struct bpf_map_=
ops *ops;
c93552c443ebc6 Daniel Borkmann    2018-05-24  12397  	struct bpf_insn_aux_d=
ata *aux;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12398  	struct bpf_insn insn_=
buf[16];
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12399  	struct bpf_prog *new_=
prog;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12400  	struct bpf_map *map_p=
tr;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12401  	int i, ret, cnt, delt=
a =3D 0;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12402  =

79741b3bdec01a Alexei Starovoitov 2017-03-15  12403  	for (i =3D 0; i < ins=
n_cnt; i++, insn++) {
e6ac593372aada Brendan Jackman    2021-02-17  12404  		/* Make divide-by-ze=
ro exceptions impossible. */
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  12405  		if (insn->code =3D=
=3D (BPF_ALU64 | BPF_MOD | BPF_X) ||
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  12406  		    insn->code =3D=
=3D (BPF_ALU64 | BPF_DIV | BPF_X) ||
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  12407  		    insn->code =3D=
=3D (BPF_ALU | BPF_MOD | BPF_X) ||
68fda450a7df51 Alexei Starovoitov 2018-01-12  12408  		    insn->code =3D=
=3D (BPF_ALU | BPF_DIV | BPF_X)) {
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  12409  			bool is64 =3D BPF_C=
LASS(insn->code) =3D=3D BPF_ALU64;
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  12410  			bool isdiv =3D BPF_=
OP(insn->code) =3D=3D BPF_DIV;
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  12411  			struct bpf_insn *pa=
tchlet;
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  12412  			struct bpf_insn chk=
_and_div[] =3D {
9b00f1b7880930 Daniel Borkmann    2021-02-10  12413  				/* [R,W]x div 0 ->=
 0 */
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  12414  				BPF_RAW_INSN((is64=
 ? BPF_JMP : BPF_JMP32) |
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  12415  					     BPF_JNE | BP=
F_K, insn->src_reg,
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  12416  					     0, 2, 0),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  12417  				BPF_ALU32_REG(BPF_=
XOR, insn->dst_reg, insn->dst_reg),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  12418  				BPF_JMP_IMM(BPF_JA=
, 0, 0, 1),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  12419  				*insn,
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  12420  			};
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  12421  			struct bpf_insn chk=
_and_mod[] =3D {
9b00f1b7880930 Daniel Borkmann    2021-02-10  12422  				/* [R,W]x mod 0 ->=
 [R,W]x */
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  12423  				BPF_RAW_INSN((is64=
 ? BPF_JMP : BPF_JMP32) |
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  12424  					     BPF_JEQ | BP=
F_K, insn->src_reg,
9b00f1b7880930 Daniel Borkmann    2021-02-10  12425  					     0, 1 + (is64=
 ? 0 : 1), 0),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  12426  				*insn,
9b00f1b7880930 Daniel Borkmann    2021-02-10  12427  				BPF_JMP_IMM(BPF_JA=
, 0, 0, 1),
9b00f1b7880930 Daniel Borkmann    2021-02-10  12428  				BPF_MOV32_REG(insn=
->dst_reg, insn->dst_reg),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  12429  			};
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  12430  =

e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  12431  			patchlet =3D isdiv =
? chk_and_div : chk_and_mod;
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  12432  			cnt =3D isdiv ? ARR=
AY_SIZE(chk_and_div) :
9b00f1b7880930 Daniel Borkmann    2021-02-10  12433  				      ARRAY_SIZE(c=
hk_and_mod) - (is64 ? 2 : 0);
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  12434  =

f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  12435  			new_prog =3D bpf_pa=
tch_insn_data(env, i + delta, patchlet, cnt);
68fda450a7df51 Alexei Starovoitov 2018-01-12  12436  			if (!new_prog)
68fda450a7df51 Alexei Starovoitov 2018-01-12  12437  				return -ENOMEM;
68fda450a7df51 Alexei Starovoitov 2018-01-12  12438  =

68fda450a7df51 Alexei Starovoitov 2018-01-12  12439  			delta    +=3D cnt -=
 1;
68fda450a7df51 Alexei Starovoitov 2018-01-12  12440  			env->prog =3D prog =
=3D new_prog;
68fda450a7df51 Alexei Starovoitov 2018-01-12  12441  			insn      =3D new_p=
rog->insnsi + i + delta;
68fda450a7df51 Alexei Starovoitov 2018-01-12  12442  			continue;
68fda450a7df51 Alexei Starovoitov 2018-01-12  12443  		}
68fda450a7df51 Alexei Starovoitov 2018-01-12  12444  =

e6ac593372aada Brendan Jackman    2021-02-17  12445  		/* Implement LD_ABS =
and LD_IND with a rewrite, if supported by the program type. */
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12446  		if (BPF_CLASS(insn->=
code) =3D=3D BPF_LD &&
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12447  		    (BPF_MODE(insn->=
code) =3D=3D BPF_ABS ||
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12448  		     BPF_MODE(insn->=
code) =3D=3D BPF_IND)) {
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12449  			cnt =3D env->ops->g=
en_ld_abs(insn, insn_buf);
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12450  			if (cnt =3D=3D 0 ||=
 cnt >=3D ARRAY_SIZE(insn_buf)) {
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12451  				verbose(env, "bpf =
verifier is misconfigured\n");
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12452  				return -EINVAL;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12453  			}
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12454  =

e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12455  			new_prog =3D bpf_pa=
tch_insn_data(env, i + delta, insn_buf, cnt);
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12456  			if (!new_prog)
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12457  				return -ENOMEM;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12458  =

e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12459  			delta    +=3D cnt -=
 1;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12460  			env->prog =3D prog =
=3D new_prog;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12461  			insn      =3D new_p=
rog->insnsi + i + delta;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12462  			continue;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12463  		}
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  12464  =

e6ac593372aada Brendan Jackman    2021-02-17  12465  		/* Rewrite pointer a=
rithmetic to mitigate speculation attacks. */
979d63d50c0c0f Daniel Borkmann    2019-01-03  12466  		if (insn->code =3D=
=3D (BPF_ALU64 | BPF_ADD | BPF_X) ||
979d63d50c0c0f Daniel Borkmann    2019-01-03  12467  		    insn->code =3D=
=3D (BPF_ALU64 | BPF_SUB | BPF_X)) {
979d63d50c0c0f Daniel Borkmann    2019-01-03  12468  			const u8 code_add =
=3D BPF_ALU64 | BPF_ADD | BPF_X;
979d63d50c0c0f Daniel Borkmann    2019-01-03  12469  			const u8 code_sub =
=3D BPF_ALU64 | BPF_SUB | BPF_X;
979d63d50c0c0f Daniel Borkmann    2019-01-03  12470  			struct bpf_insn *pa=
tch =3D &insn_buf[0];
801c6058d14a82 Daniel Borkmann    2021-04-29  12471  			bool issrc, isneg, =
isimm;
979d63d50c0c0f Daniel Borkmann    2019-01-03  12472  			u32 off_reg;
979d63d50c0c0f Daniel Borkmann    2019-01-03  12473  =

979d63d50c0c0f Daniel Borkmann    2019-01-03  12474  			aux =3D &env->insn_=
aux_data[i + delta];
3612af783cf52c Daniel Borkmann    2019-03-01  12475  			if (!aux->alu_state=
 ||
3612af783cf52c Daniel Borkmann    2019-03-01  12476  			    aux->alu_state =
=3D=3D BPF_ALU_NON_POINTER)
979d63d50c0c0f Daniel Borkmann    2019-01-03  12477  				continue;
979d63d50c0c0f Daniel Borkmann    2019-01-03  12478  =

979d63d50c0c0f Daniel Borkmann    2019-01-03  12479  			isneg =3D aux->alu_=
state & BPF_ALU_NEG_VALUE;
979d63d50c0c0f Daniel Borkmann    2019-01-03  12480  			issrc =3D (aux->alu=
_state & BPF_ALU_SANITIZE) =3D=3D
979d63d50c0c0f Daniel Borkmann    2019-01-03  12481  				BPF_ALU_SANITIZE_S=
RC;
801c6058d14a82 Daniel Borkmann    2021-04-29  12482  			isimm =3D aux->alu_=
state & BPF_ALU_IMMEDIATE;
979d63d50c0c0f Daniel Borkmann    2019-01-03  12483  =

979d63d50c0c0f Daniel Borkmann    2019-01-03  12484  			off_reg =3D issrc ?=
 insn->src_reg : insn->dst_reg;
801c6058d14a82 Daniel Borkmann    2021-04-29  12485  			if (isimm) {
801c6058d14a82 Daniel Borkmann    2021-04-29  12486  				*patch++ =3D BPF_M=
OV32_IMM(BPF_REG_AX, aux->alu_limit);
801c6058d14a82 Daniel Borkmann    2021-04-29  12487  			} else {
979d63d50c0c0f Daniel Borkmann    2019-01-03  12488  				if (isneg)
979d63d50c0c0f Daniel Borkmann    2019-01-03  12489  					*patch++ =3D BPF_=
ALU64_IMM(BPF_MUL, off_reg, -1);
b5871dca250cd3 Piotr Krysiuk      2021-03-16  12490  				*patch++ =3D BPF_M=
OV32_IMM(BPF_REG_AX, aux->alu_limit);
979d63d50c0c0f Daniel Borkmann    2019-01-03  12491  				*patch++ =3D BPF_A=
LU64_REG(BPF_SUB, BPF_REG_AX, off_reg);
979d63d50c0c0f Daniel Borkmann    2019-01-03  12492  				*patch++ =3D BPF_A=
LU64_REG(BPF_OR, BPF_REG_AX, off_reg);
979d63d50c0c0f Daniel Borkmann    2019-01-03  12493  				*patch++ =3D BPF_A=
LU64_IMM(BPF_NEG, BPF_REG_AX, 0);
979d63d50c0c0f Daniel Borkmann    2019-01-03  12494  				*patch++ =3D BPF_A=
LU64_IMM(BPF_ARSH, BPF_REG_AX, 63);
b9b34ddbe2076a Daniel Borkmann    2021-04-30  12495  				*patch++ =3D BPF_A=
LU64_REG(BPF_AND, BPF_REG_AX, off_reg);
801c6058d14a82 Daniel Borkmann    2021-04-29  12496  			}
b9b34ddbe2076a Daniel Borkmann    2021-04-30  12497  			if (!issrc)
b9b34ddbe2076a Daniel Borkmann    2021-04-30  12498  				*patch++ =3D BPF_M=
OV64_REG(insn->dst_reg, insn->src_reg);
979d63d50c0c0f Daniel Borkmann    2019-01-03  12499  			insn->src_reg =3D B=
PF_REG_AX;
979d63d50c0c0f Daniel Borkmann    2019-01-03  12500  			if (isneg)
979d63d50c0c0f Daniel Borkmann    2019-01-03  12501  				insn->code =3D ins=
n->code =3D=3D code_add ?
979d63d50c0c0f Daniel Borkmann    2019-01-03  12502  					     code_sub : c=
ode_add;
979d63d50c0c0f Daniel Borkmann    2019-01-03  12503  			*patch++ =3D *insn;
801c6058d14a82 Daniel Borkmann    2021-04-29  12504  			if (issrc && isneg =
&& !isimm)
979d63d50c0c0f Daniel Borkmann    2019-01-03  12505  				*patch++ =3D BPF_A=
LU64_IMM(BPF_MUL, off_reg, -1);
979d63d50c0c0f Daniel Borkmann    2019-01-03  12506  			cnt =3D patch - ins=
n_buf;
979d63d50c0c0f Daniel Borkmann    2019-01-03  12507  =

979d63d50c0c0f Daniel Borkmann    2019-01-03  12508  			new_prog =3D bpf_pa=
tch_insn_data(env, i + delta, insn_buf, cnt);
979d63d50c0c0f Daniel Borkmann    2019-01-03  12509  			if (!new_prog)
979d63d50c0c0f Daniel Borkmann    2019-01-03  12510  				return -ENOMEM;
979d63d50c0c0f Daniel Borkmann    2019-01-03  12511  =

979d63d50c0c0f Daniel Borkmann    2019-01-03  12512  			delta    +=3D cnt -=
 1;
979d63d50c0c0f Daniel Borkmann    2019-01-03  12513  			env->prog =3D prog =
=3D new_prog;
979d63d50c0c0f Daniel Borkmann    2019-01-03  12514  			insn      =3D new_p=
rog->insnsi + i + delta;
979d63d50c0c0f Daniel Borkmann    2019-01-03  12515  			continue;
979d63d50c0c0f Daniel Borkmann    2019-01-03  12516  		}
979d63d50c0c0f Daniel Borkmann    2019-01-03  12517  =

79741b3bdec01a Alexei Starovoitov 2017-03-15  12518  		if (insn->code !=3D =
(BPF_JMP | BPF_CALL))
79741b3bdec01a Alexei Starovoitov 2017-03-15  12519  			continue;
cc8b0b92a1699b Alexei Starovoitov 2017-12-14  12520  		if (insn->src_reg =
=3D=3D BPF_PSEUDO_CALL)
cc8b0b92a1699b Alexei Starovoitov 2017-12-14  12521  			continue;
e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  12522  		if (insn->src_reg =
=3D=3D BPF_PSEUDO_KFUNC_CALL) {
e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  12523  			ret =3D fixup_kfunc=
_call(env, insn);
e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  12524  			if (ret)
e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  12525  				return ret;
e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  12526  			continue;
e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  12527  		}
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12528  =

e245c5c6a5656e Alexei Starovoitov 2017-03-15  12529  		if (insn->imm =3D=3D=
 BPF_FUNC_get_route_realm)
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12530  			prog->dst_needed =
=3D 1;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12531  		if (insn->imm =3D=3D=
 BPF_FUNC_get_prandom_u32)
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12532  			bpf_user_rnd_init_o=
nce();
9802d86585db91 Josef Bacik        2017-12-11  12533  		if (insn->imm =3D=3D=
 BPF_FUNC_override_return)
9802d86585db91 Josef Bacik        2017-12-11  12534  			prog->kprobe_overri=
de =3D 1;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12535  		if (insn->imm =3D=3D=
 BPF_FUNC_tail_call) {
7b9f6da175f938 David S. Miller    2017-04-20  12536  			/* If we tail call =
into other programs, we
7b9f6da175f938 David S. Miller    2017-04-20  12537  			 * cannot make any =
assumptions since they can
7b9f6da175f938 David S. Miller    2017-04-20  12538  			 * be replaced dyna=
mically during runtime in
7b9f6da175f938 David S. Miller    2017-04-20  12539  			 * the program arra=
y.
7b9f6da175f938 David S. Miller    2017-04-20  12540  			 */
7b9f6da175f938 David S. Miller    2017-04-20  12541  			prog->cb_access =3D=
 1;
e411901c0b775a Maciej Fijalkowski 2020-09-16  12542  			if (!allow_tail_cal=
l_in_subprogs(env))
e411901c0b775a Maciej Fijalkowski 2020-09-16  12543  				prog->aux->stack_d=
epth =3D MAX_BPF_STACK;
e411901c0b775a Maciej Fijalkowski 2020-09-16  12544  			prog->aux->max_pkt_=
offset =3D MAX_PACKET_OFF;
7b9f6da175f938 David S. Miller    2017-04-20  12545  =

79741b3bdec01a Alexei Starovoitov 2017-03-15  12546  			/* mark bpf_tail_ca=
ll as different opcode to avoid
8fb33b6055300a Zhen Lei           2021-05-25  12547  			 * conditional bran=
ch in the interpreter for every normal
79741b3bdec01a Alexei Starovoitov 2017-03-15  12548  			 * call and to prev=
ent accidental JITing by JIT compiler
79741b3bdec01a Alexei Starovoitov 2017-03-15  12549  			 * that doesn't sup=
port bpf_tail_call yet
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12550  			 */
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12551  			insn->imm =3D 0;
71189fa9b092ef Alexei Starovoitov 2017-05-30  12552  			insn->code =3D BPF_=
JMP | BPF_TAIL_CALL;
b2157399cc9898 Alexei Starovoitov 2018-01-07  12553  =

c93552c443ebc6 Daniel Borkmann    2018-05-24  12554  			aux =3D &env->insn_=
aux_data[i + delta];
2c78ee898d8f10 Alexei Starovoitov 2020-05-13  12555  			if (env->bpf_capabl=
e && !expect_blinding &&
cc52d9140aa920 Daniel Borkmann    2019-12-19  12556  			    prog->jit_reque=
sted &&
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12557  			    !bpf_map_key_po=
isoned(aux) &&
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12558  			    !bpf_map_ptr_po=
isoned(aux) &&
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12559  			    !bpf_map_ptr_un=
priv(aux)) {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12560  				struct bpf_jit_pok=
e_descriptor desc =3D {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12561  					.reason =3D BPF_P=
OKE_REASON_TAIL_CALL,
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12562  					.tail_call.map =
=3D BPF_MAP_PTR(aux->map_ptr_state),
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12563  					.tail_call.key =
=3D bpf_map_key_immediate(aux),
a748c6975dea32 Maciej Fijalkowski 2020-09-16  12564  					.insn_idx =3D i +=
 delta,
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12565  				};
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12566  =

d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12567  				ret =3D bpf_jit_ad=
d_poke_descriptor(prog, &desc);
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12568  				if (ret < 0) {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12569  					verbose(env, "add=
ing tail call poke descriptor failed\n");
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12570  					return ret;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12571  				}
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12572  =

d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12573  				insn->imm =3D ret =
+ 1;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12574  				continue;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12575  			}
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12576  =

c93552c443ebc6 Daniel Borkmann    2018-05-24  12577  			if (!bpf_map_ptr_un=
priv(aux))
c93552c443ebc6 Daniel Borkmann    2018-05-24  12578  				continue;
c93552c443ebc6 Daniel Borkmann    2018-05-24  12579  =

b2157399cc9898 Alexei Starovoitov 2018-01-07  12580  			/* instead of chang=
ing every JIT dealing with tail_call
b2157399cc9898 Alexei Starovoitov 2018-01-07  12581  			 * emit two extra i=
nsns:
b2157399cc9898 Alexei Starovoitov 2018-01-07  12582  			 * if (index >=3D m=
ax_entries) goto out;
b2157399cc9898 Alexei Starovoitov 2018-01-07  12583  			 * index &=3D array=
->index_mask;
b2157399cc9898 Alexei Starovoitov 2018-01-07  12584  			 * to avoid out-of-=
bounds cpu speculation
b2157399cc9898 Alexei Starovoitov 2018-01-07  12585  			 */
c93552c443ebc6 Daniel Borkmann    2018-05-24  12586  			if (bpf_map_ptr_poi=
soned(aux)) {
40950343932879 Colin Ian King     2018-01-10  12587  				verbose(env, "tail=
_call abusing map_ptr\n");
b2157399cc9898 Alexei Starovoitov 2018-01-07  12588  				return -EINVAL;
b2157399cc9898 Alexei Starovoitov 2018-01-07  12589  			}
c93552c443ebc6 Daniel Borkmann    2018-05-24  12590  =

d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12591  			map_ptr =3D BPF_MAP=
_PTR(aux->map_ptr_state);
b2157399cc9898 Alexei Starovoitov 2018-01-07  12592  			insn_buf[0] =3D BPF=
_JMP_IMM(BPF_JGE, BPF_REG_3,
b2157399cc9898 Alexei Starovoitov 2018-01-07  12593  						  map_ptr->max_e=
ntries, 2);
b2157399cc9898 Alexei Starovoitov 2018-01-07  12594  			insn_buf[1] =3D BPF=
_ALU32_IMM(BPF_AND, BPF_REG_3,
b2157399cc9898 Alexei Starovoitov 2018-01-07  12595  						    container_of=
(map_ptr,
b2157399cc9898 Alexei Starovoitov 2018-01-07  12596  								 struct bpf_ar=
ray,
b2157399cc9898 Alexei Starovoitov 2018-01-07  12597  								 map)->index_m=
ask);
b2157399cc9898 Alexei Starovoitov 2018-01-07  12598  			insn_buf[2] =3D *in=
sn;
b2157399cc9898 Alexei Starovoitov 2018-01-07  12599  			cnt =3D 3;
b2157399cc9898 Alexei Starovoitov 2018-01-07  12600  			new_prog =3D bpf_pa=
tch_insn_data(env, i + delta, insn_buf, cnt);
b2157399cc9898 Alexei Starovoitov 2018-01-07  12601  			if (!new_prog)
b2157399cc9898 Alexei Starovoitov 2018-01-07  12602  				return -ENOMEM;
b2157399cc9898 Alexei Starovoitov 2018-01-07  12603  =

b2157399cc9898 Alexei Starovoitov 2018-01-07  12604  			delta    +=3D cnt -=
 1;
b2157399cc9898 Alexei Starovoitov 2018-01-07  12605  			env->prog =3D prog =
=3D new_prog;
b2157399cc9898 Alexei Starovoitov 2018-01-07  12606  			insn      =3D new_p=
rog->insnsi + i + delta;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12607  			continue;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12608  		}
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12609  =

068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12610  		if (insn->imm =3D=3D=
 BPF_FUNC_timer_init) {
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12611  			aux =3D &env->insn_=
aux_data[i + delta];
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12612  			if (bpf_map_ptr_poi=
soned(aux)) {
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12613  				verbose(env, "bpf_=
timer_init abusing map_ptr\n");
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12614  				return -EINVAL;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12615  			}
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12616  			map_ptr =3D BPF_MAP=
_PTR(aux->map_ptr_state);
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12617  			{
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12618  				struct bpf_insn ld=
_addrs[2] =3D {
068cd1f2f98ebc Alexei Starovoitov 2021-05-17 @12619  					BPF_LD_IMM64(BPF_=
REG_3, (long)map_ptr),
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12620  				};
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12621  =

068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12622  				insn_buf[0] =3D ld=
_addrs[0];
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12623  				insn_buf[1] =3D ld=
_addrs[1];
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12624  			}
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12625  			insn_buf[2] =3D *in=
sn;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12626  			cnt =3D 3;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12627  =

068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12628  			new_prog =3D bpf_pa=
tch_insn_data(env, i + delta, insn_buf, cnt);
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12629  			if (!new_prog)
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12630  				return -ENOMEM;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12631  =

068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12632  			delta    +=3D cnt -=
 1;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12633  			env->prog =3D prog =
=3D new_prog;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12634  			insn      =3D new_p=
rog->insnsi + i + delta;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12635  			goto patch_call_imm;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12636  		}
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12637  =

068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12638  		if (insn->imm =3D=3D=
 BPF_FUNC_timer_start) {
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12639  			/* There is no need=
 to do:
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12640  			 *     aux =3D &env=
->insn_aux_data[i + delta];
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12641  			 *     if (bpf_map_=
ptr_poisoned(aux)) return -EINVAL;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12642  			 * for bpf_timer_st=
art(). If the same callback_fn is shared
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12643  			 * by different tim=
ers in different maps the poisoned check
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12644  			 * will return fals=
e positive.
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12645  			 *
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12646  			 * The verifier wil=
l process callback_fn as many times as necessary
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12647  			 * with different m=
aps and the register states prepared by
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12648  			 * set_timer_start_=
callback_state will be accurate.
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12649  			 *
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12650  			 * There is no need=
 for bpf_timer_start() to check in the
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12651  			 * run-time that bp=
f_hrtimer->map stored during bpf_timer_init()
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12652  			 * is the same map =
as in bpf_timer_start()
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12653  			 * because it's the=
 same map element value.
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12654  			 */
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12655  			struct bpf_insn ld_=
addrs[2] =3D {
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12656  				BPF_LD_IMM64(BPF_R=
EG_4, (long)prog),
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12657  			};
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12658  =

068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12659  			insn_buf[0] =3D ld_=
addrs[0];
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12660  			insn_buf[1] =3D ld_=
addrs[1];
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12661  			insn_buf[2] =3D *in=
sn;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12662  			cnt =3D 3;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12663  =

068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12664  			new_prog =3D bpf_pa=
tch_insn_data(env, i + delta, insn_buf, cnt);
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12665  			if (!new_prog)
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12666  				return -ENOMEM;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12667  =

068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12668  			delta    +=3D cnt -=
 1;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12669  			env->prog =3D prog =
=3D new_prog;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12670  			insn      =3D new_p=
rog->insnsi + i + delta;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12671  			goto patch_call_imm;
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12672  		}
068cd1f2f98ebc Alexei Starovoitov 2021-05-17  12673  =

89c63074c2bc25 Daniel Borkmann    2017-08-19  12674  		/* BPF_EMIT_CALL() a=
ssumptions in some of the map_gen_lookup
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12675  		 * and other inlinin=
g handlers are currently limited to 64 bit
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12676  		 * only.
89c63074c2bc25 Daniel Borkmann    2017-08-19  12677  		 */
60b58afc96c9df Alexei Starovoitov 2017-12-14  12678  		if (prog->jit_reques=
ted && BITS_PER_LONG =3D=3D 64 &&
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12679  		    (insn->imm =3D=
=3D BPF_FUNC_map_lookup_elem ||
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12680  		     insn->imm =3D=
=3D BPF_FUNC_map_update_elem ||
84430d4232c36c Daniel Borkmann    2018-10-21  12681  		     insn->imm =3D=
=3D BPF_FUNC_map_delete_elem ||
84430d4232c36c Daniel Borkmann    2018-10-21  12682  		     insn->imm =3D=
=3D BPF_FUNC_map_push_elem   ||
84430d4232c36c Daniel Borkmann    2018-10-21  12683  		     insn->imm =3D=
=3D BPF_FUNC_map_pop_elem    ||
e6a4750ffe9d70 Bj=C3=B6rn T=C3=B6pel        2021-03-08  12684  		     insn-=
>imm =3D=3D BPF_FUNC_map_peek_elem   ||
e6a4750ffe9d70 Bj=C3=B6rn T=C3=B6pel        2021-03-08  12685  		     insn-=
>imm =3D=3D BPF_FUNC_redirect_map)) {
c93552c443ebc6 Daniel Borkmann    2018-05-24  12686  			aux =3D &env->insn_=
aux_data[i + delta];
c93552c443ebc6 Daniel Borkmann    2018-05-24  12687  			if (bpf_map_ptr_poi=
soned(aux))
c93552c443ebc6 Daniel Borkmann    2018-05-24  12688  				goto patch_call_im=
m;
c93552c443ebc6 Daniel Borkmann    2018-05-24  12689  =

d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12690  			map_ptr =3D BPF_MAP=
_PTR(aux->map_ptr_state);
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12691  			ops =3D map_ptr->op=
s;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12692  			if (insn->imm =3D=
=3D BPF_FUNC_map_lookup_elem &&
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12693  			    ops->map_gen_lo=
okup) {
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12694  				cnt =3D ops->map_g=
en_lookup(map_ptr, insn_buf);
4a8f87e60f6db4 Daniel Borkmann    2020-10-11  12695  				if (cnt =3D=3D -EO=
PNOTSUPP)
4a8f87e60f6db4 Daniel Borkmann    2020-10-11  12696  					goto patch_map_op=
s_generic;
4a8f87e60f6db4 Daniel Borkmann    2020-10-11  12697  				if (cnt <=3D 0 || =
cnt >=3D ARRAY_SIZE(insn_buf)) {
61bd5218eef349 Jakub Kicinski     2017-10-09  12698  					verbose(env, "bpf=
 verifier is misconfigured\n");
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12699  					return -EINVAL;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12700  				}
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12701  =

09772d92cd5ad9 Daniel Borkmann    2018-06-02  12702  				new_prog =3D bpf_p=
atch_insn_data(env, i + delta,
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12703  							       insn_buf=
, cnt);
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12704  				if (!new_prog)
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12705  					return -ENOMEM;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12706  =

81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12707  				delta    +=3D cnt =
- 1;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12708  				env->prog =3D prog=
 =3D new_prog;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12709  				insn      =3D new_=
prog->insnsi + i + delta;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12710  				continue;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12711  			}
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12712  =

09772d92cd5ad9 Daniel Borkmann    2018-06-02  12713  			BUILD_BUG_ON(!__sam=
e_type(ops->map_lookup_elem,
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12714  				     (void *(*)(st=
ruct bpf_map *map, void *key))NULL));
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12715  			BUILD_BUG_ON(!__sam=
e_type(ops->map_delete_elem,
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12716  				     (int (*)(stru=
ct bpf_map *map, void *key))NULL));
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12717  			BUILD_BUG_ON(!__sam=
e_type(ops->map_update_elem,
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12718  				     (int (*)(stru=
ct bpf_map *map, void *key, void *value,
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12719  					      u64 flags))=
NULL));
84430d4232c36c Daniel Borkmann    2018-10-21  12720  			BUILD_BUG_ON(!__sam=
e_type(ops->map_push_elem,
84430d4232c36c Daniel Borkmann    2018-10-21  12721  				     (int (*)(stru=
ct bpf_map *map, void *value,
84430d4232c36c Daniel Borkmann    2018-10-21  12722  					      u64 flags))=
NULL));
84430d4232c36c Daniel Borkmann    2018-10-21  12723  			BUILD_BUG_ON(!__sam=
e_type(ops->map_pop_elem,
84430d4232c36c Daniel Borkmann    2018-10-21  12724  				     (int (*)(stru=
ct bpf_map *map, void *value))NULL));
84430d4232c36c Daniel Borkmann    2018-10-21  12725  			BUILD_BUG_ON(!__sam=
e_type(ops->map_peek_elem,
84430d4232c36c Daniel Borkmann    2018-10-21  12726  				     (int (*)(stru=
ct bpf_map *map, void *value))NULL));
e6a4750ffe9d70 Bj=C3=B6rn T=C3=B6pel        2021-03-08  12727  			BUILD_BUG=
_ON(!__same_type(ops->map_redirect,
e6a4750ffe9d70 Bj=C3=B6rn T=C3=B6pel        2021-03-08  12728  				     (in=
t (*)(struct bpf_map *map, u32 ifindex, u64 flags))NULL));
e6a4750ffe9d70 Bj=C3=B6rn T=C3=B6pel        2021-03-08  12729  =

4a8f87e60f6db4 Daniel Borkmann    2020-10-11  12730  patch_map_ops_generic:
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12731  			switch (insn->imm) {
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12732  			case BPF_FUNC_map_l=
ookup_elem:
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12733  				insn->imm =3D BPF_=
CAST_CALL(ops->map_lookup_elem) -
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12734  					    __bpf_call_ba=
se;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12735  				continue;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12736  			case BPF_FUNC_map_u=
pdate_elem:
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12737  				insn->imm =3D BPF_=
CAST_CALL(ops->map_update_elem) -
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12738  					    __bpf_call_ba=
se;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12739  				continue;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12740  			case BPF_FUNC_map_d=
elete_elem:
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12741  				insn->imm =3D BPF_=
CAST_CALL(ops->map_delete_elem) -
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12742  					    __bpf_call_ba=
se;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12743  				continue;
84430d4232c36c Daniel Borkmann    2018-10-21  12744  			case BPF_FUNC_map_p=
ush_elem:
84430d4232c36c Daniel Borkmann    2018-10-21  12745  				insn->imm =3D BPF_=
CAST_CALL(ops->map_push_elem) -
84430d4232c36c Daniel Borkmann    2018-10-21  12746  					    __bpf_call_ba=
se;
84430d4232c36c Daniel Borkmann    2018-10-21  12747  				continue;
84430d4232c36c Daniel Borkmann    2018-10-21  12748  			case BPF_FUNC_map_p=
op_elem:
84430d4232c36c Daniel Borkmann    2018-10-21  12749  				insn->imm =3D BPF_=
CAST_CALL(ops->map_pop_elem) -
84430d4232c36c Daniel Borkmann    2018-10-21  12750  					    __bpf_call_ba=
se;
84430d4232c36c Daniel Borkmann    2018-10-21  12751  				continue;
84430d4232c36c Daniel Borkmann    2018-10-21  12752  			case BPF_FUNC_map_p=
eek_elem:
84430d4232c36c Daniel Borkmann    2018-10-21  12753  				insn->imm =3D BPF_=
CAST_CALL(ops->map_peek_elem) -
84430d4232c36c Daniel Borkmann    2018-10-21  12754  					    __bpf_call_ba=
se;
84430d4232c36c Daniel Borkmann    2018-10-21  12755  				continue;
e6a4750ffe9d70 Bj=C3=B6rn T=C3=B6pel        2021-03-08  12756  			case BPF_=
FUNC_redirect_map:
e6a4750ffe9d70 Bj=C3=B6rn T=C3=B6pel        2021-03-08  12757  				insn->im=
m =3D BPF_CAST_CALL(ops->map_redirect) -
e6a4750ffe9d70 Bj=C3=B6rn T=C3=B6pel        2021-03-08  12758  					    __b=
pf_call_base;
e6a4750ffe9d70 Bj=C3=B6rn T=C3=B6pel        2021-03-08  12759  				continue;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12760  			}
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12761  =

09772d92cd5ad9 Daniel Borkmann    2018-06-02  12762  			goto patch_call_imm;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12763  		}
09772d92cd5ad9 Daniel Borkmann    2018-06-02  12764  =

e6ac593372aada Brendan Jackman    2021-02-17  12765  		/* Implement bpf_jif=
fies64 inline. */
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12766  		if (prog->jit_reques=
ted && BITS_PER_LONG =3D=3D 64 &&
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12767  		    insn->imm =3D=3D=
 BPF_FUNC_jiffies64) {
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12768  			struct bpf_insn ld_=
jiffies_addr[2] =3D {
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12769  				BPF_LD_IMM64(BPF_R=
EG_0,
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12770  					     (unsigned lo=
ng)&jiffies),
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12771  			};
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12772  =

5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12773  			insn_buf[0] =3D ld_=
jiffies_addr[0];
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12774  			insn_buf[1] =3D ld_=
jiffies_addr[1];
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12775  			insn_buf[2] =3D BPF=
_LDX_MEM(BPF_DW, BPF_REG_0,
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12776  						  BPF_REG_0, 0);
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12777  			cnt =3D 3;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12778  =

5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12779  			new_prog =3D bpf_pa=
tch_insn_data(env, i + delta, insn_buf,
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12780  						       cnt);
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12781  			if (!new_prog)
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12782  				return -ENOMEM;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12783  =

5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12784  			delta    +=3D cnt -=
 1;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12785  			env->prog =3D prog =
=3D new_prog;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12786  			insn      =3D new_p=
rog->insnsi + i + delta;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12787  			continue;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12788  		}
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  12789  =

81ed18ab3098b6 Alexei Starovoitov 2017-03-15  12790  patch_call_imm:
5e43f899b03a34 Andrey Ignatov     2018-03-30  12791  		fn =3D env->ops->get=
_func_proto(insn->imm, env->prog);
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12792  		/* all functions tha=
t have prototype and verifier allowed
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12793  		 * programs to call =
them, must be real in-kernel functions
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12794  		 */
79741b3bdec01a Alexei Starovoitov 2017-03-15  12795  		if (!fn->func) {
61bd5218eef349 Jakub Kicinski     2017-10-09  12796  			verbose(env,
61bd5218eef349 Jakub Kicinski     2017-10-09  12797  				"kernel subsystem =
misconfigured func %s#%d\n",
79741b3bdec01a Alexei Starovoitov 2017-03-15  12798  				func_id_name(insn-=
>imm), insn->imm);
79741b3bdec01a Alexei Starovoitov 2017-03-15  12799  			return -EFAULT;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12800  		}
79741b3bdec01a Alexei Starovoitov 2017-03-15  12801  		insn->imm =3D fn->fu=
nc - __bpf_call_base;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12802  	}
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12803  =

d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12804  	/* Since poke tab is =
now finalized, publish aux to tracker. */
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12805  	for (i =3D 0; i < pro=
g->aux->size_poke_tab; i++) {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12806  		map_ptr =3D prog->au=
x->poke_tab[i].tail_call.map;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12807  		if (!map_ptr->ops->m=
ap_poke_track ||
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12808  		    !map_ptr->ops->m=
ap_poke_untrack ||
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12809  		    !map_ptr->ops->m=
ap_poke_run) {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12810  			verbose(env, "bpf v=
erifier is misconfigured\n");
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12811  			return -EINVAL;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12812  		}
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12813  =

d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12814  		ret =3D map_ptr->ops=
->map_poke_track(map_ptr, prog->aux);
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12815  		if (ret < 0) {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12816  			verbose(env, "track=
ing tail call prog failed\n");
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12817  			return ret;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12818  		}
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12819  	}
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  12820  =

e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  12821  	sort_kfunc_descs_by_i=
mm(env->prog);
e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  12822  =

79741b3bdec01a Alexei Starovoitov 2017-03-15  12823  	return 0;
79741b3bdec01a Alexei Starovoitov 2017-03-15  12824  }
e245c5c6a5656e Alexei Starovoitov 2017-03-15  12825  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5129674221398921620==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AA==
--===============5129674221398921620==--

