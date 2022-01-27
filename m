Content-Type: multipart/mixed; boundary="===============4018622514260117211=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 9389/9999] drivers/iio/proximity/sx9324.c:868:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 28 Jan 2022 07:03:06 +0800
Message-ID: <202201280706.xiAsK5Ap-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4018622514260117211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   1472d9d256d57131a6287ace2d69c22870cb3175
commit: 6ef1bc6ca5ca4fa1410098291e3d296e6a66bb8e [9389/9999] FROMLIST: iio:=
 sx9324: Add dt_binding support
:::::: branch date: 21 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20220124 (https://download.01.org/0day-ci/arc=
hive/20220128/202201280706.xiAsK5Ap-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f32dcc=
b9a43b02ce4e540d6ba5dbbdb188f2dc7d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 6ef1bc6ca5ca4fa1410098291e3d296e6a66bb8e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           regval =3D FIELD_GET(SX9324_REG_PROX_CTRL5_HYST_MASK, regval);
                    ^
   include/linux/bitfield.h:108:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:54:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
                   ^
   include/linux/build_bug.h:21:2: note: expanded from macro '__BUILD_BUG_O=
N_NOT_POWER_OF_2'
           BUILD_BUG_ON(((n) & ((n) - 1)) !=3D 0)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/iio/proximity/sx9324.c:524:11: note: Loop condition is false.  E=
xiting loop
           regval =3D FIELD_GET(SX9324_REG_PROX_CTRL5_HYST_MASK, regval);
                    ^
   include/linux/bitfield.h:108:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:54:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
                   ^
   include/linux/build_bug.h:21:2: note: expanded from macro '__BUILD_BUG_O=
N_NOT_POWER_OF_2'
           BUILD_BUG_ON(((n) & ((n) - 1)) !=3D 0)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
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
>> drivers/iio/proximity/sx9324.c:868:3: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D device_property_read_u32_array(dev, prop, pin_de=
fs,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9324.c:868:3: note: Value stored to 'ret' is nev=
er read
                   ret =3D device_property_read_u32_array(dev, prop, pin_de=
fs,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   8 warnings generated.
   include/linux/hid.h:1014:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-gyration.c:28:6: note: Assuming the condition is false
           if ((usage->hid & HID_USAGE_PAGE) !=3D HID_UP_LOGIVENDOR)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-gyration.c:28:2: note: Taking false branch
           if ((usage->hid & HID_USAGE_PAGE) !=3D HID_UP_LOGIVENDOR)
           ^
   drivers/hid/hid-gyration.c:32:2: note: Control jumps to 'case 70:'  at l=
ine 37
           switch (usage->hid & HID_USAGE) {
           ^
   drivers/hid/hid-gyration.c:37:14: note: Calling 'hid_map_usage_clear'
           case 0x046: gy_map_key_clear(KEY_MEDIA);        break;
                       ^
   drivers/hid/hid-gyration.c:22:29: note: expanded from macro 'gy_map_key_=
clear'
   #define gy_map_key_clear(c)     hid_map_usage_clear(hi, usage, bit, max,=
 \
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/hid.h:1035:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:989:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:993:2: note: Control jumps to 'case 1:'  at line 1002
           switch (type) {
           ^
   include/linux/hid.h:1005:3: note:  Execution continues on line 1012
                   break;
                   ^
   include/linux/hid.h:1012:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1012:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1012:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1012:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1012:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1013:3: note: Assuming the condition is true
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
   include/linux/hid.h:1013:3: note: Taking true branch
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
   include/linux/hid.h:1014:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:528:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)

vim +/ret +868 drivers/iio/proximity/sx9324.c

9aeaa4f779fcbd Gwendal Grignou 2022-01-01  843  =

6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  844  static const struct sx_comm=
on_reg_default *
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  845  sx9324_get_default_reg(stru=
ct device *dev, int idx,
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  846  		       struct sx_common_r=
eg_default *reg_def)
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  847  {
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  848  #define SX9324_PIN_DEF "sem=
tech,ph0-pin"
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  849  #define SX9324_RESOLUTION_D=
EF "semtech,ph01-resolution"
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  850  #define SX9324_PROXRAW_DEF =
"semtech,ph01-proxraw-strength"
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  851  	unsigned int pin_defs[SX93=
24_NUM_PINS];
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  852  	char prop[] =3D SX9324_PRO=
XRAW_DEF;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  853  	u32 start =3D 0, raw =3D 0=
, pos =3D 0;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  854  	int ret, count, ph, pin;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  855  =

6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  856  	memcpy(reg_def, &sx9324_de=
fault_regs[idx], sizeof(*reg_def));
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  857  	switch (reg_def->reg) {
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  858  	case SX9324_REG_AFE_PH0:
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  859  	case SX9324_REG_AFE_PH1:
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  860  	case SX9324_REG_AFE_PH2:
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  861  	case SX9324_REG_AFE_PH3:
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  862  		ph =3D reg_def->reg - SX9=
324_REG_AFE_PH0;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  863  		scnprintf(prop, ARRAY_SIZ=
E(prop), "semtech,ph%d-pin", ph);
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  864  =

6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  865  		count =3D device_property=
_count_u32(dev, prop);
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  866  		if (count !=3D ARRAY_SIZE=
(pin_defs))
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  867  			break;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01 @868  		ret =3D device_property_r=
ead_u32_array(dev, prop, pin_defs,
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  869  						     ARRAY_SIZE(pin_d=
efs));
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  870  		for (pin =3D 0; pin < SX9=
324_NUM_PINS; pin++)
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  871  			raw |=3D (pin_defs[pin] =
<< (2 * pin)) &
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  872  			       SX9324_REG_AFE_PH=
0_PIN_MASK(pin);
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  873  		reg_def->def =3D raw;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  874  		break;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  875  	case SX9324_REG_AFE_CTRL4:
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  876  	case SX9324_REG_AFE_CTRL7:
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  877  		if (reg_def->reg =3D=3D S=
X9324_REG_AFE_CTRL4)
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  878  			strncpy(prop, "semtech,p=
h01-resolution",
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  879  				ARRAY_SIZE(prop));
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  880  		else
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  881  			strncpy(prop, "semtech,p=
h23-resolution",
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  882  				ARRAY_SIZE(prop));
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  883  =

6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  884  		ret =3D device_property_r=
ead_u32(dev, prop, &raw);
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  885  		if (ret)
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  886  			break;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  887  =

6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  888  		raw =3D ilog2(raw) - 3;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  889  =

6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  890  		reg_def->def &=3D ~SX9324=
_REG_AFE_CTRL4_RESOLUTION_MASK;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  891  		reg_def->def |=3D FIELD_P=
REP(SX9324_REG_AFE_CTRL4_RESOLUTION_MASK,
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  892  					   raw);
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  893  		break;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  894  	case SX9324_REG_ADV_CTRL5:
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  895  		ret =3D device_property_r=
ead_u32(dev, "semtech,startup-sensor",
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  896  					       &start);
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  897  		if (ret)
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  898  			break;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  899  =

6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  900  		reg_def->def &=3D ~SX9324=
_REG_ADV_CTRL5_STARTUPSENS_MASK;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  901  		reg_def->def |=3D FIELD_P=
REP(SX9324_REG_ADV_CTRL5_STARTUPSENS_MASK,
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  902  					   start);
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  903  		break;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  904  	case SX9324_REG_PROX_CTRL4:
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  905  		ret =3D device_property_r=
ead_u32(dev, "semtech,avg-pos-strength",
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  906  					       &pos);
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  907  		if (ret)
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  908  			break;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  909  =

6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  910  		/* Powers of 2, except fo=
r a gap between 16 and 64 */
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  911  		raw =3D clamp(ilog2(pos),=
 3, 11) - (pos >=3D 32 ? 4 : 3);
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  912  =

6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  913  		reg_def->def &=3D ~SX9324=
_REG_PROX_CTRL4_AVGPOSFILT_MASK;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  914  		reg_def->def |=3D FIELD_P=
REP(SX9324_REG_PROX_CTRL4_AVGPOSFILT_MASK,
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  915  					   raw);
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  916  		break;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  917  	case SX9324_REG_PROX_CTRL0:
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  918  	case SX9324_REG_PROX_CTRL1:
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  919  		if (reg_def->reg =3D=3D S=
X9324_REG_PROX_CTRL0)
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  920  			strncpy(prop, "semtech,p=
h01-proxraw-strength",
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  921  				ARRAY_SIZE(prop));
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  922  		else
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  923  			strncpy(prop, "semtech,p=
h23-proxraw-strength",
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  924  				ARRAY_SIZE(prop));
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  925  		ret =3D device_property_r=
ead_u32(dev, prop, &raw);
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  926  		if (ret)
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  927  			break;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  928  =

6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  929  		reg_def->def &=3D ~SX9324=
_REG_PROX_CTRL0_RAWFILT_MASK;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  930  		reg_def->def |=3D FIELD_P=
REP(SX9324_REG_PROX_CTRL0_RAWFILT_MASK,
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  931  					   raw);
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  932  		break;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  933  	}
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  934  	return reg_def;
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  935  }
6ef1bc6ca5ca4f Gwendal Grignou 2022-01-01  936  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4018622514260117211==--

