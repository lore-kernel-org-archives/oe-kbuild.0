Content-Type: multipart/mixed; boundary="===============0359456415864536326=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/bpf/btf.c:4596:38: warning: Either the condition 't?btf_type_vlen(t):MAX_BPF_FUNC_REG_ARGS' is redundant or there is pointer arithmetic with NULL pointer. [nullPointerArithmeticRedundantCheck]
Date: Sun, 29 Aug 2021 05:42:51 +0800
Message-ID: <202108290532.6og89Snz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0359456415864536326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dmitrii Banshchikov <me@ubique.spb.ru>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   64b4fc45bea6f4faa843d2f97ff51665280efee1
commit: 523a4cf491b3c9e2d546040d57250f1a0ca84f03 bpf: Use MAX_BPF_FUNC_REG_=
ARGS macro
date:   6 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 6 months ago
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   kernel/bpf/btf.c:5723:13: warning: Boolean result is used in bitwise ope=
ration. Clarify expression with parentheses. [clarifyCondition]
    if (!uname ^ !uname_len)
               ^
>> kernel/bpf/btf.c:4596:38: warning: Either the condition 't?btf_type_vlen=
(t):MAX_BPF_FUNC_REG_ARGS' is redundant or there is pointer arithmetic with=
 NULL pointer. [nullPointerArithmeticRedundantCheck]
    args =3D (const struct btf_param *)(t + 1);
                                        ^
   kernel/bpf/btf.c:4600:14: note: Assuming that condition 't?btf_type_vlen=
(t):MAX_BPF_FUNC_REG_ARGS' is not redundant
    nr_args =3D t ? btf_type_vlen(t) : MAX_BPF_FUNC_REG_ARGS;
                ^
   kernel/bpf/btf.c:4596:38: note: Null pointer addition
    args =3D (const struct btf_param *)(t + 1);
                                        ^

vim +4596 kernel/bpf/btf.c

84ad7a7ab69f11 Jiri Olsa              2020-01-23  4576  =

