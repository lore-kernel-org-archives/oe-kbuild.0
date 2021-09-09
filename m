Content-Type: multipart/mixed; boundary="===============1216509550671226549=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/ov5648.c:587:8: warning: Excessive padding in 'struct ov5648_mode' (10 padding bytes, where 2 is optimal).
Date: Fri, 10 Sep 2021 02:55:20 +0800
Message-ID: <202109100205.IHVi9vfX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1216509550671226549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a3fa7a101dcff93791d1b1bdb3affcad1410c8c1
commit: e43ccb0a045f34838b786e8021dc4838b4af5c38 media: i2c: Add support fo=
r the OV5648 image sensor
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-c007-20210907 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9c4761=
72b93367d2cb88d7d3f4b1b5b456fa6020)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De43ccb0a045f34838b786e8021dc4838b4af5c38
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e43ccb0a045f34838b786e8021dc4838b4af5c38
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                       ^
   drivers/hid/hid-topseed.c:30:6: note: Assuming the condition is false
           if ((usage->hid & HID_USAGE_PAGE) !=3D HID_UP_LOGIVENDOR)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-topseed.c:30:2: note: Taking false branch
           if ((usage->hid & HID_USAGE_PAGE) !=3D HID_UP_LOGIVENDOR)
           ^
   drivers/hid/hid-topseed.c:33:2: note: Control jumps to 'case 90:'  at li=
