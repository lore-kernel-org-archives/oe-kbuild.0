Content-Type: multipart/mixed; boundary="===============2164254441706884984=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH] devres: better type safety with devm_*_action()
Date: Wed, 10 Mar 2021 15:00:30 +0800
Message-ID: <202103101455.6ClmCL0B-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2164254441706884984==
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
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: sparc64-randconfig-s031-20210309 (attached as .config)
compiler: sparc64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-262-g5e674421-dirty
        # https://github.com/0day-ci/linux/commit/663d41317b8fa291fc1c82100=
b3e2526627ab4d4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Rasmus-Villemoes/devres-better-typ=
e-safety-with-devm_-_action/20210310-080019
        git checkout 663d41317b8fa291fc1c82100b3e2526627ab4d4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dsparc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/gpio/gpio-em.c: note: in included file (through include/linux/pl=
atform_device.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/gpio/gpio-em.c:339:15: sparse: sparse: arithmetics on pointers t=
o functions
>> drivers/gpio/gpio-em.c:339:15: sparse: sparse: arithmetics on pointers t=
o functions
>> drivers/gpio/gpio-em.c:339:15: sparse: sparse: static assertion failed: =
"__same_type(em_gio_irq_domain_remove + 0, void (*)(void *)) || __same_type=
(em_gio_irq_domain_remove + 0, void (*)(typeof(p->irq_domain)))"
--
   drivers/hid/wacom_sys.c: note: in included file (through include/linux/i=
nput.h, include/linux/hid.h, drivers/hid/wacom_wac.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hid/wacom_sys.c:895:18: sparse: sparse: arithmetics on pointers =
to functions
>> drivers/hid/wacom_sys.c:895:18: sparse: sparse: arithmetics on pointers =
to functions
>> drivers/hid/wacom_sys.c:895:18: sparse: sparse: static assertion failed:=
 "__same_type(wacom_remove_shared_data + 0, void (*)(void *)) || __same_typ=
e(wacom_remove_shared_data + 0, void (*)(typeof(wacom)))"
   drivers/hid/wacom_sys.c:1467:17: sparse: sparse: arithmetics on pointers=
 to functions
   drivers/hid/wacom_sys.c:1467:17: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/hid/wacom_sys.c:1467:17: sparse: sparse: static assertion failed=
: "__same_type(wacom_led_groups_release_one + 0, void (*)(void *)) || __sam=
e_type(wacom_led_groups_release_one + 0, void (*)(typeof(&wacom->led.groups=
[group_id])))"
   drivers/hid/wacom_sys.c:1543:17: sparse: sparse: arithmetics on pointers=
 to functions
   drivers/hid/wacom_sys.c:1543:17: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/hid/wacom_sys.c:1543:17: sparse: sparse: static assertion failed=
: "__same_type(wacom_led_groups_release + 0, void (*)(void *)) || __same_ty=
pe(wacom_led_groups_release + 0, void (*)(typeof(wacom)))"
   drivers/hid/wacom_sys.c:2036:17: sparse: sparse: arithmetics on pointers=
 to functions
   drivers/hid/wacom_sys.c:2036:17: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/hid/wacom_sys.c:2036:17: sparse: sparse: static assertion failed=
: "__same_type(wacom_remotes_destroy + 0, void (*)(void *)) || __same_type(=
wacom_remotes_destroy + 0, void (*)(typeof(wacom)))"
--
   drivers/hid/hid-cougar.c: note: in included file (through include/linux/=
input.h, include/linux/hid.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hid/hid-cougar.c:182:17: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/hid/hid-cougar.c:182:17: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/hid/hid-cougar.c:182:17: sparse: sparse: static assertion failed=
: "__same_type(cougar_remove_shared_data + 0, void (*)(void *)) || __same_t=
ype(cougar_remove_shared_data + 0, void (*)(typeof(cougar)))"
--
   drivers/hwmon/gpio-fan.c: note: in included file (through include/linux/=
platform_device.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/gpio-fan.c:520:23: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/hwmon/gpio-fan.c:520:23: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/hwmon/gpio-fan.c:520:23: sparse: sparse: static assertion failed=
: "__same_type(gpio_fan_stop + 0, void (*)(void *)) || __same_type(gpio_fan=
_stop + 0, void (*)(typeof(fan_data)))"
--
   drivers/hwmon/g762.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/g762.c:623:9: sparse: sparse: arithmetics on pointers to f=
unctions
>> drivers/hwmon/g762.c:623:9: sparse: sparse: arithmetics on pointers to f=
unctions
>> drivers/hwmon/g762.c:623:9: sparse: sparse: static assertion failed: "__=
same_type(g762_of_clock_disable + 0, void (*)(void *)) || __same_type(g762_=
of_clock_disable + 0, void (*)(typeof(data)))"
--
   drivers/hwmon/pwm-fan.c: note: in included file (through include/linux/p=
latform_device.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/pwm-fan.c:333:23: sparse: sparse: arithmetics on pointers =
to functions
>> drivers/hwmon/pwm-fan.c:333:23: sparse: sparse: arithmetics on pointers =
to functions
>> drivers/hwmon/pwm-fan.c:333:23: sparse: sparse: static assertion failed:=
 "__same_type(pwm_fan_regulator_disable + 0, void (*)(void *)) || __same_ty=
pe(pwm_fan_regulator_disable + 0, void (*)(typeof(ctx->reg_en)))"
   drivers/hwmon/pwm-fan.c:360:15: sparse: sparse: arithmetics on pointers =
to functions
   drivers/hwmon/pwm-fan.c:360:15: sparse: sparse: arithmetics on pointers =
to functions
>> drivers/hwmon/pwm-fan.c:360:15: sparse: sparse: static assertion failed:=
 "__same_type(pwm_fan_pwm_disable + 0, void (*)(void *)) || __same_type(pwm=
_fan_pwm_disable + 0, void (*)(typeof(ctx)))"
--
   drivers/leds/leds-netxbig.c: note: in included file (through include/lin=
ux/platform_device.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/leds/leds-netxbig.c:416:16: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/leds/leds-netxbig.c:416:16: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/leds/leds-netxbig.c:416:16: sparse: sparse: static assertion fai=
led: "__same_type(netxbig_gpio_ext_remove + 0, void (*)(void *)) || __same_=
type(netxbig_gpio_ext_remove + 0, void (*)(typeof(gpio_ext)))"
--
   drivers/nvmem/mxs-ocotp.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/nvmem/mxs-ocotp.c:168:15: sparse: sparse: arithmetics on pointer=
s to functions
>> drivers/nvmem/mxs-ocotp.c:168:15: sparse: sparse: arithmetics on pointer=
s to functions
>> drivers/nvmem/mxs-ocotp.c:168:15: sparse: sparse: static assertion faile=
d: "__same_type(mxs_ocotp_action + 0, void (*)(void *)) || __same_type(mxs_=
ocotp_action + 0, void (*)(typeof(otp->clk)))"
--
   drivers/input/keyboard/snvs_pwrkey.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/keyboard/snvs_pwrkey.c:166:17: sparse: sparse: arithmetics=
 on pointers to functions
>> drivers/input/keyboard/snvs_pwrkey.c:166:17: sparse: sparse: arithmetics=
 on pointers to functions
>> drivers/input/keyboard/snvs_pwrkey.c:166:17: sparse: sparse: static asse=
rtion failed: "__same_type(imx_snvs_pwrkey_act + 0, void (*)(void *)) || __=
same_type(imx_snvs_pwrkey_act + 0, void (*)(typeof(pdata)))"
--
   drivers/input/keyboard/tm2-touchkey.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/keyboard/tm2-touchkey.c:235:17: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/input/keyboard/tm2-touchkey.c:235:17: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/input/keyboard/tm2-touchkey.c:235:17: sparse: sparse: static ass=
ertion failed: "__same_type(tm2_touchkey_power_disable + 0, void (*)(void *=
)) || __same_type(tm2_touchkey_power_disable + 0, void (*)(typeof(touchkey)=
))"
--
   drivers/input/keyboard/omap4-keypad.c: note: in included file (through i=
nclude/linux/platform_device.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/keyboard/omap4-keypad.c:385:17: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/input/keyboard/omap4-keypad.c:385:17: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/input/keyboard/omap4-keypad.c:385:17: sparse: sparse: static ass=
ertion failed: "__same_type(omap4_disable_pm + 0, void (*)(void *)) || __sa=
me_type(omap4_disable_pm + 0, void (*)(typeof(dev)))"
--
   drivers/input/keyboard/mpr121_touchkey.c: note: in included file (throug=
h include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/keyboard/mpr121_touchkey.c:110:15: sparse: sparse: arithme=
tics on pointers to functions
>> drivers/input/keyboard/mpr121_touchkey.c:110:15: sparse: sparse: arithme=
tics on pointers to functions
>> drivers/input/keyboard/mpr121_touchkey.c:110:15: sparse: sparse: static =
assertion failed: "__same_type(mpr121_vdd_supply_disable + 0, void (*)(void=
 *)) || __same_type(mpr121_vdd_supply_disable + 0, void (*)(typeof(vdd_supp=
ly)))"
--
   drivers/rtc/rtc-mxc.c: note: in included file (through include/linux/rtc=
.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/rtc/rtc-mxc.c:367:15: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/rtc/rtc-mxc.c:367:15: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/rtc/rtc-mxc.c:367:15: sparse: sparse: static assertion failed: "=
__same_type(mxc_rtc_action + 0, void (*)(void *)) || __same_type(mxc_rtc_ac=
tion + 0, void (*)(typeof(pdata)))"
--
   drivers/rtc/rtc-snvs.c: note: in included file (through include/linux/pl=
atform_device.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/rtc/rtc-snvs.c:355:15: sparse: sparse: arithmetics on pointers t=
o functions
>> drivers/rtc/rtc-snvs.c:355:15: sparse: sparse: arithmetics on pointers t=
o functions
>> drivers/rtc/rtc-snvs.c:355:15: sparse: sparse: static assertion failed: =
"__same_type(snvs_rtc_action + 0, void (*)(void *)) || __same_type(snvs_rtc=
_action + 0, void (*)(typeof(data->clk)))"
--
   drivers/rtc/rtc-jz4740.c: note: in included file (through include/linux/=
node.h, include/linux/cpu.h, include/linux/of_device.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/rtc/rtc-jz4740.c:344:15: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/rtc/rtc-jz4740.c:344:15: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/rtc/rtc-jz4740.c:344:15: sparse: sparse: static assertion failed=
: "__same_type(jz4740_rtc_clk_disable + 0, void (*)(void *)) || __same_type=
(jz4740_rtc_clk_disable + 0, void (*)(typeof(clk)))"
--
   drivers/input/touchscreen/s6sy761.c: note: in included file (through inc=
lude/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/touchscreen/s6sy761.c:419:15: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/input/touchscreen/s6sy761.c:419:15: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/input/touchscreen/s6sy761.c:419:15: sparse: sparse: static asser=
tion failed: "__same_type(s6sy761_power_off + 0, void (*)(void *)) || __sam=
e_type(s6sy761_power_off + 0, void (*)(typeof(sdata)))"
--
   drivers/input/touchscreen/zet6223.c: note: in included file (through inc=
lude/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/touchscreen/zet6223.c:124:17: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/input/touchscreen/zet6223.c:124:17: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/input/touchscreen/zet6223.c:124:17: sparse: sparse: static asser=
tion failed: "__same_type(zet6223_power_off + 0, void (*)(void *)) || __sam=
e_type(zet6223_power_off + 0, void (*)(typeof(ts)))"
--
   drivers/input/touchscreen/ili210x.c: note: in included file (through inc=
lude/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/touchscreen/ili210x.c:418:25: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/input/touchscreen/ili210x.c:418:25: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/input/touchscreen/ili210x.c:418:25: sparse: sparse: static asser=
tion failed: "__same_type(ili210x_power_down + 0, void (*)(void *)) || __sa=
me_type(ili210x_power_down + 0, void (*)(typeof(reset_gpio)))"
   drivers/input/touchscreen/ili210x.c:469:17: sparse: sparse: arithmetics =
on pointers to functions
   drivers/input/touchscreen/ili210x.c:469:17: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/input/touchscreen/ili210x.c:469:17: sparse: sparse: static asser=
tion failed: "__same_type(ili210x_stop + 0, void (*)(void *)) || __same_typ=
e(ili210x_stop + 0, void (*)(typeof(priv)))"
--
   drivers/power/supply/max8997_charger.c: note: in included file (through =
include/linux/extcon.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/power/supply/max8997_charger.c:255:23: sparse: sparse: arithmeti=
cs on pointers to functions
>> drivers/power/supply/max8997_charger.c:255:23: sparse: sparse: arithmeti=
cs on pointers to functions
>> drivers/power/supply/max8997_charger.c:255:23: sparse: sparse: static as=
sertion failed: "__same_type(max8997_battery_extcon_evt_stop_work + 0, void=
 (*)(void *)) || __same_type(max8997_battery_extcon_evt_stop_work + 0, void=
 (*)(typeof(charger)))"
--
   drivers/power/supply/max14656_charger_detector.c: note: in included file=
 (through include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/power/supply/max14656_charger_detector.c:290:15: sparse: sparse:=
 arithmetics on pointers to functions
>> drivers/power/supply/max14656_charger_detector.c:290:15: sparse: sparse:=
 arithmetics on pointers to functions
>> drivers/power/supply/max14656_charger_detector.c:290:15: sparse: sparse:=
 static assertion failed: "__same_type(stop_irq_work + 0, void (*)(void *))=
 || __same_type(stop_irq_work + 0, void (*)(typeof(chip)))"
--
   drivers/usb/phy/phy-jz4770.c: note: in included file (through include/li=
nux/platform_device.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/usb/phy/phy-jz4770.c:346:16: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/usb/phy/phy-jz4770.c:346:16: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/usb/phy/phy-jz4770.c:346:16: sparse: sparse: static assertion fa=
iled: "__same_type(ingenic_usb_phy_remove + 0, void (*)(void *)) || __same_=
type(ingenic_usb_phy_remove + 0, void (*)(typeof(&priv->phy)))"

vim +339 drivers/gpio/gpio-em.c

19ec11a2233d24 Bartosz Golaszewski 2019-07-11  268  =

3836309d93462b Bill Pemberton      2012-11-19  269  static int em_gio_probe=
(struct platform_device *pdev)
a07e103ef08c69 Magnus Damm         2012-05-17  270  {
a07e103ef08c69 Magnus Damm         2012-05-17  271  	struct em_gio_priv *p;
a07e103ef08c69 Magnus Damm         2012-05-17  272  	struct gpio_chip *gpio=
_chip;
a07e103ef08c69 Magnus Damm         2012-05-17  273  	struct irq_chip *irq_c=
hip;
66ad66293edeb2 Bartosz Golaszewski 2019-07-11  274  	struct device *dev =3D=
 &pdev->dev;
66ad66293edeb2 Bartosz Golaszewski 2019-07-11  275  	const char *name =3D d=
ev_name(dev);
527b397a7a3647 Geert Uytterhoeven  2015-06-23  276  	unsigned int ngpios;
be053b2dc91c1a Geert Uytterhoeven  2019-11-13  277  	int irq[2], ret;
a07e103ef08c69 Magnus Damm         2012-05-17  278  =

66ad66293edeb2 Bartosz Golaszewski 2019-07-11  279  	p =3D devm_kzalloc(dev=
, sizeof(*p), GFP_KERNEL);
715ed72801ff4d Geert Uytterhoeven  2019-05-27  280  	if (!p)
715ed72801ff4d Geert Uytterhoeven  2019-05-27  281  		return -ENOMEM;
a07e103ef08c69 Magnus Damm         2012-05-17  282  =

a07e103ef08c69 Magnus Damm         2012-05-17  283  	p->pdev =3D pdev;
a07e103ef08c69 Magnus Damm         2012-05-17  284  	platform_set_drvdata(p=
dev, p);
a07e103ef08c69 Magnus Damm         2012-05-17  285  	spin_lock_init(&p->sen=
se_lock);
a07e103ef08c69 Magnus Damm         2012-05-17  286  =

be053b2dc91c1a Geert Uytterhoeven  2019-11-13  287  	irq[0] =3D platform_ge=
t_irq(pdev, 0);
be053b2dc91c1a Geert Uytterhoeven  2019-11-13  288  	if (irq[0] < 0)
be053b2dc91c1a Geert Uytterhoeven  2019-11-13  289  		return irq[0];
a07e103ef08c69 Magnus Damm         2012-05-17  290  =

be053b2dc91c1a Geert Uytterhoeven  2019-11-13  291  	irq[1] =3D platform_ge=
t_irq(pdev, 1);
be053b2dc91c1a Geert Uytterhoeven  2019-11-13  292  	if (irq[1] < 0)
be053b2dc91c1a Geert Uytterhoeven  2019-11-13  293  		return irq[1];
a07e103ef08c69 Magnus Damm         2012-05-17  294  =

94bfcbf0368b61 Bartosz Golaszewski 2019-10-02  295  	p->base0 =3D devm_plat=
form_ioremap_resource(pdev, 0);
94bfcbf0368b61 Bartosz Golaszewski 2019-10-02  296  	if (IS_ERR(p->base0))
94bfcbf0368b61 Bartosz Golaszewski 2019-10-02  297  		return PTR_ERR(p->bas=
e0);
a07e103ef08c69 Magnus Damm         2012-05-17  298  =

94bfcbf0368b61 Bartosz Golaszewski 2019-10-02  299  	p->base1 =3D devm_plat=
form_ioremap_resource(pdev, 1);
94bfcbf0368b61 Bartosz Golaszewski 2019-10-02  300  	if (IS_ERR(p->base1))
94bfcbf0368b61 Bartosz Golaszewski 2019-10-02  301  		return PTR_ERR(p->bas=
e1);
a07e103ef08c69 Magnus Damm         2012-05-17  302  =

66ad66293edeb2 Bartosz Golaszewski 2019-07-11  303  	if (of_property_read_u=
32(dev->of_node, "ngpios", &ngpios)) {
66ad66293edeb2 Bartosz Golaszewski 2019-07-11  304  		dev_err(dev, "Missing=
 ngpios OF property\n");
715ed72801ff4d Geert Uytterhoeven  2019-05-27  305  		return -EINVAL;
753c5983ddd380 Magnus Damm         2013-02-26  306  	}
753c5983ddd380 Magnus Damm         2013-02-26  307  =

a07e103ef08c69 Magnus Damm         2012-05-17  308  	gpio_chip =3D &p->gpio=
_chip;
66ad66293edeb2 Bartosz Golaszewski 2019-07-11  309  	gpio_chip->of_node =3D=
 dev->of_node;
a07e103ef08c69 Magnus Damm         2012-05-17  310  	gpio_chip->direction_i=
nput =3D em_gio_direction_input;
a07e103ef08c69 Magnus Damm         2012-05-17  311  	gpio_chip->get =3D em_=
gio_get;
a07e103ef08c69 Magnus Damm         2012-05-17  312  	gpio_chip->direction_o=
utput =3D em_gio_direction_output;
a07e103ef08c69 Magnus Damm         2012-05-17  313  	gpio_chip->set =3D em_=
gio_set;
a07e103ef08c69 Magnus Damm         2012-05-17  314  	gpio_chip->to_irq =3D =
em_gio_to_irq;
640efa08cb635a Magnus Damm         2013-07-03  315  	gpio_chip->request =3D=
 em_gio_request;
640efa08cb635a Magnus Damm         2013-07-03  316  	gpio_chip->free =3D em=
_gio_free;
a07e103ef08c69 Magnus Damm         2012-05-17  317  	gpio_chip->label =3D n=
ame;
66ad66293edeb2 Bartosz Golaszewski 2019-07-11  318  	gpio_chip->parent =3D =
dev;
a07e103ef08c69 Magnus Damm         2012-05-17  319  	gpio_chip->owner =3D T=
HIS_MODULE;
527b397a7a3647 Geert Uytterhoeven  2015-06-23  320  	gpio_chip->base =3D -1;
527b397a7a3647 Geert Uytterhoeven  2015-06-23  321  	gpio_chip->ngpio =3D n=
gpios;
a07e103ef08c69 Magnus Damm         2012-05-17  322  =

a07e103ef08c69 Magnus Damm         2012-05-17  323  	irq_chip =3D &p->irq_c=
hip;
b74f0456c12028 Geert Uytterhoeven  2019-10-24  324  	irq_chip->name =3D "gp=
io-em";
a07e103ef08c69 Magnus Damm         2012-05-17  325  	irq_chip->irq_mask =3D=
 em_gio_irq_disable;
a07e103ef08c69 Magnus Damm         2012-05-17  326  	irq_chip->irq_unmask =
=3D em_gio_irq_enable;
a07e103ef08c69 Magnus Damm         2012-05-17  327  	irq_chip->irq_set_type=
 =3D em_gio_irq_set_type;
57ef04288abd27 Linus Walleij       2014-03-14  328  	irq_chip->irq_request_=
resources =3D em_gio_irq_reqres;
57ef04288abd27 Linus Walleij       2014-03-14  329  	irq_chip->irq_release_=
resources =3D em_gio_irq_relres;
03621b60529edf Magnus Damm         2013-11-20  330  	irq_chip->flags	=3D IR=
QCHIP_SKIP_SET_WAKE | IRQCHIP_MASK_ON_SUSPEND;
a07e103ef08c69 Magnus Damm         2012-05-17  331  =

66ad66293edeb2 Bartosz Golaszewski 2019-07-11  332  	p->irq_domain =3D irq_=
domain_add_simple(dev->of_node, ngpios, 0,
7385500a49b769 Linus Walleij       2012-10-16  333  					      &em_gio_irq_=
domain_ops, p);
1631081993b1e6 Axel Lin            2012-10-31  334  	if (!p->irq_domain) {
66ad66293edeb2 Bartosz Golaszewski 2019-07-11  335  		dev_err(dev, "cannot =
initialize irq domain\n");
715ed72801ff4d Geert Uytterhoeven  2019-05-27  336  		return -ENXIO;
a07e103ef08c69 Magnus Damm         2012-05-17  337  	}
a07e103ef08c69 Magnus Damm         2012-05-17  338  =

66ad66293edeb2 Bartosz Golaszewski 2019-07-11 @339  	ret =3D devm_add_actio=
n_or_reset(dev, em_gio_irq_domain_remove,
19ec11a2233d24 Bartosz Golaszewski 2019-07-11  340  				       p->irq_domai=
n);
19ec11a2233d24 Bartosz Golaszewski 2019-07-11  341  	if (ret)
19ec11a2233d24 Bartosz Golaszewski 2019-07-11  342  		return ret;
19ec11a2233d24 Bartosz Golaszewski 2019-07-11  343  =

be053b2dc91c1a Geert Uytterhoeven  2019-11-13  344  	if (devm_request_irq(d=
ev, irq[0], em_gio_irq_handler, 0, name, p)) {
66ad66293edeb2 Bartosz Golaszewski 2019-07-11  345  		dev_err(dev, "failed =
to request low IRQ\n");
19ec11a2233d24 Bartosz Golaszewski 2019-07-11  346  		return -ENOENT;
a07e103ef08c69 Magnus Damm         2012-05-17  347  	}
a07e103ef08c69 Magnus Damm         2012-05-17  348  =

be053b2dc91c1a Geert Uytterhoeven  2019-11-13  349  	if (devm_request_irq(d=
ev, irq[1], em_gio_irq_handler, 0, name, p)) {
66ad66293edeb2 Bartosz Golaszewski 2019-07-11  350  		dev_err(dev, "failed =
to request high IRQ\n");
19ec11a2233d24 Bartosz Golaszewski 2019-07-11  351  		return -ENOENT;
a07e103ef08c69 Magnus Damm         2012-05-17  352  	}
a07e103ef08c69 Magnus Damm         2012-05-17  353  =

66ad66293edeb2 Bartosz Golaszewski 2019-07-11  354  	ret =3D devm_gpiochip_=
add_data(dev, gpio_chip, p);
a07e103ef08c69 Magnus Damm         2012-05-17  355  	if (ret) {
66ad66293edeb2 Bartosz Golaszewski 2019-07-11  356  		dev_err(dev, "failed =
to add GPIO controller\n");
a07e103ef08c69 Magnus Damm         2012-05-17  357  		return ret;
a07e103ef08c69 Magnus Damm         2012-05-17  358  	}
a07e103ef08c69 Magnus Damm         2012-05-17  359  =

a07e103ef08c69 Magnus Damm         2012-05-17  360  	return 0;
a07e103ef08c69 Magnus Damm         2012-05-17  361  }
a07e103ef08c69 Magnus Damm         2012-05-17  362  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2164254441706884984==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
x/8BGOUXvEmuAQA=
--===============2164254441706884984==--

