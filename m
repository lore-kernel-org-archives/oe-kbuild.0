Content-Type: multipart/mixed; boundary="===============1202275536589075393=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH] devres: better type safety with devm_*_action()
Date: Wed, 10 Mar 2021 11:53:29 +0800
Message-ID: <202103101154.LpZuG5ac-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1202275536589075393==
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
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: s390-randconfig-s031-20210309 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
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
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/uio/uio_pdrv_genirq.c: note: in included file (through include/l=
inux/platform_device.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/uio/uio_pdrv_genirq.c:243:15: sparse: sparse: arithmetics on poi=
nters to functions
>> drivers/uio/uio_pdrv_genirq.c:243:15: sparse: sparse: arithmetics on poi=
nters to functions
>> drivers/uio/uio_pdrv_genirq.c:243:15: sparse: sparse: static assertion f=
ailed: "__same_type(uio_pdrv_genirq_cleanup + 0, void (*)(void *)) || __sam=
e_type(uio_pdrv_genirq_cleanup + 0, void (*)(typeof(&pdev->dev)))"
--
   drivers/uio/uio_dmem_genirq.c: note: in included file (through include/l=
inux/platform_device.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/uio/uio_dmem_genirq.c:290:15: sparse: sparse: arithmetics on poi=
nters to functions
>> drivers/uio/uio_dmem_genirq.c:290:15: sparse: sparse: arithmetics on poi=
nters to functions
>> drivers/uio/uio_dmem_genirq.c:290:15: sparse: sparse: static assertion f=
ailed: "__same_type(uio_dmem_genirq_pm_disable + 0, void (*)(void *)) || __=
same_type(uio_dmem_genirq_pm_disable + 0, void (*)(typeof(&pdev->dev)))"
--
   drivers/input/keyboard/adp5589-keys.c: note: in included file (through i=
nclude/linux/pci.h, arch/s390/include/asm/hw_irq.h, include/linux/irq.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/keyboard/adp5589-keys.c:985:17: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/input/keyboard/adp5589-keys.c:985:17: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/input/keyboard/adp5589-keys.c:985:17: sparse: sparse: static ass=
ertion failed: "__same_type(adp5589_clear_config + 0, void (*)(void *)) || =
__same_type(adp5589_clear_config + 0, void (*)(typeof(client)))"
--
   drivers/input/keyboard/gpio_keys.c: note: in included file (through incl=
ude/linux/pci.h, arch/s390/include/asm/hw_irq.h, include/linux/irq.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/keyboard/gpio_keys.c:617:17: sparse: sparse: arithmetics o=
n pointers to functions
>> drivers/input/keyboard/gpio_keys.c:617:17: sparse: sparse: arithmetics o=
n pointers to functions
>> drivers/input/keyboard/gpio_keys.c:617:17: sparse: sparse: static assert=
ion failed: "__same_type(gpio_keys_quiesce_key + 0, void (*)(void *)) || __=
same_type(gpio_keys_quiesce_key + 0, void (*)(typeof(bdata)))"
--
   drivers/input/touchscreen/resistive-adc-touch.c: note: in included file =
(through include/linux/input.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/touchscreen/resistive-adc-touch.c:173:17: sparse: sparse: =
arithmetics on pointers to functions
>> drivers/input/touchscreen/resistive-adc-touch.c:173:17: sparse: sparse: =
arithmetics on pointers to functions
>> drivers/input/touchscreen/resistive-adc-touch.c:173:17: sparse: sparse: =
static assertion failed: "__same_type(grts_disable + 0, void (*)(void *)) |=
| __same_type(grts_disable + 0, void (*)(typeof(st->iio_cb)))"
--
   drivers/input/touchscreen/bu21013_ts.c: note: in included file (through =
include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/touchscreen/bu21013_ts.c:491:17: sparse: sparse: arithmeti=
cs on pointers to functions
>> drivers/input/touchscreen/bu21013_ts.c:491:17: sparse: sparse: arithmeti=
cs on pointers to functions
>> drivers/input/touchscreen/bu21013_ts.c:491:17: sparse: sparse: static as=
sertion failed: "__same_type(bu21013_power_off + 0, void (*)(void *)) || __=
same_type(bu21013_power_off + 0, void (*)(typeof(ts)))"
   drivers/input/touchscreen/bu21013_ts.c:507:17: sparse: sparse: arithmeti=
cs on pointers to functions
   drivers/input/touchscreen/bu21013_ts.c:507:17: sparse: sparse: arithmeti=
cs on pointers to functions
>> drivers/input/touchscreen/bu21013_ts.c:507:17: sparse: sparse: static as=
sertion failed: "__same_type(bu21013_disable_chip + 0, void (*)(void *)) ||=
 __same_type(bu21013_disable_chip + 0, void (*)(typeof(ts)))"
--
   drivers/input/touchscreen/cy8ctma140.c: note: in included file (through =
include/linux/input.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/touchscreen/cy8ctma140.c:273:17: sparse: sparse: arithmeti=
cs on pointers to functions
>> drivers/input/touchscreen/cy8ctma140.c:273:17: sparse: sparse: arithmeti=
cs on pointers to functions
>> drivers/input/touchscreen/cy8ctma140.c:273:17: sparse: sparse: static as=
sertion failed: "__same_type(cy8ctma140_power_off_action + 0, void (*)(void=
 *)) || __same_type(cy8ctma140_power_off_action + 0, void (*)(typeof(ts)))"
--
   drivers/input/touchscreen/elants_i2c.c: note: in included file (through =
include/linux/input.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/touchscreen/elants_i2c.c:1403:17: sparse: sparse: arithmet=
ics on pointers to functions
>> drivers/input/touchscreen/elants_i2c.c:1403:17: sparse: sparse: arithmet=
ics on pointers to functions
>> drivers/input/touchscreen/elants_i2c.c:1403:17: sparse: sparse: static a=
ssertion failed: "__same_type(elants_i2c_power_off + 0, void (*)(void *)) |=
| __same_type(elants_i2c_power_off + 0, void (*)(typeof(ts)))"
--
   drivers/input/touchscreen/goodix.c: note: in included file (through incl=
ude/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/touchscreen/goodix.c:1251:17: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/input/touchscreen/goodix.c:1251:17: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/input/touchscreen/goodix.c:1251:17: sparse: sparse: static asser=
tion failed: "__same_type(goodix_disable_regulators + 0, void (*)(void *)) =
|| __same_type(goodix_disable_regulators + 0, void (*)(typeof(ts)))"
--
   drivers/input/touchscreen/hideep.c: note: in included file (through incl=
ude/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/touchscreen/hideep.c:1045:17: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/input/touchscreen/hideep.c:1045:17: sparse: sparse: arithmetics =
on pointers to functions
>> drivers/input/touchscreen/hideep.c:1045:17: sparse: sparse: static asser=
tion failed: "__same_type(hideep_power_off + 0, void (*)(void *)) || __same=
_type(hideep_power_off + 0, void (*)(typeof(ts)))"
--
   drivers/input/touchscreen/raydium_i2c_ts.c: note: in included file (thro=
ugh include/linux/acpi.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/touchscreen/raydium_i2c_ts.c:1085:17: sparse: sparse: arit=
hmetics on pointers to functions
>> drivers/input/touchscreen/raydium_i2c_ts.c:1085:17: sparse: sparse: arit=
hmetics on pointers to functions
>> drivers/input/touchscreen/raydium_i2c_ts.c:1085:17: sparse: sparse: stat=
ic assertion failed: "__same_type(raydium_i2c_power_off + 0, void (*)(void =
*)) || __same_type(raydium_i2c_power_off + 0, void (*)(typeof(ts)))"
--
   drivers/input/touchscreen/silead.c: note: in included file (through incl=
ude/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/touchscreen/silead.c:509:17: sparse: sparse: arithmetics o=
n pointers to functions
>> drivers/input/touchscreen/silead.c:509:17: sparse: sparse: arithmetics o=
n pointers to functions
>> drivers/input/touchscreen/silead.c:509:17: sparse: sparse: static assert=
ion failed: "__same_type(silead_disable_regulator + 0, void (*)(void *)) ||=
 __same_type(silead_disable_regulator + 0, void (*)(typeof(data)))"
--
   drivers/input/touchscreen/st1232.c: note: in included file (through incl=
ude/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/touchscreen/st1232.c:280:17: sparse: sparse: arithmetics o=
n pointers to functions
>> drivers/input/touchscreen/st1232.c:280:17: sparse: sparse: arithmetics o=
n pointers to functions
>> drivers/input/touchscreen/st1232.c:280:17: sparse: sparse: static assert=
ion failed: "__same_type(st1232_ts_power_off + 0, void (*)(void *)) || __sa=
me_type(st1232_ts_power_off + 0, void (*)(typeof(ts)))"
--
   drivers/input/touchscreen/tsc2007_core.c: note: in included file (throug=
h include/linux/input.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/touchscreen/tsc2007_core.c:375:31: sparse: sparse: arithme=
tics on pointers to functions
>> drivers/input/touchscreen/tsc2007_core.c:375:31: sparse: sparse: arithme=
tics on pointers to functions
>> drivers/input/touchscreen/tsc2007_core.c:375:31: sparse: sparse: static =
assertion failed: "__same_type(tsc2007_call_exit_platform_hw + 0, void (*)(=
void *)) || __same_type(tsc2007_call_exit_platform_hw + 0, void (*)(typeof(=
&client->dev)))"
--
   drivers/input/touchscreen/zforce_ts.c: note: in included file (through i=
nclude/linux/input.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/touchscreen/zforce_ts.c:815:15: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/input/touchscreen/zforce_ts.c:815:15: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/input/touchscreen/zforce_ts.c:815:15: sparse: sparse: static ass=
ertion failed: "__same_type(zforce_reset + 0, void (*)(void *)) || __same_t=
ype(zforce_reset + 0, void (*)(typeof(ts)))"
--
   drivers/power/supply/bq256xx_charger.c: note: in included file (through =
include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/power/supply/bq256xx_charger.c:1654:15: sparse: sparse: arithmet=
ics on pointers to functions
>> drivers/power/supply/bq256xx_charger.c:1654:15: sparse: sparse: arithmet=
ics on pointers to functions
>> drivers/power/supply/bq256xx_charger.c:1654:15: sparse: sparse: static a=
ssertion failed: "__same_type(bq256xx_charger_reset + 0, void (*)(void *)) =
|| __same_type(bq256xx_charger_reset + 0, void (*)(typeof(bq)))"
--
   drivers/iio/adc/ad7091r-base.c: note: in included file (through include/=
linux/iio/iio.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/adc/ad7091r-base.c:251:23: sparse: sparse: arithmetics on po=
inters to functions
>> drivers/iio/adc/ad7091r-base.c:251:23: sparse: sparse: arithmetics on po=
inters to functions
>> drivers/iio/adc/ad7091r-base.c:251:23: sparse: sparse: static assertion =
failed: "__same_type(ad7091r_remove + 0, void (*)(void *)) || __same_type(a=
d7091r_remove + 0, void (*)(typeof(st)))"
--
   drivers/iio/amplifiers/hmc425a.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/amplifiers/hmc425a.c:221:15: sparse: sparse: arithmetics on =
pointers to functions
>> drivers/iio/amplifiers/hmc425a.c:221:15: sparse: sparse: arithmetics on =
pointers to functions
>> drivers/iio/amplifiers/hmc425a.c:221:15: sparse: sparse: static assertio=
n failed: "__same_type(hmc425a_reg_disable + 0, void (*)(void *)) || __same=
_type(hmc425a_reg_disable + 0, void (*)(typeof(st)))"
--
   drivers/iio/chemical/sps30.c: note: in included file (through include/li=
nux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/chemical/sps30.c:514:15: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/iio/chemical/sps30.c:514:15: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/iio/chemical/sps30.c:514:15: sparse: sparse: static assertion fa=
iled: "__same_type(sps30_stop_meas + 0, void (*)(void *)) || __same_type(sp=
s30_stop_meas + 0, void (*)(typeof(state)))"
--
   drivers/iio/chemical/pms7003.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/chemical/pms7003.c:317:15: sparse: sparse: arithmetics on po=
inters to functions
>> drivers/iio/chemical/pms7003.c:317:15: sparse: sparse: arithmetics on po=
inters to functions
>> drivers/iio/chemical/pms7003.c:317:15: sparse: sparse: static assertion =
failed: "__same_type(pms7003_stop + 0, void (*)(void *)) || __same_type(pms=
7003_stop + 0, void (*)(typeof(state)))"
--
   drivers/iio/chemical/scd30_core.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/chemical/scd30_core.c:715:15: sparse: sparse: arithmetics on=
 pointers to functions
>> drivers/iio/chemical/scd30_core.c:715:15: sparse: sparse: arithmetics on=
 pointers to functions
>> drivers/iio/chemical/scd30_core.c:715:15: sparse: sparse: static asserti=
on failed: "__same_type(scd30_disable_regulator + 0, void (*)(void *)) || _=
_same_type(scd30_disable_regulator + 0, void (*)(typeof(state)))"
   drivers/iio/chemical/scd30_core.c:756:15: sparse: sparse: arithmetics on=
 pointers to functions
   drivers/iio/chemical/scd30_core.c:756:15: sparse: sparse: arithmetics on=
 pointers to functions
>> drivers/iio/chemical/scd30_core.c:756:15: sparse: sparse: static asserti=
on failed: "__same_type(scd30_stop_meas + 0, void (*)(void *)) || __same_ty=
pe(scd30_stop_meas + 0, void (*)(typeof(state)))"
--
   drivers/iio/gyro/fxas21002c_core.c: note: in included file (through incl=
ude/linux/pci.h, arch/s390/include/asm/hw_irq.h, include/linux/irq.h, ...):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/gyro/fxas21002c_core.c:965:15: sparse: sparse: arithmetics o=
n pointers to functions
>> drivers/iio/gyro/fxas21002c_core.c:965:15: sparse: sparse: arithmetics o=
n pointers to functions
>> drivers/iio/gyro/fxas21002c_core.c:965:15: sparse: sparse: static assert=
ion failed: "__same_type(fxas21002c_power_disable_action + 0, void (*)(void=
 *)) || __same_type(fxas21002c_power_disable_action + 0, void (*)(typeof(da=
ta)))"
--
   drivers/iio/humidity/hts221_core.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/humidity/hts221_core.c:603:15: sparse: sparse: arithmetics o=
n pointers to functions
>> drivers/iio/humidity/hts221_core.c:603:15: sparse: sparse: arithmetics o=
n pointers to functions
>> drivers/iio/humidity/hts221_core.c:603:15: sparse: sparse: static assert=
ion failed: "__same_type(hts221_chip_uninit + 0, void (*)(void *)) || __sam=
e_type(hts221_chip_uninit + 0, void (*)(typeof(hw)))"
--
   drivers/iio/imu/fxos8700_core.c: note: in included file (through include=
/linux/acpi.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/imu/fxos8700_core.c:632:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/iio/imu/fxos8700_core.c:632:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/iio/imu/fxos8700_core.c:632:15: sparse: sparse: static assertion=
 failed: "__same_type(fxos8700_chip_uninit + 0, void (*)(void *)) || __same=
_type(fxos8700_chip_uninit + 0, void (*)(typeof(data)))"
--
   drivers/iio/imu/inv_icm42600/inv_icm42600_core.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/imu/inv_icm42600/inv_icm42600_core.c:614:15: sparse: sparse:=
 arithmetics on pointers to functions
>> drivers/iio/imu/inv_icm42600/inv_icm42600_core.c:614:15: sparse: sparse:=
 arithmetics on pointers to functions
>> drivers/iio/imu/inv_icm42600/inv_icm42600_core.c:614:15: sparse: sparse:=
 static assertion failed: "__same_type(inv_icm42600_disable_vdd_reg + 0, vo=
id (*)(void *)) || __same_type(inv_icm42600_disable_vdd_reg + 0, void (*)(t=
ypeof(st)))"
   drivers/iio/imu/inv_icm42600/inv_icm42600_core.c:622:15: sparse: sparse:=
 arithmetics on pointers to functions
   drivers/iio/imu/inv_icm42600/inv_icm42600_core.c:622:15: sparse: sparse:=
 arithmetics on pointers to functions
>> drivers/iio/imu/inv_icm42600/inv_icm42600_core.c:622:15: sparse: sparse:=
 static assertion failed: "__same_type(inv_icm42600_disable_vddio_reg + 0, =
void (*)(void *)) || __same_type(inv_icm42600_disable_vddio_reg + 0, void (=
*)(typeof(st)))"
   drivers/iio/imu/inv_icm42600/inv_icm42600_core.c:661:16: sparse: sparse:=
 arithmetics on pointers to functions
   drivers/iio/imu/inv_icm42600/inv_icm42600_core.c:661:16: sparse: sparse:=
 arithmetics on pointers to functions
>> drivers/iio/imu/inv_icm42600/inv_icm42600_core.c:661:16: sparse: sparse:=
 static assertion failed: "__same_type(inv_icm42600_disable_pm + 0, void (*=
)(void *)) || __same_type(inv_icm42600_disable_pm + 0, void (*)(typeof(dev)=
))"
--
   drivers/iio/imu/inv_mpu6050/inv_mpu_core.c: note: in included file (thro=
ugh include/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/imu/inv_mpu6050/inv_mpu_core.c:1509:18: sparse: sparse: arit=
hmetics on pointers to functions
>> drivers/iio/imu/inv_mpu6050/inv_mpu_core.c:1509:18: sparse: sparse: arit=
hmetics on pointers to functions
>> drivers/iio/imu/inv_mpu6050/inv_mpu_core.c:1509:18: sparse: sparse: stat=
ic assertion failed: "__same_type(inv_mpu_core_disable_regulator_action + 0=
, void (*)(void *)) || __same_type(inv_mpu_core_disable_regulator_action + =
0, void (*)(typeof(st)))"
   drivers/iio/imu/inv_mpu6050/inv_mpu_core.c:1556:18: sparse: sparse: arit=
hmetics on pointers to functions
   drivers/iio/imu/inv_mpu6050/inv_mpu_core.c:1556:18: sparse: sparse: arit=
hmetics on pointers to functions
>> drivers/iio/imu/inv_mpu6050/inv_mpu_core.c:1556:18: sparse: sparse: stat=
ic assertion failed: "__same_type(inv_mpu_pm_disable + 0, void (*)(void *))=
 || __same_type(inv_mpu_pm_disable + 0, void (*)(typeof(dev)))"
--
   drivers/iio/light/isl29018.c: note: in included file (through include/li=
nux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/light/isl29018.c:759:15: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/iio/light/isl29018.c:759:15: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/iio/light/isl29018.c:759:15: sparse: sparse: static assertion fa=
iled: "__same_type(isl29018_disable_regulator_action + 0, void (*)(void *))=
 || __same_type(isl29018_disable_regulator_action + 0, void (*)(typeof(chip=
)))"
--
   drivers/iio/light/noa1305.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/light/noa1305.c:231:15: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/iio/light/noa1305.c:231:15: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/iio/light/noa1305.c:231:15: sparse: sparse: static assertion fai=
led: "__same_type(noa1305_reg_remove + 0, void (*)(void *)) || __same_type(=
noa1305_reg_remove + 0, void (*)(typeof(priv)))"
--
   drivers/iio/light/veml6030.c: note: in included file (through include/li=
nux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/light/veml6030.c:841:15: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/iio/light/veml6030.c:841:15: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/iio/light/veml6030.c:841:15: sparse: sparse: static assertion fa=
iled: "__same_type(veml6030_als_shut_down_action + 0, void (*)(void *)) || =
__same_type(veml6030_als_shut_down_action + 0, void (*)(typeof(data)))"
--
   drivers/iio/light/tsl2772.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/light/tsl2772.c:1789:15: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/iio/light/tsl2772.c:1789:15: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/iio/light/tsl2772.c:1789:15: sparse: sparse: static assertion fa=
iled: "__same_type(tsl2772_disable_regulators_action + 0, void (*)(void *))=
 || __same_type(tsl2772_disable_regulators_action + 0, void (*)(typeof(chip=
)))"
   drivers/iio/light/tsl2772.c:1858:15: sparse: sparse: arithmetics on poin=
ters to functions
   drivers/iio/light/tsl2772.c:1858:15: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/iio/light/tsl2772.c:1858:15: sparse: sparse: static assertion fa=
iled: "__same_type(tsl2772_chip_off_action + 0, void (*)(void *)) || __same=
_type(tsl2772_chip_off_action + 0, void (*)(typeof(indio_dev)))"
--
   drivers/iio/light/al3320a.c: note: in included file (through include/lin=
ux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/light/al3320a.c:217:15: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/iio/light/al3320a.c:217:15: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/iio/light/al3320a.c:217:15: sparse: sparse: static assertion fai=
led: "__same_type(al3320a_set_pwr_off + 0, void (*)(void *)) || __same_type=
(al3320a_set_pwr_off + 0, void (*)(typeof(data)))"
--
   drivers/iio/light/cm3323.c: note: in included file (through include/linu=
x/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/light/cm3323.c:246:15: sparse: sparse: arithmetics on pointe=
rs to functions
>> drivers/iio/light/cm3323.c:246:15: sparse: sparse: arithmetics on pointe=
rs to functions
>> drivers/iio/light/cm3323.c:246:15: sparse: sparse: static assertion fail=
ed: "__same_type(cm3323_disable + 0, void (*)(void *)) || __same_type(cm332=
3_disable + 0, void (*)(typeof(indio_dev)))"
--
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c: note: in included file (th=
rough include/linux/iio/iio.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2216:15: sparse: sparse: ar=
ithmetics on pointers to functions
>> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2216:15: sparse: sparse: ar=
ithmetics on pointers to functions
>> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2216:15: sparse: sparse: st=
atic assertion failed: "__same_type(st_lsm6dsx_chip_uninit + 0, void (*)(vo=
id *)) || __same_type(st_lsm6dsx_chip_uninit + 0, void (*)(typeof(hw)))"
--
   drivers/iio/pressure/dps310.c: note: in included file (through include/l=
inux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/pressure/dps310.c:746:14: sparse: sparse: arithmetics on poi=
nters to functions
>> drivers/iio/pressure/dps310.c:746:14: sparse: sparse: arithmetics on poi=
nters to functions
>> drivers/iio/pressure/dps310.c:746:14: sparse: sparse: static assertion f=
ailed: "__same_type(dps310_reset + 0, void (*)(void *)) || __same_type(dps3=
10_reset + 0, void (*)(typeof(data)))"

vim +243 drivers/uio/uio_pdrv_genirq.c

eff1dd87fae244 Alexandru Ardelean 2020-03-06  109  =

c767db0ab4bc85 Magnus Damm        2008-07-11  110  static int uio_pdrv_geni=
rq_probe(struct platform_device *pdev)
c767db0ab4bc85 Magnus Damm        2008-07-11  111  {
08cb2e2148f763 Jingoo Han         2013-08-30  112  	struct uio_info *uioinf=
o =3D dev_get_platdata(&pdev->dev);
b0297622a9726b Daniel Mack        2019-08-15  113  	struct device_node *nod=
e =3D pdev->dev.of_node;
c767db0ab4bc85 Magnus Damm        2008-07-11  114  	struct uio_pdrv_genirq_=
platdata *priv;
c767db0ab4bc85 Magnus Damm        2008-07-11  115  	struct uio_mem *uiomem;
c767db0ab4bc85 Magnus Damm        2008-07-11  116  	int ret =3D -EINVAL;
c767db0ab4bc85 Magnus Damm        2008-07-11  117  	int i;
c767db0ab4bc85 Magnus Damm        2008-07-11  118  =

b0297622a9726b Daniel Mack        2019-08-15  119  	if (node) {
b0297622a9726b Daniel Mack        2019-08-15  120  		const char *name;
b0297622a9726b Daniel Mack        2019-08-15  121  =

27760f86866331 Hans J. Koch       2011-07-07  122  		/* alloc uioinfo for o=
ne device */
e6789cd3dfb553 Michal Simek       2013-09-12  123  		uioinfo =3D devm_kzall=
oc(&pdev->dev, sizeof(*uioinfo),
e6789cd3dfb553 Michal Simek       2013-09-12  124  				       GFP_KERNEL);
27760f86866331 Hans J. Koch       2011-07-07  125  		if (!uioinfo) {
27760f86866331 Hans J. Koch       2011-07-07  126  			dev_err(&pdev->dev, "=
unable to kmalloc\n");
e6789cd3dfb553 Michal Simek       2013-09-12  127  			return -ENOMEM;
27760f86866331 Hans J. Koch       2011-07-07  128  		}
b0297622a9726b Daniel Mack        2019-08-15  129  =

b0297622a9726b Daniel Mack        2019-08-15  130  		if (!of_property_read_=
string(node, "linux,uio-name", &name))
b0297622a9726b Daniel Mack        2019-08-15  131  			uioinfo->name =3D dev=
m_kstrdup(&pdev->dev, name, GFP_KERNEL);
b0297622a9726b Daniel Mack        2019-08-15  132  		else
b0297622a9726b Daniel Mack        2019-08-15  133  			uioinfo->name =3D dev=
m_kasprintf(&pdev->dev, GFP_KERNEL,
b0297622a9726b Daniel Mack        2019-08-15  134  						       "%pOFn", no=
de);
b0297622a9726b Daniel Mack        2019-08-15  135  =

27760f86866331 Hans J. Koch       2011-07-07  136  		uioinfo->version =3D "=
devicetree";
27760f86866331 Hans J. Koch       2011-07-07  137  		/* Multiple IRQs are n=
ot supported */
27760f86866331 Hans J. Koch       2011-07-07  138  	}
27760f86866331 Hans J. Koch       2011-07-07  139  =

c767db0ab4bc85 Magnus Damm        2008-07-11  140  	if (!uioinfo || !uioinf=
o->name || !uioinfo->version) {
c767db0ab4bc85 Magnus Damm        2008-07-11  141  		dev_err(&pdev->dev, "m=
issing platform_data\n");
e6789cd3dfb553 Michal Simek       2013-09-12  142  		return ret;
c767db0ab4bc85 Magnus Damm        2008-07-11  143  	}
c767db0ab4bc85 Magnus Damm        2008-07-11  144  =

e543ae896626a5 Mike Frysinger     2008-10-29  145  	if (uioinfo->handler ||=
 uioinfo->irqcontrol ||
e543ae896626a5 Mike Frysinger     2008-10-29  146  	    uioinfo->irq_flags =
& IRQF_SHARED) {
c767db0ab4bc85 Magnus Damm        2008-07-11  147  		dev_err(&pdev->dev, "i=
nterrupt configuration error\n");
e6789cd3dfb553 Michal Simek       2013-09-12  148  		return ret;
c767db0ab4bc85 Magnus Damm        2008-07-11  149  	}
c767db0ab4bc85 Magnus Damm        2008-07-11  150  =

e6789cd3dfb553 Michal Simek       2013-09-12  151  	priv =3D devm_kzalloc(&=
pdev->dev, sizeof(*priv), GFP_KERNEL);
c767db0ab4bc85 Magnus Damm        2008-07-11  152  	if (!priv) {
c767db0ab4bc85 Magnus Damm        2008-07-11  153  		dev_err(&pdev->dev, "u=
nable to kmalloc\n");
e6789cd3dfb553 Michal Simek       2013-09-12  154  		return -ENOMEM;
c767db0ab4bc85 Magnus Damm        2008-07-11  155  	}
c767db0ab4bc85 Magnus Damm        2008-07-11  156  =

c767db0ab4bc85 Magnus Damm        2008-07-11  157  	priv->uioinfo =3D uioin=
fo;
c767db0ab4bc85 Magnus Damm        2008-07-11  158  	spin_lock_init(&priv->l=
ock);
c767db0ab4bc85 Magnus Damm        2008-07-11  159  	priv->flags =3D 0; /* i=
nterrupt is enabled to begin with */
af76756e6e8c26 Magnus Damm        2009-08-14  160  	priv->pdev =3D pdev;
c767db0ab4bc85 Magnus Damm        2008-07-11  161  =

94ca629e40eb7e Benedikt Spranger  2012-05-14  162  	if (!uioinfo->irq) {
324ac45f25e634 Esben Haabendal    2020-07-01  163  		ret =3D platform_get_i=
rq_optional(pdev, 0);
e3a3c3a205554e Pavel Machek       2013-06-18  164  		uioinfo->irq =3D ret;
bf12fdf0ab728c Esben Haabendal    2020-07-01  165  		if (ret =3D=3D -ENXIO)
e3a3c3a205554e Pavel Machek       2013-06-18  166  			uioinfo->irq =3D UIO_=
IRQ_NONE;
34bc4f468a9fab Oscar Ravadilla    2020-01-08  167  		else if (ret =3D=3D -E=
PROBE_DEFER)
34bc4f468a9fab Oscar Ravadilla    2020-01-08  168  			return ret;
e3a3c3a205554e Pavel Machek       2013-06-18  169  		else if (ret < 0) {
94ca629e40eb7e Benedikt Spranger  2012-05-14  170  			dev_err(&pdev->dev, "=
failed to get IRQ\n");
e6789cd3dfb553 Michal Simek       2013-09-12  171  			return ret;
94ca629e40eb7e Benedikt Spranger  2012-05-14  172  		}
94ca629e40eb7e Benedikt Spranger  2012-05-14  173  	}
e3a3c3a205554e Pavel Machek       2013-06-18  174  =

415abcdfd4b832 Thommy Jakobsson   2020-06-28  175  	if (uioinfo->irq) {
415abcdfd4b832 Thommy Jakobsson   2020-06-28  176  		struct irq_data *irq_d=
ata =3D irq_get_irq_data(uioinfo->irq);
415abcdfd4b832 Thommy Jakobsson   2020-06-28  177  =

415abcdfd4b832 Thommy Jakobsson   2020-06-28  178  		/*
415abcdfd4b832 Thommy Jakobsson   2020-06-28  179  		 * If a level interrup=
t, dont do lazy disable. Otherwise the
415abcdfd4b832 Thommy Jakobsson   2020-06-28  180  		 * irq will fire again=
 since clearing of the actual cause, on
415abcdfd4b832 Thommy Jakobsson   2020-06-28  181  		 * device level, is do=
ne in userspace
415abcdfd4b832 Thommy Jakobsson   2020-06-28  182  		 * irqd_is_level_type(=
) isn't used since isn't valid until
415abcdfd4b832 Thommy Jakobsson   2020-06-28  183  		 * irq is configured.
415abcdfd4b832 Thommy Jakobsson   2020-06-28  184  		 */
415abcdfd4b832 Thommy Jakobsson   2020-06-28  185  		if (irq_data &&
415abcdfd4b832 Thommy Jakobsson   2020-06-28  186  		    irqd_get_trigger_t=
ype(irq_data) & IRQ_TYPE_LEVEL_MASK) {
415abcdfd4b832 Thommy Jakobsson   2020-06-28  187  			dev_dbg(&pdev->dev, "=
disable lazy unmask\n");
415abcdfd4b832 Thommy Jakobsson   2020-06-28  188  			irq_set_status_flags(=
uioinfo->irq, IRQ_DISABLE_UNLAZY);
415abcdfd4b832 Thommy Jakobsson   2020-06-28  189  		}
415abcdfd4b832 Thommy Jakobsson   2020-06-28  190  	}
415abcdfd4b832 Thommy Jakobsson   2020-06-28  191  =

c767db0ab4bc85 Magnus Damm        2008-07-11  192  	uiomem =3D &uioinfo->me=
m[0];
c767db0ab4bc85 Magnus Damm        2008-07-11  193  =

c767db0ab4bc85 Magnus Damm        2008-07-11  194  	for (i =3D 0; i < pdev-=
>num_resources; ++i) {
c767db0ab4bc85 Magnus Damm        2008-07-11  195  		struct resource *r =3D=
 &pdev->resource[i];
c767db0ab4bc85 Magnus Damm        2008-07-11  196  =

c767db0ab4bc85 Magnus Damm        2008-07-11  197  		if (r->flags !=3D IORE=
SOURCE_MEM)
c767db0ab4bc85 Magnus Damm        2008-07-11  198  			continue;
c767db0ab4bc85 Magnus Damm        2008-07-11  199  =

c767db0ab4bc85 Magnus Damm        2008-07-11  200  		if (uiomem >=3D &uioin=
fo->mem[MAX_UIO_MAPS]) {
c767db0ab4bc85 Magnus Damm        2008-07-11  201  			dev_warn(&pdev->dev, =
"device has more than "
c767db0ab4bc85 Magnus Damm        2008-07-11  202  					__stringify(MAX_UIO=
_MAPS)
c767db0ab4bc85 Magnus Damm        2008-07-11  203  					" I/O memory resour=
ces.\n");
c767db0ab4bc85 Magnus Damm        2008-07-11  204  			break;
c767db0ab4bc85 Magnus Damm        2008-07-11  205  		}
c767db0ab4bc85 Magnus Damm        2008-07-11  206  =

c767db0ab4bc85 Magnus Damm        2008-07-11  207  		uiomem->memtype =3D UI=
O_MEM_PHYS;
7aca462b133300 Esben Haabendal    2020-07-01  208  		uiomem->addr =3D r->st=
art & PAGE_MASK;
7aca462b133300 Esben Haabendal    2020-07-01  209  		uiomem->offs =3D r->st=
art & ~PAGE_MASK;
7aca462b133300 Esben Haabendal    2020-07-01  210  		uiomem->size =3D (uiom=
em->offs + resource_size(r)
7aca462b133300 Esben Haabendal    2020-07-01  211  				+ PAGE_SIZE - 1) & P=
AGE_MASK;
ecd43c0d7e504f Manuel Traut       2012-11-09  212  		uiomem->name =3D r->na=
me;
c767db0ab4bc85 Magnus Damm        2008-07-11  213  		++uiomem;
c767db0ab4bc85 Magnus Damm        2008-07-11  214  	}
c767db0ab4bc85 Magnus Damm        2008-07-11  215  =

c767db0ab4bc85 Magnus Damm        2008-07-11  216  	while (uiomem < &uioinf=
o->mem[MAX_UIO_MAPS]) {
c767db0ab4bc85 Magnus Damm        2008-07-11  217  		uiomem->size =3D 0;
c767db0ab4bc85 Magnus Damm        2008-07-11  218  		++uiomem;
c767db0ab4bc85 Magnus Damm        2008-07-11  219  	}
c767db0ab4bc85 Magnus Damm        2008-07-11  220  =

c767db0ab4bc85 Magnus Damm        2008-07-11  221  	/* This driver requires=
 no hardware specific kernel code to handle
c767db0ab4bc85 Magnus Damm        2008-07-11  222  	 * interrupts. Instead,=
 the interrupt handler simply disables the
c767db0ab4bc85 Magnus Damm        2008-07-11  223  	 * interrupt in the int=
errupt controller. User space is responsible
c767db0ab4bc85 Magnus Damm        2008-07-11  224  	 * for performing hardw=
are specific acknowledge and re-enabling of
c767db0ab4bc85 Magnus Damm        2008-07-11  225  	 * the interrupt in the=
 interrupt controller.
c767db0ab4bc85 Magnus Damm        2008-07-11  226  	 *
c767db0ab4bc85 Magnus Damm        2008-07-11  227  	 * Interrupt sharing is=
 not supported.
c767db0ab4bc85 Magnus Damm        2008-07-11  228  	 */
c767db0ab4bc85 Magnus Damm        2008-07-11  229  =

c767db0ab4bc85 Magnus Damm        2008-07-11  230  	uioinfo->handler =3D ui=
o_pdrv_genirq_handler;
c767db0ab4bc85 Magnus Damm        2008-07-11  231  	uioinfo->irqcontrol =3D=
 uio_pdrv_genirq_irqcontrol;
af76756e6e8c26 Magnus Damm        2009-08-14  232  	uioinfo->open =3D uio_p=
drv_genirq_open;
af76756e6e8c26 Magnus Damm        2009-08-14  233  	uioinfo->release =3D ui=
o_pdrv_genirq_release;
c767db0ab4bc85 Magnus Damm        2008-07-11  234  	uioinfo->priv =3D priv;
c767db0ab4bc85 Magnus Damm        2008-07-11  235  =

af76756e6e8c26 Magnus Damm        2009-08-14  236  	/* Enable Runtime PM fo=
r this device:
af76756e6e8c26 Magnus Damm        2009-08-14  237  	 * The device starts in=
 suspended state to allow the hardware to be
af76756e6e8c26 Magnus Damm        2009-08-14  238  	 * turned off by defaul=
t. The Runtime PM bus code should power on the
af76756e6e8c26 Magnus Damm        2009-08-14  239  	 * hardware and enable =
clocks at open().
af76756e6e8c26 Magnus Damm        2009-08-14  240  	 */
af76756e6e8c26 Magnus Damm        2009-08-14  241  	pm_runtime_enable(&pdev=
->dev);
af76756e6e8c26 Magnus Damm        2009-08-14  242  =

eff1dd87fae244 Alexandru Ardelean 2020-03-06 @243  	ret =3D devm_add_action=
_or_reset(&pdev->dev, uio_pdrv_genirq_cleanup,
eff1dd87fae244 Alexandru Ardelean 2020-03-06  244  				       &pdev->dev);
eff1dd87fae244 Alexandru Ardelean 2020-03-06  245  	if (ret)
e6789cd3dfb553 Michal Simek       2013-09-12  246  		return ret;
c767db0ab4bc85 Magnus Damm        2008-07-11  247  =

eff1dd87fae244 Alexandru Ardelean 2020-03-06  248  	ret =3D devm_uio_regist=
er_device(&pdev->dev, priv->uioinfo);
eff1dd87fae244 Alexandru Ardelean 2020-03-06  249  	if (ret)
eff1dd87fae244 Alexandru Ardelean 2020-03-06  250  		dev_err(&pdev->dev, "u=
nable to register uio device\n");
47296b1962ead8 Jie Zhou           2011-04-06  251  =

eff1dd87fae244 Alexandru Ardelean 2020-03-06  252  	return ret;
c767db0ab4bc85 Magnus Damm        2008-07-11  253  }
c767db0ab4bc85 Magnus Damm        2008-07-11  254  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1202275536589075393==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1202275536589075393==--

