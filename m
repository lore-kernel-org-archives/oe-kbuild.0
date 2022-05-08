Content-Type: multipart/mixed; boundary="===============9141244183182345665=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8238/9759] mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hwmon/nct6775-core.o' being placed in section `.ctors.65436'
Date: Sun, 08 May 2022 17:27:40 +0800
Message-ID: <202205081742.ecXC8R0h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9141244183182345665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Zev Weiss <zev@bewilderbeest.net>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: f030aa2a3fd944a6ae66da1cfbd0cbf843671482 [8238/9759] hwmon: (nct677=
5) Split core and platform driver
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: mips-randconfig-p002-20220505 (https://download.01.org/0day-ci/arch=
ive/20220508/202205081742.ecXC8R0h-lkp(a)intel.com/config)
compiler: mips64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Df030aa2a3fd944a6ae66da1cfbd0cbf843671482
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f030aa2a3fd944a6ae66da1cfbd0cbf843671482
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/pda_power.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/ip5xxx_power.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/test_power.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/adp5061.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/ds2760_battery.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/ds2782_battery.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/ltc2941-battery-gauge.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/goldfish_battery.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/sbs-manager.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/da9150-charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/da9150-fg.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/max17040_battery.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/max17042_battery.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/rt5033_battery.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/isp1704_charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/ltc4162-l-charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/max77650-charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/bq2415x_charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/bq24257_charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/bq25890_charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/bq25980_charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/bq256xx_charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/bd99954-charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/hwmon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/hwmon-vid.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83627hf.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83773g.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83792d.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83793.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83795.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ad7414.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ad7418.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adc128d818.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adm1021.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adm1029.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adm1031.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adm9240.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ads7828.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adt7x10.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adt7410.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adt7411.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adt7462.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adt7470.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adt7475.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/aht10.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/asc7621.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/aspeed-pwm-tacho.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/atxp1.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/axi-fan-control.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/corsair-cpro.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/corsair-psu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ds620.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ds1621.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/emc2103.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/emc6w201.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/f71805f.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/f75375s.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/g762.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/gl518sm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/gsc-hwmon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/gpio-fan.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/hih6130.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ibmpex.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/iio_hwmon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ina2xx.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ina238.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ina3221.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/it87.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/jc42.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm63.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm75.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm77.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm78.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm80.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm83.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm85.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm87.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm90.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm92.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm93.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm95245.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc2947-core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc2947-i2c.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc2990.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc2992.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc4151.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc4215.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc4245.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max127.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max16065.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max1619.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max1668.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max197.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max6620.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max6639.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max6642.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max6650.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max31790.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tc654.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/nct6683.o' being placed in section `.ctors.65436'
>> mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/nct6775-core.o' being placed in section `.ctors.65436'
>> mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/nct6775-platform.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/npcm750-pwm-fan.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ntc_thermistor.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/nzxt-kraken2.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pc87360.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pc87427.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pcf8591.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/powr1220.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/sbrmi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/sht3x.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/shtc1.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/smm665.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/smsc47b397.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/smsc47m1.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/smsc47m192.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/amc6821.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tc74.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp102.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp103.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp108.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp401.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp421.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp513.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/vt1211.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83627ehf.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83l785ts.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83l786ng.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/peci/cputemp.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/peci/dimmtemp.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal_core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal_sysfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal_helpers.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal_hwmon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal_of.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/gov_bang_bang.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/gov_user_space.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/devfreq_cooling.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/hisi_thermal.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/mtk_thermal.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal-generic-adc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/op=
p/core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/op=
p/cpu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/op=
p/of.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/op=
p/debugfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/bus.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/host.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/mmc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/mmc_ops.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sd.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sd_ops.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sdio.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sdio_ops.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sdio_bus.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sdio_cis.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sdio_io.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sdio_irq.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/slot-gpio.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/regulator.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/pwrseq.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/debugfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/pwrseq_simple.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/pwrseq_emmc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/mmc_test.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sdio_uart.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci_f_sdh30.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci_am654.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/jz4740_mmc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/vub300.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/usdhi6rol0.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-pltfm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-cadence.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-of-arasan.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-of-aspeed.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-of-at91.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-of-dwcmshc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/cqhci-core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/mmc_hsq.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-xenon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-xenon-phy.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/me=
mstick/core/memstick.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/led-core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/led-class.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/led-class-flash.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/led-class-multicolor.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/led-triggers.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-an30259a.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-aw2013.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-bcm6328.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-bcm6358.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-bd2802.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-blinkm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-is31fl319x.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lm3530.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lm36274.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lm3692x.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lm3697.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lp3944.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lp3952.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lp50xx.o' being placed in section `.ctors.65436'
--
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/pda_power.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/ip5xxx_power.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/test_power.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/adp5061.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/ds2760_battery.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/ds2782_battery.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/ltc2941-battery-gauge.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/goldfish_battery.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/sbs-manager.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/da9150-charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/da9150-fg.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/max17040_battery.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/max17042_battery.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/rt5033_battery.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/isp1704_charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/ltc4162-l-charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/max77650-charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/bq2415x_charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/bq24257_charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/bq25890_charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/bq25980_charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/bq256xx_charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/po=
wer/supply/bd99954-charger.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/hwmon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/hwmon-vid.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83627hf.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83773g.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83792d.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83793.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83795.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ad7414.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ad7418.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adc128d818.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adm1021.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adm1029.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adm1031.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adm9240.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ads7828.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adt7x10.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adt7410.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adt7411.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adt7462.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adt7470.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/adt7475.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/aht10.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/asc7621.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/aspeed-pwm-tacho.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/atxp1.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/axi-fan-control.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/corsair-cpro.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/corsair-psu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ds620.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ds1621.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/emc2103.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/emc6w201.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/f71805f.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/f75375s.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/g762.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/gl518sm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/gsc-hwmon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/gpio-fan.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/hih6130.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ibmpex.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/iio_hwmon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ina2xx.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ina238.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ina3221.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/it87.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/jc42.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm63.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm75.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm77.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm78.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm80.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm83.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm85.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm87.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm90.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm92.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm93.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm95245.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc2947-core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc2947-i2c.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc2990.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc2992.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc4151.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc4215.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc4245.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max127.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max16065.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max1619.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max1668.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max197.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max6620.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max6639.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max6642.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max6650.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max31790.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tc654.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/nct6683.o' being placed in section `.ctors.65436'
>> mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/nct6775-core.o' being placed in section `.ctors.65436'
>> mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/nct6775-platform.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/npcm750-pwm-fan.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ntc_thermistor.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/nzxt-kraken2.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pc87360.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pc87427.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pcf8591.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/powr1220.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/sbrmi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/sht3x.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/shtc1.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/smm665.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/smsc47b397.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/smsc47m1.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/smsc47m192.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/amc6821.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tc74.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp102.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp103.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp108.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp401.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp421.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp513.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/vt1211.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83627ehf.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83l785ts.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83l786ng.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/peci/cputemp.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/peci/dimmtemp.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal_core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal_sysfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal_helpers.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal_hwmon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal_of.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/gov_bang_bang.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/gov_user_space.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/devfreq_cooling.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/hisi_thermal.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/mtk_thermal.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal-generic-adc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/op=
p/core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/op=
p/cpu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/op=
p/of.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/op=
p/debugfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/bus.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/host.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/mmc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/mmc_ops.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sd.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sd_ops.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sdio.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sdio_ops.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sdio_bus.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sdio_cis.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sdio_io.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sdio_irq.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/slot-gpio.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/regulator.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/pwrseq.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/debugfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/pwrseq_simple.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/pwrseq_emmc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/mmc_test.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/core/sdio_uart.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci_f_sdh30.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci_am654.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/jz4740_mmc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/vub300.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/usdhi6rol0.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-pltfm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-cadence.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-of-arasan.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-of-aspeed.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-of-at91.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-of-dwcmshc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/cqhci-core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/mmc_hsq.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-xenon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/mm=
c/host/sdhci-xenon-phy.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/me=
mstick/core/memstick.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/led-core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/led-class.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/led-class-flash.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/led-class-multicolor.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/led-triggers.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-an30259a.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-aw2013.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-bcm6328.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-bcm6358.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-bd2802.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-blinkm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-is31fl319x.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lm3530.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lm36274.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lm3692x.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lm3697.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lp3944.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lp3952.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lp50xx.o' being placed in section `.ctors.65436'
..

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9141244183182345665==--

