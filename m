Content-Type: multipart/mixed; boundary="===============5999079779694590933=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/samsung/exynos4-is/fimc-core.c:803:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 08 Jun 2022 06:09:57 +0800
Message-ID: <202206080631.Vlps9JQ9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5999079779694590933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/platform/samsung/exynos4-is/fimc-core.c:803:4: warning: Value stored t=
o 'ret' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e71e60cd74df9386c3f684c54888f2367050b831
commit: 238c84f71120f41c45301359902a912a19370f3d media: platform: rename ex=
ynos4-is/ to samsung/exynos4-is/
date:   3 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220605 (https://download.01.org/0day-ci/archi=
ve/20220608/202206080631.Vlps9JQ9-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0a90b7=
2c432d70aae035727ece4ba80ce820f381)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D238c84f71120f41c45301359902a912a19370f3d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 238c84f71120f41c45301359902a912a19370f3d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/dev_printk.h:146:2: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   drivers/usb/misc/ftdi-elan.c:196:2: note: '?' condition is true
           dev_warn(&ftdi->udev->dev, "FREEING ftdi=3D%p\n", ftdi);
           ^
   include/linux/dev_printk.h:146:2: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   drivers/usb/misc/ftdi-elan.c:196:2: note: '?' condition is true
           dev_warn(&ftdi->udev->dev, "FREEING ftdi=3D%p\n", ftdi);
           ^
   include/linux/dev_printk.h:146:2: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   drivers/usb/misc/ftdi-elan.c:196:2: note: Loop condition is false.  Exit=
ing loop
           dev_warn(&ftdi->udev->dev, "FREEING ftdi=3D%p\n", ftdi);
           ^
   include/linux/dev_printk.h:146:2: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   drivers/usb/misc/ftdi-elan.c:205:2: note: Memory is released
           kfree(ftdi);
           ^~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/usb/misc/ftdi-elan.c:256:3: note: Returning; memory was released
                   kref_put(&ftdi->kref, ftdi_elan_delete);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/misc/ftdi-elan.c:2782:3: note: Returning; memory was release=
d via 1st parameter
                   ftdi_command_cancel_work(ftdi);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/misc/ftdi-elan.c:2783:3: note: Use of memory after it is fre=
ed
                   ftdi_response_cancel_work(ftdi);
                   ^                         ~~~~
   Suppressed 2 warnings (2 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/pinctrl/mediatek/pinctrl-moore.c:183:4: warning: Value stored to=
 'err' is never read [clang-analyzer-deadcode.DeadStores]
                           err =3D -ENOTSUPP;
                           ^     ~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-moore.c:183:4: note: Value stored to 'e=
rr' is never read
                           err =3D -ENOTSUPP;
                           ^     ~~~~~~~~~
   2 warnings generated.
>> drivers/media/platform/samsung/exynos4-is/fimc-core.c:803:4: warning: Va=
lue stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D PTR_ERR(fimc->clock[i]);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-core.c:803:4: note: Value=
 stored to 'ret' is never read
                           ret =3D PTR_ERR(fimc->clock[i]);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/hwmon/lm75.h:30:29: warning: The result of the left shift is und=
efined because the left operand is negative [clang-analyzer-core.UndefinedB=
inaryOperatorResult]
           return (u16)((ntemp / 500) << 7);
                                      ^
   drivers/hwmon/w83627ehf.c:1608:6: note: Assuming 'type' is not equal to =
hwmon_in
           if (type =3D=3D hwmon_in && attr =3D=3D hwmon_in_min)
               ^~~~~~~~~~~~~~~~
   drivers/hwmon/w83627ehf.c:1608:23: note: Left side of '&&' is false
           if (type =3D=3D hwmon_in && attr =3D=3D hwmon_in_min)
                                ^
   drivers/hwmon/w83627ehf.c:1610:6: note: 'type' is not equal to hwmon_in
           if (type =3D=3D hwmon_in && attr =3D=3D hwmon_in_max)
               ^~~~
   drivers/hwmon/w83627ehf.c:1610:23: note: Left side of '&&' is false
           if (type =3D=3D hwmon_in && attr =3D=3D hwmon_in_max)
                                ^
   drivers/hwmon/w83627ehf.c:1613:6: note: Assuming 'type' is not equal to =
hwmon_fan
           if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_min)
               ^~~~~~~~~~~~~~~~~
   drivers/hwmon/w83627ehf.c:1613:24: note: Left side of '&&' is false
           if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_min)
                                 ^
   drivers/hwmon/w83627ehf.c:1616:6: note: Assuming 'type' is equal to hwmo=