ne 51
           switch (usage->hid & HID_USAGE) {
           ^
   drivers/hid/hid-topseed.c:51:14: note: Calling 'hid_map_usage_clear'
           case 0x05a: ts_map_key_clear(KEY_TEXT);         break;
                       ^
   drivers/hid/hid-topseed.c:24:29: note: expanded from macro 'ts_map_key_c=
lear'
   #define ts_map_key_clear(c)     hid_map_usage_clear(hi, usage, bit, max,=
 \
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/hid.h:1020:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:974:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:978:2: note: Control jumps to 'case 1:'  at line 987
           switch (type) {
           ^
   include/linux/hid.h:990:3: note:  Execution continues on line 997
                   break;
                   ^
   include/linux/hid.h:997:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:997:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:997:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:997:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:997:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:998:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:511:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:998:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:511:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:999:9: note: Access to field 'name' results in a der=
eference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:528:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:512:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/media/i2c/ov5640.c:1005:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov5640.c:1005:2: note: Value stored to 'ret' is never =
read
           ret =3D ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/media/i2c/ov5648.c:587:8: warning: Excessive padding in 'struct =
ov5648_mode' (10 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   pll2_config, =

   register_values, =

   pll1_config, =

   crop_start_x, =

   offset_x, =

   output_size_x, =

   crop_end_x, =

   hts, =

   crop_start_y, =

   offset_y, =

   output_size_y, =

   crop_end_y, =

   vts, =

   inc_x_odd, =

   inc_x_even, =

   inc_y_odd, =

   inc_y_even, =

   register_values_count, =

   frame_interval, =

   binning_x, =

   binning_y, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ov5648_mode {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/media/i2c/ov5648.c:587:8: note: Excessive padding in 'struct ov5=
648_mode' (10 padding bytes, where 2 is optimal). Optimal fields order: pll=
2_config, register_values, pll1_config, crop_start_x, offset_x, output_size=
_x, crop_end_x, hts, crop_start_y, offset_y, output_size_y, crop_end_y, vts=
, inc_x_odd, inc_x_even, inc_y_odd, inc_y_even, register_values_count, fram=
e_interval, binning_x, binning_y, consider reordering the fields or adding =
explicit padding members
   struct ov5648_mode {
   ~~~~~~~^~~~~~~~~~~~~
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/media/i2c/ov7670.c:1291:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov7670_read(sd, REG_CMATRIX_SIGN, &signbits);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1291:2: note: Value stored to 'ret' is never =
read
           ret =3D ov7670_read(sd, REG_CMATRIX_SIGN, &signbits);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1527:15: warning: The left operand of '&' is =
a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           com1 =3D (com1 & 0xfc) | (value & 0x03);
                        ^
   drivers/media/i2c/ov7670.c:1596:2: note: Control jumps to 'case 10094849=
:'  at line 1616
           switch (ctrl->id) {
           ^
   drivers/media/i2c/ov7670.c:1619:7: note: Assuming field 'val' is equal t=
o V4L2_EXPOSURE_MANUAL
                   if (ctrl->val =3D=3D V4L2_EXPOSURE_MANUAL) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1619:3: note: Taking true branch
                   if (ctrl->val =3D=3D V4L2_EXPOSURE_MANUAL) {
                   ^
   drivers/media/i2c/ov7670.c:1621:11: note: Calling 'ov7670_s_exp'
                           return ov7670_s_exp(sd, info->exposure->val);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1519:16: note: 'com1' declared without an ini=
tial value
           unsigned char com1, com8, aech, aechh;
                         ^~~~
   drivers/media/i2c/ov7670.c:1521:8: note: Calling 'ov7670_read'
           ret =3D ov7670_read(sd, REG_COM1, &com1) +
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:565:6: note: Assuming field 'use_smbus' is tr=
ue
           if (info->use_smbus)
               ^~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:565:2: note: Taking true branch
           if (info->use_smbus)
           ^
   drivers/media/i2c/ov7670.c:566:10: note: Calling 'ov7670_read_smbus'
                   return ov7670_read_smbus(sd, reg, value);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:485:6: note: Assuming 'ret' is < 0
           if (ret >=3D 0) {
               ^~~~~~~~
   drivers/media/i2c/ov7670.c:485:2: note: Taking false branch
           if (ret >=3D 0) {
           ^
   drivers/media/i2c/ov7670.c:489:2: note: Returning without writing to '*v=
alue'
           return ret;
           ^
   drivers/media/i2c/ov7670.c:566:10: note: Returning from 'ov7670_read_smb=
us'
                   return ov7670_read_smbus(sd, reg, value);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:566:3: note: Returning without writing to '*v=
alue'
                   return ov7670_read_smbus(sd, reg, value);
                   ^
   drivers/media/i2c/ov7670.c:1521:8: note: Returning from 'ov7670_read'
           ret =3D ov7670_read(sd, REG_COM1, &com1) +
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1524:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~

vim +587 drivers/media/i2c/ov5648.c

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  575  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  576  /*
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  577   * General formulas for (=
array-centered) mode calculation:
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  578   * - photo_array_width =
=3D 2624
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  579   * - crop_start_x =3D (ph=
oto_array_width - output_size_x) / 2
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  580   * - crop_end_x =3D crop_=
start_x + offset_x + output_size_x - 1
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  581   *
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  582   * - photo_array_height =
=3D 1956
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  583   * - crop_start_y =3D (ph=
oto_array_height - output_size_y) / 2
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  584   * - crop_end_y =3D crop_=
start_y + offset_y + output_size_y - 1
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  585   */
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  586  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31 @587  struct ov5648_mode {
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  588  	unsigned int crop_start_=
x;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  589  	unsigned int offset_x;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  590  	unsigned int output_size=
_x;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  591  	unsigned int crop_end_x;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  592  	unsigned int hts;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  593  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  594  	unsigned int crop_start_=
y;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  595  	unsigned int offset_y;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  596  	unsigned int output_size=
_y;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  597  	unsigned int crop_end_y;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  598  	unsigned int vts;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  599  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  600  	bool binning_x;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  601  	bool binning_y;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  602  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  603  	unsigned int inc_x_odd;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  604  	unsigned int inc_x_even;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  605  	unsigned int inc_y_odd;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  606  	unsigned int inc_y_even;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  607  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  608  	/* 8-bit frame interval =
followed by 10-bit frame interval. */
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  609  	struct v4l2_fract frame_=
interval[2];
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  610  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  611  	/* 8-bit config followed=
 by 10-bit config. */
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  612  	const struct ov5648_pll1=
_config *pll1_config[2];
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  613  	const struct ov5648_pll2=
_config *pll2_config;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  614  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  615  	const struct ov5648_regi=
ster_value *register_values;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  616  	unsigned int register_va=
lues_count;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  617  };
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  618  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1216509550671226549==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1216509550671226549==--