9e15db66136a14 Alexei Starovoitov     2019-10-15  4577  bool btf_ctx_access=
(int off, int size, enum bpf_access_type type,
9e15db66136a14 Alexei Starovoitov     2019-10-15  4578  		    const struct =
bpf_prog *prog,
9e15db66136a14 Alexei Starovoitov     2019-10-15  4579  		    struct bpf_in=
sn_access_aux *info)
9e15db66136a14 Alexei Starovoitov     2019-10-15  4580  {
38207291604401 Martin KaFai Lau       2019-10-24  4581  	const struct btf_t=
ype *t =3D prog->aux->attach_func_proto;
3aac1ead5eb6b7 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-29  4582  	struct b=
pf_prog *tgt_prog =3D prog->aux->dst_prog;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4583  	struct btf *btf =
=3D bpf_prog_get_target_btf(prog);
38207291604401 Martin KaFai Lau       2019-10-24  4584  	const char *tname =
=3D prog->aux->attach_func_name;
9e15db66136a14 Alexei Starovoitov     2019-10-15  4585  	struct bpf_verifie=
r_log *log =3D info->log;
9e15db66136a14 Alexei Starovoitov     2019-10-15  4586  	const struct btf_p=
aram *args;
9e15db66136a14 Alexei Starovoitov     2019-10-15  4587  	u32 nr_args, arg;
3c32cc1bceba8a Yonghong Song          2020-05-13  4588  	int i, ret;
9e15db66136a14 Alexei Starovoitov     2019-10-15  4589  =

9e15db66136a14 Alexei Starovoitov     2019-10-15  4590  	if (off % 8) {
38207291604401 Martin KaFai Lau       2019-10-24  4591  		bpf_log(log, "fun=
c '%s' offset %d is not multiple of 8\n",
9e15db66136a14 Alexei Starovoitov     2019-10-15  4592  			tname, off);
9e15db66136a14 Alexei Starovoitov     2019-10-15  4593  		return false;
9e15db66136a14 Alexei Starovoitov     2019-10-15  4594  	}
9e15db66136a14 Alexei Starovoitov     2019-10-15  4595  	arg =3D off / 8;
9e15db66136a14 Alexei Starovoitov     2019-10-15 @4596  	args =3D (const st=
ruct btf_param *)(t + 1);
523a4cf491b3c9 Dmitrii Banshchikov    2021-02-26  4597  	/* if (t =3D=3D NU=
LL) Fall back to default BPF prog with
523a4cf491b3c9 Dmitrii Banshchikov    2021-02-26  4598  	 * MAX_BPF_FUNC_RE=
G_ARGS u64 arguments.
523a4cf491b3c9 Dmitrii Banshchikov    2021-02-26  4599  	 */
523a4cf491b3c9 Dmitrii Banshchikov    2021-02-26  4600  	nr_args =3D t ? bt=
f_type_vlen(t) : MAX_BPF_FUNC_REG_ARGS;
38207291604401 Martin KaFai Lau       2019-10-24  4601  	if (prog->aux->att=
ach_btf_trace) {
9e15db66136a14 Alexei Starovoitov     2019-10-15  4602  		/* skip first 'vo=
id *__data' argument in btf_trace_##name typedef */
9e15db66136a14 Alexei Starovoitov     2019-10-15  4603  		args++;
38207291604401 Martin KaFai Lau       2019-10-24  4604  		nr_args--;
38207291604401 Martin KaFai Lau       2019-10-24  4605  	}
fec56f5890d93f Alexei Starovoitov     2019-11-14  4606  =

f50b49a0bfcaf5 KP Singh               2020-03-30  4607  	if (arg > nr_args)=
 {
f50b49a0bfcaf5 KP Singh               2020-03-30  4608  		bpf_log(log, "fun=
c '%s' doesn't have %d-th argument\n",
f50b49a0bfcaf5 KP Singh               2020-03-30  4609  			tname, arg + 1);
f50b49a0bfcaf5 KP Singh               2020-03-30  4610  		return false;
f50b49a0bfcaf5 KP Singh               2020-03-30  4611  	}
f50b49a0bfcaf5 KP Singh               2020-03-30  4612  =

6ba43b761c4134 KP Singh               2020-03-04  4613  	if (arg =3D=3D nr_=
args) {
f50b49a0bfcaf5 KP Singh               2020-03-30  4614  		switch (prog->exp=
ected_attach_type) {
f50b49a0bfcaf5 KP Singh               2020-03-30  4615  		case BPF_LSM_MAC:
f50b49a0bfcaf5 KP Singh               2020-03-30  4616  		case BPF_TRACE_FE=
XIT:
9e4e01dfd3254c KP Singh               2020-03-29  4617  			/* When LSM prog=
rams are attached to void LSM hooks
9e4e01dfd3254c KP Singh               2020-03-29  4618  			 * they use FEXI=
T trampolines and when attached to
9e4e01dfd3254c KP Singh               2020-03-29  4619  			 * int LSM hooks=
, they use MODIFY_RETURN trampolines.
9e4e01dfd3254c KP Singh               2020-03-29  4620  			 *
9e4e01dfd3254c KP Singh               2020-03-29  4621  			 * While the LSM=
 programs are BPF_MODIFY_RETURN-like
9e4e01dfd3254c KP Singh               2020-03-29  4622  			 * the check:
9e4e01dfd3254c KP Singh               2020-03-29  4623  			 *
9e4e01dfd3254c KP Singh               2020-03-29  4624  			 *	if (ret_type =
!=3D 'int')
9e4e01dfd3254c KP Singh               2020-03-29  4625  			 *		return -EINV=
AL;
9e4e01dfd3254c KP Singh               2020-03-29  4626  			 *
9e4e01dfd3254c KP Singh               2020-03-29  4627  			 * is _not_ done=
 here. This is still safe as LSM hooks
9e4e01dfd3254c KP Singh               2020-03-29  4628  			 * have only voi=
d and int return types.
9e4e01dfd3254c KP Singh               2020-03-29  4629  			 */
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4630  			if (!t)
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4631  				return true;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4632  			t =3D btf_type_b=
y_id(btf, t->type);
f50b49a0bfcaf5 KP Singh               2020-03-30  4633  			break;
f50b49a0bfcaf5 KP Singh               2020-03-30  4634  		case BPF_MODIFY_R=
ETURN:
6ba43b761c4134 KP Singh               2020-03-04  4635  			/* For now the B=
PF_MODIFY_RETURN can only be attached to
6ba43b761c4134 KP Singh               2020-03-04  4636  			 * functions tha=
t return an int.
6ba43b761c4134 KP Singh               2020-03-04  4637  			 */
6ba43b761c4134 KP Singh               2020-03-04  4638  			if (!t)
6ba43b761c4134 KP Singh               2020-03-04  4639  				return false;
6ba43b761c4134 KP Singh               2020-03-04  4640  =

6ba43b761c4134 KP Singh               2020-03-04  4641  			t =3D btf_type_s=
kip_modifiers(btf, t->type, NULL);
a9b59159d338d4 John Fastabend         2020-06-24  4642  			if (!btf_type_is=
_small_int(t)) {
6ba43b761c4134 KP Singh               2020-03-04  4643  				bpf_log(log,
6ba43b761c4134 KP Singh               2020-03-04  4644  					"ret type %s n=
ot allowed for fmod_ret\n",
6ba43b761c4134 KP Singh               2020-03-04  4645  					btf_kind_str[B=
TF_INFO_KIND(t->info)]);
6ba43b761c4134 KP Singh               2020-03-04  4646  				return false;
6ba43b761c4134 KP Singh               2020-03-04  4647  			}
f50b49a0bfcaf5 KP Singh               2020-03-30  4648  			break;
f50b49a0bfcaf5 KP Singh               2020-03-30  4649  		default:
38207291604401 Martin KaFai Lau       2019-10-24  4650  			bpf_log(log, "fu=
nc '%s' doesn't have %d-th argument\n",
fec56f5890d93f Alexei Starovoitov     2019-11-14  4651  				tname, arg + 1);
9e15db66136a14 Alexei Starovoitov     2019-10-15  4652  			return false;
f50b49a0bfcaf5 KP Singh               2020-03-30  4653  		}
fec56f5890d93f Alexei Starovoitov     2019-11-14  4654  	} else {
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4655  		if (!t)
523a4cf491b3c9 Dmitrii Banshchikov    2021-02-26  4656  			/* Default prog =
with MAX_BPF_FUNC_REG_ARGS args */
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4657  			return true;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4658  		t =3D btf_type_by=
_id(btf, args[arg].type);
fec56f5890d93f Alexei Starovoitov     2019-11-14  4659  	}
f50b49a0bfcaf5 KP Singh               2020-03-30  4660  =

9e15db66136a14 Alexei Starovoitov     2019-10-15  4661  	/* skip modifiers =
*/
9e15db66136a14 Alexei Starovoitov     2019-10-15  4662  	while (btf_type_is=
_modifier(t))
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4663  		t =3D btf_type_by=
_id(btf, t->type);
a9b59159d338d4 John Fastabend         2020-06-24  4664  	if (btf_type_is_sm=
all_int(t) || btf_type_is_enum(t))
9e15db66136a14 Alexei Starovoitov     2019-10-15  4665  		/* accessing a sc=
alar */
9e15db66136a14 Alexei Starovoitov     2019-10-15  4666  		return true;
9e15db66136a14 Alexei Starovoitov     2019-10-15  4667  	if (!btf_type_is_p=
tr(t)) {
9e15db66136a14 Alexei Starovoitov     2019-10-15  4668  		bpf_log(log,
38207291604401 Martin KaFai Lau       2019-10-24  4669  			"func '%s' arg%d=
 '%s' has type %s. Only pointer access is allowed\n",
9e15db66136a14 Alexei Starovoitov     2019-10-15  4670  			tname, arg,
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4671  			__btf_name_by_of=
fset(btf, t->name_off),
9e15db66136a14 Alexei Starovoitov     2019-10-15  4672  			btf_kind_str[BTF=
_INFO_KIND(t->info)]);
9e15db66136a14 Alexei Starovoitov     2019-10-15  4673  		return false;
9e15db66136a14 Alexei Starovoitov     2019-10-15  4674  	}
afbf21dce668ef Yonghong Song          2020-07-23  4675  =

afbf21dce668ef Yonghong Song          2020-07-23  4676  	/* check for PTR_T=
O_RDONLY_BUF_OR_NULL or PTR_TO_RDWR_BUF_OR_NULL */
afbf21dce668ef Yonghong Song          2020-07-23  4677  	for (i =3D 0; i < =
prog->aux->ctx_arg_info_size; i++) {
afbf21dce668ef Yonghong Song          2020-07-23  4678  		const struct bpf_=
ctx_arg_aux *ctx_arg_info =3D &prog->aux->ctx_arg_info[i];
afbf21dce668ef Yonghong Song          2020-07-23  4679  =

afbf21dce668ef Yonghong Song          2020-07-23  4680  		if (ctx_arg_info-=
>offset =3D=3D off &&
afbf21dce668ef Yonghong Song          2020-07-23  4681  		    (ctx_arg_info=
->reg_type =3D=3D PTR_TO_RDONLY_BUF_OR_NULL ||
afbf21dce668ef Yonghong Song          2020-07-23  4682  		     ctx_arg_info=
->reg_type =3D=3D PTR_TO_RDWR_BUF_OR_NULL)) {
afbf21dce668ef Yonghong Song          2020-07-23  4683  			info->reg_type =
=3D ctx_arg_info->reg_type;
afbf21dce668ef Yonghong Song          2020-07-23  4684  			return true;
afbf21dce668ef Yonghong Song          2020-07-23  4685  		}
afbf21dce668ef Yonghong Song          2020-07-23  4686  	}
afbf21dce668ef Yonghong Song          2020-07-23  4687  =

9e15db66136a14 Alexei Starovoitov     2019-10-15  4688  	if (t->type =3D=3D=
 0)
9e15db66136a14 Alexei Starovoitov     2019-10-15  4689  		/* This is a poin=
ter to void.
9e15db66136a14 Alexei Starovoitov     2019-10-15  4690  		 * It is the same=
 as scalar from the verifier safety pov.
9e15db66136a14 Alexei Starovoitov     2019-10-15  4691  		 * No further poi=
nter walking is allowed.
9e15db66136a14 Alexei Starovoitov     2019-10-15  4692  		 */
9e15db66136a14 Alexei Starovoitov     2019-10-15  4693  		return true;
9e15db66136a14 Alexei Starovoitov     2019-10-15  4694  =

84ad7a7ab69f11 Jiri Olsa              2020-01-23  4695  	if (is_string_ptr(=
btf, t))
84ad7a7ab69f11 Jiri Olsa              2020-01-23  4696  		return true;
84ad7a7ab69f11 Jiri Olsa              2020-01-23  4697  =

9e15db66136a14 Alexei Starovoitov     2019-10-15  4698  	/* this is a point=
er to another type */
3c32cc1bceba8a Yonghong Song          2020-05-13  4699  	for (i =3D 0; i < =
prog->aux->ctx_arg_info_size; i++) {
3c32cc1bceba8a Yonghong Song          2020-05-13  4700  		const struct bpf_=
ctx_arg_aux *ctx_arg_info =3D &prog->aux->ctx_arg_info[i];
3c32cc1bceba8a Yonghong Song          2020-05-13  4701  =

3c32cc1bceba8a Yonghong Song          2020-05-13  4702  		if (ctx_arg_info-=
>offset =3D=3D off) {
3c32cc1bceba8a Yonghong Song          2020-05-13  4703  			info->reg_type =
=3D ctx_arg_info->reg_type;
22dc4a0f5ed11b Andrii Nakryiko        2020-12-03  4704  			info->btf =3D bt=
f_vmlinux;
951cf368bcb11d Yonghong Song          2020-07-20  4705  			info->btf_id =3D=
 ctx_arg_info->btf_id;
951cf368bcb11d Yonghong Song          2020-07-20  4706  			return true;
3c32cc1bceba8a Yonghong Song          2020-05-13  4707  		}
3c32cc1bceba8a Yonghong Song          2020-05-13  4708  	}
9e15db66136a14 Alexei Starovoitov     2019-10-15  4709  =

951cf368bcb11d Yonghong Song          2020-07-20  4710  	info->reg_type =3D=
 PTR_TO_BTF_ID;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4711  	if (tgt_prog) {
43bc2874e779c1 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-29  4712  		enum bp=
f_prog_type tgt_type;
43bc2874e779c1 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-29  4713  =

43bc2874e779c1 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-29  4714  		if (tgt=
_prog->type =3D=3D BPF_PROG_TYPE_EXT)
43bc2874e779c1 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-29  4715  			tgt_ty=
pe =3D tgt_prog->aux->saved_dst_prog_type;
43bc2874e779c1 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-29  4716  		else
43bc2874e779c1 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-29  4717  			tgt_ty=
pe =3D tgt_prog->type;
43bc2874e779c1 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-29  4718  =

43bc2874e779c1 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-29  4719  		ret =3D=
 btf_translate_to_vmlinux(log, btf, t, tgt_type, arg);
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4720  		if (ret > 0) {
22dc4a0f5ed11b Andrii Nakryiko        2020-12-03  4721  			info->btf =3D bt=
f_vmlinux;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4722  			info->btf_id =3D=
 ret;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4723  			return true;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4724  		} else {
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4725  			return false;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4726  		}
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4727  	}
275517ff452a53 Martin KaFai Lau       2020-01-08  4728  =

22dc4a0f5ed11b Andrii Nakryiko        2020-12-03  4729  	info->btf =3D btf;
275517ff452a53 Martin KaFai Lau       2020-01-08  4730  	info->btf_id =3D t=
->type;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4731  	t =3D btf_type_by_=
id(btf, t->type);
9e15db66136a14 Alexei Starovoitov     2019-10-15  4732  	/* skip modifiers =
*/
275517ff452a53 Martin KaFai Lau       2020-01-08  4733  	while (btf_type_is=
_modifier(t)) {
275517ff452a53 Martin KaFai Lau       2020-01-08  4734  		info->btf_id =3D =
t->type;
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4735  		t =3D btf_type_by=
_id(btf, t->type);
275517ff452a53 Martin KaFai Lau       2020-01-08  4736  	}
9e15db66136a14 Alexei Starovoitov     2019-10-15  4737  	if (!btf_type_is_s=
truct(t)) {
9e15db66136a14 Alexei Starovoitov     2019-10-15  4738  		bpf_log(log,
38207291604401 Martin KaFai Lau       2019-10-24  4739  			"func '%s' arg%d=
 type %s is not a struct\n",
9e15db66136a14 Alexei Starovoitov     2019-10-15  4740  			tname, arg, btf_=
kind_str[BTF_INFO_KIND(t->info)]);
9e15db66136a14 Alexei Starovoitov     2019-10-15  4741  		return false;
9e15db66136a14 Alexei Starovoitov     2019-10-15  4742  	}
38207291604401 Martin KaFai Lau       2019-10-24  4743  	bpf_log(log, "func=
 '%s' arg%d has btf_id %d type %s '%s'\n",
9e15db66136a14 Alexei Starovoitov     2019-10-15  4744  		tname, arg, info-=
>btf_id, btf_kind_str[BTF_INFO_KIND(t->info)],
5b92a28aae4dd0 Alexei Starovoitov     2019-11-14  4745  		__btf_name_by_off=
set(btf, t->name_off));
9e15db66136a14 Alexei Starovoitov     2019-10-15  4746  	return true;
9e15db66136a14 Alexei Starovoitov     2019-10-15  4747  }
9e15db66136a14 Alexei Starovoitov     2019-10-15  4748  =


:::::: The code at line 4596 was first introduced by commit
:::::: 9e15db66136a14cde3f35691f1d839d950118826 bpf: Implement accurate raw=
_tp context access via BTF

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0359456415864536326==--

