Content-Type: multipart/mixed; boundary="===============9217024685986964162=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Change error code when ops is NULL
Date: Fri, 24 Apr 2020 21:41:03 +0800
Message-ID: <202004242146.0hty30ao%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9217024685986964162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200422083010.28000-2-maowenan@huawei.com>
References: <20200422083010.28000-2-maowenan@huawei.com>
TO: Mao Wenan <maowenan@huawei.com>
TO: ast(a)kernel.org
TO: daniel(a)iogearbox.net
TO: kafai(a)fb.com
TO: songliubraving(a)fb.com
TO: yhs(a)fb.com
TO: andriin(a)fb.com
TO: john.fastabend(a)gmail.com
TO: kpsingh(a)chromium.org
CC: netdev(a)vger.kernel.org
CC: bpf(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: kernel-janitors(a)vger.kernel.org

Hi Mao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master net/master net-next/master ipvs/mast=
er v5.7-rc2 next-20200423]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Mao-Wenan/Change-return-co=
de-if-failed-to-load-object/20200424-025339
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> kernel/bpf/syscall.c:117:0: sparse: sparse: missing terminating " charac=
ter
   kernel/bpf/syscall.c:118:0: sparse: sparse: missing terminating " charac=
ter
>> kernel/bpf/syscall.c:686:1: sparse: sparse: directive in macro's argumen=
t list
   kernel/bpf/syscall.c:772:1: sparse: sparse: directive in macro's argumen=
t list
   kernel/bpf/syscall.c:979:1: sparse: sparse: directive in macro's argumen=
t list
   kernel/bpf/syscall.c:1046:1: sparse: sparse: directive in macro's argume=
nt list
   kernel/bpf/syscall.c:1111:1: sparse: sparse: directive in macro's argume=
nt list
   kernel/bpf/syscall.c:1164:1: sparse: sparse: directive in macro's argume=
nt list
   kernel/bpf/syscall.c:1341:1: sparse: sparse: directive in macro's argume=
nt list
   kernel/bpf/syscall.c:1442:1: sparse: sparse: directive in macro's argume=
nt list
   kernel/bpf/syscall.c:1504:1: sparse: sparse: directive in macro's argume=
nt list
   kernel/bpf/syscall.c:1548:1: sparse: sparse: directive in macro's argume=
nt list
   kernel/bpf/syscall.c:1550:1: sparse: sparse: directive in macro's argume=
nt list
   kernel/bpf/syscall.c:1551:1: sparse: sparse: directive in macro's argume=
nt list
>> kernel/bpf/syscall.c:116:17: sparse: sparse: macro "pr_warn" passed 2 ar=
guments, but takes just 2
>> include/linux/bpf_types.h:7:1: sparse: sparse: No right hand side of ','=
-expression
   include/linux/bpf_types.h:7:1: sparse: sparse: Expected ; at end of stat=
ement
   include/linux/bpf_types.h:7:1: sparse: sparse: got [
   include/linux/bpf_types.h:121:0: sparse: sparse: Expected } at end of co=
mpound statement
   include/linux/bpf_types.h:121:0: sparse: sparse: got end-of-input
   include/linux/bpf_types.h:121:0: sparse: sparse: Expected } at end of fu=
nction
   include/linux/bpf_types.h:121:0: sparse: sparse: got end-of-input
   kernel/bpf/syscall.c:116:17: sparse: sparse: undefined identifier 'pr_wa=
rn'
   kernel/bpf/syscall.c:1560:21: sparse: sparse: undefined identifier 'bpf_=
prog_types'
   kernel/bpf/syscall.c:1560:21: sparse: sparse: undefined identifier 'bpf_=
prog_types'
   kernel/bpf/syscall.c:1562:16: sparse: sparse: undefined identifier 'bpf_=
prog_types'
   kernel/bpf/syscall.c:1562:16: sparse: sparse: undefined identifier 'bpf_=
prog_types'
   kernel/bpf/syscall.c:1562:16: sparse: sparse: undefined identifier 'bpf_=
prog_types'
   kernel/bpf/syscall.c:1562:16: sparse: sparse: undefined identifier 'bpf_=
prog_types'
>> kernel/bpf/syscall.c:1562:16: sparse: sparse: cannot size expression
   kernel/bpf/syscall.c:1563:15: sparse: sparse: undefined identifier 'bpf_=
prog_types'
   kernel/bpf/syscall.c:1797:27: sparse: sparse: undefined identifier 'bpf_=
dummy_read'
   kernel/bpf/syscall.c:1798:27: sparse: sparse: undefined identifier 'bpf_=
dummy_write'
   kernel/bpf/syscall.c:2293:27: sparse: sparse: undefined identifier 'bpf_=
dummy_read'
   kernel/bpf/syscall.c:2294:27: sparse: sparse: undefined identifier 'bpf_=
dummy_write'
   kernel/bpf/syscall.c:2870:23: sparse: sparse: undefined identifier '__bp=
