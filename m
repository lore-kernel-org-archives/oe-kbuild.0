Content-Type: multipart/mixed; boundary="===============3814353050210779712=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH] devres: better type safety with devm_*_action()
Date: Wed, 10 Mar 2021 18:46:49 +0800
Message-ID: <202103101831.xsTfGAL2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3814353050210779712==
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
config: x86_64-randconfig-s022-20210309 (attached as .config)
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
   drivers/platform/chrome/cros_ec_spi.c: note: in included file (through i=
nclude/linux/platform_data/cros_ec_proto.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/platform/chrome/cros_ec_spi.c:727:15: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/platform/chrome/cros_ec_spi.c:727:15: sparse: sparse: arithmetic=
s on pointers to functions
>> drivers/platform/chrome/cros_ec_spi.c:727:15: sparse: sparse: static ass=
ertion failed: "__same_type(cros_ec_spi_high_pri_release + 0, void (*)(void=
 *)) || __same_type(cros_ec_spi_high_pri_release + 0, void (*)(typeof(ec_sp=
i->high_pri_worker)))"
--
   drivers/staging/iio/adc/ad7280a.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/staging/iio/adc/ad7280a.c:959:15: sparse: sparse: arithmetics on=
 pointers to functions
>> drivers/staging/iio/adc/ad7280a.c:959:15: sparse: sparse: arithmetics on=
 pointers to functions
>> drivers/staging/iio/adc/ad7280a.c:959:15: sparse: sparse: static asserti=
on failed: "__same_type(ad7280_sw_power_down + 0, void (*)(void *)) || __sa=
me_type(ad7280_sw_power_down + 0, void (*)(typeof(st)))"
--
   drivers/staging/wfx/main.c: note: in included file (through include/linu=
x/dma-mapping.h, include/linux/skbuff.h, include/linux/if_ether.h, ...):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/staging/wfx/main.c:320:13: sparse: sparse: arithmetics on pointe=
rs to functions
>> drivers/staging/wfx/main.c:320:13: sparse: sparse: arithmetics on pointe=
rs to functions
>> drivers/staging/wfx/main.c:320:13: sparse: sparse: static assertion fail=
ed: "__same_type(wfx_free_common + 0, void (*)(void *)) || __same_type(wfx_=
free_common + 0, void (*)(typeof(wdev)))"
--
   drivers/dax/device.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/dax/device.c:446:14: sparse: sparse: arithmetics on pointers to =
functions
>> drivers/dax/device.c:446:14: sparse: sparse: arithmetics on pointers to =
functions
>> drivers/dax/device.c:446:14: sparse: sparse: static assertion failed: "_=
_same_type(dev_dax_cdev_del + 0, void (*)(void *)) || __same_type(dev_dax_c=
dev_del + 0, void (*)(typeof(cdev)))"
   drivers/dax/device.c:451:16: sparse: sparse: arithmetics on pointers to =
functions
   drivers/dax/device.c:451:16: sparse: sparse: arithmetics on pointers to =
functions
>> drivers/dax/device.c:451:16: sparse: sparse: static assertion failed: "_=
_same_type(dev_dax_kill + 0, void (*)(void *)) || __same_type(dev_dax_kill =
+ 0, void (*)(typeof(dev_dax)))"
--
   drivers/iio/adc/ad7292.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/adc/ad7292.c:288:23: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/iio/adc/ad7292.c:288:23: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/iio/adc/ad7292.c:288:23: sparse: sparse: static assertion failed=
: "__same_type(ad7292_regulator_disable + 0, void (*)(void *)) || __same_ty=
pe(ad7292_regulator_disable + 0, void (*)(typeof(st)))"
--
   drivers/iio/adc/ad7298.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/adc/ad7298.c:317:23: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/iio/adc/ad7298.c:317:23: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/iio/adc/ad7298.c:317:23: sparse: sparse: static assertion failed=
: "__same_type(ad7298_reg_disable + 0, void (*)(void *)) || __same_type(ad7=
298_reg_disable + 0, void (*)(typeof(st->reg)))"
--
   drivers/iio/adc/ad7476.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/adc/ad7476.c:293:15: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/iio/adc/ad7476.c:293:15: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/iio/adc/ad7476.c:293:15: sparse: sparse: static assertion failed=
