Content-Type: multipart/mixed; boundary="===============5575570635660120412=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/atomic/atomic-long.h:523:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sun, 29 May 2022 09:32:22 +0800
Message-ID: <202205290940.vckqDc8o-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5575570635660120412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
commit: 67d1b0de258ad066e1fc85d0ceaa75e107fb45bb locking/atomic: add arch_a=
tomic_long*()
date:   11 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220529 (https://download.01.org/0day-ci/archi=
ve/20220529/202205290940.vckqDc8o-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f=
3f486e01448121f7931a4ca29fac1504ab)
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
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                           ^~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stb0899_algo.c:392:3: note: Taking true bran=
ch
                   if ((internal->status !=3D CARRIEROK) || (stb0899_check_=
data(state) !=3D DATAOK)) {
                   ^
   drivers/media/dvb-frontends/stb0899_algo.c:395:8: note: Assuming '__x' i=
s >=3D 0
                           if (abs(derot_freq) > derot_limit)
                               ^
   include/linux/math.h:134:3: note: expanded from macro 'abs'
                   __abs_choose_expr(x, short,                             \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:144:28: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                     ^~~~~~~
   include/linux/math.h:144:54: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                                               ^~~~~
   include/linux/math.h:144:54: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                                               ^~~~~
   include/linux/math.h:144:54: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                                               ^~~~~
   drivers/media/dvb-frontends/stb0899_algo.c:395:8: note: '?' condition is=
 false
                           if (abs(derot_freq) > derot_limit)
                               ^
   include/linux/math.h:134:3: note: expanded from macro 'abs'
                   __abs_choose_expr(x, short,                             \
                   ^
   include/linux/math.h:144:28: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                     ^
   drivers/media/dvb-frontends/stb0899_algo.c:395:8: note: Assuming the con=
dition is false
                           if (abs(derot_freq) > derot_limit)
                               ^
   include/linux/math.h:131:16: note: expanded from macro 'abs'
   #define abs(x)  __abs_choose_expr(x, long long,                         \
                   ^
   include/linux/math.h:141:43: note: expanded from macro '__abs_choose_exp=
r'
   #define __abs_choose_expr(x, type, other) __builtin_choose_expr(        \
                                             ^
   drivers/media/dvb-frontends/stb0899_algo.c:395:4: note: Taking false bra=
nch
                           if (abs(derot_freq) > derot_limit)
                           ^
   drivers/media/dvb-frontends/stb0899_algo.c:398:8: note: 'next_loop' is 3
                           if (next_loop) {
                               ^~~~~~~~~
   drivers/media/dvb-frontends/stb0899_algo.c:398:4: note: Taking true bran=
ch
                           if (next_loop) {
                           ^
   drivers/media/dvb-frontends/stb0899_algo.c:399:5: note: Taking true bran=
ch
                                   dprintk(state->verbose, FE_DEBUG, 1, "De=
rot freq=3D%d, mclk=3D%d", derot_freq, internal->mclk);
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:23:2: note: expanded from mac=
ro 'dprintk'
           if (z) {                                                        =
                \
           ^
   drivers/media/dvb-frontends/stb0899_algo.c:399:5: note: Assuming the con=
dition is true
                                   dprintk(state->verbose, FE_DEBUG, 1, "De=
rot freq=3D%d, mclk=3D%d", derot_freq, internal->mclk);
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:24:8: note: expanded from mac=
ro 'dprintk'
                   if      ((*x > FE_ERROR) && (*x > y))                   =
                \
                             ^~~~~~~~~~~~~
   drivers/media/dvb-frontends/stb0899_algo.c:399:5: note: Left side of '&&=
' is true
                                   dprintk(state->verbose, FE_DEBUG, 1, "De=
rot freq=3D%d, mclk=3D%d", derot_freq, internal->mclk);
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:24:7: note: expanded from mac=
ro 'dprintk'
                   if      ((*x > FE_ERROR) && (*x > y))                   =
                \
                            ^
   drivers/media/dvb-frontends/stb0899_algo.c:399:5: note: Assuming the con=
dition is true
                                   dprintk(state->verbose, FE_DEBUG, 1, "De=
rot freq=3D%d, mclk=3D%d", derot_freq, internal->mclk);
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:24:27: note: expanded from ma=
cro 'dprintk'
                   if      ((*x > FE_ERROR) && (*x > y))                   =
                \
                                                ^~~~~~
   drivers/media/dvb-frontends/stb0899_algo.c:399:5: note: Taking true bran=
ch
                                   dprintk(state->verbose, FE_DEBUG, 1, "De=
rot freq=3D%d, mclk=3D%d", derot_freq, internal->mclk);
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:24:3: note: expanded from mac=
ro 'dprintk'
                   if      ((*x > FE_ERROR) && (*x > y))                   =
                \
                   ^
   drivers/media/dvb-frontends/stb0899_algo.c:399:5: note: Loop condition i=
s false.  Exiting loop
                                   dprintk(state->verbose, FE_DEBUG, 1, "De=
rot freq=3D%d, mclk=3D%d", derot_freq, internal->mclk);
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:22:42: note: expanded from ma=
cro 'dprintk'
   #define dprintk(x, y, z, format, arg...) do {                           =
                \
                                            ^
   drivers/media/dvb-frontends/stb0899_algo.c:404:5: note: The left operand=
 of '&' is a garbage value
                                   STB0899_SETFIELD_VAL(CFRM, cfr[0], MSB(i=
nternal->inversion * derot_freq));
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:61:61: note: expanded from ma=
cro 'STB0899_SETFIELD_VAL'
   #define STB0899_SETFIELD_VAL(bitf, mask, val)   (mask =3D (mask & (~(((1=
 << STB0899_WIDTH_##bitf) - 1) <<\
                                                            ~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
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


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5575570635660120412==--

