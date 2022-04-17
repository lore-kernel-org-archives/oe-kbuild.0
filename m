Content-Type: multipart/mixed; boundary="===============3548825021574803865=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jgunthorpe:iommufd 5/13] drivers/iommu/iommufd/pages.c:87:2: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 17 Apr 2022 09:28:30 +0800
Message-ID: <202204170942.l66fzcks-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3548825021574803865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux iommufd
head:   fc388f906088fe5f5f2db6a36931e00124f52042
commit: 445f2e02fe103f455aa17914b7b71528eac273bf [5/13] iommufd: PFN handli=
ng for iopt_pages
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20417/202204170942.l66fzcks-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 64c045=
e25b8471bbb572bd29159c294a82a86a25)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jgunthorpe/linux/commit/445f2e02fe103f455aa179=
14b7b71528eac273bf
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe iommufd
        git checkout 445f2e02fe103f455aa17914b7b71528eac273bf
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~~~~~~~
   kernel/static_call.c:230:3: note: Taking false branch
                   if (key !=3D prev_key) {
                   ^
   kernel/static_call.c:275:47: note: Access to field 'func' results in a d=
ereference of a null pointer (loaded from variable 'key')
                   arch_static_call_transform(site_addr, NULL, key->func,
                                                               ^~~
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   arch/x86/include/asm/paravirt.h:55:2: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
           PVOP_VCALL0(cpu.io_delay);
           ^
   arch/x86/include/asm/paravirt_types.h:512:2: note: expanded from macro '=
PVOP_VCALL0'
           __PVOP_VCALL(op)
           ^
   arch/x86/include/asm/paravirt_types.h:492:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^
   arch/x86/include/asm/paravirt_types.h:447:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^
   arch/x86/include/asm/paravirt_types.h:405:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^
   drivers/watchdog/pc87413_wdt.c:207:2: note: Calling 'outb_p'
           outb_p(inb(swc_base_addr + WDCTL) & 0x7f, swc_base_addr + WDCTL);
           ^
   arch/x86/include/asm/io.h:337:16: note: expanded from macro 'outb_p'
   #define outb_p outb_p
                  ^
   arch/x86/include/asm/io.h:320:1: note: Calling 'slow_down_io'
   BUILDIO(b, b, char)
   ^
   arch/x86/include/asm/io.h:278:2: note: expanded from macro 'BUILDIO'
           slow_down_io();                                                 \
           ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:55:2: note: Assigned value is garbage or=
 undefined
           PVOP_VCALL0(cpu.io_delay);
           ^
   arch/x86/include/asm/paravirt_types.h:512:2: note: expanded from macro '=
PVOP_VCALL0'
           __PVOP_VCALL(op)
           ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:492:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:447:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:405:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^       ~~~~~
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   drivers/char/pcmcia/cm4000_cs.c:1570:4: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           rc =3D 0;
                           ^    ~
   drivers/char/pcmcia/cm4000_cs.c:1570:4: note: Value stored to 'rc' is ne=
ver read
                           rc =3D 0;
                           ^    ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/iommu/iommufd/pages.c:87:2: warning: Value stored to 'rc' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           rc =3D check_add_overflow(pages->npinned, npages, &pages->npinne=
d);
           ^
   drivers/iommu/iommufd/pages.c:87:2: note: Value stored to 'rc' is never =
read
   drivers/iommu/iommufd/pages.c:96:2: warning: Value stored to 'rc' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           rc =3D check_sub_overflow(pages->npinned, npages, &pages->npinne=
d);
           ^
   drivers/iommu/iommufd/pages.c:96:2: note: Value stored to 'rc' is never =
read
   Suppressed 13 warnings (4 in non-user code, 9 with check filters).
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

vim +/rc +87 drivers/iommu/iommufd/pages.c

445f2e02fe103f Jason Gunthorpe 2021-12-13  82  =

445f2e02fe103f Jason Gunthorpe 2021-12-13  83  static void iopt_pages_add_n=
pinned(struct iopt_pages *pages, size_t npages)
445f2e02fe103f Jason Gunthorpe 2021-12-13  84  {
445f2e02fe103f Jason Gunthorpe 2021-12-13  85  	int rc;
445f2e02fe103f Jason Gunthorpe 2021-12-13  86  =

445f2e02fe103f Jason Gunthorpe 2021-12-13 @87  	rc =3D check_add_overflow(p=
ages->npinned, npages, &pages->npinned);
445f2e02fe103f Jason Gunthorpe 2021-12-13  88  	if (IS_ENABLED(CONFIG_IOMMU=
FD_TEST))
445f2e02fe103f Jason Gunthorpe 2021-12-13  89  		WARN_ON(rc || pages->npinn=
ed > pages->npages);
445f2e02fe103f Jason Gunthorpe 2021-12-13  90  }
445f2e02fe103f Jason Gunthorpe 2021-12-13  91  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3548825021574803865==--

