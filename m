Content-Type: multipart/mixed; boundary="===============7829725740774391443=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/bpf/bpf_iter.c:409:14: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Sun, 27 Jun 2021 03:44:01 +0800
Message-ID: <202106270340.wttNfTDZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7829725740774391443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yonghong Song <yhs@fb.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b7050b242430f3170e0b57f5f55136e44cb8dc66
commit: 5e7b30205cef80f6bb922e61834437ca7bff5837 bpf: Change uapi for bpf i=
terator map elements
date:   11 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 11 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/bpf/bpf_iter.c:409:14: warning: Boolean result is used in bitwise=
 operation. Clarify expression with parentheses. [clarifyCondition]
    if (!ulinfo ^ !linfo_len)
                ^

vim +409 kernel/bpf/bpf_iter.c

367ec3e4834cbd61 Yonghong Song 2020-05-09  390  =

de4e05cac46d206f Yonghong Song 2020-05-09  391  int bpf_iter_link_attach(co=
nst union bpf_attr *attr, struct bpf_prog *prog)
de4e05cac46d206f Yonghong Song 2020-05-09  392  {
5e7b30205cef80f6 Yonghong Song 2020-08-04  393  	union bpf_iter_link_info _=
_user *ulinfo;
de4e05cac46d206f Yonghong Song 2020-05-09  394  	struct bpf_link_primer lin=
k_primer;
de4e05cac46d206f Yonghong Song 2020-05-09  395  	struct bpf_iter_target_inf=
o *tinfo;
5e7b30205cef80f6 Yonghong Song 2020-08-04  396  	union bpf_iter_link_info l=
info;
de4e05cac46d206f Yonghong Song 2020-05-09  397  	struct bpf_iter_link *link;
5e7b30205cef80f6 Yonghong Song 2020-08-04  398  	u32 prog_btf_id, linfo_len;
de4e05cac46d206f Yonghong Song 2020-05-09  399  	bool existed =3D false;
de4e05cac46d206f Yonghong Song 2020-05-09  400  	int err;
de4e05cac46d206f Yonghong Song 2020-05-09  401  =

5e7b30205cef80f6 Yonghong Song 2020-08-04  402  	if (attr->link_create.targ=
et_fd || attr->link_create.flags)
5e7b30205cef80f6 Yonghong Song 2020-08-04  403  		return -EINVAL;
5e7b30205cef80f6 Yonghong Song 2020-08-04  404  =

5e7b30205cef80f6 Yonghong Song 2020-08-04  405  	memset(&linfo, 0, sizeof(u=
nion bpf_iter_link_info));
5e7b30205cef80f6 Yonghong Song 2020-08-04  406  =

5e7b30205cef80f6 Yonghong Song 2020-08-04  407  	ulinfo =3D u64_to_user_ptr=
(attr->link_create.iter_info);
5e7b30205cef80f6 Yonghong Song 2020-08-04  408  	linfo_len =3D attr->link_c=
reate.iter_info_len;
5e7b30205cef80f6 Yonghong Song 2020-08-04 @409  	if (!ulinfo ^ !linfo_len)
5e7b30205cef80f6 Yonghong Song 2020-08-04  410  		return -EINVAL;
5e7b30205cef80f6 Yonghong Song 2020-08-04  411  =

5e7b30205cef80f6 Yonghong Song 2020-08-04  412  	if (ulinfo) {
5e7b30205cef80f6 Yonghong Song 2020-08-04  413  		err =3D bpf_check_uarg_ta=
il_zero(ulinfo, sizeof(linfo),
5e7b30205cef80f6 Yonghong Song 2020-08-04  414  					       linfo_len);
5e7b30205cef80f6 Yonghong Song 2020-08-04  415  		if (err)
5e7b30205cef80f6 Yonghong Song 2020-08-04  416  			return err;
5e7b30205cef80f6 Yonghong Song 2020-08-04  417  		linfo_len =3D min_t(u32, =
linfo_len, sizeof(linfo));
5e7b30205cef80f6 Yonghong Song 2020-08-04  418  		if (copy_from_user(&linfo=
, ulinfo, linfo_len))
5e7b30205cef80f6 Yonghong Song 2020-08-04  419  			return -EFAULT;
5e7b30205cef80f6 Yonghong Song 2020-08-04  420  	}
5e7b30205cef80f6 Yonghong Song 2020-08-04  421  =

de4e05cac46d206f Yonghong Song 2020-05-09  422  	prog_btf_id =3D prog->aux-=
>attach_btf_id;
de4e05cac46d206f Yonghong Song 2020-05-09  423  	mutex_lock(&targets_mutex);
de4e05cac46d206f Yonghong Song 2020-05-09  424  	list_for_each_entry(tinfo,=
 &targets, list) {
de4e05cac46d206f Yonghong Song 2020-05-09  425  		if (tinfo->btf_id =3D=3D =
prog_btf_id) {
de4e05cac46d206f Yonghong Song 2020-05-09  426  			existed =3D true;
de4e05cac46d206f Yonghong Song 2020-05-09  427  			break;
de4e05cac46d206f Yonghong Song 2020-05-09  428  		}
de4e05cac46d206f Yonghong Song 2020-05-09  429  	}
de4e05cac46d206f Yonghong Song 2020-05-09  430  	mutex_unlock(&targets_mute=
x);
de4e05cac46d206f Yonghong Song 2020-05-09  431  	if (!existed)
de4e05cac46d206f Yonghong Song 2020-05-09  432  		return -ENOENT;
de4e05cac46d206f Yonghong Song 2020-05-09  433  =

de4e05cac46d206f Yonghong Song 2020-05-09  434  	link =3D kzalloc(sizeof(*l=
ink), GFP_USER | __GFP_NOWARN);
de4e05cac46d206f Yonghong Song 2020-05-09  435  	if (!link)
de4e05cac46d206f Yonghong Song 2020-05-09  436  		return -ENOMEM;
de4e05cac46d206f Yonghong Song 2020-05-09  437  =

de4e05cac46d206f Yonghong Song 2020-05-09  438  	bpf_link_init(&link->link,=
 BPF_LINK_TYPE_ITER, &bpf_iter_link_lops, prog);
de4e05cac46d206f Yonghong Song 2020-05-09  439  	link->tinfo =3D tinfo;
de4e05cac46d206f Yonghong Song 2020-05-09  440  =

de4e05cac46d206f Yonghong Song 2020-05-09  441  	err  =3D bpf_link_prime(&l=
ink->link, &link_primer);
de4e05cac46d206f Yonghong Song 2020-05-09  442  	if (err) {
de4e05cac46d206f Yonghong Song 2020-05-09  443  		kfree(link);
de4e05cac46d206f Yonghong Song 2020-05-09  444  		return err;
de4e05cac46d206f Yonghong Song 2020-05-09  445  	}
de4e05cac46d206f Yonghong Song 2020-05-09  446  =

5e7b30205cef80f6 Yonghong Song 2020-08-04  447  	if (tinfo->reg_info->attac=
h_target) {
5e7b30205cef80f6 Yonghong Song 2020-08-04  448  		err =3D tinfo->reg_info->=
attach_target(prog, &linfo, &link->aux);
a5cbe05a6673b85b Yonghong Song 2020-07-23  449  		if (err) {
5e7b30205cef80f6 Yonghong Song 2020-08-04  450  			bpf_link_cleanup(&link_p=
rimer);
5e7b30205cef80f6 Yonghong Song 2020-08-04  451  			return err;
a5cbe05a6673b85b Yonghong Song 2020-07-23  452  		}
a5cbe05a6673b85b Yonghong Song 2020-07-23  453  	}
a5cbe05a6673b85b Yonghong Song 2020-07-23  454  =

de4e05cac46d206f Yonghong Song 2020-05-09  455  	return bpf_link_settle(&li=
nk_primer);
de4e05cac46d206f Yonghong Song 2020-05-09  456  }
ac51d99bf81caac8 Yonghong Song 2020-05-09  457  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7829725740774391443==--

