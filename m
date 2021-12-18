Content-Type: multipart/mixed; boundary="===============3847719433779865769=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4367/8462] drivers/iio/dac/ad7293.c:139:8: warning: Excessive padding in 'struct ad7293_state' (84 padding bytes, where 20 is optimal).
Date: Sat, 18 Dec 2021 11:32:13 +0800
Message-ID: <202112181119.xnCpAbBe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3847719433779865769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Cai Huoqing <cai.huoqing@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   c122052c3cb861b3e61a01d2c2ab9069e470663e
commit: 0bb12606c05fe9737e3056fe76d6e4b9c2a87b57 [4367/8462] iio:dac:ad7293=
: add support for AD7293
:::::: branch date: 14 hours ago
:::::: commit date: 13 days ago
config: riscv-randconfig-c006-20211214 (https://download.01.org/0day-ci/arc=
hive/20211218/202112181119.xnCpAbBe-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D0bb12606c05fe9737e3056fe76d6e4b9c2a87b57
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0bb12606c05fe9737e3056fe76d6e4b9c2a87b57
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/iio/industrialio-buffer.c:895:2: note: Loop condition is true.  =
Entering loop body
           list_for_each_entry(buffer, &iio_dev_opaque->buffer_list, buffer=
_list) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/iio/industrialio-buffer.c:896:7: note: Assuming 'buffer' is equa=
l to 'remove_buffer'
                   if (buffer =3D=3D remove_buffer)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:896:7: note: Assuming pointer value is=
 null
                   if (buffer =3D=3D remove_buffer)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:896:3: note: Taking true branch
                   if (buffer =3D=3D remove_buffer)
                   ^
   drivers/iio/industrialio-buffer.c:897:4: note:  Execution continues on l=
ine 895
                           continue;
                           ^
   drivers/iio/industrialio-buffer.c:895:2: note: Dereference of null point=
er
           list_for_each_entry(buffer, &iio_dev_opaque->buffer_list, buffer=
_list) {
           ^
   include/linux/list.h:632:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/iio/dac/ad5064.c:105:8: warning: Excessive padding in 'struct ad=
5064_state' (75 padding bytes, where 11 is optimal). =

   Optimal fields order: =

   data, =

   dac_cache, =

   use_internal_vref, =

   pwr_down, =

   pwr_down_mode, =

   dev, =

   chip_info, =

   write, =

   vref_reg, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5064_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5064.c:105:8: note: Excessive padding in 'struct ad506=
4_state' (75 padding bytes, where 11 is optimal). Optimal fields order: dat=
a, dac_cache, use_internal_vref, pwr_down, pwr_down_mode, dev, chip_info, w=
rite, vref_reg, lock, consider reordering the fields or adding explicit pad=
ding members
   struct ad5064_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/iio/dac/ad5764.c:52:8: warning: Excessive padding in 'struct ad5=
764_state' (112 padding bytes, where 48 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   chip_info, =

   vref_reg, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5764_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5764.c:52:8: note: Excessive padding in 'struct ad5764=
_state' (112 padding bytes, where 48 is optimal). Optimal fields order: dat=
a, spi, chip_info, vref_reg, lock, consider reordering the fields or adding=
 explicit padding members
   struct ad5764_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/iio/dac/ad7293.c:139:8: warning: Excessive padding in 'struct ad=
7293_state' (84 padding bytes, where 20 is optimal). =

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
3_state' (84 padding bytes, where 20 is optimal). Optimal fields order: dat=
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


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3847719433779865769==--

