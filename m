Content-Type: multipart/mixed; boundary="===============8166392663300407727=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kees:kspp/memcpy/next-20210726/v1 28/64] arch/x86/kernel/cpu/mce/dev-mcelog.c:313:15: warning: The left operand of '>=' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Sun, 01 Aug 2021 13:55:49 +0800
Message-ID: <202108011346.rOva5Aty-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8166392663300407727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git kspp=
/memcpy/next-20210726/v1
head:   831e05d47f76f6e7452fedbcb471dd405242bfaf
commit: c2c5b6a9e071a474a22c96d45a0e2a86cc9947db [28/64] compiler_types.h: =
Remove __compiletime_object_size()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-c001-20210728 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project c49df1=
5c278857adecd12db6bb1cdc96885f7079)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/co=
mmit/?id=3Dc2c5b6a9e071a474a22c96d45a0e2a86cc9947db
        git remote add kees https://git.kernel.org/pub/scm/linux/kernel/git=
/kees/linux.git
        git fetch --no-tags kees kspp/memcpy/next-20210726/v1
        git checkout c2c5b6a9e071a474a22c96d45a0e2a86cc9947db
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/regset.h:260:2: note: Loop condition is false.  Exiting lo=
op
           BUG_ON(*pos < start_pos);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   include/linux/regset.h:261:6: note: 'end_pos' is < 0
           if (end_pos < 0 || *pos < end_pos) {
               ^~~~~~~
   include/linux/regset.h:261:18: note: Left side of '||' is true
           if (end_pos < 0 || *pos < end_pos) {
                           ^
   include/linux/regset.h:262:24: note: 'end_pos' is < 0
                   unsigned int copy =3D (end_pos < 0 ? *count
                                        ^~~~~~~
   include/linux/regset.h:262:24: note: '?' condition is true
   include/linux/regset.h:265:7: note: Assuming the condition is false
                   if (*kbuf) {
                       ^~~~~
   include/linux/regset.h:265:3: note: Taking false branch
                   if (*kbuf) {
                   ^
   include/linux/regset.h:268:14: note: Calling '__copy_from_user'
                   } else if (__copy_from_user(data, *ubuf, copy))
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:110:6: note: Assuming the condition is false
           if (should_fail_usercopy())
               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:110:2: note: Taking false branch
           if (should_fail_usercopy())
           ^
   include/linux/uaccess.h:114:9: note: Calling 'raw_copy_from_user'
           return raw_copy_from_user(to, from, n);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess_64.h:52:9: note: Calling 'copy_user_generic'
           return copy_user_generic(dst, (__force void *)src, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess_64.h:46:2: note: Returning without writing =
to 'to->mxcsr'
           return ret;
           ^
   arch/x86/include/asm/uaccess_64.h:52:9: note: Returning from 'copy_user_=
generic'
           return copy_user_generic(dst, (__force void *)src, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess_64.h:52:2: note: Returning without writing =
to 'dst->mxcsr'
           return copy_user_generic(dst, (__force void *)src, size);
           ^
   include/linux/uaccess.h:114:9: note: Returning from 'raw_copy_from_user'
           return raw_copy_from_user(to, from, n);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:114:2: note: Returning without writing to 'to->m=
xcsr'
           return raw_copy_from_user(to, from, n);
           ^
   include/linux/regset.h:268:14: note: Returning from '__copy_from_user'
                   } else if (__copy_from_user(data, *ubuf, copy))
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/regset.h:268:14: note: Assuming the condition is false
                   } else if (__copy_from_user(data, *ubuf, copy))
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/regset.h:268:10: note: Taking false branch
                   } else if (__copy_from_user(data, *ubuf, copy))
                          ^
   include/linux/regset.h:275:2: note: Returning zero, which participates i=
n a condition later
           return 0;
           ^~~~~~~~
   arch/x86/kernel/fpu/regset.c:102:8: note: Returning from 'user_regset_co=
pyin'
           ret =3D user_regset_copyin(&pos, &count, &kbuf, &ubuf, &newstate=
, 0, -1);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   arch/x86/kernel/fpu/regset.c:103:6: note: 'ret' is 0
           if (ret)
               ^~~
   arch/x86/kernel/fpu/regset.c:103:2: note: Taking false branch
           if (ret)
           ^
   arch/x86/kernel/fpu/regset.c:107:21: note: The left operand of '&' is a =
garbage value
           if (newstate.mxcsr & ~mxcsr_feature_mask)
               ~~~~~~~~~~~~~~ ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   arch/x86/kernel/cpu/mce/dev-mcelog.c:98:2: warning: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
           strcpy(buf, mce_helper);
           ^~~~~~
   arch/x86/kernel/cpu/mce/dev-mcelog.c:98:2: note: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119
           strcpy(buf, mce_helper);
           ^~~~~~
   arch/x86/kernel/cpu/mce/dev-mcelog.c:99:2: warning: Call to function 'st=
rcat' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
           strcat(buf, "\n");
           ^~~~~~
   arch/x86/kernel/cpu/mce/dev-mcelog.c:99:2: note: Call to function 'strca=
t' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
>> arch/x86/kernel/cpu/mce/dev-mcelog.c:313:15: warning: The left operand o=
f '>=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
           if (m.extcpu >=3D num_possible_cpus() || !cpu_online(m.extcpu))
               ~~~~~~~~ ^
   arch/x86/kernel/cpu/mce/dev-mcelog.c:299:6: note: Assuming the condition=
 is false
           if (!capable(CAP_SYS_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mce/dev-mcelog.c:299:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   arch/x86/kernel/cpu/mce/dev-mcelog.c:305:7: note: Left side of '&&' is t=
rue
           if (!boot_cpu_has(X86_FEATURE_MCE) || !boot_cpu_has(X86_FEATURE_=
MCA))
                ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:3: note: expanded from macro 'cpu_=
has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
            ^
   arch/x86/kernel/cpu/mce/dev-mcelog.c:305:7: note: Left side of '&&' is t=
rue
           if (!boot_cpu_has(X86_FEATURE_MCE) || !boot_cpu_has(X86_FEATURE_=
MCA))
                ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:74:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
            ( CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK,  0, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:3: note: expanded from macro 'CHECK=
_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
            ^
   arch/x86/kernel/cpu/mce/dev-mcelog.c:305:7: note: Left side of '||' is f=
alse
           if (!boot_cpu_has(X86_FEATURE_MCE) || !boot_cpu_has(X86_FEATURE_=
MCA))
                ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:74:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
            ( CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK,  0, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:2: note: expanded from macro 'CHECK=
_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
           ^
   arch/x86/kernel/cpu/mce/dev-mcelog.c:305:7: note: Left side of '&&' is f=
alse
           if (!boot_cpu_has(X86_FEATURE_MCE) || !boot_cpu_has(X86_FEATURE_=
MCA))
                ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:75:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
              CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK,  1, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   arch/x86/kernel/cpu/mce/dev-mcelog.c:305:7: note: Left side of '&&' is f=
alse
           if (!boot_cpu_has(X86_FEATURE_MCE) || !boot_cpu_has(X86_FEATURE_=
MCA))
                ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:76:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
              CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK,  2, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   arch/x86/kernel/cpu/mce/dev-mcelog.c:305:7: note: Left side of '&&' is f=
alse
           if (!boot_cpu_has(X86_FEATURE_MCE) || !boot_cpu_has(X86_FEATURE_=
MCA))
                ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:77:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
              CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK,  3, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   arch/x86/kernel/cpu/mce/dev-mcelog.c:305:7: note: Left side of '&&' is f=
alse
           if (!boot_cpu_has(X86_FEATURE_MCE) || !boot_cpu_has(X86_FEATURE_=
MCA))
                ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
--
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:872:2: note: Calling 'remove_probe_files'
           remove_probe_files(bus);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:572:2: note: Calling 'bus_remove_file'
           bus_remove_file(bus, &bus_attr_drivers_autoprobe);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:145:6: note: Calling 'bus_get'
           if (bus_get(bus)) {
               ^~~~~~~~~~~~
   drivers/base/bus.c:44:6: note: 'bus' is non-null
           if (bus) {
               ^~~
   drivers/base/bus.c:44:2: note: Taking true branch
           if (bus) {
           ^
   drivers/base/bus.c:46:3: note: Returning without writing to 'bus->p'
                   return bus;
                   ^
   drivers/base/bus.c:145:6: note: Returning from 'bus_get'
           if (bus_get(bus)) {
               ^~~~~~~~~~~~
   drivers/base/bus.c:145:2: note: Taking true branch
           if (bus_get(bus)) {
           ^
   drivers/base/bus.c:147:3: note: Calling 'bus_put'
                   bus_put(bus);
                   ^~~~~~~~~~~~
   drivers/base/bus.c:53:6: note: 'bus' is non-null
           if (bus)
               ^~~
   drivers/base/bus.c:53:2: note: Taking true branch
           if (bus)
           ^
   drivers/base/bus.c:55:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:147:3: note: Returning from 'bus_put'
                   bus_put(bus);
                   ^~~~~~~~~~~~
   drivers/base/bus.c:149:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:572:2: note: Returning from 'bus_remove_file'
           bus_remove_file(bus, &bus_attr_drivers_autoprobe);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:573:2: note: Calling 'bus_remove_file'
           bus_remove_file(bus, &bus_attr_drivers_probe);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:145:6: note: Calling 'bus_get'
           if (bus_get(bus)) {
               ^~~~~~~~~~~~
   drivers/base/bus.c:44:6: note: 'bus' is non-null
           if (bus) {
               ^~~
   drivers/base/bus.c:44:2: note: Taking true branch
           if (bus) {
           ^
   drivers/base/bus.c:46:3: note: Returning without writing to 'bus->p'
                   return bus;
                   ^
   drivers/base/bus.c:145:6: note: Returning from 'bus_get'
           if (bus_get(bus)) {
               ^~~~~~~~~~~~
   drivers/base/bus.c:145:2: note: Taking true branch
           if (bus_get(bus)) {
           ^
   drivers/base/bus.c:147:3: note: Calling 'bus_put'
                   bus_put(bus);
                   ^~~~~~~~~~~~
   drivers/base/bus.c:53:6: note: 'bus' is non-null
           if (bus)
               ^~~
   drivers/base/bus.c:53:2: note: Taking true branch
           if (bus)
           ^
   drivers/base/bus.c:55:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:147:3: note: Returning from 'bus_put'
                   bus_put(bus);
                   ^~~~~~~~~~~~
   drivers/base/bus.c:149:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:573:2: note: Returning from 'bus_remove_file'
           bus_remove_file(bus, &bus_attr_drivers_probe);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:574:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:872:2: note: Returning from 'remove_probe_files'
           remove_probe_files(bus);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:873:18: note: Access to field 'drivers_kset' results =
in a dereference of a null pointer (loaded from field 'p')
           kset_unregister(bus->p->drivers_kset);
                           ^    ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/char/ipmi/ipmb_dev_int.c:150:12: warning: The right operand of '=
<' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (count < msg[0])
                     ^ ~~~~~~
   drivers/char/ipmi/ipmb_dev_int.c:144:6: note: Assuming the condition is =
false
           if (count > sizeof(msg))
               ^~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmb_dev_int.c:144:2: note: Taking false branch
           if (count > sizeof(msg))
           ^
   drivers/char/ipmi/ipmb_dev_int.c:147:6: note: Calling 'copy_from_user'
           if (copy_from_user(&msg, buf, count))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:13: note: Calling 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/thread_info.h:207:15: note: Assuming 'sz' is >=3D 0
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:207:15: note: Left side of '&&' is true
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/thread_info.h:207:26: note: Assuming 'sz' is < 'bytes', wh=
ich participates in a condition later
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                                   ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:207:2: note: Taking true branch
           if (unlikely(sz >=3D 0 && sz < bytes)) {
           ^
   include/linux/thread_info.h:208:3: note: Taking true branch
                   if (!__builtin_constant_p(bytes))
                   ^
   include/linux/uaccess.h:191:13: note: Returning from 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning value (loaded from 'n'), =
which participates in a condition later
           return n;
           ^~~~~~~~
   drivers/char/ipmi/ipmb_dev_int.c:147:6: note: Returning from 'copy_from_=
user'
           if (copy_from_user(&msg, buf, count))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmb_dev_int.c:147:6: note: Assuming the condition is =
false
           if (copy_from_user(&msg, buf, count))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmb_dev_int.c:147:2: note: Taking false branch
           if (copy_from_user(&msg, buf, count))
           ^
   drivers/char/ipmi/ipmb_dev_int.c:150:12: note: The right operand of '<' =
is a garbage value
           if (count < msg[0])
                     ^ ~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/pci/setup-bus.c:87:2: warning: Use of memory after it is freed [=
clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(dev_res, tmp, head, list) {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/pci/setup-bus.c:1907:6: note: Assuming field 'parent' is non-null
           if (!io_res->parent && align)
               ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1907:22: note: Left side of '&&' is false
           if (!io_res->parent && align)
--
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/input/touchscreen/pixcir_i2c_ts.c:152:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D &ts->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/pixcir_i2c_ts.c:152:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D &ts->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/video/fbdev/neofb.c:698:3: warning: Value stored to 'memlen' is =
never read [clang-analyzer-deadcode.DeadStores]
                   memlen =3D var->xres_virtual * var->bits_per_pixel *
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/neofb.c:698:3: note: Value stored to 'memlen' is nev=
er read
                   memlen =3D var->xres_virtual * var->bits_per_pixel *
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/video/fbdev/vermilion/cr_pll.c:122:2: warning: Value stored to '=
clock_val' is never read [clang-analyzer-deadcode.DeadStores]
           clock_val =3D ioread32(clock_reg) & ~CRVML_CLOCK_MASK;
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vermilion/cr_pll.c:122:2: note: Value stored to 'clo=
ck_val' is never read
           clock_val =3D ioread32(clock_reg) & ~CRVML_CLOCK_MASK;
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/video/fbdev/s3fb.c:1254:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(info->fix.id, s3_names [par->chip]);
           ^~~~~~
   drivers/video/fbdev/s3fb.c:1254:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(info->fix.id, s3_names [par->chip]);
           ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/video/fbdev/hgafb.c:301:21: warning: Value stored to 'q_save' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p_save =3D readw(p); q_save =3D readw(q);
                              ^
   drivers/video/fbdev/hgafb.c:301:21: note: Value stored to 'q_save' is ne=
ver read
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/dma-buf/dma-heap.c:101:6: warning: Branch condition evaluates to=
 a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (heap_allocation->fd)
               ^
   drivers/dma-buf/dma-heap.c:135:6: note: Assuming the condition is false
           if (nr >=3D ARRAY_SIZE(dma_heap_ioctl_cmds))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:135:2: note: Taking false branch
           if (nr >=3D ARRAY_SIZE(dma_heap_ioctl_cmds))
           ^
   drivers/dma-buf/dma-heap.c:145:6: note: Assuming the condition is false
           if ((ucmd & kcmd & IOC_IN) =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:145:2: note: Taking false branch
           if ((ucmd & kcmd & IOC_IN) =3D=3D 0)
           ^
   drivers/dma-buf/dma-heap.c:147:6: note: Assuming the condition is false
           if ((ucmd & kcmd & IOC_OUT) =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:147:2: note: Taking false branch
           if ((ucmd & kcmd & IOC_OUT) =3D=3D 0)
           ^
   drivers/dma-buf/dma-heap.c:149:14: note: '__UNIQUE_ID___x582' is <=3D '_=
_UNIQUE_ID___y583'
           ksize =3D max(max(in_size, out_size), drv_size);
                       ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:52:33: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/dma-buf/dma-heap.c:149:14: note: '?' condition is false
           ksize =3D max(max(in_size, out_size), drv_size);
                       ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/dma-buf/dma-heap.c:149:10: note: Assuming '__UNIQUE_ID___x584' i=
s > '__UNIQUE_ID___y585'
           ksize =3D max(max(in_size, out_size), drv_size);
                   ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/dma-buf/dma-heap.c:149:10: note: '?' condition is true
           ksize =3D max(max(in_size, out_size), drv_size);
                   ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/dma-buf/dma-heap.c:152:6: note: Assuming the condition is false
           if (ksize > sizeof(stack_kdata)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:152:2: note: Taking false branch
           if (ksize > sizeof(stack_kdata)) {
           ^
   drivers/dma-buf/dma-heap.c:158:6: note: Calling 'copy_from_user'
           if (copy_from_user(kdata, (void __user *)arg, in_size) !=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   drivers/dma-buf/dma-heap.c:158:6: note: Returning from 'copy_from_user'
--
           ^
   net/core/flow_dissector.c:1026:32: note: Passing null pointer value via =
1st parameter 'skb'
                   struct ethhdr *eth =3D eth_hdr(skb);
                                                ^~~
   net/core/flow_dissector.c:1026:24: note: Calling 'eth_hdr'
                   struct ethhdr *eth =3D eth_hdr(skb);
                                        ^~~~~~~~~~~~
   include/linux/if_ether.h:24:41: note: Passing null pointer value via 1st=
 parameter 'skb'
           return (struct ethhdr *)skb_mac_header(skb);
                                                  ^~~
   include/linux/if_ether.h:24:26: note: Calling 'skb_mac_header'
           return (struct ethhdr *)skb_mac_header(skb);
                                   ^~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2559:9: note: Access to field 'head' results in a=
 dereference of a null pointer (loaded from variable 'skb')
           return skb->head + skb->mac_header;
                  ^~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   net/sunrpc/auth_gss/gss_mech_switch.c:55:3: warning: Call to function 's=
trcpy' is insecure as it does not provide bounding of the memory buffer. Re=
place unbounded copy functions with analogous functions that support length=
 arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.=
strcpy]
                   strcpy(new, prefix);
                   ^~~~~~
   net/sunrpc/auth_gss/gss_mech_switch.c:55:3: note: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119
                   strcpy(new, prefix);
                   ^~~~~~
   net/sunrpc/auth_gss/gss_mech_switch.c:56:3: warning: Call to function 's=
trcat' is insecure as it does not provide bounding of the memory buffer. Re=
place unbounded copy functions with analogous functions that support length=
 arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.=
strcpy]
                   strcat(new, name);
                   ^~~~~~
   net/sunrpc/auth_gss/gss_mech_switch.c:56:3: note: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119
                   strcat(new, name);
                   ^~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   net/sunrpc/auth_gss/svcauth_gss.c:1316:3: warning: Value stored to 'stat=
us' is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D -EINVAL;
                   ^        ~~~~~~~
   net/sunrpc/auth_gss/svcauth_gss.c:1316:3: note: Value stored to 'status'=
 is never read
                   status =3D -EINVAL;
                   ^        ~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   net/sunrpc/auth_gss/gss_rpc_xdr.c:303:2: warning: Value stored to 'p' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p =3D xdr_decode_hyper(p, &status->major_status);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:303:2: note: Value stored to 'p' is ne=
ver read
           p =3D xdr_decode_hyper(p, &status->major_status);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:314:2: warning: Value stored to 'p' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p =3D xdr_decode_hyper(p, &status->minor_status);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:314:2: note: Value stored to 'p' is ne=
ver read
           p =3D xdr_decode_hyper(p, &status->minor_status);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:365:2: warning: Value stored to 'err' =
is never read [clang-analyzer-deadcode.DeadStores]
           err =3D gssx_enc_option(xdr, &opt);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:365:2: note: Value stored to 'err' is =
never read
           err =3D gssx_enc_option(xdr, &opt);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:607:2: warning: Value stored to 'p' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p =3D xdr_encode_hyper(p, ctx->ctx_flags);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:607:2: note: Value stored to 'p' is ne=
ver read
           p =3D xdr_encode_hyper(p, ctx->ctx_flags);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:670:2: warning: Value stored to 'p' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p =3D xdr_decode_hyper(p, &ctx->ctx_flags);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:670:2: note: Value stored to 'p' is ne=
ver read
           p =3D xdr_decode_hyper(p, &ctx->ctx_flags);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:698:2: warning: Value stored to 'p' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p =3D xdr_encode_hyper(p, cb->initiator_addrtype);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:698:2: note: Value stored to 'p' is ne=
ver read
           p =3D xdr_encode_hyper(p, cb->initiator_addrtype);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:709:2: warning: Value stored to 'p' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p =3D xdr_encode_hyper(p, cb->acceptor_addrtype);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:709:2: note: Value stored to 'p' is ne=
ver read
           p =3D xdr_encode_hyper(p, cb->acceptor_addrtype);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   net/rxrpc/af_rxrpc.c:603:2: warning: Value stored to 'ret' is never read=
 [clang-analyzer-deadcode.DeadStores]
           ret =3D -EOPNOTSUPP;
           ^     ~~~~~~~~~~~
   net/rxrpc/af_rxrpc.c:603:2: note: Value stored to 'ret' is never read
           ret =3D -EOPNOTSUPP;
           ^     ~~~~~~~~~~~
>> net/rxrpc/af_rxrpc.c:649:22: warning: The left operand of '>' is a garba=
ge value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           if (min_sec_level > RXRPC_SECURITY_MAX)
                               ~~~~~~~~~~~~~ ^
   net/rxrpc/af_rxrpc.c:595:26: note: Left side of '&&' is false
           struct rxrpc_sock *rx =3D rxrpc_sk(sock->sk);
                                   ^
   net/rxrpc/ar-internal.h:162:24: note: expanded from macro 'rxrpc_sk'
   #define rxrpc_sk(__sk) container_of((__sk), struct rxrpc_sock, sk)
                          ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/rxrpc/af_rxrpc.c:595:26: note: Taking false branch
           struct rxrpc_sock *rx =3D rxrpc_sk(sock->sk);
                                   ^
   net/rxrpc/ar-internal.h:162:24: note: expanded from macro 'rxrpc_sk'
   #define rxrpc_sk(__sk) container_of((__sk), struct rxrpc_sock, sk)
                          ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:324:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:312:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/rxrpc/af_rxrpc.c:595:26: note: Loop condition is false.  Exiting loop
           struct rxrpc_sock *rx =3D rxrpc_sk(sock->sk);
                                   ^
   net/rxrpc/ar-internal.h:162:24: note: expanded from macro 'rxrpc_sk'
   #define rxrpc_sk(__sk) container_of((__sk), struct rxrpc_sock, sk)
                          ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:324:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:312:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/rxrpc/af_rxrpc.c:596:2: note: 'min_sec_level' declared without an in=
itial value
           unsigned int min_sec_level;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/af_rxrpc.c:600:2: note: Assuming the condition is true
           _enter(",%d,%d,,%d", level, optname, optlen);
           ^
   net/rxrpc/ar-internal.h:1165:6: note: expanded from macro '_enter'
           if (unlikely(rxrpc_debug & RXRPC_DEBUG_KENTER)) \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/rxrpc/af_rxrpc.c:600:2: note: Taking false branch
           _enter(",%d,%d,,%d", level, optname, optlen);
           ^
   net/rxrpc/ar-internal.h:1165:2: note: expanded from macro '_enter'
           if (unlikely(rxrpc_debug & RXRPC_DEBUG_KENTER)) \
           ^
   net/rxrpc/af_rxrpc.c:600:2: note: Loop condition is false.  Exiting loop
           _enter(",%d,%d,,%d", level, optname, optlen);
           ^
   net/rxrpc/ar-internal.h:1163:29: note: expanded from macro '_enter'
   #define _enter(FMT,...)                                 \
                                                           ^
   net/rxrpc/af_rxrpc.c:605:6: note: Assuming 'level' is equal to SOL_RXRPC
           if (level =3D=3D SOL_RXRPC) {
               ^~~~~~~~~~~~~~~~~~
   net/rxrpc/af_rxrpc.c:605:2: note: Taking true branch
           if (level =3D=3D SOL_RXRPC) {
           ^
   net/rxrpc/af_rxrpc.c:606:3: note: Control jumps to 'case 4:'  at line 637
                   switch (optname) {
                   ^
   net/rxrpc/af_rxrpc.c:639:8: note: Assuming the condition is false
                           if (optlen !=3D sizeof(unsigned int))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/af_rxrpc.c:639:4: note: Taking false branch
                           if (optlen !=3D sizeof(unsigned int))
                           ^
   net/rxrpc/af_rxrpc.c:642:8: note: Assuming field 'skc_state' is equal to=
 RXRPC_UNBOUND
                           if (rx->sk.sk_state !=3D RXRPC_UNBOUND)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/af_rxrpc.c:642:4: note: Taking false branch
                           if (rx->sk.sk_state !=3D RXRPC_UNBOUND)
                           ^
   net/rxrpc/af_rxrpc.c:644:10: note: Calling 'copy_from_sockptr'
                           ret =3D copy_from_sockptr(&min_sec_level, optval,

vim +313 arch/x86/kernel/cpu/mce/dev-mcelog.c

5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017=
-03-27  293  =

5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017=
-03-27  294  static ssize_t mce_chrdev_write(struct file *filp, const char =
__user *ubuf,
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017=
-03-27  295  				size_t usize, loff_t *off)
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017=
-03-27  296  {
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  297  	struct mce m;
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  298  =

fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  299  	if (!capable(CAP_SYS_ADMIN))
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  300  		return -EPERM;
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  301  	/*
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  302  	 * There are some cases where real MSR reads could slip
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  303  	 * through.
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  304  	 */
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  305  	if (!boot_cpu_has(X86_FEATURE_MCE) || !boot_cpu_has(X86_FEATU=
RE_MCA))
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  306  		return -EIO;
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  307  =

fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  308  	if ((unsigned long)usize > sizeof(struct mce))
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  309  		usize =3D sizeof(struct mce);
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  310  	if (copy_from_user(&m, ubuf, usize))
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  311  		return -EFAULT;
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  312  =

fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13 @313  	if (m.extcpu >=3D num_possible_cpus() || !cpu_online(m.extcpu=
))
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017=
-03-27  314  		return -EINVAL;
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  315  =

fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  316  	/*
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  317  	 * Need to give user space some time to set everything up,
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  318  	 * so do it a jiffie or two later everywhere.
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  319  	 */
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  320  	schedule_timeout(2);
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  321  =

fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  322  	blocking_notifier_call_chain(&mce_injector_chain, 0, &m);
fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  323  =

fbe9ff9eafb66b arch/x86/kernel/cpu/mcheck/dev-mcelog.c Borislav Petkov 2017=
-06-13  324  	return usize;
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017=
-03-27  325  }
5de97c9f6d85fd arch/x86/kernel/cpu/mcheck/dev-mcelog.c Tony Luck       2017=
-03-27  326  =


:::::: The code at line 313 was first introduced by commit
:::::: fbe9ff9eafb66b78b79c135ebc24fd2ca5498217 x86/mce: Get rid of registe=
r_mce_write_callback()

:::::: TO: Borislav Petkov <bp@suse.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8166392663300407727==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8166392663300407727==--

