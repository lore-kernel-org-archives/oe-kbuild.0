Content-Type: multipart/mixed; boundary="===============4045925378849630870=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH] devres: better type safety with devm_*_action()
Date: Wed, 10 Mar 2021 19:17:24 +0800
Message-ID: <202103101945.RwCXyfFw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4045925378849630870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210309235917.2134565-1-linux@rasmusvillemoes.dk>
References: <20210309235917.2134565-1-linux@rasmusvillemoes.dk>
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Hi Rasmus,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on linux/master linus/master v5.12-rc2 next-202103=
09]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Rasmus-Villemoes/devres-be=
tter-type-safety-with-devm_-_action/20210310-080019
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.=
git a38fd8748464831584a19438cbb3082b5a2dab15
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-s021-20210309 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-262-g5e674421-dirty
        # https://github.com/0day-ci/linux/commit/663d41317b8fa291fc1c82100=
b3e2526627ab4d4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Rasmus-Villemoes/devres-better-typ=
e-safety-with-devm_-_action/20210310-080019
        git checkout 663d41317b8fa291fc1c82100b3e2526627ab4d4
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/net/phy/sfp.c: note: in included file (through include/linux/acp=
i.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/net/phy/sfp.c:2455:15: sparse: sparse: arithmetics on pointers t=
o functions
>> drivers/net/phy/sfp.c:2455:15: sparse: sparse: arithmetics on pointers t=
o functions
>> drivers/net/phy/sfp.c:2455:15: sparse: sparse: static assertion failed: =
"__same_type(sfp_cleanup + 0, void (*)(void *)) || __same_type(sfp_cleanup =
+ 0, void (*)(typeof(sfp)))"
--
   drivers/power/supply/cros_usbpd-charger.c: note: in included file (throu=
gh include/linux/platform_data/cros_ec_proto.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/power/supply/cros_usbpd-charger.c:675:23: sparse: sparse: arithm=
etics on pointers to functions
>> drivers/power/supply/cros_usbpd-charger.c:675:23: sparse: sparse: arithm=
etics on pointers to functions
>> drivers/power/supply/cros_usbpd-charger.c:675:23: sparse: sparse: static=
 assertion failed: "__same_type(cros_usbpd_charger_unregister_notifier + 0,=
 void (*)(void *)) || __same_type(cros_usbpd_charger_unregister_notifier + =
0, void (*)(typeof(charger)))"
--
   drivers/power/supply/power_supply_hwmon.c: note: in included file (throu=
gh include/linux/power_supply.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/power/supply/power_supply_hwmon.c:359:15: sparse: sparse: arithm=
etics on pointers to functions
>> drivers/power/supply/power_supply_hwmon.c:359:15: sparse: sparse: arithm=
etics on pointers to functions
>> drivers/power/supply/power_supply_hwmon.c:359:15: sparse: sparse: static=
 assertion failed: "__same_type(power_supply_hwmon_bitmap_free + 0, void (*=
)(void *)) || __same_type(power_supply_hwmon_bitmap_free + 0, void (*)(type=
of(psyhw->props)))"
--
   drivers/power/supply/max17042_battery.c: note: in included file (through=
 include/linux/acpi.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/power/supply/max17042_battery.c:1139:23: sparse: sparse: arithme=
tics on pointers to functions
>> drivers/power/supply/max17042_battery.c:1139:23: sparse: sparse: arithme=
tics on pointers to functions
>> drivers/power/supply/max17042_battery.c:1139:23: sparse: sparse: static =
assertion failed: "__same_type(max17042_stop_work + 0, void (*)(void *)) ||=
 __same_type(max17042_stop_work + 0, void (*)(typeof(chip)))"
--
   drivers/power/supply/mp2629_charger.c: note: in included file (through i=
nclude/linux/mfd/mp2629.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/power/supply/mp2629_charger.c:607:15: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/power/supply/mp2629_charger.c:607:15: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/power/supply/mp2629_charger.c:607:15: sparse: sparse: static ass=
ertion failed: "__same_type(mp2629_charger_disable + 0, void (*)(void *)) |=
| __same_type(mp2629_charger_disable + 0, void (*)(typeof(charger)))"
--
   drivers/rtc/class.c: note: in included file (through include/linux/rtc.h=
):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/rtc/class.c:368:15: sparse: sparse: arithmetics on pointers to f=
unctions
>> drivers/rtc/class.c:368:15: sparse: sparse: arithmetics on pointers to f=
unctions
>> drivers/rtc/class.c:368:15: sparse: sparse: static assertion failed: "__=
same_type(devm_rtc_release_device + 0, void (*)(void *)) || __same_type(dev=
m_rtc_release_device + 0, void (*)(typeof(rtc)))"
   drivers/rtc/class.c:417:16: sparse: sparse: arithmetics on pointers to f=
unctions
   drivers/rtc/class.c:417:16: sparse: sparse: arithmetics on pointers to f=
unctions
>> drivers/rtc/class.c:417:16: sparse: sparse: static assertion failed: "__=
same_type(devm_rtc_unregister_device + 0, void (*)(void *)) || __same_type(=
devm_rtc_unregister_device + 0, void (*)(typeof(rtc)))"
--
   drivers/rtc/rtc-ds2404.c: note: in included file (through include/linux/=
platform_device.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/rtc/rtc-ds2404.c:224:18: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/rtc/rtc-ds2404.c:224:18: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/rtc/rtc-ds2404.c:224:18: sparse: sparse: static assertion failed=
: "__same_type(ds2404_gpio_unmap + 0, void (*)(void *)) || __same_type(ds24=
04_gpio_unmap + 0, void (*)(typeof(chip)))"
--
   drivers/leds/leds-tps6105x.c: note: in included file (through include/li=
nux/leds.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/leds/leds-tps6105x.c:56:15: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/leds/leds-tps6105x.c:56:15: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/leds/leds-tps6105x.c:56:15: sparse: sparse: static assertion fai=
led: "__same_type(tps6105x_handle_put + 0, void (*)(void *)) || __same_type=
(tps6105x_handle_put + 0, void (*)(typeof(priv)))"
--
   drivers/staging/iio/impedance-analyzer/ad5933.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/staging/iio/impedance-analyzer/ad5933.c:722:15: sparse: sparse: =
arithmetics on pointers to functions
>> drivers/staging/iio/impedance-analyzer/ad5933.c:722:15: sparse: sparse: =
arithmetics on pointers to functions
>> drivers/staging/iio/impedance-analyzer/ad5933.c:722:15: sparse: sparse: =
static assertion failed: "__same_type(ad5933_reg_disable + 0, void (*)(void=
 *)) || __same_type(ad5933_reg_disable + 0, void (*)(typeof(st)))"
   drivers/staging/iio/impedance-analyzer/ad5933.c:741:23: sparse: sparse: =
arithmetics on pointers to functions
   drivers/staging/iio/impedance-analyzer/ad5933.c:741:23: sparse: sparse: =
arithmetics on pointers to functions
>> drivers/staging/iio/impedance-analyzer/ad5933.c:741:23: sparse: sparse: =
static assertion failed: "__same_type(ad5933_clk_disable + 0, void (*)(void=
 *)) || __same_type(ad5933_clk_disable + 0, void (*)(typeof(st)))"
