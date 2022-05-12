Content-Type: multipart/mixed; boundary="===============8256684524179535235=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 2/2] thermal: k3_j72xx_bandgap: Add the bandgap driver support
Date: Thu, 12 May 2022 12:23:07 +0800
Message-ID: <202205121226.e3bCU0fU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8256684524179535235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220511110657.16305-3-j-keerthy@ti.com>
References: <20220511110657.16305-3-j-keerthy@ti.com>
TO: Keerthy <j-keerthy@ti.com>
TO: robh+dt(a)kernel.org
TO: daniel.lezcano(a)linaro.org
TO: rui.zhang(a)intel.com
TO: amitk(a)kernel.org
TO: kristo(a)kernel.org
CC: j-keerthy(a)ti.com
CC: linux-pm(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Keerthy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on robh/for-next v5.18-rc6 next-20220511]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Keerthy/thermal-k3_j=
72xx_bandgap-Add-the-bandgap-driver-support/20220511-190900
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 thermal
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: mips-randconfig-s032-20220509 (https://download.01.org/0day-ci/arch=
ive/20220512/202205121226.e3bCU0fU-lkp(a)intel.com/config)
compiler: mips64-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/f7bc378e0be98b4bfb1=
f20802fa438f49e235858
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Keerthy/thermal-k3_j72xx_bandgap-A=
dd-the-bandgap-driver-support/20220511-190900
        git checkout f7bc378e0be98b4bfb1f20802fa438f49e235858
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
ips SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm85.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm87.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm90.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm92.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm95241.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/lm95245.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc2945.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc2947-core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc2947-spi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc2990.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc4215.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc4222.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc4245.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc4260.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/ltc4261.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max1111.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max16065.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max1619.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max1668.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max197.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max31722.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max31730.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max6620.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max6621.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max6639.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max6650.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/max31790.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/mc13783-adc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/mcp3021.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tc654.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/nct6775.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/nct7802.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/npcm750-pwm-fan.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pc87427.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/powr1220.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/raspberrypi-hwmon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/sbrmi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/sl28cpld-hwmon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/sht21.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/shtc1.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/sis5595.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/smm665.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/smsc47b397.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/smsc47m192.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/sparx5-temp.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/sy7636a-hwmon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/amc6821.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/thmc50.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp102.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp108.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp421.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp464.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/tmp513.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/via686a.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83627ehf.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83l785ts.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/w83l786ng.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/wm831x-hwmon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/wm8350-hwmon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/occ/common.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/occ/sysfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/occ/p8_i2c.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/pmbus_core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/pmbus.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/adm1266.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/adm1275.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/bel-pfe.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/bpa-rs600.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/delta-ahe50dc-fan.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/fsp-3y.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/inspur-ipsps.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/ir36021.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/ir38064.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/isl68137.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/ltc2978.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/ltc3815.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/max15301.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/max16064.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/max16601.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/max20730.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/max20751.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/max31785.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/max34440.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/max8688.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/mp5023.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/pli1209bc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/tps40422.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/tps53679.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/ucd9000.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/ucd9200.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/xdpe12284.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/zl6100.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/hw=
mon/pmbus/pim4328.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal_core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal_sysfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal_helpers.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal_hwmon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/gov_fair_share.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/gov_user_space.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/k3_bandgap.o' being placed in section `.ctors.65436'
>> mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/k3_j72xx_bandgap.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/broadcom/brcmstb_thermal.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/broadcom/ns-thermal.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal_mmio.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/tegra/soctherm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/tegra/soctherm-fuse.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/tegra/tegra-bpmp-thermal.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/tegra/tegra30-tsensor.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/mtk_thermal.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/th=
ermal/thermal-generic-adc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/op=
p/core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/op=
p/cpu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/op=
p/debugfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/me=
mstick/core/memstick.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/me=
mstick/host/tifm_ms.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/me=
mstick/host/jmb38x_ms.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/me=
mstick/host/r592.o' being placed in section `.ctors.65436'
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
ds/leds-acer-a500.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-bd2802.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-blinkm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-cobalt-raq.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-da9052.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lm3530.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lm3532.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lp3952.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-lp50xx.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-max77650.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-max8997.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-mc13783.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-mlxreg.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-mt6323.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-ns2.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-ot200.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-pca955x.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-pca963x.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-pm8058.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-regulator.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-s3c24xx.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-tca6507.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-wm831x-status.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-wm8350.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/leds-dac124s085.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/uleds.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/flash/leds-lm3601x.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/flash/leds-rt8515.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/flash/leds-sgm3140.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/trigger/ledtrig-oneshot.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/trigger/ledtrig-heartbeat.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/trigger/ledtrig-backlight.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/trigger/ledtrig-gpio.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/trigger/ledtrig-cpu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/trigger/ledtrig-default-on.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/trigger/ledtrig-transient.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/trigger/ledtrig-camera.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/trigger/ledtrig-pattern.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/le=
ds/trigger/ledtrig-audio.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/fi=
rmware/memmap.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/fi=
rmware/qcom_scm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/fi=
rmware/qcom_scm-smc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/fi=
rmware/qcom_scm-legacy.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/fi=
rmware/broadcom/bcm47xx_nvram.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/fi=
rmware/broadcom/tee_bnxt_fw.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/atmel-sha.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/atmel-i2c.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/atmel-ecc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/zip/zip_main.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/zip/zip_device.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/zip/zip_crypto.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/zip/zip_mem.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/zip/zip_deflate.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/zip/zip_inflate.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/cpt/cptpf_main.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/cpt/cptpf_mbox.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/cpt/cptvf_main.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/cpt/cptvf_reqmanager.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/cpt/cptvf_mbox.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/cpt/cptvf_algs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/nitrox/nitrox_main.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/nitrox/nitrox_isr.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/nitrox/nitrox_lib.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/nitrox/nitrox_hal.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/nitrox/nitrox_reqmgr.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/nitrox/nitrox_algs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/nitrox/nitrox_mbx.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/nitrox/nitrox_skcipher.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/nitrox/nitrox_aead.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/cavium/nitrox/nitrox_debugfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/exynos-rng.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/marvell/octeontx/otx_cptpf_main.o' being placed in section `.ctors.654=
36'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/marvell/octeontx/otx_cptpf_mbox.o' being placed in section `.ctors.654=
36'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/marvell/octeontx/otx_cptpf_ucode.o' being placed in section `.ctors.65=
436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/marvell/octeontx/otx_cptvf_main.o' being placed in section `.ctors.654=
36'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/marvell/octeontx/otx_cptvf_mbox.o' being placed in section `.ctors.654=
36'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/marvell/octeontx/otx_cptvf_reqmgr.o' being placed in section `.ctors.6=
5436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/marvell/octeontx/otx_cptvf_algs.o' being placed in section `.ctors.654=
36'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cr=
ypto/qce/core.o' being placed in section `.ctors.65436'

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8256684524179535235==--

