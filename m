Content-Type: multipart/mixed; boundary="===============2716718780633155262=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/bpf/btf.c:5588:13: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses.
Date: Wed, 06 Jan 2021 02:09:48 +0800
Message-ID: <202101060242.Tb35aUgs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2716718780633155262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andrii Nakryiko <andrii@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
commit: 5329722057d41aebc31e391907a501feaa42f7d9 bpf: Assign ID to vmlinux =
BTF and return extra info for BTF in GET_OBJ_INFO
date:   8 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 8 weeks ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/bpf/btf.c:5588:13: warning: Boolean result is used in bitwise ope=
ration. Clarify expression with parentheses. [clarifyCondition]
    if (!uname ^ !uname_len)
               ^
>> kernel/bpf/btf.c:4522:38: warning: Either the condition 't?btf_type_vlen=
(t):5' is redundant or there is pointer arithmetic with NULL pointer. [null=
PointerArithmeticRedundantCheck]
    args =3D (const struct btf_param *)(t + 1);
                                        ^
   kernel/bpf/btf.c:4524:14: note: Assuming that condition 't?btf_type_vlen=
(t):5' is not redundant
    nr_args =3D t ? btf_type_vlen(t) : 5;
                ^
   kernel/bpf/btf.c:4522:38: note: Null pointer addition
    args =3D (const struct btf_param *)(t + 1);
                                        ^
   kernel/bpf/btf.c:4373:9: warning: Local variable btf_id shadows outer fu=
nction [shadowFunction]
    int i, btf_id;
           ^
   kernel/bpf/btf.c:5638:5: note: Shadowed declaration
   u32 btf_id(const struct btf *btf)
       ^
   kernel/bpf/btf.c:4373:9: note: Shadow variable
    int i, btf_id;
           ^
   kernel/bpf/btf.c:5175:6: warning: Local variable btf_id shadows outer fu=
nction [shadowFunction]
    u32 btf_id =3D 0;
        ^
   kernel/bpf/btf.c:5638:5: note: Shadowed declaration
   u32 btf_id(const struct btf *btf)
       ^
   kernel/bpf/btf.c:5175:6: note: Shadow variable
    u32 btf_id =3D 0;
        ^
   kernel/bpf/btf.c:5208:16: warning: Local variable btf_id shadows outer f=
unction [shadowFunction]
    u32 i, nargs, btf_id;
                  ^
   kernel/bpf/btf.c:5638:5: note: Shadowed declaration
   u32 btf_id(const struct btf *btf)
       ^
   kernel/bpf/btf.c:5208:16: note: Shadow variable
    u32 i, nargs, btf_id;
                  ^
   kernel/bpf/btf.c:5306:16: warning: Local variable btf_id shadows outer f=
unction [shadowFunction]
    u32 i, nargs, btf_id;
                  ^
   kernel/bpf/btf.c:5638:5: note: Shadowed declaration
   u32 btf_id(const struct btf *btf)
       ^
   kernel/bpf/btf.c:5306:16: note: Shadow variable
    u32 i, nargs, btf_id;
                  ^
>> kernel/bpf/btf.c:4277:5: warning: union member 'Anonymous2::__t' is neve=
r used. [unusedStructMember]
    } *__t;
       ^

vim +5588 kernel/bpf/btf.c

60197cfb6e11ffc Martin KaFai Lau   2018-04-18  5556  =