--
   drivers/platform/chrome/cros_ec_sensorhub.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/platform/chrome/cros_ec_sensorhub.c:44:16: sparse: sparse: arith=
metics on pointers to functions
>> drivers/platform/chrome/cros_ec_sensorhub.c:44:16: sparse: sparse: arith=
metics on pointers to functions
>> drivers/platform/chrome/cros_ec_sensorhub.c:44:16: sparse: sparse: stati=
c assertion failed: "__same_type(cros_ec_sensorhub_free_sensor + 0, void (*=
)(void *)) || __same_type(cros_ec_sensorhub_free_sensor + 0, void (*)(typeo=
f(pdev)))"
   drivers/platform/chrome/cros_ec_sensorhub.c:196:32: sparse: sparse: arit=
hmetics on pointers to functions
   drivers/platform/chrome/cros_ec_sensorhub.c:196:32: sparse: sparse: arit=
hmetics on pointers to functions
>> drivers/platform/chrome/cros_ec_sensorhub.c:196:32: sparse: sparse: stat=
ic assertion failed: "__same_type(cros_ec_sensorhub_ring_remove + 0, void (=
*)(void *)) || __same_type(cros_ec_sensorhub_ring_remove + 0, void (*)(type=
of(data)))"
--
   drivers/remoteproc/remoteproc_core.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/remoteproc/remoteproc_core.c:2129:16: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/remoteproc/remoteproc_core.c:2129:16: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/remoteproc/remoteproc_core.c:2129:16: sparse: sparse: static ass=
