Content-Type: multipart/mixed; boundary="===============0862585930828562604=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/ov8856.c:1718:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 25 May 2022 02:57:39 +0800
Message-ID: <202205250232.xYcZ8A2C-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0862585930828562604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Shawn Tu <shawnx.tu@intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   143a6252e1b8ab424b4b293512a97cca7295c182
commit: c19b93a69c8ea6d672b786d1e130e9b4260b4e71 media: ov8856: add vflip/h=
flip control support
date:   12 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220524 (https://download.01.org/0day-ci/archi=
ve/20220525/202205250232.xYcZ8A2C-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ec=
ce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc19b93a69c8ea6d672b786d1e130e9b4260b4e71
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c19b93a69c8ea6d672b786d1e130e9b4260b4e71
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           if (ret < 0)
                           ^
   drivers/iio/light/adux1020.c:380:10: note: Calling 'adux1020_measure'
                           ret =3D adux1020_measure(data, ADUX1020_MODE_PRO=
X_I, buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/light/adux1020.c:320:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:320:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:327:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:327:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:330:2: note: Loop condition is true.  Enter=
ing loop body
           while (tries--) {
           ^
   drivers/iio/light/adux1020.c:333:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/iio/light/adux1020.c:333:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/iio/light/adux1020.c:337:7: note: Assuming 'status' is >=3D fiel=
d 'bytes'
                   if (status >=3D adux1020_modes[mode].bytes)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/adux1020.c:337:3: note: Taking true branch
                   if (status >=3D adux1020_modes[mode].bytes)
                   ^
   drivers/iio/light/adux1020.c:338:4: note:  Execution continues on line 3=
42
                           break;
                           ^
   drivers/iio/light/adux1020.c:342:6: note: 'tries' is >=3D 0
           if (tries < 0)
               ^~~~~
   drivers/iio/light/adux1020.c:342:2: note: Taking false branch
           if (tries < 0)
           ^
   drivers/iio/light/adux1020.c:345:8: note: Calling 'adux1020_read_fifo'
           ret =3D adux1020_read_fifo(data, val, adux1020_modes[mode].buf_l=
en);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/adux1020.c:260:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:260:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:263:14: note: Assuming 'i' is >=3D 'buf_len'
           for (i =3D 0; i < buf_len; i++) {
                       ^~~~~~~~~~~
   drivers/iio/light/adux1020.c:263:2: note: Loop condition is false. Execu=
tion continues on line 273
           for (i =3D 0; i < buf_len; i++) {
           ^
   drivers/iio/light/adux1020.c:273:2: note: Returning without writing to '=
*buf'
           return regmap_write(data->regmap, ADUX1020_REG_TEST_MODES_3,
           ^
   drivers/iio/light/adux1020.c:345:8: note: Returning from 'adux1020_read_=
fifo'
           ret =3D adux1020_read_fifo(data, val, adux1020_modes[mode].buf_l=
en);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/adux1020.c:346:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:346:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:352:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:352:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:356:2: note: Returning without writing to '=
*val'
           return regmap_update_bits(data->regmap, ADUX1020_REG_INT_MASK,
           ^
   drivers/iio/light/adux1020.c:380:10: note: Returning from 'adux1020_meas=
ure'
                           ret =3D adux1020_measure(data, ADUX1020_MODE_PRO=
X_I, buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/light/adux1020.c:381:8: note: Assuming 'ret' is >=3D 0
                           if (ret < 0)
                               ^~~~~~~
   drivers/iio/light/adux1020.c:381:4: note: Taking false branch
                           if (ret < 0)
                           ^
   drivers/iio/light/adux1020.c:384:9: note: Assigned value is garbage or u=
ndefined
                           *val =3D buf[0];
                                ^ ~~~~~~
   2 warnings generated.
   drivers/media/i2c/ov772x.c:583:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov772x.c:583:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   4 warnings generated.
>> drivers/media/i2c/ov8856.c:1718:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_1,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1718:2: note: Value stored to 'ret' is never =
read
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_1,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1730:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_2,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1730:2: note: Value stored to 'ret' is never =
read
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_2,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1740:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_3,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1740:2: note: Value stored to 'ret' is never =
read
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_3,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/rtc/rtc-ds3232.c:380:17: warning: Value stored to 'ds3232' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ds3232 *ds3232 =3D dev_get_drvdata(dev);
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-ds3232.c:380:17: note: Value stored to 'ds3232' during i=
ts initialization is never read
           struct ds3232 *ds3232 =3D dev_get_drvdata(dev);
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/hwmon/pmbus/pmbus_core.c:795:41: warning: The result of the left=
 shift is undefined because the left operand is negative [clang-analyzer-co=
re.UndefinedBinaryOperatorResult]
           return (mantissa & 0x7ff) | ((exponent << 11) & 0xf800);
                                         ~~~~~~~~ ^
   drivers/hwmon/pmbus/pmbus_core.c:740:6: note: Assuming 'val' is not equa=
l to 0
           if (val =3D=3D 0)
               ^~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:740:2: note: Taking false branch
           if (val =3D=3D 0)
           ^
   drivers/hwmon/pmbus/pmbus_core.c:743:6: note: Assuming field 'class' is =
not equal to PSC_VOLTAGE_OUT
           if (sensor->class =3D=3D PSC_VOLTAGE_OUT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:743:2: note: Taking false branch
           if (sensor->class =3D=3D PSC_VOLTAGE_OUT) {
           ^
   drivers/hwmon/pmbus/pmbus_core.c:760:6: note: Assuming 'val' is >=3D 0
           if (val < 0) {
               ^~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:760:2: note: Taking false branch
           if (val < 0) {
           ^
   drivers/hwmon/pmbus/pmbus_core.c:766:6: note: Assuming field 'class' is =
not equal to PSC_POWER
           if (sensor->class =3D=3D PSC_POWER)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:766:2: note: Taking false branch
           if (sensor->class =3D=3D PSC_POWER)
           ^
   drivers/hwmon/pmbus/pmbus_core.c:773:6: note: Assuming field 'class' is =
not equal to PSC_FAN
           if (sensor->class =3D=3D PSC_FAN)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:773:2: note: Taking false branch
           if (sensor->class =3D=3D PSC_FAN)
           ^
   drivers/hwmon/pmbus/pmbus_core.c:777:9: note: Assuming the condition is =
false
           while (val >=3D MAX_MANTISSA && exponent < 15) {
                  ^~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:777:29: note: Left side of '&&' is false
           while (val >=3D MAX_MANTISSA && exponent < 15) {
                                      ^
   drivers/hwmon/pmbus/pmbus_core.c:782:9: note: Assuming the condition is =
true
           while (val < MIN_MANTISSA && exponent > -15) {
                  ^~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:782:9: note: Left side of '&&' is true
   drivers/hwmon/pmbus/pmbus_core.c:782:2: note: Loop condition is true.  E=
ntering loop body
           while (val < MIN_MANTISSA && exponent > -15) {
           ^
   drivers/hwmon/pmbus/pmbus_core.c:783:3: note: The value -1 is assigned t=
o 'exponent'
                   exponent--;
                   ^~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:782:9: note: Assuming the condition is =
false
           while (val < MIN_MANTISSA && exponent > -15) {
                  ^~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:782:28: note: Left side of '&&' is false
           while (val < MIN_MANTISSA && exponent > -15) {
                                     ^
   drivers/hwmon/pmbus/pmbus_core.c:788:23: note: Left side of '&&' is false
           mantissa =3D clamp_val(DIV_ROUND_CLOSEST_ULL(val, 1000), 0, 0x3f=
f);
                                ^
   include/linux/math.h:104:2: note: expanded from macro 'DIV_ROUND_CLOSEST=
_ULL'
           do_div(_tmp, __d);                              \
           ^
   include/asm-generic/div64.h:229:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/hwmon/pmbus/pmbus_core.c:788:23: note: 4 is >=3D 4
           mantissa =3D clamp_val(DIV_ROUND_CLOSEST_ULL(val, 1000), 0, 0x3f=
f);
                                ^
   include/linux/math.h:104:2: note: expanded from macro 'DIV_ROUND_CLOSEST=
_ULL'
           do_div(_tmp, __d);                              \
           ^~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:233:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/div64.h:64:32: note: expanded from macro '__div64_c=
onst32_is_OK'

vim +/ret +1718 drivers/media/i2c/ov8856.c

c19b93a69c8ea6 Shawn Tu 2021-04-16  1707  =

c19b93a69c8ea6 Shawn Tu 2021-04-16  1708  static int ov8856_set_ctrl_vflip(=
struct ov8856 *ov8856, u8 ctrl_val)
c19b93a69c8ea6 Shawn Tu 2021-04-16  1709  {
c19b93a69c8ea6 Shawn Tu 2021-04-16  1710  	int ret;
c19b93a69c8ea6 Shawn Tu 2021-04-16  1711  	u32 val;
c19b93a69c8ea6 Shawn Tu 2021-04-16  1712  =

c19b93a69c8ea6 Shawn Tu 2021-04-16  1713  	ret =3D ov8856_read_reg(ov8856, =
OV8856_REG_FLIP_OPT_1,
c19b93a69c8ea6 Shawn Tu 2021-04-16  1714  			      OV8856_REG_VALUE_08BIT, =
&val);
c19b93a69c8ea6 Shawn Tu 2021-04-16  1715  	if (ret)
c19b93a69c8ea6 Shawn Tu 2021-04-16  1716  		return ret;
c19b93a69c8ea6 Shawn Tu 2021-04-16  1717  =

c19b93a69c8ea6 Shawn Tu 2021-04-16 @1718  	ret =3D ov8856_write_reg(ov8856,=
 OV8856_REG_FLIP_OPT_1,
c19b93a69c8ea6 Shawn Tu 2021-04-16  1719  			       OV8856_REG_VALUE_08BIT,
c19b93a69c8ea6 Shawn Tu 2021-04-16  1720  			       ctrl_val ? val | OV8856=
_REG_FLIP_OP_1 |
c19b93a69c8ea6 Shawn Tu 2021-04-16  1721  			       OV8856_REG_FLIP_OP_2 :
c19b93a69c8ea6 Shawn Tu 2021-04-16  1722  			       val & ~OV8856_REG_FLIP_=
OP_1 &
c19b93a69c8ea6 Shawn Tu 2021-04-16  1723  			       ~OV8856_REG_FLIP_OP_2);
c19b93a69c8ea6 Shawn Tu 2021-04-16  1724  =

c19b93a69c8ea6 Shawn Tu 2021-04-16  1725  	ret =3D ov8856_read_reg(ov8856, =
OV8856_REG_FLIP_OPT_2,
c19b93a69c8ea6 Shawn Tu 2021-04-16  1726  			      OV8856_REG_VALUE_08BIT, =
&val);
c19b93a69c8ea6 Shawn Tu 2021-04-16  1727  	if (ret)
c19b93a69c8ea6 Shawn Tu 2021-04-16  1728  		return ret;
c19b93a69c8ea6 Shawn Tu 2021-04-16  1729  =

c19b93a69c8ea6 Shawn Tu 2021-04-16  1730  	ret =3D ov8856_write_reg(ov8856,=
 OV8856_REG_FLIP_OPT_2,
c19b93a69c8ea6 Shawn Tu 2021-04-16  1731  			       OV8856_REG_VALUE_08BIT,
c19b93a69c8ea6 Shawn Tu 2021-04-16  1732  			       ctrl_val ? val | OV8856=
_REG_FLIP_OP_2 :
c19b93a69c8ea6 Shawn Tu 2021-04-16  1733  			       val & ~OV8856_REG_FLIP_=
OP_2);
c19b93a69c8ea6 Shawn Tu 2021-04-16  1734  =

c19b93a69c8ea6 Shawn Tu 2021-04-16  1735  	ret =3D ov8856_read_reg(ov8856, =
OV8856_REG_FLIP_OPT_3,
c19b93a69c8ea6 Shawn Tu 2021-04-16  1736  			      OV8856_REG_VALUE_08BIT, =
&val);
c19b93a69c8ea6 Shawn Tu 2021-04-16  1737  	if (ret)
c19b93a69c8ea6 Shawn Tu 2021-04-16  1738  		return ret;
c19b93a69c8ea6 Shawn Tu 2021-04-16  1739  =

c19b93a69c8ea6 Shawn Tu 2021-04-16  1740  	ret =3D ov8856_write_reg(ov8856,=
 OV8856_REG_FLIP_OPT_3,
c19b93a69c8ea6 Shawn Tu 2021-04-16  1741  			       OV8856_REG_VALUE_08BIT,
c19b93a69c8ea6 Shawn Tu 2021-04-16  1742  			       ctrl_val ? val & ~OV885=
6_REG_FLIP_OP_0 &
c19b93a69c8ea6 Shawn Tu 2021-04-16  1743  			       ~OV8856_REG_FLIP_OP_1 :
c19b93a69c8ea6 Shawn Tu 2021-04-16  1744  			       val | OV8856_REG_FLIP_O=
P_0 |
c19b93a69c8ea6 Shawn Tu 2021-04-16  1745  			       OV8856_REG_FLIP_OP_1);
c19b93a69c8ea6 Shawn Tu 2021-04-16  1746  =

c19b93a69c8ea6 Shawn Tu 2021-04-16  1747  	ret =3D ov8856_read_reg(ov8856, =
OV8856_REG_FORMAT1,
c19b93a69c8ea6 Shawn Tu 2021-04-16  1748  			      OV8856_REG_VALUE_08BIT, =
&val);
c19b93a69c8ea6 Shawn Tu 2021-04-16  1749  	if (ret)
c19b93a69c8ea6 Shawn Tu 2021-04-16  1750  		return ret;
c19b93a69c8ea6 Shawn Tu 2021-04-16  1751  =

c19b93a69c8ea6 Shawn Tu 2021-04-16  1752  	return ov8856_write_reg(ov8856, =
OV8856_REG_FORMAT1,
c19b93a69c8ea6 Shawn Tu 2021-04-16  1753  			       OV8856_REG_VALUE_08BIT,
c19b93a69c8ea6 Shawn Tu 2021-04-16  1754  			       ctrl_val ? val | OV8856=
_REG_FORMAT1_OP_1 |
c19b93a69c8ea6 Shawn Tu 2021-04-16  1755  			       OV8856_REG_FORMAT1_OP_3=
 |
c19b93a69c8ea6 Shawn Tu 2021-04-16  1756  			       OV8856_REG_FORMAT1_OP_2=
 :
c19b93a69c8ea6 Shawn Tu 2021-04-16  1757  			       val & ~OV8856_REG_FORMA=
T1_OP_1 &
c19b93a69c8ea6 Shawn Tu 2021-04-16  1758  			       ~OV8856_REG_FORMAT1_OP_=
3 &
c19b93a69c8ea6 Shawn Tu 2021-04-16  1759  			       ~OV8856_REG_FORMAT1_OP_=
2);
c19b93a69c8ea6 Shawn Tu 2021-04-16  1760  }
c19b93a69c8ea6 Shawn Tu 2021-04-16  1761  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0862585930828562604==--

