Content-Type: multipart/mixed; boundary="===============4802422345321757402=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/dac/ad7293.c:139:8: warning: Excessive padding in 'struct ad7293_state' (48 padding bytes, where 16 is optimal).
Date: Mon, 20 Jun 2022 09:04:44 +0800
Message-ID: <202206200944.9csasOwI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4802422345321757402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/i=
io/dac/ad7293.c:139:8: warning: Excessive padding in 'struct ad7293_state' =
(48 padding bytes, where 16 is optimal). "
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Cai Huoqing <cai.huoqing@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 0bb12606c05fe9737e3056fe76d6e4b9c2a87b57 iio:dac:ad7293: add suppor=
t for AD7293
date:   7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220619 (https://download.01.org/0day-ci/archi=
ve/20220620/202206200944.9csasOwI-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 916887=
16ba49942051dccdf7b9c4f81a7ec8feaf)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D0bb12606c05fe9737e3056fe76d6e4b9c2a87b57
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0bb12606c05fe9737e3056fe76d6e4b9c2a87b57
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/mtd/parsers/redboot.c:192:2: note: Loop condition is false. Exec=
ution continues on line 229
           for (i =3D 0; i < numslots; i++) {
           ^
   drivers/mtd/parsers/redboot.c:229:6: note: Access to field 'img' results=
 in a dereference of a null pointer (loaded from variable 'fl')
           if (fl->img->flash_base) {
               ^~
   drivers/mtd/parsers/redboot.c:251:3: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(nullname, nullstring);
                   ^~~~~~
   drivers/mtd/parsers/redboot.c:251:3: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
                   strcpy(nullname, nullstring);
                   ^~~~~~
   drivers/mtd/parsers/redboot.c:270:3: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(names, fl->img->name);
                   ^~~~~~
   drivers/mtd/parsers/redboot.c:270:3: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
                   strcpy(names, fl->img->name);
                   ^~~~~~
   1 warning generated.
   fs/autofs/dev-ioctl.c:519:34: warning: Although the value stored to 'dev=
id' is used in the enclosing expression, the value is never actually read f=
rom 'devid' [clang-analyzer-deadcode.DeadStores]
           param->ismountpoint.out.devid =3D devid =3D 0;
                                           ^       ~
   fs/autofs/dev-ioctl.c:519:34: note: Although the value stored to 'devid'=
 is used in the enclosing expression, the value is never actually read from=
 'devid'
           param->ismountpoint.out.devid =3D devid =3D 0;
                                           ^       ~
   1 warning generated.
   fs/adfs/dir.c:277:29: warning: Value stored to 'ops' during its initiali=
zation is never read [clang-analyzer-deadcode.DeadStores]
           const struct adfs_dir_ops *ops =3D ADFS_SB(sb)->s_dir;
                                      ^~~   ~~~~~~~~~~~~~~~~~~
   fs/adfs/dir.c:277:29: note: Value stored to 'ops' during its initializat=
ion is never read
           const struct adfs_dir_ops *ops =3D ADFS_SB(sb)->s_dir;
                                      ^~~   ~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/of/device.c:59:29: warning: Value stored to 'of_node' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *node, *of_node =3D dev->of_node;
                                      ^~~~~~~   ~~~~~~~~~~~~
   drivers/of/device.c:59:29: note: Value stored to 'of_node' during its in=
itialization is never read
           struct device_node *node, *of_node =3D dev->of_node;
                                      ^~~~~~~   ~~~~~~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/iio/dac/ad5791.c:84:8: warning: Excessive padding in 'struct ad5=
791_state' (53 padding bytes, where 21 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   reg_vdd, =

   reg_vss, =

   chip_info, =

   vref_neg_mv, =

   ctrl, =

   pwr_down_mode, =

   vref_mv, =

   pwr_down, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5791_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5791.c:84:8: note: Excessive padding in 'struct ad5791=
_state' (53 padding bytes, where 21 is optimal). Optimal fields order: data=
, spi, reg_vdd, reg_vss, chip_info, vref_neg_mv, ctrl, pwr_down_mode, vref_=
mv, pwr_down, consider reordering the fields or adding explicit padding mem=
bers
   struct ad5791_state {
   ~~~~~~~^~~~~~~~~~~~~~
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
   3 warnings generated.
>> drivers/iio/dac/ad7293.c:139:8: warning: Excessive padding in 'struct ad=
7293_state' (48 padding bytes, where 16 is optimal). =

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
3_state' (48 padding bytes, where 16 is optimal). Optimal fields order: dat=
a, page_select, spi, gpio_reset, reg_avdd, reg_vdrive, lock, consider reord=
ering the fields or adding explicit padding members
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


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4802422345321757402==--

