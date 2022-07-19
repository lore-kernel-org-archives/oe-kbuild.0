Content-Type: multipart/mixed; boundary="===============7456851730605376432=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.19-rc5 99/104] drivers/iommu/iommufd/main.c:177:19: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Tue, 19 Jul 2022 23:03:53 +0800
Message-ID: <202207192250.jv6f3yyW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7456851730605376432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/i=
ommu/iommufd/main.c:177:19: warning: Dereference of null pointer [clang-ana=
lyzer-core.NullDereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.19-rc5
head:   f200d9a1de755f3bb98e21535e22b9adf6ba83f7
commit: de2f3eed0a9ab31214f0084a53446cec254e7a07 [99/104] iommufd: Add IOMM=
U_ALLOC_PASID
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: s390-randconfig-c005-20220715 (https://download.01.org/0day-ci/arch=
ive/20220719/202207192250.jv6f3yyW-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e=
6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/luxis1999/iommufd/commit/de2f3eed0a9ab31214f00=
84a53446cec254e7a07
        git remote add luxis1999-iommufd https://github.com/luxis1999/iommu=
fd
        git fetch --no-tags luxis1999-iommufd iommufd-v5.19-rc5
        git checkout de2f3eed0a9ab31214f0084a53446cec254e7a07
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/sched/em_meta.c:937:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&meta->rvalue.hdr, &hdr->right, sizeof(hdr->right));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/sched/em_meta.c:971:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&hdr, 0, sizeof(hdr));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/sched/em_meta.c:971:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&hdr, 0, sizeof(hdr));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/sched/em_meta.c:972:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&hdr.left, &meta->lvalue.hdr, sizeof(hdr.left));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/sched/em_meta.c:972:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&hdr.left, &meta->lvalue.hdr, sizeof(hdr.left));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/sched/em_meta.c:973:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&hdr.right, &meta->rvalue.hdr, sizeof(hdr.right));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/sched/em_meta.c:973:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&hdr.right, &meta->rvalue.hdr, sizeof(hdr.right));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 117 warnings (105 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
>> drivers/iommu/iommufd/main.c:177:19: warning: Dereference of null pointe=
r [clang-analyzer-core.NullDereference]
           mm =3D get_task_mm(current);
                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/iommu/iommufd/main.c:168:9: note: Calling 'kzalloc'
           ictx =3D kzalloc(sizeof(*ictx), GFP_KERNEL_ACCOUNT);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:588:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:605:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/main.c:168:9: note: Returning from 'kzalloc'
           ictx =3D kzalloc(sizeof(*ictx), GFP_KERNEL_ACCOUNT);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/main.c:169:6: note: Assuming 'ictx' is non-null
           if (!ictx)
               ^~~~~
   drivers/iommu/iommufd/main.c:169:2: note: Taking false branch
           if (!ictx)
           ^
   drivers/iommu/iommufd/main.c:174:2: note: Loop condition is false.  Exit=
ing loop
           mutex_init(&ictx->vfio_compat);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/iommu/iommufd/main.c:177:19: note: Dereference of null pointer
           mm =3D get_task_mm(current);
                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/iommu/iommufd/pages.c:91:2: warning: Value stored to 'rc' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           rc =3D check_add_overflow(pages->npinned, npages, &pages->npinne=
d);
           ^
   drivers/iommu/iommufd/pages.c:91:2: note: Value stored to 'rc' is never =
read
   drivers/iommu/iommufd/pages.c:100:2: warning: Value stored to 'rc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           rc =3D check_sub_overflow(pages->npinned, npages, &pages->npinne=
d);
           ^
   drivers/iommu/iommufd/pages.c:100:2: note: Value stored to 'rc' is never=
 read
   drivers/iommu/iommufd/pages.c:413:25: warning: The left operand of '>' i=
