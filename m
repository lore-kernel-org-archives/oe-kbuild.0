Content-Type: multipart/mixed; boundary="===============8301911534554590969=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH bpf-next 3/4] bpf: add bpf_panic() helper
Date: Fri, 15 Jul 2022 04:07:44 +0800
Message-ID: <202207150346.TnA47mD1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8301911534554590969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: kernel/bp=
f/verifier.c:7266:17: sparse: sparse: typename in expression"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220711083220.2175036-4-asavkov@redhat.com>
References: <20220711083220.2175036-4-asavkov@redhat.com>
TO: Artem Savkov <asavkov@redhat.com>

Hi Artem,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf/master]
[also build test WARNING on net/master linus/master v5.19-rc6]
[cannot apply to bpf-next/master horms-ipvs/master net-next/master next-202=
20714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Artem-Savkov/bpf_pan=
ic-helper/20220711-163442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20220=
715/202207150346.TnA47mD1-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/8aba500c3f61dcf538c=
8458a34f90f81279269a2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Artem-Savkov/bpf_panic-helper/2022=
0711-163442
        git checkout 8aba500c3f61dcf538c8458a34f90f81279269a2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash ./ kernel/bpf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/verifier.c:7266:17: sparse: sparse: typename in expression
   kernel/bpf/verifier.c:7266:24: sparse: sparse: Expected ; at end of stat=
ement
   kernel/bpf/verifier.c:7266:24: sparse: sparse: got bpf_prog_aux
   kernel/bpf/verifier.c:7266:17: sparse: sparse: undefined identifier 'str=
uct'
   kernel/bpf/verifier.c:7267:22: sparse: sparse: undefined identifier 'aux'
   kernel/bpf/verifier.c:14260:38: sparse: sparse: subtraction of functions=
? Share your drugs

vim +7266 kernel/bpf/verifier.c

9b99edcae5c80c Jiri Olsa               2021-07-14  7102  =

69c087ba6225b5 Yonghong Song           2021-02-26  7103  static int check_h=
elper_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
69c087ba6225b5 Yonghong Song           2021-02-26  7104  			     int *insn_=
idx_p)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7105  {
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7106  	const struct bpf_=
func_proto *fn =3D NULL;
3c4807322660d4 Hao Luo                 2021-12-16  7107  	enum bpf_return_t=
ype ret_type;
c25b2ae136039f Hao Luo                 2021-12-16  7108  	enum bpf_type_fla=
g ret_flag;
638f5b90d46016 Alexei Starovoitov      2017-10-31  7109  	struct bpf_reg_st=
ate *regs;
33ff9823c569f3 Daniel Borkmann         2016-04-13  7110  	struct bpf_call_a=
rg_meta meta;
69c087ba6225b5 Yonghong Song           2021-02-26  7111  	int insn_idx =3D =
*insn_idx_p;
969bf05eb3cedd Alexei Starovoitov      2016-05-05  7112  	bool changes_data;
69c087ba6225b5 Yonghong Song           2021-02-26  7113  	int i, err, func_=
id;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7114  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  7115  	/* find function =
prototype */
69c087ba6225b5 Yonghong Song           2021-02-26  7116  	func_id =3D insn-=
>imm;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7117  	if (func_id < 0 |=
| func_id >=3D __BPF_FUNC_MAX_ID) {
61bd5218eef349 Jakub Kicinski          2017-10-09  7118  		verbose(env, "in=
valid func %s#%d\n", func_id_name(func_id),
61bd5218eef349 Jakub Kicinski          2017-10-09  7119  			func_id);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7120  		return -EINVAL;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7121  	}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7122  =

00176a34d9e27a Jakub Kicinski          2017-10-16  7123  	if (env->ops->get=
_func_proto)
5e43f899b03a34 Andrey Ignatov          2018-03-30  7124  		fn =3D env->ops-=
>get_func_proto(func_id, env->prog);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7125  	if (!fn) {
61bd5218eef349 Jakub Kicinski          2017-10-09  7126  		verbose(env, "un=
known func %s#%d\n", func_id_name(func_id),
61bd5218eef349 Jakub Kicinski          2017-10-09  7127  			func_id);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7128  		return -EINVAL;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7129  	}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7130  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  7131  	/* eBPF programs =
must be GPL compatible to use GPL-ed functions */
24701ecea76b0b Daniel Borkmann         2015-03-01  7132  	if (!env->prog->g=
pl_compatible && fn->gpl_only) {
3fe2867cdf088f Daniel Borkmann         2018-06-02  7133  		verbose(env, "ca=
nnot call GPL-restricted function from non-GPL compatible program\n");
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7134  		return -EINVAL;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7135  	}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7136  =

eae2e83e62633a Jiri Olsa               2020-08-25  7137  	if (fn->allowed &=
& !fn->allowed(env->prog)) {
eae2e83e62633a Jiri Olsa               2020-08-25  7138  		verbose(env, "he=
lper call is not allowed in probe\n");
eae2e83e62633a Jiri Olsa               2020-08-25  7139  		return -EINVAL;
eae2e83e62633a Jiri Olsa               2020-08-25  7140  	}
eae2e83e62633a Jiri Olsa               2020-08-25  7141  =

04514d13222f2c Daniel Borkmann         2017-12-14  7142  	/* With LD_ABS/IN=
D some JITs save/restore skb from r1. */
17bedab2723145 Martin KaFai Lau        2016-12-07  7143  	changes_data =3D =
bpf_helper_changes_pkt_data(fn->func);
04514d13222f2c Daniel Borkmann         2017-12-14  7144  	if (changes_data =
&& fn->arg1_type !=3D ARG_PTR_TO_CTX) {
04514d13222f2c Daniel Borkmann         2017-12-14  7145  		verbose(env, "ke=
rnel subsystem misconfigured func %s#%d: r1 !=3D ctx\n",
04514d13222f2c Daniel Borkmann         2017-12-14  7146  			func_id_name(fu=
nc_id), func_id);
04514d13222f2c Daniel Borkmann         2017-12-14  7147  		return -EINVAL;
04514d13222f2c Daniel Borkmann         2017-12-14  7148  	}
969bf05eb3cedd Alexei Starovoitov      2016-05-05  7149  =

33ff9823c569f3 Daniel Borkmann         2016-04-13  7150  	memset(&meta, 0, =
sizeof(meta));
36bbef52c7eb64 Daniel Borkmann         2016-09-20  7151  	meta.pkt_access =
=3D fn->pkt_access;
33ff9823c569f3 Daniel Borkmann         2016-04-13  7152  =

8f14852e89113d Kumar Kartikeya Dwivedi 2022-04-25  7153  	err =3D check_fun=
c_proto(fn, func_id, &meta);
435faee1aae9c1 Daniel Borkmann         2016-04-13  7154  	if (err) {
61bd5218eef349 Jakub Kicinski          2017-10-09  7155  		verbose(env, "ke=
rnel subsystem misconfigured func %s#%d\n",
ebb676daa1a340 Thomas Graf             2016-10-27  7156  			func_id_name(fu=
nc_id), func_id);
435faee1aae9c1 Daniel Borkmann         2016-04-13  7157  		return err;
435faee1aae9c1 Daniel Borkmann         2016-04-13  7158  	}
435faee1aae9c1 Daniel Borkmann         2016-04-13  7159  =

d83525ca62cf8e Alexei Starovoitov      2019-01-31  7160  	meta.func_id =3D =
func_id;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7161  	/* check args */
523a4cf491b3c9 Dmitrii Banshchikov     2021-02-26  7162  	for (i =3D 0; i <=
 MAX_BPF_FUNC_REG_ARGS; i++) {
af7ec13833619e Yonghong Song           2020-06-23  7163  		err =3D check_fu=
nc_arg(env, i, &meta, fn);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7164  		if (err)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7165  			return err;
a7658e1a4164ce Alexei Starovoitov      2019-10-15  7166  	}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7167  =

c93552c443ebc6 Daniel Borkmann         2018-05-24  7168  	err =3D record_fu=
nc_map(env, &meta, func_id, insn_idx);
c93552c443ebc6 Daniel Borkmann         2018-05-24  7169  	if (err)
c93552c443ebc6 Daniel Borkmann         2018-05-24  7170  		return err;
c93552c443ebc6 Daniel Borkmann         2018-05-24  7171  =

d2e4c1e6c29472 Daniel Borkmann         2019-11-22  7172  	err =3D record_fu=
nc_key(env, &meta, func_id, insn_idx);
d2e4c1e6c29472 Daniel Borkmann         2019-11-22  7173  	if (err)
d2e4c1e6c29472 Daniel Borkmann         2019-11-22  7174  		return err;
d2e4c1e6c29472 Daniel Borkmann         2019-11-22  7175  =

435faee1aae9c1 Daniel Borkmann         2016-04-13  7176  	/* Mark slots wit=
h STACK_MISC in case of raw mode, stack offset
435faee1aae9c1 Daniel Borkmann         2016-04-13  7177  	 * is inferred fr=
om register state.
435faee1aae9c1 Daniel Borkmann         2016-04-13  7178  	 */
435faee1aae9c1 Daniel Borkmann         2016-04-13  7179  	for (i =3D 0; i <=
 meta.access_size; i++) {
ca36960211eb22 Daniel Borkmann         2018-02-23  7180  		err =3D check_me=
m_access(env, insn_idx, meta.regno, i, BPF_B,
ca36960211eb22 Daniel Borkmann         2018-02-23  7181  				       BPF_WRI=
TE, -1, false);
435faee1aae9c1 Daniel Borkmann         2016-04-13  7182  		if (err)
435faee1aae9c1 Daniel Borkmann         2016-04-13  7183  			return err;
435faee1aae9c1 Daniel Borkmann         2016-04-13  7184  	}
435faee1aae9c1 Daniel Borkmann         2016-04-13  7185  =

8f14852e89113d Kumar Kartikeya Dwivedi 2022-04-25  7186  	regs =3D cur_regs=
(env);
8f14852e89113d Kumar Kartikeya Dwivedi 2022-04-25  7187  =

97e03f521050c0 Joanne Koong            2022-05-23  7188  	if (meta.uninit_d=
ynptr_regno) {
97e03f521050c0 Joanne Koong            2022-05-23  7189  		/* we write BPF_=
DW bits (8 bytes)@a time */
97e03f521050c0 Joanne Koong            2022-05-23  7190  		for (i =3D 0; i =
< BPF_DYNPTR_SIZE; i +=3D 8) {
97e03f521050c0 Joanne Koong            2022-05-23  7191  			err =3D check_m=
em_access(env, insn_idx, meta.uninit_dynptr_regno,
97e03f521050c0 Joanne Koong            2022-05-23  7192  					       i, BPF=
_DW, BPF_WRITE, -1, false);
97e03f521050c0 Joanne Koong            2022-05-23  7193  			if (err)
97e03f521050c0 Joanne Koong            2022-05-23  7194  				return err;
97e03f521050c0 Joanne Koong            2022-05-23  7195  		}
97e03f521050c0 Joanne Koong            2022-05-23  7196  =

97e03f521050c0 Joanne Koong            2022-05-23  7197  		err =3D mark_sta=
ck_slots_dynptr(env, &regs[meta.uninit_dynptr_regno],
97e03f521050c0 Joanne Koong            2022-05-23  7198  					      fn->arg=
_type[meta.uninit_dynptr_regno - BPF_REG_1],
97e03f521050c0 Joanne Koong            2022-05-23  7199  					      insn_id=
x);
97e03f521050c0 Joanne Koong            2022-05-23  7200  		if (err)
97e03f521050c0 Joanne Koong            2022-05-23  7201  			return err;
97e03f521050c0 Joanne Koong            2022-05-23  7202  	}
97e03f521050c0 Joanne Koong            2022-05-23  7203  =

8f14852e89113d Kumar Kartikeya Dwivedi 2022-04-25  7204  	if (meta.release_=
regno) {
8f14852e89113d Kumar Kartikeya Dwivedi 2022-04-25  7205  		err =3D -EINVAL;
97e03f521050c0 Joanne Koong            2022-05-23  7206  		if (arg_type_is_=
dynptr(fn->arg_type[meta.release_regno - BPF_REG_1]))
97e03f521050c0 Joanne Koong            2022-05-23  7207  			err =3D unmark_=
stack_slots_dynptr(env, &regs[meta.release_regno]);
97e03f521050c0 Joanne Koong            2022-05-23  7208  		else if (meta.re=
f_obj_id)
1b986589680a2a Martin KaFai Lau        2019-03-12  7209  			err =3D release=
_reference(env, meta.ref_obj_id);
8f14852e89113d Kumar Kartikeya Dwivedi 2022-04-25  7210  		/* meta.ref_obj_=
id can only be 0 if register that is meant to be
8f14852e89113d Kumar Kartikeya Dwivedi 2022-04-25  7211  		 * released is N=
ULL, which must be > R0.
8f14852e89113d Kumar Kartikeya Dwivedi 2022-04-25  7212  		 */
8f14852e89113d Kumar Kartikeya Dwivedi 2022-04-25  7213  		else if (registe=
r_is_null(&regs[meta.release_regno]))
8f14852e89113d Kumar Kartikeya Dwivedi 2022-04-25  7214  			err =3D 0;
46f8bc92758c62 Martin KaFai Lau        2019-02-09  7215  		if (err) {
46f8bc92758c62 Martin KaFai Lau        2019-02-09  7216  			verbose(env, "f=
unc %s#%d reference has not been acquired before\n",
46f8bc92758c62 Martin KaFai Lau        2019-02-09  7217  				func_id_name(f=
unc_id), func_id);
fd978bf7fd3125 Joe Stringer            2018-10-02  7218  			return err;
fd978bf7fd3125 Joe Stringer            2018-10-02  7219  		}
46f8bc92758c62 Martin KaFai Lau        2019-02-09  7220  	}
fd978bf7fd3125 Joe Stringer            2018-10-02  7221  =

e6f2dd0f80674e Joanne Koong            2021-11-29  7222  	switch (func_id) {
e6f2dd0f80674e Joanne Koong            2021-11-29  7223  	case BPF_FUNC_tai=
l_call:
e6f2dd0f80674e Joanne Koong            2021-11-29  7224  		err =3D check_re=
ference_leak(env);
e6f2dd0f80674e Joanne Koong            2021-11-29  7225  		if (err) {
e6f2dd0f80674e Joanne Koong            2021-11-29  7226  			verbose(env, "t=
ail_call would lead to reference leak\n");
e6f2dd0f80674e Joanne Koong            2021-11-29  7227  			return err;
e6f2dd0f80674e Joanne Koong            2021-11-29  7228  		}
e6f2dd0f80674e Joanne Koong            2021-11-29  7229  		break;
e6f2dd0f80674e Joanne Koong            2021-11-29  7230  	case BPF_FUNC_get=
_local_storage:
cd339431765383 Roman Gushchin          2018-08-02  7231  		/* check that fl=
ags argument in get_local_storage(map, flags) is 0,
cd339431765383 Roman Gushchin          2018-08-02  7232  		 * this is requi=
red because get_local_storage() can't return an error.
cd339431765383 Roman Gushchin          2018-08-02  7233  		 */
e6f2dd0f80674e Joanne Koong            2021-11-29  7234  		if (!register_is=
_null(&regs[BPF_REG_2])) {
cd339431765383 Roman Gushchin          2018-08-02  7235  			verbose(env, "g=
et_local_storage() doesn't support non-zero flags\n");
cd339431765383 Roman Gushchin          2018-08-02  7236  			return -EINVAL;
cd339431765383 Roman Gushchin          2018-08-02  7237  		}
e6f2dd0f80674e Joanne Koong            2021-11-29  7238  		break;
e6f2dd0f80674e Joanne Koong            2021-11-29  7239  	case BPF_FUNC_for=
_each_map_elem:
69c087ba6225b5 Yonghong Song           2021-02-26  7240  		err =3D __check_=
func_call(env, insn, insn_idx_p, meta.subprogno,
69c087ba6225b5 Yonghong Song           2021-02-26  7241  					set_map_elem_=
callback_state);
e6f2dd0f80674e Joanne Koong            2021-11-29  7242  		break;
e6f2dd0f80674e Joanne Koong            2021-11-29  7243  	case BPF_FUNC_tim=
er_set_callback:
b00628b1c7d595 Alexei Starovoitov      2021-07-14  7244  		err =3D __check_=
func_call(env, insn, insn_idx_p, meta.subprogno,
b00628b1c7d595 Alexei Starovoitov      2021-07-14  7245  					set_timer_cal=
lback_state);
e6f2dd0f80674e Joanne Koong            2021-11-29  7246  		break;
e6f2dd0f80674e Joanne Koong            2021-11-29  7247  	case BPF_FUNC_fin=
d_vma:
7c7e3d31e7856a Song Liu                2021-11-05  7248  		err =3D __check_=
func_call(env, insn, insn_idx_p, meta.subprogno,
7c7e3d31e7856a Song Liu                2021-11-05  7249  					set_find_vma_=
callback_state);
e6f2dd0f80674e Joanne Koong            2021-11-29  7250  		break;
e6f2dd0f80674e Joanne Koong            2021-11-29  7251  	case BPF_FUNC_snp=
rintf:
e6f2dd0f80674e Joanne Koong            2021-11-29  7252  		err =3D check_bp=
f_snprintf_call(env, regs);
e6f2dd0f80674e Joanne Koong            2021-11-29  7253  		break;
e6f2dd0f80674e Joanne Koong            2021-11-29  7254  	case BPF_FUNC_loo=
p:
e6f2dd0f80674e Joanne Koong            2021-11-29  7255  		err =3D __check_=
func_call(env, insn, insn_idx_p, meta.subprogno,
e6f2dd0f80674e Joanne Koong            2021-11-29  7256  					set_loop_call=
back_state);
e6f2dd0f80674e Joanne Koong            2021-11-29  7257  		break;
263ae152e96253 Joanne Koong            2022-05-23  7258  	case BPF_FUNC_dyn=
ptr_from_mem:
263ae152e96253 Joanne Koong            2022-05-23  7259  		if (regs[BPF_REG=
_1].type !=3D PTR_TO_MAP_VALUE) {
263ae152e96253 Joanne Koong            2022-05-23  7260  			verbose(env, "U=
nsupported reg type %s for bpf_dynptr_from_mem data\n",
263ae152e96253 Joanne Koong            2022-05-23  7261  				reg_type_str(e=
nv, regs[BPF_REG_1].type));
263ae152e96253 Joanne Koong            2022-05-23  7262  			return -EACCES;
263ae152e96253 Joanne Koong            2022-05-23  7263  		}
8aba500c3f61dc Artem Savkov            2022-07-11  7264  		break;
8aba500c3f61dc Artem Savkov            2022-07-11  7265  	case BPF_FUNC_pan=
ic:
8aba500c3f61dc Artem Savkov            2022-07-11 @7266  		struct bpf_prog_=
aux *aux =3D env->prog->aux;
8aba500c3f61dc Artem Savkov            2022-07-11  7267  		if (!aux->destru=
ctive) {
8aba500c3f61dc Artem Savkov            2022-07-11  7268  			verbose(env, "b=
pf_panic() calls require BPF_F_DESTRUCTIVE flag\n");
8aba500c3f61dc Artem Savkov            2022-07-11  7269  			return -EACCES;
8aba500c3f61dc Artem Savkov            2022-07-11  7270  		}
7c7e3d31e7856a Song Liu                2021-11-05  7271  	}
7c7e3d31e7856a Song Liu                2021-11-05  7272  =

e6f2dd0f80674e Joanne Koong            2021-11-29  7273  	if (err)
7b15523a989b63 Florent Revest          2021-04-19  7274  		return err;
7b15523a989b63 Florent Revest          2021-04-19  7275  =

17a5267067f3c3 Alexei Starovoitov      2014-09-26  7276  	/* reset caller s=
aved regs */
dc503a8ad98474 Edward Cree             2017-08-15  7277  	for (i =3D 0; i <=
 CALLER_SAVED_REGS; i++) {
61bd5218eef349 Jakub Kicinski          2017-10-09  7278  		mark_reg_not_ini=
t(env, regs, caller_saved[i]);
dc503a8ad98474 Edward Cree             2017-08-15  7279  		check_reg_arg(en=
v, caller_saved[i], DST_OP_NO_MARK);
dc503a8ad98474 Edward Cree             2017-08-15  7280  	}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7281  =

5327ed3d44b754 Jiong Wang              2019-05-24  7282  	/* helper call re=
turns 64-bit value. */
5327ed3d44b754 Jiong Wang              2019-05-24  7283  	regs[BPF_REG_0].s=
ubreg_def =3D DEF_NOT_SUBREG;
5327ed3d44b754 Jiong Wang              2019-05-24  7284  =

dc503a8ad98474 Edward Cree             2017-08-15  7285  	/* update return =
register (already marked as written above) */
3c4807322660d4 Hao Luo                 2021-12-16  7286  	ret_type =3D fn->=
ret_type;
c25b2ae136039f Hao Luo                 2021-12-16  7287  	ret_flag =3D type=
_flag(fn->ret_type);
3c4807322660d4 Hao Luo                 2021-12-16  7288  	if (ret_type =3D=
=3D RET_INTEGER) {
f1174f77b50c94 Edward Cree             2017-08-07  7289  		/* sets type to =
SCALAR_VALUE */
61bd5218eef349 Jakub Kicinski          2017-10-09  7290  		mark_reg_unknown=
(env, regs, BPF_REG_0);
3c4807322660d4 Hao Luo                 2021-12-16  7291  	} else if (ret_ty=
pe =3D=3D RET_VOID) {
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7292  		regs[BPF_REG_0].=
type =3D NOT_INIT;
3c4807322660d4 Hao Luo                 2021-12-16  7293  	} else if (base_t=
ype(ret_type) =3D=3D RET_PTR_TO_MAP_VALUE) {
f1174f77b50c94 Edward Cree             2017-08-07  7294  		/* There is no o=
ffset yet applied, variable or fixed */
61bd5218eef349 Jakub Kicinski          2017-10-09  7295  		mark_reg_known_z=
ero(env, regs, BPF_REG_0);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7296  		/* remember map_=
ptr, so that check_map_access()
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7297  		 * can check 'va=
lue_size' boundary of memory access
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7298  		 * to map elemen=
t returned from bpf_map_lookup_elem()
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7299  		 */
33ff9823c569f3 Daniel Borkmann         2016-04-13  7300  		if (meta.map_ptr=
 =3D=3D NULL) {
61bd5218eef349 Jakub Kicinski          2017-10-09  7301  			verbose(env,
61bd5218eef349 Jakub Kicinski          2017-10-09  7302  				"kernel subsys=
tem misconfigured verifier\n");
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7303  			return -EINVAL;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7304  		}
33ff9823c569f3 Daniel Borkmann         2016-04-13  7305  		regs[BPF_REG_0].=
map_ptr =3D meta.map_ptr;
3e8ce29850f183 Alexei Starovoitov      2021-07-14  7306  		regs[BPF_REG_0].=
map_uid =3D meta.map_uid;
c25b2ae136039f Hao Luo                 2021-12-16  7307  		regs[BPF_REG_0].=
type =3D PTR_TO_MAP_VALUE | ret_flag;
c25b2ae136039f Hao Luo                 2021-12-16  7308  		if (!type_may_be=
_null(ret_type) &&
c25b2ae136039f Hao Luo                 2021-12-16  7309  		    map_value_ha=
s_spin_lock(meta.map_ptr)) {
e16d2f1ab96849 Alexei Starovoitov      2019-01-31  7310  			regs[BPF_REG_0]=
.id =3D ++env->id_gen;
4d31f30148cea6 Daniel Borkmann         2018-11-01  7311  		}
3c4807322660d4 Hao Luo                 2021-12-16  7312  	} else if (base_t=
ype(ret_type) =3D=3D RET_PTR_TO_SOCKET) {
46f8bc92758c62 Martin KaFai Lau        2019-02-09  7313  		mark_reg_known_z=
ero(env, regs, BPF_REG_0);
c25b2ae136039f Hao Luo                 2021-12-16  7314  		regs[BPF_REG_0].=
type =3D PTR_TO_SOCKET | ret_flag;
3c4807322660d4 Hao Luo                 2021-12-16  7315  	} else if (base_t=
ype(ret_type) =3D=3D RET_PTR_TO_SOCK_COMMON) {
85a51f8c28b981 Lorenz Bauer            2019-03-22  7316  		mark_reg_known_z=
ero(env, regs, BPF_REG_0);
c25b2ae136039f Hao Luo                 2021-12-16  7317  		regs[BPF_REG_0].=
type =3D PTR_TO_SOCK_COMMON | ret_flag;
3c4807322660d4 Hao Luo                 2021-12-16  7318  	} else if (base_t=
ype(ret_type) =3D=3D RET_PTR_TO_TCP_SOCK) {
655a51e536c09d Martin KaFai Lau        2019-02-09  7319  		mark_reg_known_z=
ero(env, regs, BPF_REG_0);
c25b2ae136039f Hao Luo                 2021-12-16  7320  		regs[BPF_REG_0].=
type =3D PTR_TO_TCP_SOCK | ret_flag;
3c4807322660d4 Hao Luo                 2021-12-16  7321  	} else if (base_t=
ype(ret_type) =3D=3D RET_PTR_TO_ALLOC_MEM) {
457f44363a8894 Andrii Nakryiko         2020-05-29  7322  		mark_reg_known_z=
ero(env, regs, BPF_REG_0);
c25b2ae136039f Hao Luo                 2021-12-16  7323  		regs[BPF_REG_0].=
type =3D PTR_TO_MEM | ret_flag;
457f44363a8894 Andrii Nakryiko         2020-05-29  7324  		regs[BPF_REG_0].=
mem_size =3D meta.mem_size;
3c4807322660d4 Hao Luo                 2021-12-16  7325  	} else if (base_t=
ype(ret_type) =3D=3D RET_PTR_TO_MEM_OR_BTF_ID) {
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7326  		const struct btf=
_type *t;
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7327  =

eaa6bcb71ef6ed Hao Luo                 2020-09-29  7328  		mark_reg_known_z=
ero(env, regs, BPF_REG_0);
22dc4a0f5ed11b Andrii Nakryiko         2020-12-03  7329  		t =3D btf_type_s=
kip_modifiers(meta.ret_btf, meta.ret_btf_id, NULL);
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7330  		if (!btf_type_is=
_struct(t)) {
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7331  			u32 tsize;
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7332  			const struct bt=
f_type *ret;
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7333  			const char *tna=
me;
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7334  =

eaa6bcb71ef6ed Hao Luo                 2020-09-29  7335  			/* resolve the =
type size of ksym. */
22dc4a0f5ed11b Andrii Nakryiko         2020-12-03  7336  			ret =3D btf_res=
olve_size(meta.ret_btf, t, &tsize);
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7337  			if (IS_ERR(ret)=
) {
22dc4a0f5ed11b Andrii Nakryiko         2020-12-03  7338  				tname =3D btf_=
name_by_offset(meta.ret_btf, t->name_off);
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7339  				verbose(env, "=
unable to resolve the size of type '%s': %ld\n",
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7340  					tname, PTR_ER=
R(ret));
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7341  				return -EINVAL;
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7342  			}
c25b2ae136039f Hao Luo                 2021-12-16  7343  			regs[BPF_REG_0]=
.type =3D PTR_TO_MEM | ret_flag;
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7344  			regs[BPF_REG_0]=
.mem_size =3D tsize;
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7345  		} else {
34d3a78c681e8e Hao Luo                 2021-12-16  7346  			/* MEM_RDONLY m=
ay be carried from ret_flag, but it
34d3a78c681e8e Hao Luo                 2021-12-16  7347  			 * doesn't appl=
y on PTR_TO_BTF_ID. Fold it, otherwise
34d3a78c681e8e Hao Luo                 2021-12-16  7348  			 * it will conf=
use the check of PTR_TO_BTF_ID in
34d3a78c681e8e Hao Luo                 2021-12-16  7349  			 * check_mem_ac=
cess().
34d3a78c681e8e Hao Luo                 2021-12-16  7350  			 */
34d3a78c681e8e Hao Luo                 2021-12-16  7351  			ret_flag &=3D ~=
MEM_RDONLY;
34d3a78c681e8e Hao Luo                 2021-12-16  7352  =

c25b2ae136039f Hao Luo                 2021-12-16  7353  			regs[BPF_REG_0]=
.type =3D PTR_TO_BTF_ID | ret_flag;
22dc4a0f5ed11b Andrii Nakryiko         2020-12-03  7354  			regs[BPF_REG_0]=
.btf =3D meta.ret_btf;
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7355  			regs[BPF_REG_0]=
.btf_id =3D meta.ret_btf_id;
eaa6bcb71ef6ed Hao Luo                 2020-09-29  7356  		}
3c4807322660d4 Hao Luo                 2021-12-16  7357  	} else if (base_t=
ype(ret_type) =3D=3D RET_PTR_TO_BTF_ID) {
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  7358  		struct btf *ret_=
btf;
af7ec13833619e Yonghong Song           2020-06-23  7359  		int ret_btf_id;
af7ec13833619e Yonghong Song           2020-06-23  7360  =

af7ec13833619e Yonghong Song           2020-06-23  7361  		mark_reg_known_z=
ero(env, regs, BPF_REG_0);
c25b2ae136039f Hao Luo                 2021-12-16  7362  		regs[BPF_REG_0].=
type =3D PTR_TO_BTF_ID | ret_flag;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  7363  		if (func_id =3D=
=3D BPF_FUNC_kptr_xchg) {
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  7364  			ret_btf =3D met=
a.kptr_off_desc->kptr.btf;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  7365  			ret_btf_id =3D =
meta.kptr_off_desc->kptr.btf_id;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  7366  		} else {
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  7367  			ret_btf =3D btf=
_vmlinux;
af7ec13833619e Yonghong Song           2020-06-23  7368  			ret_btf_id =3D =
*fn->ret_btf_id;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  7369  		}
af7ec13833619e Yonghong Song           2020-06-23  7370  		if (ret_btf_id =
=3D=3D 0) {
3c4807322660d4 Hao Luo                 2021-12-16  7371  			verbose(env, "i=
nvalid return type %u of func %s#%d\n",
3c4807322660d4 Hao Luo                 2021-12-16  7372  				base_type(ret_=
type), func_id_name(func_id),
3c4807322660d4 Hao Luo                 2021-12-16  7373  				func_id);
af7ec13833619e Yonghong Song           2020-06-23  7374  			return -EINVAL;
af7ec13833619e Yonghong Song           2020-06-23  7375  		}
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  7376  		regs[BPF_REG_0].=
btf =3D ret_btf;
af7ec13833619e Yonghong Song           2020-06-23  7377  		regs[BPF_REG_0].=
btf_id =3D ret_btf_id;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7378  	} else {
3c4807322660d4 Hao Luo                 2021-12-16  7379  		verbose(env, "un=
known return type %u of func %s#%d\n",
3c4807322660d4 Hao Luo                 2021-12-16  7380  			base_type(ret_t=
ype), func_id_name(func_id), func_id);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7381  		return -EINVAL;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7382  	}
04fd61ab36ec06 Alexei Starovoitov      2015-05-19  7383  =

c25b2ae136039f Hao Luo                 2021-12-16  7384  	if (type_may_be_n=
ull(regs[BPF_REG_0].type))
93c230e3f5bd6e Martin KaFai Lau        2020-10-19  7385  		regs[BPF_REG_0].=
id =3D ++env->id_gen;
93c230e3f5bd6e Martin KaFai Lau        2020-10-19  7386  =

0f3adc288df8ba Lorenz Bauer            2019-03-22  7387  	if (is_ptr_cast_f=
unction(func_id)) {
1b986589680a2a Martin KaFai Lau        2019-03-12  7388  		/* For release_r=
eference() */
1b986589680a2a Martin KaFai Lau        2019-03-12  7389  		regs[BPF_REG_0].=
ref_obj_id =3D meta.ref_obj_id;
64d85290d79c06 Jakub Sitnicki          2020-04-29  7390  	} else if (is_acq=
uire_function(func_id, meta.map_ptr)) {
0f3adc288df8ba Lorenz Bauer            2019-03-22  7391  		int id =3D acqui=
re_reference_state(env, insn_idx);
0f3adc288df8ba Lorenz Bauer            2019-03-22  7392  =

0f3adc288df8ba Lorenz Bauer            2019-03-22  7393  		if (id < 0)
0f3adc288df8ba Lorenz Bauer            2019-03-22  7394  			return id;
0f3adc288df8ba Lorenz Bauer            2019-03-22  7395  		/* For mark_ptr_=
or_null_reg() */
0f3adc288df8ba Lorenz Bauer            2019-03-22  7396  		regs[BPF_REG_0].=
id =3D id;
0f3adc288df8ba Lorenz Bauer            2019-03-22  7397  		/* For release_r=
eference() */
0f3adc288df8ba Lorenz Bauer            2019-03-22  7398  		regs[BPF_REG_0].=
ref_obj_id =3D id;
34d4ef5775f776 Joanne Koong            2022-05-23  7399  	} else if (func_i=
d =3D=3D BPF_FUNC_dynptr_data) {
34d4ef5775f776 Joanne Koong            2022-05-23  7400  		int dynptr_id =
=3D 0, i;
34d4ef5775f776 Joanne Koong            2022-05-23  7401  =

34d4ef5775f776 Joanne Koong            2022-05-23  7402  		/* Find the id o=
f the dynptr we're acquiring a reference to */
34d4ef5775f776 Joanne Koong            2022-05-23  7403  		for (i =3D 0; i =
< MAX_BPF_FUNC_REG_ARGS; i++) {
34d4ef5775f776 Joanne Koong            2022-05-23  7404  			if (arg_type_is=
_dynptr(fn->arg_type[i])) {
34d4ef5775f776 Joanne Koong            2022-05-23  7405  				if (dynptr_id)=
 {
34d4ef5775f776 Joanne Koong            2022-05-23  7406  					verbose(env, =
"verifier internal error: multiple dynptr args in func\n");
34d4ef5775f776 Joanne Koong            2022-05-23  7407  					return -EFAUL=
T;
34d4ef5775f776 Joanne Koong            2022-05-23  7408  				}
34d4ef5775f776 Joanne Koong            2022-05-23  7409  				dynptr_id =3D =
stack_slot_get_id(env, &regs[BPF_REG_1 + i]);
34d4ef5775f776 Joanne Koong            2022-05-23  7410  			}
34d4ef5775f776 Joanne Koong            2022-05-23  7411  		}
34d4ef5775f776 Joanne Koong            2022-05-23  7412  		/* For release_r=
eference() */
34d4ef5775f776 Joanne Koong            2022-05-23  7413  		regs[BPF_REG_0].=
ref_obj_id =3D dynptr_id;
0f3adc288df8ba Lorenz Bauer            2019-03-22  7414  	}
1b986589680a2a Martin KaFai Lau        2019-03-12  7415  =

849fa50662fbc8 Yonghong Song           2018-04-28  7416  	do_refine_retval_=
range(regs, fn->ret_type, func_id, &meta);
849fa50662fbc8 Yonghong Song           2018-04-28  7417  =

61bd5218eef349 Jakub Kicinski          2017-10-09  7418  	err =3D check_map=
_func_compatibility(env, meta.map_ptr, func_id);
35578d79840030 Kaixu Xia               2015-08-06  7419  	if (err)
35578d79840030 Kaixu Xia               2015-08-06  7420  		return err;
04fd61ab36ec06 Alexei Starovoitov      2015-05-19  7421  =

fa28dcb82a38f8 Song Liu                2020-06-29  7422  	if ((func_id =3D=
=3D BPF_FUNC_get_stack ||
fa28dcb82a38f8 Song Liu                2020-06-29  7423  	     func_id =3D=
=3D BPF_FUNC_get_task_stack) &&
fa28dcb82a38f8 Song Liu                2020-06-29  7424  	    !env->prog->h=
as_callchain_buf) {
c195651e565ae7 Yonghong Song           2018-04-28  7425  		const char *err_=
str;
c195651e565ae7 Yonghong Song           2018-04-28  7426  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8301911534554590969==--