ertion failed: "__same_type(devm_rproc_remove + 0, void (*)(void *)) || __s=
ame_type(devm_rproc_remove + 0, void (*)(typeof(rproc)))"
--
   drivers/iio/accel/kxcjk-1013.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/accel/kxcjk-1013.c:1354:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/iio/accel/kxcjk-1013.c:1354:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/iio/accel/kxcjk-1013.c:1354:15: sparse: sparse: static assertion=
 failed: "__same_type(kxcjk1013_disable_regulators + 0, void (*)(void *)) |=
| __same_type(kxcjk1013_disable_regulators + 0, void (*)(typeof(data)))"
--
   drivers/iio/adc/ad7606.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/adc/ad7606.c:601:15: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/iio/adc/ad7606.c:601:15: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/iio/adc/ad7606.c:601:15: sparse: sparse: static assertion failed=
: "__same_type(ad7606_regulator_disable + 0, void (*)(void *)) || __same_ty=
pe(ad7606_regulator_disable + 0, void (*)(typeof(st)))"
--
   drivers/iio/adc/xilinx-xadc-core.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/adc/xilinx-xadc-core.c:1380:15: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/iio/adc/xilinx-xadc-core.c:1380:15: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/iio/adc/xilinx-xadc-core.c:1380:15: sparse: sparse: static asser=
tion failed: "__same_type(xadc_clk_disable_unprepare + 0, void (*)(void *))=
 || __same_type(xadc_clk_disable_unprepare + 0, void (*)(typeof(xadc->clk))=
)"
   drivers/iio/adc/xilinx-xadc-core.c:1406:15: sparse: sparse: arithmetics =
on pointers to functions
   drivers/iio/adc/xilinx-xadc-core.c:1406:15: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/iio/adc/xilinx-xadc-core.c:1406:15: sparse: sparse: static asser=
tion failed: "__same_type(xadc_cancel_delayed_work + 0, void (*)(void *)) |=
| __same_type(xadc_cancel_delayed_work + 0, void (*)(typeof(&xadc->zynq_unm=
ask_work)))"
--
   drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c: note: in incl=