s a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (batch->npfns[cur] > offset)
                                         ^
   drivers/iommu/iommufd/pages.c:1310:15: note: 'user' is non-null
           if (WARN_ON(!user))
                        ^
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(x);                      \
                                  ^
   drivers/iommu/iommufd/pages.c:1310:6: note: Taking false branch
           if (WARN_ON(!user))
               ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   drivers/iommu/iommufd/pages.c:1310:6: note: Taking false branch
           if (WARN_ON(!user))
               ^
   arch/s390/include/asm/bug.h:59:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   drivers/iommu/iommufd/pages.c:1310:2: note: Taking false branch
           if (WARN_ON(!user))
           ^
   drivers/iommu/iommufd/pages.c:1313:2: note: Taking false branch
           if (!refcount_dec_and_test(&user->refcount))
           ^
   drivers/iommu/iommufd/pages.c:1317:2: note: Calling 'iopt_pages_unfill_x=
array'
           iopt_pages_unfill_xarray(pages, start, last);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:1090:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:309:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~

vim +177 drivers/iommu/iommufd/main.c

f4254b5e76181e Jason Gunthorpe 2021-11-11  161  =

f4254b5e76181e Jason Gunthorpe 2021-11-11  162  static int iommufd_fops_ope=
n(struct inode *inode, struct file *filp)
f4254b5e76181e Jason Gunthorpe 2021-11-11  163  {
f4254b5e76181e Jason Gunthorpe 2021-11-11  164  	struct iommufd_ctx *ictx;
de2f3eed0a9ab3 Yi Liu          2022-05-25  165  	struct mm_struct *mm;
de2f3eed0a9ab3 Yi Liu          2022-05-25  166  	int ret =3D 0;
f4254b5e76181e Jason Gunthorpe 2021-11-11  167  =

f4254b5e76181e Jason Gunthorpe 2021-11-11  168  	ictx =3D kzalloc(sizeof(*i=
ctx), GFP_KERNEL_ACCOUNT);
f4254b5e76181e Jason Gunthorpe 2021-11-11  169  	if (!ictx)
f4254b5e76181e Jason Gunthorpe 2021-11-11  170  		return -ENOMEM;
f4254b5e76181e Jason Gunthorpe 2021-11-11  171  =

f4254b5e76181e Jason Gunthorpe 2021-11-11  172  	xa_init_flags(&ictx->objec=
ts, XA_FLAGS_ALLOC1 | XA_FLAGS_ACCOUNT);
f4254b5e76181e Jason Gunthorpe 2021-11-11  173  	ictx->filp =3D filp;
44c9be5e8f584d Nicolin Chen    2022-01-31  174  	mutex_init(&ictx->vfio_com=
pat);
f4254b5e76181e Jason Gunthorpe 2021-11-11  175  	filp->private_data =3D ict=
x;
de2f3eed0a9ab3 Yi Liu          2022-05-25  176  =

de2f3eed0a9ab3 Yi Liu          2022-05-25 @177  	mm =3D get_task_mm(current=
);
de2f3eed0a9ab3 Yi Liu          2022-05-25  178  	/* REVISIT: IOASID set quo=
ta must be enforced at per mm level, but
de2f3eed0a9ab3 Yi Liu          2022-05-25  179  	 * users should be able to=
 open iommufd multiple times. For now we
de2f3eed0a9ab3 Yi Liu          2022-05-25  180  	 * just prevent multi-open=
. TODO: find a more explicit token
de2f3eed0a9ab3 Yi Liu          2022-05-25  181  	 * than mm.
de2f3eed0a9ab3 Yi Liu          2022-05-25  182  	 */
de2f3eed0a9ab3 Yi Liu          2022-05-25  183  	ictx->pasid_set =3D ioasid=
_set_alloc_with_mm(mm, 1000);
de2f3eed0a9ab3 Yi Liu          2022-05-25  184  	/* IOASID core will mmgrab=
 to ensure life time alignment */
de2f3eed0a9ab3 Yi Liu          2022-05-25  185  	if (IS_ERR(ictx->pasid_set=
))
de2f3eed0a9ab3 Yi Liu          2022-05-25  186  		ret =3D -EBUSY;
de2f3eed0a9ab3 Yi Liu          2022-05-25  187  	mmput(mm);
de2f3eed0a9ab3 Yi Liu          2022-05-25  188  =

de2f3eed0a9ab3 Yi Liu          2022-05-25  189  	return ret;
f4254b5e76181e Jason Gunthorpe 2021-11-11  190  }
f4254b5e76181e Jason Gunthorpe 2021-11-11  191  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7456851730605376432==--