n_temp
           if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_max)
               ^~~~~~~~~~~~~~~~~~
   drivers/hwmon/w83627ehf.c:1616:6: note: Left side of '&&' is true
   drivers/hwmon/w83627ehf.c:1616:28: note: Assuming 'attr' is equal to hwm=
on_temp_max
           if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_max)
                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/w83627ehf.c:1616:2: note: Taking true branch
           if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_max)
           ^
   drivers/hwmon/w83627ehf.c:1617:10: note: Calling 'store_temp_max'
                   return store_temp_max(dev, data, channel, val);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/w83627ehf.c:799:1: note: Calling 'LM75_TEMP_TO_REG'
   store_temp_reg(reg_temp_over, temp_max);
   ^
   drivers/hwmon/w83627ehf.c:794:23: note: expanded from macro 'store_temp_=
reg'
           data->reg[channel] =3D LM75_TEMP_TO_REG(val); \
                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm75.h:27:14: note: Assuming '__UNIQUE_ID___x165' is <=3D =
'__UNIQUE_ID___y166'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:104:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/hwmon/lm75.h:27:14: note: '?' condition is false
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                                  ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
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
   drivers/hwmon/lm75.h:27:14: note: '__UNIQUE_ID___x167' is < '__UNIQUE_ID=
___y168'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
--
           ^
   lib/vsprintf.c:933:4: note: Assigned value is garbage or undefined
           s =3D array[--i];
             ^ ~~~~~~~~~~
   lib/vsprintf.c:1350:9: warning: Assigned value is garbage or undefined [=
clang-analyzer-core.uninitialized.Assign]
                           *p++ =3D temp[digits];
                                ^
   lib/vsprintf.c:3061:2: note: Loop condition is true.  Entering loop body
           while (*fmt) {
           ^
   lib/vsprintf.c:3066:3: note: Control jumps to 'case FORMAT_TYPE_PTR:'  a=
t line 3101
                   switch (spec.type) {
                   ^
   lib/vsprintf.c:3103:4: note: Control jumps to the 'default' case at line=
 3112
                           switch (*fmt) {
                           ^
   lib/vsprintf.c:3113:9: note: Assuming the condition is false
                                   if (!isalnum(*fmt)) {
                                       ^~~~~~~~~~~~~~
   lib/vsprintf.c:3113:5: note: Taking false branch
                                   if (!isalnum(*fmt)) {
                                   ^
   lib/vsprintf.c:3117:11: note: Calling 'pointer'
                                   str =3D pointer(fmt, str, end, va_arg(ar=
gs, void *),
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   lib/vsprintf.c:2386:2: note: Control jumps to 'case 105:'  at line 2415
           switch (*fmt) {
           ^
   lib/vsprintf.c:2419:10: note: Calling 'ip_addr_string'
                   return ip_addr_string(buf, end, ptr, spec, fmt);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:1587:2: note: Taking false branch
           if (check_pointer(&buf, end, ptr, spec))
           ^
   lib/vsprintf.c:1590:2: note: Control jumps to 'case 52:'  at line 1593
           switch (fmt[1]) {
           ^
   lib/vsprintf.c:1594:10: note: Calling 'ip4_addr_string'
                   return ip4_addr_string(buf, end, ptr, spec, fmt);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:1479:2: note: Calling 'ip4_string'
           ip4_string(ip4_addr, addr, fmt);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:1318:2: note: Control jumps to the 'default' case@line=
 1334
           switch (fmt[2]) {
           ^
   lib/vsprintf.c:1337:3: note:  Execution continues on line 1339
                   break;
                   ^
   lib/vsprintf.c:1339:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < 4; i++) {
           ^
   lib/vsprintf.c:1341:16: note: Calling 'put_dec_trunc8'
                   int digits =3D put_dec_trunc8(temp, addr[index]) - temp;
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:219:6: note: Assuming 'r' is < 100
           if (r < 100)
               ^~~~~~~
   lib/vsprintf.c:219:2: note: Taking true branch
           if (r < 100)
           ^
   lib/vsprintf.c:220:3: note: Control jumps to line 249
                   goto out_r;
                   ^
   lib/vsprintf.c:250:9: note: Assuming 'r' is >=3D 10
           buf +=3D r < 10 ? 1 : 2;
                  ^~~~~~
   lib/vsprintf.c:250:9: note: '?' condition is false
   lib/vsprintf.c:1341:16: note: Returning from 'put_dec_trunc8'
                   int digits =3D put_dec_trunc8(temp, addr[index]) - temp;
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:1342:7: note: Assuming 'leading_zeros' is false
                   if (leading_zeros) {
                       ^~~~~~~~~~~~~
   lib/vsprintf.c:1342:3: note: Taking false branch
                   if (leading_zeros) {
                   ^
   lib/vsprintf.c:1349:10: note: The value 1 is assigned to 'digits'
                   while (digits--)
                          ^~~~~~~~
   lib/vsprintf.c:1349:3: note: Loop condition is true.  Entering loop body
                   while (digits--)
                   ^
   lib/vsprintf.c:1350:9: note: Assigned value is garbage or undefined
                           *p++ =3D temp[digits];
                                ^ ~~~~~~~~~~~~
   lib/vsprintf.c:1413:4: warning: Value stored to 'needcolon' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           needcolon =3D false;
                           ^           ~~~~~
   lib/vsprintf.c:1413:4: note: Value stored to 'needcolon' is never read
                           needcolon =3D false;
                           ^           ~~~~~
   lib/vsprintf.c:1781:2: warning: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
           ^~~~~~
   lib/vsprintf.c:1781:2: note: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119
           strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
           ^~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:467:20: warning: Di=
vision by zero [clang-analyzer-core.DivideZero]
                                 halign, 64/(ALIGN(depth, 8)));
                                           ^
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:493:8: note: Callin=
g 'fimc_m2m_try_selection'
           ret =3D fimc_m2m_try_selection(ctx, s);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:435:6: note: Assumi=
ng field 'top' is >=3D 0
           if (s->r.top < 0 || s->r.left < 0) {
               ^~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:435:6: note: Left s=
ide of '||' is false
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:435:22: note: Assum=
ing field 'left' is >=3D 0
           if (s->r.top < 0 || s->r.left < 0) {
                               ^~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:435:2: note: Taking=
 false branch
           if (s->r.top < 0 || s->r.left < 0) {
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:440:6: note: Assumi=
ng field 'type' is equal to V4L2_BUF_TYPE_VIDEO_CAPTURE
           if (s->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:440:2: note: Taking=
 true branch
           if (s->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) {
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:442:7: note: Assumi=
ng field 'target' is equal to V4L2_SEL_TGT_COMPOSE
                   if (s->target !=3D V4L2_SEL_TGT_COMPOSE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:442:3: note: Taking=
 false branch
                   if (s->target !=3D V4L2_SEL_TGT_COMPOSE)
                   ^
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:452:13: note: '?' c=
ondition is false
           min_size =3D (f =3D=3D &ctx->s_frame) ?
                      ^
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:456:6: note: Assumi=
ng field 'min_vsize_align' is not equal to 1
           if (fimc->variant->min_vsize_align =3D=3D 1)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:456:2: note: Taking=
 false branch
           if (fimc->variant->min_vsize_align =3D=3D 1)
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:461:14: note: Assum=
ing 'i' is >=3D field 'memplanes'
           for (i =3D 0; i < f->fmt->memplanes; i++)
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:461:2: note: Loop c=
ondition is false. Execution continues on line 464
           for (i =3D 0; i < f->fmt->memplanes; i++)
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:467:20: note: Divis=
ion by zero
                                 halign, 64/(ALIGN(depth, 8)));
                                         ~~^~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   5 warnings generated.
>> drivers/media/platform/samsung/exynos4-is/fimc-capture.c:670:16: warning=
: Division by zero [clang-analyzer-core.DivideZero]
                   align_sz =3D 64/ALIGN(depth, 8);
                                ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1643:6: note: A=
ssuming field 'pad' is not equal to FIMC_SD_PAD_SOURCE
           if (sel->pad =3D=3D FIMC_SD_PAD_SOURCE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1643:2: note: T=
aking false branch
           if (sel->pad =3D=3D FIMC_SD_PAD_SOURCE)
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1647:2: note: C=
alling 'fimc_capture_try_selection'
           fimc_capture_try_selection(ctx, r, V4L2_SEL_TGT_CROP);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:643:16: note: A=
ssuming field 'rotation' is equal to 90
           bool rotate =3D ctx->rotation =3D=3D 90 || ctx->rotation =3D=3D =
270;
                         ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:643:36: note: L=
eft side of '||' is true
           bool rotate =3D ctx->rotation =3D=3D 90 || ctx->rotation =3D=3D =
270;
                                             ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:653:6: note: As=
suming the condition is true
           if (fimc_fmt_is_user_defined(ctx->d_frame.fmt->color)) {
               ^
   drivers/media/platform/samsung/exynos4-is/fimc-core.h:112:39: note: expa=
nded from macro 'fimc_fmt_is_user_defined'
   #define fimc_fmt_is_user_defined(x) (!!((x) & 0x180))
                                         ^~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:653:2: note: Ta=
king false branch
           if (fimc_fmt_is_user_defined(ctx->d_frame.fmt->color)) {
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:659:6: note: 't=
arget' is not equal to V4L2_SEL_TGT_COMPOSE
           if (target =3D=3D V4L2_SEL_TGT_COMPOSE) {
               ^~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:659:2: note: Ta=
king false branch
           if (target =3D=3D V4L2_SEL_TGT_COMPOSE) {
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:670:16: note: D=
ivision by zero
                   align_sz =3D 64/ALIGN(depth, 8);
                              ~~^~~~~~~~~~~~~~~~
>> drivers/media/platform/samsung/exynos4-is/fimc-capture.c:825:3: warning:=
 Value stored to 'ffmt' is never read [clang-analyzer-deadcode.DeadStores]
                   ffmt =3D fimc_capture_try_format(ctx, &tfmt->width, &tfm=
t->height,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:825:3: note: Va=
lue stored to 'ffmt' is never read
                   ffmt =3D fimc_capture_try_format(ctx, &tfmt->width, &tfm=
t->height,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
>> drivers/media/platform/samsung/exynos4-is/fimc-capture.c:862:22: warning=
: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized=
.Assign]
                   fd.entry[i].length =3D plane_fmt[i].sizeimage;
                                      ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1184:2: note: T=
aking false branch
           if (fimc_capture_active(fimc))
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1188:6: note: A=
ssuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1188:2: note: T=
aking false branch
           if (ret < 0)
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1192:6: note: A=
ssuming 'sd' is non-null
           if (sd)
               ^~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1192:2: note: T=
aking true branch
           if (sd)
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1195:6: note: A=
ssuming 'si' is not equal to NULL
           if (si =3D=3D NULL) {
               ^~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1195:2: note: T=
aking false branch
           if (si =3D=3D NULL) {
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1205:6: note: A=
ssuming the condition is false
           if (vc->input =3D=3D GRP_ID_FIMC_IS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1205:2: note: T=
aking false branch
           if (vc->input =3D=3D GRP_ID_FIMC_IS)
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1208:6: note: A=
ssuming field 'user_subdev_api' is true
           if (vc->user_subdev_api) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1208:2: note: T=
aking true branch
           if (vc->user_subdev_api) {
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1209:9: note: C=
alling 'fimc_pipeline_validate'
                   ret =3D fimc_pipeline_validate(fimc);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1105:2: note: L=
oop condition is true.  Entering loop body
           while (1) {
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1113:15: note: =
Assuming 'i' is < field 'num_pads'
                   for (i =3D 0; i < sd->entity.num_pads; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1113:3: note: L=
oop condition is true.  Entering loop body
                   for (i =3D 0; i < sd->entity.num_pads; i++) {
                   ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1116:8: note: A=
ssuming the condition is true
                           if (p->flags & MEDIA_PAD_FL_SINK) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1116:4: note: T=
aking true branch
                           if (p->flags & MEDIA_PAD_FL_SINK) {
                           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1119:9: note: A=
ssuming 'src_pad' is non-null
                                   if (src_pad)
                                       ^~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1119:5: note: T=
aking true branch
                                   if (src_pad)
                                   ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1120:6: note:  =
Execution continues on line 1124
                                           break;
                                           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1124:8: note: '=
src_pad' is non-null
                   if (!src_pad || !is_media_entity_v4l2_subdev(src_pad->en=
tity))
                        ^~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1124:7: note: L=
eft side of '||' is false
                   if (!src_pad || !is_media_entity_v4l2_subdev(src_pad->en=
tity))
                       ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1124:3: note: T=
aking false branch
                   if (!src_pad || !is_media_entity_v4l2_subdev(src_pad->en=
tity))
                   ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1128:3: note: T=
aking true branch
                   if (sd =3D=3D &vc->subdev) {
                   ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1132:27: note: =
Assuming field 'fmt' is non-null
                           sink_fmt.format.code =3D ff->fmt ? ff->fmt->mbus=
_code : 0;
                                                  ^~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1132:27: note: =
'?' condition is true
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1142:8: note: '=
__me_sd_ent' is non-null
                   sd =3D media_entity_to_v4l2_subdev(src_pad->entity);
                        ^
   include/media/v4l2-subdev.h:932:2: note: expanded from macro 'media_enti=
ty_to_v4l2_subdev'
           __me_sd_ent ?                                                   \
           ^~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1142:8: note: '=
?' condition is true
                   sd =3D media_entity_to_v4l2_subdev(src_pad->entity);
                        ^
   include/media/v4l2-subdev.h:932:2: note: expanded from macro 'media_enti=
ty_to_v4l2_subdev'
           __me_sd_ent ?                                                   \
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1145:9: note: '=
__sd' is non-null
                   ret =3D v4l2_subdev_call(sd, pad, get_fmt, NULL, &src_fm=
t);
                         ^
   include/media/v4l2-subdev.h:1170:8: note: expanded from macro 'v4l2_subd=
ev_call'
                   if (!__sd)                                              \
                        ^~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1145:9: note: T=
aking false branch
                   ret =3D v4l2_subdev_call(sd, pad, get_fmt, NULL, &src_fm=
t);
                         ^
   include/media/v4l2-subdev.h:1170:3: note: expanded from macro 'v4l2_subd=
ev_call'
--
                         ^~~~~   ~~~~~~~~~~~~
   2 warnings generated.
   fs/affs/namei.c:22:34: warning: Although the value stored to 'ch' is use=
d in the enclosing expression, the value is never actually read from 'ch' [=
clang-analyzer-deadcode.DeadStores]
           return ch >=3D 'a' && ch <=3D 'z' ? ch -=3D ('a' - 'A') : ch;
                                           ^     ~~~~~~~~~~~
   fs/affs/namei.c:22:34: note: Although the value stored to 'ch' is used i=
n the enclosing expression, the value is never actually read from 'ch'
           return ch >=3D 'a' && ch <=3D 'z' ? ch -=3D ('a' - 'A') : ch;
                                           ^     ~~~~~~~~~~~
   fs/affs/namei.c:489:2: warning: Value stored to 'retval' is never read [=
clang-analyzer-deadcode.DeadStores]
           retval =3D affs_insert_hash(new_dir, bh_old);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/affs/namei.c:489:2: note: Value stored to 'retval' is never read
           retval =3D affs_insert_hash(new_dir, bh_old);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   sound/usb/midi.c:2354:2: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rmidi->name, umidi->card->shortname);
           ^~~~~~
   sound/usb/midi.c:2354:2: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
           strcpy(rmidi->name, umidi->card->shortname);
           ^~~~~~
   2 warnings generated.
   sound/usb/misc/ua101.c:1250:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->shortname, name);
           ^~~~~~
   sound/usb/misc/ua101.c:1250:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(card->shortname, name);
           ^~~~~~
   sound/usb/misc/ua101.c:1275:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ua->pcm->name, name);
           ^~~~~~
   sound/usb/misc/ua101.c:1275:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(ua->pcm->name, name);
           ^~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/gpu/drm/drm_file.c:587:30: warning: Use of memory after it is fr=
eed [clang-analyzer-unix.Malloc]
                           file_priv->event_space +=3D e->event->length;
                                                     ^~~~~~~~
   drivers/gpu/drm/drm_file.c:577:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/drm_file.c:577:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/drm_file.c:580:2: note: Loop condition is true.  Enterin=
g loop body
           for (;;) {
           ^
   drivers/gpu/drm/drm_file.c:584:7: note: Assuming the condition is true
                   if (!list_empty(&file_priv->event_list)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_file.c:584:3: note: Taking true branch
                   if (!list_empty(&file_priv->event_list)) {
                   ^
   drivers/gpu/drm/drm_file.c:592:7: note: 'e' is not equal to NULL
                   if (e =3D=3D NULL) {
                       ^
   drivers/gpu/drm/drm_file.c:592:3: note: Taking false branch
                   if (e =3D=3D NULL) {
                   ^
   drivers/gpu/drm/drm_file.c:611:8: note: Assuming the condition is false
                           if (length > count - ret) {
                               ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_file.c:611:4: note: Taking false branch
                           if (length > count - ret) {
                           ^
   drivers/gpu/drm/drm_file.c:622:8: note: Assuming the condition is false
                           if (copy_to_user(buffer + ret, e->event, length)=
) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_file.c:622:4: note: Taking false branch
                           if (copy_to_user(buffer + ret, e->event, length)=
) {
                           ^
   drivers/gpu/drm/drm_file.c:629:4: note: Memory is released
                           kfree(e);
                           ^~~~~~~~
   drivers/gpu/drm/drm_file.c:580:2: note: Loop condition is true.  Enterin=
g loop body
           for (;;) {
           ^
   drivers/gpu/drm/drm_file.c:584:7: note: Assuming the condition is true
                   if (!list_empty(&file_priv->event_list)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_file.c:584:3: note: Taking true branch
                   if (!list_empty(&file_priv->event_list)) {
                   ^
   drivers/gpu/drm/drm_file.c:587:30: note: Use of memory after it is freed
                           file_priv->event_space +=3D e->event->length;
                                                     ^~~~~~~~
   1 warning generated.
   sound/core/seq/seq_midi.c:348:4: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(port->name, info->subname);
                           ^~~~~~
   sound/core/seq/seq_midi.c:348:4: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
                           strcpy(port->name, info->subname);
                           ^~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   4 warnings generated.
>> drivers/media/platform/samsung/exynos4-is/media-dev.c:1018:3: warning: V=
alue stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/platform/samsung/exynos4-is/media-dev.c:1018:3: note: Valu=
e stored to 'ret' is never read
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/platform/samsung/exynos4-is/media-dev.c:1031:3: warning: V=
alue stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/platform/samsung/exynos4-is/media-dev.c:1031:3: note: Valu=
e stored to 'ret' is never read
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/media/platform/samsung/exynos4-is/media-dev.c:1541:6: note: Assu=
ming 'fmd' is non-null
           if (!fmd)
               ^~~~
   drivers/media/platform/samsung/exynos4-is/media-dev.c:1541:2: note: Taki=
ng false branch
           if (!fmd)
           ^
   drivers/media/platform/samsung/exynos4-is/media-dev.c:1551:2: note: Call=
ing 'fimc_md_pipelines_free'
           fimc_md_pipelines_free(fmd);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/media-dev.c:389:2: note: Loop =
condition is true.  Entering loop body
           while (!list_empty(&fmd->pipelines)) {
           ^
   drivers/media/platform/samsung/exynos4-is/media-dev.c:394:3: note: Memor=
y is released
                   kfree(p);
                   ^~~~~~~~
   drivers/media/platform/samsung/exynos4-is/media-dev.c:389:2: note: Loop =
condition is true.  Entering loop body
           while (!list_empty(&fmd->pipelines)) {
           ^
   drivers/media/platform/samsung/exynos4-is/media-dev.c:393:3: note: Calli=
ng 'list_del'
                   list_del(&p->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   fs/btrfs/verity.c:134:4: warning: Value stored to 'ret' is never read [c=
lang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/btrfs/verity.c:134:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   1 warning generated.
   drivers/of/device.c:59:29: warning: Value stored to 'of_node' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *node, *of_node =3D dev->of_node;
                                      ^~~~~~~   ~~~~~~~~~~~~
   drivers/of/device.c:59:29: note: Value stored to 'of_node' during its in=
itialization is never read
           struct device_node *node, *of_node =3D dev->of_node;
                                      ^~~~~~~   ~~~~~~~~~~~~
   2 warnings generated.
   drivers/of/property.c:920:19: warning: Access to field 'full_name' resul=
ts in a dereference of a null pointer [clang-analyzer-core.NullDereference]
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:920:19: note: '?' condition is false
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:920:19: note: Access to field 'full_name' results =
in a dereference of a null pointer
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:926:7: warning: Access to field 'parent' results i=
n a dereference of a null pointer [clang-analyzer-core.NullDereference]
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:926:7: note: '?' condition is false
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:926:7: note: Access to field 'parent' results in a=
 dereference of a null pointer
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).

vim +/ret +803 drivers/media/platform/samsung/exynos4-is/fimc-core.c

5fd8f7388c9a86 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2010-08-03  792  =

5fd8f7388c9a86 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2010-08-03  793  static int fimc_clk_get(struct fimc_dev *fimc)
5fd8f7388c9a86 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2010-08-03  794  {
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  795  	int i, ret;
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  796  =

b71b56b264ae27 drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawroc=
ki 2013-01-29  797  	for (i =3D 0; i < MAX_FIMC_CLOCKS; i++)
b71b56b264ae27 drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawroc=
ki 2013-01-29  798  		fimc->clock[i] =3D ERR_PTR(-EINVAL);
b71b56b264ae27 drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawroc=
ki 2013-01-29  799  =

6ec0163b7952ad drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-03-17  800  	for (i =3D 0; i < MAX_FIMC_CLOCKS; i++) {
a25be18dfb6e1b drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2010-12-27  801  		fimc->clock[i] =3D clk_get(&fimc->pdev->dev, fimc_clo=
cks[i]);
b71b56b264ae27 drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawroc=
ki 2013-01-29  802  		if (IS_ERR(fimc->clock[i])) {
b71b56b264ae27 drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawroc=
ki 2013-01-29 @803  			ret =3D PTR_ERR(fimc->clock[i]);
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  804  			goto err;
b71b56b264ae27 drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawroc=
ki 2013-01-29  805  		}
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  806  		ret =3D clk_prepare(fimc->clock[i]);
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  807  		if (ret < 0) {
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  808  			clk_put(fimc->clock[i]);
b71b56b264ae27 drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawroc=
ki 2013-01-29  809  			fimc->clock[i] =3D ERR_PTR(-EINVAL);
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  810  			goto err;
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  811  		}
5fd8f7388c9a86 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2010-08-03  812  	}
e9e21083ef9361 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2011-09-02  813  	return 0;
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  814  err:
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  815  	fimc_clk_put(fimc);
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  816  	dev_err(&fimc->pdev->dev, "failed to get clock: %s\n",
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  817  		fimc_clocks[i]);
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  818  	return -ENXIO;
e9e21083ef9361 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2011-09-02  819  }
e9e21083ef9361 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2011-09-02  820  =


:::::: The code at line 803 was first introduced by commit
:::::: b71b56b264ae27f32784973d15bfdfbc7df6d579 [media] s5p-fimc: Check ret=
urn value of clk_enable/clk_set_rate

:::::: TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5999079779694590933==--