uded file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c:352:31: sparse=
: sparse: arithmetics on pointers to functions
>> drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c:352:31: sparse=
: sparse: arithmetics on pointers to functions
>> drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c:352:31: sparse=
: sparse: static assertion failed: "__same_type(cros_ec_sensors_core_clean =
+ 0, void (*)(void *)) || __same_type(cros_ec_sensors_core_clean + 0, void =
(*)(typeof(pdev)))"
--
   drivers/iio/gyro/bmg160_core.c: note: in included file (through include/=
linux/acpi.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/gyro/bmg160_core.c:1101:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/iio/gyro/bmg160_core.c:1101:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/iio/gyro/bmg160_core.c:1101:15: sparse: sparse: static assertion=
 failed: "__same_type(bmg160_disable_regulators + 0, void (*)(void *)) || _=
_same_type(bmg160_disable_regulators + 0, void (*)(typeof(data)))"
--
   drivers/hwmon/aspeed-pwm-tacho.c: note: in included file (through includ=
e/linux/hwmon-sysfs.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/aspeed-pwm-tacho.c:920:15: sparse: sparse: arithmetics on =
pointers to functions
>> drivers/hwmon/aspeed-pwm-tacho.c:920:15: sparse: sparse: arithmetics on =
pointers to functions
>> drivers/hwmon/aspeed-pwm-tacho.c:920:15: sparse: sparse: static assertio=
n failed: "__same_type(aspeed_pwm_tacho_remove + 0, void (*)(void *)) || __=
same_type(aspeed_pwm_tacho_remove + 0, void (*)(typeof(priv)))"
--
   drivers/hwmon/max31730.c: note: in included file (through include/linux/=
acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/max31730.c:337:15: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/hwmon/max31730.c:337:15: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/hwmon/max31730.c:337:15: sparse: sparse: static assertion failed=
: "__same_type(max31730_remove + 0, void (*)(void *)) || __same_type(max317=
30_remove + 0, void (*)(typeof(data)))"
--
   drivers/hwmon/tmp102.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/tmp102.c:231:15: sparse: sparse: arithmetics on pointers t=
o functions
>> drivers/hwmon/tmp102.c:231:15: sparse: sparse: arithmetics on pointers t=
o functions
>> drivers/hwmon/tmp102.c:231:15: sparse: sparse: static assertion failed: =
"__same_type(tmp102_restore_config + 0, void (*)(void *)) || __same_type(tm=
p102_restore_config + 0, void (*)(typeof(tmp102)))"
--
   drivers/hwmon/tmp108.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/tmp108.c:380:15: sparse: sparse: arithmetics on pointers t=
o functions
>> drivers/hwmon/tmp108.c:380:15: sparse: sparse: arithmetics on pointers t=
o functions
>> drivers/hwmon/tmp108.c:380:15: sparse: sparse: static assertion failed: =
"__same_type(tmp108_restore_config + 0, void (*)(void *)) || __same_type(tm=
p108_restore_config + 0, void (*)(typeof(tmp108)))"
--
   drivers/iio/imu/bmi160/bmi160_core.c: note: in included file (through in=
clude/linux/acpi.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/imu/bmi160/bmi160_core.c:863:15: sparse: sparse: arithmetics=
 on pointers to functions
>> drivers/iio/imu/bmi160/bmi160_core.c:863:15: sparse: sparse: arithmetics=
 on pointers to functions
>> drivers/iio/imu/bmi160/bmi160_core.c:863:15: sparse: sparse: static asse=
rtion failed: "__same_type(bmi160_chip_uninit + 0, void (*)(void *)) || __s=
ame_type(bmi160_chip_uninit + 0, void (*)(typeof(data)))"
--
   drivers/iio/light/al3010.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/light/al3010.c:194:15: sparse: sparse: arithmetics on pointe=
rs to functions
>> drivers/iio/light/al3010.c:194:15: sparse: sparse: arithmetics on pointe=
rs to functions
>> drivers/iio/light/al3010.c:194:15: sparse: sparse: static assertion fail=
ed: "__same_type(al3010_set_pwr_off + 0, void (*)(void *)) || __same_type(a=
l3010_set_pwr_off + 0, void (*)(typeof(data)))"
--
   drivers/iio/light/iqs621-als.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/light/iqs621-als.c:598:15: sparse: sparse: arithmetics on po=
inters to functions
>> drivers/iio/light/iqs621-als.c:598:15: sparse: sparse: arithmetics on po=
inters to functions
>> drivers/iio/light/iqs621-als.c:598:15: sparse: sparse: static assertion =
failed: "__same_type(iqs621_als_notifier_unregister + 0, void (*)(void *)) =
|| __same_type(iqs621_als_notifier_unregister + 0, void (*)(typeof(iqs621_a=
ls)))"
--
   drivers/iio/pressure/bmp280-core.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/pressure/bmp280-core.c:1057:15: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/iio/pressure/bmp280-core.c:1057:15: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/iio/pressure/bmp280-core.c:1057:15: sparse: sparse: static asser=
tion failed: "__same_type(bmp280_regulators_disable + 0, void (*)(void *)) =
|| __same_type(bmp280_regulators_disable + 0, void (*)(typeof(data->supplie=
s)))"
   drivers/iio/pressure/bmp280-core.c:1133:15: sparse: sparse: arithmetics =
on pointers to functions
   drivers/iio/pressure/bmp280-core.c:1133:15: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/iio/pressure/bmp280-core.c:1133:15: sparse: sparse: static asser=
tion failed: "__same_type(bmp280_pm_disable + 0, void (*)(void *)) || __sam=
e_type(bmp280_pm_disable + 0, void (*)(typeof(dev)))"
--
   drivers/iio/pressure/icp10100.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/pressure/icp10100.c:568:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/iio/pressure/icp10100.c:568:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/iio/pressure/icp10100.c:568:15: sparse: sparse: static assertion=
 failed: "__same_type(icp10100_disable_regulator_action + 0, void (*)(void =
*)) || __same_type(icp10100_disable_regulator_action + 0, void (*)(typeof(s=
t)))"
   drivers/iio/pressure/icp10100.c:589:15: sparse: sparse: arithmetics on p=
