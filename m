Content-Type: multipart/mixed; boundary="===============0727017412687278090=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH] devres: better type safety with devm_*_action()
Date: Wed, 10 Mar 2021 23:38:54 +0800
Message-ID: <202103102302.VVPhxyMd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0727017412687278090==
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
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: xtensa-randconfig-s032-20210309 (attached as .config)
compiler: xtensa-linux-gcc (GCC) 9.3.0
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
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dxtensa =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/gpu/drm/tiny/cirrus.c: note: in included file (through include/l=
inux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/tiny/hx8357d.c: note: in included file (through include/=
linux/backlight.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/tiny/ili9225.c: note: in included file (through include/=
linux/dma-mapping.h, include/linux/dma-buf.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/tiny/ili9486.c: note: in included file (through include/=
linux/backlight.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/tiny/st7586.c: note: in included file (through include/l=
inux/dma-mapping.h, include/linux/dma-buf.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/tiny/st7735r.c: note: in included file (through include/=
linux/backlight.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/pl111/pl111_display.c: note: in included file (through i=
nclude/linux/dma-mapping.h, include/linux/dma-buf.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/pl111/pl111_versatile.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/pl111/pl111_drv.c: note: in included file (through inclu=
de/linux/amba/bus.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/pl111/pl111_debugfs.c: note: in included file (through i=
nclude/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/rt5033_battery.c: note: in included file (through i=
nclude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/rt9455_charger.c: note: in included file (through i=
nclude/linux/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/gpio-charger.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/lp8727_charger.c: note: in included file (through i=
nclude/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/pcf50633-charger.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/lt3651-charger.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/charger-manager.c: note: in included file (through =
include/linux/rtc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/max77693_charger.c: note: in included file (through=
 include/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/bq24735-charger.c: note: in included file (through =
include/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/bq2415x_charger.c: note: in included file (through =
include/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/bq24190_charger.c: note: in included file (through =
include/linux/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/bq2515x_charger.c: note: in included file (through =
include/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/bq25890_charger.c: note: in included file (through =
include/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/bq25980_charger.c: note: in included file (through =
include/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/smb347-charger.c: note: in included file (through i=
nclude/linux/gpio/driver.h, include/asm-generic/gpio.h, include/linux/gpio.=
h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/acer_a500_battery.c: note: in included file (throug=
h include/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/bd99954-charger.c: note: in included file (through =
include/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/power/supply/bd99954-charger.c:1115:15: sparse: sparse: arithmet=
ics on pointers to functions
>> drivers/power/supply/bd99954-charger.c:1115:15: sparse: sparse: arithmet=
ics on pointers to functions
>> drivers/power/supply/bd99954-charger.c:1115:15: sparse: sparse: static a=
ssertion failed: "__same_type(bd9995x_chip_reset + 0, void (*)(void *)) || =
__same_type(bd9995x_chip_reset + 0, void (*)(typeof(bd)))"
--
   drivers/power/supply/power_supply_sysfs.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/power_supply_core.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/power_supply_leds.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/pda_power.c: note: in included file (through includ=
e/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/max8925_power.c: note: in included file (through in=
clude/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/test_power.c: note: in included file (through inclu=
de/linux/power_supply.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/wm8350_power.c: note: in included file (through inc=
lude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/adp5061.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/cw2015_battery.c: note: in included file (through i=
nclude/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/ds2760_battery.c: note: in included file (through i=
nclude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/ds2780_battery.c: note: in included file (through i=
nclude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/ds2781_battery.c: note: in included file (through i=
nclude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/ltc2941-battery-gauge.c: note: in included file (th=
rough include/linux/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/ds2782_battery.c: note: in included file (through i=
nclude/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/bq27xxx_battery.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/bq27xxx_battery_i2c.c: note: in included file (thro=
ugh include/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/max1721x_battery.c: note: in included file (through=
 include/linux/w1.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/power/supply/max17040_battery.c: note: in included file (through=
 include/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/power/supply/max17040_battery.c:538:23: sparse: sparse: arithmet=
ics on pointers to functions
>> drivers/power/supply/max17040_battery.c:538:23: sparse: sparse: arithmet=
ics on pointers to functions
>> drivers/power/supply/max17040_battery.c:538:23: sparse: sparse: static a=
ssertion failed: "__same_type(max17040_stop_work + 0, void (*)(void *)) || =
__same_type(max17040_stop_work + 0, void (*)(typeof(chip)))"
--
   drivers/hwmon/pmbus/pmbus.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pmbus/adm1266.c: note: in included file (through include/l=
inux/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pmbus/adm1275.c: note: in included file (through include/l=
inux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pmbus/pmbus_core.c: note: in included file (through includ=
e/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/pmbus/pmbus_core.c:2542:16: sparse: sparse: arithmetics on=
 pointers to functions
>> drivers/hwmon/pmbus/pmbus_core.c:2542:16: sparse: sparse: arithmetics on=
 pointers to functions
>> drivers/hwmon/pmbus/pmbus_core.c:2542:16: sparse: sparse: static asserti=
on failed: "__same_type(pmbus_remove_debugfs + 0, void (*)(void *)) || __sa=
me_type(pmbus_remove_debugfs + 0, void (*)(typeof(data->debugfs)))"
--
   drivers/hwmon/pmbus/ibm-cffps.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pmbus/ir38064.c: note: in included file (through include/l=
inux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pmbus/irps5401.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pmbus/max16064.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pmbus/lm25066.c: note: in included file (through include/l=
inux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pmbus/isl68137.c: note: in included file (through include/=
linux/hwmon-sysfs.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pmbus/max16601.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/pmbus/max16601.c:340:15: sparse: sparse: arithmetics on po=
inters to functions
>> drivers/hwmon/pmbus/max16601.c:340:15: sparse: sparse: arithmetics on po=
inters to functions
>> drivers/hwmon/pmbus/max16601.c:340:15: sparse: sparse: static assertion =
failed: "__same_type(max16601_remove + 0, void (*)(void *)) || __same_type(=
max16601_remove + 0, void (*)(typeof(data)))"
--
   drivers/hwmon/pmbus/max31785.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pmbus/max20751.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pmbus/mp2975.c: note: in included file (through include/li=
nux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pmbus/pm6764tr.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pmbus/q54sj108a2.c: note: in included file (through includ=
e/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pmbus/tps53679.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pmbus/zl6100.c: note: in included file (through include/li=
nux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/endpoint/pci-epc-core.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/endpoint/pci-epf-core.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/endpoint/pci-epc-mem.c: note: in included file (through incl=
ude/linux/pci-epf.h, include/linux/pci-epc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/endpoint/functions/pci-epf-ntb.c: note: in included file (th=
rough include/linux/pci-epf.h, include/linux/pci-epc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-rockchip.c: note: in included file (through include/linu=
x/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-pca9685.c: note: in included file (through include/linux=
/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-renesas-tpu.c: note: in included file (through include/l=
inux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-pxa.c: note: in included file (through include/linux/pla=
tform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-sl28cpld.c: note: in included file (through include/linu=
x/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-sprd.c: note: in included file (through include/linux/pl=
atform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-stm32.c: note: in included file (through include/linux/d=
maengine.h, include/linux/mfd/stm32-timers.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-tegra.c: note: in included file (through include/linux/n=
ode.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-tiehrpwm.c: note: in included file (through include/linu=
x/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/core.c: note: in included file (through include/linux/acpi.h=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-bcm2835.c: note: in included file (through include/linux=
/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/sysfs.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-hibvt.c: note: in included file (through include/linux/n=
ode.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-bcm-iproc.c: note: in included file (through include/lin=
ux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-dwc.c: note: in included file (through include/linux/pci=
.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-img.c: note: in included file (through include/linux/nod=
e.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-intel-lgm.c: note: in included file (through include/lin=
ux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/pwm/pwm-intel-lgm.c:145:16: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/pwm/pwm-intel-lgm.c:145:16: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/pwm/pwm-intel-lgm.c:145:16: sparse: sparse: static assertion fai=
led: "__same_type(lgm_clk_release + 0, void (*)(void *)) || __same_type(lgm=
_clk_release + 0, void (*)(typeof(clk)))"
   drivers/pwm/pwm-intel-lgm.c:163:16: sparse: sparse: arithmetics on point=
ers to functions
   drivers/pwm/pwm-intel-lgm.c:163:16: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/pwm/pwm-intel-lgm.c:163:16: sparse: sparse: static assertion fai=
led: "__same_type(lgm_reset_control_release + 0, void (*)(void *)) || __sam=
e_type(lgm_reset_control_release + 0, void (*)(typeof(rst)))"
--
   drivers/pwm/pwm-imx27.c: note: in included file (through include/linux/p=
latform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-iqs620a.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/pwm/pwm-iqs620a.c:222:15: sparse: sparse: arithmetics on pointer=
s to functions
>> drivers/pwm/pwm-iqs620a.c:222:15: sparse: sparse: arithmetics on pointer=
s to functions
>> drivers/pwm/pwm-iqs620a.c:222:15: sparse: sparse: static assertion faile=
d: "__same_type(iqs620_pwm_notifier_unregister + 0, void (*)(void *)) || __=
same_type(iqs620_pwm_notifier_unregister + 0, void (*)(typeof(iqs620_pwm)))"
--
   drivers/pwm/pwm-lp3943.c: note: in included file (through include/linux/=
acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-lpc32xx.c: note: in included file (through include/linux=
/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-lpc18xx-sct.c: note: in included file (through include/l=
inux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-lpss.c: note: in included file (through include/linux/pm=
_runtime.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-lpss-platform.c: note: in included file (through include=
/linux/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-meson.c: note: in included file (through include/linux/n=
ode.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-mediatek.c: note: in included file (through include/linu=
x/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pwm/pwm-mtk-disp.c: note: in included file (through include/linu=
x/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/controller/pci-host-common.c: note: in included file (throug=
h include/linux/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/pci/controller/pci-host-common.c:45:15: sparse: sparse: arithmet=
ics on pointers to functions
>> drivers/pci/controller/pci-host-common.c:45:15: sparse: sparse: arithmet=
ics on pointers to functions
>> drivers/pci/controller/pci-host-common.c:45:15: sparse: sparse: static a=
ssertion failed: "__same_type(gen_pci_unmap_cfg + 0, void (*)(void *)) || _=
_same_type(gen_pci_unmap_cfg + 0, void (*)(typeof(cfg)))"
--
   drivers/pci/controller/pcie-xilinx-cpm.c: note: in included file (throug=
h include/linux/acpi.h, include/linux/irqchip.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/controller/pci-versatile.c: note: in included file (through =
include/linux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/controller/pcie-altera.c: note: in included file (through in=
clude/linux/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/controller/dwc/pcie-histb.c: note: in included file (through=
 include/linux/gpio/driver.h, include/linux/of_gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/controller/dwc/pci-meson.c: note: in included file (through =
include/linux/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/pci/controller/dwc/pci-meson.c:190:9: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/pci/controller/dwc/pci-meson.c:190:9: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/pci/controller/dwc/pci-meson.c:190:9: sparse: sparse: static ass=
ertion failed: "__same_type((void (*) (void *))clk_disable_unprepare + 0, v=
oid (*)(void *)) || __same_type((void (*) (void *))clk_disable_unprepare + =
0, void (*)(typeof(clk)))"
--
   drivers/pci/controller/dwc/pcie-tegra194.c: note: in included file (thro=
ugh include/linux/gpio/driver.h, include/asm-generic/gpio.h, include/linux/=
gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/controller/dwc/pcie-designware.c: note: in included file (th=
rough include/linux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/controller/dwc/pcie-designware-host.c: note: in included fil=
e (through include/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/controller/dwc/pcie-designware-plat.c: note: in included fil=
e (through include/linux/gpio/driver.h, include/asm-generic/gpio.h, include=
/linux/gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/controller/dwc/pcie-designware-ep.c: note: in included file =
(through include/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/controller/dwc/pci-exynos.c: note: in included file (through=
 include/linux/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/controller/dwc/pci-imx6.c: note: in included file (through i=
nclude/linux/gpio/driver.h, include/asm-generic/gpio.h, include/linux/gpio.=
h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/controller/dwc/pci-keystone.c: note: in included file (throu=
gh include/linux/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/controller/dwc/pcie-artpec6.c: note: in included file (throu=
gh include/linux/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/controller/dwc/pcie-armada8k.c: note: in included file (thro=
ugh include/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/switch/switchtec.c: note: in included file (through include/=
linux/pci.h, include/linux/switchtec.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/scheduler/sched_main.c: note: in included file (through =
include/drm/drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/scheduler/sched_entity.c: note: in included file (throug=
h include/drm/drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/tdfx/tdfx_drv.c: note: in included file (through include=
/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/mga/mga_state.c: note: in included file (through include=
/linux/pci.h, drivers/gpu/drm/mga/mga_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/mga/mga_warp.c: note: in included file (through include/=
linux/ihex.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/mga/mga_irq.c: note: in included file (through include/l=
inux/pci.h, drivers/gpu/drm/mga/mga_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/mga/mga_drv.c: note: in included file (through include/l=
inux/pci.h, drivers/gpu/drm/mga/mga_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/mga/mga_dma.c: note: in included file (through include/l=
inux/pci.h, drivers/gpu/drm/mga/mga_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/kmb/kmb_drv.c: note: in included file (through include/l=
inux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/kmb/kmb_crtc.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/kmb/kmb_plane.c: note: in included file (through include=
/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/kmb/kmb_dsi.c: note: in included file (through include/l=
inux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/v3d/v3d_mmu.c: note: in included file (through include/l=
inux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/v3d/v3d_gem.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/v3d/v3d_trace_points.c: note: in included file (through =
include/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/v3d/v3d_sched.c: note: in included file (through include=
/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/v3d/v3d_debugfs.c: note: in included file (through inclu=
de/linux/pm_runtime.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/v3d/v3d_bo.c: note: in included file (through include/li=
nux/dma-mapping.h, include/linux/dma-buf.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/v3d/v3d_fence.c: note: in included file (through include=
/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/v3d/v3d_drv.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/v3d/v3d_irq.c: note: in included file (through include/l=
inux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/via/via_dma.c: note: in included file (through include/d=
rm/drm_print.h, include/drm/drm_mm.h, drivers/gpu/drm/via/via_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/via/via_verifier.c: note: in included file (through incl=
ude/drm/drm_print.h, include/drm/drm_mm.h, drivers/gpu/drm/via/via_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/via/via_video.c: note: in included file (through include=
/drm/drm_print.h, include/drm/drm_mm.h, drivers/gpu/drm/via/via_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/via/via_dmablit.c: note: in included file (through inclu=
de/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/via/via_drv.c: note: in included file (through include/l=
inux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/via/via_irq.c: note: in included file (through include/l=
inux/hdmi.h, include/drm/drm_modes.h, include/drm/drm_vblank.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/via/via_map.c: note: in included file (through include/l=
inux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/via/via_mm.c: note: in included file (through include/dr=
m/drm_print.h, include/drm/drm_mm.h, drivers/gpu/drm/via/via_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   kernel/dma/map_benchmark.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> kernel/dma/map_benchmark.c:305:15: sparse: sparse: arithmetics on pointe=
rs to functions
>> kernel/dma/map_benchmark.c:305:15: sparse: sparse: arithmetics on pointe=
rs to functions
>> kernel/dma/map_benchmark.c:305:15: sparse: sparse: static assertion fail=
ed: "__same_type(map_benchmark_remove_debugfs + 0, void (*)(void *)) || __s=
ame_type(map_benchmark_remove_debugfs + 0, void (*)(typeof(map)))"
--
   kernel/dma/direct.c: note: in included file (through include/linux/dma-m=
apping.h, include/linux/dma-map-ops.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   kernel/dma/mapping.c: note: in included file (through include/linux/acpi=
.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   kernel/dma/remap.c: note: in included file (through include/linux/dma-ma=
pping.h, include/linux/dma-map-ops.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/bus/bt1-apb.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/bus/bt1-apb.c:136:15: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/bus/bt1-apb.c:136:15: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/bus/bt1-apb.c:136:15: sparse: sparse: static assertion failed: "=
__same_type(bt1_apb_clear_data + 0, void (*)(void *)) || __same_type(bt1_ap=
b_clear_data + 0, void (*)(typeof(apb)))"
   drivers/bus/bt1-apb.c:213:15: sparse: sparse: arithmetics on pointers to=
 functions
   drivers/bus/bt1-apb.c:213:15: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/bus/bt1-apb.c:213:15: sparse: sparse: static assertion failed: "=
__same_type(bt1_apb_disable_clk + 0, void (*)(void *)) || __same_type(bt1_a=
pb_disable_clk + 0, void (*)(typeof(apb)))"
   drivers/bus/bt1-apb.c:251:15: sparse: sparse: arithmetics on pointers to=
 functions
   drivers/bus/bt1-apb.c:251:15: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/bus/bt1-apb.c:251:15: sparse: sparse: static assertion failed: "=
__same_type(bt1_apb_clear_irq + 0, void (*)(void *)) || __same_type(bt1_apb=
_clear_irq + 0, void (*)(typeof(apb)))"
   drivers/bus/bt1-apb.c:365:15: sparse: sparse: arithmetics on pointers to=
 functions
   drivers/bus/bt1-apb.c:365:15: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/bus/bt1-apb.c:365:15: sparse: sparse: static assertion failed: "=
__same_type(bt1_apb_remove_sysfs + 0, void (*)(void *)) || __same_type(bt1_=
apb_remove_sysfs + 0, void (*)(typeof(apb)))"
--
   drivers/bus/bt1-axi.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/bus/bt1-axi.c:102:15: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/bus/bt1-axi.c:102:15: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/bus/bt1-axi.c:102:15: sparse: sparse: static assertion failed: "=
__same_type(bt1_axi_clear_data + 0, void (*)(void *)) || __same_type(bt1_ax=
i_clear_data + 0, void (*)(typeof(axi)))"
   drivers/bus/bt1-axi.c:173:15: sparse: sparse: arithmetics on pointers to=
 functions
   drivers/bus/bt1-axi.c:173:15: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/bus/bt1-axi.c:173:15: sparse: sparse: static assertion failed: "=
__same_type(bt1_axi_disable_clk + 0, void (*)(void *)) || __same_type(bt1_a=
xi_disable_clk + 0, void (*)(typeof(axi)))"
   drivers/bus/bt1-axi.c:258:15: sparse: sparse: arithmetics on pointers to=
 functions
   drivers/bus/bt1-axi.c:258:15: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/bus/bt1-axi.c:258:15: sparse: sparse: static assertion failed: "=
__same_type(bt1_axi_remove_sysfs + 0, void (*)(void *)) || __same_type(bt1_=
axi_remove_sysfs + 0, void (*)(typeof(axi)))"
--
   drivers/dax/bus.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/dax/bus.c:478:17: sparse: sparse: arithmetics on pointers to fun=
ctions
>> drivers/dax/bus.c:478:17: sparse: sparse: arithmetics on pointers to fun=
ctions
>> drivers/dax/bus.c:478:17: sparse: sparse: static assertion failed: "__sa=
me_type(unregister_dev_dax + 0, void (*)(void *)) || __same_type(unregister=
_dev_dax + 0, void (*)(typeof(victim)))"
   drivers/dax/bus.c:589:13: sparse: sparse: arithmetics on pointers to fun=
ctions
   drivers/dax/bus.c:589:13: sparse: sparse: arithmetics on pointers to fun=
ctions
>> drivers/dax/bus.c:589:13: sparse: sparse: static assertion failed: "__sa=
me_type(dax_region_unregister + 0, void (*)(void *)) || __same_type(dax_reg=
ion_unregister + 0, void (*)(typeof(dax_region)))"
   drivers/dax/bus.c:749:14: sparse: sparse: arithmetics on pointers to fun=
ctions
   drivers/dax/bus.c:749:14: sparse: sparse: arithmetics on pointers to fun=
ctions
>> drivers/dax/bus.c:749:14: sparse: sparse: static assertion failed: "__sa=
me_type(unregister_dax_mapping + 0, void (*)(void *)) || __same_type(unregi=
ster_dax_mapping + 0, void (*)(typeof(dev)))"
   drivers/dax/bus.c:885:25: sparse: sparse: arithmetics on pointers to fun=
ctions
   drivers/dax/bus.c:885:25: sparse: sparse: arithmetics on pointers to fun=
ctions
>> drivers/dax/bus.c:885:25: sparse: sparse: static assertion failed: "__sa=
me_type(unregister_dax_mapping + 0, void (*)(void *)) || __same_type(unregi=
ster_dax_mapping + 0, void (*)(typeof(&mapping->dev)))"
   drivers/dax/bus.c:1364:14: sparse: sparse: arithmetics on pointers to fu=
nctions
   drivers/dax/bus.c:1364:14: sparse: sparse: arithmetics on pointers to fu=
nctions
>> drivers/dax/bus.c:1364:14: sparse: sparse: static assertion failed: "__s=
ame_type(unregister_dev_dax + 0, void (*)(void *)) || __same_type(unregiste=
r_dev_dax + 0, void (*)(typeof(dev)))"
--
   drivers/dax/super.c: note: in included file (through include/linux/blk_t=
ypes.h, include/linux/genhd.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-max732x.c: note: in included file (through include/lin=
ux/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-max77650.c: note: in included file (through include/li=
nux/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-menz127.c: note: in included file (through include/lin=
ux/mcb.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpiolib-sysfs.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-mpc8xxx.c: note: in included file (through include/lin=
ux/gpio/driver.h, include/linux/of_gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-mockup.c: note: in included file (through include/linu=
x/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/gpio/gpio-mockup.c:451:14: sparse: sparse: arithmetics on pointe=
rs to functions
>> drivers/gpio/gpio-mockup.c:451:14: sparse: sparse: arithmetics on pointe=
rs to functions
>> drivers/gpio/gpio-mockup.c:451:14: sparse: sparse: static assertion fail=
ed: "__same_type(gpio_mockup_dispose_mappings + 0, void (*)(void *)) || __s=
ame_type(gpio_mockup_dispose_mappings + 0, void (*)(typeof(chip)))"
--
   drivers/gpio/gpio-mxc.c: note: in included file (through include/linux/p=
latform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-pcf857x.c: note: in included file (through include/lin=
ux/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-pch.c: note: in included file (through include/linux/g=
pio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-mxs.c: note: in included file (through include/linux/n=
ode.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-pxa.c: note: in included file (through include/linux/g=
pio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-rdc321x.c: note: in included file (through include/lin=
ux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-siox.c: note: in included file (through include/linux/=
siox.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-timberdale.c: note: in included file (through include/=
linux/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-tps6586x.c: note: in included file (through include/li=
nux/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-rcar.c: note: in included file (through include/linux/=
gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-tps65912.c: note: in included file (through include/li=
nux/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-twl6040.c: note: in included file (through include/lin=
ux/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-ucb1400.c: note: in included file (through include/sou=
nd/ac97_codec.h, include/linux/ucb1400.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpiolib-cdev.c: note: in included file (through include/lin=
ux/cdev.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-vx855.c: note: in included file (through include/linux=
/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-xgene-sb.c: note: in included file (through include/li=
nux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-xra1403.c: note: in included file (through include/lin=
ux/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpiolib.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-mmio.c: note: in included file (through include/linux/=
gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-adp5588.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-aggregator.c: note: in included file (through include/=
linux/gpio/driver.h, include/asm-generic/gpio.h, include/linux/gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-amd8111.c: note: in included file (through include/lin=
ux/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-amd-fch.c: note: in included file (through include/lin=
ux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-arizona.c: note: in included file (through include/lin=
ux/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-bd9571mwv.c: note: in included file (through include/l=
inux/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-ath79.c: note: in included file (through include/linux=
/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-bt8xx.c: note: in included file (through include/linux=
/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-da9052.c: note: in included file (through include/linu=
x/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-dwapb.c: note: in included file (through include/linux=
/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/gpio/gpio-dwapb.c:629:16: sparse: sparse: arithmetics on pointer=
s to functions
>> drivers/gpio/gpio-dwapb.c:629:16: sparse: sparse: arithmetics on pointer=
s to functions
>> drivers/gpio/gpio-dwapb.c:629:16: sparse: sparse: static assertion faile=
d: "__same_type(dwapb_assert_reset + 0, void (*)(void *)) || __same_type(dw=
apb_assert_reset + 0, void (*)(typeof(gpio)))"
   drivers/gpio/gpio-dwapb.c:659:16: sparse: sparse: arithmetics on pointer=
s to functions
   drivers/gpio/gpio-dwapb.c:659:16: sparse: sparse: arithmetics on pointer=
s to functions
>> drivers/gpio/gpio-dwapb.c:659:16: sparse: sparse: static assertion faile=
d: "__same_type(dwapb_disable_clks + 0, void (*)(void *)) || __same_type(dw=
apb_disable_clks + 0, void (*)(typeof(gpio)))"
--
   drivers/gpio/gpio-iop.c: note: in included file (through include/linux/g=
pio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-hisi.c: note: in included file (through include/linux/=
gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-kempld.c: note: in included file (through include/linu=
x/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-janz-ttl.c: note: in included file (through include/li=
nux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpiolib-legacy.c: note: in included file (through include/l=
inux/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpiolib-devres.c: note: in included file (through include/l=
inux/gpio/driver.h, include/asm-generic/gpio.h, include/linux/gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/gpio/gpiolib-devres.c:514:16: sparse: sparse: arithmetics on poi=
nters to functions
>> drivers/gpio/gpiolib-devres.c:514:16: sparse: sparse: arithmetics on poi=
nters to functions
>> drivers/gpio/gpiolib-devres.c:514:16: sparse: sparse: static assertion f=
ailed: "__same_type(devm_gpio_chip_release + 0, void (*)(void *)) || __same=
_type(devm_gpio_chip_release + 0, void (*)(typeof(gc)))"
--
   drivers/gpio/gpio-lp3943.c: note: in included file (through include/linu=
x/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-max3191x.c: note: in included file (through include/li=
nux/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-max7300.c: note: in included file (through include/lin=
ux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-max7301.c: note: in included file (through include/lin=
ux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpio/gpio-max730x.c: note: in included file (through include/lin=
ux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/char/hw_random/meson-rng.c: note: in included file (through incl=
ude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/char/hw_random/meson-rng.c:65:23: sparse: sparse: arithmetics on=
 pointers to functions
>> drivers/char/hw_random/meson-rng.c:65:23: sparse: sparse: arithmetics on=
 pointers to functions
>> drivers/char/hw_random/meson-rng.c:65:23: sparse: sparse: static asserti=
on failed: "__same_type(meson_rng_clk_disable + 0, void (*)(void *)) || __s=
ame_type(meson_rng_clk_disable + 0, void (*)(typeof(data->core_clk)))"
--
   drivers/char/hw_random/stm32-rng.c: note: in included file (through incl=
ude/linux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/char/hw_random/mtk-rng.c: note: in included file (through includ=
e/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/char/hw_random/npcm-rng.c: note: in included file (through inclu=
de/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/char/hw_random/xiphera-trng.c: note: in included file (through i=
nclude/linux/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/char/hw_random/core.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/char/hw_random/ba431-rng.c: note: in included file (through incl=
ude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/char/hw_random/virtio-rng.c: note: in included file (through inc=
lude/linux/virtio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/char/hw_random/timeriomem-rng.c: note: in included file (through=
 include/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/char/xillybus/xillybus_core.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/char/xillybus/xillybus_pcie.c: note: in included file (through i=
nclude/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/char/xillybus/xillybus_pcie.c:117:16: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/char/xillybus/xillybus_pcie.c:117:16: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/char/xillybus/xillybus_pcie.c:117:16: sparse: sparse: static ass=
ertion failed: "__same_type(xilly_pci_unmap + 0, void (*)(void *)) || __sam=
e_type(xilly_pci_unmap + 0, void (*)(typeof(this)))"
--
   drivers/bus/mhi/pci_generic.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-icade.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-ite.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-gyration.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-jabra.c: note: in included file (through include/linux/i=
nput.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-kensington.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-keytouch.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-kye.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-lg3ff.c: note: in included file (through include/linux/i=
nput.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-lg.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-lg4ff.c: note: in included file (through include/linux/i=
nput.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-lg-g15.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-macally.c: note: in included file (through include/linux=
/input.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-maltron.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-mf.c: note: in included file (through include/linux/inpu=
t.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-nti.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-magicmouse.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-microsoft.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-ortek.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-prodikeys.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-pl.c: note: in included file (through include/linux/inpu=
t.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-picolcd_leds.c: note: in included file (through include/=
linux/input.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-picolcd_fb.c: note: in included file (through include/li=
nux/input.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-quirks.c: note: in included file (through include/linux/=
input.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-picolcd_core.c: note: in included file (through include/=
linux/input.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-picolcd_backlight.c: note: in included file (through inc=
lude/linux/input.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-plantronics.c: note: in included file (through include/l=
inux/input.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-primax.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-saitek.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-speedlink.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-steelseries.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-rmi.c: note: in included file (through include/linux/inp=
ut.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hid/hid-rmi.c:631:15: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/hid/hid-rmi.c:631:15: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/hid/hid-rmi.c:631:15: sparse: sparse: static assertion failed: "=
__same_type(&rmi_irq_teardown + 0, void (*)(void *)) || __same_type(&rmi_ir=
q_teardown + 0, void (*)(typeof(hdata)))"
--
   drivers/hid/hid-gaff.c: note: in included file (through include/linux/in=
put.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-steam.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-picolcd_debugfs.c: note: in included file (through inclu=
de/linux/input.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-tmff.c: note: in included file (through include/linux/in=
put.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-twinhan.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-xinmo.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-led.c: note: in included file (through include/linux/inp=
ut.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-wiimote-core.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-wiimote-debug.c: note: in included file (through drivers=
/hid/hid-wiimote.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-wiimote-modules.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-sensor-hub.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-core.c: note: in included file (through include/linux/in=
put.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-input.c: note: in included file (through include/linux/i=
nput.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-debug.c: note: in included file (through include/linux/i=
nput.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-a4tech.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-aureal.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-alps.c: note: in included file (through include/linux/in=
put.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-belkin.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-cherry.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-chicony.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-cmedia.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-cypress.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-elecom.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-emsff.c: note: in included file (through include/linux/i=
nput.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-ezkey.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-gembird.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-gfrm.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/hid-glorious.c: note: in included file (through include/linu=
x/input.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/adc128d818.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/adm1021.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/adm1029.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/adm1026.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/adm1031.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/adm9240.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/adm1177.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/adm1177.c:223:23: sparse: sparse: arithmetics on pointers =
to functions
>> drivers/hwmon/adm1177.c:223:23: sparse: sparse: arithmetics on pointers =
to functions
>> drivers/hwmon/adm1177.c:223:23: sparse: sparse: static assertion failed:=
 "__same_type(adm1177_remove + 0, void (*)(void *)) || __same_type(adm1177_=
remove + 0, void (*)(typeof(st)))"
--
   drivers/hwmon/ads7828.c: note: in included file (through include/linux/h=
wmon-sysfs.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ads7871.c: note: in included file (through include/linux/s=
pi/spi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/adt7x10.c: note: in included file (through include/linux/h=
wmon-sysfs.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/adt7410.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/adt7462.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/adt7475.c: note: in included file (through include/linux/n=
ode.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/atxp1.c: note: in included file (through include/linux/acp=
i.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/as370-hwmon.c: note: in included file (through include/lin=
ux/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/corsair-cpro.c: note: in included file (through include/li=
nux/input.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/bt1-pvt.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/bt1-pvt.c:894:15: sparse: sparse: arithmetics on pointers =
to functions
>> drivers/hwmon/bt1-pvt.c:894:15: sparse: sparse: arithmetics on pointers =
to functions
>> drivers/hwmon/bt1-pvt.c:894:15: sparse: sparse: static assertion failed:=
 "__same_type(pvt_clear_data + 0, void (*)(void *)) || __same_type(pvt_clea=
r_data + 0, void (*)(typeof(pvt)))"
   drivers/hwmon/bt1-pvt.c:961:15: sparse: sparse: arithmetics on pointers =
to functions
   drivers/hwmon/bt1-pvt.c:961:15: sparse: sparse: arithmetics on pointers =
to functions
>> drivers/hwmon/bt1-pvt.c:961:15: sparse: sparse: static assertion failed:=
 "__same_type(pvt_disable_clks + 0, void (*)(void *)) || __same_type(pvt_di=
sable_clks + 0, void (*)(typeof(pvt)))"
   drivers/hwmon/bt1-pvt.c:1118:15: sparse: sparse: arithmetics on pointers=
 to functions
   drivers/hwmon/bt1-pvt.c:1118:15: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/hwmon/bt1-pvt.c:1118:15: sparse: sparse: static assertion failed=
: "__same_type(pvt_disable_iface + 0, void (*)(void *)) || __same_type(pvt_=
disable_iface + 0, void (*)(typeof(pvt)))"
--
   drivers/hwmon/asc7621.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ds620.c: note: in included file (through include/linux/acp=
i.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/corsair-psu.c: note: in included file (through include/lin=
ux/input.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ds1621.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/emc1403.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/emc6w201.c: note: in included file (through include/linux/=
acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/f71805f.c: note: in included file (through include/linux/p=
latform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/g762.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/f75375s.c: note: in included file (through include/linux/h=
wmon-sysfs.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/gl520sm.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/hih6130.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/f71882fg.c: note: in included file (through include/linux/=
platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ina2xx.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ina209.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/i5k_amb.c: note: in included file (through include/linux/h=
wmon-sysfs.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ibmpex.c: note: in included file (through include/linux/ac=
pi.h, include/linux/ipmi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ibmaem.c: note: in included file (through include/linux/ac=
pi.h, include/linux/ipmi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/lineage-pem.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/it87.c: note: in included file (through include/linux/plat=
form_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/lm63.c: note: in included file (through include/linux/acpi=
.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/lm70.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/lm73.c: note: in included file (through include/linux/acpi=
.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/lm75.c: note: in included file (through include/linux/acpi=
.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/lm75.c:605:15: sparse: sparse: arithmetics on pointers to =
functions
>> drivers/hwmon/lm75.c:605:15: sparse: sparse: arithmetics on pointers to =
functions
>> drivers/hwmon/lm75.c:605:15: sparse: sparse: static assertion failed: "_=
_same_type(lm75_disable_regulator + 0, void (*)(void *)) || __same_type(lm7=
5_disable_regulator + 0, void (*)(typeof(data)))"
   drivers/hwmon/lm75.c:623:15: sparse: sparse: arithmetics on pointers to =
functions
   drivers/hwmon/lm75.c:623:15: sparse: sparse: arithmetics on pointers to =
functions
>> drivers/hwmon/lm75.c:623:15: sparse: sparse: static assertion failed: "_=
_same_type(lm75_remove + 0, void (*)(void *)) || __same_type(lm75_remove + =
0, void (*)(typeof(data)))"
--
   drivers/hwmon/lm77.c: note: in included file (through include/linux/acpi=
.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/lm80.c: note: in included file (through include/linux/acpi=
.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/lm83.c: note: in included file (through include/linux/acpi=
.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/lm87.c: note: in included file (through include/linux/acpi=
.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/lm87.c:881:14: sparse: sparse: arithmetics on pointers to =
functions
>> drivers/hwmon/lm87.c:881:14: sparse: sparse: arithmetics on pointers to =
functions
>> drivers/hwmon/lm87.c:881:14: sparse: sparse: static assertion failed: "_=
_same_type(lm87_restore_config + 0, void (*)(void *)) || __same_type(lm87_r=
estore_config + 0, void (*)(typeof(client)))"
--
   drivers/hwmon/lm90.c: note: in included file (through include/linux/acpi=
.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/lm90.c:1709:16: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/hwmon/lm90.c:1709:16: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/hwmon/lm90.c:1709:16: sparse: sparse: static assertion failed: "=
__same_type(lm90_restore_conf + 0, void (*)(void *)) || __same_type(lm90_re=
store_conf + 0, void (*)(typeof(data)))"
   drivers/hwmon/lm90.c:1802:15: sparse: sparse: arithmetics on pointers to=
 functions
   drivers/hwmon/lm90.c:1802:15: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/hwmon/lm90.c:1802:15: sparse: sparse: static assertion failed: "=
__same_type(lm90_regulator_disable + 0, void (*)(void *)) || __same_type(lm=
90_regulator_disable + 0, void (*)(typeof(regulator)))"
   drivers/hwmon/lm90.c:1896:23: sparse: sparse: arithmetics on pointers to=
 functions
   drivers/hwmon/lm90.c:1896:23: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/hwmon/lm90.c:1896:23: sparse: sparse: static assertion failed: "=
__same_type(lm90_remove_pec + 0, void (*)(void *)) || __same_type(lm90_remo=
ve_pec + 0, void (*)(typeof(dev)))"
--
   drivers/hwmon/ltc2945.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/lm93.c: note: in included file (through include/linux/acpi=
.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ltc2947-core.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/ltc2947-core.c:1010:23: sparse: sparse: arithmetics on poi=
nters to functions
>> drivers/hwmon/ltc2947-core.c:1010:23: sparse: sparse: arithmetics on poi=
nters to functions
>> drivers/hwmon/ltc2947-core.c:1010:23: sparse: sparse: static assertion f=
ailed: "__same_type(ltc2947_clk_disable + 0, void (*)(void *)) || __same_ty=
pe(ltc2947_clk_disable + 0, void (*)(typeof(extclk)))"
--
   drivers/hwmon/ltc2947-spi.c: note: in included file (through include/lin=
ux/spi/spi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/lm85.c: note: in included file (through include/linux/node=
.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ltc2990.c: note: in included file (through include/linux/h=
wmon-sysfs.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ltc4215.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ltc2992.c: note: in included file (through include/linux/g=
pio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ltc4151.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ltc4245.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ltc4260.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ltc4261.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/max127.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/max1111.c: note: in included file (through include/linux/h=
wmon-sysfs.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/max6621.c: note: in included file (through include/linux/h=
wmon-sysfs.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/max1668.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/max6639.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/max6642.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/max6697.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/mcp3021.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/mc13783-adc.c: note: in included file (through include/lin=
ux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/tc654.c: note: in included file (through include/linux/hwm=
on-sysfs.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/tps23861.c: note: in included file (through include/linux/=
hwmon-sysfs.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/menf21bmc_hwmon.c: note: in included file (through include=
/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/mr75203.c: note: in included file (through include/linux/p=
latform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/mr75203.c:479:16: sparse: sparse: arithmetics on pointers =
to functions
>> drivers/hwmon/mr75203.c:479:16: sparse: sparse: arithmetics on pointers =
to functions
>> drivers/hwmon/mr75203.c:479:16: sparse: sparse: static assertion failed:=
 "__same_type(pvt_clk_disable + 0, void (*)(void *)) || __same_type(pvt_clk=
_disable + 0, void (*)(typeof(pvt)))"
   drivers/hwmon/mr75203.c:497:16: sparse: sparse: arithmetics on pointers =
to functions
   drivers/hwmon/mr75203.c:497:16: sparse: sparse: arithmetics on pointers =
to functions
>> drivers/hwmon/mr75203.c:497:16: sparse: sparse: static assertion failed:=
 "__same_type(pvt_reset_control_assert + 0, void (*)(void *)) || __same_typ=
e(pvt_reset_control_assert + 0, void (*)(typeof(pvt)))"
--
   drivers/hwmon/ntc_thermistor.c: note: in included file (through include/=
linux/pm_runtime.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/nct7802.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/powr1220.c: note: in included file (through include/linux/=
acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pcf8591.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/sbtsi_temp.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/sl28cpld-hwmon.c: note: in included file (through include/=
linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/sht21.c: note: in included file (through include/linux/acp=
i.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/pc87427.c: note: in included file (through include/linux/p=
latform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/shtc1.c: note: in included file (through include/linux/acp=
i.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/smsc47b397.c: note: in included file (through include/linu=
x/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/smm665.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/sht3x.c: note: in included file (through include/linux/hwm=
on-sysfs.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/sparx5-temp.c: note: in included file (through include/lin=
ux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hwmon/sparx5-temp.c:134:15: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/hwmon/sparx5-temp.c:134:15: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/hwmon/sparx5-temp.c:134:15: sparse: sparse: static assertion fai=
led: "__same_type(s5_temp_clk_disable + 0, void (*)(void *)) || __same_type=
(s5_temp_clk_disable + 0, void (*)(typeof(hwmon->clk)))"
--
   drivers/hwmon/sis5595.c: note: in included file (through include/linux/p=
ci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/smsc47m1.c: note: in included file (through include/linux/=
platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/thmc50.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/tmp103.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/amc6821.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/nct6775.c: note: in included file (through include/linux/p=
latform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/tmp401.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/tmp421.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/w83l785ts.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/vt8231.c: note: in included file (through include/linux/pc=
i.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/vt1211.c: note: in included file (through include/linux/pl=
atform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/w83l786ng.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/wm8350-hwmon.c: note: in included file (through include/li=
nux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/w83627ehf.c: note: in included file (through include/linux=
/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/hwmon.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/w83773g.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/w83791d.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ad7414.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/ad7418.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/clk/sifive/fu740-prci.c: note: in included file (through include=
/linux/platform_device.h, drivers/clk/sifive/sifive-prci.h, drivers/clk/sif=
ive/fu540-prci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/clk/sifive/fu540-prci.c: note: in included file (through include=
/linux/platform_device.h, drivers/clk/sifive/sifive-prci.h, drivers/clk/sif=
ive/fu540-prci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/clk/sifive/sifive-prci.c: note: in included file (through includ=
e/linux/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mailbox/stm32-ipcc.c: note: in included file (through include/li=
nux/mailbox_controller.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mailbox/bcm-pdc-mailbox.c: note: in included file (through inclu=
de/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mailbox/mtk-cmdq-mailbox.c: note: in included file (through incl=
ude/linux/dma-mapping.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mailbox/sun6i-msgbox.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mailbox/sprd-mailbox.c: note: in included file (through include/=
linux/mailbox_controller.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/mailbox/sprd-mailbox.c:295:15: sparse: sparse: arithmetics on po=
inters to functions
>> drivers/mailbox/sprd-mailbox.c:295:15: sparse: sparse: arithmetics on po=
inters to functions
>> drivers/mailbox/sprd-mailbox.c:295:15: sparse: sparse: static assertion =
failed: "__same_type(sprd_mbox_disable + 0, void (*)(void *)) || __same_typ=
e(sprd_mbox_disable + 0, void (*)(typeof(priv)))"
--
   drivers/mailbox/mailbox.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mailbox/imx-mailbox.c: note: in included file (through include/l=
inux/firmware/imx/ipc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_gem_ttm_helper.c: note: in included file (through in=
clude/drm/drm_print.h, include/drm/drm_mm.h, include/drm/drm_vma_manager.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_gem_vram_helper.c: note: in included file (through i=
nclude/drm/drm_print.h, include/drm/drm_mm.h, include/drm/drm_vma_manager.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_bridge_connector.c: note: in included file (through =
include/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_dsc.c: note: in included file (through include/drm/d=
rm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_crtc_helper.c: note: in included file (through inclu=
de/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_dp_helper.c: note: in included file (through include=
/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_probe_helper.c: note: in included file (through incl=
ude/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_plane_helper.c: note: in included file (through incl=
ude/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_dp_dual_mode_helper.c: note: in included file (throu=
gh include/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_kms_helper_common.c: note: in included file (through=
 include/drm/drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_scdc_helper.c: note: in included file (through inclu=
de/drm/drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_simple_kms_helper.c: note: in included file (through=
 include/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_modeset_helper.c: note: in included file (through in=
clude/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_gem_framebuffer_helper.c: note: in included file (th=
rough include/linux/dma-mapping.h, include/linux/dma-buf.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_damage_helper.c: note: in included file (through inc=
lude/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_atomic_state_helper.c: note: in included file (throu=
gh include/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_self_refresh_helper.c: note: in included file (throu=
gh include/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_fb_cma_helper.c: note: in included file (through inc=
lude/drm/drm_print.h, include/drm/drm_mm.h, include/drm/drm_vma_manager.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_atomic_helper.c: note: in included file (through inc=
lude/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/bridge/panel.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_auth.c: note: in included file (through include/drm/=
drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_dp_cec.c: note: in included file (through include/me=
dia/cec.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_dp_mst_topology.c: note: in included file (through i=
nclude/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_fb_helper.c: note: in included file (through include=
/linux/dma-mapping.h, include/linux/dma-buf.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_file.c: note: in included file (through include/linu=
x/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_ioctl.c: note: in included file (through include/lin=
ux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_gem.c: note: in included file (through include/linux=
/blk_types.h, include/linux/writeback.h, include/linux/memcontrol.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_irq.c: note: in included file (through include/linux=
/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/gpu/drm/drm_irq.c:244:16: sparse: sparse: arithmetics on pointer=
s to functions
>> drivers/gpu/drm/drm_irq.c:244:16: sparse: sparse: arithmetics on pointer=
s to functions
>> drivers/gpu/drm/drm_irq.c:244:16: sparse: sparse: static assertion faile=
d: "__same_type(devm_drm_irq_uninstall + 0, void (*)(void *)) || __same_typ=
e(devm_drm_irq_uninstall + 0, void (*)(typeof(dev)))"
--
   drivers/gpu/drm/drm_drv.c: note: in included file (through include/linux=
/hdmi.h, include/drm/drm_connector.h, include/drm/drm_client.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/gpu/drm/drm_drv.c:677:16: sparse: sparse: arithmetics on pointer=
s to functions
>> drivers/gpu/drm/drm_drv.c:677:16: sparse: sparse: arithmetics on pointer=
s to functions
>> drivers/gpu/drm/drm_drv.c:677:16: sparse: sparse: static assertion faile=
d: "__same_type(devm_drm_dev_init_release + 0, void (*)(void *)) || __same_=
type(devm_drm_dev_init_release + 0, void (*)(typeof(dev)))"
--
   drivers/gpu/drm/drm_sysfs.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_hashtab.c: note: in included file (through include/d=
rm/drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_crtc.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_mm.c: note: in included file (through include/drm/dr=
m_print.h, include/drm/drm_mm.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_encoder_slave.c: note: in included file (through inc=
lude/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_trace_points.c: note: in included file (through incl=
ude/linux/node.h, include/linux/cpu.h, include/linux/static_call.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_rect.c: note: in included file (through include/drm/=
drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_prime.c: note: in included file (through include/lin=
ux/dma-mapping.h, include/linux/dma-buf.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_vma_manager.c: note: in included file (through inclu=
de/drm/drm_print.h, include/drm/drm_mm.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_modes.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_flip_work.c: note: in included file (through include=
/drm/drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_modeset_lock.c: note: in included file (through incl=
ude/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_encoder.c: note: in included file (through include/l=
inux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_blend.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_bridge.c: note: in included file (through include/li=
nux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_mode_object.c: note: in included file (through inclu=
de/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_connector.c: note: in included file (through include=
/linux/hdmi.h, include/drm/drm_connector.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_atomic.c: note: in included file (through include/li=
nux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_framebuffer.c: note: in included file (through inclu=
de/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_property.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_edid.c: note: in included file (through include/linu=
x/hdmi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_plane.c: note: in included file (through include/drm=
/drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_color_mgmt.c: note: in included file (through includ=
e/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_print.c: note: in included file (through include/drm=
/drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_dumb_buffers.c: note: in included file (through incl=
ude/drm/drm_print.h, include/drm/drm_mm.h, include/drm/drm_vma_manager.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_mode_config.c: note: in included file (through inclu=
de/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_syncobj.c: note: in included file (through include/d=
rm/drm_print.h, include/drm/drm_mm.h, include/drm/drm_vma_manager.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_lease.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h, include/uapi/linux/fb.h, include/linux/fb.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_vblank.c: note: in included file (through include/li=
nux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_writeback.c: note: in included file (through include=
/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_client.c: note: in included file (through include/li=
nux/hdmi.h, include/drm/drm_connector.h, include/drm/drm_client.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_client_modeset.c: note: in included file (through in=
clude/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_vblank_work.c: note: in included file (through inclu=
de/drm/drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_managed.c: note: in included file (through include/d=
rm/drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_atomic_uapi.c: note: in included file (through inclu=
de/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_hdcp.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_dma.c: note: in included file (through include/linux=
/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_context.c: note: in included file (through include/d=
rm/drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_legacy_misc.c: note: in included file (through inclu=
de/drm/drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_bufs.c: note: in included file (through include/linu=
x/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_lock.c: note: in included file (through include/drm/=
drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_vm.c: note: in included file (through include/linux/=
pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_scatter.c: note: in included file (through include/d=
rm/drm_print.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_memory.c: note: in included file (through include/li=
nux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_gem_cma_helper.c: note: in included file (through in=
clude/linux/dma-mapping.h, include/linux/dma-buf.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_panel.c: note: in included file (through include/lin=
ux/backlight.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_pci.c: note: in included file (through include/linux=
/dma-mapping.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_gem_shmem_helper.c: note: in included file (through =
include/linux/dma-mapping.h, include/linux/dma-buf.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_debugfs.c: note: in included file (through include/l=
inux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_mipi_dsi.c: note: in included file (through include/=
drm/drm_mipi_dsi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_edid_load.c: note: in included file (through include=
/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_debugfs_crc.c: note: in included file (through inclu=
de/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_panel_orientation_quirks.c: note: in included file (=
through include/linux/hdmi.h, include/drm/drm_connector.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/drm_mipi_dbi.c: note: in included file (through include/=
linux/dma-mapping.h, include/linux/dma-buf.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/memory/emif.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/memory/fsl_ifc.c: note: in included file (through include/linux/=
node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/memory/stm32-fmc2-ebi.c: note: in included file (through include=
/linux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/memory/bt1-l2-ctl.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/memory/bt1-l2-ctl.c:158:15: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/memory/bt1-l2-ctl.c:158:15: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/memory/bt1-l2-ctl.c:158:15: sparse: sparse: static assertion fai=
led: "__same_type(l2_ctl_clear_data + 0, void (*)(void *)) || __same_type(l=
2_ctl_clear_data + 0, void (*)(typeof(l2)))"
   drivers/memory/bt1-l2-ctl.c:276:15: sparse: sparse: arithmetics on point=
ers to functions
   drivers/memory/bt1-l2-ctl.c:276:15: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/memory/bt1-l2-ctl.c:276:15: sparse: sparse: static assertion fai=
led: "__same_type(l2_ctl_remove_sysfs + 0, void (*)(void *)) || __same_type=
(l2_ctl_remove_sysfs + 0, void (*)(typeof(l2)))"
--
   drivers/input/misc/iqs269a.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/kxtj9.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/misc/kxtj9.c:424:15: sparse: sparse: arithmetics on pointe=
rs to functions
>> drivers/input/misc/kxtj9.c:424:15: sparse: sparse: arithmetics on pointe=
rs to functions
>> drivers/input/misc/kxtj9.c:424:15: sparse: sparse: static assertion fail=
ed: "__same_type(kxtj9_platform_exit + 0, void (*)(void *)) || __same_type(=
kxtj9_platform_exit + 0, void (*)(typeof(tj9)))"
--
   drivers/input/misc/max77650-onkey.c: note: in included file (through inc=
lude/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/max8925_onkey.c: note: in included file (through incl=
ude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/max8997_haptic.c: note: in included file (through inc=
lude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/mma8450.c: note: in included file (through include/li=
nux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/mc13783-pwrbutton.c: note: in included file (through =
include/linux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/palmas-pwrbutton.c: note: in included file (through i=
nclude/linux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/pcap_keys.c: note: in included file (through include/=
linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/rotary_encoder.c: note: in included file (through inc=
lude/linux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/pwm-beeper.c: note: in included file (through include=
/linux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/sc27xx-vibra.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/twl6040-vibra.c: note: in included file (through incl=
ude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/uinput.c: note: in included file (through include/lin=
ux/input.h, include/uapi/linux/uinput.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/adxl34x.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/adxl34x-i2c.c: note: in included file (through includ=
e/linux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/arizona-haptics.c: note: in included file (through in=
clude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/cpcap-pwrbutton.c: note: in included file (through in=
clude/linux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/bma150.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/da7280.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/ad714x.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/da9052_onkey.c: note: in included file (through inclu=
de/linux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/da9055_onkey.c: note: in included file (through inclu=
de/linux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/e3x0-button.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/da9063_onkey.c: note: in included file (through inclu=
de/linux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/misc/da9063_onkey.c:239:17: sparse: sparse: arithmetics on=
 pointers to functions
>> drivers/input/misc/da9063_onkey.c:239:17: sparse: sparse: arithmetics on=
 pointers to functions
>> drivers/input/misc/da9063_onkey.c:239:17: sparse: sparse: static asserti=
on failed: "__same_type(da9063_cancel_poll + 0, void (*)(void *)) || __same=
_type(da9063_cancel_poll + 0, void (*)(typeof(onkey)))"
--
   drivers/input/misc/drv260x.c: note: in included file (through include/li=
nux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/gpio-beeper.c: note: in included file (through includ=
e/linux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/drv2665.c: note: in included file (through include/li=
nux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/drv2667.c: note: in included file (through include/li=
nux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/gpio_decoder.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/gpio-vibra.c: note: in included file (through include=
/linux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/misc/hisi_powerkey.c: note: in included file (through incl=
ude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/wcd934x.c: note: in included file (through include/linux/gpi=
o/driver.h, include/asm-generic/gpio.h, include/linux/gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/wm8400-core.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/wm8350-core.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/wm8350-regmap.c: note: in included file (through include/lin=
ux/platform_device.h, include/linux/mfd/wm8350/audio.h, include/linux/mfd/w=
m8350/core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/wm8350-gpio.c: note: in included file (through include/linux=
/platform_device.h, include/linux/mfd/wm8350/audio.h, include/linux/mfd/wm8=
350/core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/wm8350-irq.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/tps65086.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/tps65912-core.c: note: in included file (through include/lin=
ux/platform_device.h, include/linux/mfd/core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/wm8350-i2c.c: note: in included file (through include/linux/=
acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/tps65912-i2c.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/tps80031.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/tps65912-spi.c: note: in included file (through include/linu=
x/spi/spi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/fsl-imx25-tsadc.c: note: in included file (through include/l=
inux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/twl6040.c: note: in included file (through include/linux/pla=
tform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/mc13xxx-core.c: note: in included file (through include/linu=
x/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/mc13xxx-spi.c: note: in included file (through include/linux=
/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/mc13xxx-i2c.c: note: in included file (through include/linux=
/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/ezx-pcap.c: note: in included file (through include/linux/pl=
atform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/88pm805.c: note: in included file (through include/linux/acp=
i.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/mfd-core.c: note: in included file (through include/linux/pl=
atform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/motorola-cpcap.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/ucb1400_core.c: note: in included file (through include/soun=
d/ac97_codec.h, include/linux/ucb1400.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/da903x.c: note: in included file (through include/linux/plat=
form_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/da9052-core.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/da9052-irq.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/da9052-spi.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/lp3943.c: note: in included file (through include/linux/gpio=
/driver.h, include/asm-generic/gpio.h, include/linux/gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/lp8788.c: note: in included file (through include/linux/acpi=
.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/ti-lmu.c: note: in included file (through include/linux/acpi=
.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/mfd/ti-lmu.c:181:15: sparse: sparse: arithmetics on pointers to =
functions
>> drivers/mfd/ti-lmu.c:181:15: sparse: sparse: arithmetics on pointers to =
functions
>> drivers/mfd/ti-lmu.c:181:15: sparse: sparse: static assertion failed: "_=
_same_type(ti_lmu_disable_hw + 0, void (*)(void *)) || __same_type(ti_lmu_d=
isable_hw + 0, void (*)(typeof(lmu)))"
--
   drivers/mfd/lp8788-irq.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/da9055-core.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/da9055-i2c.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/da9062-core.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/da9150-core.c: note: in included file (through include/linux=
/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/max77620.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/max77650.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/max77693.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/max8907.c: note: in included file (through include/linux/acp=
i.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/max8925-i2c.c: note: in included file (through include/linux=
/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/max8925-core.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/max8997.c: note: in included file (through include/linux/acp=
i.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/max8997-irq.c: note: in included file (through include/linux=
/blk_types.h, include/linux/writeback.h, include/linux/memcontrol.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/pcf50633-adc.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/pcf50633-core.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/pcf50633-irq.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h, include/linux/mfd/pcf50633/core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/abx500-core.c: note: in included file (through include/linux=
/blk_types.h, include/linux/writeback.h, include/linux/memcontrol.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/lpc_sch.c: note: in included file (through include/linux/acp=
i.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/kempld-core.c: note: in included file (through include/linux=
/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/tps6586x.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/rdc321x-southbridge.c: note: in included file (through inclu=
de/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/lpc_ich.c: note: in included file (through include/linux/acp=
i.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/janz-cmodio.c: note: in included file (through include/linux=
/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/timberdale.c: note: in included file (through include/linux/=
pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/pcf50633-gpio.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h, include/linux/mfd/pcf50633/core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/vx855.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/wl1273-core.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h, include/linux/mfd/wl1273-core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/si476x-prop.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h, include/linux/mfd/si476x-core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/aat2870-core.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/si476x-i2c.c: note: in included file (through include/linux/=
gpio/driver.h, include/asm-generic/gpio.h, include/linux/gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/si476x-cmd.c: note: in included file (through include/linux/=
acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/intel_pmt.c: note: in included file (through include/linux/p=
latform_device.h, include/linux/mfd/core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/rc5t583.c: note: in included file (through include/linux/acp=
i.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/palmas.c: note: in included file (through include/linux/acpi=
.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/rc5t583-irq.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/sec-core.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/sec-irq.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/syscon.c: note: in included file (through include/linux/of_p=
latform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/as3711.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/menf21bmc.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/iqs62x.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/mt6397-core.c: note: in included file (through include/linux=
/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/sky81452.c: note: in included file (through include/linux/ac=
pi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/mt6358-irq.c: note: in included file (through include/linux/=
node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/rt5033.c: note: in included file (through include/linux/node=
.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/mt6360-core.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/stm32-lptimer.c: note: in included file (through include/lin=
ux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/sun4i-gpadc.c: note: in included file (through include/linux=
/platform_device.h, include/linux/mfd/core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/mt6397-irq.c: note: in included file (through include/linux/=
node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/mxs-lradc.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/stm32-timers.c: note: in included file (through include/linu=
x/dmaengine.h, include/linux/mfd/stm32-timers.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/khadas-mcu.c: note: in included file (through include/linux/=
acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/simple-mfd-i2c.c: note: in included file (through include/li=
nux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/acer-ec-a500.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/stmfx.c: note: in included file (through include/linux/acpi.=
h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/bd9571mwv.c: note: in included file (through include/linux/a=
cpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/exynos-lpass.c: note: in included file (through include/linu=
x/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/htc-pasic3.c: note: in included file (through include/linux/=
platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/sun6i-prcm.c: note: in included file (through include/linux/=
platform_device.h, include/linux/mfd/core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/tqmx86.c: note: in included file (through include/linux/acpi=
.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/arizona-core.c: note: in included file (through include/linu=
x/platform_device.h, include/linux/mfd/core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/88pm800.c: note: in included file (through include/linux/acp=
i.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/arizona-irq.c: note: in included file (through include/linux=
/gpio/driver.h, include/asm-generic/gpio.h, include/linux/gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/arizona-i2c.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/wm5110-tables.c: note: in included file (through include/lin=
ux/blk_types.h, include/linux/writeback.h, include/linux/memcontrol.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/wm8998-tables.c: note: in included file (through include/lin=
ux/blk_types.h, include/linux/writeback.h, include/linux/memcontrol.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/mfd/88pm80x.c: note: in included file (through include/linux/acp=
i.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/opp/cpu.c: note: in included file (through include/linux/node.h,=
 include/linux/cpu.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/opp/debugfs.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/opp/core.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/opp/core.c:2223:15: sparse: sparse: arithmetics on pointers to f=
unctions
>> drivers/opp/core.c:2223:15: sparse: sparse: arithmetics on pointers to f=
unctions
>> drivers/opp/core.c:2223:15: sparse: sparse: static assertion failed: "__=
same_type(devm_pm_opp_unregister_set_opp_helper + 0, void (*)(void *)) || _=
_same_type(devm_pm_opp_unregister_set_opp_helper + 0, void (*)(typeof(opp_t=
able)))"
   drivers/opp/core.c:2394:15: sparse: sparse: arithmetics on pointers to f=
unctions
   drivers/opp/core.c:2394:15: sparse: sparse: arithmetics on pointers to f=
unctions
>> drivers/opp/core.c:2394:15: sparse: sparse: static assertion failed: "__=
same_type(devm_pm_opp_detach_genpd + 0, void (*)(void *)) || __same_type(de=
vm_pm_opp_detach_genpd + 0, void (*)(typeof(opp_table)))"
--
   drivers/input/mouse/elan_i2c_smbus.c: note: in included file (through in=
clude/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/mouse/gpio_mouse.c: note: in included file (through includ=
e/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/mouse/psmouse-base.c: note: in included file (through incl=
ude/linux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/mouse/focaltech.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/mouse/logips2pp.c: note: in included file (through include=
/linux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/mouse/synaptics.c: note: in included file (through include=
/linux/input.h, include/linux/input/mt.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/mouse/alps.c: note: in included file (through include/linu=
x/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/mouse/trackpoint.c: note: in included file (through includ=
e/linux/serio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/mouse/sentelic.c: note: in included file (through include/=
linux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/mouse/touchkit_ps2.c: note: in included file (through incl=
ude/linux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/mouse/vsxxxaa.c: note: in included file (through include/l=
inux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/mouse/elan_i2c_core.c: note: in included file (through inc=
lude/linux/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/mouse/elan_i2c_core.c:1235:17: sparse: sparse: arithmetics=
 on pointers to functions
>> drivers/input/mouse/elan_i2c_core.c:1235:17: sparse: sparse: arithmetics=
 on pointers to functions
>> drivers/input/mouse/elan_i2c_core.c:1235:17: sparse: sparse: static asse=
rtion failed: "__same_type(elan_disable_regulator + 0, void (*)(void *)) ||=
 __same_type(elan_disable_regulator + 0, void (*)(typeof(data)))"
--
   drivers/input/mouse/elan_i2c_i2c.c: note: in included file (through incl=
ude/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/rmi4/rmi_f01.c: note: in included file (through include/li=
nux/rmi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/rmi4/rmi_driver.c: note: in included file (through include=
/linux/rmi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/rmi4/rmi_2d_sensor.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/rmi4/rmi_f03.c: note: in included file (through include/li=
nux/serio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/rmi4/rmi_f12.c: note: in included file (through include/li=
nux/input.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/rmi4/rmi_f11.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/rmi4/rmi_f55.c: note: in included file (through include/li=
nux/rmi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/rmi4/rmi_f30.c: note: in included file (through include/li=
nux/rmi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/rmi4/rmi_i2c.c: note: in included file (through include/li=
nux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/rmi4/rmi_i2c.c:244:17: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/input/rmi4/rmi_i2c.c:244:17: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/input/rmi4/rmi_i2c.c:244:17: sparse: sparse: static assertion fa=
iled: "__same_type(rmi_i2c_regulator_bulk_disable + 0, void (*)(void *)) ||=
 __same_type(rmi_i2c_regulator_bulk_disable + 0, void (*)(typeof(rmi_i2c)))"
   drivers/input/rmi4/rmi_i2c.c:282:17: sparse: sparse: arithmetics on poin=
ters to functions
   drivers/input/rmi4/rmi_i2c.c:282:17: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/input/rmi4/rmi_i2c.c:282:17: sparse: sparse: static assertion fa=
iled: "__same_type(rmi_i2c_unregister_transport + 0, void (*)(void *)) || _=
_same_type(rmi_i2c_unregister_transport + 0, void (*)(typeof(rmi_i2c)))"
--
   drivers/input/rmi4/rmi_bus.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/input/rmi4/rmi_smbus.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/bd28623.c: note: in included file (through include/linu=
x/blk_types.h, include/linux/writeback.h, include/linux/memcontrol.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/bt-sco.c: note: in included file (through include/linux=
/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cpcap.c: note: in included file (through include/linux/=
platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs35l32.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs35l33.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/adau1372-i2c.c: note: in included file (through include=
/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs35l35.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs42l42.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs35l36.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs42l51-i2c.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs42l51.c: note: in included file (through include/soun=
d/core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs42l52.c: note: in included file (through include/linu=
x/gpio/driver.h, include/linux/of_gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs42l56.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs4234.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs4265.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs4270.c: note: in included file (through include/sound=
/core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs4271.c: note: in included file (through include/linux=
/gpio/driver.h, include/asm-generic/gpio.h, include/linux/gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs4271-i2c.c: note: in included file (through include/l=
inux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs42xx8.c: note: in included file (through include/linu=
x/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs42xx8-i2c.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs4341.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs4349.c: note: in included file (through include/linux=
/gpio/driver.h, include/asm-generic/gpio.h, include/linux/gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs53l30.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cs43130.c: note: in included file (through include/linu=
x/gpio/driver.h, include/asm-generic/gpio.h, include/linux/gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/dmic.c: note: in included file (through include/linux/g=
pio/driver.h, include/asm-generic/gpio.h, include/linux/gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/cx2072x.c: note: in included file (through include/linu=
x/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/da7219-aad.c: note: in included file (through include/l=
inux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/da7219.c: note: in included file (through include/linux=
/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/es7134.c: note: in included file (through include/linux=
/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/es7241.c: note: in included file (through include/linux=
/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/max9759.c: note: in included file (through include/linu=
x/platform_device.h, include/sound/soc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/max98088.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/max98357a.c: note: in included file (through include/li=
nux/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/max9867.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/max98373.c: note: in included file (through include/lin=
ux/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/max98927.c: note: in included file (through include/lin=
ux/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/max98373-i2c.c: note: in included file (through include=
/linux/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/max98390.c: note: in included file (through include/lin=
ux/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/max9860.c: note: in included file (through include/linu=
x/pm_runtime.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/mt6359.c: note: in included file (through include/linux=
/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/msm8916-wcd-digital.c: note: in included file (through =
include/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/mt6660.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/mt6358.c: note: in included file (through include/linux=
/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/nau8822.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/nau8810.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/nau8315.c: note: in included file (through include/linu=
x/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/pcm1789-i2c.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/pcm179x.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/nau8824.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/hdmi-codec.c: note: in included file (through include/s=
ound/core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/pcm179x-i2c.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/pcm1789.c: note: in included file (through include/linu=
x/pm_qos.h, include/sound/pcm.h, include/sound/pcm_params.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/pcm186x-i2c.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/pcm179x-spi.c: note: in included file (through include/=
linux/spi/spi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/pcm186x.c: note: in included file (through include/linu=
x/pm_runtime.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/pcm186x-spi.c: note: in included file (through include/=
linux/spi/spi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/pcm3060.c: note: in included file (through include/linu=
x/pm_qos.h, include/sound/pcm.h, include/sound/pcm_params.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/pcm3060-i2c.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/pcm3060-spi.c: note: in included file (through include/=
linux/spi/spi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/pcm3168a-i2c.c: note: in included file (through include=
/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/pcm3168a.c: note: in included file (through include/lin=
ux/gpio/driver.h, include/linux/of_gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/rt5631.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/sigmadsp-i2c.c: note: in included file (through include=
/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/sigmadsp.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/rt5659.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/spdif_transmitter.c: note: in included file (through in=
clude/linux/platform_device.h, include/sound/soc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/rt5645.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/spdif_receiver.c: note: in included file (through inclu=
de/linux/platform_device.h, include/sound/soc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/ssm2305.c: note: in included file (through include/linu=
x/platform_device.h, include/sound/soc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/sgtl5000.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/rt5640.c: note: in included file (through include/linux=
/gpio/driver.h, include/asm-generic/gpio.h, include/linux/gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> sound/soc/codecs/rt5640.c:2835:15: sparse: sparse: arithmetics on pointe=
rs to functions
>> sound/soc/codecs/rt5640.c:2835:15: sparse: sparse: arithmetics on pointe=
rs to functions
>> sound/soc/codecs/rt5640.c:2835:15: sparse: sparse: static assertion fail=
ed: "__same_type(rt5640_cancel_work + 0, void (*)(void *)) || __same_type(r=
t5640_cancel_work + 0, void (*)(typeof(rt5640)))"
--
   sound/soc/codecs/ssm2602-spi.c: note: in included file (through include/=
linux/spi/spi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/ssm2602-i2c.c: note: in included file (through include/=
linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/ssm2602.c: note: in included file (through include/linu=
x/pm_qos.h, include/sound/pcm.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/ssm4567.c: note: in included file (through include/linu=
x/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/sta32x.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/sta350.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/sti-sas.c: note: in included file (through include/linu=
x/platform_device.h, include/sound/soc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/adau1701.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tas5086.c: note: in included file (through include/linu=
x/gpio/driver.h, include/asm-generic/gpio.h, include/linux/gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tas2562.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tas5720.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tas6424.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tda7419.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tas571x.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tfa9879.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tas2770.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tlv320aic23-i2c.c: note: in included file (through incl=
ude/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tlv320aic23-spi.c: note: in included file (through incl=
ude/linux/spi/spi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tlv320aic32x4-clk.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tlv320aic23.c: note: in included file (through include/=
sound/core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tlv320aic32x4-spi.c: note: in included file (through in=
clude/linux/spi/spi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tscs42xx.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tlv320aic32x4.c: note: in included file (through includ=
e/linux/gpio/driver.h, include/asm-generic/gpio.h, include/linux/gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/ts3a227e.c: note: in included file (through include/lin=
ux/gpio/driver.h, include/asm-generic/gpio.h, include/linux/gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tlv320aic31xx.c: note: in included file (through includ=
e/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8510.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wcd-clsh-v2.c: note: in included file (through include/=
linux/platform_device.h, include/sound/soc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8523.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tscs454.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8711.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8580.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8728.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/twl6040.c: note: in included file (through include/linu=
x/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wcd934x.c: note: in included file (through include/linu=
x/blk_types.h, include/linux/writeback.h, include/linux/memcontrol.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wcd9335.c: note: in included file (through include/linu=
x/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8737.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8741.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8804-i2c.c: note: in included file (through include/l=
inux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8782.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8753.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8770.c: note: in included file (through include/linux=
/node.h, include/linux/cpu.h, include/linux/of_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8804-spi.c: note: in included file (through include/l=
inux/spi/spi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8776.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8731.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8804.c: note: in included file (through include/linux=
/pm_runtime.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8904.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8974.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8960.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/simple-amplifier.c: note: in included file (through inc=
lude/linux/blk_types.h, include/linux/writeback.h, include/linux/memcontrol=
.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/tpa6130a2.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/max98504.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/zl38060.c: note: in included file (through include/linu=
x/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8903.c: note: in included file (through include/linux=
/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/lpass-va-macro.c: note: in included file (through inclu=
de/linux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/simple-mux.c: note: in included file (through include/l=
inux/blk_types.h, include/linux/writeback.h, include/linux/memcontrol.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/lpass-wsa-macro.c: note: in included file (through incl=
ude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/lpass-tx-macro.c: note: in included file (through inclu=
de/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8978.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/lpass-rx-macro.c: note: in included file (through inclu=
de/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/wm8962.c: note: in included file (through include/linux=
/gpio/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/adau7002.c: note: in included file (through include/lin=
ux/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/adau7118.c: note: in included file (through include/lin=
ux/blk_types.h, include/linux/writeback.h, include/linux/memcontrol.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> sound/soc/codecs/adau7118.c:485:16: sparse: sparse: arithmetics on point=
ers to functions
>> sound/soc/codecs/adau7118.c:485:16: sparse: sparse: arithmetics on point=
ers to functions
>> sound/soc/codecs/adau7118.c:485:16: sparse: sparse: static assertion fai=
led: "__same_type(adau7118_regulator_disable + 0, void (*)(void *)) || __sa=
me_type(adau7118_regulator_disable + 0, void (*)(typeof(st)))"
--
   sound/soc/codecs/adau7118-hw.c: note: in included file (through include/=
linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/ak4104.c: note: in included file (through include/linux=
/spi/spi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/ak4118.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/ac97.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/ak4613.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/ak4642.c: note: in included file (through include/linux=
/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/ak5386.c: note: in included file (through include/linux=
/gpio/driver.h, include/linux/of_gpio.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/alc5623.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/alc5632.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/codecs/adau1372.c: note: in included file (through include/sou=
nd/core.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/bus/mhi/core/main.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/bus/mhi/core/boot.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/bus/mhi/core/pm.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/bus/mhi/core/init.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/meson/axg-toddr.c: note: in included file (through include/lin=
ux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/meson/axg-tdmin.c: note: in included file (through include/lin=
ux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/meson/axg-tdm-interface.c: note: in included file (through inc=
lude/linux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/meson/axg-tdm-formatter.c: note: in included file (through inc=
lude/linux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/meson/axg-tdmout.c: note: in included file (through include/li=
nux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/meson/axg-card.c: note: in included file (through include/linu=
x/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/meson/axg-spdifin.c: note: in included file (through include/l=
inux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/meson/meson-card-utils.c: note: in included file (through incl=
ude/linux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/meson/meson-codec-glue.c: note: in included file (through incl=
ude/linux/pm_qos.h, include/sound/pcm.h, include/sound/pcm_params.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/meson/gx-card.c: note: in included file (through include/linux=
/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/meson/axg-fifo.c: note: in included file (through include/linu=
x/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/meson/g12a-tohdmitx.c: note: in included file (through include=
/linux/pm_qos.h, include/sound/pcm.h, include/sound/pcm_params.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/meson/g12a-toacodec.c: note: in included file (through include=
/linux/pm_qos.h, include/sound/pcm.h, include/sound/pcm_params.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   sound/soc/meson/t9015.c: note: in included file (through include/linux/b=
lk_types.h, include/linux/writeback.h, include/linux/memcontrol.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> sound/soc/meson/t9015.c:280:15: sparse: sparse: arithmetics on pointers =
to functions
>> sound/soc/meson/t9015.c:280:15: sparse: sparse: arithmetics on pointers =
to functions
>> sound/soc/meson/t9015.c:280:15: sparse: sparse: static assertion failed:=
 "__same_type((void(*)(void *))clk_disable_unprepare + 0, void (*)(void *))=
 || __same_type((void(*)(void *))clk_disable_unprepare + 0, void (*)(typeof=
(priv->pclk)))"
--
   sound/soc/meson/axg-frddr.c: note: in included file (through include/lin=
ux/of_platform.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/setup-res.c: note: in included file (through include/linux/p=
ci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/irq.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/vpd.c: note: in included file (through include/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/mmap.c: note: in included file (through include/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/setup-irq.c: note: in included file (through include/linux/p=
ci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/vc.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/msi.c: note: in included file (through include/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/setup-bus.c: note: in included file (through include/linux/p=
ci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/slot.c: note: in included file (through include/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/pci-stub.c: note: in included file (through include/linux/pc=
i.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/proc.c: note: in included file (through include/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/ecam.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/quirks.c: note: in included file (through include/linux/pci.=
h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/bus.c: note: in included file (through include/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/access.c: note: in included file (through include/linux/pci.=
h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/host-bridge.c: note: in included file (through include/linux=
/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/probe.c: note: in included file (through include/linux/pci.h=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/pci/probe.c:633:15: sparse: sparse: arithmetics on pointers to f=
unctions
>> drivers/pci/probe.c:633:15: sparse: sparse: arithmetics on pointers to f=
unctions
>> drivers/pci/probe.c:633:15: sparse: sparse: static assertion failed: "__=
same_type(devm_pci_alloc_host_bridge_release + 0, void (*)(void *)) || __sa=
me_type(devm_pci_alloc_host_bridge_release + 0, void (*)(typeof(bridge)))"
--
   drivers/pci/remove.c: note: in included file (through include/linux/pci.=
h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/pci-driver.c: note: in included file (through include/linux/=
pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/search.c: note: in included file (through include/linux/pci.=
h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/pci.c: note: in included file (through include/linux/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/pci-sysfs.c: note: in included file (through include/linux/p=
ci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/rom.c: note: in included file (through include/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/intel-ish-hid/ishtp/client.c: note: in included file (throug=
h include/linux/dma-mapping.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/intel-ish-hid/ishtp/bus.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/intel-ish-hid/ishtp/dma-if.c: note: in included file (throug=
h include/linux/dma-mapping.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/intel-ish-hid/ishtp/client-buffers.c: note: in included file=
 (through drivers/hid/intel-ish-hid/ishtp/bus.h, drivers/hid/intel-ish-hid/=
ishtp/ishtp-dev.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/intel-ish-hid/ipc/ipc.c: note: in included file (through dri=
vers/hid/intel-ish-hid/ishtp/bus.h, drivers/hid/intel-ish-hid/ishtp/ishtp-d=
ev.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/intel-ish-hid/ishtp-hid.c: note: in included file (through i=
nclude/linux/input.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/intel-ish-hid/ipc/pci-ish.c: note: in included file (through=
 include/linux/acpi.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/intel-ish-hid/ishtp-hid-client.c: note: in included file (th=
rough include/linux/input.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/intel-ish-hid/ishtp/init.c: note: in included file (through =
drivers/hid/intel-ish-hid/ishtp/bus.h, drivers/hid/intel-ish-hid/ishtp/isht=
p-dev.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/intel-ish-hid/ishtp/hbm.c: note: in included file (through d=
rivers/hid/intel-ish-hid/ishtp/bus.h, drivers/hid/intel-ish-hid/ishtp/ishtp=
-dev.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/occ/sysfs.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/occ/p8_i2c.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hwmon/occ/common.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/pcie/portdrv_pci.c: note: in included file (through include/=
linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/pcie/err.c: note: in included file (through include/linux/pc=
i.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/pcie/rcec.c: note: in included file (through include/linux/p=
ci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/pcie/pme.c: note: in included file (through include/linux/pc=
i.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/pci/pcie/portdrv_core.c: note: in included file (through include=
/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/vgem/vgem_drv.c: note: in included file (through include=
/linux/dma-mapping.h, include/linux/dma-buf.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/vgem/vgem_fence.c: note: in included file (through inclu=
de/linux/dma-mapping.h, include/linux/dma-buf.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/ttm/ttm_bo.c: note: in included file (through include/dr=
m/drm_print.h, include/drm/drm_mm.h, include/drm/ttm/ttm_bo_driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/ttm/ttm_bo_util.c: note: in included file (through inclu=
de/drm/drm_print.h, include/drm/drm_mm.h, include/drm/ttm/ttm_bo_driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/ttm/ttm_memory.c: note: in included file (through includ=
e/drm/drm_print.h, include/drm/drm_mm.h, include/drm/drm_vma_manager.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/ttm/ttm_module.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/ttm/ttm_bo_vm.c: note: in included file (through include=
/drm/drm_print.h, include/drm/drm_mm.h, include/drm/ttm/ttm_bo_driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/ttm/ttm_execbuf_util.c: note: in included file (through =
include/drm/drm_print.h, include/drm/drm_mm.h, include/drm/drm_vma_manager.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/ttm/ttm_range_manager.c: note: in included file (through=
 include/drm/drm_print.h, include/drm/drm_mm.h, include/drm/ttm/ttm_bo_driv=
er.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/ttm/ttm_resource.c: note: in included file (through incl=
ude/drm/drm_print.h, include/drm/ttm/ttm_resource.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/ttm/ttm_pool.c: note: in included file (through include/=
linux/dma-mapping.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/ttm/ttm_tt.c: note: in included file (through include/li=
nux/blk_types.h, include/linux/writeback.h, include/linux/memcontrol.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/amd-sfh-hid/amd_sfh_hid.c: note: in included file (through i=
nclude/linux/input.h, include/linux/hid.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/amd-sfh-hid/amd_sfh_client.c: note: in included file (throug=
h include/linux/dma-mapping.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/hid/amd-sfh-hid/amd_sfh_pcie.c: note: in included file (through =
include/linux/dma-mapping.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/hid/amd-sfh-hid/amd_sfh_pcie.c:129:14: sparse: sparse: arithmeti=
cs on pointers to functions
>> drivers/hid/amd-sfh-hid/amd_sfh_pcie.c:129:14: sparse: sparse: arithmeti=
cs on pointers to functions
>> drivers/hid/amd-sfh-hid/amd_sfh_pcie.c:129:14: sparse: sparse: static as=
sertion failed: "__same_type(amd_mp2_pci_remove + 0, void (*)(void *)) || _=
_same_type(amd_mp2_pci_remove + 0, void (*)(typeof(privdata)))"
--
   drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c: note: in incl=
uded file (through include/linux/pci.h, drivers/hid/amd-sfh-hid//amd_sfh_pc=
ie.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvif/device.c: note: in included file (through i=
nclude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/=
drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvif/disp.c: note: in included file (through inc=
lude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/dr=
m/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvif/driver.c: note: in included file (through i=
nclude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/=
drm/nouveau/include/nvif/driver.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvif/fifo.c: note: in included file (through inc=
lude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/dr=
m/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvif/mmu.c: note: in included file (through incl=
ude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/drm=
/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvif/mem.c: note: in included file (through incl=
ude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/drm=
/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvif/notify.c: note: in included file (through i=
nclude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/=
drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvif/timer.c: note: in included file (through in=
clude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/d=
rm/nouveau/include/nvif/timer.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvif/vmm.c: note: in included file (through incl=
ude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/drm=
/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvif/user.c: note: in included file (through inc=
lude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/dr=
m/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvif/userc361.c: note: in included file (through=
 include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gp=
u/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/core/enum.c: note: in included file (throug=
h include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/core/client.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/core/event.c: note: in included file (throu=
gh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/core/engine.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/core/firmware.c: note: in included file (th=
rough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/core/memory.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/core/ioctl.c: note: in included file (throu=
gh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/core/notify.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/core/mm.c: note: in included file (through =
include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/core/option.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/core/object.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/core/oproxy.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/core/ramht.c: note: in included file (throu=
gh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/nvfw/ls.c: note: in included file (through =
include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/nvfw/fw.c: note: in included file (through =
include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/core/subdev.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/nvfw/flcn.c: note: in included file (throug=
h include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/nvfw/hs.c: note: in included file (through =
include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c: note: in included file (through=
 include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/falcon/base.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/falcon/msgq.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/falcon/v1.c: note: in included file (throug=
h include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm20b.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp108.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp10b.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bar/gk20a.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bar/nv50.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bar/gm107.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bar/g84.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bar/gm20b.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/bit.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/boost.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/conn.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/dcb.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/gpio.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/disp.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/image.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/i2c.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/cstep.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/extdev.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/mxm.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/npde.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/pcir.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/perf.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/ramcfg.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/power_budget.c: note: in includ=
ed file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/=
os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/rammap.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowacpi.c: note: in included=
 file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os=
.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.c: note: in include=
d file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/o=
s.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/vmap.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/vpstate.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0203.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0205.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/xpio.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/volt.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/P0260.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0209.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bus/base.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bus/hwsq.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bus/g94.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/g84.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv40.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv04.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gf100.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk104.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/pllgt215.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv10.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv20.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/pllnv04.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv05.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv1a.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm200.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gv100.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp100.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv25.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv1a.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv04.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv20.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv10.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv35.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv36.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv44.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv30.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv40.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv47.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv49.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv41.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv46.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv4e.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/g84.c: note: in included file (th=
rough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp77.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk20a.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm200.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp89.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm20b.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/gt215.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp100.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp10b.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv04.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.c: note: in included file (th=
rough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv40.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv49.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv44.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv4e.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv41.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv10.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/rammcp77.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramga102.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv20.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr5.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fuse/base.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gm107.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/gpio/g94.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fuse/nv50.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv4e.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv04.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv50.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/g94.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gf100.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv04.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk110.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gf119.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gf119.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/gpio/nv10.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/gpio/nv50.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv4e.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk104.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv50.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bit.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv4e.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gf117.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv50.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv50.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/gf100.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv04.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/ltc/base.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv40.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp102.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm107.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/g84.c: note: in included file (th=
rough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv50.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm200.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gk104.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv44.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk104.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gf100.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp100.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv04.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk20a.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/gf100.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/g98.c: note: in included file (th=
rough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/gt215.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp10b.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp100.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv17.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv11.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv04.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv41.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv44.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm200.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gv100.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/g84.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp10b.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk104.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mem.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mcp77.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp100.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv04.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv04.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmmcp77.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memgf100.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk104.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm20b.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv50.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgv100.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv50.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pci/agp.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv44.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv40.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv46.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv04.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pci/g92.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm200.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pci/g84.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mxm/mxms.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv41.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv4c.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf100.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf106.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pci/gp100.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/memx.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf100.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm107.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk110.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk104.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk20a.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf119.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/privring/gm200.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/privring/gk104.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/ic.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/privring/gf100.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/privring/gp10b.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/g84.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk208.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/privring/gf117.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/gm107.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm200.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/gm200.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/privring/gk20a.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/fannil.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/gt215.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv40.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv04.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/volt/gm20b.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/volt/nv40.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/top/base.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/timer/gk20a.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/xtensa.c: note: in included file (th=
rough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/volt/gf117.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/bsp/g84.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/ce/gf100.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv41.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/ce/gk104.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/volt/gf100.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/ce/gm200.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/ce/gp100.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/timer/base.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/ce/gm107.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/device/acpi.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/falcon.c: note: in included file (th=
rough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/ce/gp102.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/cipher/g84.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/ce/gv100.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/nv04.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/device/base.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/gt200.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/gk110.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/gp102.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/device/user.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/vga.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/headgv100.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/head.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/headnv50.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/headnv04.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/headgf119.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dacnv50.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg84.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sormcp77.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dacgf119.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sormcp89.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm107.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgk104.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sornv50.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/piornv50.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgp100.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/hdagv100.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sortu102.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmi.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorga102.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgv100.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgt215.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgf119.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/hdagt215.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigf119.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/hdagf119.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv04.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigk104.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigm200.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmig84.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigt215.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/rootg84.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgp102.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/rootg94.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/rootga102.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgk110.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgt215.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgm107.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgp100.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/capsgv100.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgm200.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgk104.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/roottu102.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgf119.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/changf119.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgt200.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/baseg84.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgv100.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/coreg84.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/basenv50.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgf119.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/changv100.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgp102.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacnv50.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/coreg94.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/basegp102.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/basegf119.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/coregk104.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/corenv50.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/coregf119.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/coregp102.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgv100.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlyg84.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/cursnv50.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlygt200.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlygk104.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/cursgv100.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/oimmgf119.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/cursgp102.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/oimmnv50.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/piocgf119.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlygf119.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/dma/gf100.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/dma/gf119.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/piocnv50.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/cursgf119.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv10.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/dma/base.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/dma/nv50.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/oimmgp102.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlynv50.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlygp102.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/dma/usergv100.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf100.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/dma/gv100.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/dma/nv04.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv50.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv04.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf119.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv17.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk20a.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm20b.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/g84.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gp100.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk208.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/channv50.c: note: in included f=
ile (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm200.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm107.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk110.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv04.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv17.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv50.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv10.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmag84.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gp10b.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifotu102.c: note: in include=
d file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/o=
s.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/usergv100.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c: note: in include=
d file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/o=
s.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/usertu102.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogk104.c: note: in include=
d file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/o=
s.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifonv50.c: note: in included=
 file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os=
.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifog84.c: note: in included =
file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.=
h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv40.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogv100.c: note: in include=
d file (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/o=
s.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/nv17.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/nv15.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/g84.c: note: in included file (th=
rough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gt200.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/mcp79.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gf110.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gk208.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gt215.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gf119.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gm200.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gf117.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/nv44.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gk104.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gf104.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110b.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/mcp89.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gp102.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf119.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gp104.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gp108.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf110.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf104.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp107.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf108.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm200.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxtu102.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk208.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gm20b.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110b.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgv100.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk20a.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm20b.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/gp107.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk104.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp102.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp100.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp104.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv40.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/msvld/gf100.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/mspdec/base.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/msppp/gt215.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/nvenc/gm107.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/msvld/gk104.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c: note: in included file (th=
rough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/msvld/gt215.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv50.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/mspdec/gk104.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/msppp/g98.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/msvld/mcp89.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/nvdec/gm107.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv40.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/mspdec/g98.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/nvdec/base.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/mspdec/gf100.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/msppp/base.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/mspdec/gt215.c: note: in included fi=
le (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h,=
 ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/mpeg/g84.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/msvld/base.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/msppp/gf100.c: note: in included fil=
e (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, =
...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/msvld/g98.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/sec/g98.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/sec2/gp108.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/sec2/tu102.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/sec2/base.c: note: in included file =
(through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/sw/nvsw.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/sw/base.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_nvif.c: note: in included file (through =
include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c: note: in included file (=
through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...=
):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/sec2/gp102.c: note: in included file=
 (through include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, .=
..):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_vga.c: note: in included file (through i=
nclude/linux/acpi.h, include/linux/i2c.h, include/uapi/linux/fb.h, include/=
linux/fb.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/vp/g84.c: note: in included file (th=
rough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_bo0039.c: note: in included file (throug=
h include/drm/drm_print.h, include/drm/drm_mm.h, include/drm/ttm/ttm_bo_dri=
ver.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_bo74c1.c: note: in included file (throug=
h include/drm/drm_print.h, include/drm/drm_mm.h, include/drm/ttm/ttm_bo_dri=
ver.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_boa0b5.c: note: in included file (throug=
h include/drm/drm_print.h, include/drm/drm_mm.h, include/drm/ttm/ttm_bo_dri=
ver.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.c: note: in included file (t=
hrough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_debugfs.c: note: in included file (throu=
gh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/=
gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_led.c: note: in included file (through i=
nclude/linux/leds.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_hwmon.c: note: in included file (through=
 include/linux/power_supply.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_bo85b5.c: note: in included file (throug=
h include/drm/drm_print.h, include/drm/drm_mm.h, include/drm/ttm/ttm_bo_dri=
ver.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_bo9039.c: note: in included file (throug=
h include/drm/drm_print.h, include/drm/drm_mm.h, include/drm/ttm/ttm_bo_dri=
ver.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_bo90b5.c: note: in included file (throug=
h include/drm/drm_print.h, include/drm/drm_mm.h, include/drm/ttm/ttm_bo_dri=
ver.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_usif.c: note: in included file (through =
include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu=
/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_bo5039.c: note: in included file (throug=
h include/drm/drm_print.h, include/drm/drm_mm.h, include/drm/ttm/ttm_bo_dri=
ver.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_prime.c: note: in included file (through=
 include/linux/dma-mapping.h, include/linux/dma-buf.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_drm.c: note: in included file (through i=
nclude/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_mem.c: note: in included file (through i=
nclude/drm/drm_print.h, include/drm/drm_mm.h, include/drm/drm_vma_manager.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_bo.c: note: in included file (through in=
clude/linux/dma-mapping.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_gem.c: note: in included file (through i=
nclude/drm/drm_print.h, include/drm/drm_mm.h, include/drm/drm_vma_manager.h=
, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_sgdma.c: note: in included file (through=
 include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gp=
u/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_ttm.c: note: in included file (through i=
nclude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/=
drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv04/arb.c: note: in included file (through =
include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu=
/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_vmm.c: note: in included file (through i=
nclude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/=
drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_dp.c: note: in included file (through in=
clude/linux/acpi.h, include/linux/i2c.h, include/drm/drm_dp_helper.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv04/disp.c: note: in included file (through=
 include/linux/acpi.h, include/linux/i2c.h, include/uapi/linux/fb.h, includ=
e/linux/fb.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv04/cursor.c: note: in included file (throu=
gh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/=
gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nv50_fbcon.c: note: in included file (through in=
clude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/d=
rm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv04/dfp.c: note: in included file (through =
include/linux/acpi.h, include/linux/i2c.h, include/uapi/linux/fb.h, include=
/linux/fb.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_fbcon.c: note: in included file (through=
 include/linux/cdev.h, include/linux/tty_driver.h, include/linux/tty.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_display.c: note: in included file (throu=
gh include/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nv04_fbcon.c: note: in included file (through in=
clude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/d=
rm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvc0_fbcon.c: note: in included file (through in=
clude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/d=
rm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_connector.c: note: in included file (thr=
ough include/linux/pm_runtime.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_bios.c: note: in included file (through =
include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu=
/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/lut.c: note: in included file (through =
include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu=
/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/core827d.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv04/dac.c: note: in included file (through =
include/linux/acpi.h, include/linux/i2c.h, include/uapi/linux/fb.h, include=
/linux/fb.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/core917d.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv04/tvnv04.c: note: in included file (throu=
gh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/=
gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/core.c: note: in included file (through=
 include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gp=
u/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/core507d.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv04/overlay.c: note: in included file (thro=
ugh include/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv04/crtc.c: note: in included file (through=
 include/linux/acpi.h, include/linux/i2c.h, include/uapi/linux/fb.h, includ=
e/linux/fb.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/corec57d.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/core907d.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/crc.c: note: in included file (through =
include/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c: note: in included file (=
through include/linux/acpi.h, include/linux/i2c.h, include/uapi/linux/fb.h,=
 include/linux/fb.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/crc907d.c: note: in included file (thro=
ugh include/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv04/tvnv17.c: note: in included file (throu=
gh include/linux/acpi.h, include/linux/i2c.h, include/uapi/linux/fb.h, incl=
ude/linux/fb.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/dac907d.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers=
/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/pior507d.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c: note: in included file (thro=
ugh include/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/dac507d.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers=
/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/sor507d.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers=
/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/disp.c: note: in included file (through=
 include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gp=
u/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv04/hw.c: note: in included file (through i=
nclude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/=
drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/sor907d.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers=
/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/sorc37d.c: note: in included file (thro=
ugh include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers=
/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/curs.c: note: in included file (through=
 include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gp=
u/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/oimm.c: note: in included file (through=
 include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gp=
u/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/ovly.c: note: in included file (through=
 include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gp=
u/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/head.c: note: in included file (through=
 include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gp=
u/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/oimm507b.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/wimm.c: note: in included file (through=
 include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gp=
u/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/base.c: note: in included file (through=
 include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gp=
u/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/head827d.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/head917d.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/cursc37a.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/base917c.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/base907c.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/curs907a.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/base827c.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/curs507a.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/base507c.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/head507d.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/wndw.c: note: in included file (through=
 include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gp=
u/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/ovly917e.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c: note: in included file (thr=
ough include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, driver=
s/gpu/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/dispnv50/head907d.c: note: in included file (thr=
ough include/linux/hdmi.h, include/drm/drm_connector.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_abi16.c: note: in included file (through=
 include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gp=
u/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_chan.c: note: in included file (through =
include/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu=
/drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_dma.c: note: in included file (through i=
nclude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/=
drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nv04_fence.c: note: in included file (through in=
clude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/d=
rm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nv10_fence.c: note: in included file (through in=
clude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/d=
rm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nv50_fence.c: note: in included file (through in=
clude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nv17_fence.c: note: in included file (through in=
clude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/d=
rm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvc0_fence.c: note: in included file (through in=
clude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/d=
rm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nv84_fence.c: note: in included file (through in=
clude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/d=
rm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nouveau_fence.c: note: in included file (through=
 include/linux/node.h, include/linux/cpu.h, include/linux/static_call.h, ..=
.):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvif/client.c: note: in included file (through i=
nclude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/=
drm/nouveau/include/nvif/object.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/nouveau/nvif/object.c: note: in included file (through i=
nclude/linux/pci.h, drivers/gpu/drm/nouveau/include/nvif/os.h, drivers/gpu/=
drm/nouveau/include/nvif/object.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/vdpa/ifcvf/ifcvf_main.c: note: in included file (through include=
/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/vdpa/ifcvf/ifcvf_main.c:426:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/vdpa/ifcvf/ifcvf_main.c:426:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/vdpa/ifcvf/ifcvf_main.c:426:15: sparse: sparse: static assertion=
 failed: "__same_type(ifcvf_free_irq_vectors + 0, void (*)(void *)) || __sa=
me_type(ifcvf_free_irq_vectors + 0, void (*)(typeof(pdev)))"
--
   drivers/vdpa/ifcvf/ifcvf_base.c: note: in included file (through include=
/linux/pci.h, drivers/vdpa/ifcvf/ifcvf_base.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/lcd.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/ili922x.c: note: in included file (through inclu=
de/linux/acpi.h, include/linux/i2c.h, include/uapi/linux/fb.h, include/linu=
x/fb.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/ltv350qv.c: note: in included file (through incl=
ude/linux/acpi.h, include/linux/i2c.h, include/uapi/linux/fb.h, include/lin=
ux/fb.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/ili9320.c: note: in included file (through inclu=
de/linux/acpi.h, include/linux/i2c.h, include/uapi/linux/fb.h, include/linu=
x/fb.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/otm3225a.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/vgg2432a4.c: note: in included file (through inc=
lude/linux/acpi.h, include/linux/i2c.h, include/uapi/linux/fb.h, include/li=
nux/fb.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/aat2870_bl.c: note: in included file (through in=
clude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/platform_lcd.c: note: in included file (through =
include/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/adp8870_bl.c: note: in included file (through in=
clude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/adp8860_bl.c: note: in included file (through in=
clude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/as3711_bl.c: note: in included file (through inc=
lude/linux/backlight.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/backlight.c: note: in included file:
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/video/backlight/backlight.c:734:15: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/video/backlight/backlight.c:734:15: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/video/backlight/backlight.c:734:15: sparse: sparse: static asser=
tion failed: "__same_type(devm_backlight_release + 0, void (*)(void *)) || =
__same_type(devm_backlight_release + 0, void (*)(typeof(bd)))"
--
   drivers/video/backlight/gpio_backlight.c: note: in included file (throug=
h include/linux/backlight.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/da9052_bl.c: note: in included file (through inc=
lude/linux/backlight.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/lm3630a_bl.c: note: in included file (through in=
clude/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/lm3639_bl.c: note: in included file (through inc=
lude/linux/acpi.h, include/linux/i2c.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/lp8788_bl.c: note: in included file (through inc=
lude/linux/backlight.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/lv5207lp.c: note: in included file (through incl=
ude/linux/backlight.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/max8925_bl.c: note: in included file (through in=
clude/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/pcf50633-backlight.c: note: in included file (th=
rough include/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/sky81452-backlight.c: note: in included file (th=
rough include/linux/backlight.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/pwm_bl.c: note: in included file (through includ=
e/linux/platform_device.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/arcxcnn_bl.c: note: in included file (through in=
clude/linux/backlight.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/video/backlight/ams369fg06.c: note: in included file (through in=
clude/linux/backlight.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/qxl/qxl_drv.c: note: in included file (through include/l=
inux/platform_device.h, drivers/gpu/drm/qxl/qxl_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/qxl/qxl_kms.c: note: in included file (through include/l=
inux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/qxl/qxl_display.c: note: in included file (through inclu=
de/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/qxl/qxl_ttm.c: note: in included file (through include/d=
rm/drm_print.h, include/drm/drm_mm.h, include/drm/drm_vma_manager.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/qxl/qxl_gem.c: note: in included file (through include/l=
inux/platform_device.h, drivers/gpu/drm/qxl/qxl_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/qxl/qxl_object.c: note: in included file (through includ=
e/linux/platform_device.h, drivers/gpu/drm/qxl/qxl_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/qxl/qxl_cmd.c: note: in included file (through include/l=
inux/platform_device.h, drivers/gpu/drm/qxl/qxl_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/qxl/qxl_draw.c: note: in included file (through include/=
linux/platform_device.h, drivers/gpu/drm/qxl/qxl_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/qxl/qxl_image.c: note: in included file (through include=
/linux/platform_device.h, drivers/gpu/drm/qxl/qxl_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/qxl/qxl_debugfs.c: note: in included file (through inclu=
de/linux/platform_device.h, drivers/gpu/drm/qxl/qxl_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/qxl/qxl_irq.c: note: in included file (through include/l=
inux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/qxl/qxl_dumb.c: note: in included file (through include/=
linux/platform_device.h, drivers/gpu/drm/qxl/qxl_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/qxl/qxl_ioctl.c: note: in included file (through include=
/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/qxl/qxl_release.c: note: in included file (through inclu=
de/linux/node.h, include/linux/cpu.h, include/linux/static_call.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/qxl/qxl_prime.c: note: in included file (through include=
/linux/platform_device.h, drivers/gpu/drm/qxl/qxl_drv.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/bochs/bochs_mm.c: note: in included file (through includ=
e/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/bochs/bochs_drv.c: note: in included file (through inclu=
de/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/bochs/bochs_kms.c: note: in included file (through inclu=
de/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/bochs/bochs_hw.c: note: in included file (through includ=
e/linux/pci.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/i2c/sil164_drv.c: note: in included file (through includ=
e/linux/acpi.h, include/linux/i2c.h, include/drm/drm_crtc.h, ...):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
--
   drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c: note: in included=
 file (through include/linux/acpi.h, include/linux/i2c.h, include/uapi/linu=
x/fb.h, include/linux/fb.h):
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
>> include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"

vim +290 include/linux/device.h

663d41317b8fa2 Rasmus Villemoes 2021-03-10  284  =

663d41317b8fa2 Rasmus Villemoes 2021-03-10  285  static inline int __devm_a=
dd_action_or_reset(struct device *dev,
a3499e9bf0feee Sudip Mukherjee  2015-12-23  286  					   void (*action)(voi=
d *), void *data)
a3499e9bf0feee Sudip Mukherjee  2015-12-23  287  {
a3499e9bf0feee Sudip Mukherjee  2015-12-23  288  	int ret;
a3499e9bf0feee Sudip Mukherjee  2015-12-23  289  =

a3499e9bf0feee Sudip Mukherjee  2015-12-23 @290  	ret =3D devm_add_action(d=
ev, action, data);
a3499e9bf0feee Sudip Mukherjee  2015-12-23  291  	if (ret)
a3499e9bf0feee Sudip Mukherjee  2015-12-23  292  		action(data);
a3499e9bf0feee Sudip Mukherjee  2015-12-23  293  =

a3499e9bf0feee Sudip Mukherjee  2015-12-23  294  	return ret;
a3499e9bf0feee Sudip Mukherjee  2015-12-23  295  }
a3499e9bf0feee Sudip Mukherjee  2015-12-23  296  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0727017412687278090==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICIYUSGAAAy5jb25maWcAlDxJcxu30vf8CpZzyTs4T5S8RPWVDiAGw0E4mwcYLr5M0RLtqCKL
LopK4n//uoFZAEyPnC+HmNPdABpAozc09PNPP8/Y8/n4dX++v90/PHyffTk8Hk778+Fu9vn+4fB/
s6iY5YWeiUjqX4E4vX98/ue//5wPj0/72dtf55e/Xrw+3V7OVofT4+Fhxo+Pn++/PEMH98fHn37+
iRd5LJcN581aVEoWeaPFVt+8sh28fsDeXn+5vZ39suT8P7PrX69+vXjltJKqAcTN9w60HHq6ub64
urjoaVOWL3tUD04j7GIRR0MXAOrILq/eDD2kDuLCYSFhqmEqa5aFLoZeHITMU5kLB1XkSlc110Wl
BqisPjSboloNkEUt00jLTDSaLVLRqKLSgIVV+3m2NLvwMHs6nJ+/Deu4qIqVyBtYRpWVTt+51I3I
1w2rYB4yk/rm6nJgJysldK+F0s4qFJyl3XRfvfJ4ahRLtQOMRMzqVJthCHBSKJ2zTNy8+uXx+Hj4
T0+gNgyZ/HnWfe/UWpZ8dv80ezyecW4DriyU3DbZh1rUgiTYMM2TZhrPq0KpJhNZUe0apjXjCUlX
K5HKhYtqEawGER8WKGFrAesJYxoE8A4Llg74AGp2DfZ49vT86en70/nwddi1pchFJbkRAZUUG0ec
HYzMfxdc43aQaJ7I0pemqMiYzH2YkhlF1CRSVDiZ3bjzTEmknESMxnG5isSiXsbK7PLh8W52/Bws
QtiIg+CtxFrkWnWrpu+/Hk5P1MJpyVcg7AIWzdmZvGiSjyjWmVmrfmcBWMIYRSQ5sb22lYxS4bYx
UFJOErlMmkqoBk9opXyadqojzh15roTISg0D5ILgpkOvi7TONat2LlMt8oVmvIBW3frxsv6v3j/9
OTsDO7M9sPZ03p+fZvvb2+Pz4/n+8UuwotCgYdz0IfOlOzJuqdFIA5riQslhN+Cj1wSRVKjJIlcc
/gV3ziEGzqQqUobnwB3ZTLTi9UxRUpLvGsC5E4HPRmxBHKhVVJbYbR6AmFop00crtgRqBKojQcF1
xbjo2WsXxZ9Jf15X9odzglf9xhfcBSeCRcI1L935UjwRkT1lnXyo2z8Od88Ph9Ps82F/fj4dngy4
ZYXAOvuxrIq6VLTCTQRflYXMNR4TMHa0XrYMsVoXpi9qO3YqViBDINyc6VZ6JnDN+pIcpRIp25GY
RbqC9mtjvKqIJikKPFL4m2APLH1RwqGQH0UTFxXqGPgnYzn3NElIpuAHPVmuHTOyKOPhw0qs22sG
x0qCyaqorpZCZyBjzcg22VUbwH13ccJy0IDUmTb21+o6XxfBBq+IBqD3HcbTGBaw8hZkwRSsRJ2m
5JrHNTiCRLeiLHyWlVzmLI0jgtZwG3vyYixLTG+zSsA7IDFMFiRcFk1dBTpwaBStJcywXWX6jMCA
C1ZVkty/FTbbZc4h7iCNt5s91KwoSrqWa+GJELXXKDVGLZNrt+KuAwlsiigSjpds3B8U9aY31p1E
IBA6b9YZjOiqpZLPL950WqcNCMrD6fPx9HX/eHuYib8Oj6D5GSgejrofbOegxcmxjHtBjdirr385
zLAs68yOYm1oYNk7SUnrhR3bO+HgSDMNPviKFq+UUW4l9uXJc1rQZGwB4lItRWdNneOMuBhMfyoV
KFs4wkU2hU1YFYEpcHZSJXUcg/9fMujbrB8DZe2f8SKW6UjO2xX2Q5Gu160WuWJj+5NsBDhOrh/9
8WbuBFlgl0CbN6ouSxvudFyCw76ytnKEs2DwTeKULdUYn2V1ILiWu2ZZyuLq0j1JikHolLCo2DRF
HCuhby7+eXeAKBD+s3Jbno63h6en42l2/v7NOiye2fTm36xZJRkIU6xiYlMDoohfXl16wkAQXNHx
UUDJa7C42Y+HtHHZ3S0M/OnVqLcaNCuoVzCrEyYmZiBSrW4ZtnxQ4i5aQZSZgnpaghjSxwoHadhC
Nkh/Eeoqg2llfypyc5pDXJDufjgIyvZCuArjpf21AvCwP6MumR2/YRKD2vUSVDD6AOCrUvMMqbb6
EsSL2HeHIi6XjDLLHUVe4QFQN1fBIOgxW29v/m7ov4+2YH8XFThOsLBTDhLPIsxfoBdEm2rUvAUl
3iWrlGmn4RfLAs3/9fD1ePo+e9h/Pz6fBz2/ElUuUlAEDLzCKALXUcEZvIMFuroY9EQnxsJkUcB5
s3kj4ui0FEogD5pybbroBIwxqpkKz/xF+18w3koJo07AzXQ0Cig0aDsAYENAH2Vs23yE6K4AhVvd
zOeOiIUSZOXq+Dc42WCi9l8OX8FCOfLVraczRpn1BmiAgMuBbmdEoHi68r47CbDBu+fSbT6At7eB
UyLiWHKJtpA8dt1spvj2ElX70+0f9+fDLR6k13eHb9CYnCOvmEo6X7HT/QIVqMvi73VWNmDXRErs
55CZMYYhKYpVoP6jjKE/r+WyLmrHnTCNMG2HBDhqnXOG8UlAAlpaajQQTZgQSjZg/wWzcQ+VLBo4
D/rcoDqWJW9PTZd6I7pQgqOr8QKqAXMNOtZdwaDJDwgbM+1QjMw4xhCD1tTmYAUG2oUPHo2Hgc+q
INMGqS5MOiQYkMg5OKa9iOpUKKODMMhA79eR86XNnKbg0aXq5tLrV2xhD3UCu+VsL6hKVHXA8AYc
JU/mWvfO7j0yRCpDVLWuA+npf3sieLF+/Wn/dLib/Wk14bfT8fP9g5eHQaJWFbrG6cW2oUP2gyPX
DVWB5sNgSzgHwUQSCr3pm7kTrdjFJrau2wYNbiYsQbGqHVlbtMkGJ+BWXEnYqw+1l3PuQvGFWpJA
sFVjOJwzsayk3r2AavTcM68dAarniZAfKDrDZw5kNUm2WdDuiB0E45OYDv7MQoCyLkpGG1YksJcH
jch5tSvJrFe5P53vcUtnGhwWzx0BzrXERr1loPLamVyygdQ5WyoqFIUQsfTAgykIWHE3JAOrwqW/
SQBbS+inGIEr0MA+sOz9BwjG+6SUYzmglSxsNimCM+3fuTjI1W4hPP3UIRbxB9LA+eP1y6by+dB/
nbcbBV5uDl++yBvdjCrKXE9EhggpQtPjkFSbjsDMWfxzuH0+7z89HMy128wEs2dvsxcyjzONWpAW
JotWvJJk6rjFZ1I5ETva4ajOSneTp1gxvGTWqcte8GIgSNO+uwQAUPyRMB5YxlwzVaagbEtttCq4
surmTaCQeXgmetFfYi4EA8Egh70AtcwpPxBFsQEbtHBdAnT28kLLWPpCs1JUdNW7kjALWMrceLA3
by6u33UUuYDNLcG5Qsd8lXkGJhXM+ht0RgzMpsYrswkvnQoPPpbgtLtjfFzUtML7eBUX6QRK2bQK
nQKLutQBOlsr+kIgyWBfZVW5/gKsAS4BOAduQmdZl8FF5AqX0txGukI4LWfDQrvZg9UC7D368CAt
/aHKD+e/j6c/wXgSvjZMRngBhYU0kWTUFEEBbD11sIWj5m2vgU201qnnasAn2ifJaUlAtC4oEd7G
lXOw8Kth6bIIQBgCByBVL8DpTyXfBQgwDhg2heSwaxDGS64CBDiwnp8JuwBuzG4EGPerMu45jRkf
LdYQ20Vlo/CeUFPOiPS2XpY2Sc6Z8qF9sFQVtQ4sAjrGC5BoKayAUqO0/ZZpez+vvN5Npy0F00nQ
u8WCj78oFLWPQFLmpdchfDdRwsugJwSbCJs+nZagYhWNx92QpXwJuawwDshqKhlvKRpd57kbz+DS
2Bn2l7AhhiJ+aTlLmamsWc/D2VswfeejdjkwUKwk6bJa3tda+rJZR+P5IDwuvPtDlLGG0RUEBicU
dZUl7aj+GTFAc3pGC4kYEohHI6TjJQXGCbVgn8OKbaZPWD8I7D0GbFQmDQeEn8v+JDkZ2Q61kN6p
7uG8XpC38D3BBobdFEVEtk7gF60ZewoVkIwIdouUkZ2vxZLRDntPkq9f6hrTnSjBZO/pDxiHyJG+
a+opdsKXuxAvU3BEC6mI3Yi49hXIsB8RaZb6bVx4+rFzc4I9HOHNIr9I0W3zi0SG7RcpgL8XvLEK
1nRYjQ7aTe7m1enweHzlzjmL3irpn5hy/Y6Ke0u7oO6pMbDgJFrYqsY6LHRvPGsPjbDwC3MvGZu4
POpoymRncg9glbJy6uYRiG1ehw4EyjFy0KgRH00IQd18jN+EgBnnMnqaqudrO2qQ6HJ8U+air8iY
a3KIgYE2jZzsb/+0qZNR92bc6e6DDhzeFdd+YRp8N9Fi2RSL33lOh/uWppUta3bA72Uchen/10Al
bE7dAE7Rtzkzv+N/zcG/GNlIgR3ek+ogQQafJm6nCzAAOXWKEUfsVXcgp0oCIYykU3CXmiwj0Y5g
Z5WboKpktBThdyOXGYhCXhRlGEFa/DpleZtAnTqJLWVWUQy1SB47LrvJTJpD516eTgHAU1o2v11c
zj/QKFZdX13Nadyi4tnIPwsJXmhaQnAt8ihQZD1NItKUV0JQpSEu3VJtZEkPg/++xGDkXza6KAE/
fjBwpld0tyv1carbSqdvGlq+XbKCi7Sgcixjopd27wOf2HGQu+uriysaqX5n8/nFWxoJMbpM3eDP
RW4r9f7iwolijYB3DA4FEj20Wa5JwXYosnXladJIcBiSSv6nTtoJPpz7NaaZe3mFiVtWQpzQgh21
H0UUO9tLZzVSVno37GVS0AxJIQTO4e0bb4we2uRp+8NUZYFNzvVEHtdpZKNWypNgfDya1bvJRI46
4lShSJQrrLcrsHjbTejrjJk0MAXrfq49LeegJ7w4hyRiE1nwgSSnHH4Hn/khutu5fw9VgOJZg97Q
PCGBzXoLEujJ7HS2ANYY/OXVyGFLlX9KEALaqvBpTCTv3Ughba68gD9RlLNlNtfwCxLtt0+vQB6w
SqKxqL6nD5WmnTozKldyYpxqi1nNXdMWz3Ur/KGvTG9TYbPz4ekceFPYvlzppcj9kVtXatQyQLjZ
NWdJWFaxyC+ra1GcOfoePjBQ9QEL1zAhYBkQ/D6/vrr2QVIVxv7bmbF8Fh3+ur89zKLT/V/2GmFI
peJJQBKSNxCuEYfBLiEIYkAO8ZHGik8yJ4pETF/PA85Z/rGR8OvKh6/WDOtWSi6F+1YFUarO38hw
+C3Wa23pSZRwQrh/PgzHzfScOX///sIf1oBgWRkF7spSgj2IseomDyeQjbfcgNr7Io/JFtF2T2fC
ezIN/3uzfbudJCsFW7VrOjFxtKa2NscBikz5d1kDMOOShTzHv83fXcwnmRi2doKHjkt/vJ53TsJb
RlxEuh330s5vvI8dgt5JVcS+1nOADVfuOVMlzAuLLD/vbw9uoQfDVydX8/l2tMe8vHw7p/KNDtYv
6/UQjWIQZ+9IbUVw5Pdib2xt8p1+1EEoj16huuYLK0FFVHmQKkaH1ifKhechtSCYTvNSEN9SYVlF
QRAOZImMSm/ARHmffp7KACLKTgImU3FYZbXQ3ROfKTaVSGNMeUzhY8F0XYlxAGgkaPHwfDgfj+c/
Znd2ye/G+hrnxOVCK9qeWHSk03nAuGk0UU7ZotNacFZRysESrBNfReEiVeuJ23yNMUfIpIv+AMKh
soiUusmFcOLhGOx8VVJeFqBWrtFUuhIsaysbBjBeelS1l3vfyEqkWIM3gjRWFDoofAVlWwbkP0wx
IFXuRkTSN6DxEp3h+UgcesTj4XD3NDsfZ58OsEJ4GX2HF9Gz1o2eO2UBLQQvcrC2KzGFefj64ubC
SUHEK5lSxWTo/VwHAep1OSpbaMFt2YLnO10Tiahe4cjY1aEyJqrKEQr9gEqa6KGplVMXw0WZNF6l
TAfBkF3rXeBM91gsPqCDhzz2kvjwCd7yUk6FO4jPSWuGmMQ1QQhQSWRiv9YP3Z9m8f3hAWvzv359
fry/NXm/2S9A+p9W9h0rgh2U+ds3b/w+DaiRl3wEvroiQGPKTPKq8EvDPHDbwpuz0pdz+JchbsJV
/leT6/00xSDEEL6QydjT1+nGXg9RgaDStoxv6GBZFbDfaRjaYHAEyj0IYkDgMDBytAOTaeEJhtCJ
Loq0i6G6TRy51r3Tj29G3P0PP0y9hq2/GCJ0ALMJM2hwqqRKMRDVlJkIu2pKPUGOD1o9biZfuCLu
Qy2rVcjo5ElHnNL1wu8DjEsW9iCL9dRUUU9O45iSdJ7AzBoWFW8SsVKbrg/qqV4qse+JFIvJV2Id
fuIRnIMX1SX+jxwmgVgtrZehT2zL3QB2e3w8n44P+CiR8AfMIDYAavINraNwxbA4kM5rmB4qsPzm
7foPSASVc8L+sS3xDNlhb2oFW+a5V/ANPWJRMNPS1QmGnqH7x0aDWDBK8WgVo8PT/ZfHzf50MAvK
j/BDPX/7djw5pfimk2gTDBZtzMzGUFGOYRg+0NCJTgwq6Ak8jV1eKB8ms+270YwVRD/V/Go7sbJY
eaJ0cF3iwkf7TdGM5slA0CPW/LYawXUp+Dsa2s0/2LIWOSVUwKFUqEoCTZKB0c6DgYx8z6/fTIBp
BnqsKEkb9pLg2ArA4yc4kfcPiD6EgjXUb01T2aO8vzvgWz2DHo47vqUf9fVj2r4+ldYdvV4Rj3ff
jhAaekegEXnUlfN7QtPB26fBEyGQoSzjJoyBAnSubVra4bTnpufv6e/78+0ftPpzDc2mTSxqwcNO
p7twXM5tikqa5BbDIVegwoSHhdjnO1xSfWAP1sS383p9uz/dzT6d7u++uK7dDhPqw1Dmsyku3cEs
rJK8oCtxLF7TRrNFFiqRC/JpVfTu/eW1O5z87fLi+nJyWfAi1hTGOb5kxUoZmUBhCDUsqNFKvr+k
rls7gkgqbi77i1rfXF2EaJGbtw3VttHbBv0mNRo2TJwPTesMa/wJThueZH5usENkOEbDgzjE/uGF
/bf7OyyTtsI1Ekpnym/fb6nOeakaUmu7Td/9RrALDZcivxxjqq3BXLknYILR4aXS/W3rts6K8eu+
2r7rSERaTjgusDg6Kyc0AchGHrE0+IMfw8mpbPexrLINq4T9WzujtY7vT1//RvX7cAS9d3Lqqjfm
1HnxfAcyFboR9Oj9MQENzkE3mvN3e4ZW5q2knS7VqYOG4CBN8dkMRYflbpXNIfQ7EU6jz1SkabEx
d3xO7Xm/uiY3V8m1CMqR2pxdRVb6WTTq37YthLhZ4b6QL7PmQ6Gc+pwBZWFtuzL8K0kQOfnl4pVY
egXs9tuPL1uYSmVGtMXHASPYZj4CZZmbf+jGcf9Oj3nElsDemo2PgzUDZCzAPbeP5EhbP3EibGLu
+cmJxoccFNYAm2c3+Ii8SalQa6Hnjb2FdQFbL5GGXk4Kej1v0onqD0yWNWIhKX2cJbIJosgWNBmg
dXi0n8MfdRnSb850e0NWQOQdPnbDfFf7ZwqIUZa5m0nLdNRbwf7lzLf96cl/16IjWNb35sWNPyVA
LHj2Dtxdi6SmBTTOOybtj94mAMGXBvWgvfvPAamrbTgqSlWp0vGoHhUInvnLKQTV6L1QN2uzGDX8
BA8RH9zYP9OgT/vHpwebK0n330fLs0hXcPqDuQXPzmLtPYTI4Zu+rA8x3QmLo7APpeKIyraqrKV0
uCmK/3F2JU1y47j6r9TpxXTE+FlS7oc+UEtmskubRWWmsi+KartmXNHVtsNVHeP5948AtXABsxzv
4CUBcBFXEAQ+1lb9BvQzs8FVTJWcser+dxweDSveN1Xxfv/88CKVt89P39xNFrt6z80sf8vSLBlj
3DW6HOJa6LuZA165Vxhs5htSsNbErLzvLzxtj31oZm5xo5vcpcmF8nlI0CKCJhea3LBCT19QpKJN
XbrcgplLPckjtUlV0eo6oSrslmKxyGxfwFHN8HeXOiM9fPsG9+IDES3XKPXwEbAHrD6twArYQbuB
I5o9g49XUZgwehp5CFr19OIoBDAYKlLJHKDJKgqS1BqkZdYiw6S2YrUyIQywANIKrDj2wWGm9kwq
0teiIk8gIIb93p8bqXBbVQbrQTPY1MaT5httrSCwHp//9Q7ORA9PXx4/3cms3PsmvZgiWa1Cp/ZI
BeCjPadUWU3GsfIDL2Ut2+dMUN7dOHGSYx0t7qPV2uonMHrIRcea+kK00coa1yJ3RnZ9bJgztuUf
SfXUAxfWSNu80qeXP99VX94l0Kw+4y9+YZUcNPt7DI4IcGbqi1/DpUttMdpvxCF7s4vUBYLUsc1C
geKAT+GSXGbA83wlhEcAe1qCH/7zXu5SD/LM/Iyl3P1Lze7Z4ECUm2YAoWLNoJlhGsAnJitAUclb
Z4Igt5JzltR6RoFheyYTJ7Thdi66LbKcqFLBmnOWUxyRJ6CkLaLO0RNUypnvVRVQENxKb3SI+vau
ZIKoxF5qI3yfEJzzfh0GwxWW21D9Pk9auqVSdub0NdYk0nbdrkz3BZn3qeyovgXNdhUsCQ5otHQL
kgBrM7vjVAVQCSfzE22xiHpZbTpuas4YjIq3SoaNgyhZ8xmhBmCa0fG38xhsAIeJTK2W/vxQOOfi
4unlo34SmZLAX4LTvkKTkGNDckYDF/dVOYCsEoNlYiu16lbA/a1EA97NLdE4bi8NbzN7E+DGcpUl
iVw5/y3XSs1kaueaJdTAkVQwIR5ZUZhYG7SAHblpi8U20O4YR07UcLophVUcvyOvZZvc/Y/6N7qT
GsIIHETc/EDRKgFV4NtZOQ1q6xcDEe/KlxixY4I46zLiUo+Ap875yRUBzOYzApvmtHnITnefkXcE
IKKuCOwV7xRzh9BfcoRAEccqT4049VEgzuIBMToKzMoAFwC+CkbVY5Q45Kcs5nYDYM6gRnhSHq91
1lgn+GNcJHJnXK+WZPv4EKgGKLj5gK5IPeu2282OCuoaJcJoqy3TA2aIntUII1Ke8hx+UMbutNGx
+MYUcNUiBKzsvB42TkviZEAkjNRcHiNpKqINKNjfrVtDBA+pQI6yxwxCaRNrRyb41Y+43jPytPvx
sR9BBfii294o01BHNeLwKeGa4qHzjj5YsZXBSTlJz7pzqU4ebGBCbx5T4OJgLwxiDC4ewP6XmYHc
ygnI0/NTheOUarZGkObuiV3qfaFT5aLTnGfLQHkuMvfmFqgu4OrYY+eC+kpMQwasI+d4KUhlAJl7
FjcGGABSTRAXJZg4GbesOWT0Odr4uGmXd72AWLqKVl2f1joMuEY07a86wzC2pqeiuJo21PrIylaf
wS3fF5afG5I2XadZLWRb7BaRWAbGIRF1a3kuo2xGUifKKwGOkNC/4HxqrH11z3PKuRGtoEklFdXM
RHdFBizPHofAOhW7bRAx3ReIizzaBcFCz0fRooDaarJSALReK0Xk6d+wjA2s+BhuNrfSYj12etDR
sUjWi5Vm7UlFuN4a137gwF4fT1T0i9xAW9l4UveoF8O97JyTaFx3m+kS1+ujOjhjiHSfUS0JgDl9
0wrtE5Ko1p5qkPu0XGVcLUzR5aCItF1mJq4cYp4dmI7PMZAL1q23G1d8t0i6NUHtuqVL5mnbb3fH
OtO/Y+BlWRgES92mYn3S9N3xRh617GVHUb0ukDO3Z0KcCmV3HBuvffzx8HLHv7y8fv/7L4Ttffn8
8F2e/1/BJAyl3z2DBvlJrgtP3+C/umfA/yO1O4ZzLhY9+oxTd3q6kOX3N0415YUjWlYbMzRLjqS7
clL0ZyOuDUcYy5PKFyQwDUHTnHBkMStZzzTSiSWJgXZqrKdzQoDdS41elD+dIxeguI1GGGd4I8Rb
YQI4NIyDhaGlQZUT3f0Okxv7B1LwemU/DQ+swVC0wmv9h+zLP/959/rw7fGfd0n6To7TX7T3UUal
xIweODaKegvITbLpO98pNTm8R6YeqoZfMi34xroJnATdCOgLJBTIq8PBCklGusCYInE1A+3mhmrH
Uf9idRMcGrBbnCz3yc3+ktsD/D2mNfKE12889JzHgrmFAQud5kRBHm1Qpqm1qo62QevrrHzz6oII
kL48U7tv0qPUXVjiUuU+LC5OvSUjK+hbypHP8hMjVRxqDukaA+WZUhCqoU4r1HsKaQaIm8ZKIo/H
vMwYPZCLFCcotV0PrNDKDGnBrcyWKxI2IzUUzZmK542rQUryk7DgmWI/SNp0lqGM10rTtLU3ud5y
664QaHt5ENetW0CrzTUKzlPg8zBkrCtS0O02VcT1TJtqvD8JCtURYobvwsVuefeP/dP3x4v884u7
yO55k0E8xlzISOkrw9F+IstKRATZgMyaqZW46vPsZqUmPR9jFQYNdqa5x5GqTOnQSNTD58RQlcPJ
8DubSLaHU/bhxHJ5PDTGC+I3kW/+AGxSxiyYA6DAzpXBc1osNaOSTYFGnlLlGTLmpV2eJoN4/DdK
V2KAZHjOYDidal9x4E8Ts3zwqh7nCEvOVrgzkFrSLMPrQXb+3erX0E7kNPhCnKnjYsya7KRfDh5M
zBRZB0EqzPKTYIerrIeWJmqfXktWcE9SM4IZY5MlBdGcG/kfI2yljYfBONMauF1v7d/gQYdGhTDa
WpxG40yVbU/USbg1r2GlUH/GgY8vj5GvqpwzfQEc7AlGBcvcch+HHM8N7cMPTiw0mgFrktJcdxSl
D6OA8kEcucFKO9UORCMee6Al+iAaaVWxC3788NH1xXXMmcu1mJKPgkC/cbYYdqCwzU48DxRhvBV6
drkozemTPDQ8/fE3PHQ4eAsyDU/ZvReOV8a5Wf5EtUrlT80fKVCgj6bjz4YsuJh3E5v5Nyy+XYDI
mtRehwHuAw4ZYh/Z4wpYHiPhxJaKKf8wwbY4yYt2s1pQKsQkcN5us3WwDtxaYXQV3nHci9+90C+G
1G652fyEiBOu5RX0HfTIFNvNjkZWMj+289x8jlIKpuemyIDqclNmwG9xw888cgUdLzuKfUjY9p5q
tCaDI+09eBzcSC4KeSidkWrcL9L4npMzKVqkdtwliJx5mwmAzRfJZqHb0z0CpuHPJ2RcZI4BED+5
MGgH/fYIQO7UsrxPU93+mO3NO3QkoKcndXS53+tvAPDa8BuVmkIDkYHGwjJTZXPCU0IAXEX6+R+v
ZuwfEjSXTXGpj8abhHmWAl7q4QBuskcKLnLPuwx9jozz0752lt6C8zvIwueBwwonG7yp7g9d7imb
SU1zSDNSpKIoVzJm5zRcC8V2RvPCizohXBv4BJJitQyXgacqk8emXhtJ3HQEcbvcbkO7ikDfKGGP
/QjVIqvHEp5AkJKVV4L42MyTF7hADJ+qqYxJnYOjrNX/XevJRF3Zdxd2NfPJwQjShkEYJk53KmcT
bxOP/DA4eAqFZTrLnXynxdub8yTRhjeyrkRWcDv3El+lZL4xWHYyU1jGp37WjvnbYOF06GzLH0sj
ueNyTJfaSP0d7CpG08tPvB+bQZvTsMyalDYLg05bZcCSKQcXT6wM03q72EaRS2yTbRgSssut3QZI
Xm98IxG5OzOncbk2iIO5/iBXkaiBv+0BIIfFvdjudisSMV2pZHh+1c0Q3IaFH8SazCaOcDw6rYNT
lJ0db2NmuFcgVc7eU8kL3fiEjEROxZPpUQNk8MDx2F8gZEckELPuc35Bkapj5COoyK2SNkMdTC3M
oDAUfz+/Pn17fvyh1uQhhkt4V2vJ67s6Mex1hPwknutwgHVt/uhjkZrgyUCU22SusMTnq5269qOi
ALOoaycB2qRg3yObS0qQmOsiP07wBcevL6/vXp4+Pd6dRDwZpiHN4+OnAaICOCNoFvv08O318btr
2LlYx3D4DdjAadXIzaxoM7qOhlhLB8WZMkVGu8HrUuOW96ZgwkVCqSq6DG4Hvk/j+OIipyy1utjs
jEjmUmQpZz/TRNNq/6Zkw+xxQQmpldhXrYaEZ9MlzHhcndO+lfT3a6o7Ruos1HSystQfRlKO1g27
6pf2F3PMySywJYmSB8iO+X5a/ga7gEcUnWkNUwdScbhYtH1jEYwlACkGnqM8+stDvrias4WVnS/u
fxEEbUUN0j1r4OpE2/1yeB9NROtVFJntUseo05MlaGCPhG1h3LmKTm6jmiu0XBSWvWWhUbYry3VR
O7FoeBzadX1aktUqz67LJP/y7e9X7wUeL+uTbtOGnwgOZdP2e3i4JR8D/AyewCCie9pHTIkUTJ4b
unsVxDDF/zzDw4sUbtiQqDqJzLDsmXQATzl1Xq4AaNqy734Ng2h5W+b662a9tT/rt+pK4/Eodna2
PMVGMgVxpXrBD0eo0t5n17iioai0emtKA/yUrRARpJ7ltRlJNnHiK+mxOvHz6sDlv3VNJ5cTiNWg
HtIKhysnlU4r0pyQTq4YPnqzYvj6jBOmP/MzMFxlCenjO1crg83J8KaeC6hOyfGetxRvD8/TQO5u
2SJruAcnSQkkV1aTimil3rQD3MTIqdFIv8kTZnyp4p6FPGgaUVBIHly57dpP/eQzKk3zAV6DoXdc
JYKPetAX7IMANLCadP5Brl6nslJut3WxDbq+KuUs8aZl6SZcdm5qRX/jAwchn3VwEGo4nDkvTXxq
W9JZbpL7XR4U+6NqW6JK6CiWSDa0iTefuGDhKrAXuWzRBb2qgbP+sW6zWa8C1VJuuYq/Www1u7Fk
d9tdtJqycZm7zZCHw03CxWa7mFvJESjYdul+FcaoxVlmhKJrrDRLqtTDO8MbtzYnqWX7+qtx37W/
7dwWgmvHHEOb32ii9pKvg2VAl30i99aa5QWc1LUqWaXXyX4VrBey9YrTjXEoxbarzdJbt/pSzE1p
p5U8rLM3NTZpU7WsuYITC9XqKdtE20Ab3xZ3F6wievAgzzOwgLde0LzauIAa52yXL5aOEjCQ7SsB
k2lNdEOGf5A64Y65iZOCwRvF3oRpc47Wcp3ytQuw16vb7I2PjU7/+G4v0TwiicBiaA3GpuBLyxsC
SVbLII1uEMUqYiuDvQ5OP1JwK6wsepQOLnS2fBg6lMimLAKnmvsFHR0wMKlRrVir1XSGf/j+CZEp
+PvqzvaWMj8Bf0K8wL3urT1QE25oX4qa81hRZws40umzk+INDoREbpIENgs3O9YkwPRmWeV10rNa
1HaOaL2iisJZb1X9hCyikAMrMjvuYqT1pVittmQnTSI53YkTPytOYXBP3VtPInupEYS6zYnq1smv
hToIKR3888P3h49goiHALlobZFhrMZarV2tpGKUGDR3GoRIfIwL/B9JgZR516oLLZaBMDXcHpCJ8
GgQS23RW8gGXguSItjFivZClzKDKKLNnukEU2cIwrSqS4FQYDvIuDKDuK7sQXLKq/d4i30udM9YD
K5mo4elMoKNAbEadlTVeoRh86iJI5RK3eiZzufGNbz5eBlcegoQwTXIuGEE7MzdmS/0ZlpkxwcjO
lpSJx4uub8oD9RWzEIZyUjlbgHAao72ny1MgezdLg0am8ux4fcz0nQXe5+AqnHUwEIO96e7jrdkE
EFrw4MOS3kJn9lJTDuV5IRqU+sm27ClqTCJ7WHWTds16vpckam+AN/JG/4zxZMQ6RQfEkWi1NvKB
tYdcE9pE/iGBSjue51fjoDZSMExM/zZ3NZorqoZhcxItvgc5QUEpG4M83LgGHv3oCOdFNDDwcm8M
SGC4KBIm+yjT0eYQyS3QDqMuEOa7A6wSAgboiH5aMtbEatORued5Vh5oh8+hBOcixGEXhjloIOdt
slwEa/t7gSU1yt1qST6HZUj8cHOteZm0TU7lKs8PN3Is8i6p81Tv8ptNZuY/IHGB66+njNEgMI0J
9vzvr9+fXj//9WIMC3w0Nuat/QVAlocLT+6Ky/TaW2VM5U6bMeAqzQNgWCvuZD0l/fPXl9ebWIeq
UB6uFiu3ppK8XniHDPK7he9LinSjo2wMtG0YhnZBR96tjimlaaF1Zhs4Kbigj/SSVXPeLc1i5Wxs
kiyyiGeeciYH9cmkCy51q93KIa4XgUPbrTu7ZmdOw+EOvLoxxtW8sPz35fXxr7s/ACJrAFn5x1+y
757/e/f41x+Pn+Di6/0g9e7rl3eAvvKL1Yu4LVsNrh5HMbtN0nqRQ3zK268ugXzXkfcXuNolRbRd
WI0F96/cxKwfyfeVfoOC1CYpRBs7q6WLcGDyYWm/sV4NwBNmWWkm+KFEXEDbkdpiY/P4sp7F3Ic9
bAGnCvwg9/RcP6sBOTtEQWuRiuxsDVkTKmKkGAHGdsZHfjjmcl/LLDovDs6ckrpSXtNeZMivasMr
DGi//b7cbK15cZ8Vav3VF2ZTk0JSu151zvQp2s2aBPRE5nm97Ig0HW38xlmuVFpPhhUMA2HnVxWe
9+GReaEuVnHhSZhnQNSFHOO1RSutpqw7ZldEktyRaEio0NXEY1CVAg3nHpMsrGCLJFqGpK0FuMe+
kBuYDpStlr1ihMTVqTV9rQIsZwtEhXtP2tYm7sYq9VSu5TknunAns2v54SQPGeRbrJKPEC59XBdW
B5xKqXBzy3yn0XvaPRzX8RFC3CtxKcjn8CRHudaYVelypxZdXu88Hq/YrYkZf6SCZH9IrfbLwzNs
KO/V9v8w+EYQOB84wBRKg5NT9fpZqUpDNtq2ZO45hLLlVU2M7oRRbfWw2pEwKtbpY+RBdDEgiXrX
ZYh/pRd2jIyVqtXNpCNWhvYhTt0XxshP4K0PSRuQBimfq4vGN2xM5+R2yoLXHCWMGCTD5RZ9483Y
HSBNhem0bDpHghWyeHiBYZHMiqGDNYbxjCMmvk5rdoZBWMU9HjeGoV8JIqL7YkMeRVGiU2GT8mDC
dd8uoDmahUY0bqUH+nphbgwauT8K2vI6yPQfnFZ1HMuQeGrBoJFfTfKgqljEvBYb9S6X0VmjZmDR
L1aYrqLVid3ZFwuydiDGbUjRpLbRGEi62Nj1ztjGgQbIX7LCNbdbEBhydU397Tfi5PRnJ1dw1tzn
Wee0rqnHAEWqI/LfPbepTpfmxSbo89yH2pPX2+0y7Js2ob7kxmco52f5v8RJObHI8DeUcFQZRfWo
Mop5byIjYYPVGB9pN9cQLiKEU7UKsM1L6roWuYBxt7R7peXEeAfRPgyCe4vccF1tA5JsId1YNpF6
8cEZPVJ/iUjdC5ij/6yZV+NU7cPJEpFay9r5KpGEW3lGC6yqgQ4jeLW3a0biQw4Jjk4VBN/zszVl
QeFxcpU0cJOnDdogAKqNr+QWenhplWI6wg6ktU0aVSBnCHYe7Q8HAihGURjgBPdUSr1kEVq1UikD
Oe0BadPDM2MfkFXVSc73e8AeMTnd8KKfUT/v8y7IzGtHvs1KiMxp9/WBOq+CzO+ypcbhbyQGRlH3
hw/+JYIVEzAcbqGaUckFboDGn212IF9///r69ePX52HvNXQxNXg4bf/DpsuzddQFzoDzHg5ETQYW
HfXQa/nDMFeqmzvBLTjOmfz8BPgfesUhC7Bc0n6CtRsSWLe1zOfrxz8pk6Vk9uFqu5W7pwVrpvRb
fKPuTgVl3IFvW5m1l6pBt328PRAtKwDfFx61e3l8vJNqrFSBPyE8ttSLseCX//UXCSPT/JTRIO5U
e2zE2U45EwwzKQjI/82EARldY2jGb9BDhyypOyzFGYaiRcSrfRPjZ+DAq54LEVAYYqOI6MJV0FGJ
YRH3PP+qi2xuixSCfDBs4OY1g+henJYKKPbxy+PLw8vdt6cvH1+/P5MvVA1ph+CMW9927GsdyM+k
W9qIxtyfSh8X0o0GGrc5JLPZss1m54lsdAWpszCRXXCzuM3uJ0uj0SZcudVPC9KBl24N6TtrN0Pa
6OzKUeqVK7Ve3e6mNXVAIcRCeiAo7htDYfuzbUlCfbli7PZYWP5ccQtGewm4+f1ctZarG020jG4x
F7e/56dmyDJ5o1WynxyoS/azgvHbguK4iQLqmsQWWi99tUfu29Nbim1ImDlHyDtagbt4q7FBaLWh
exN4W88wQN7ay1v4BzVW+ifacKMDwZm8znzFyLPDqDvWx09PD+3jn8T+M2SdAdzd6AYwXjP6Uk07
v9xLjHjSgYAYg4DjM6DErsLIluDNBxs3WSkLnjsQvBgQV7EXZmn49hRB6s+hRZ0fcNGp4N26+D/G
rqw5bltZ/xU93Urq1imT4AY+5IHbjBiTMxTJGY3yMqVjy4mq5KVk55zk/vqLBriggQaVF1vTXxNr
A2gAjW5vvYxWvn8/P3779vTxRpbFaioVGcE8IVI5T6ckrgqU9yjGjV4u4qhdwnAeYZDqY2fl3OY8
HhJnxm11+M1niVn5ruAXfeepqBerkS5mq6vDfZ0CJ7gGSWxUzbTPFx5FBk0+hLwOuVUntQFyVQle
fO8m6/pFYJ29t1xMSurTX9+Euk30atlFQnk2CjhRsRNQTXo8isqsZlXUKRVcU2k1ENAa58pALlkT
DMa9FyvdsasLxh3euBTHEKaegWvnxUZrqTGyK99oRWXKbtQ/L0UN/PbeHK3K8tcqujL6dVX41+zw
23XU4+lIsnlVJ4lNF6R4NV76I4nJ1UXDsQtT1djSJNvdpH0RjRGnNT41LhrG4ZbBlbPY+eVVX2bY
GdLUoYMoEqf8p604j03Zk+TUt1t5vGsvG6kpe3UjsVOR+6Fnt8t9ywNTw54Hpi0yS/zKbVFaDCyQ
KI38Ygt724iZkToHm4bILTHs6qsMC+jHW0OvrhQXo9QI1eVlETDfMDmzqrYcnWxWWchd4Kc+OX1g
wxFFL4KAO5RxVf56OA7UhYyaY/tMdCbSJIgSypKfn19//Pn4srkq7vd9tc/Qrb0q5XFyYbbkQqY2
f6OHtrv3wQh2XqD9f/33ebqHI86dBK+6LJIPCI/0hLoylQMLOR3vQkvpQh2T64n49y0q7gTgnfZK
H/a13hBEjfSaDi+P/9GfOt7Pti7w2BTnq+gDsjddyFBXD+0bMUTvZBGPT89pOB1qMkEcLKBLx73I
UWzdUAkDvgtw5CGAa9EXzlYIqCMlnSPSvVLrALIawYCjkLzSA75gxE8ICZkkYdkMgI30ta8G/EBY
I0tbJLBQorYZBpthsqTDx6JqjqP6Qe/YNGZprbbYb7+RcTvGAQtc+fZw/Em6odC5tOjdVBqmxYcO
qgcwJjacuq55sAul6LbPaprN5Rm/A3c7wLhmOz+cM8hqOTWpMmKpQYMDa3CxBHqqF6MlIs/givcB
HEnyNIwoSZhZinvm+doQnOkgw7pjNp3OXXTfQWdU4Ybc4YtvqpcLb7NDRuBG6vkd9PLFLtAEmC+b
TPi2vCNzN/nK8XoSvSs6yHxXb30Cum1AL9k6S0QvTRqLH1Hq68wgBMtPlP5mfTxh1OUdYmG6IjJ3
yPzkUE94xqQ0k6dDM0fT8UTfis50vF6u6clOtoFmDGIcb29FitCPGW0BqpVTqvcbBZ1fvjqrmSYb
Xwu5CP2IaD0J4KNvHWLRW6kmuhmJBkSu7CKeejSQclc5opi86V7GZJsHYWIPqn122lfQAywNyZlo
f2zKXU3eV88s/Rh5+go+59mPYgqLqPLCTB5QZ+dLhco0TaPQLi/cMl+zSN/Dy6nb+Hk916VJmuyz
1CmWirvy+EPosdTlzhLaohTlpLYRGkOIrqd1Oqfore8x1NIYorbQmCN2pZo6AF3t0gFfd7upASlD
r3MWYEwuPhkhBKCAtOPUOUL3x6FP2qnoHPhmEUHbwUkkR0R+fDtuF3oIEqohhgIMa8gULxBO6zB7
MqZvxpdkwFx+K/vx0hE9B3ZV3Xl0Atesyfp2sPFC/JPV/RVCCbvRbjjZYDnEjGgJiOpCN8T0PDwr
HeYfOtuWxNfR+2umP02eAfBJc4ls+i7xxcZkRwOc7fYUEgVJRDTY7OZA1IKq476JfE5eK2sczBta
8mOho5FGIivO7BLd1rexHxA9Uedtpm8jNXpXXQj6yBOqWL8WpIoxw0KR7X1GiYIMSbCvCEAuLURP
KYAsxQQ5PMqaXNhcSgdTqqASINpWaiERMeAAYD45g0iIbbWY5HBUP2QxXUABEOUA/Q6drekAIxsS
kNiLaSsAxOSnG5WQHDF35YDVKoolEIoprRxjJtLptMYSq+mGAgJi9ZNASC4cEiK1ScSRuppVFDbd
/LroAo8q7FjEEaEvjN3AAk52e3XYMR/iJhqKzsLQJ2KaCaiCipmLtn+cZa2NA0ICW2rZE1SalxLu
NqEHdptQJzYrzMmMOZkxJzPmhE7TtCmpegj65thtU7JVBT1iDh8ViCek7+Yxz/bg7AqeBKR9iM4R
MqLWh7FQh471oA54rcQPxSiGNbX30zkSqocFkHCPHFruJ08zx7Eorh3Hb5c1zCbK+7JUN3/BXrEW
PpoMyi6LHXozo5XDHLxAkWG2tbX1Wux22AvbAh6G7tRf627o6MOQhbEPIkabaa8c3IuJOaPuuyFS
4QlNZGhiLpQXaiiwyItjUqxhZXRYSGk8Afe3NLZpySGKq1YRj9QXBca8N6d/wUIt0Go65mQ3AhaG
DmskjYnHfGtmajvRNMQw6No4icORHF3dpRLr6laV7qJw+NX3eEaOI7EkhF64qV0IliiIjacvE3Yq
ytQzr4oJHvYGz6XsKn+zFL81oprkBAuOqMR+aDP9XmyE8qrvH+Axh+MUdtH6p5tYYj+Qj9iVyQKI
Td6WvAqcWqYFOfiLJBcU9/Jm297itJXQa6gjopmjEvuMkF6/BcR88nBO44jhIJgoUzsUYdKSw23G
Npc/xZQHtA40jOOQRFvz1tC2cUyMGaGU+IyXnD4eGRLOXEBCHWSIBuBUD9aHjHmEUgh047HMigTG
VGwPyoL0ybbAt21BR1Ed2873NscyMJBSIJGt2UkwkMsA0On9uUAix/XgzHKus5jHW3vU8+gzaj9y
HjmjzpzueZAkwZ4qD0Dc3zoNAY7UL10fp4yOYI14tissWbamCsHQiGVmJDQMBcUHV+ViltxSt2uY
pbolDi7UvZKerlTqHA4TZgdNVF5DLjbww1Dn+gXbMOToB9hPyPiNGutaoxV3ZSA997yRwMziSGMo
66OZAgFjqvLwY1xK5EWbkeUAQM999Wzz6c8vH+C5htMXfrsrDX97QFE+1/adOivSADhExB5HurYu
lI0aacwkP8pGxhM7DK/EwH3GaXA4/JcMMkI1dq0FAAQ1ST1SM5ewZvCFc7x0bCMkEbC04KiIdjyi
GqEuSONZaAp5u6Zf685EPYA0pDIdKhqvpzSEPi9aGCI7OXyqvFCpsk6gj8ciUMEc8r1YJ0n1VTJI
r1zqlQkuAxwxostOjYgPtnTAuAGVUMdiRp3hSPAiMu8t0WwvLLqOA6IL/ebaye7ScwCqyJS2gQM3
hLX+og4IKFYuZKYiyHTtaJDvhpgZ9ZfGgkV7REGiADDNBYGm/AZ7FDEyG0mSY482M1JifPHDKKG0
tQmWJohGMxKGhyudtNZbYXzCsNB56BJBdV+bWEUAkwSCiJW3lUypExId4yA2KyhoqZnjfCq1kqvf
LoYLVzlVTiRUhr4aT44CaHfV83wwO8xFgrpQ8Yw/GTuSM6fo/Itz9ltNAnWicbMpacpc1Jj+q4Ja
FOowiS8kIAS5UgOAGaNS2+Og0g9tREZ5lNj7By4E15rMJpexHR2JM8svEdFUWR74E9mVnXKG0uuO
BCX9YSiwy2OgjvB0NQiii5hrCuNGSGNbzH4RjSe6efeUXNOeME2Z+CIdqRvEptTxblBZ5TrMrBVI
mubL7CeLXquWku542jaXW1Qn2EyYY4deCz0lzxE02FgqZ6otXgtirS4CERNpgHSV8b4RW1OnMMwO
sm0Jv298lgTkMGzaIApc0xuypdbp0vAZ04zHCVLRME3ZNSK1bM6Qyye8nMGGMGkYfdwrq9pG9M5u
Bn1raRA6PW2MsoCG0AuaYcI9UQN/WzGbWOhX5TND5Fm5gSkb0V6ybO6mGMb7kJPPaRTaBkwMAuln
1Zg5JCSBwUJ2xqx8X5TYBYzUDW6zMoN7F2NqWAxGrpVVG6WTtL5nOprFnhtdW4I5m8WfvJ7+6mTe
skC0OFRUxfOxGdUVKpEIOJk9ZTJG8nBqSYc9KzP4dB46UfOFfW2TlUtoQ3v09ABBWKlaIbBM5PhB
qwaWUUCqFhrLQfzXkSmrTY8j5WmgNuWRWgRtRrHkgWmnIzW5KdtMh9wNrbBUazYTWLY1lEi4rQUN
Juo8ArPodgIIYT7ZgRLxKWSXHaIgihx9K1Hj5YLFhJWxlV4PjdgeOVKG2wqW+KRf94VJrBpxQAor
KA4JWSGJkM0jbRodqfFEX1UwwjldBbgXiTi1/8I8cRJTScO+I+IuyNhzmFjkwngcpk4odgy0aX/x
hmxOG45/whVRS6PBg3cpZgU5/drHZEspncJg4h4pDgpjdAdMm25TlcEcCXmNink4fqOvgR3nEf26
GjPF1NKqsYiNGj20F8t9Eom4C4lp2RIId8mP3Cy+UZeNJ3kaU16TbjU0jiJLw8hREHOCJlnUHnI7
k7OY9Oh2kBB3QykN6c+PVrJ0pdl37a0TBJ86TvA05Nczuv1eGfQrNi1C0zUbwXsX+cWyySWarR9D
Tm5FdRa8cdaR9swcXTawtsveSBl4BlrIh6jlSZyQkDQ4duQ6bZ7fEJah2Qs933FZqrFJTTY/Hh1u
FU3Oc1/t8tPOUTTJ0t2/lZDUuq/nFp/5ahyihh55l4N4OAvJNVFCyYGC4AbajwNyVoWtJgtcC43a
MJM+FUymhCyVthOnMd9drIiFDtVs3oa/XSy06UaYtY1eUfvRLcVi7PWMod5keZ3ntBwWrq16sZ5Q
rXsgiAwqEVCVj/SNguSZcPvjCXDH6Z3Z8rI/S7f2Q9VUBaS0erqYN1Y//v6mP52cipe1EDlnLQFC
xXaiOe6v49nFAA6vR7FxcnP0mQr5TIJD2bug2QGEC5dPv/SG09104CprTfHh6+sT5ZvsXJeVjFbt
bGPxA4zOUTyZ8pyvvY7yR/mg/BeXrF+/wa4XvYswc4IM6I2zKzGZWvn8+/OPx5eb8UxlAoU+VJQw
AgKhO8RWv4Mgw7/4Mf6sfDhkcH3U1odjTysYkq2CSA2DkMP6eLg2R3D+Rd6ZAvOpqRYvt0v9iBro
8mxeGo4jvF1fnAtjOSpqTUz0rnj89uNPJA02+O7xy+PL19+hHP+A7d0ff//79fmjk/vjWit4Dz9F
ttbqAe2Rn8p9NVqTyQo5mz1nBZMeWYtjB9V2NHjXiGmCmWl3I22ZoTBqGZFyhKO2y84v874u91bh
Zzp47KwOEOlyY6i18KLo2IH8LME4Pnz9/BlOiWTna4KNRvCQZYkf6raILdgPZYfjtS1HzdnGOWzW
KWaKQqwXWSVHxClALen+Xk4NHMaAw8xRzHzE90pa2uIdXMPfwPB/tKREVgkmVTHn47aXc+KamIaI
6sjay/R3z69P9/CG+ieIxHzjB2n4s0Mad3VfoXbTiEv4Y3PutXwt3Tx++fD88vL4+rc2djUYzk+1
/JdGLC4lE4q+8nncnzemQpSCsVCcDmuUn+LP7z++fn7+vycYhD/+/IJtD1b+6Q7JWnQkNpaZzxk6
1sUoZ+kWqCtcdrr6YYuBply3v0ZglUVJ7PpSgo4v25F52GDLREn7aIsp2EiCxeQ1LWbyA0fx70bf
8x3teSmYpxu0YSzyPOd3oRNrL434UH+yZKOJrY8otAhDoaAGDjS7MB+f7tr975OXxxrbrvA8bPNi
oeR9icnkKORUCubsT877IRatR69EKKlTlnr0tSoaasyPHNJZj6kfOIZLz1FUFaOTAs/vd6463LV+
6Ys2COltqcWai+qG5PRDTSj6TPP9Sc7iu1ehq4lP1okPrj6+/3j88vHx9ePNT98ffzy9vDz/ePr5
5pPGqk26w5h7PE3xTCyIk3EwIp691PuLIPo2Z+z7BGuMXkJJvVCIvW5JI2mcl0OgzCqpSn2QDn3/
90ZMyq9P33+8Pj++OKtX9pf3OPV5NixYWRoFrKdRpJflwHmon0avxKV4gvSvwdnWeOm+sNAnb4UX
FLvqkNmNATnyAPutEf0UxLh8imj2aXTrh/gMZ+5ARlrRz4LgUYLAbJGRfU6JjGd1APe4VUvoF89z
nBrP37GYGvVSE6kG/5LaqU7DvTQPgSwe1TVUsUSu1MGC+jQzrejXbqYWpxVNcKuovre7R8ikI6KL
zH8Q65SrXmIQeXbZwIdh5iyb6gWpKyyyPd789E+G2tBxnpgCALQL0TwscZzJrbhL5KUgB9ZOQ4x0
2pgYwCYOE+4SHVXn0Crm4TLGrqPDaVw6zh/nQRhErh1OWefQOfojaZ1cWOQEyFadFZ260pzg1Bq9
U225mVa2Sz3fVdyqIJeDIE7svhW6NfPIqDYzHPo46AAA/dgw7nDXsuJOmYCpmxuzYOmLxRpODY4l
WUp8K7qIezGtME5Bh6mGM7JZmU9SrVlFTaGJlX82DiL7g9ji/3GTfX56ff7w+OXd+6+vT49fbsZ1
DL4r5BIoNkvOQgrhZZ5nyfSxj8D839GMgKLzV7n/L9ogMmf2Zl+OQeBdSGpEUuPMJIs+M4UKxraX
WrJ54hFjV1HfrTkBK6+TdhHj1zLKQ+lQ/vNZLTX7VIwqbo0qOasybw3xCVlgpeB/3s4Xz+0FmBu4
JF7qIGGw+NSdj7a0tG++fnn5e1Ie33VNgysmCPRiKeonVoDtxVLyyM2ocrdYFfOp4Rwf9+bT11el
GVkKWZBeHn41ZOGQ37LILI+kUtfzE9iZXSNphviCnYLhk28hky84VzTAKcH+2xrJzX7g+4a+U19w
0n5VJjnmQtsN7LkkjqO/rCJfWORFriEg90+MWPBhYidvSwG8PfanITBGZjYUx5FZR223VVMdKms0
FeoArRZS/Prp8cPTzU/VIfIY83/eDCE7T8Neag33oTOWVbwpsvY+shjj168v3yGEhxDAp5ev326+
PP3XuSs4te3DdUccsNsnSjLx/evjtz+eP3wnz/j3GYRMJhoYYmPW3ekcGKaWpe5SUvxQUdvKvKao
+IEk0MtOTIiXjdjPkkn6TcLxcVb6UDU7ONVzfPy+HaaYxrhEQN/lK0SkLArXDiNE7Tk2x/3Dta92
lDkAfLDLwYV41cItGYoYtYLHc9VnTXMsfhHLqA03VSbDuAyGP07ggDDcV7HhLuFcscXR06ZWLKoC
08bRSOTcZy3ZEoKTpO+r9grPl1yt58Lgu+FWVIJEh+K2WsIIgeHo05cPXz/CcfXrzR9PL9/EXxDa
Fy8h4jsVIlyoiKS6PzEMdePjGAIzAqHY4Hgw5Y4diMnncEy8VWKl9vQtiks/faeTca59VlZH+oUy
wFlb7jvqrQKAh+PpXGUnvcITScjTPisersV42bhbnZnV7VJEksW/Mr7uL4GdyTwyqfJhnu403Jr9
MnPkWfG+qfe37iEMmsrQNdmDIdL7ypoUzkI0nY05h1xzt/bguDyCOWyf7Rm98xbo3aXBhcuPxe2A
SV12qJpVy/n+7eXx75vu8cvTiz6pz4wuqxl9pjcSQfnPd0xWuguCyrEuevnr88ffn6wRqG6664v4
45JwcydvFMhOzRhrLalHQAcGpdWnBW3xDVg1HrJz7Vo6iroXSsH1rtIfbIDNEYC3Fx5ESWkDdVOn
DOtwOhSElK6lc4T4ecYMtbUnNn53tIjNTH3VZR1pyTBzDGOCbDU1ehJExnzbNfigEpYTOTUYi0C5
u5jN3vuMPExTY8EYinVmfj5k52xPXgwuknjsawi9Li/B7051/37ZdOxeHz8/3fz7z0+fIDTrMp9O
KYiFu2jLBsVMFbTDcax3DzpJ+3taOeU6ir4q9Vdd4nd+PI6wMSZMPiDfHdzuNU2vbEgwUBy7B5FH
ZgF1K5oib2r8ySBWezItAMi0AKDT2gm1rN4frtWhrLODUaHxdqUvfQSI+E8BpEgKDpHN2FQEk1GL
YzfgRq12Yuaqyqtujg3MQsVEEWB2YFABby0rnMCyKGBWwTepFZgdglFDm4ixsCdl6I85IrOlvUMX
yWnCaJyupU/EgN8dtkV29gULwIOYxc3tjE4HEXRllfXUezUpa9IGxkgzEyqQ6ClqKZUlG8bR+OIE
ok6z73M8vsRvGUc5xO107p0Ndeyqgwwx7xAdvzSeH8MoPtdlnREk/JZsJa+2MRa0pVoIrr4+44yA
YGUjiUaY6ZlMi2md6A5MpYhDdAGCJNaERmxF61NLgg/DWN+dKqNyE0rZC62o8XgKCuzWNEFyxgdj
vjdQRxcGeHwH03yqf+xcCQCr8UAWv68oQs5M012N7/JpwUG/IdqzmEmvnVDzdoOFggV924nFJhdD
ZHzAklQdxaxamwV//9BTsaUEEhjr5US6ZkVR0Y4xZg7aRwCU8Xgsj0cfl3vkMT5yhblO6G+Va4hn
/XuUQtfiDir+n7Ira24cR9J/xTEPGz0PsyFS90b0A0RSIlq8iqAO1wujtsZd7WiP3WG7Y2b//WYC
PHAkKPWLq5RfInElgAQIZMJORK2bxlSkqLA0wyYxOTMq9qbBE51EY4apBymXfLOcUQ+GsBxXZhxr
I3vgTIkYrlg64G+zyD8nNrkZ8suQMPc0L3pLO1ybxdJSrt6/tFWSmG3Ioy6pTPIpnDlgExh0RZmb
EyYepYbW9NbR5K27gzNUetT3pBJXxrpksUgT8oKiHC3dvRyjWfI1feUhr+TeaixiTyGvcw6g+XgX
qMqga6oyPeu2IUL7nb5lIS07uV7vvn3//eX5x2+fD//1AN3f31B1YgsDBiswBkyNkzOPjKoili32
s1m4CJsZ7W9H8uQCTPHDnlRXydCc58vZF+1eF1LVzuDqEufm904kN3EZLijvvAieD4dwMQ/ZwhTl
xnRDKsvFfLXdH2Yrp6q5WM6C436ipmqX4ylGiff7w6XWYcOC5m3ikePYxCH5WXBkUW9NiLTqdeJk
WtsFy4iM7iYIyfKK+iUjXVuPXCzG50wzSrqE1iTkOofQkg3PRx1Ivh2cka0soS1dk6zaLJfTbWQ7
KBgRzSWDW9TeJ5CDWO6LxnzOy3C2NmOOj+guXgUzSse0LOvoGhXG4cWN8d7LgPlEwB5Rm1nlzVN6
K5DG+hOlrDyU5i/0E30CwwrmamMsjRBk54nupTFF2akJ7Sf5XbWcA/Y+f1GeCt1zIP5s8eq3eaRu
0sGaSWAkct23tiGliFvrPTuSqih3CG2SxS6RJ9FWf3+H9DhnSXHAxd6Rk17ipDJJIvkyThMavWaX
HKxwk4g2GOwHRFvu93iubaK/gL64FHWNtjUCdwrVRnjkrnckknN+TWoEqUvFXa1L3RGSRsS731Bx
YctEWDazR6Z5798UjQ8GwHiKxc/z0Gi37ukKGCAtM31KySzBjG33HuetgJ+TelcKVBBeNEcvm+/1
vxShIow53XnCK90uWX1s8nC7TYopUAHAoARzlcaslqpOi1nQnlhtsZ+vrXFqgDQWbdegTrH+5UNW
2L7dLYldyY2mYVlZ0mfBMk9eYwk9TZc3FTs7mteIFemdUda45ixrT8Fqqd+LHqvt9D/oRs6K8Opx
9Nw3QRdGip0TL5/11EFaW2n8D/bnP5/f9K8UA80Y8RiBqk7ktyswLr8mP68WRsVc1cXr7xdOPgPr
BlOkb99UD1dldEysfq9idoo5bOcs7Skjh6Aaw3S/3CF9xNyJaQ3Z+qmJEG0rakeU8TZ4SKeQoKhi
7hZexqJlkT2PdkD0FUyfdRhs8+sWbTc8IEu9rHWzXC2WBE/nhq+MHLXvAWXiefxWFtJfHxjJS8kK
tfQpNgp6PBQnZ9KE9Ku53MyI9pJy0WTe+TOptshJlDZOBD8U8ujWKoO6r/EWPUidlbc09u9PTx/f
v708PUTVabhJ3H3WH1m7pzFEkv/RHpF0dduLDAym2ilYjwnmmyOG1CewSq7e9OJWeo8SIZRA7j7B
sB7tObWTNwR0VSOga3S214CxQmHaXF0QrwngUgkjjQaxKU5WQqSrjrd6tDOgrG56/u/8+vC/b9/e
/yl7y6m6FIct5tVrvTCc/h6ss6FNSVp6k7pnysIhkPJVGMwmRtKR18dLWcbUMNAxMKZzFrP5etbG
9DPcsfh06MEBlw6IhLrlkME67QkZZLAfkyTfMeo8sOfLm2O7a6KzGL70M2wrvT/Zv17efjx/f/jj
5dsn/P7Xh92VeSLKomWc+ras4Vf8tLMvrQV1xOo4rn1gU06BcY4fVXIZ92uKCRul3jPb+jWYeDEB
lqfGh6q9ABqPjqkx8qCug4yb7SQZeeGXVMVkMKGBB8vRnhqe2QauQtEUaw/ZiWyIw9WsjMsQhAx6
hBEWncGAo5GaehRTs511kXL6ixe3Fc/I6ipo60IChyZbWt9xpJVyRY/eyDYxJvBYwhUrXbK2MGH4
IPdEyMR59WUzWxHtoWCGcLByYQzJQQjt+FuxI9pAnqyop6cEGItqdROtEx/G9lMQWESECTbCERin
R8IO6zhioqoKqmHkqG+GdErhTQnQRKkIDRLou25lK4/sjAijhk1OvZNXVwY5LBen4jBhJOkjoX56
ffr49oHoh2v2iHQBaz1RvRpGsD7C7hBOlLTc37fkiKomvbIPaswHu6HJn7+/vz29PH3/fH97xRMY
6b7kAcflN72AlNWgPJ1YtpyHa9oW7iThZFsbEd7/QgHVmvny8u/n19end7eJre6Svr+JiROATQd0
13ccfDm7wbCgdjhSLovlzhC9g+TMiNU+VXK7uZrkUBPGoiSHM7mr86MxI8Z8D5Ibsx702NQSnkO2
6WnnRyckB5NpEYb1i9xLDAzT6iXZgs2qhVnmOFUKsMG9NVS7xpkPveSb9XI+gW6tQBEWvqU/Npls
Tc1zkTmnhiMDy6LlynwdZTLkDDbIPpe3bn3XnjBxBmO/xrvvWZwprnn6D0xw/PXj8/3Pfz29fvpm
0oa3SYxxAKhDBwDFFHgaQXU33MkU1iC9WMQONmZnXkQcI366efRgHk3C54hSphIGfq/QFJRHO0po
h1XxUC23ddUO7+Hfz5+/3d3SUi7bJb1fYE/O3UcCRwN+WYdB0iZ2MO5+UrtXAVzBp4JXKfcefiDL
lWe8uHYziyOgQ+Vh2LgruS3OM8tdm311YPQ0hregWdEf63VLJawPZJTi3mrMMrWITE1cvvNadVzG
TtTOoseCuf5w2Ubsuy4OTnsfNtjW7gHsiK0C7wd5h/F2XuvZzFOZdRBs/EibXnxFlLAnWmnPdlwE
swUhHejBhhR8XCyWnnBsI8ty6T3xVgyrgFhJkL6gWuG4nG9IGxmQ5ZIMQjQoISwXIZXXsI5YwC4O
N2SKXQMmeenSIzO8wEAW82VGZaAAcqlU0FTTKY6lTyqxw4jEIsyoVpWAEbnOBKxIiAboFUf2koTW
ZMAwjWNO6CHSV2RtF+GamMkl3VOldeCbEjp0epAi0/VKjMQO8DbX3IyNrAELuqRz3UHuSF/OM1IQ
BiAMyYNk+cFgqtnVFwVifScXb1whfXN1ItYB1YFADxfkJJqIzdzzTV1nCZ0pzMfm85bfsx2afDXz
xFHrl7miKNv6OJ/NqQdFw55dWpgbQhUkMl+uia2LhJbUXCuRFbGfkcA29CHzNTFJ9QitjQrdElqk
CuEcYg1HFMEKHdx328GpttGYOyeHlEywXYMV6bBA51hvCN3sALqCEtwSB18dMJnKitmtgRvqLK0D
/CIR9ImcG857LcArUoJekdCihOL1iG/yG/Bb4wcYMaQEHU/LYAr/c3PM9ny3MoXBOCcfnAwM2Sqc
kxMM7u5IPyA6w5yYgn3bYPVRlaYvCU3VToZthB9yFlOboB6hVaCL0MPgL99z5zLGyKE+p7knVbze
d/sFZb5PHFjRmwQh8tBwgKADK8qE7QBabXuQrq3IF0tqYhQNm4fEiES6fY1C0WE/zcg9VMNEuCSd
wRscK/rAAaC1/25Hz0EZKgCYXoJ1YB0QlZNASIsCq5lYWBpY3hfU8t7s2XazpoDsPA9njEeU/auB
dH/pDGRvDwzz4ErVcIDD64Jsb53hxs7G5CWuo5hM0x98O744ugYL6q3nwCfmLAzX1OGVUGaiB1lS
3TccV7hHBzEL5pP7BBmNhtonOGFqBiDfGF5QdHpI7lYkMlkIYNjQIo2bpjo9JMwqpFMTtaQT8wPS
aaNTnmFO9aDvkBPp1DiWdGIYI31DzIZA31BGoKLT46rDyCE1HLtSdDqfLWV5SDpd3u3aI2dNHhAg
siED1nYMX7P5hrR+vsqzrO3KcHGiG6jr5ZbKUQaLmLIl7WgSBp2YBoG+ogpYsNNmHiypMiC0nJwb
kGNDDTAJUFVWADUzVGwFm0pGpFEfeC8Cz8GjmjitUAznG3h9ncabER+9lxgHgkY6ZZT4bgpo8Aho
F/fUzUQeu9+5Um5cgYCf7U4egj7Cml8nxaFJyXkdGGt2IaETZuRJ098ZdD+l/vH0HR0SYVrnKSkm
ZIsmiVK7rNCCJ3rhkWhVkc6eJXbCu5dja8maJ9lRv1KCtChFVwE2jcOvR7swUXk6MOr0GEHobJZl
lqCqLmN+TB6FJV+6AbVoj/0lSiNP6IVDWdRc+OqZoEOWvSkLPfXrtyYk7SuUwyQdknzHdY2SxH1t
pTxkZc3Lk1O0Mz+zjLzoiyjkJp0vmLKOj4kt5sKyxnOdWOWSXERZcMqSkaV7rC3fMUjl6F/bIjUW
4Re2q61OaC68SJkl65gUgsNAMSNkIpJF8hKxp2RZ4gy9LCnKM/U0UoLlgVNjoKfjj4puqIFlT9/e
Q7w+5bssqVgcWlwaz2G7mBnahMRLmiSZq2Ty4WcOepHY9Azf9NnEx33GhFO3OlEK7htUHGZQUe4b
O11e4u2x5NGrNvkpa7hUQI/oouFmEcu6SY7W8GUFxmwH/Td6UiP7GlymThqWPRbUQyQJwxyTRdbo
64iGCwadrr+bNjPrGPBB0GR+qJbWdFRlDJ8swhhzxjg6jxHK04RPbM3B8DAFCsZVWxqyiFs2Olol
CbqmsLpANAnLHRLoI6wyiVNckF9lJ+prmlS23OryA/qFYUKfigeS0ndTes7q5pfy0c7CYGr4mX5k
K8GyEgn5wk6iKUwzVmWbtD6Jxn5volOJgp5w7W4rQR1syymX87y0p8MrL/LSlvQ1qcvJ6n59jNHK
8WmHgLmzrFt1s8NsTIWoB9HdL99SnlVCN6MoW2Lwi2VaQYYDKh1S/K+fTy8PXKS07aSu7QI8WFG9
MDKd+iCfxw9irwBhC8SnBwDa4sg0w9sSPYfeAhO7tkwjbroZ0VsYOSZiA+neZeFHu8NrgASpf5e1
0RH0GvezEVBCxZRI3z4+H6LR319sm3mY2HE6gUQRp2RQEcT6a7B2mry8Ml/luusKwqxRw/egaLEt
qLup4ZFkPdiO8KG8Q2jTi4qbwesvLqiehpoVnstXNeSoUg0CNnSZtuTFAFmXXB5QGtGbO7JVgDi1
KwAU6XwGCmBXBSF5L7tgGYFHu7URLgFIZxlryQpgJpv14mvRFP/hezvBCXNf1WVGBoUABrTnYVnB
V1lWsU/F1SJFX1KbKxVf7CybUqR8x+x3XgZP95jHp53N0RZaXuibmTlY6g2PjoSkIrlYyzL+Us+M
dPEjtZXWFG3rjUzSCIJV35xZTc5djeZEgU9LQYsjsH4P5gIlxzk+C3e2bTI9g3U4swouI4XPKGLo
VAcfci+o02WJ2vEvJRFGT7jQDwpVlcsd6Ef75bRL3DZTWM2++DLCkJRL/S6CTrWed0uIIGHY2sXC
rSGQPV7CO3w5I31mdKgdvXYs2ZLeGg8MK9JTgISH8OFmKq97gQFdul0IFkAQLsSMPNNShdFDZ0oK
GXtbKWQcbmYTzeWP2irhQtid2EQMYxHa1CxabgNHi9zQvD25i3Zrq7TppFeSyyb0+IxXspJiHwZW
5HJrlKmrfC/Pr7//FPz9AVbzh/qwe+icM/z5im40CSvo4afRjPy7NU53aFvnTlnz7Apd4WtMDEju
JGnA7shP3ZMFX0peORPAENG9Nx72L98+fnv4BnZO8/b+/TdrkhlapHl//vHDnXgamLgOxoNlnTw8
7rfK3qElTHhpSZkPBlvexF4RaQL2xy5htFtCg3XKnZbBaDxoMRAWwcZCuV+i88D56Jb4ziVpK3fn
sn2f//hEP/IfD5+qkUf1Kp4+f31++UQvrW+vvz7/ePgJ++Lz2/uPp09bt4Y2r1mBMdgaTyVUSEgP
CLtq84K3gRZJY3k6pvkqebjpVcuhOfELb98IWLEdjjX9juY4aMhM0WGVEJ1PLCI3Dn8LsC0KQ4FG
qhxaMK1Qe0GbS+U1NpsjRXd8rIFgN8dJjv+r2MF4rKMxsTjuOu4G3CpwT/PlTRoxT1Ul5nWooDHy
qtS9FdhIG9H1VKCzs6A5YLVqaMNb4xc1fc5mslDDWc/Umjwt6EbqujHD/lkQWHicdmZmM0JWZ7Mg
ddM9YSfrCGa/8kriPhoHaHfauxESxWMRoUdOw/ASF0mnPyF0ktzSKwB2d+dk9Euqlw1RR5Vsht65
ubeGyAQTeGUx9N54zXoO2/fT1fGnjC7Y1SneeLoRLxbrzYxYIG0WqvfyAzrf57w1zgbhh3nDvWK1
dIJSof8wQo6kd+Y87qEF050aK1R6bO2xv/1tFN5VCqY/dDdD1kBnoWZbDXcOfp0yj3pBrmHnvbmD
xt+gHLy0PGibDLlvvUA/dL23Eyo3gK38JAXtNupR9TmutCWN76OzdlB+TkvRyJQ2DQ+2RXdyM7oW
Vocq+Nzt4+3Xz4f0//54ev/H+eHHn08fn9Sx1i3WsRKHOnnceQ7yRCPXBxLr/fx5tKAu82R4bEtL
z5MsY0V5HdhIrjKrovZaBmtqE5GyM75V1Y6o4Id0/1+Wx5N2SaxnRM8rMEQ0le9CvyohaqF/efv+
u25vo7P5+unXp/en1+9PD/98+nj+YQY45pHHzznmKKpNQDu/vzMjU1wqYtryGCvSbVY8AdNMvu2C
3J1pTClfwYaSarBWRPrJuQFUHoAvjbvbFrT0Qub+WcN2ebAhZ0yNJ4qjZG16+9NRGRsFbOxpIeio
A2MdC0/VOt8lJHZIclh7Pfkz+YljOnMR5pXQL/4g0XmVhcRMBLNwg9HMs5gfPFleD1a4FpelYlmu
vwbVIX3XrtHLa+FJkedVONjWWmFZ1Adc1ojlBRrScCs6UNckdWtT1V3rHW9Ee6krfEyVFeEmrSKT
bcf4ESPJG/edJNAEbRSdsA29w7rniUln+ZIjysN1ELTxubLyVUeHDrFF7z40tT0oj31mEQA8lgXl
bVpre46Oz6ikysmQv4LAknpcUfd4IWh7eMSpE7weFbVZWS1Ag0dvUw5TxCo6z8m4ETbjltRFgIwr
Sha09kLr7SY6h6a7CnOeDMmAi3UikgZg4/F/c9ppqUjAW8wd2An6h/T8GnXrl9EBPL9ucnpRHWDS
ROvBipRoHJV2n8t+PL0+f5evNd3TYI4h2zmU8NCfDZnblxH95etivaAPyGy2cEk76rH5yGBlNpN+
0VLHroFxBd2EjNBcPdTAhND3xPBNkGicPl0jv7hEN+wPGX+qefodZYztqk+veG3IuKWgg01oPcZ0
QJifoRg3rQXFCzsRi9nLesYnrI+eJUGxpHyvOCZyTJr03hx3cXUjQ1iFbmZ4mMd3tgf5Lt/gWa3N
8NsOqNbFu/KT7BG7r7Mk8wG267ebTrJKHfC0nGRQHT/FcVaPlqeZ8v0tMRjdbMbuYdrdwRTcIynY
TSnFwBay+5te8u/uav01vVIp6EbHAMONjkGOKpmuH/Dcr1fA3I3se7mT4i9wg4JEe+pE0GUdBjPN
oX+YcaAb7QoMN9oVOMYJzlcfZLq39usVGdPT5tl6s0PwztlSst6YfDcB+X3b4jED/Tpg10f3yBkb
fEKcqx1TzPeptOS9W6U3Afkg2+LZzD2Kg9Aw50/UFbjcIellvdl0yFOd5N0Q2sTy81MPBGhuFmdT
tVYCi2KKR/XvdEXu7lbg/QvditzuWCV5l4HvNEGBhNb7j30M+04zAe/276gfJlwPSrkmsr7PfV8u
GlbD32geQItbMYHldi0pEsFutFV3uVPb4Myj1eJ6Nc/demxZndHXkoENeSbXx6IU7Txc6hxE9h3j
gsyjA5emFAJfTeOLW+VcLsL7ysnqfDVZVtQloY6qzM1ThwNi+ascT3DxSkxwoxyKKaS7BLHFnMRk
//I9PycUra1q/aoVOp6jc0BARPiG3m7JEZozT9llfuY9r4HU2l4MRwTKluN/V2S6Ht1wW+dNfOt5
ga0yj6ivAtrQaNDlmxpXHdh5GTpHRgjS9CIqXmBVnJ23Gs/i7c/370QkNnnVoS21zw6KUtXlzuwy
UUcwqRqhKjpf1VYshP7Iyab3bq1sMj+oe2butYv40rJq5w0CsG+avJ6B5joJ+bXC+cNJqH1XEGWx
8krGI0NHaB0zfzwC6bTPSYLO/nibCn9BOr9sXvwMS8VsNsFQVFG+pura9xyLMVZA2zSRWz4m8i1O
Yt7Eqtvj3RULgSp90nVCReSzOxTdtjo5FaCfdeLNCC+OQkM0oAWsclN35ag4rDdR6olE1THBkJmH
nmkAceUrMqtc5a6EcT+N1V2LUcsXq7vgFPjtZrYw0+XndY6HNvaVzZFFuoOvOD0hd87ivZ+LZC3U
monn7CSb/BLREAE0xo9meBLf1pXwdgq6lLbjnOBsa9PSriWi3HhaMtDz5kQfEXfWQVtCn9CzZC+i
8XytTYZeaOh5tmsu/F7LMGClXy+q6/9X9iTLjSO5/oqiTzMR1dPW4u3QhxRJSSxzExdZ9oWhttVV
irYlhyzHVM3XPyAXMhekXO9SLgFg7olEIrEYNiiLmzHuu7SkwmN0SD3MrwQWBmMWrePx0THBaH1m
l1WYWkh7fmB1ACtkeHFhD3inSaTBUFFe1S5cAHsWiP5RGN4W1+HVxNKVGsKgdXh064PFyVRPsYjd
TAWkn2MZRJcj6OWe1BFGlvTheQhkVgRoGEh58uF5U4SBqlktHRE2tgh0O3RY0EEaLm1SPONBip2b
UFzqdm94W7BQioehTYHMKmOA+py2/ECeb/fbI4jTwgah2Hzbcjs61+VDfB3nbTGv2TSJ7HJ7jOA5
ps0PTdKZt5DT/VnT7OK5Mc2M4o8KL4wG0au5XpR5M9d8OrmjBaejYHb2z24dWV/IeLoKasu9fkOP
anwLwmRw/xmJahAtR8CKcrB8lsvt6+G0fTsenqgojmWETlT46kbOA/GxKPTt9f2bK8SVBSxebajw
J7eisWH6M6qA8AU9N33nbAwCbKxm6aLabLRNOG5D9/5V/Xw/bV8H+X4QfN+9/XvwjrbHf8MiC91h
QbmrSNsQlkGcuTZk6iKKEY6dQVDx8rOV/sAsofwBhFVNaTyQamHygzibUfZDgiTtSPQeU82RmRf4
az3ZTIFDTo+ngSbYa4gqy/PCwRQjpj7RBDiOItqvReN3GqOLGrdDEZuNdsvv8NWsdKZjejxsnp8O
r3RH8SuZjcaQChAMgmRV0ycOWSivLlsXf/QJP5aHY7y0au4K+YxU2C9jUhO7AK2V/CWTbKPzpXji
hEvHjx/0YMgLyTKdU/eUrIjIeogSeU3RnnPlZHfainZMP3YvaHjd7S3X3yauI91fAX/yXgLASTkq
sc20jOYi/dSkb9SvVy4M0jTFFbFp5YlsntFhtGKFdW7D+i6Z0Ppp0AITwN2XeoRQBFeB+cTXwzT2
YnCC+o7SGCpLOaoPvHfLj80LLFbPFhCSC9rqLc2HcsFbQSprydgMAl1NY+ebJCFFD44rwtJNzsgx
yzTWMGaJwM5p+zyOrdIQKXxV3gdZVVl8TIprRr4Ccph0RiFvAobgCPIw5j2gbtsPVZcTwQDdsOvr
29tLEmzGvNLIybAyHf761vOdJwR6T0BG6enRQ0+5V5efFXz1adVXnkCcPQV9IdMIfLkxeorrTynY
OQqRdPqTIiafVjL5bLgmn3V1QsZw7dHBBT1TE/LRQ8MzzxRPptSHnYA7LzVtXAc1+Ja2c3rluaPy
hc9iymZQ4qkSJarzsMO4NYVxNvAISTKhwypPajaPzhCNPyMyWFzD1UyuOMJZ7Xr3stvbx2vHYShs
5/P/S2KoahYOS7SaldFSXdjkz8H8AIT7g87hJaqd5ysVaCnPhOOMpuHUiIAH81jymZ6DwSDAqDCY
WZJGo9NOVTAzPbTxPVy1YjMvpdEJQupGXZac+GlTqdI8Si+842tUmpSKGjGuzexRXRX9oIrMpOSq
rIPeuSz6cXo67GWycqrRghxdiB8t80abZFax2wlp/isJTHdcCUzZejy+vKTg19dXt2NzwykUOnr6
K7LtZRW4zi6HpkOtxIgzGIScNo0r6uCXdGV9c3s9Zk7JVXp5eTEiCsYYDx6vv54Ctif8O9ZND1O4
t+oRr0Qyt650Kdi3YTGj5Bq0h01GIC9o4gJm6khNj37UXeKbchbVbUA5+iBBPDPDBqCEZ+cMVI1k
NyBkQ1Oh4rN6yLIIYqo+oUuapcGojab6e5VUwpoRDORWqsqcVmrG5LBntea9Bj/aVLcFRUAc1iag
uo/rYFHrAcMRXMTZvMj191SE1nmeWHSRftDIKlWEDv1L9OCTCiwJXqWRHj0OfsK9bff8jdypSByw
22GwJn31EV1X8XByY5Y/Y3eRUQEmJ3EDg6zSGKmvb3jY3I7aYRyKEel26fADj+WZ6R11n3r9DRGH
6kbHXlohPKbWEi0tus2vojKJaU8vjqauyhpePcJ4Kg3vnWaKtK8e+kU8XdXmAMXp3C4CzgBKgpGo
0TVB39bkLYJjeaicZG5NTLysrkYXzATyMAljGxYMcYNXQe0gxkZQWAGsnOlGmB3Iw0E7SQERxdVD
FggvsLEefVoQ2ua3COWBFm4uLaD5EIEgzz2IoyTvqnX3b46QkqNdlj+UFscmo5ug0JPWc2hR2hBk
iU7R8mnNu1r5M6mnZpWUzPigjqOAUU43ErkoxYY2PhJvpo4EFJfLwRPIflRKOpa0s5j2N1UDDMs0
wCA9RUwZxHdU5VJjx93B8siGFkoNNC9X70FdgbBygdT06aGZkftoVLWLG9FsSj9fLrsUSS2LQz0L
OG5XwGOstNKCZrUV+1yp2aE4kFWmceZ5bUxyOJFQlVoECwwnRzTJIBGnX3+8V7XbW6Uls+dVGyyQ
lO/aKRnVTbhcBLr6SxtAxLF6cX3r/ZKtq+HFWp9rhHKN5+TSLewMn5cELqen8Pgr0IOTSteRKryz
YTBj1zYMw/XFS7d5kol6a7cYnQaUEe9ZOXVLReMEb5Hda75dbKc2cwuUii7fTkUSdDj01inuaHaF
nG+lxfDSGS64OmLaLrch3H7nTCs6rw1vUx4fMmMepNWP8gRCzx76Rduksx2KOFcrFg+D6uOvd37n
7YUfGWC3BXTfUQ3I7dFBeNfRCJYPpDRSZZyHq4Lhqd2ZAQFihJQUF4fvs2qEZ29klio6ht8a3J1j
cGgQ4ykQs95POTdy2ooOViINDTbKLhkO3nZ0k4EUVHnOAoMKi/A0AWlE0zVgmhZjDxQrtFtTMv72
5u8nCgU4e7zQsVlqpzYK+a/1hQftDrxk6HyyV3Au5NZSkFceavyUaeaZgQE2XhURK4djoIM6Fg9O
IR3FRFJ4i4oXk4trd0SFFAJg+BGYKJHI83bSFqPGxIg7olMWS68uJxgGI4y0ezt/pZYnR2v1ATZ+
ERcRpVPEAo107nDzTZ15Nyms6ScoQXDm5XjJpMUg8pu0IE9Qk11oX6Muipa/0sDYmPDTHwkPcEnh
Rqwqtke0Jt6gH/vrYb87HY6kaFbCNSYN4C7QFvYrvGr/mZI6pqsrXmBUJ+YvZcrQ3pdGsGeOuwNJ
qbZuxuKjlBkhLdn++XjYPRvNz8Iyt19X1dOsJO+0KXow3GxlxObhP7vbqgHkklns0CI4D/K6sBHq
whShAYLzmcKKD7t+CCTa9vEyPeZi0cyI6Sxen2ZmNR3zUcSurRBdgWgCnitkt8S+x6ASWmWdjGu1
THyyml0BH7JK6578yU+qbIWB9eaFrskORmiCadFzAyKnj6KUEv5xNsTifnA6bp52+29Ezulaz1Vb
p2igW+ftlFVGLrkOgU+dtYkImzR9MEFV3pQBquazKtfFIg3XhSrTOyE4jx3+X0Wddbuh6fZAmiKm
Fq4aag/BfykFvw7uZgpjVII8t+bSu3hu/ng57d5etj+2R+K1uVm3LJxf344MiU6Cq+HkgjL2Q7Sp
IkaINIXu34iJijvGDyu20NNRxaZVGf7mSnWPSrZK4nRqBtFHkNhe+PrquSnWwL3zLIsCSt8e5E1m
BIYW+0eacmbGfKOSdhmRm962KuTxaZzwOSo4kqmVE5H8di/bgTh6dLUeSD8hq6MWWHLBykpv6Iyb
dTGDPUXretSSlmiAGbczU+s+5sXmVQwTHyRWORxZRUFT0uHZgGRiFzjBhxnMEswbYqHO1DXx1WUS
+fSRHNmfTlqbvk5DQz7D395ioA3pNIC7mHEzwkBjgNF72gGBNLgj4KgXbaWdlFtQu2Z1XdIofYQI
tBojo08cRfRnrZrdkSJEmmG2KyqpEhIsm7xm9ldduzwflbX9RZ6BvBXBoVA2tOyGRPespJUBiPTN
E8gnI6tjEtSi60cMcnmYeEIkBYKQfJUpnfFSsLPd74j4apA2/NYcdTRlk8HlAVbqQ+uPriao/SHa
BJ5Vdgg8orpohkbf8YzeVVmceMdjNnKGg4Mwl8HZL+zlrcDk5lfIs5ufE4nRPVMxN7GNs69RYCYz
UVXAKcHzw8SmZ5hCJ4+0P0WPn5zFP1Y1ZWWAE6nLs/Qej9a4J01uKiAyinxeaDiME6iWunHqgJSN
5goPBgXdqCgLyofCGikd3LJkXhk4XEj1AwFyA0f2qGkTg3SSYc7JjNVNGZETWBGBCgXIc6ZzHDcD
oIpjXXFKArd5GgdgSFSuXeAywowFtB1OUQJefoEMyxfnTVD4uJbA1mWkXwxmKTDioQ0YWQ03XopZ
U+ezyjx6BcwAzfhJbLo5NxXdQRmdb0ZzoxxmMoE7+My1RA42T9+3mrgyq6zjUwI40zBZiUSgliqf
l4zSjyoaywRegfMpbvU2ifX7KEfh6jd73kHPcFWNiGxV7w0iei1GIPwdrlp/hKuQS3COABdX+S3q
6fSp+ZoncWScl49ARnK2JpypSVSV0xUK45a8+mPG6j+iNf6b1XSTZpx/a2J8Bd9ZS2U18zJ5QCh/
BoxhUmDky8n4uudbdvkCor6Jc7TIr6D/v32c/r7RQmZmtSPI9BLzuZ4JNcr79uP5MPib6jEXx/Qm
ccCdmfyBw1BZXRsHFAdjJzFhUlyTGVY4DdzYk7CMNHZ6F5WZXqultRB/+kNWaXHcjnQzFVciSCw6
1UWproorMUqpc2Cz0CcbsplDHHHOT5MvHGqAYFYbH9OYRsRkKpwfdearrzNXVOmQzTT2fxnARiZ7
VS0bVi3MfimYOEI5TzjzpaAK4zIKarKUENPIFS1mPyO97mxCfpc/VxInQKOVoPB466gPuBh2rsrH
RA8V3YFB0CGhOdms9ePZKqo6JAqbcOP2KXeAf4zIcqN0GoUhGeyxH/ySzdMIzmZ5yGBZ4+7q7F5/
MLLkml7geWqdn4vCAiyz9cQFXTmVSKD/nCllXbSsAQdP6TUHXtGNb5xGCIjQ4no+cGS2qMz97QJJ
6T4v73TuQ6km9ayb8ENx/T9/270fbm4ub38f6gw/qbojpIUjhC6wJxFpeOnPr8mgtwbJjZ6SwsKM
vJhLb5U3l5+2+ObKW+XV0IsZ+au8GtOzYxLRFxWL6PPxurryNvHWg7kd+7659Y7+7dg3+rcTXz03
1xN7kECEwhXW3nze+eGITM9s0wztKnhUcc+HqnprWhXYmVOFoF7IdPyELu+SBl/5qvEtVYW/9X04
9K+4joTSJBkEVmvv8vimLe0aOZQKBILIlAXIOM0UbQoRRJikydtOQQJXvKYkTU4VSZmzOvbU8FDG
SRJT9jqKZM6ixHy+7jBw5yNzVkl8DO03LOU7RNbENVUiHwlo6tkuw2X7zoo6rlE09UyzNA2T1Pjh
ng5NFuPeIKVzQ3ctXF63Tx/H3emnm+jATOWLv9oyWjZRJU9xQ/aOygpuYnjCAyHcwuekZluoLKLQ
LbsNF20OpTArdrLSNrVhGlXcEqUuY0uCkyS0OIwx0uEaE0ZZJDKIBHnx0LIkyQM7I5NDRh/umCE0
4DQpDLNwUyNqVteovgd6hrmkSv/8DWMVPB/+u//yc/O6+fJy2Dy/7fZf3jd/b6Gc3fOX3f60/YaT
8+Wvt79/E/N1tz3uty+D75vj83aPT1b9vEn3xdfD8edgt9+ddpuX3f82iNUD18ZoPoRWZlme6R76
iOC6JBgZM3mORTGDTWISaH6HZOUK7W975/lir8ZOc52XQr+mX8twMXWJbYLjz7fTYfB0OG4Hh+Pg
+/blbXs0AopxcpCLCmqhSCxL5kZABAM8cuERC0mgS1rdBXGx0J+FLIT7yULkknCBLmmpm8/3MJKw
k/WchntbwnyNvysKl/pOfztUJeCdyCUF7ghnuFuuhBuHsUTZqkQbLz9Fm2YeR8Kvvbc+iNZ1yVxy
k3g+G45u4GrntDhrEhrodpr/IdZNUy+ARRJdtuNfCD3Kx18vu6ff/9n+HDzxtf/tuHn7/lMLpixn
vGJOVaG7riI98EgHCxdEc6KgDCvahUmt6ZQM+im735SraHQpYpkLM5SP0/ft/rR72py2z4Noz/sD
+3/w393p+4C9vx+edhwVbk4bp4OBnipJTRMBCxZwbLHRRZEnD8PxxSWxcedxBdPrbtFoGa+I0Vkw
YIor1Yspjz3zenjWFa2q7qk7uoGe+FrBancvBLXD9KBu99ukvHdgOVFHQTVmTVQC57J0Vbfnl2Em
l7qhdMGqgejVp0ZmgbnvPANjJF5VPE4A7VrX0HB/jSvxkdCv7r5t309uZWUwHhETgWB3RNYk/50m
7C4auaMq4O4gQuH18CKMZ+4aJcvXVqfDqEJKfu+Q7oJOY1iiUYJ/3YMgDYdGLH651BdsSAFHl1cU
+HJInHQLNnaBKQHDN5Zp7p5c94UoVxzfu7fvhlVMt1sramVGGB/sHG9iWTONz4kAZTAhZje/x8xA
XkSfBsCafoYpgWKXBQcMBWknd4CGJeMU9+gr4rOQfLRTkg//6+7yBXskpBjFLYlaPGndO2xZRKY5
TrcGzqzfOnLHqL7PyUGX8H74xEI5vL4dt+/vhsDbDcwsYbqdpOKZj7kDu5lQYofvVblHL+iLrSSw
X51FfKTN/vnwOsg+Xv/aHkU0KyWwu8u2itugKMlnYtXLcjq3EnDpmAXFawXGylqm4zwx4HoKp8iv
MealjNDcuHhwsCLNIyFkKwQt93ZYTZCmRENOc3aUOipSeu+wUcbFx3yKpoZ1Z+4n7xkvu7+OG7jr
HA8fp92eONiSeCpZFAGnWAwi5CGifBzO0ZA4sWnPfi5IaFQnmJ0vQZffXLQ6wEDwRDX/8BzJuWq8
YlrfizOyHBJ1x5a9ThZUvnZWPaRphOoFrpCoHwpDxaGhi2aaSKqqmSKh+96+PZ4wWgNIre88JjWm
PducPuBy+vR9+/QP3H71lJKopm/rsqmkcqQ0Mpi6+ApTGJpYcXsJorKOZ3Fg8DofhQyVdHF7palb
8ixk5cOnjYFViHl+q/oXKHA/i9d/nnhRvY//whCJlLXerVayOLxqCy2og4K0U7hJAb8rNaM/tHJj
ZcsfYPUnZqbMcyRgGoNcggE4tSFUTkfo4t/UcWK8DpehvoSLMk4juPmlUyOwkVBt6Y5wnSNTEHf2
oWoI67RoRWZSfWUHcNcB3mqAhlcmhStsBm1cN6351dg64gDgibRoksC6j6YPtObeIPEdlpyElfeM
fO4S+GlsNvbKYJYm6wz0POXx1JXwA+06Z4v06AlYu0wIVkiYp9qI9CiQDTrzNBMqXn1NOL7bonWp
KXpwqCOQgCRClIxQqmQQN+gaQcogiuFgin79iGB9LQhIu/ZkWpRo7mlT0AKPJInZFWm4KrBM90zv
YfUC9g3RnKqAM9Nf2jT46pRmTpzabLrmV023iEiY5KnpMdpDsTx9n02DhfGDOyRg1NCS6bYe3Fht
hdn4DFsyVmH4Q2AHKwxyWuoZdheMm4rrDiECxA2BDRaB8DDVDvIMG4wOPujshVpqvcoSGolf8OzF
SISm3zaDoamMPO0dCWIx7yh0fcFlvZ4GUVmeKUSbGu1GbBlZ1vAIRJnLZ5KnukVw9WqeiEnVqljq
XDbJjQWFv0lWp4YxMY1iu4VT53CN1llRUjatZUUXJI9tzfS03uUSBRmtPWkRG9YcYZya1h3oiJPo
HLBCxzY9GArX34dRkdcWTJy0cB6BdDy66FDAT40pgHUq3ufk73z6lc31A7zGA13nft2h7ZzF5qOE
Emw49O2425/+GcAVZ/D8un3/5j4xBcKPp03yeQInbtJppq+9FMsGLfIm3WiKjM5uCR0FiG3THMW1
qCwzuIzrvfG2sLtP7l62v592r1IkeeekTwJ+dPszg/0fccvTP4cXo4k+ngXGrsfGGN4JLBShjisj
JsQC4CA7AP+AWU0oS3aR3b0SBtRobZayWudJNoa3CQ39TcNdXgrs8SBqZ00WSGPieJ614xHlxct3
/z2DPS16WuScxenGrDpcW+RaTfcRu8MHQ8lYennwV4fbCEotl164/evj2zd8U4r376fjx+t2f9Id
qdhcBBov9cidPbB7zxKXvj8vfgwpKrgaxroE5+JQVdxg/gJNQJedr4ihrzjrum+ZJylrR4aPGZwy
RS8o74roCpSPe5rZXWU/QlshtM8OpFkLmktGiT27aPOoLsnyIbArTNdncKMNuItEGRr4n+k2EnLO
TttfYTH5vS9+B0fDOqxy2wrcqEOYJhNTIxHnhWKTFB9GP6tIJmiwx05h0XLL35YyaDhv+LQSYXTo
esyZVFLBoThmt+KrpJkqUkM3yRHcQNz30i7XBwgwCexyu+LP4BitjR914mI6vLq4uPBQdu/Ps5m3
NLS1b6tAP+kk3+RnZYMHh8Yy4SAPJSrKws5jzJqLFfXmITcAjzXH38ndNoHwgoKns2sW8XxhyXtc
LARGe8cqve1BwAUvDiUUJwKLCwjP7iznvkswjC0LQynzd13hZZDcwNm4dv+rhRXWRry3IP0gP7y9
fxkkh6d/Pt4E715s9t90827G8zrASWR4yRhg9KRsNLWRQOK2yZv6zwttNeazGi0CGrwp17CiSYtv
gWoXGAOiZpWx9sQS6lBdJcNedprmec3Feo2Mt0iT/30kdk/ul3B2wmEc5nP93Ds/dsJIB47D5w88
A3WOaixcy/VCAE3HRg7r/TuUyQVRtrlEcVjuoqgQShKhksGXzv6o+Nf7226Pr5/QhdeP0/bHFv6z
PT395z//+bcW0hvdo3iRcy5edlkmdBP+1TlvKF4C9sDeRXg5aupoHTmcVaWZck4rmvz+XmCA1+X3
BasXTk33lWHPL6C8YdYtBGEgpLssRCK8fETcNKAFUVRQFeHgcUW4PJoqs84WNgK6b1kX4L5njlKj
Cmb2R73A//+YabujwClmCSNNwTifrUsrLiyXUmEY2ybDNyZYwUIV4x2qO3GWOexWehyVERwEVae6
FzvtHyHoPG9OmwFKOE+ocjRC5PKBjk0/cSmSINgvj8/dL7h/W0znZBInbBuymqEWsWyUl5/FGzwt
tqsKShiyrAYp1PX/AtGB4h30UkE5A2N2UXD/F+jB6v3KnmkERkvS+F6l5zBabO3SpbxLlP0twiAQ
rpggZKKOg5ow1L1lwUOdGxqVlXYP4k0uLSx6HeH65Eh+y9E2HweK/Hwm0MPtZvwD2siQYdgvdxp/
nLb79w0tV0tmnUyl2zJZcBLCisR9wejcRdV4FAzjc/oR4WMp5CTgYsAhr7RkC04Ddf1AvX0/IRPB
0y3A2NSbb1vN3rQxBCcRJUBGubHB5goTsGjNB43E8TkzWaXamKgXyEvKHblIaSJd5VbD+vqMyvV3
7pcAi5MqYbTbPSLFPcZ/C7LKJk1X9eJSdhcpM167IZh8SYpA5OdmTdStVlSRBqqGX2pyfxSgz0pN
5/UT0i0s7CBfyY1WGGrrEq46+O6Cs4z7DV/BiYJA1LZPuHOL0zqa4Ipb8aAFedCgOxNtVihOsWks
lgPtJmlpzP4PqoWtyv74AQA=
--===============0727017412687278090==--

