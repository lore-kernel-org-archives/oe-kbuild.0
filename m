Content-Type: multipart/mixed; boundary="===============4711387523094901359=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.19-rc5 77/104] drivers/iommu/iommufd/vfio_compat.c:362:3: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 18 Jul 2022 01:04:21 +0800
Message-ID: <202207180141.Wr5pG8LT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4711387523094901359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/iommu/iommufd/vfio_compat.c:362:3: warning: Value stored to 'rc' i=
s never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.19-rc5
head:   f200d9a1de755f3bb98e21535e22b9adf6ba83f7
commit: a636dff3ade41bd1c61e16bc697af82ffe07f8c6 [77/104] vfio: Add iommufd=
 VFIO compat support to group_fd
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: s390-randconfig-c005-20220715 (https://download.01.org/0day-ci/arch=
ive/20220718/202207180141.Wr5pG8LT-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e=
6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/luxis1999/iommufd/commit/a636dff3ade41bd1c61e1=
6bc697af82ffe07f8c6
        git remote add luxis1999-iommufd https://github.com/luxis1999/iommu=
fd
        git fetch --no-tags luxis1999-iommufd iommufd-v5.19-rc5
        git checkout a636dff3ade41bd1c61e16bc697af82ffe07f8c6
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   include/linux/printk.h:464:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:435:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:388:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   include/linux/hid.h:1055:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:674:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:658:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:464:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:435:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:388:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   include/linux/hid.h:1055:3: note: '?' condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:674:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:658:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:464:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:435:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:397:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   include/linux/hid.h:1055:3: note: '?' condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:674:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:658:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:464:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:435:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:401:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   include/linux/hid.h:1055:3: note: Loop condition is false.  Exiting loop
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:674:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:658:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:464:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:435:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:387:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   include/linux/hid.h:1056:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:674:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:658:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
>> drivers/iommu/iommufd/vfio_compat.c:362:3: warning: Value stored to 'rc'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D -EFAULT;
                   ^    ~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:362:3: note: Value stored to 'rc' is=
 never read
                   rc =3D -EFAULT;
                   ^    ~~~~~~~
   Suppressed 57 warnings (45 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   drivers/iommu/iommu.c:449:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           return sprintf(buf, "%s\n", group->name);
                  ^~~~~~~
   drivers/iommu/iommu.c:449:9: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           return sprintf(buf, "%s\n", group->name);
                  ^~~~~~~
   drivers/iommu/iommu.c:568:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
                   str +=3D sprintf(str, "0x%016llx 0x%016llx %s\n",
                          ^~~~~~~
   drivers/iommu/iommu.c:568:10: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
                   str +=3D sprintf(str, "0x%016llx 0x%016llx %s\n",
                          ^~~~~~~
   drivers/iommu/iommu.c:605:2: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(buf, type);
           ^~~~~~
   drivers/iommu/iommu.c:605:2: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
           strcpy(buf, type);
           ^~~~~~
   drivers/iommu/iommu.c:1695:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&gtype, 0, sizeof(gtype));
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
   drivers/iommu/iommu.c:1695:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&gtype, 0, sizeof(gtype));
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
   include/linux/iommu.h:437:9: warning: Access to field 'iommu_dev' result=
s in a dereference of a null pointer (loaded from field 'iommu') [clang-ana=
lyzer-core.NullDereference]
           return dev->iommu->iommu_dev->ops;
                  ^
   drivers/iommu/iommu.c:1649:6: note: Assuming 'action' is equal to BUS_NO=
TIFY_ADD_DEVICE
           if (action =3D=3D BUS_NOTIFY_ADD_DEVICE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:1649:2: note: Taking true branch
           if (action =3D=3D BUS_NOTIFY_ADD_DEVICE) {
           ^
   drivers/iommu/iommu.c:1652:9: note: Calling 'iommu_probe_device'
                   ret =3D iommu_probe_device(dev);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:303:8: note: Calling '__iommu_probe_device'
           ret =3D __iommu_probe_device(dev, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:251:6: note: Assuming 'ops' is non-null
           if (!ops)
               ^~~~
   drivers/iommu/iommu.c:251:2: note: Taking false branch
           if (!ops)
           ^
   drivers/iommu/iommu.c:254:7: note: Calling 'dev_iommu_get'
           if (!dev_iommu_get(dev))
                ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:202:6: note: Assuming 'param' is non-null
           if (param)
               ^~~~~
   drivers/iommu/iommu.c:202:2: note: Taking true branch
           if (param)
           ^
   drivers/iommu/iommu.c:203:3: note: Returning without writing to 'dev->io=
mmu'
                   return param;
                   ^
   drivers/iommu/iommu.c:254:7: note: Returning from 'dev_iommu_get'
           if (!dev_iommu_get(dev))
                ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:254:2: note: Taking false branch
           if (!dev_iommu_get(dev))
           ^
   drivers/iommu/iommu.c:257:2: note: Taking false branch
           if (!try_module_get(ops->owner)) {
           ^
   drivers/iommu/iommu.c:263:2: note: Taking true branch
           if (IS_ERR(iommu_dev)) {
           ^
   drivers/iommu/iommu.c:265:3: note: Control jumps to line 289
                   goto out_module_put;
                   ^
   drivers/iommu/iommu.c:292:2: note: Calling 'dev_iommu_free'
           dev_iommu_free(dev);
--
                  ^~~~~~~
   drivers/uio/uio.c:58:9: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%pa\n", &mem->addr);
                  ^~~~~~~
   drivers/uio/uio.c:58:9: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%pa\n", &mem->addr);
                  ^~~~~~~
   drivers/uio/uio.c:63:9: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%pa\n", &mem->size);
                  ^~~~~~~
   drivers/uio/uio.c:63:9: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%pa\n", &mem->size);
                  ^~~~~~~
   drivers/uio/uio.c:68:9: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%llx\n", (unsigned long long)mem->offs);
                  ^~~~~~~
   drivers/uio/uio.c:68:9: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%llx\n", (unsigned long long)mem->offs);
                  ^~~~~~~
   drivers/uio/uio.c:137:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", port->name);
                  ^~~~~~~
   drivers/uio/uio.c:137:9: note: Call to function 'sprintf' is insecure as=
 it does not provide bounding of the memory buffer or security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
           return sprintf(buf, "%s\n", port->name);
                  ^~~~~~~
   drivers/uio/uio.c:142:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%lx\n", port->start);
                  ^~~~~~~
   drivers/uio/uio.c:142:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%lx\n", port->start);
                  ^~~~~~~
   drivers/uio/uio.c:147:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%lx\n", port->size);
                  ^~~~~~~
   drivers/uio/uio.c:147:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%lx\n", port->size);
                  ^~~~~~~
   drivers/uio/uio.c:157:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "port_%s\n", porttypes[port->porttype]);
                  ^~~~~~~
   drivers/uio/uio.c:157:9: note: Call to function 'sprintf' is insecure as=
 it does not provide bounding of the memory buffer or security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
           return sprintf(buf, "port_%s\n", porttypes[port->porttype]);
                  ^~~~~~~
   drivers/uio/uio.c:228:8: warning: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sprintf(buf, "%s\n", idev->info->name);
                 ^~~~~~~
   drivers/uio/uio.c:228:8: note: Call to function 'sprintf' is insecure as=
 it does not provide bounding of the memory buffer or security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
           ret =3D sprintf(buf, "%s\n", idev->info->name);
                 ^~~~~~~
   drivers/uio/uio.c:249:8: warning: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sprintf(buf, "%s\n", idev->info->version);
                 ^~~~~~~
   drivers/uio/uio.c:249:8: note: Call to function 'sprintf' is insecure as=
 it does not provide bounding of the memory buffer or security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
           ret =3D sprintf(buf, "%s\n", idev->info->version);
                 ^~~~~~~
   drivers/uio/uio.c:261:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (unsigned int)atomic_read(&idev->eve=
nt));
                  ^~~~~~~
   drivers/uio/uio.c:261:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (unsigned int)atomic_read(&idev->eve=
nt));
                  ^~~~~~~
   drivers/uio/uio.c:570:26: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name =3D __WAITQUEUE_INITIALIZER(name, t=
sk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITI=
ALIZER'
           .private        =3D tsk,                                        =
          \
                             ^~~
   drivers/uio/uio.c:570:26: note: Dereference of null pointer
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name =3D __WAITQUEUE_INITIALIZER(name, t=
sk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITI=
ALIZER'
           .private        =3D tsk,                                        =
          \
                             ^~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (46 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (45 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
>> drivers/iommu/iommufd/io_pagetable.c:492:2: warning: Undefined or garbag=
e value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return rc;
           ^      ~~
   drivers/iommu/iommufd/io_pagetable.c:430:2: note: 'rc' declared without =
an initial value
           int rc;
           ^~~~~~
   drivers/iommu/iommufd/io_pagetable.c:432:6: note: Assuming 'length' is n=
ot equal to 0
           if (!length)
               ^~~~~~~
   drivers/iommu/iommufd/io_pagetable.c:432:2: note: Taking false branch
           if (!length)
           ^
   drivers/iommu/iommufd/io_pagetable.c:434:2: note: Taking false branch
           if (check_add_overflow(iova, length - 1, &last_iova))
           ^
   drivers/iommu/iommufd/io_pagetable.c:438:2: note: Loop condition is fals=
e. Execution continues on line 482
           for (area =3D iopt_area_iter_first(iopt, iova, last_iova); area;
           ^
   drivers/iommu/iommufd/io_pagetable.c:482:6: note: Assuming 'cur_iova' is=
 not equal to 'last_iova'
           if (cur_iova !=3D last_iova)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/io_pagetable.c:482:2: note: Taking true branch
           if (cur_iova !=3D last_iova)
           ^
   drivers/iommu/iommufd/io_pagetable.c:483:3: note: Control jumps to line =
489
                   goto out_remove;
                   ^
   drivers/iommu/iommufd/io_pagetable.c:489:6: note: 'cur_iova' is equal to=
 'iova'
           if (cur_iova !=3D iova)
               ^~~~~~~~
   drivers/iommu/iommufd/io_pagetable.c:489:2: note: Taking false branch
           if (cur_iova !=3D iova)
           ^
   drivers/iommu/iommufd/io_pagetable.c:492:2: note: Undefined or garbage v=
alue returned to caller
           return rc;
           ^      ~~
   Suppressed 57 warnings (45 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (45 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
>> drivers/iommu/iommufd/pages.c:91:2: warning: Value stored to 'rc' is nev=
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
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(x);                      \
                                  ^
   drivers/iommu/iommufd/pages.c:1090:2: note: Left side of '&&' is false
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/iommu/iommufd/pages.c:1090:2: note: Taking false branch
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   drivers/iommu/iommufd/pages.c:1090:2: note: Taking false branch
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:59:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   drivers/iommu/iommufd/pages.c:1090:2: note: Loop condition is false.  Ex=
iting loop
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   drivers/iommu/iommufd/pages.c:1092:2: note: Taking false branch
           if (interval_tree_fully_covers(&pages->domains_itree, start, las=
t))
           ^
   drivers/iommu/iommufd/pages.c:1095:2: note: Calling 'batch_init_backup'
           batch_init_backup(&batch, last + 1, backup, sizeof(backup));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:216:2: note: Calling '__batch_init'
           __batch_init(batch, max_pages, backup, backup_len);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
           ^
   include/linux/lockdep.h:309:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   drivers/iommu/iommufd/pages.c:572:2: note: Taking false branch
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:59:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   drivers/iommu/iommufd/pages.c:572:2: note: Loop condition is false.  Exi=
ting loop
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   drivers/iommu/iommufd/pages.c:576:8: note: Calling 'interval_tree_span_i=
ter_done'
                !interval_tree_span_iter_done(&user_span);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/interval_tree.h:68:9: note: Assuming the condition is false
           return state->is_hole =3D=3D -1;
                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/interval_tree.h:68:2: note: Returning without writing to '=
state->is_hole', which participates in a condition later
           return state->is_hole =3D=3D -1;
           ^
   drivers/iommu/iommufd/pages.c:576:8: note: Returning from 'interval_tree=
_span_iter_done'
                !interval_tree_span_iter_done(&user_span);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:574:2: note: Loop condition is true.  Ente=
ring loop body
           for (interval_tree_span_iter_first(&user_span, &pages->users_itr=
ee, 0,
           ^
   drivers/iommu/iommufd/pages.c:578:7: note: Assuming field 'is_hole' is n=
ot equal to 0
                   if (!user_span.is_hole)
                       ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:578:3: note: Taking false branch
                   if (!user_span.is_hole)
                   ^
   drivers/iommu/iommufd/pages.c:584:9: note: Calling 'interval_tree_span_i=
ter_done'
                        !interval_tree_span_iter_done(&area_span);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/interval_tree.h:68:9: note: Assuming the condition is false
           return state->is_hole =3D=3D -1;
                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/interval_tree.h:68:2: note: Returning without writing to '=
state->is_hole', which participates in a condition later
           return state->is_hole =3D=3D -1;
           ^
   drivers/iommu/iommufd/pages.c:584:9: note: Returning from 'interval_tree=
_span_iter_done'
                        !interval_tree_span_iter_done(&area_span);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:581:3: note: Loop condition is true.  Ente=
ring loop body
                   for (interval_tree_span_iter_first(
                   ^
   drivers/iommu/iommufd/pages.c:586:8: note: Assuming field 'is_hole' is n=
ot equal to 0
                           if (!area_span.is_hole)
                               ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:586:4: note: Taking false branch
                           if (!area_span.is_hole)
                           ^
   drivers/iommu/iommufd/pages.c:589:4: note: Calling 'batch_unpin'
                           batch_unpin(batch, pages, area_span.start_hole -=
 index,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iommu/iommufd/pages.c:412:2: note: Loop condition is true.  Ente=
ring loop body
           while (offset) {
           ^
   drivers/iommu/iommufd/pages.c:413:3: note: Taking false branch
                   if (batch->npfns[cur] > offset)
                   ^
   drivers/iommu/iommufd/pages.c:416:3: note: The value 1 is assigned to 'c=
ur'
                   cur++;
                   ^~~~~
   drivers/iommu/iommufd/pages.c:412:2: note: Loop condition is false. Exec=
ution continues on line 419
           while (offset) {
           ^
   drivers/iommu/iommufd/pages.c:419:2: note: Loop condition is true.  Ente=
ring loop body
           while (npages) {
           ^
   drivers/iommu/iommufd/pages.c:421:44: note: The left operand of '-' is a=
 garbage value
                           min_t(size_t, npages, batch->npfns[cur] - offset=
);
                                                                   ^
   include/linux/minmax.h:104:59: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                                                   ^
   include/linux/minmax.h:38:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                                 ^
   include/linux/minmax.h:32:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y =3D (y);               \
                                         ^
>> drivers/iommu/iommufd/pages.c:760:21: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           pages->source_mm =3D current->mm;
                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/iommu/iommufd/pages.c:750:6: note: Assuming the condition is fal=
se
           if (length > SIZE_MAX - PAGE_SIZE || length =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:750:6: note: Left side of '||' is false
   drivers/iommu/iommufd/pages.c:750:39: note: Assuming 'length' is not equ=
al to 0
           if (length > SIZE_MAX - PAGE_SIZE || length =3D=3D 0)
                                                ^~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:750:2: note: Taking false branch
           if (length > SIZE_MAX - PAGE_SIZE || length =3D=3D 0)
           ^
   drivers/iommu/iommufd/pages.c:753:10: note: Calling 'kzalloc'
           pages =3D kzalloc(sizeof(*pages), GFP_KERNEL_ACCOUNT);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/iommu/iommufd/pages.c:753:10: note: Returning from 'kzalloc'
           pages =3D kzalloc(sizeof(*pages), GFP_KERNEL_ACCOUNT);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:754:6: note: Assuming 'pages' is non-null
           if (!pages)
               ^~~~~~
   drivers/iommu/iommufd/pages.c:754:2: note: Taking false branch
           if (!pages)
           ^
   drivers/iommu/iommufd/pages.c:759:2: note: Loop condition is false.  Exi=
ting loop
           mutex_init(&pages->mutex);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/iommu/iommufd/pages.c:760:21: note: Dereference of null pointer
           pages->source_mm =3D current->mm;
                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/iommu/iommufd/pages.c:995:19: warning: The right operand of '<=
=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (unmap_index <=3D index)
                                   ^  ~~~~~
   drivers/iommu/iommufd/pages.c:957:2: note: 'index' declared without an i=
nitial value
           unsigned long index;
           ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:960:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&area->iopt->domains_rwsem);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:309:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(x);                      \
                                  ^
   drivers/iommu/iommufd/pages.c:960:2: note: Left side of '&&' is false
           lockdep_assert_held(&area->iopt->domains_rwsem);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/iommu/iommufd/pages.c:960:2: note: Taking false branch
           lockdep_assert_held(&area->iopt->domains_rwsem);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   drivers/iommu/iommufd/pages.c:960:2: note: Taking false branch

vim +/rc +362 drivers/iommu/iommufd/vfio_compat.c

d841a090b5e8d3 Jason Gunthorpe 2021-12-15  295  =

d841a090b5e8d3 Jason Gunthorpe 2021-12-15  296  static int iommufd_vfio_iom=
mu_get_info(struct iommufd_ctx *ictx,
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  297  				       void __user *arg)
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  298  {
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  299  	typedef int (*fill_cap_fn)=
(struct iommufd_ioas *ioas,
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  300  				   struct vfio_info_cap=
_header __user *cur,
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  301  				   size_t avail);
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  302  	static const fill_cap_fn f=
ill_fns[] =3D {
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  303  		iommufd_fill_cap_iova,
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  304  		iommufd_fill_cap_dma_avai=
l,
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  305  	};
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  306  	size_t minsz =3D offsetofe=
nd(struct vfio_iommu_type1_info, iova_pgsizes);
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  307  	struct vfio_info_cap_heade=
r __user *last_cap =3D NULL;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  308  	struct vfio_iommu_type1_in=
fo info;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  309  	struct iommufd_ioas *ioas;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  310  	size_t total_cap_size;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  311  	int rc;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  312  	int i;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  313  =

d841a090b5e8d3 Jason Gunthorpe 2021-12-15  314  	if (copy_from_user(&info, =
arg, minsz))
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  315  		return -EFAULT;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  316  =

d841a090b5e8d3 Jason Gunthorpe 2021-12-15  317  	if (info.argsz < minsz)
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  318  		return -EINVAL;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  319  	minsz =3D min_t(size_t, in=
fo.argsz, sizeof(info));
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  320  =

d841a090b5e8d3 Jason Gunthorpe 2021-12-15  321  	ioas =3D get_compat_ioas(i=
ctx);
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  322  	if (IS_ERR(ioas))
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  323  		return PTR_ERR(ioas);
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  324  =

d841a090b5e8d3 Jason Gunthorpe 2021-12-15  325  	down_read(&ioas->iopt.iova=
_rwsem);
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  326  	info.flags =3D VFIO_IOMMU_=
INFO_PGSIZES;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  327  	info.iova_pgsizes =3D iomm=
ufd_get_pagesizes(ioas);
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  328  	info.cap_offset =3D 0;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  329  =

d841a090b5e8d3 Jason Gunthorpe 2021-12-15  330  	total_cap_size =3D sizeof(=
info);
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  331  	for (i =3D 0; i !=3D ARRAY=
_SIZE(fill_fns); i++) {
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  332  		int cap_size;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  333  =

d841a090b5e8d3 Jason Gunthorpe 2021-12-15  334  		if (info.argsz > total_ca=
p_size)
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  335  			cap_size =3D fill_fns[i]=
(ioas, arg + total_cap_size,
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  336  					       info.argsz - to=
tal_cap_size);
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  337  		else
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  338  			cap_size =3D fill_fns[i]=
(ioas, NULL, 0);
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  339  		if (cap_size < 0) {
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  340  			rc =3D cap_size;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  341  			goto out_put;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  342  		}
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  343  		if (last_cap && info.args=
z >=3D total_cap_size &&
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  344  		    put_user(total_cap_si=
ze, &last_cap->next)) {
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  345  			rc =3D -EFAULT;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  346  			goto out_put;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  347  		}
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  348  		last_cap =3D arg + total_=
cap_size;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  349  		total_cap_size +=3D cap_s=
ize;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  350  	}
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  351  =

d841a090b5e8d3 Jason Gunthorpe 2021-12-15  352  	/*
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  353  	 * If the user did not pro=
vide enough space then only some caps are
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  354  	 * returned and the argsz =
will be updated to the correct amount to get
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  355  	 * all caps.
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  356  	 */
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  357  	if (info.argsz >=3D total_=
cap_size)
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  358  		info.cap_offset =3D sizeo=
f(info);
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  359  	info.argsz =3D total_cap_s=
ize;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  360  	info.flags |=3D VFIO_IOMMU=
_INFO_CAPS;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  361  	if (copy_to_user(arg, &inf=
o, minsz))
d841a090b5e8d3 Jason Gunthorpe 2021-12-15 @362  		rc =3D -EFAULT;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  363  	rc =3D 0;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  364  =

d841a090b5e8d3 Jason Gunthorpe 2021-12-15  365  out_put:
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  366  	up_read(&ioas->iopt.iova_r=
wsem);
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  367  	iommufd_put_object(&ioas->=
obj);
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  368  	return rc;
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  369  }
d841a090b5e8d3 Jason Gunthorpe 2021-12-15  370  =


:::::: The code at line 362 was first introduced by commit
:::::: d841a090b5e8d3a13c62d1b211c26090c5909053 iommufd: vfio container FD =
ioctl compatibility

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Yi Liu <yi.l.liu@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4711387523094901359==--

