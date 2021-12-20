Content-Type: multipart/mixed; boundary="===============5991511058627193607=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ARM: dts: Remove "spidev" nodes
Date: Mon, 20 Dec 2021 10:23:01 +0800
Message-ID: <202112200941.7Eyhtuu4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5991511058627193607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211217221232.3664417-1-robh@kernel.org>
References: <20211217221232.3664417-1-robh@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: soc(a)kernel.org
TO: Nicolas Ferre <nicolas.ferre@microchip.com>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Ludovic Desroches <ludovic.desroches@microchip.com>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: NXP Linux Team <linux-imx@nxp.com>
TO: "Beno=C3=AEt Cousson" <bcousson@baylibre.com>

Hi Rob,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on v5.16-rc5 next-20211217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Rob-Herring/ARM-dts-Remove=
-spidev-nodes/20211218-061453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/clo=
ck-controller(a)28000000: failed to match any schema with compatible: ['qco=
m,lcc-mdm9615']
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml: clock-contro=
ller(a)2011000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'brcm,cru-clkset', 'hisilicon,ds=
a-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'his=
ilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep'=
, 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockc=
hip,rk3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk=
3399-qos', 'rockchip,rk3568-qos', 'samsung,exynos3-sysreg', 'samsung,exynos=
4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg', 'samsung,=
exynosautov9-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/rng=
(a)1a500000: failed to match any schema with compatible: ['qcom,prng']
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/gsb=
i(a)16100000: failed to match any schema with compatible: ['qcom,gsbi-v1.0.=
0']
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/gsb=
i(a)16100000/i2c(a)16180000: failed to match any schema with compatible: ['=
qcom,i2c-qup-v1.1.1']
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/gsb=
i(a)16200000: failed to match any schema with compatible: ['qcom,gsbi-v1.0.=
0']
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/gsb=
i(a)16200000/spi(a)16280000: failed to match any schema with compatible: ['=
qcom,spi-qup-v1.1.1']
>> arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/gsb=
i(a)16200000/spi(a)16280000/spi(a)0: failed to match any schema with compat=
ible: ['swir,mangoh-iotport-spi']
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/gsb=
i(a)16300000: failed to match any schema with compatible: ['qcom,gsbi-v1.0.=
0']
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/gsb=
i(a)16300000/serial(a)16340000: failed to match any schema with compatible:=
 ['qcom,msm-uartdm-v1.3', 'qcom,msm-uartdm']
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/gsb=
i(a)16300000/serial(a)16340000: failed to match any schema with compatible:=
 ['qcom,msm-uartdm-v1.3', 'qcom,msm-uartdm']
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/gsb=
i(a)16400000: failed to match any schema with compatible: ['qcom,gsbi-v1.0.=
0']
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/gsb=
i(a)16400000/i2c(a)16480000: failed to match any schema with compatible: ['=
qcom,i2c-qup-v1.1.1']
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/gsb=
i(a)16400000/i2c(a)16480000/mux(a)71/i2c(a)4/gpio(a)3e: failed to match any=
 schema with compatible: ['semtech,sx1509q']
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/gsb=
i(a)16400000/i2c(a)16480000/mux(a)71/i2c(a)5/gpio(a)3f: failed to match any=
 schema with compatible: ['semtech,sx1509q']
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/gsb=
i(a)16400000/i2c(a)16480000/mux(a)71/i2c(a)6/gpio(a)70: failed to match any=
 schema with compatible: ['semtech,sx1509q']
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/gsb=
i(a)16400000/serial(a)16440000: failed to match any schema with compatible:=
 ['qcom,msm-uartdm-v1.3', 'qcom,msm-uartdm']
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml:0:0: /soc/gsb=
i(a)16400000/serial(a)16440000: failed to match any schema with compatible:=
 ['qcom,msm-uartdm-v1.3', 'qcom,msm-uartdm']

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5991511058627193607==--

