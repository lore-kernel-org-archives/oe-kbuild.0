Content-Type: multipart/mixed; boundary="===============1864150877132497917=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/atomic/atomic-long.h:523:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Mon, 29 Nov 2021 20:24:07 +0800
Message-ID: <202111292030.sGLZwsI2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1864150877132497917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d58071a8a76d779eedab38033ae4c821c30295a5
commit: 67d1b0de258ad066e1fc85d0ceaa75e107fb45bb locking/atomic: add arch_a=
tomic_long*()
date:   5 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20211128 (https://download.01.org/0day-ci/archi=
ve/20211129/202111292030.sGLZwsI2-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D67d1b0de258ad066e1fc85d0ceaa75e107fb45bb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 67d1b0de258ad066e1fc85d0ceaa75e107fb45bb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           switch (match_string(modes, ARRAY_SIZE(modes), mode)) {
           ^
   drivers/usb/typec/tipd/core.c:481:3: note: Returning zero, which partici=
pates in a condition later
                   return 0;
                   ^~~~~~~~
   drivers/usb/typec/tipd/core.c:615:8: note: Returning from 'tps6598x_chec=
k_mode'
           ret =3D tps6598x_check_mode(tps);
                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:616:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/usb/typec/tipd/core.c:616:2: note: Taking false branch
           if (ret)
           ^
   drivers/usb/typec/tipd/core.c:620:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/usb/typec/tipd/core.c:620:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/usb/typec/tipd/core.c:624:8: note: Calling 'tps6598x_read32'
           ret =3D tps6598x_read32(tps, TPS_REG_SYSTEM_CONF, &conf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:158:9: note: Calling 'tps6598x_block_read'
           return tps6598x_block_read(tps, reg, val, sizeof(u32));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:120:6: note: Taking false branch
           if (WARN_ON(len + 1 > sizeof(data)))
               ^
   include/asm-generic/bug.h:120:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/usb/typec/tipd/core.c:120:2: note: Taking false branch
           if (WARN_ON(len + 1 > sizeof(data)))
           ^
   drivers/usb/typec/tipd/core.c:123:12: note: Field 'i2c_protocol' is 1
           if (!tps->i2c_protocol)
                     ^
   drivers/usb/typec/tipd/core.c:123:2: note: Taking false branch
           if (!tps->i2c_protocol)
           ^
   drivers/usb/typec/tipd/core.c:127:6: note: Assuming 'ret' is not equal t=
o 0
           if (ret)
               ^~~
   drivers/usb/typec/tipd/core.c:127:2: note: Taking true branch
           if (ret)
           ^
   drivers/usb/typec/tipd/core.c:128:3: note: Returning without writing to =
'*val'
                   return ret;
                   ^
   drivers/usb/typec/tipd/core.c:158:9: note: Returning from 'tps6598x_bloc=
k_read'
           return tps6598x_block_read(tps, reg, val, sizeof(u32));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:158:2: note: Returning without writing to =
'*val'
           return tps6598x_block_read(tps, reg, val, sizeof(u32));
           ^
   drivers/usb/typec/tipd/core.c:624:8: note: Returning from 'tps6598x_read=
32'
           ret =3D tps6598x_read32(tps, TPS_REG_SYSTEM_CONF, &conf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:625:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/usb/typec/tipd/core.c:625:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/usb/typec/tipd/core.c:629:6: note: Assuming 'fwnode' is non-null
           if (!fwnode)
               ^~~~~~~
   drivers/usb/typec/tipd/core.c:629:2: note: Taking false branch
           if (!fwnode)
           ^
   drivers/usb/typec/tipd/core.c:633:6: note: Calling 'IS_ERR'
           if (IS_ERR(tps->role_sw)) {
               ^~~~~~~~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:633:6: note: Returning from 'IS_ERR'
           if (IS_ERR(tps->role_sw)) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/core.c:633:2: note: Taking false branch
           if (IS_ERR(tps->role_sw)) {
           ^
   drivers/usb/typec/tipd/core.c:645:10: note: The left operand of '&' is a=
 garbage value
           switch (TPS_SYSCONF_PORTINFO(conf)) {
                   ^
   drivers/usb/typec/tipd/core.c:40:39: note: expanded from macro 'TPS_SYSC=
ONF_PORTINFO'
   #define TPS_SYSCONF_PORTINFO(c)         ((c) & 7)
                                             ~  ^
   Suppressed 2 warnings (2 with check filters).
   3 warnings generated.
>> include/linux/atomic/atomic-long.h:523:9: warning: Dereference of null p=
ointer [clang-analyzer-core.NullDereference]
           return arch_atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:29: note: expanded from macro 'arch_ato=
mic_read'
   #define arch_atomic_read(v)     READ_ONCE((v)->counter)
                                   ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   mm/memcontrol.c:6182:26: note: Passing null pointer value via 2nd parame=
ter 'events'
           __memory_events_show(m, memcg->memory_events_local);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6182:2: note: Calling '__memory_events_show'
           __memory_events_show(m, memcg->memory_events_local);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6162:46: note: Passing null pointer value via 1st parame=
ter 'v'
           seq_printf(m, "low %lu\n", atomic_long_read(&events[MEMCG_LOW]));
                                                       ^~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6162:29: note: Calling 'atomic_long_read'
           seq_printf(m, "low %lu\n", atomic_long_read(&events[MEMCG_LOW]));
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1184:31: note: Passing null p=
ointer value via 1st parameter 'v'
           return arch_atomic_long_read(v);
                                        ^
   include/linux/atomic/atomic-instrumented.h:1184:9: note: Calling 'arch_a=
tomic_long_read'
           return arch_atomic_long_read(v);
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-long.h:523:9: note: Left side of '||' is fal=
se
           return arch_atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:29: note: expanded from macro 'arch_ato=
mic_read'
   #define arch_atomic_read(v)     READ_ONCE((v)->counter)
                                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/atomic/atomic-long.h:523:9: note: Left side of '||' is fal=
se
           return arch_atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:29: note: expanded from macro 'arch_ato=
mic_read'
   #define arch_atomic_read(v)     READ_ONCE((v)->counter)
                                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/atomic/atomic-long.h:523:9: note: Left side of '||' is true
           return arch_atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:29: note: expanded from macro 'arch_ato=
mic_read'
   #define arch_atomic_read(v)     READ_ONCE((v)->counter)
                                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:291:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   include/linux/atomic/atomic-long.h:523:9: note: Taking false branch
           return arch_atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:29: note: expanded from macro 'arch_ato=
mic_read'
   #define arch_atomic_read(v)     READ_ONCE((v)->counter)
                                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/atomic/atomic-long.h:523:9: note: Loop condition is false.=
  Exiting loop
           return arch_atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:29: note: expanded from macro 'arch_ato=
mic_read'
   #define arch_atomic_read(v)     READ_ONCE((v)->counter)

vim +523 include/linux/atomic/atomic-long.h

b5d47ef9ea5c5f include/asm-generic/atomic-long.h  Mark Rutland 2018-09-04  =
519  =

c020395b6634b7 include/asm-generic/atomic-long.h  Marco Elver  2019-11-26  =
520  static __always_inline long
67d1b0de258ad0 include/linux/atomic/atomic-long.h Mark Rutland 2021-07-13  =
521  arch_atomic_long_read(const atomic_long_t *v)
b5d47ef9ea5c5f include/asm-generic/atomic-long.h  Mark Rutland 2018-09-04  =
522  {
67d1b0de258ad0 include/linux/atomic/atomic-long.h Mark Rutland 2021-07-13 @=
523  	return arch_atomic_read(v);
b5d47ef9ea5c5f include/asm-generic/atomic-long.h  Mark Rutland 2018-09-04  =
524  }
b5d47ef9ea5c5f include/asm-generic/atomic-long.h  Mark Rutland 2018-09-04  =
525  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1864150877132497917==--