: "__same_type(ad7476_reg_disable + 0, void (*)(void *)) || __same_type(ad7=
476_reg_disable + 0, void (*)(typeof(st)))"
--
   drivers/iio/adc/ad7768-1.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/adc/ad7768-1.c:595:15: sparse: sparse: arithmetics on pointe=
rs to functions
>> drivers/iio/adc/ad7768-1.c:595:15: sparse: sparse: arithmetics on pointe=
rs to functions
>> drivers/iio/adc/ad7768-1.c:595:15: sparse: sparse: static assertion fail=
ed: "__same_type(ad7768_regulator_disable + 0, void (*)(void *)) || __same_=
type(ad7768_regulator_disable + 0, void (*)(typeof(st)))"
   drivers/iio/adc/ad7768-1.c:607:15: sparse: sparse: arithmetics on pointe=
rs to functions
   drivers/iio/adc/ad7768-1.c:607:15: sparse: sparse: arithmetics on pointe=
rs to functions
>> drivers/iio/adc/ad7768-1.c:607:15: sparse: sparse: static assertion fail=
ed: "__same_type(ad7768_clk_disable + 0, void (*)(void *)) || __same_type(a=
d7768_clk_disable + 0, void (*)(typeof(st)))"
--
   drivers/iio/adc/ad7887.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/adc/ad7887.c:269:23: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/iio/adc/ad7887.c:269:23: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/iio/adc/ad7887.c:269:23: sparse: sparse: static assertion failed=
