Content-Type: multipart/mixed; boundary="===============3796731468780067326=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jgunthorpe:iommufd 11/13] drivers/iommu/iommufd/vfio_compat.c:358:3: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 17 Apr 2022 14:02:33 +0800
Message-ID: <202204171342.9ZeGAZ06-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3796731468780067326==
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
head:   fc388f906088fe5f5f2db6a36931e00124f52042
commit: 10b9e6259f371ccf7958257a7f135ee11a1844a2 [11/13] iommufd: vfio cont=
ainer FD ioctl compatibility
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20417/202204171342.9ZeGAZ06-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 64c045=
e25b8471bbb572bd29159c294a82a86a25)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jgunthorpe/linux/commit/10b9e6259f371ccf795825=
7a7f135ee11a1844a2
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe iommufd
        git checkout 10b9e6259f371ccf7958257a7f135ee11a1844a2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~
   fs/crypto/hkdf.c:153:3: note: Taking false branch
                   if (err)
                   ^
   fs/crypto/hkdf.c:156:3: note: Taking false branch
                   BUILD_BUG_ON(sizeof(counter) !=3D 1);
                   ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/crypto/hkdf.c:156:3: note: Loop condition is false.  Exiting loop
                   BUILD_BUG_ON(sizeof(counter) !=3D 1);
                   ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/crypto/hkdf.c:157:7: note: Assuming the condition is false
                   if (okmlen - i < HKDF_HASHLEN) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/crypto/hkdf.c:157:3: note: Taking false branch
                   if (okmlen - i < HKDF_HASHLEN) {
                   ^
   fs/crypto/hkdf.c:165:8: note: Assuming 'err' is 0
                           if (err)
                               ^~~
   fs/crypto/hkdf.c:165:4: note: Taking false branch
                           if (err)
                           ^
   fs/crypto/hkdf.c:136:14: note: Assuming 'i' is < 'okmlen'
           for (i =3D 0; i < okmlen; i +=3D HKDF_HASHLEN) {
                       ^~~~~~~~~~
   fs/crypto/hkdf.c:136:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < okmlen; i +=3D HKDF_HASHLEN) {
           ^
   fs/crypto/hkdf.c:139:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   fs/crypto/hkdf.c:139:3: note: Taking false branch
                   if (err)
                   ^
   fs/crypto/hkdf.c:142:7: note: Assuming 'prev' is null
                   if (prev) {
                       ^~~~
   fs/crypto/hkdf.c:142:3: note: Taking false branch
                   if (prev) {
                   ^
   fs/crypto/hkdf.c:149:7: note: Assuming 'err' is not equal to 0
                   if (err)
                       ^~~
   fs/crypto/hkdf.c:149:3: note: Taking true branch
                   if (err)
                   ^
   fs/crypto/hkdf.c:150:4: note: Control jumps to line 173
                           goto out;
                           ^
   fs/crypto/hkdf.c:173:15: note: 'err' is not equal to 0
           if (unlikely(err))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/crypto/hkdf.c:173:2: note: Taking true branch
           if (unlikely(err))
           ^
   fs/crypto/hkdf.c:174:20: note: Passing null pointer value via 1st parame=
ter 's'
                   memzero_explicit(okm, okmlen); /* so caller doesn't need=
 to */
                                    ^~~
   fs/crypto/hkdf.c:174:3: note: Calling 'memzero_explicit'
                   memzero_explicit(okm, okmlen); /* so caller doesn't need=
 to */
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/string.h:237:2: note: Null pointer passed as 1st argument =
to memory set function
           memset(s, 0, count);
           ^      ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/iommu/iommufd/vfio_compat.c:358:3: warning: Value stored to 'rc'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D -EFAULT;
                   ^    ~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:358:3: note: Value stored to 'rc' is=
 never read
                   rc =3D -EFAULT;
                   ^    ~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/iommu/iommu.c:573:2: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(buf, type);
           ^~~~~~
   drivers/iommu/iommu.c:573:2: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
           strcpy(buf, type);
           ^~~~~~
   include/linux/iommu.h:407:9: warning: Access to field 'iommu_dev' result=
s in a dereference of a null pointer (loaded from field 'iommu') [clang-ana=
lyzer-core.NullDereference]
           return dev->iommu->iommu_dev->ops;
                  ^
   drivers/iommu/iommu.c:1614:6: note: Assuming 'action' is equal to BUS_NO=
TIFY_ADD_DEVICE
           if (action =3D=3D BUS_NOTIFY_ADD_DEVICE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:1614:2: note: Taking true branch
           if (action =3D=3D BUS_NOTIFY_ADD_DEVICE) {
           ^
   drivers/iommu/iommu.c:1617:9: note: Calling 'iommu_probe_device'
                   ret =3D iommu_probe_device(dev);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:278:8: note: Calling '__iommu_probe_device'
           ret =3D __iommu_probe_device(dev, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:227:6: note: Assuming 'ops' is non-null
           if (!ops)
               ^~~~
   drivers/iommu/iommu.c:227:2: note: Taking false branch
           if (!ops)
           ^
   drivers/iommu/iommu.c:230:7: note: Calling 'dev_iommu_get'
           if (!dev_iommu_get(dev))
                ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:196:6: note: Assuming 'param' is non-null
           if (param)
               ^~~~~
   drivers/iommu/iommu.c:196:2: note: Taking true branch
           if (param)
           ^
   drivers/iommu/iommu.c:197:3: note: Returning without writing to 'dev->io=
mmu'
                   return param;
                   ^
   drivers/iommu/iommu.c:230:7: note: Returning from 'dev_iommu_get'
           if (!dev_iommu_get(dev))
                ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:230:2: note: Taking false branch
           if (!dev_iommu_get(dev))
           ^
   drivers/iommu/iommu.c:233:6: note: Assuming the condition is false
           if (!try_module_get(ops->owner)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:233:2: note: Taking false branch
           if (!try_module_get(ops->owner)) {
           ^
   drivers/iommu/iommu.c:239:2: note: Taking true branch
           if (IS_ERR(iommu_dev)) {
           ^
   drivers/iommu/iommu.c:241:3: note: Control jumps to line 264
                   goto out_module_put;
                   ^
   drivers/iommu/iommu.c:267:2: note: Calling 'dev_iommu_free'
           dev_iommu_free(dev);
           ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:212:2: note: Null pointer value stored to field 'i=
ommu'
           dev->iommu =3D NULL;
           ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:213:6: note: Assuming field 'fwspec' is null
           if (param->fwspec) {
               ^~~~~~~~~~~~~
   drivers/iommu/iommu.c:213:2: note: Taking false branch
           if (param->fwspec) {
           ^
   drivers/iommu/iommu.c:267:2: note: Returning from 'dev_iommu_free'
           dev_iommu_free(dev);
           ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:278:8: note: Returning from '__iommu_probe_device'
           ret =3D __iommu_probe_device(dev, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:279:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/iommu/iommu.c:279:2: note: Taking false branch
           if (ret)
           ^
   drivers/iommu/iommu.c:282:10: note: Calling 'iommu_group_get'
           group =3D iommu_group_get(dev);
                   ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:1032:6: note: Assuming 'group' is non-null
           if (group)
               ^~~~~
   drivers/iommu/iommu.c:1032:2: note: Taking true branch
           if (group)
           ^
   drivers/iommu/iommu.c:1035:2: note: Returning without writing to 'dev->i=
ommu'
           return group;

vim +/rc +358 drivers/iommu/iommufd/vfio_compat.c

10b9e6259f371c Jason Gunthorpe 2021-12-15  291  =

10b9e6259f371c Jason Gunthorpe 2021-12-15  292  static int iommufd_vfio_iom=
mu_get_info(struct iommufd_ctx *ictx,
10b9e6259f371c Jason Gunthorpe 2021-12-15  293  				       void __user *arg)
10b9e6259f371c Jason Gunthorpe 2021-12-15  294  {
10b9e6259f371c Jason Gunthorpe 2021-12-15  295  	typedef int (*fill_cap_fn)=
(struct iommufd_ioas *ioas,
10b9e6259f371c Jason Gunthorpe 2021-12-15  296  				   struct vfio_info_cap=
_header __user *cur,
10b9e6259f371c Jason Gunthorpe 2021-12-15  297  				   size_t avail);
10b9e6259f371c Jason Gunthorpe 2021-12-15  298  	static const fill_cap_fn f=
ill_fns[] =3D {
10b9e6259f371c Jason Gunthorpe 2021-12-15  299  		iommufd_fill_cap_iova,
10b9e6259f371c Jason Gunthorpe 2021-12-15  300  		iommufd_fill_cap_dma_avai=
l,
10b9e6259f371c Jason Gunthorpe 2021-12-15  301  	};
10b9e6259f371c Jason Gunthorpe 2021-12-15  302  	size_t minsz =3D offsetofe=
nd(struct vfio_iommu_type1_info, iova_pgsizes);
10b9e6259f371c Jason Gunthorpe 2021-12-15  303  	struct vfio_info_cap_heade=
r __user *last_cap =3D NULL;
10b9e6259f371c Jason Gunthorpe 2021-12-15  304  	struct vfio_iommu_type1_in=
fo info;
10b9e6259f371c Jason Gunthorpe 2021-12-15  305  	struct iommufd_ioas *ioas;
10b9e6259f371c Jason Gunthorpe 2021-12-15  306  	size_t total_cap_size;
10b9e6259f371c Jason Gunthorpe 2021-12-15  307  	int rc;
10b9e6259f371c Jason Gunthorpe 2021-12-15  308  	int i;
10b9e6259f371c Jason Gunthorpe 2021-12-15  309  =

10b9e6259f371c Jason Gunthorpe 2021-12-15  310  	if (copy_from_user(&info, =
arg, minsz))
10b9e6259f371c Jason Gunthorpe 2021-12-15  311  		return -EFAULT;
10b9e6259f371c Jason Gunthorpe 2021-12-15  312  =

10b9e6259f371c Jason Gunthorpe 2021-12-15  313  	if (info.argsz < minsz)
10b9e6259f371c Jason Gunthorpe 2021-12-15  314  		return -EINVAL;
10b9e6259f371c Jason Gunthorpe 2021-12-15  315  	minsz =3D min_t(size_t, in=
fo.argsz, sizeof(info));
10b9e6259f371c Jason Gunthorpe 2021-12-15  316  =

10b9e6259f371c Jason Gunthorpe 2021-12-15  317  	ioas =3D get_compat_ioas(i=
ctx);
10b9e6259f371c Jason Gunthorpe 2021-12-15  318  	if (IS_ERR(ioas))
10b9e6259f371c Jason Gunthorpe 2021-12-15  319  		return PTR_ERR(ioas);
10b9e6259f371c Jason Gunthorpe 2021-12-15  320  =

10b9e6259f371c Jason Gunthorpe 2021-12-15  321  	down_read(&ioas->iopt.iova=
_rwsem);
10b9e6259f371c Jason Gunthorpe 2021-12-15  322  	info.flags =3D VFIO_IOMMU_=
INFO_PGSIZES;
10b9e6259f371c Jason Gunthorpe 2021-12-15  323  	info.iova_pgsizes =3D iomm=
ufd_get_pagesizes(ioas);
10b9e6259f371c Jason Gunthorpe 2021-12-15  324  	info.cap_offset =3D 0;
10b9e6259f371c Jason Gunthorpe 2021-12-15  325  =

10b9e6259f371c Jason Gunthorpe 2021-12-15  326  	total_cap_size =3D sizeof(=
info);
10b9e6259f371c Jason Gunthorpe 2021-12-15  327  	for (i =3D 0; i !=3D ARRAY=
_SIZE(fill_fns); i++) {
10b9e6259f371c Jason Gunthorpe 2021-12-15  328  		int cap_size;
10b9e6259f371c Jason Gunthorpe 2021-12-15  329  =

10b9e6259f371c Jason Gunthorpe 2021-12-15  330  		if (info.argsz > total_ca=
p_size)
10b9e6259f371c Jason Gunthorpe 2021-12-15  331  			cap_size =3D fill_fns[i]=
(ioas, arg + total_cap_size,
10b9e6259f371c Jason Gunthorpe 2021-12-15  332  					       info.argsz - to=
tal_cap_size);
10b9e6259f371c Jason Gunthorpe 2021-12-15  333  		else
10b9e6259f371c Jason Gunthorpe 2021-12-15  334  			cap_size =3D fill_fns[i]=
(ioas, NULL, 0);
10b9e6259f371c Jason Gunthorpe 2021-12-15  335  		if (cap_size < 0) {
10b9e6259f371c Jason Gunthorpe 2021-12-15  336  			rc =3D cap_size;
10b9e6259f371c Jason Gunthorpe 2021-12-15  337  			goto out_put;
10b9e6259f371c Jason Gunthorpe 2021-12-15  338  		}
10b9e6259f371c Jason Gunthorpe 2021-12-15  339  		if (last_cap && info.args=
z >=3D total_cap_size &&
10b9e6259f371c Jason Gunthorpe 2021-12-15  340  		    put_user(total_cap_si=
ze, &last_cap->next)) {
10b9e6259f371c Jason Gunthorpe 2021-12-15  341  			rc =3D -EFAULT;
10b9e6259f371c Jason Gunthorpe 2021-12-15  342  			goto out_put;
10b9e6259f371c Jason Gunthorpe 2021-12-15  343  		}
10b9e6259f371c Jason Gunthorpe 2021-12-15  344  		last_cap =3D arg + total_=
cap_size;
10b9e6259f371c Jason Gunthorpe 2021-12-15  345  		total_cap_size +=3D cap_s=
ize;
10b9e6259f371c Jason Gunthorpe 2021-12-15  346  	}
10b9e6259f371c Jason Gunthorpe 2021-12-15  347  =

10b9e6259f371c Jason Gunthorpe 2021-12-15  348  	/*
10b9e6259f371c Jason Gunthorpe 2021-12-15  349  	 * If the user did not pro=
vide enough space then only some caps are
10b9e6259f371c Jason Gunthorpe 2021-12-15  350  	 * returned and the argsz =
will be updated to the correct amount to get
10b9e6259f371c Jason Gunthorpe 2021-12-15  351  	 * all caps.
10b9e6259f371c Jason Gunthorpe 2021-12-15  352  	 */
10b9e6259f371c Jason Gunthorpe 2021-12-15  353  	if (info.argsz >=3D total_=
cap_size)
10b9e6259f371c Jason Gunthorpe 2021-12-15  354  		info.cap_offset =3D sizeo=
f(info);
10b9e6259f371c Jason Gunthorpe 2021-12-15  355  	info.argsz =3D total_cap_s=
ize;
10b9e6259f371c Jason Gunthorpe 2021-12-15  356  	info.flags |=3D VFIO_IOMMU=
_INFO_CAPS;
10b9e6259f371c Jason Gunthorpe 2021-12-15  357  	if (copy_to_user(arg, &inf=
o, minsz))
10b9e6259f371c Jason Gunthorpe 2021-12-15 @358  		rc =3D -EFAULT;
10b9e6259f371c Jason Gunthorpe 2021-12-15  359  	rc =3D 0;
10b9e6259f371c Jason Gunthorpe 2021-12-15  360  =

10b9e6259f371c Jason Gunthorpe 2021-12-15  361  out_put:
10b9e6259f371c Jason Gunthorpe 2021-12-15  362  	up_read(&ioas->iopt.iova_r=
wsem);
10b9e6259f371c Jason Gunthorpe 2021-12-15  363  	iommufd_put_object(&ioas->=
obj);
10b9e6259f371c Jason Gunthorpe 2021-12-15  364  	return rc;
10b9e6259f371c Jason Gunthorpe 2021-12-15  365  }
10b9e6259f371c Jason Gunthorpe 2021-12-15  366  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3796731468780067326==--

