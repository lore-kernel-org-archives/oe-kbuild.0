Content-Type: multipart/mixed; boundary="===============0024188185608793146=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jgunthorpe:iommufd 10/12] drivers/iommu/iommufd/vfio_compat.c:358:3: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 01 Mar 2022 01:36:52 +0800
Message-ID: <202203010007.dMWQzNHZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0024188185608793146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Nicolin Chen <nicolinc@nvidia.com>

tree:   https://github.com/jgunthorpe/linux iommufd
head:   446626304259cf3deb4a4799b42a909bea0bc070
commit: 6df3783f55eb10f5583783566fd12646ef693568 [10/12] iommufd: vfio cont=
ainer FD ioctl compatibility
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: mips-randconfig-c004-20220227 (https://download.01.org/0day-ci/arch=
ive/20220301/202203010007.dMWQzNHZ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/jgunthorpe/linux/commit/6df3783f55eb10f5583783=
566fd12646ef693568
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe iommufd
        git checkout 6df3783f55eb10f5583783566fd12646ef693568
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->a=
rgsz'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->a=
rgsz'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:139:6: note: Returning from 'copy_fr=
om_user'
           if (copy_from_user(&unmap, arg, minsz))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:139:2: note: Taking false branch
           if (copy_from_user(&unmap, arg, minsz))
           ^
   drivers/iommu/iommufd/vfio_compat.c:142:18: note: The left operand of '<=
' is a garbage value
           if (unmap.argsz < minsz || unmap.flags & ~supported_flags)
               ~~~~~~~~~~~ ^
   drivers/iommu/iommufd/vfio_compat.c:313:17: warning: The left operand of=
 '<' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (info.argsz < minsz)
                          ^
   drivers/iommu/iommufd/vfio_compat.c:383:2: note: Control jumps to 'case =
536886128:' @line 390
           switch (cmd) {
           ^
   drivers/iommu/iommufd/vfio_compat.c:391:10: note: Calling 'iommufd_vfio_=
iommu_get_info'
                   return iommufd_vfio_iommu_get_info(ictx, uarg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:310:6: note: Calling 'copy_from_user'
           if (copy_from_user(&info, arg, minsz))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->argsz'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->a=
rgsz'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->a=
rgsz'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:310:6: note: Returning from 'copy_fr=
om_user'
           if (copy_from_user(&info, arg, minsz))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:310:2: note: Taking false branch
           if (copy_from_user(&info, arg, minsz))
           ^
   drivers/iommu/iommufd/vfio_compat.c:313:17: note: The left operand of '<=
' is a garbage value
           if (info.argsz < minsz)
               ~~~~~~~~~~ ^
>> drivers/iommu/iommufd/vfio_compat.c:358:3: warning: Value stored to 'rc'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D -EFAULT;
                   ^    ~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:358:3: note: Value stored to 'rc' is=
 never read
                   rc =3D -EFAULT;
                   ^    ~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/rc +358 drivers/iommu/iommufd/vfio_compat.c

6df3783f55eb10 Jason Gunthorpe 2021-12-15  291  =

6df3783f55eb10 Jason Gunthorpe 2021-12-15  292  static int iommufd_vfio_iom=
mu_get_info(struct iommufd_ctx *ictx,
6df3783f55eb10 Jason Gunthorpe 2021-12-15  293  				       void __user *arg)
6df3783f55eb10 Jason Gunthorpe 2021-12-15  294  {
6df3783f55eb10 Jason Gunthorpe 2021-12-15  295  	typedef int (*fill_cap_fn)=
(struct iommufd_ioas *ioas,
6df3783f55eb10 Jason Gunthorpe 2021-12-15  296  				   struct vfio_info_cap=
_header __user *cur,
6df3783f55eb10 Jason Gunthorpe 2021-12-15  297  				   size_t avail);
6df3783f55eb10 Jason Gunthorpe 2021-12-15  298  	static const fill_cap_fn f=
ill_fns[] =3D {
6df3783f55eb10 Jason Gunthorpe 2021-12-15  299  		iommufd_fill_cap_iova,
6df3783f55eb10 Jason Gunthorpe 2021-12-15  300  		iommufd_fill_cap_dma_avai=
l,
6df3783f55eb10 Jason Gunthorpe 2021-12-15  301  	};
6df3783f55eb10 Jason Gunthorpe 2021-12-15  302  	size_t minsz =3D offsetofe=
nd(struct vfio_iommu_type1_info, iova_pgsizes);
6df3783f55eb10 Jason Gunthorpe 2021-12-15  303  	struct vfio_info_cap_heade=
r __user *last_cap =3D NULL;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  304  	struct vfio_iommu_type1_in=
fo info;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  305  	struct iommufd_ioas *ioas;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  306  	size_t total_cap_size;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  307  	int rc;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  308  	int i;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  309  =

6df3783f55eb10 Jason Gunthorpe 2021-12-15  310  	if (copy_from_user(&info, =
arg, minsz))
6df3783f55eb10 Jason Gunthorpe 2021-12-15  311  		return -EFAULT;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  312  =

6df3783f55eb10 Jason Gunthorpe 2021-12-15  313  	if (info.argsz < minsz)
6df3783f55eb10 Jason Gunthorpe 2021-12-15  314  		return -EINVAL;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  315  	minsz =3D min_t(size_t, in=
fo.argsz, sizeof(info));
6df3783f55eb10 Jason Gunthorpe 2021-12-15  316  =

6df3783f55eb10 Jason Gunthorpe 2021-12-15  317  	ioas =3D get_compat_ioas(i=
ctx);
6df3783f55eb10 Jason Gunthorpe 2021-12-15  318  	if (IS_ERR(ioas))
6df3783f55eb10 Jason Gunthorpe 2021-12-15  319  		return PTR_ERR(ioas);
6df3783f55eb10 Jason Gunthorpe 2021-12-15  320  =

6df3783f55eb10 Jason Gunthorpe 2021-12-15  321  	down_read(&ioas->iopt.iova=
_rwsem);
6df3783f55eb10 Jason Gunthorpe 2021-12-15  322  	info.flags =3D VFIO_IOMMU_=
INFO_PGSIZES;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  323  	info.iova_pgsizes =3D iomm=
ufd_get_pagesizes(ioas);
6df3783f55eb10 Jason Gunthorpe 2021-12-15  324  	info.cap_offset =3D 0;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  325  =

6df3783f55eb10 Jason Gunthorpe 2021-12-15  326  	total_cap_size =3D sizeof(=
info);
6df3783f55eb10 Jason Gunthorpe 2021-12-15  327  	for (i =3D 0; i !=3D ARRAY=
_SIZE(fill_fns); i++) {
6df3783f55eb10 Jason Gunthorpe 2021-12-15  328  		int cap_size;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  329  =

6df3783f55eb10 Jason Gunthorpe 2021-12-15  330  		if (info.argsz > total_ca=
p_size)
6df3783f55eb10 Jason Gunthorpe 2021-12-15  331  			cap_size =3D fill_fns[i]=
(ioas, arg + total_cap_size,
6df3783f55eb10 Jason Gunthorpe 2021-12-15  332  					       info.argsz - to=
tal_cap_size);
6df3783f55eb10 Jason Gunthorpe 2021-12-15  333  		else
6df3783f55eb10 Jason Gunthorpe 2021-12-15  334  			cap_size =3D fill_fns[i]=
(ioas, NULL, 0);
6df3783f55eb10 Jason Gunthorpe 2021-12-15  335  		if (cap_size < 0) {
6df3783f55eb10 Jason Gunthorpe 2021-12-15  336  			rc =3D cap_size;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  337  			goto out_put;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  338  		}
6df3783f55eb10 Jason Gunthorpe 2021-12-15  339  		if (last_cap && info.args=
z >=3D total_cap_size &&
6df3783f55eb10 Jason Gunthorpe 2021-12-15  340  		    put_user(total_cap_si=
ze, &last_cap->next)) {
6df3783f55eb10 Jason Gunthorpe 2021-12-15  341  			rc =3D -EFAULT;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  342  			goto out_put;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  343  		}
6df3783f55eb10 Jason Gunthorpe 2021-12-15  344  		last_cap =3D arg + total_=
cap_size;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  345  		total_cap_size +=3D cap_s=
ize;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  346  	}
6df3783f55eb10 Jason Gunthorpe 2021-12-15  347  =

6df3783f55eb10 Jason Gunthorpe 2021-12-15  348  	/*
6df3783f55eb10 Jason Gunthorpe 2021-12-15  349  	 * If the user did not pro=
vide enough space then only some caps are
6df3783f55eb10 Jason Gunthorpe 2021-12-15  350  	 * returned and the argsz =
will be updated to the correct amount to get
6df3783f55eb10 Jason Gunthorpe 2021-12-15  351  	 * all caps.
6df3783f55eb10 Jason Gunthorpe 2021-12-15  352  	 */
6df3783f55eb10 Jason Gunthorpe 2021-12-15  353  	if (info.argsz >=3D total_=
cap_size)
6df3783f55eb10 Jason Gunthorpe 2021-12-15  354  		info.cap_offset =3D sizeo=
f(info);
6df3783f55eb10 Jason Gunthorpe 2021-12-15  355  	info.argsz =3D total_cap_s=
ize;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  356  	info.flags |=3D VFIO_IOMMU=
_INFO_CAPS;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  357  	if (copy_to_user(arg, &inf=
o, minsz))
6df3783f55eb10 Jason Gunthorpe 2021-12-15 @358  		rc =3D -EFAULT;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  359  	rc =3D 0;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  360  =

6df3783f55eb10 Jason Gunthorpe 2021-12-15  361  out_put:
6df3783f55eb10 Jason Gunthorpe 2021-12-15  362  	up_read(&ioas->iopt.iova_r=
wsem);
6df3783f55eb10 Jason Gunthorpe 2021-12-15  363  	iommufd_put_object(&ioas->=
obj);
6df3783f55eb10 Jason Gunthorpe 2021-12-15  364  	return rc;
6df3783f55eb10 Jason Gunthorpe 2021-12-15  365  }
6df3783f55eb10 Jason Gunthorpe 2021-12-15  366  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0024188185608793146==--