ointers to functions
   drivers/iio/pressure/icp10100.c:589:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/iio/pressure/icp10100.c:589:15: sparse: sparse: static assertion=
 failed: "__same_type(icp10100_pm_disable + 0, void (*)(void *)) || __same_=
type(icp10100_pm_disable + 0, void (*)(typeof(&client->dev)))"
--
   drivers/tty/serial/sccnxp.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/tty/serial/sccnxp.c:927:23: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/tty/serial/sccnxp.c:927:23: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/tty/serial/sccnxp.c:927:23: sparse: sparse: static assertion fai=
led: "__same_type((void(*)(void *))clk_disable_unprepare + 0, void (*)(void=
 *)) || __same_type((void(*)(void *))clk_disable_unprepare + 0, void (*)(ty=
peof(clk)))"
--
   drivers/char/tpm/tpm-chip.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/tpm.h, include/linux/tpm_eventlog.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/char/tpm/tpm-chip.c:422:14: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/char/tpm/tpm-chip.c:422:14: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/char/tpm/tpm-chip.c:422:14: sparse: sparse: static assertion fai=
led: "__same_type((void (*)(void *)) put_device + 0, void (*)(void *)) || _=
_same_type((void (*)(void *)) put_device + 0, void (*)(typeof(&chip->dev)))"
--
   fs/fuse/virtio_fs.c: note: in included file (through include/linux/pci.h=
):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> fs/fuse/virtio_fs.c:856:16: sparse: sparse: arithmetics on pointers to f=
unctions
>> fs/fuse/virtio_fs.c:856:16: sparse: sparse: arithmetics on pointers to f=
unctions
>> fs/fuse/virtio_fs.c:856:16: sparse: sparse: static assertion failed: "__=
same_type(virtio_fs_cleanup_dax + 0, void (*)(void *)) || __same_type(virti=
o_fs_cleanup_dax + 0, void (*)(typeof(fs->dax_dev)))"

vim +2455 drivers/net/phy/sfp.c

73970055450eeb Russell King   2017-07-25  2440  =

73970055450eeb Russell King   2017-07-25  2441  static int sfp_probe(struct=
 platform_device *pdev)