60197cfb6e11ffc Martin KaFai Lau   2018-04-18  5557  int btf_get_info_by_fd=
(const struct btf *btf,
60197cfb6e11ffc Martin KaFai Lau   2018-04-18  5558  		       const union b=
pf_attr *attr,
60197cfb6e11ffc Martin KaFai Lau   2018-04-18  5559  		       union bpf_att=
r __user *uattr)
60197cfb6e11ffc Martin KaFai Lau   2018-04-18  5560  {
62dab84c81a487d Martin KaFai Lau   2018-05-04  5561  	struct bpf_btf_info _=
_user *uinfo;
5c6f25887963f15 Greg Kroah-Hartman 2020-03-20  5562  	struct bpf_btf_info i=
nfo;
62dab84c81a487d Martin KaFai Lau   2018-05-04  5563  	u32 info_copy, btf_co=
py;
62dab84c81a487d Martin KaFai Lau   2018-05-04  5564  	void __user *ubtf;
5329722057d41ae Andrii Nakryiko    2020-11-09  5565  	char __user *uname;
5329722057d41ae Andrii Nakryiko    2020-11-09  5566  	u32 uinfo_len, uname_=
len, name_len;
5329722057d41ae Andrii Nakryiko    2020-11-09  5567  	int ret =3D 0;
60197cfb6e11ffc Martin KaFai Lau   2018-04-18  5568  =

62dab84c81a487d Martin KaFai Lau   2018-05-04  5569  	uinfo =3D u64_to_user=
_ptr(attr->info.info);
62dab84c81a487d Martin KaFai Lau   2018-05-04  5570  	uinfo_len =3D attr->i=
nfo.info_len;
62dab84c81a487d Martin KaFai Lau   2018-05-04  5571  =

62dab84c81a487d Martin KaFai Lau   2018-05-04  5572  	info_copy =3D min_t(u=
32, uinfo_len, sizeof(info));
5c6f25887963f15 Greg Kroah-Hartman 2020-03-20  5573  	memset(&info, 0, size=
of(info));
62dab84c81a487d Martin KaFai Lau   2018-05-04  5574  	if (copy_from_user(&i=
nfo, uinfo, info_copy))
62dab84c81a487d Martin KaFai Lau   2018-05-04  5575  		return -EFAULT;
62dab84c81a487d Martin KaFai Lau   2018-05-04  5576  =

62dab84c81a487d Martin KaFai Lau   2018-05-04  5577  	info.id =3D btf->id;
62dab84c81a487d Martin KaFai Lau   2018-05-04  5578  	ubtf =3D u64_to_user_=
ptr(info.btf);
62dab84c81a487d Martin KaFai Lau   2018-05-04  5579  	btf_copy =3D min_t(u3=
2, btf->data_size, info.btf_size);
62dab84c81a487d Martin KaFai Lau   2018-05-04  5580  	if (copy_to_user(ubtf=
, btf->data, btf_copy))
62dab84c81a487d Martin KaFai Lau   2018-05-04  5581  		return -EFAULT;
62dab84c81a487d Martin KaFai Lau   2018-05-04  5582  	info.btf_size =3D btf=
->data_size;
62dab84c81a487d Martin KaFai Lau   2018-05-04  5583  =

5329722057d41ae Andrii Nakryiko    2020-11-09  5584  	info.kernel_btf =3D b=
tf->kernel_btf;
5329722057d41ae Andrii Nakryiko    2020-11-09  5585  =

5329722057d41ae Andrii Nakryiko    2020-11-09  5586  	uname =3D u64_to_user=
_ptr(info.name);
5329722057d41ae Andrii Nakryiko    2020-11-09  5587  	uname_len =3D info.na=
me_len;
5329722057d41ae Andrii Nakryiko    2020-11-09 @5588  	if (!uname ^ !uname_l=
en)
5329722057d41ae Andrii Nakryiko    2020-11-09  5589  		return -EINVAL;
5329722057d41ae Andrii Nakryiko    2020-11-09  5590  =

5329722057d41ae Andrii Nakryiko    2020-11-09  5591  	name_len =3D strlen(b=
tf->name);
5329722057d41ae Andrii Nakryiko    2020-11-09  5592  	info.name_len =3D nam=
e_len;
5329722057d41ae Andrii Nakryiko    2020-11-09  5593  =

5329722057d41ae Andrii Nakryiko    2020-11-09  5594  	if (uname) {
5329722057d41ae Andrii Nakryiko    2020-11-09  5595  		if (uname_len >=3D n=
ame_len + 1) {
5329722057d41ae Andrii Nakryiko    2020-11-09  5596  			if (copy_to_user(un=
ame, btf->name, name_len + 1))
5329722057d41ae Andrii Nakryiko    2020-11-09  5597  				return -EFAULT;
5329722057d41ae Andrii Nakryiko    2020-11-09  5598  		} else {
5329722057d41ae Andrii Nakryiko    2020-11-09  5599  			char zero =3D '\0';
5329722057d41ae Andrii Nakryiko    2020-11-09  5600  =

5329722057d41ae Andrii Nakryiko    2020-11-09  5601  			if (copy_to_user(un=
ame, btf->name, uname_len - 1))
5329722057d41ae Andrii Nakryiko    2020-11-09  5602  				return -EFAULT;
5329722057d41ae Andrii Nakryiko    2020-11-09  5603  			if (put_user(zero, =
uname + uname_len - 1))
5329722057d41ae Andrii Nakryiko    2020-11-09  5604  				return -EFAULT;
5329722057d41ae Andrii Nakryiko    2020-11-09  5605  			/* let user-space k=
now about too short buffer */
5329722057d41ae Andrii Nakryiko    2020-11-09  5606  			ret =3D -ENOSPC;
5329722057d41ae Andrii Nakryiko    2020-11-09  5607  		}
5329722057d41ae Andrii Nakryiko    2020-11-09  5608  	}
5329722057d41ae Andrii Nakryiko    2020-11-09  5609  =

62dab84c81a487d Martin KaFai Lau   2018-05-04  5610  	if (copy_to_user(uinf=
o, &info, info_copy) ||
62dab84c81a487d Martin KaFai Lau   2018-05-04  5611  	    put_user(info_cop=
y, &uattr->info.info_len))
60197cfb6e11ffc Martin KaFai Lau   2018-04-18  5612  		return -EFAULT;
60197cfb6e11ffc Martin KaFai Lau   2018-04-18  5613  =

5329722057d41ae Andrii Nakryiko    2020-11-09  5614  	return ret;
60197cfb6e11ffc Martin KaFai Lau   2018-04-18  5615  }
78958fca7ead2f8 Martin KaFai Lau   2018-05-04  5616  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2716718780633155262==--

