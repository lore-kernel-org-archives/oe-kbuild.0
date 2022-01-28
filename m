Content-Type: multipart/mixed; boundary="===============7111179836492976062=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/dac/ad7293.c:139:8: warning: Excessive padding in 'struct ad7293_state' (124 padding bytes, where 60 is optimal).
Date: Sat, 29 Jan 2022 05:03:12 +0800
Message-ID: <202201290105.WWe8twft-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7111179836492976062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Cai Huoqing <cai.huoqing@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   145d9b498fc827b79c1260b4caa29a8e59d4c2b9
commit: 0bb12606c05fe9737e3056fe76d6e4b9c2a87b57 iio:dac:ad7293: add suppor=
t for AD7293
date:   8 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20220121 (https://download.01.org/0day-ci/arc=
hive/20220129/202201290105.WWe8twft-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3=
b1322b84816aa623d8e8cb45a49cb68b84)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D0bb12606c05fe9737e3056fe76d6e4b9c2a87b57
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0bb12606c05fe9737e3056fe76d6e4b9c2a87b57
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/mxs-lradc-adc.c:205:6: note: Assuming 'ret' is equal to =
IIO_VAL_INT
           if (ret !=3D IIO_VAL_INT)
               ^~~~~~~~~~~~~~~~~~
   drivers/iio/adc/mxs-lradc-adc.c:205:2: note: Taking false branch
           if (ret !=3D IIO_VAL_INT)
           ^
   drivers/iio/adc/mxs-lradc-adc.c:209:6: note: 'ret' is equal to IIO_VAL_I=
NT
           if (ret !=3D IIO_VAL_INT)
               ^~~
   drivers/iio/adc/mxs-lradc-adc.c:209:2: note: Taking false branch
           if (ret !=3D IIO_VAL_INT)
           ^
   drivers/iio/adc/mxs-lradc-adc.c:212:13: note: The right operand of '-' i=
s a garbage value
           *val =3D max - min;
                      ^ ~~~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/base/platform.c:577:3: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pa->name, name);
                   ^~~~~~
   drivers/base/platform.c:577:3: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
                   strcpy(pa->name, name);
                   ^~~~~~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/iio/dac/ad5755.c:88:8: warning: Excessive padding in 'struct ad5=
755_state' (84 padding bytes, where 20 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   chip_info, =

   lock, =

   channels, =

   pwr_down, =

   ctrl, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5755_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5755.c:88:8: note: Excessive padding in 'struct ad5755=
_state' (84 padding bytes, where 20 is optimal). Optimal fields order: data=
, spi, chip_info, lock, channels, pwr_down, ctrl, consider reordering the f=
ields or adding explicit padding members
   struct ad5755_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5755.c:729:37: warning: Value stored to 'pdata' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct ad5755_platform_data *pdata =3D dev_get_platdata(&s=
pi->dev);
                                              ^~~~~   ~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/iio/dac/ad5755.c:729:37: note: Value stored to 'pdata' during it=
s initialization is never read
           const struct ad5755_platform_data *pdata =3D dev_get_platdata(&s=
pi->dev);
                                              ^~~~~   ~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 16 warnings (8 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> drivers/iio/dac/ad7293.c:139:8: warning: Excessive padding in 'struct ad=
7293_state' (124 padding bytes, where 60 is optimal). =

   Optimal fields order: =

   data, =

   page_select, =

   spi, =

   gpio_reset, =

   reg_avdd, =

   reg_vdrive, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7293_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad7293.c:139:8: note: Excessive padding in 'struct ad729=
3_state' (124 padding bytes, where 60 is optimal). Optimal fields order: da=
ta, page_select, spi, gpio_reset, reg_avdd, reg_vdrive, lock, consider reor=
dering the fields or adding explicit padding members
   struct ad7293_state {
   ~~~~~~~^~~~~~~~~~~~~~
>> drivers/iio/dac/ad7293.c:647:13: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
                   *read_val =3D temp;
                             ^ ~~~~
   drivers/iio/dac/ad7293.c:644:6: note: Assuming 'read_val' is non-null
           if (read_val) {
               ^~~~~~~~
   drivers/iio/dac/ad7293.c:644:2: note: Taking true branch
           if (read_val) {
           ^
   drivers/iio/dac/ad7293.c:645:3: note: 'temp' declared without an initial=
 value
                   u16 temp;
                   ^~~~~~~~
   drivers/iio/dac/ad7293.c:646:9: note: Calling 'ad7293_spi_read'
                   ret =3D ad7293_spi_read(st, reg, &temp);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad7293.c:207:8: note: Calling '__ad7293_spi_read'
           ret =3D __ad7293_spi_read(st, reg, val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad7293.c:175:11: note: Taking false branch
           length =3D FIELD_GET(AD7293_TRANSF_LEN_MSK, reg);
                    ^
   include/linux/bitfield.h:108:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:46:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/iio/dac/ad7293.c:175:11: note: Loop condition is false.  Exiting=
 loop
           length =3D FIELD_GET(AD7293_TRANSF_LEN_MSK, reg);
                    ^
   include/linux/bitfield.h:108:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:46:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/iio/dac/ad7293.c:175:11: note: Taking false branch
           length =3D FIELD_GET(AD7293_TRANSF_LEN_MSK, reg);
                    ^
   include/linux/bitfield.h:108:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:48:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/iio/dac/ad7293.c:175:11: note: Loop condition is false.  Exiting=
 loop
           length =3D FIELD_GET(AD7293_TRANSF_LEN_MSK, reg);
                    ^
   include/linux/bitfield.h:108:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:48:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \

vim +139 drivers/iio/dac/ad7293.c

0bb12606c05fe9 Antoniu Miclaus 2021-12-02  138  =

0bb12606c05fe9 Antoniu Miclaus 2021-12-02 @139  struct ad7293_state {
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  140  	struct spi_device *spi;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  141  	/* Protect against concurr=
ent accesses to the device, page selection and data content */
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  142  	struct mutex lock;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  143  	struct gpio_desc *gpio_res=
et;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  144  	struct regulator *reg_avdd;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  145  	struct regulator *reg_vdri=
ve;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  146  	u8 page_select;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  147  	u8 data[3] ____cacheline_a=
ligned;
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  148  };
0bb12606c05fe9 Antoniu Miclaus 2021-12-02  149  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7111179836492976062==--