73970055450eeb Russell King   2017-07-25  2442  {
259c8618b0099b Russell King   2017-12-14  2443  	const struct sff_data *sff;
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2444  	struct i2c_adapter *i2c;
5411ca7178d40d Chris Healy    2020-07-06  2445  	char *sfp_irq_name;
73970055450eeb Russell King   2017-07-25  2446  	struct sfp *sfp;
257c25598584f9 Robert Hancock 2019-06-07  2447  	int err, i;
73970055450eeb Russell King   2017-07-25  2448  =

73970055450eeb Russell King   2017-07-25  2449  	sfp =3D sfp_alloc(&pdev->d=
ev);
73970055450eeb Russell King   2017-07-25  2450  	if (IS_ERR(sfp))
73970055450eeb Russell King   2017-07-25  2451  		return PTR_ERR(sfp);
73970055450eeb Russell King   2017-07-25  2452  =

73970055450eeb Russell King   2017-07-25  2453  	platform_set_drvdata(pdev,=
 sfp);
73970055450eeb Russell King   2017-07-25  2454  =

73970055450eeb Russell King   2017-07-25 @2455  	err =3D devm_add_action(sf=
p->dev, sfp_cleanup, sfp);
73970055450eeb Russell King   2017-07-25  2456  	if (err < 0)
73970055450eeb Russell King   2017-07-25  2457  		return err;
73970055450eeb Russell King   2017-07-25  2458  =

259c8618b0099b Russell King   2017-12-14  2459  	sff =3D sfp->type =3D &sfp=
_data;
259c8618b0099b Russell King   2017-12-14  2460  =

73970055450eeb Russell King   2017-07-25  2461  	if (pdev->dev.of_node) {
73970055450eeb Russell King   2017-07-25  2462  		struct device_node *node =
=3D pdev->dev.of_node;
259c8618b0099b Russell King   2017-12-14  2463  		const struct of_device_id=
 *id;
73970055450eeb Russell King   2017-07-25  2464  		struct device_node *np;
73970055450eeb Russell King   2017-07-25  2465  =

259c8618b0099b Russell King   2017-12-14  2466  		id =3D of_match_node(sfp_=
of_match, node);
259c8618b0099b Russell King   2017-12-14  2467  		if (WARN_ON(!id))
259c8618b0099b Russell King   2017-12-14  2468  			return -EINVAL;
259c8618b0099b Russell King   2017-12-14  2469  =

259c8618b0099b Russell King   2017-12-14  2470  		sff =3D sfp->type =3D id-=
>data;
259c8618b0099b Russell King   2017-12-14  2471  =

73970055450eeb Russell King   2017-07-25  2472  		np =3D of_parse_phandle(n=
ode, "i2c-bus", 0);
66ede1f9c9466c Antoine Tenart 2018-05-22  2473  		if (!np) {
66ede1f9c9466c Antoine Tenart 2018-05-22  2474  			dev_err(sfp->dev, "missi=
ng 'i2c-bus' property\n");
66ede1f9c9466c Antoine Tenart 2018-05-22  2475  			return -ENODEV;
66ede1f9c9466c Antoine Tenart 2018-05-22  2476  		}
73970055450eeb Russell King   2017-07-25  2477  =

73970055450eeb Russell King   2017-07-25  2478  		i2c =3D of_find_i2c_adapt=
er_by_node(np);
73970055450eeb Russell King   2017-07-25  2479  		of_node_put(np);
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2480  	} else if (has_acpi_compan=
ion(&pdev->dev)) {
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2481  		struct acpi_device *adev =
=3D ACPI_COMPANION(&pdev->dev);
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2482  		struct fwnode_handle *fw =
=3D acpi_fwnode_handle(adev);
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2483  		struct fwnode_reference_a=
rgs args;
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2484  		struct acpi_handle *acpi_=
handle;
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2485  		int ret;
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2486  =

7ce236fafd0b4e Ruslan Babayev 2019-05-28  2487  		ret =3D acpi_node_get_pro=
perty_reference(fw, "i2c-bus", 0, &args);
1086ca3a63a3af Dan Carpenter  2019-06-13  2488  		if (ret || !is_acpi_devic=
e_node(args.fwnode)) {
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2489  			dev_err(&pdev->dev, "mis=
sing 'i2c-bus' property\n");
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2490  			return -ENODEV;
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2491  		}
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2492  =

7ce236fafd0b4e Ruslan Babayev 2019-05-28  2493  		acpi_handle =3D ACPI_HAND=
LE_FWNODE(args.fwnode);
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2494  		i2c =3D i2c_acpi_find_ada=
pter_by_handle(acpi_handle);
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2495  	} else {
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2496  		return -EINVAL;
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2497  	}
7ce236fafd0b4e Ruslan Babayev 2019-05-28  2498  =

73970055450eeb Russell King   2017-07-25  2499  	if (!i2c)
73970055450eeb Russell King   2017-07-25  2500  		return -EPROBE_DEFER;
73970055450eeb Russell King   2017-07-25  2501  =

73970055450eeb Russell King   2017-07-25  2502  	err =3D sfp_i2c_configure(=
sfp, i2c);
73970055450eeb Russell King   2017-07-25  2503  	if (err < 0) {
73970055450eeb Russell King   2017-07-25  2504  		i2c_put_adapter(i2c);
73970055450eeb Russell King   2017-07-25  2505  		return err;
73970055450eeb Russell King   2017-07-25  2506  	}
73970055450eeb Russell King   2017-07-25  2507  =

259c8618b0099b Russell King   2017-12-14  2508  	for (i =3D 0; i < GPIO_MAX=
; i++)
259c8618b0099b Russell King   2017-12-14  2509  		if (sff->gpios & BIT(i)) {
73970055450eeb Russell King   2017-07-25  2510  			sfp->gpio[i] =3D devm_gp=
iod_get_optional(sfp->dev,
73970055450eeb Russell King   2017-07-25  2511  					   gpio_of_names[i], g=
pio_flags[i]);
73970055450eeb Russell King   2017-07-25  2512  			if (IS_ERR(sfp->gpio[i]))
73970055450eeb Russell King   2017-07-25  2513  				return PTR_ERR(sfp->gpi=
o[i]);
73970055450eeb Russell King   2017-07-25  2514  		}
73970055450eeb Russell King   2017-07-25  2515  =

73970055450eeb Russell King   2017-07-25  2516  	sfp->get_state =3D sfp_gpi=
o_get_state;
73970055450eeb Russell King   2017-07-25  2517  	sfp->set_state =3D sfp_gpi=
o_set_state;
259c8618b0099b Russell King   2017-12-14  2518  =

259c8618b0099b Russell King   2017-12-14  2519  	/* Modules that have no de=
tect signal are always present */
259c8618b0099b Russell King   2017-12-14  2520  	if (!(sfp->gpio[GPIO_MODDE=
F0]))
259c8618b0099b Russell King   2017-12-14  2521  		sfp->get_state =3D sff_gp=
io_get_state;
73970055450eeb Russell King   2017-07-25  2522  =

3bb35261c74e39 Jon Nettleton  2018-02-27  2523  	device_property_read_u32(&=
pdev->dev, "maximum-power-milliwatt",
3bb35261c74e39 Jon Nettleton  2018-02-27  2524  				 &sfp->max_power_mW);
3bb35261c74e39 Jon Nettleton  2018-02-27  2525  	if (!sfp->max_power_mW)
3bb35261c74e39 Jon Nettleton  2018-02-27  2526  		sfp->max_power_mW =3D 100=
0;
3bb35261c74e39 Jon Nettleton  2018-02-27  2527  =

3bb35261c74e39 Jon Nettleton  2018-02-27  2528  	dev_info(sfp->dev, "Host m=
aximum power %u.%uW\n",
3bb35261c74e39 Jon Nettleton  2018-02-27  2529  		 sfp->max_power_mW / 1000=
, (sfp->max_power_mW / 100) % 10);
3bb35261c74e39 Jon Nettleton  2018-02-27  2530  =

73970055450eeb Russell King   2017-07-25  2531  	/* Get the initial state, =
and always signal TX disable,
73970055450eeb Russell King   2017-07-25  2532  	 * since the network inter=
face will not be up.
73970055450eeb Russell King   2017-07-25  2533  	 */
73970055450eeb Russell King   2017-07-25  2534  	sfp->state =3D sfp_get_sta=
te(sfp) | SFP_F_TX_DISABLE;
73970055450eeb Russell King   2017-07-25  2535  =

73970055450eeb Russell King   2017-07-25  2536  	if (sfp->gpio[GPIO_RATE_SE=
LECT] &&
73970055450eeb Russell King   2017-07-25  2537  	    gpiod_get_value_cansle=
ep(sfp->gpio[GPIO_RATE_SELECT]))
73970055450eeb Russell King   2017-07-25  2538  		sfp->state |=3D SFP_F_RAT=
E_SELECT;
73970055450eeb Russell King   2017-07-25  2539  	sfp_set_state(sfp, sfp->st=
ate);
73970055450eeb Russell King   2017-07-25  2540  	sfp_module_tx_disable(sfp);
73f5e847d83a2e Russell King   2019-11-10  2541  	if (sfp->state & SFP_F_PRE=
SENT) {
73f5e847d83a2e Russell King   2019-11-10  2542  		rtnl_lock();
73f5e847d83a2e Russell King   2019-11-10  2543  		sfp_sm_event(sfp, SFP_E_I=
NSERT);
73f5e847d83a2e Russell King   2019-11-10  2544  		rtnl_unlock();
73f5e847d83a2e Russell King   2019-11-10  2545  	}
73970055450eeb Russell King   2017-07-25  2546  =

73970055450eeb Russell King   2017-07-25  2547  	for (i =3D 0; i < GPIO_MAX=
; i++) {
73970055450eeb Russell King   2017-07-25  2548  		if (gpio_flags[i] !=3D GP=
IOD_IN || !sfp->gpio[i])
73970055450eeb Russell King   2017-07-25  2549  			continue;
73970055450eeb Russell King   2017-07-25  2550  =

257c25598584f9 Robert Hancock 2019-06-07  2551  		sfp->gpio_irq[i] =3D gpio=
d_to_irq(sfp->gpio[i]);
9621618130bf7e YueHaibing     2020-10-31  2552  		if (sfp->gpio_irq[i] < 0)=
 {
9621618130bf7e YueHaibing     2020-10-31  2553  			sfp->gpio_irq[i] =3D 0;
f3c9a666b28572 Russell King   2019-11-20  2554  			sfp->need_poll =3D true;
73970055450eeb Russell King   2017-07-25  2555  			continue;
73970055450eeb Russell King   2017-07-25  2556  		}
73970055450eeb Russell King   2017-07-25  2557  =

5411ca7178d40d Chris Healy    2020-07-06  2558  		sfp_irq_name =3D devm_kas=
printf(sfp->dev, GFP_KERNEL,
5411ca7178d40d Chris Healy    2020-07-06  2559  					      "%s-%s", dev_nam=
e(sfp->dev),
5411ca7178d40d Chris Healy    2020-07-06  2560  					      gpio_of_names[i]=
);
5411ca7178d40d Chris Healy    2020-07-06  2561  =

8cb601f15886f6 Chris Healy    2020-07-07  2562  		if (!sfp_irq_name)
8cb601f15886f6 Chris Healy    2020-07-07  2563  			return -ENOMEM;
8cb601f15886f6 Chris Healy    2020-07-07  2564  =

257c25598584f9 Robert Hancock 2019-06-07  2565  		err =3D devm_request_thre=
aded_irq(sfp->dev, sfp->gpio_irq[i],
257c25598584f9 Robert Hancock 2019-06-07  2566  						NULL, sfp_irq,
73970055450eeb Russell King   2017-07-25  2567  						IRQF_ONESHOT |
73970055450eeb Russell King   2017-07-25  2568  						IRQF_TRIGGER_RISING |
73970055450eeb Russell King   2017-07-25  2569  						IRQF_TRIGGER_FALLING,
5411ca7178d40d Chris Healy    2020-07-06  2570  						sfp_irq_name, sfp);
257c25598584f9 Robert Hancock 2019-06-07  2571  		if (err) {
257c25598584f9 Robert Hancock 2019-06-07  2572  			sfp->gpio_irq[i] =3D 0;
f3c9a666b28572 Russell King   2019-11-20  2573  			sfp->need_poll =3D true;
73970055450eeb Russell King   2017-07-25  2574  		}
257c25598584f9 Robert Hancock 2019-06-07  2575  	}
73970055450eeb Russell King   2017-07-25  2576  =

f3c9a666b28572 Russell King   2019-11-20  2577  	if (sfp->need_poll)
73970055450eeb Russell King   2017-07-25  2578  		mod_delayed_work(system_w=
q, &sfp->poll, poll_jiffies);
73970055450eeb Russell King   2017-07-25  2579  =

a1f5d1f0dfccea Antoine Tenart 2018-05-22  2580  	/* We could have an issue =
in cases no Tx disable pin is available or
a1f5d1f0dfccea Antoine Tenart 2018-05-22  2581  	 * wired as modules using =
a laser as their light source will continue to
a1f5d1f0dfccea Antoine Tenart 2018-05-22  2582  	 * be active when the fibe=
r is removed. This could be a safety issue and
a1f5d1f0dfccea Antoine Tenart 2018-05-22  2583  	 * we should at least warn=
 the user about that.
a1f5d1f0dfccea Antoine Tenart 2018-05-22  2584  	 */
a1f5d1f0dfccea Antoine Tenart 2018-05-22  2585  	if (!sfp->gpio[GPIO_TX_DIS=
ABLE])
a1f5d1f0dfccea Antoine Tenart 2018-05-22  2586  		dev_warn(sfp->dev,
a1f5d1f0dfccea Antoine Tenart 2018-05-22  2587  			 "No tx_disable pin: SFP=
 modules will always be emitting.\n");
a1f5d1f0dfccea Antoine Tenart 2018-05-22  2588  =

b5bfc21af5cb3d Russell King   2019-02-06  2589  	sfp->sfp_bus =3D sfp_regis=
ter_socket(sfp->dev, sfp, &sfp_module_ops);
b5bfc21af5cb3d Russell King   2019-02-06  2590  	if (!sfp->sfp_bus)
b5bfc21af5cb3d Russell King   2019-02-06  2591  		return -ENOMEM;
b5bfc21af5cb3d Russell King   2019-02-06  2592  =

9cc8976c69eb62 Russell King   2021-01-10  2593  	sfp_debugfs_init(sfp);
9cc8976c69eb62 Russell King   2021-01-10  2594  =

73970055450eeb Russell King   2017-07-25  2595  	return 0;
73970055450eeb Russell King   2017-07-25  2596  }
73970055450eeb Russell King   2017-07-25  2597  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4045925378849630870==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
SzvZAQA=
--===============4045925378849630870==--

