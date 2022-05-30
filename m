Content-Type: multipart/mixed; boundary="===============1103695105823929012=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/bpf/bpf_iter.c:312:26: warning: Uninitialized variable: tinfo->reg_info [uninitvar]
Date: Mon, 30 May 2022 11:27:15 +0800
Message-ID: <202205301132.LbhL6EkC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1103695105823929012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jakob Koschel <jakobkoschel@gmail.com>
CC: Andrii Nakryiko <andrii@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b00ed48bb0a7c295facf9036135a573a5cdbe7de
commit: 185da3da9379948ffbe45051b16d526c428fb06e bpf: Replace usage of supp=
orted with dedicated list iterator variable
date:   8 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 weeks ago
compiler: mips-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 185da3da9379948ffbe45051b16d526c428fb06e
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   kernel/bpf/bpf_iter.c:456:12: warning: Boolean result is used in bitwise=
 operation. Clarify expression with parentheses. [clarifyCondition]
    if (!ulen ^ !ubuf)
              ^
   kernel/bpf/bpf_iter.c:516:29: warning: Boolean result is used in bitwise=
 operation. Clarify expression with parentheses. [clarifyCondition]
    if (bpfptr_is_null(ulinfo) ^ !linfo_len)
                               ^
>> kernel/bpf/bpf_iter.c:312:26: warning: Uninitialized variable: tinfo->re=
g_info [uninitvar]
     if (reg_info =3D=3D tinfo->reg_info) {
                            ^
>> kernel/bpf/bpf_iter.c:343:13: warning: Uninitialized variable: iter->btf=
_id [uninitvar]
     if (iter->btf_id && iter->btf_id =3D=3D prog_btf_id) {
               ^
   kernel/bpf/bpf_iter.c:338:13: note: Assuming condition is false
    if (strncmp(attach_fname, prefix, prefix_len))
               ^
   kernel/bpf/bpf_iter.c:343:13: note: Uninitialized variable: iter->btf_id
     if (iter->btf_id && iter->btf_id =3D=3D prog_btf_id) {
               ^
>> kernel/bpf/bpf_iter.c:371:14: warning: Uninitialized variable: tinfo->bt=
f_id [uninitvar]
     if (tinfo->btf_id =3D=3D prog->aux->attach_btf_id) {
                ^
>> kernel/bpf/bpf_iter.c:375:8: warning: Uninitialized variable: reg_info [=
uninitvar]
      if (reg_info->get_func_proto)
          ^
   kernel/bpf/bpf_iter.c:374:20: note: Assignment 'reg_info=3Dtinfo->reg_in=
fo', assigned value is <Uninit>
      reg_info =3D tinfo->reg_info;
                      ^
   kernel/bpf/bpf_iter.c:375:8: note: Uninitialized variable: reg_info
      if (reg_info->get_func_proto)
          ^

vim +312 kernel/bpf/bpf_iter.c

ae24345da54e45 Yonghong Song    2020-05-09  304  =

ab2ee4fcb9d61f Yonghong Song    2020-05-13  305  void bpf_iter_unreg_target=
(const struct bpf_iter_reg *reg_info)
ae24345da54e45 Yonghong Song    2020-05-09  306  {
ae24345da54e45 Yonghong Song    2020-05-09  307  	struct bpf_iter_target_in=
fo *tinfo;
ae24345da54e45 Yonghong Song    2020-05-09  308  	bool found =3D false;
ae24345da54e45 Yonghong Song    2020-05-09  309  =

ae24345da54e45 Yonghong Song    2020-05-09  310  	mutex_lock(&targets_mutex=
);
ae24345da54e45 Yonghong Song    2020-05-09  311  	list_for_each_entry(tinfo=
, &targets, list) {
ab2ee4fcb9d61f Yonghong Song    2020-05-13 @312  		if (reg_info =3D=3D tinf=
o->reg_info) {
ae24345da54e45 Yonghong Song    2020-05-09  313  			list_del(&tinfo->list);
ae24345da54e45 Yonghong Song    2020-05-09  314  			kfree(tinfo);
ae24345da54e45 Yonghong Song    2020-05-09  315  			found =3D true;
ae24345da54e45 Yonghong Song    2020-05-09  316  			break;
ae24345da54e45 Yonghong Song    2020-05-09  317  		}
ae24345da54e45 Yonghong Song    2020-05-09  318  	}
ae24345da54e45 Yonghong Song    2020-05-09  319  	mutex_unlock(&targets_mut=
ex);
ae24345da54e45 Yonghong Song    2020-05-09  320  =

ae24345da54e45 Yonghong Song    2020-05-09  321  	WARN_ON(found =3D=3D fals=
e);
ae24345da54e45 Yonghong Song    2020-05-09  322  }
15d83c4d7cef5c Yonghong Song    2020-05-09  323  =

15d83c4d7cef5c Yonghong Song    2020-05-09  324  static void cache_btf_id(s=
truct bpf_iter_target_info *tinfo,
15d83c4d7cef5c Yonghong Song    2020-05-09  325  			 struct bpf_prog *prog)
15d83c4d7cef5c Yonghong Song    2020-05-09  326  {
15d83c4d7cef5c Yonghong Song    2020-05-09  327  	tinfo->btf_id =3D prog->a=
ux->attach_btf_id;
15d83c4d7cef5c Yonghong Song    2020-05-09  328  }
15d83c4d7cef5c Yonghong Song    2020-05-09  329  =

15d83c4d7cef5c Yonghong Song    2020-05-09  330  bool bpf_iter_prog_support=
ed(struct bpf_prog *prog)
15d83c4d7cef5c Yonghong Song    2020-05-09  331  {
15d83c4d7cef5c Yonghong Song    2020-05-09  332  	const char *attach_fname =
=3D prog->aux->attach_func_name;
185da3da937994 Jakob Koschel    2022-03-31  333  	struct bpf_iter_target_in=
fo *tinfo =3D NULL, *iter;
15d83c4d7cef5c Yonghong Song    2020-05-09  334  	u32 prog_btf_id =3D prog-=
>aux->attach_btf_id;
15d83c4d7cef5c Yonghong Song    2020-05-09  335  	const char *prefix =3D BP=
F_ITER_FUNC_PREFIX;
15d83c4d7cef5c Yonghong Song    2020-05-09  336  	int prefix_len =3D strlen=
(prefix);
15d83c4d7cef5c Yonghong Song    2020-05-09  337  =

15d83c4d7cef5c Yonghong Song    2020-05-09  338  	if (strncmp(attach_fname,=
 prefix, prefix_len))
15d83c4d7cef5c Yonghong Song    2020-05-09  339  		return false;
15d83c4d7cef5c Yonghong Song    2020-05-09  340  =

15d83c4d7cef5c Yonghong Song    2020-05-09  341  	mutex_lock(&targets_mutex=
);
185da3da937994 Jakob Koschel    2022-03-31  342  	list_for_each_entry(iter,=
 &targets, list) {
185da3da937994 Jakob Koschel    2022-03-31 @343  		if (iter->btf_id && iter=
->btf_id =3D=3D prog_btf_id) {
185da3da937994 Jakob Koschel    2022-03-31  344  			tinfo =3D iter;
15d83c4d7cef5c Yonghong Song    2020-05-09  345  			break;
15d83c4d7cef5c Yonghong Song    2020-05-09  346  		}
185da3da937994 Jakob Koschel    2022-03-31  347  		if (!strcmp(attach_fname=
 + prefix_len, iter->reg_info->target)) {
185da3da937994 Jakob Koschel    2022-03-31  348  			cache_btf_id(iter, prog=
);
185da3da937994 Jakob Koschel    2022-03-31  349  			tinfo =3D iter;
15d83c4d7cef5c Yonghong Song    2020-05-09  350  			break;
15d83c4d7cef5c Yonghong Song    2020-05-09  351  		}
15d83c4d7cef5c Yonghong Song    2020-05-09  352  	}
15d83c4d7cef5c Yonghong Song    2020-05-09  353  	mutex_unlock(&targets_mut=
ex);
15d83c4d7cef5c Yonghong Song    2020-05-09  354  =

185da3da937994 Jakob Koschel    2022-03-31  355  	if (tinfo) {
3c32cc1bceba8a Yonghong Song    2020-05-13  356  		prog->aux->ctx_arg_info_=
size =3D tinfo->reg_info->ctx_arg_info_size;
3c32cc1bceba8a Yonghong Song    2020-05-13  357  		prog->aux->ctx_arg_info =
=3D tinfo->reg_info->ctx_arg_info;
3c32cc1bceba8a Yonghong Song    2020-05-13  358  	}
3c32cc1bceba8a Yonghong Song    2020-05-13  359  =

185da3da937994 Jakob Koschel    2022-03-31  360  	return tinfo !=3D NULL;
15d83c4d7cef5c Yonghong Song    2020-05-09  361  }
de4e05cac46d20 Yonghong Song    2020-05-09  362  =

3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  363  const struct bpf_func_prot=
o *
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  364  bpf_iter_get_func_proto(en=
um bpf_func_id func_id, const struct bpf_prog *prog)
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  365  {
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  366  	const struct bpf_iter_tar=
get_info *tinfo;
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  367  	const struct bpf_func_pro=
to *fn =3D NULL;
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  368  =

3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  369  	mutex_lock(&targets_mutex=
);
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  370  	list_for_each_entry(tinfo=
, &targets, list) {
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01 @371  		if (tinfo->btf_id =3D=3D=
 prog->aux->attach_btf_id) {
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  372  			const struct bpf_iter_r=
eg *reg_info;
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  373  =

3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  374  			reg_info =3D tinfo->reg=
_info;
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01 @375  			if (reg_info->get_func_=
proto)
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  376  				fn =3D reg_info->get_f=
unc_proto(func_id, prog);
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  377  			break;
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  378  		}
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  379  	}
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  380  	mutex_unlock(&targets_mut=
ex);
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  381  =

3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  382  	return fn;
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  383  }
3cee6fb8e69ecd Martin KaFai Lau 2021-07-01  384  =


:::::: The code at line 312 was first introduced by commit
:::::: ab2ee4fcb9d61fd57db70db694adbcf54662bd80 bpf: Change func bpf_iter_u=
nreg_target() signature

:::::: TO: Yonghong Song <yhs@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1103695105823929012==--

