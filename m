Content-Type: multipart/mixed; boundary="===============1110430977332581617=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/bpf/bpf_iter.c:343:13: warning: Uninitialized variable: iter->btf_id [uninitvar]
Date: Wed, 13 Jul 2022 16:25:55 +0800
Message-ID: <202207131606.V8lYXPSP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1110430977332581617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: kernel/bp=
f/bpf_iter.c:343:13: warning: Uninitialized variable: iter->btf_id [uninitv=
ar]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jakob Koschel <jakobkoschel@gmail.com>
CC: Andrii Nakryiko <andrii@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b047602d579b4fb028128a525f056bbdc890e7f0
commit: 185da3da9379948ffbe45051b16d526c428fb06e bpf: Replace usage of supp=
orted with dedicated list iterator variable
date:   3 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 months ago
compiler: powerpc-linux-gcc (GCC) 11.3.0
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
   kernel/bpf/bpf_iter.c:312:26: warning: Uninitialized variable: tinfo->re=
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
   kernel/bpf/bpf_iter.c:371:14: warning: Uninitialized variable: tinfo->bt=
f_id [uninitvar]
     if (tinfo->btf_id =3D=3D prog->aux->attach_btf_id) {
                ^
   kernel/bpf/bpf_iter.c:375:8: warning: Uninitialized variable: reg_info [=
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

vim +343 kernel/bpf/bpf_iter.c

15d83c4d7cef5c Yonghong Song 2020-05-09  329  =

15d83c4d7cef5c Yonghong Song 2020-05-09  330  bool bpf_iter_prog_supported(=
struct bpf_prog *prog)
15d83c4d7cef5c Yonghong Song 2020-05-09  331  {
15d83c4d7cef5c Yonghong Song 2020-05-09  332  	const char *attach_fname =3D=
 prog->aux->attach_func_name;
185da3da937994 Jakob Koschel 2022-03-31  333  	struct bpf_iter_target_info =
*tinfo =3D NULL, *iter;
15d83c4d7cef5c Yonghong Song 2020-05-09  334  	u32 prog_btf_id =3D prog->au=
x->attach_btf_id;
15d83c4d7cef5c Yonghong Song 2020-05-09  335  	const char *prefix =3D BPF_I=
TER_FUNC_PREFIX;
15d83c4d7cef5c Yonghong Song 2020-05-09  336  	int prefix_len =3D strlen(pr=
efix);
15d83c4d7cef5c Yonghong Song 2020-05-09  337  =

15d83c4d7cef5c Yonghong Song 2020-05-09  338  	if (strncmp(attach_fname, pr=
efix, prefix_len))
15d83c4d7cef5c Yonghong Song 2020-05-09  339  		return false;
15d83c4d7cef5c Yonghong Song 2020-05-09  340  =

15d83c4d7cef5c Yonghong Song 2020-05-09  341  	mutex_lock(&targets_mutex);
185da3da937994 Jakob Koschel 2022-03-31  342  	list_for_each_entry(iter, &t=
argets, list) {
185da3da937994 Jakob Koschel 2022-03-31 @343  		if (iter->btf_id && iter->b=
tf_id =3D=3D prog_btf_id) {
185da3da937994 Jakob Koschel 2022-03-31  344  			tinfo =3D iter;
15d83c4d7cef5c Yonghong Song 2020-05-09  345  			break;
15d83c4d7cef5c Yonghong Song 2020-05-09  346  		}
185da3da937994 Jakob Koschel 2022-03-31  347  		if (!strcmp(attach_fname + =
prefix_len, iter->reg_info->target)) {
185da3da937994 Jakob Koschel 2022-03-31  348  			cache_btf_id(iter, prog);
185da3da937994 Jakob Koschel 2022-03-31  349  			tinfo =3D iter;
15d83c4d7cef5c Yonghong Song 2020-05-09  350  			break;
15d83c4d7cef5c Yonghong Song 2020-05-09  351  		}
15d83c4d7cef5c Yonghong Song 2020-05-09  352  	}
15d83c4d7cef5c Yonghong Song 2020-05-09  353  	mutex_unlock(&targets_mutex);
15d83c4d7cef5c Yonghong Song 2020-05-09  354  =

185da3da937994 Jakob Koschel 2022-03-31  355  	if (tinfo) {
3c32cc1bceba8a Yonghong Song 2020-05-13  356  		prog->aux->ctx_arg_info_siz=
e =3D tinfo->reg_info->ctx_arg_info_size;
3c32cc1bceba8a Yonghong Song 2020-05-13  357  		prog->aux->ctx_arg_info =3D=
 tinfo->reg_info->ctx_arg_info;
3c32cc1bceba8a Yonghong Song 2020-05-13  358  	}
3c32cc1bceba8a Yonghong Song 2020-05-13  359  =

185da3da937994 Jakob Koschel 2022-03-31  360  	return tinfo !=3D NULL;
15d83c4d7cef5c Yonghong Song 2020-05-09  361  }
de4e05cac46d20 Yonghong Song 2020-05-09  362  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1110430977332581617==--