: "__same_type(ad7887_reg_disable + 0, void (*)(void *)) || __same_type(ad7=
887_reg_disable + 0, void (*)(typeof(st->reg)))"
--
   drivers/iio/adc/adi-axi-adc.c: note: in included file (through include/l=
inux/node.h, include/linux/cpu.h, include/linux/of_device.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/adc/adi-axi-adc.c:402:15: sparse: sparse: arithmetics on poi=
nters to functions
>> drivers/iio/adc/adi-axi-adc.c:402:15: sparse: sparse: arithmetics on poi=
nters to functions
>> drivers/iio/adc/adi-axi-adc.c:402:15: sparse: sparse: static assertion f=
ailed: "__same_type(adi_axi_adc_cleanup + 0, void (*)(void *)) || __same_ty=
pe(adi_axi_adc_cleanup + 0, void (*)(typeof(cl)))"
--
   drivers/iio/adc/ad9467.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/adc/ad9467.c:415:15: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/iio/adc/ad9467.c:415:15: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/iio/adc/ad9467.c:415:15: sparse: sparse: static assertion failed=
: "__same_type(ad9467_clk_disable + 0, void (*)(void *)) || __same_type(ad9=
467_clk_disable + 0, void (*)(typeof(st)))"
--
   drivers/iio/adc/max1241.c: note: in included file (through include/linux=
/iio/iio.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/adc/max1241.c:162:15: sparse: sparse: arithmetics on pointer=
s to functions
>> drivers/iio/adc/max1241.c:162:15: sparse: sparse: arithmetics on pointer=
s to functions
>> drivers/iio/adc/max1241.c:162:15: sparse: sparse: static assertion faile=
d: "__same_type(max1241_disable_vdd_action + 0, void (*)(void *)) || __same=
_type(max1241_disable_vdd_action + 0, void (*)(typeof(adc)))"
   drivers/iio/adc/max1241.c:178:15: sparse: sparse: arithmetics on pointer=
s to functions
   drivers/iio/adc/max1241.c:178:15: sparse: sparse: arithmetics on pointer=
s to functions
>> drivers/iio/adc/max1241.c:178:15: sparse: sparse: static assertion faile=
d: "__same_type(max1241_disable_vref_action + 0, void (*)(void *)) || __sam=
e_type(max1241_disable_vref_action + 0, void (*)(typeof(adc)))"
--
   drivers/mfd/arizona-spi.c: note: in included file (through include/linux=
/acpi.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/mfd/arizona-spi.c:90:15: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/mfd/arizona-spi.c:90:15: sparse: sparse: arithmetics on pointers=
 to functions
>> drivers/mfd/arizona-spi.c:90:15: sparse: sparse: static assertion failed=
: "__same_type(arizona_spi_acpi_remove_lookup + 0, void (*)(void *)) || __s=
ame_type(arizona_spi_acpi_remove_lookup + 0, void (*)(typeof(lookup)))"
--
   drivers/iio/frequency/adf4371.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/frequency/adf4371.c:590:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/iio/frequency/adf4371.c:590:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/iio/frequency/adf4371.c:590:15: sparse: sparse: static assertion=
 failed: "__same_type(adf4371_clk_disable + 0, void (*)(void *)) || __same_=
type(adf4371_clk_disable + 0, void (*)(typeof(st)))"
--
   drivers/iio/imu/adis16475.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/imu/adis16475.c:1100:23: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/iio/imu/adis16475.c:1100:23: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/iio/imu/adis16475.c:1100:23: sparse: sparse: static assertion fa=
iled: "__same_type(adis16475_disable_clk + 0, void (*)(void *)) || __same_t=
ype(adis16475_disable_clk + 0, void (*)(typeof(clk)))"
--
   drivers/iio/imu/adis16480.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/imu/adis16480.c:1258:15: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/iio/imu/adis16480.c:1258:15: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/iio/imu/adis16480.c:1258:15: sparse: sparse: static assertion fa=
iled: "__same_type(adis16480_stop + 0, void (*)(void *)) || __same_type(adi=
s16480_stop + 0, void (*)(typeof(indio_dev)))"
   drivers/iio/imu/adis16480.c:1275:23: sparse: sparse: arithmetics on poin=
ters to functions
   drivers/iio/imu/adis16480.c:1275:23: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/iio/imu/adis16480.c:1275:23: sparse: sparse: static assertion fa=
iled: "__same_type(adis16480_clk_disable + 0, void (*)(void *)) || __same_t=
ype(adis16480_clk_disable + 0, void (*)(typeof(st->ext_clk)))"
--
   drivers/iio/imu/adis_buffer.c: note: in included file (through include/l=
inux/spi/spi.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/imu/adis_buffer.c:205:16: sparse: sparse: arithmetics on poi=
nters to functions
>> drivers/iio/imu/adis_buffer.c:205:16: sparse: sparse: arithmetics on poi=
nters to functions
>> drivers/iio/imu/adis_buffer.c:205:16: sparse: sparse: static assertion f=
ailed: "__same_type(adis_buffer_cleanup + 0, void (*)(void *)) || __same_ty=
pe(adis_buffer_cleanup + 0, void (*)(typeof(adis)))"
--
   drivers/iio/position/iqs624-pos.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/position/iqs624-pos.c:265:15: sparse: sparse: arithmetics on=
 pointers to functions
>> drivers/iio/position/iqs624-pos.c:265:15: sparse: sparse: arithmetics on=
 pointers to functions
>> drivers/iio/position/iqs624-pos.c:265:15: sparse: sparse: static asserti=
on failed: "__same_type(iqs624_pos_notifier_unregister + 0, void (*)(void *=
)) || __same_type(iqs624_pos_notifier_unregister + 0, void (*)(typeof(iqs62=
4_pos)))"
--
   drivers/iio/proximity/as3935.c: note: in included file (through include/=
linux/spi/spi.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/proximity/as3935.c:436:15: sparse: sparse: arithmetics on po=
inters to functions
>> drivers/iio/proximity/as3935.c:436:15: sparse: sparse: arithmetics on po=
inters to functions
>> drivers/iio/proximity/as3935.c:436:15: sparse: sparse: static assertion =
failed: "__same_type(as3935_stop_work + 0, void (*)(void *)) || __same_type=
(as3935_stop_work + 0, void (*)(typeof(indio_dev)))"
--
   drivers/iio/proximity/sx9310.c: note: in included file (through include/=
linux/acpi.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/iio/proximity/sx9310.c:1416:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/iio/proximity/sx9310.c:1416:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/iio/proximity/sx9310.c:1416:15: sparse: sparse: static assertion=
 failed: "__same_type(sx9310_regulator_disable + 0, void (*)(void *)) || __=
same_type(sx9310_regulator_disable + 0, void (*)(typeof(data)))"
--
   drivers/usb/dwc2/platform.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/usb/dwc2/platform.c:141:15: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/usb/dwc2/platform.c:141:15: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/usb/dwc2/platform.c:141:15: sparse: sparse: static assertion fai=
led: "__same_type(__dwc2_disable_regulators + 0, void (*)(void *)) || __sam=
e_type(__dwc2_disable_regulators + 0, void (*)(typeof(hsotg)))"
--
   drivers/usb/host/xhci-ext-caps.c: note: in included file (through includ=
e/linux/platform_device.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/usb/host/xhci-ext-caps.c:75:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/usb/host/xhci-ext-caps.c:75:15: sparse: sparse: arithmetics on p=
ointers to functions
>> drivers/usb/host/xhci-ext-caps.c:75:15: sparse: sparse: static assertion=
 failed: "__same_type(xhci_intel_unregister_pdev + 0, void (*)(void *)) || =
__same_type(xhci_intel_unregister_pdev + 0, void (*)(typeof(pdev)))"
--
   drivers/input/rmi4/rmi_spi.c: note: in included file (through include/li=
nux/rmi.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/rmi4/rmi_spi.c:441:17: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/input/rmi4/rmi_spi.c:441:17: sparse: sparse: arithmetics on poin=
ters to functions
>> drivers/input/rmi4/rmi_spi.c:441:17: sparse: sparse: static assertion fa=
iled: "__same_type(rmi_spi_unregister_transport + 0, void (*)(void *)) || _=
_same_type(rmi_spi_unregister_transport + 0, void (*)(typeof(rmi_spi)))"
--
   drivers/usb/misc/usb251xb.c: note: in included file (through include/lin=
ux/gpio/driver.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/usb/misc/usb251xb.c:688:15: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/usb/misc/usb251xb.c:688:15: sparse: sparse: arithmetics on point=
ers to functions
>> drivers/usb/misc/usb251xb.c:688:15: sparse: sparse: static assertion fai=
led: "__same_type(usb251xb_regulator_disable_action + 0, void (*)(void *)) =
|| __same_type(usb251xb_regulator_disable_action + 0, void (*)(typeof(hub))=
)"

vim +727 drivers/platform/chrome/cros_ec_spi.c

7dadf88f8d4ea2 Douglas Anderson 2019-05-15  712  =

7dadf88f8d4ea2 Douglas Anderson 2019-05-15  713  static int cros_ec_spi_dev=
m_high_pri_alloc(struct device *dev,
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  714  					   struct cros_ec_spi=
 *ec_spi)
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  715  {
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  716  	int err;
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  717  =

7dadf88f8d4ea2 Douglas Anderson 2019-05-15  718  	ec_spi->high_pri_worker =
=3D
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  719  		kthread_create_worker(0,=
 "cros_ec_spi_high_pri");
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  720  =

7dadf88f8d4ea2 Douglas Anderson 2019-05-15  721  	if (IS_ERR(ec_spi->high_p=
ri_worker)) {
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  722  		err =3D PTR_ERR(ec_spi->=
high_pri_worker);
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  723  		dev_err(dev, "Can't crea=
te cros_ec high pri worker: %d\n", err);
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  724  		return err;
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  725  	}
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  726  =

7dadf88f8d4ea2 Douglas Anderson 2019-05-15 @727  	err =3D devm_add_action_o=
r_reset(dev, cros_ec_spi_high_pri_release,
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  728  				       ec_spi->high_pr=
i_worker);
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  729  	if (err)
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  730  		return err;
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  731  =

8b700983de82f7 Peter Zijlstra   2020-04-22  732  	sched_set_fifo(ec_spi->hi=
gh_pri_worker->task);
8b700983de82f7 Peter Zijlstra   2020-04-22  733  =

8b700983de82f7 Peter Zijlstra   2020-04-22  734  	return 0;
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  735  }
7dadf88f8d4ea2 Douglas Anderson 2019-05-15  736  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3814353050210779712==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3814353050210779712==--

