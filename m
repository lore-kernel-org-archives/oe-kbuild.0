Content-Type: multipart/mixed; boundary="===============3581824479692865616=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/core/uverbs_ioctl.c:765 _uverbs_get_const_signed() warn: passing a valid pointer to 'PTR_ERR'
Date: Wed, 09 Mar 2022 16:13:11 +0800
Message-ID: <202203091634.9k6eQaVo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3581824479692865616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Yishai Hadas <yishaih@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   330f4c53d3c2d8b11d86ec03a964b86dc81452f5
commit: 2904bb37b35d07be7bfa3fb4a0fc1a3daa6678b3 IB/core: Split uverbs_get_=
const/default to consider target type
date:   12 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 12 months ago
config: microblaze-randconfig-m031-20220308 (https://download.01.org/0day-c=
i/archive/20220309/202203091634.9k6eQaVo-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/infiniband/core/uverbs_ioctl.c:765 _uverbs_get_const_signed() warn:=
 passing a valid pointer to 'PTR_ERR'
drivers/infiniband/core/uverbs_ioctl.c:788 _uverbs_get_const_unsigned() war=
n: passing a valid pointer to 'PTR_ERR'

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:91 current_thread_info() error: u=
ninitialized symbol 'sp'.
drivers/infiniband/core/uverbs_ioctl.c:730 uverbs_copy_to() warn: passing a=
 valid pointer to 'PTR_ERR'
drivers/infiniband/core/uverbs_ioctl.c:750 uverbs_output_written() warn: pa=
ssing a valid pointer to 'PTR_ERR'
drivers/infiniband/core/uverbs_ioctl.c:808 uverbs_copy_to_struct_or_zero() =
warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +765 drivers/infiniband/core/uverbs_ioctl.c

d6f4a21f309dfe1 Jason Gunthorpe  2019-01-11  754  =

2904bb37b35d07b Yishai Hadas     2021-03-04  755  int _uverbs_get_const_sig=
ned(s64 *to,
2904bb37b35d07b Yishai Hadas     2021-03-04  756  			     const struct uver=
bs_attr_bundle *attrs_bundle,
0953fffec9ba022 Mark Bloch       2018-08-28  757  			     size_t idx, s64 l=
ower_bound, u64 upper_bound,
0953fffec9ba022 Mark Bloch       2018-08-28  758  			     s64  *def_val)
0953fffec9ba022 Mark Bloch       2018-08-28  759  {
0953fffec9ba022 Mark Bloch       2018-08-28  760  	const struct uverbs_attr=
 *attr;
0953fffec9ba022 Mark Bloch       2018-08-28  761  =

0953fffec9ba022 Mark Bloch       2018-08-28  762  	attr =3D uverbs_attr_get=
(attrs_bundle, idx);
0953fffec9ba022 Mark Bloch       2018-08-28  763  	if (IS_ERR(attr)) {
0953fffec9ba022 Mark Bloch       2018-08-28  764  		if ((PTR_ERR(attr) !=3D=
 -ENOENT) || !def_val)
0953fffec9ba022 Mark Bloch       2018-08-28 @765  			return PTR_ERR(attr);
0953fffec9ba022 Mark Bloch       2018-08-28  766  =

0953fffec9ba022 Mark Bloch       2018-08-28  767  		*to =3D *def_val;
0953fffec9ba022 Mark Bloch       2018-08-28  768  	} else {
0953fffec9ba022 Mark Bloch       2018-08-28  769  		*to =3D attr->ptr_attr.=
data;
0953fffec9ba022 Mark Bloch       2018-08-28  770  	}
0953fffec9ba022 Mark Bloch       2018-08-28  771  =

0953fffec9ba022 Mark Bloch       2018-08-28  772  	if (*to < lower_bound ||=
 (*to > 0 && (u64)*to > upper_bound))
0953fffec9ba022 Mark Bloch       2018-08-28  773  		return -EINVAL;
0953fffec9ba022 Mark Bloch       2018-08-28  774  =

0953fffec9ba022 Mark Bloch       2018-08-28  775  	return 0;
0953fffec9ba022 Mark Bloch       2018-08-28  776  }
2904bb37b35d07b Yishai Hadas     2021-03-04  777  EXPORT_SYMBOL(_uverbs_get=
_const_signed);
2904bb37b35d07b Yishai Hadas     2021-03-04  778  =

2904bb37b35d07b Yishai Hadas     2021-03-04  779  int _uverbs_get_const_uns=
igned(u64 *to,
2904bb37b35d07b Yishai Hadas     2021-03-04  780  			       const struct uv=
erbs_attr_bundle *attrs_bundle,
2904bb37b35d07b Yishai Hadas     2021-03-04  781  			       size_t idx, u64=
 upper_bound, u64 *def_val)
2904bb37b35d07b Yishai Hadas     2021-03-04  782  {
2904bb37b35d07b Yishai Hadas     2021-03-04  783  	const struct uverbs_attr=
 *attr;
2904bb37b35d07b Yishai Hadas     2021-03-04  784  =

2904bb37b35d07b Yishai Hadas     2021-03-04  785  	attr =3D uverbs_attr_get=
(attrs_bundle, idx);
2904bb37b35d07b Yishai Hadas     2021-03-04  786  	if (IS_ERR(attr)) {
2904bb37b35d07b Yishai Hadas     2021-03-04  787  		if ((PTR_ERR(attr) !=3D=
 -ENOENT) || !def_val)
2904bb37b35d07b Yishai Hadas     2021-03-04 @788  			return PTR_ERR(attr);
2904bb37b35d07b Yishai Hadas     2021-03-04  789  =

2904bb37b35d07b Yishai Hadas     2021-03-04  790  		*to =3D *def_val;
2904bb37b35d07b Yishai Hadas     2021-03-04  791  	} else {
2904bb37b35d07b Yishai Hadas     2021-03-04  792  		*to =3D attr->ptr_attr.=
data;
2904bb37b35d07b Yishai Hadas     2021-03-04  793  	}
2904bb37b35d07b Yishai Hadas     2021-03-04  794  =

2904bb37b35d07b Yishai Hadas     2021-03-04  795  	if (*to > upper_bound)
2904bb37b35d07b Yishai Hadas     2021-03-04  796  		return -EINVAL;
2904bb37b35d07b Yishai Hadas     2021-03-04  797  =

2904bb37b35d07b Yishai Hadas     2021-03-04  798  	return 0;
2904bb37b35d07b Yishai Hadas     2021-03-04  799  }
2904bb37b35d07b Yishai Hadas     2021-03-04  800  EXPORT_SYMBOL(_uverbs_get=
_const_unsigned);
2e8039c656224b4 Michael Guralnik 2018-12-09  801  =


:::::: The code at line 765 was first introduced by commit
:::::: 0953fffec9ba022f63bfe01e86427530d8320d5c RDMA/uverbs: Add UVERBS_ATT=
R_CONST_IN to the specs language

:::::: TO: Mark Bloch <markb@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3581824479692865616==--

