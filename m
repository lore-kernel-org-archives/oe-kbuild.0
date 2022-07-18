Content-Type: multipart/mixed; boundary="===============3822010119188719884=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.19-rc5 99/104] drivers/iommu/iommufd/main.c:177:19: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Mon, 18 Jul 2022 12:47:40 +0800
Message-ID: <202207181218.7ovPKqx2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3822010119188719884==
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: s390-randconfig-c005-20220715 (https://download.01.org/0day-ci/arch=
ive/20220718/202207181218.7ovPKqx2-lkp(a)intel.com/config)
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
   drivers/comedi/drivers/comedi_8254.c:309:6: note: Left side of '||' is f=
alse
   drivers/comedi/drivers/comedi_8254.c:309:22: note: Assuming 'counter2' i=
s <=3D 2
           if (counter1 > 2 || counter2 > 2 || counter1 =3D=3D counter2)
                               ^~~~~~~~~~~~
   drivers/comedi/drivers/comedi_8254.c:309:6: note: Left side of '||' is f=
alse
           if (counter1 > 2 || counter2 > 2 || counter1 =3D=3D counter2)
               ^
   drivers/comedi/drivers/comedi_8254.c:309:38: note: Assuming 'counter1' i=
s not equal to 'counter2'
           if (counter1 > 2 || counter2 > 2 || counter1 =3D=3D counter2)
                                               ^~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/comedi_8254.c:309:2: note: Taking false branch
           if (counter1 > 2 || counter2 > 2 || counter1 =3D=3D counter2)
           ^
   drivers/comedi/drivers/comedi_8254.c:312:6: note: Assuming 'enable' is f=
alse
           if (enable)
               ^~~~~~
   drivers/comedi/drivers/comedi_8254.c:312:2: note: Taking false branch
           if (enable)
           ^
   drivers/comedi/drivers/comedi_8254.c:317:2: note: Calling 'comedi_8254_s=
et_mode'
           comedi_8254_set_mode(i8254, counter1, mode);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/comedi_8254.c:257:6: note: 'counter' is <=3D 2
           if (counter > 2)
               ^~~~~~~
   drivers/comedi/drivers/comedi_8254.c:257:2: note: Taking false branch
           if (counter > 2)
           ^
   drivers/comedi/drivers/comedi_8254.c:259:2: note: Taking false branch
           if (mode > (I8254_MODE5 | I8254_BCD))
           ^
   drivers/comedi/drivers/comedi_8254.c:265:2: note: Calling '__i8254_write'
           __i8254_write(i8254, byte, I8254_CTRL_REG);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/comedi_8254.c:156:2: note: Control jumps to 'case=
 4:'  at line 170
           switch (i8254->iosize) {
           ^
   drivers/comedi/drivers/comedi_8254.c:171:7: note: Assuming field 'mmio' =
is null
                   if (i8254->mmio)
                       ^~~~~~~~~~~
   drivers/comedi/drivers/comedi_8254.c:171:3: note: Taking false branch
                   if (i8254->mmio)
                   ^
   drivers/comedi/drivers/comedi_8254.c:174:4: note: Calling '_outl'
                           outl(val, i8254->iobase + reg_offset);
                           ^
   include/asm-generic/io.h:549:14: note: expanded from macro 'outl'
   #define outl _outl
                ^
   include/asm-generic/io.h:517:15: note: expanded from macro '_outl'
   #define _outl _outl
                 ^
   include/asm-generic/io.h:520:2: note: Loop condition is false.  Exiting =
loop
           __io_pbw();
           ^
   include/asm-generic/io.h:49:24: note: expanded from macro '__io_pbw'
   #define __io_pbw()     __io_bw()
                          ^
   include/asm-generic/io.h:37:24: note: expanded from macro '__io_bw'
   #define __io_bw()      wmb()
                          ^
   include/asm-generic/barrier.h:38:20: note: expanded from macro 'wmb'
   #define wmb()   do { kcsan_wmb(); __wmb(); } while (0)
                        ^
   include/linux/kcsan-checks.h:255:21: note: expanded from macro 'kcsan_wm=
b'
   #define kcsan_wmb()     __KCSAN_BARRIER_TO_SIGNAL_FENCE(wmb)
                           ^
   include/linux/kcsan-checks.h:249:2: note: expanded from macro '__KCSAN_B=
ARRIER_TO_SIGNAL_FENCE'
           do {                                                            =
        \
           ^
   include/asm-generic/io.h:520:2: note: Loop condition is false.  Exiting =
loop
           __io_pbw();
           ^
   include/asm-generic/io.h:49:24: note: expanded from macro '__io_pbw'
   #define __io_pbw()     __io_bw()
                          ^
   include/asm-generic/io.h:37:24: note: expanded from macro '__io_bw'
   #define __io_bw()      wmb()
                          ^
   include/asm-generic/barrier.h:38:15: note: expanded from macro 'wmb'
   #define wmb()   do { kcsan_wmb(); __wmb(); } while (0)
                   ^
   include/asm-generic/io.h:521:48: note: Passing null pointer value via 2n=
d parameter 'addr'
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ^
   include/asm-generic/io.h:444:20: note: expanded from macro 'PCI_IOBASE'
   #define PCI_IOBASE ((void __iomem *)0)
                      ^
   include/asm-generic/io.h:521:2: note: Calling '__raw_writel'
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
           ^
   include/asm-generic/io.h:124:22: note: expanded from macro '__raw_writel'
   #define __raw_writel __raw_writel
                        ^
   include/asm-generic/io.h:127:32: note: Dereference of null pointer
           *(volatile u32 __force *)addr =3D value;
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   Suppressed 57 warnings (45 in non-user code, 12 with check filters).
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
--===============3822010119188719884==--

