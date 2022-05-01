Content-Type: multipart/mixed; boundary="===============4178132880951639919=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/test/iio-test-rescale.c:578:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-...
Date: Sun, 01 May 2022 18:13:48 +0800
Message-ID: <202205011807.KH8fN4zM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4178132880951639919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Liam Beguin <liambeguin@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Peter Rosin <peda@axentia.se>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   57ae8a492116910bad2b3497ffe555b3a4b4180f
commit: 8e74a48d17d509bf605e64252f38550b1a9cc376 iio: test: add basic tests=
 for the iio-rescale driver
date:   9 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-c002-20220501 (https://download.01.org/0day-ci/archi=
ve/20220501/202205011807.KH8fN4zM-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775=
649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8e74a48d17d509bf605e64252f38550b1a9cc376
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8e74a48d17d509bf605e64252f38550b1a9cc376
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           BUILD_BUG_ON(((n) & ((n) - 1)) !=3D 0)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/iio/proximity/sx9324.c:524:11: note: Loop condition is false.  E=
xiting loop
           regval =3D FIELD_GET(SX9324_REG_PROX_CTRL5_HYST_MASK, regval);
                    ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:71:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
                   ^
   include/linux/build_bug.h:21:2: note: expanded from macro '__BUILD_BUG_O=
N_NOT_POWER_OF_2'
           BUILD_BUG_ON(((n) & ((n) - 1)) !=3D 0)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/iio/proximity/sx9324.c:525:6: note: Assuming 'regval' is not equ=
al to 0
           if (!regval)
               ^~~~~~~
   drivers/iio/proximity/sx9324.c:525:2: note: Taking false branch
           if (!regval)
           ^
   drivers/iio/proximity/sx9324.c:528:18: note: The left operand of '>>' is=
 a garbage value
                   *val =3D pthresh >> (5 - regval);
                          ~~~~~~~ ^
   drivers/iio/proximity/sx9324.c:632:26: warning: The left operand of '>>'=
 is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           else if (val >=3D pthresh >> 2)
                                   ^
   drivers/iio/proximity/sx9324.c:700:6: note: Assuming field 'type' is equ=
al to IIO_PROXIMITY
           if (chan->type !=3D IIO_PROXIMITY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9324.c:700:2: note: Taking false branch
           if (chan->type !=3D IIO_PROXIMITY)
           ^
   drivers/iio/proximity/sx9324.c:703:2: note: Control jumps to 'case IIO_E=
V_INFO_HYSTERESIS:'  at line 715
           switch (info) {
           ^
   drivers/iio/proximity/sx9324.c:716:10: note: Calling 'sx9324_write_hyste=
resis'
                   return sx9324_write_hysteresis(data, chan, val);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9324.c:624:11: note: 'pthresh' declared without =
an initial value
           int ret, pthresh;
                    ^~~~~~~
   drivers/iio/proximity/sx9324.c:626:8: note: Calling 'sx9324_read_thresh'
           ret =3D sx9324_read_thresh(data, chan, &pthresh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9324.c:499:6: note: Assuming 'ret' is not equal =
to 0
           if (ret)
               ^~~
   drivers/iio/proximity/sx9324.c:499:2: note: Taking true branch
           if (ret)
           ^
   drivers/iio/proximity/sx9324.c:500:3: note: Returning without writing to=
 '*val'
                   return ret;
                   ^
   drivers/iio/proximity/sx9324.c:626:8: note: Returning from 'sx9324_read_=
thresh'
           ret =3D sx9324_read_thresh(data, chan, &pthresh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9324.c:627:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/proximity/sx9324.c:627:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/proximity/sx9324.c:630:6: note: Assuming 'val' is not equal =
to 0
           if (val =3D=3D 0)
               ^~~~~~~~
   drivers/iio/proximity/sx9324.c:630:2: note: Taking false branch
           if (val =3D=3D 0)
           ^
   drivers/iio/proximity/sx9324.c:632:26: note: The left operand of '>>' is=
 a garbage value
           else if (val >=3D pthresh >> 2)
                           ~~~~~~~ ^
   drivers/iio/proximity/sx9324.c:868:3: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D device_property_read_u32_array(dev, prop, pin_de=
fs,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9324.c:868:3: note: Value stored to 'ret' is nev=
er read
                   ret =3D device_property_read_u32_array(dev, prop, pin_de=
fs,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/iio/test/iio-test-rescale.c:578:2: warning: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
           strcpy(desc, t->name);
           ^~~~~~
   drivers/iio/test/iio-test-rescale.c:578:2: note: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119
           strcpy(desc, t->name);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/perf/arm-cmn.c:1823:29: warning: Division by zero [clang-analyze=
r-core.DivideZero]
           cmn->mesh_y =3D cmn->num_xps / cmn->mesh_x;
                         ~~~~~~~~~~~~~^~~~~~~~~~~~~
   drivers/perf/arm-cmn.c:1657:2: note: Calling 'arm_cmn_init_node_info'
           arm_cmn_init_node_info(cmn, rgn_offset, &cfg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm-cmn.c:1628:15: note: Taking false branch
           node->type =3D FIELD_GET(CMN_NI_NODE_TYPE, reg);
                        ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:62:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
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
   drivers/perf/arm-cmn.c:1628:15: note: Loop condition is false.  Exiting =
loop
           node->type =3D FIELD_GET(CMN_NI_NODE_TYPE, reg);
                        ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:62:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
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
   drivers/perf/arm-cmn.c:1628:15: note: Taking false branch
           node->type =3D FIELD_GET(CMN_NI_NODE_TYPE, reg);
                        ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:64:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
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
   drivers/perf/arm-cmn.c:1628:15: note: Loop condition is false.  Exiting =
loop
           node->type =3D FIELD_GET(CMN_NI_NODE_TYPE, reg);
                        ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:64:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)

vim +578 drivers/iio/test/iio-test-rescale.c

8e74a48d17d509 Liam Beguin 2022-02-12  575  =

8e74a48d17d509 Liam Beguin 2022-02-12  576  static void case_to_desc(const =
struct rescale_tc_data *t, char *desc)
8e74a48d17d509 Liam Beguin 2022-02-12  577  {
8e74a48d17d509 Liam Beguin 2022-02-12 @578  	strcpy(desc, t->name);
8e74a48d17d509 Liam Beguin 2022-02-12  579  }
8e74a48d17d509 Liam Beguin 2022-02-12  580  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4178132880951639919==--