f_map_inc_not_zero'
   kernel/bpf/syscall.c:3538:15: sparse: sparse: undefined identifier 'map_=
get_sys_perms'
   kernel/bpf/syscall.c:3544:15: sparse: sparse: undefined identifier 'map_=
get_sys_perms'
   kernel/bpf/syscall.c:3685:23: sparse: sparse: undefined identifier 'map_=
create'
   kernel/bpf/syscall.c:3688:23: sparse: sparse: undefined identifier 'map_=
lookup_elem'
   kernel/bpf/syscall.c:3691:23: sparse: sparse: undefined identifier 'map_=
update_elem'
   kernel/bpf/syscall.c:3694:23: sparse: sparse: undefined identifier 'map_=
delete_elem'
   kernel/bpf/syscall.c:3697:23: sparse: sparse: undefined identifier 'map_=
get_next_key'
   kernel/bpf/syscall.c:3700:23: sparse: sparse: undefined identifier 'map_=
freeze'
   kernel/bpf/syscall.c:3757:23: sparse: sparse: undefined identifier 'map_=
lookup_and_delete_elem'

# https://github.com/0day-ci/linux/commit/45c88e856945c443c39e3f519ad9740b8=
e487d8d
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 45c88e856945c443c39e3f519ad9740b8e487d8d
vim +117 kernel/bpf/syscall.c

a38845729ea398 Jakub Kicinski     2018-01-11  103  =

99c55f7d47c0dc Alexei Starovoitov 2014-09-26  104  static struct bpf_map *f=
ind_and_alloc_map(union bpf_attr *attr)
99c55f7d47c0dc Alexei Starovoitov 2014-09-26  105  {
1110f3a9bcf394 Jakub Kicinski     2018-01-11  106  	const struct bpf_map_op=
s *ops;
9ef09e35e521bf Mark Rutland       2018-05-03  107  	u32 type =3D attr->map_=
type;
99c55f7d47c0dc Alexei Starovoitov 2014-09-26  108  	struct bpf_map *map;
1110f3a9bcf394 Jakub Kicinski     2018-01-11  109  	int err;
99c55f7d47c0dc Alexei Starovoitov 2014-09-26  110  =

9ef09e35e521bf Mark Rutland       2018-05-03  111  	if (type >=3D ARRAY_SIZ=
E(bpf_map_types))
1110f3a9bcf394 Jakub Kicinski     2018-01-11  112  		return ERR_PTR(-EINVAL=
);
9ef09e35e521bf Mark Rutland       2018-05-03  113  	type =3D array_index_no=
spec(type, ARRAY_SIZE(bpf_map_types));
9ef09e35e521bf Mark Rutland       2018-05-03  114  	ops =3D bpf_map_types[t=
ype];
45c88e856945c4 Mao Wenan          2020-04-22  115  	if (!ops) {
45c88e856945c4 Mao Wenan          2020-04-22 @116  		pr_warn("map type %d n=
ot supported or
45c88e856945c4 Mao Wenan          2020-04-22 @117  			 kernel config not op=
ened\n", type);
45c88e856945c4 Mao Wenan          2020-04-22  118  		return ERR_PTR(-EOPNOT=
SUPP);
45c88e856945c4 Mao Wenan          2020-04-22  119  	}
1110f3a9bcf394 Jakub Kicinski     2018-01-11  120  	if (ops->map_alloc_chec=
k) {
1110f3a9bcf394 Jakub Kicinski     2018-01-11  121  		err =3D ops->map_alloc=
_check(attr);
1110f3a9bcf394 Jakub Kicinski     2018-01-11  122  		if (err)
1110f3a9bcf394 Jakub Kicinski     2018-01-11  123  			return ERR_PTR(err);
1110f3a9bcf394 Jakub Kicinski     2018-01-11  124  	}
a38845729ea398 Jakub Kicinski     2018-01-11  125  	if (attr->map_ifindex)
a38845729ea398 Jakub Kicinski     2018-01-11  126  		ops =3D &bpf_map_offlo=
ad_ops;
1110f3a9bcf394 Jakub Kicinski     2018-01-11  127  	map =3D ops->map_alloc(=
attr);
99c55f7d47c0dc Alexei Starovoitov 2014-09-26  128  	if (IS_ERR(map))
99c55f7d47c0dc Alexei Starovoitov 2014-09-26  129  		return map;
1110f3a9bcf394 Jakub Kicinski     2018-01-11  130  	map->ops =3D ops;
9ef09e35e521bf Mark Rutland       2018-05-03  131  	map->map_type =3D type;
99c55f7d47c0dc Alexei Starovoitov 2014-09-26  132  	return map;
99c55f7d47c0dc Alexei Starovoitov 2014-09-26  133  }
99c55f7d47c0dc Alexei Starovoitov 2014-09-26  134  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9217024685986964162==--

