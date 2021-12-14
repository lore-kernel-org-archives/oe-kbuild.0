Content-Type: multipart/mixed; boundary="===============0724095477473138845=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next 2/3] Right align verifier states in verifier logs
Date: Tue, 14 Dec 2021 09:43:09 +0800
Message-ID: <202112140939.Ha0B0UON-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0724095477473138845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211213182117.682461-3-christylee@fb.com>
References: <20211213182117.682461-3-christylee@fb.com>
TO: Christy Lee <christylee@fb.com>
TO: ast(a)kernel.org
TO: daniel(a)iogearbox.net
TO: andrii(a)kernel.org
CC: christylee(a)fb.com
CC: bpf(a)vger.kernel.org
CC: kernel-team(a)fb.com

Hi Christy,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Christy-Lee/Improve-verifi=
er-log-readability/20211214-022202
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-m001-20211213 (https://download.01.org/0day-ci/ar=
chive/20211214/202112140939.Ha0B0UON-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/verifier.c:11339 do_check() error: uninitialized symbol 'prev_lo=
g_len'.
kernel/bpf/verifier.c:11340 do_check() error: uninitialized symbol 'prev_in=
sn_print_len'.

vim +/prev_log_len +11339 kernel/bpf/verifier.c

c64b7983288e63 Joe Stringer            2018-10-02  11278  =

58e2af8b3a6b58 Jakub Kicinski          2016-09-21  11279  static int do_che=
ck(struct bpf_verifier_env *env)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11280  {
4c7ccf82b1a3c7 Christy Lee             2021-12-13  11281  	u32 prev_log_len=
, prev_insn_print_len;
6f8a57ccf85117 Andrii Nakryiko         2020-04-23  11282  	bool pop_log =3D=
 !(env->log.level & BPF_LOG_LEVEL2);
51c39bb1d5d105 Alexei Starovoitov      2020-01-09  11283  	struct bpf_verif=
ier_state *state =3D env->cur_state;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11284  	struct bpf_insn =
*insns =3D env->prog->insnsi;
638f5b90d46016 Alexei Starovoitov      2017-10-31  11285  	struct bpf_reg_s=
tate *regs;
06ee7115b0d174 Alexei Starovoitov      2019-04-01  11286  	int insn_cnt =3D=
 env->prog->len;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11287  	bool do_print_st=
ate =3D false;
b5dc0163d8fd78 Alexei Starovoitov      2019-06-15  11288  	int prev_insn_id=
x =3D -1;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11289  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  11290  	for (;;) {
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11291  		struct bpf_insn=
 *insn;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11292  		u8 class;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11293  		int err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11294  =

b5dc0163d8fd78 Alexei Starovoitov      2019-06-15  11295  		env->prev_insn_=
idx =3D prev_insn_idx;
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11296  		if (env->insn_i=
dx >=3D insn_cnt) {
61bd5218eef349 Jakub Kicinski          2017-10-09  11297  			verbose(env, "=
invalid insn idx %d insn_cnt %d\n",
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11298  				env->insn_idx=
, insn_cnt);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11299  			return -EFAULT;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11300  		}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11301  =

c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11302  		insn =3D &insns=
[env->insn_idx];
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11303  		class =3D BPF_C=
LASS(insn->code);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11304  =

06ee7115b0d174 Alexei Starovoitov      2019-04-01  11305  		if (++env->insn=
_processed > BPF_COMPLEXITY_LIMIT_INSNS) {
61bd5218eef349 Jakub Kicinski          2017-10-09  11306  			verbose(env,
61bd5218eef349 Jakub Kicinski          2017-10-09  11307  				"BPF program =
is too large. Processed %d insn\n",
06ee7115b0d174 Alexei Starovoitov      2019-04-01  11308  				env->insn_pro=
cessed);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11309  			return -E2BIG;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11310  		}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11311  =

c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11312  		err =3D is_stat=
e_visited(env, env->insn_idx);
f1bca824dabba4 Alexei Starovoitov      2014-09-29  11313  		if (err < 0)
f1bca824dabba4 Alexei Starovoitov      2014-09-29  11314  			return err;
f1bca824dabba4 Alexei Starovoitov      2014-09-29  11315  		if (err =3D=3D =
1) {
f1bca824dabba4 Alexei Starovoitov      2014-09-29  11316  			/* found equiv=
alent state, can prune the search */
06ee7115b0d174 Alexei Starovoitov      2019-04-01  11317  			if (env->log.l=
evel & BPF_LOG_LEVEL) {
f1bca824dabba4 Alexei Starovoitov      2014-09-29  11318  				if (do_print_=
state)
979d63d50c0c0f Daniel Borkmann         2019-01-03  11319  					verbose(env,=
 "\nfrom %d to %d%s: safe\n",
979d63d50c0c0f Daniel Borkmann         2019-01-03  11320  						env->prev_i=
nsn_idx, env->insn_idx,
979d63d50c0c0f Daniel Borkmann         2019-01-03  11321  						env->cur_st=
ate->speculative ?
979d63d50c0c0f Daniel Borkmann         2019-01-03  11322  						" (speculat=
ive execution)" : "");
f1bca824dabba4 Alexei Starovoitov      2014-09-29  11323  				else
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11324  					verbose(env,=
 "%d: safe\n", env->insn_idx);
f1bca824dabba4 Alexei Starovoitov      2014-09-29  11325  			}
f1bca824dabba4 Alexei Starovoitov      2014-09-29  11326  			goto process_b=
pf_exit;
f1bca824dabba4 Alexei Starovoitov      2014-09-29  11327  		}
f1bca824dabba4 Alexei Starovoitov      2014-09-29  11328  =

c3494801cd1785 Alexei Starovoitov      2018-12-03  11329  		if (signal_pend=
ing(current))
c3494801cd1785 Alexei Starovoitov      2018-12-03  11330  			return -EAGAIN;
c3494801cd1785 Alexei Starovoitov      2018-12-03  11331  =

3c2ce60bdd3d57 Daniel Borkmann         2017-05-18  11332  		if (need_resche=
d())
3c2ce60bdd3d57 Daniel Borkmann         2017-05-18  11333  			cond_resched();
3c2ce60bdd3d57 Daniel Borkmann         2017-05-18  11334  =

a41a40a9bfc92d Christy Lee             2021-12-13  11335  		if ((env->log.l=
evel & BPF_LOG_LEVEL2) ||
06ee7115b0d174 Alexei Starovoitov      2019-04-01  11336  		    (env->log.l=
evel & BPF_LOG_LEVEL && do_print_state)) {
a41a40a9bfc92d Christy Lee             2021-12-13  11337  			if (verifier_s=
tate_scratched(env) &&
a41a40a9bfc92d Christy Lee             2021-12-13  11338  			    (env->log.=
level & BPF_LOG_LEVEL2))
4c7ccf82b1a3c7 Christy Lee             2021-12-13 @11339  				print_insn_st=
ate(env, prev_log_len,
4c7ccf82b1a3c7 Christy Lee             2021-12-13 @11340  						 prev_insn_=
print_len);
c5fc9692d101d1 David S. Miller         2017-05-10  11341  			else
979d63d50c0c0f Daniel Borkmann         2019-01-03  11342  				verbose(env, =
"\nfrom %d to %d%s:",
979d63d50c0c0f Daniel Borkmann         2019-01-03  11343  					env->prev_in=
sn_idx, env->insn_idx,
979d63d50c0c0f Daniel Borkmann         2019-01-03  11344  					env->cur_sta=
te->speculative ?
979d63d50c0c0f Daniel Borkmann         2019-01-03  11345  					" (speculati=
ve execution)" : "");
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  11346  			print_verifier=
_state(env, state->frame[state->curframe]);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11347  			do_print_state=
 =3D false;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11348  		}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11349  =

06ee7115b0d174 Alexei Starovoitov      2019-04-01  11350  		if (env->log.le=
vel & BPF_LOG_LEVEL) {
7105e828c087de Daniel Borkmann         2017-12-20  11351  			const struct b=
pf_insn_cbs cbs =3D {
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  11352  				.cb_call	=3D =
disasm_kfunc_name,
7105e828c087de Daniel Borkmann         2017-12-20  11353  				.cb_print	=3D=
 verbose,
abe0884011f1a5 Jiri Olsa               2018-03-23  11354  				.private_data=
	=3D env,
7105e828c087de Daniel Borkmann         2017-12-20  11355  			};
7105e828c087de Daniel Borkmann         2017-12-20  11356  =

c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11357  			verbose_linfo(=
env, env->insn_idx, "; ");
4c7ccf82b1a3c7 Christy Lee             2021-12-13  11358  			prev_log_len =
=3D env->log.len_used;
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11359  			verbose(env, "=
%d: ", env->insn_idx);
abe0884011f1a5 Jiri Olsa               2018-03-23  11360  			print_bpf_insn=
(&cbs, insn, env->allow_ptr_leaks);
4c7ccf82b1a3c7 Christy Lee             2021-12-13  11361  			prev_insn_prin=
t_len =3D env->log.len_used - prev_log_len;
4c7ccf82b1a3c7 Christy Lee             2021-12-13  11362  			prev_log_len =
=3D env->log.len_used;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11363  		}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11364  =

cae1927c0b4a93 Jakub Kicinski          2017-12-27  11365  		if (bpf_prog_is=
_dev_bound(env->prog->aux)) {
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11366  			err =3D bpf_pr=
og_offload_verify_insn(env, env->insn_idx,
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11367  							   env->pr=
ev_insn_idx);
13a27dfc669724 Jakub Kicinski          2016-09-21  11368  			if (err)
13a27dfc669724 Jakub Kicinski          2016-09-21  11369  				return err;
cae1927c0b4a93 Jakub Kicinski          2017-12-27  11370  		}
13a27dfc669724 Jakub Kicinski          2016-09-21  11371  =

638f5b90d46016 Alexei Starovoitov      2017-10-31  11372  		regs =3D cur_re=
gs(env);
fe9a5ca7e370e6 Daniel Borkmann         2021-05-28  11373  		sanitize_mark_i=
nsn_seen(env);
b5dc0163d8fd78 Alexei Starovoitov      2019-06-15  11374  		prev_insn_idx =
=3D env->insn_idx;
fd978bf7fd3125 Joe Stringer            2018-10-02  11375  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  11376  		if (class =3D=
=3D BPF_ALU || class =3D=3D BPF_ALU64) {
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  11377  			err =3D check_=
alu_op(env, insn);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11378  			if (err)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11379  				return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11380  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  11381  		} else if (clas=
s =3D=3D BPF_LDX) {
3df126f35f88dc Jakub Kicinski          2016-09-21  11382  			enum bpf_reg_t=
ype *prev_src_type, src_reg_type;
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11383  =

9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11384  			/* check for r=
eserved fields is already done */
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11385  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  11386  			/* check src o=
perand */
dc503a8ad98474 Edward Cree             2017-08-15  11387  			err =3D check_=
reg_arg(env, insn->src_reg, SRC_OP);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11388  			if (err)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11389  				return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11390  =

dc503a8ad98474 Edward Cree             2017-08-15  11391  			err =3D check_=
reg_arg(env, insn->dst_reg, DST_OP_NO_MARK);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11392  			if (err)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11393  				return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11394  =

725f9dcd58dedf Alexei Starovoitov      2015-04-15  11395  			src_reg_type =
=3D regs[insn->src_reg].type;
725f9dcd58dedf Alexei Starovoitov      2015-04-15  11396  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  11397  			/* check that =
memory (src_reg + off) is readable,
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11398  			 * the state o=
f dst_reg will be updated by this func
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11399  			 */
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11400  			err =3D check_=
mem_access(env, env->insn_idx, insn->src_reg,
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11401  					       insn-=
>off, BPF_SIZE(insn->code),
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11402  					       BPF_R=
EAD, insn->dst_reg, false);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11403  			if (err)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11404  				return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11405  =

c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11406  			prev_src_type =
=3D &env->insn_aux_data[env->insn_idx].ptr_type;
3df126f35f88dc Jakub Kicinski          2016-09-21  11407  =

3df126f35f88dc Jakub Kicinski          2016-09-21  11408  			if (*prev_src_=
type =3D=3D NOT_INIT) {
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11409  				/* saw a vali=
d insn
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11410  				 * dst_reg =
=3D *(u32 *)(src_reg + off)
3df126f35f88dc Jakub Kicinski          2016-09-21  11411  				 * save type =
to validate intersecting paths
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11412  				 */
3df126f35f88dc Jakub Kicinski          2016-09-21  11413  				*prev_src_typ=
e =3D src_reg_type;
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11414  =

c64b7983288e63 Joe Stringer            2018-10-02  11415  			} else if (reg=
_type_mismatch(src_reg_type, *prev_src_type)) {
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11416  				/* ABuser pro=
gram is trying to use the same insn
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11417  				 * dst_reg =
=3D *(u32*) (src_reg + off)
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11418  				 * with diffe=
rent pointer types:
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11419  				 * src_reg =
=3D=3D ctx in one branch and
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11420  				 * src_reg =
=3D=3D stack|map in some other branch.
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11421  				 * Reject it.
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11422  				 */
61bd5218eef349 Jakub Kicinski          2017-10-09  11423  				verbose(env, =
"same insn cannot be used with different pointers\n");
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11424  				return -EINVA=
L;
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11425  			}
9bac3d6d548e5c Alexei Starovoitov      2015-03-13  11426  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  11427  		} else if (clas=
s =3D=3D BPF_STX) {
3df126f35f88dc Jakub Kicinski          2016-09-21  11428  			enum bpf_reg_t=
ype *prev_dst_type, dst_reg_type;
d691f9e8d4405c Alexei Starovoitov      2015-06-04  11429  =

91c960b0056672 Brendan Jackman         2021-01-14  11430  			if (BPF_MODE(i=
nsn->code) =3D=3D BPF_ATOMIC) {
91c960b0056672 Brendan Jackman         2021-01-14  11431  				err =3D check=
_atomic(env, env->insn_idx, insn);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11432  				if (err)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11433  					return err;
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11434  				env->insn_idx=
++;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11435  				continue;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11436  			}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11437  =

5ca419f2864a2c Brendan Jackman         2021-01-14  11438  			if (BPF_MODE(i=
nsn->code) !=3D BPF_MEM || insn->imm !=3D 0) {
5ca419f2864a2c Brendan Jackman         2021-01-14  11439  				verbose(env, =
"BPF_STX uses reserved fields\n");
5ca419f2864a2c Brendan Jackman         2021-01-14  11440  				return -EINVA=
L;
5ca419f2864a2c Brendan Jackman         2021-01-14  11441  			}
5ca419f2864a2c Brendan Jackman         2021-01-14  11442  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  11443  			/* check src1 =
operand */
dc503a8ad98474 Edward Cree             2017-08-15  11444  			err =3D check_=
reg_arg(env, insn->src_reg, SRC_OP);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11445  			if (err)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11446  				return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11447  			/* check src2 =
operand */
dc503a8ad98474 Edward Cree             2017-08-15  11448  			err =3D check_=
reg_arg(env, insn->dst_reg, SRC_OP);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11449  			if (err)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11450  				return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11451  =

d691f9e8d4405c Alexei Starovoitov      2015-06-04  11452  			dst_reg_type =
=3D regs[insn->dst_reg].type;
d691f9e8d4405c Alexei Starovoitov      2015-06-04  11453  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  11454  			/* check that =
memory (dst_reg + off) is writeable */
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11455  			err =3D check_=
mem_access(env, env->insn_idx, insn->dst_reg,
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11456  					       insn-=
>off, BPF_SIZE(insn->code),
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11457  					       BPF_W=
RITE, insn->src_reg, false);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11458  			if (err)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11459  				return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11460  =

c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11461  			prev_dst_type =
=3D &env->insn_aux_data[env->insn_idx].ptr_type;
3df126f35f88dc Jakub Kicinski          2016-09-21  11462  =

3df126f35f88dc Jakub Kicinski          2016-09-21  11463  			if (*prev_dst_=
type =3D=3D NOT_INIT) {
3df126f35f88dc Jakub Kicinski          2016-09-21  11464  				*prev_dst_typ=
e =3D dst_reg_type;
c64b7983288e63 Joe Stringer            2018-10-02  11465  			} else if (reg=
_type_mismatch(dst_reg_type, *prev_dst_type)) {
61bd5218eef349 Jakub Kicinski          2017-10-09  11466  				verbose(env, =
"same insn cannot be used with different pointers\n");
d691f9e8d4405c Alexei Starovoitov      2015-06-04  11467  				return -EINVA=
L;
d691f9e8d4405c Alexei Starovoitov      2015-06-04  11468  			}
d691f9e8d4405c Alexei Starovoitov      2015-06-04  11469  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  11470  		} else if (clas=
s =3D=3D BPF_ST) {
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11471  			if (BPF_MODE(i=
nsn->code) !=3D BPF_MEM ||
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11472  			    insn->src_=
reg !=3D BPF_REG_0) {
61bd5218eef349 Jakub Kicinski          2017-10-09  11473  				verbose(env, =
"BPF_ST uses reserved fields\n");
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11474  				return -EINVA=
L;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11475  			}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11476  			/* check src o=
perand */
dc503a8ad98474 Edward Cree             2017-08-15  11477  			err =3D check_=
reg_arg(env, insn->dst_reg, SRC_OP);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11478  			if (err)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11479  				return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11480  =

f37a8cb84cce18 Daniel Borkmann         2018-01-16  11481  			if (is_ctx_reg=
(env, insn->dst_reg)) {
9d2be44a7f33d5 Joe Stringer            2018-10-02  11482  				verbose(env, =
"BPF_ST stores into R%d %s is not allowed\n",
2a159c6f82381a Daniel Borkmann         2018-10-21  11483  					insn->dst_re=
g,
2a159c6f82381a Daniel Borkmann         2018-10-21  11484  					reg_type_str=
[reg_state(env, insn->dst_reg)->type]);
f37a8cb84cce18 Daniel Borkmann         2018-01-16  11485  				return -EACCE=
S;
f37a8cb84cce18 Daniel Borkmann         2018-01-16  11486  			}
f37a8cb84cce18 Daniel Borkmann         2018-01-16  11487  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  11488  			/* check that =
memory (dst_reg + off) is writeable */
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11489  			err =3D check_=
mem_access(env, env->insn_idx, insn->dst_reg,
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11490  					       insn-=
>off, BPF_SIZE(insn->code),
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11491  					       BPF_W=
RITE, -1, false);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11492  			if (err)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11493  				return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11494  =

092ed0968bb648 Jiong Wang              2019-01-26  11495  		} else if (clas=
s =3D=3D BPF_JMP || class =3D=3D BPF_JMP32) {
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11496  			u8 opcode =3D =
BPF_OP(insn->code);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11497  =

2589726d12a1b1 Alexei Starovoitov      2019-06-15  11498  			env->jmps_proc=
essed++;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11499  			if (opcode =3D=
=3D BPF_CALL) {
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11500  				if (BPF_SRC(i=
nsn->code) !=3D BPF_K ||
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02  11501  				    (insn->sr=
c_reg !=3D BPF_PSEUDO_KFUNC_CALL
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02  11502  				     && insn-=
>off !=3D 0) ||
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  11503  				    (insn->sr=
c_reg !=3D BPF_REG_0 &&
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  11504  				     insn->sr=
c_reg !=3D BPF_PSEUDO_CALL &&
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  11505  				     insn->sr=
c_reg !=3D BPF_PSEUDO_KFUNC_CALL) ||
092ed0968bb648 Jiong Wang              2019-01-26  11506  				    insn->dst=
_reg !=3D BPF_REG_0 ||
092ed0968bb648 Jiong Wang              2019-01-26  11507  				    class =3D=
=3D BPF_JMP32) {
61bd5218eef349 Jakub Kicinski          2017-10-09  11508  					verbose(env,=
 "BPF_CALL uses reserved fields\n");
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11509  					return -EINV=
AL;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11510  				}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11511  =

d83525ca62cf8e Alexei Starovoitov      2019-01-31  11512  				if (env->cur_=
state->active_spin_lock &&
d83525ca62cf8e Alexei Starovoitov      2019-01-31  11513  				    (insn->sr=
c_reg =3D=3D BPF_PSEUDO_CALL ||
d83525ca62cf8e Alexei Starovoitov      2019-01-31  11514  				     insn->im=
m !=3D BPF_FUNC_spin_unlock)) {
d83525ca62cf8e Alexei Starovoitov      2019-01-31  11515  					verbose(env,=
 "function calls are not allowed while holding a lock\n");
d83525ca62cf8e Alexei Starovoitov      2019-01-31  11516  					return -EINV=
AL;
d83525ca62cf8e Alexei Starovoitov      2019-01-31  11517  				}
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  11518  				if (insn->src=
_reg =3D=3D BPF_PSEUDO_CALL)
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11519  					err =3D chec=
k_func_call(env, insn, &env->insn_idx);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  11520  				else if (insn=
->src_reg =3D=3D BPF_PSEUDO_KFUNC_CALL)
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  11521  					err =3D chec=
k_kfunc_call(env, insn);
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  11522  				else
69c087ba6225b5 Yonghong Song           2021-02-26  11523  					err =3D chec=
k_helper_call(env, insn, &env->insn_idx);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11524  				if (err)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11525  					return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11526  			} else if (opc=
ode =3D=3D BPF_JA) {
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11527  				if (BPF_SRC(i=
nsn->code) !=3D BPF_K ||
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11528  				    insn->imm=
 !=3D 0 ||
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11529  				    insn->src=
_reg !=3D BPF_REG_0 ||
092ed0968bb648 Jiong Wang              2019-01-26  11530  				    insn->dst=
_reg !=3D BPF_REG_0 ||
092ed0968bb648 Jiong Wang              2019-01-26  11531  				    class =3D=
=3D BPF_JMP32) {
61bd5218eef349 Jakub Kicinski          2017-10-09  11532  					verbose(env,=
 "BPF_JA uses reserved fields\n");
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11533  					return -EINV=
AL;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11534  				}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11535  =

c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11536  				env->insn_idx=
 +=3D insn->off + 1;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11537  				continue;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11538  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  11539  			} else if (opc=
ode =3D=3D BPF_EXIT) {
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11540  				if (BPF_SRC(i=
nsn->code) !=3D BPF_K ||
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11541  				    insn->imm=
 !=3D 0 ||
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11542  				    insn->src=
_reg !=3D BPF_REG_0 ||
092ed0968bb648 Jiong Wang              2019-01-26  11543  				    insn->dst=
_reg !=3D BPF_REG_0 ||
092ed0968bb648 Jiong Wang              2019-01-26  11544  				    class =3D=
=3D BPF_JMP32) {
61bd5218eef349 Jakub Kicinski          2017-10-09  11545  					verbose(env,=
 "BPF_EXIT uses reserved fields\n");
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11546  					return -EINV=
AL;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11547  				}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11548  =

d83525ca62cf8e Alexei Starovoitov      2019-01-31  11549  				if (env->cur_=
state->active_spin_lock) {
d83525ca62cf8e Alexei Starovoitov      2019-01-31  11550  					verbose(env,=
 "bpf_spin_unlock is missing\n");
d83525ca62cf8e Alexei Starovoitov      2019-01-31  11551  					return -EINV=
AL;
d83525ca62cf8e Alexei Starovoitov      2019-01-31  11552  				}
d83525ca62cf8e Alexei Starovoitov      2019-01-31  11553  =

f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  11554  				if (state->cu=
rframe) {
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  11555  					/* exit from=
 nested function */
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11556  					err =3D prep=
are_func_exit(env, &env->insn_idx);
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  11557  					if (err)
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  11558  						return err;
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  11559  					do_print_sta=
te =3D true;
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  11560  					continue;
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  11561  				}
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  11562  =

fd978bf7fd3125 Joe Stringer            2018-10-02  11563  				err =3D check=
_reference_leak(env);
fd978bf7fd3125 Joe Stringer            2018-10-02  11564  				if (err)
fd978bf7fd3125 Joe Stringer            2018-10-02  11565  					return err;
fd978bf7fd3125 Joe Stringer            2018-10-02  11566  =

390ee7e29fc8e6 Alexei Starovoitov      2017-10-02  11567  				err =3D check=
_return_code(env);
390ee7e29fc8e6 Alexei Starovoitov      2017-10-02  11568  				if (err)
390ee7e29fc8e6 Alexei Starovoitov      2017-10-02  11569  					return err;
f1bca824dabba4 Alexei Starovoitov      2014-09-29  11570  process_bpf_exit:
a41a40a9bfc92d Christy Lee             2021-12-13  11571  				mark_verifier=
_state_scratched(env);
2589726d12a1b1 Alexei Starovoitov      2019-06-15  11572  				update_branch=
_counts(env, env->cur_state);
b5dc0163d8fd78 Alexei Starovoitov      2019-06-15  11573  				err =3D pop_s=
tack(env, &prev_insn_idx,
6f8a57ccf85117 Andrii Nakryiko         2020-04-23  11574  						&env->insn_=
idx, pop_log);
638f5b90d46016 Alexei Starovoitov      2017-10-31  11575  				if (err < 0) {
638f5b90d46016 Alexei Starovoitov      2017-10-31  11576  					if (err !=3D=
 -ENOENT)
638f5b90d46016 Alexei Starovoitov      2017-10-31  11577  						return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11578  					break;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11579  				} else {
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11580  					do_print_sta=
te =3D true;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11581  					continue;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11582  				}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11583  			} else {
c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11584  				err =3D check=
_cond_jmp_op(env, insn, &env->insn_idx);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11585  				if (err)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11586  					return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11587  			}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11588  		} else if (clas=
s =3D=3D BPF_LD) {
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11589  			u8 mode =3D BP=
F_MODE(insn->code);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11590  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  11591  			if (mode =3D=
=3D BPF_ABS || mode =3D=3D BPF_IND) {
ddd872bc3098f9 Alexei Starovoitov      2014-12-01  11592  				err =3D check=
_ld_abs(env, insn);
ddd872bc3098f9 Alexei Starovoitov      2014-12-01  11593  				if (err)
ddd872bc3098f9 Alexei Starovoitov      2014-12-01  11594  					return err;
ddd872bc3098f9 Alexei Starovoitov      2014-12-01  11595  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  11596  			} else if (mod=
e =3D=3D BPF_IMM) {
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11597  				err =3D check=
_ld_imm(env, insn);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11598  				if (err)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11599  					return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11600  =

c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11601  				env->insn_idx=
++;
fe9a5ca7e370e6 Daniel Borkmann         2021-05-28  11602  				sanitize_mark=
_insn_seen(env);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11603  			} else {
61bd5218eef349 Jakub Kicinski          2017-10-09  11604  				verbose(env, =
"invalid BPF_LD mode\n");
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11605  				return -EINVA=
L;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11606  			}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11607  		} else {
61bd5218eef349 Jakub Kicinski          2017-10-09  11608  			verbose(env, "=
unknown insn class %d\n", class);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11609  			return -EINVAL;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11610  		}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11611  =

c08435ec7f2bc8 Daniel Borkmann         2019-01-03  11612  		env->insn_idx++;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11613  	}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11614  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  11615  	return 0;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11616  }
17a5267067f3c3 Alexei Starovoitov      2014-09-26  11617  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0724095477473138845==--

