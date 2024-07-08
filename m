Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7982E851
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jul 2024 20:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720469791; cv=none; b=jGqWxUG8cybNdH13T5PJWg+Nt+xxQQ/0YsQ85RTxxFZnpBHnjGiUuvsczjag0rR/wof+g8w5pejzS1nOsqujRtO/qwNfLMHTYTpyK9EaJsbqGjhJEztHmjjSMOReQSlTRugq9cZCDqWrelyZEnLkc7rR+rpzq1TLMpwoD4itRu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720469791; c=relaxed/simple;
	bh=sh9pYhJXAXCRHuSoFm8eUdQxbJ3PIaslE+rOkY6NvBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dBzO7ytdZTVpm8VCiD7K3PsnDuGFAyPn/cbTdcmZAvMfZwvmE9aygwem7epF4XAbaVyceGBoiBo0RYtNkNeywsFatey7zAqeSc7XjAnYeemiQRm4z7Caq4W9TqgEmHcGUQ3exrgj5JqHq5jj15kmGZpP6DCww9trhWNm2a4uU6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4aNEnBM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4aNEnBM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720469789; x=1752005789;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sh9pYhJXAXCRHuSoFm8eUdQxbJ3PIaslE+rOkY6NvBQ=;
  b=T4aNEnBMHbSzLEXy6iTKvXJ5lb5CXhgNPabrBWug/eOPZPB00XOzcewE
   sKUf+uAWBUMa58kFVEdwgcmC6ppKARJGImGRKu97N1QKLi1U96pMkioaa
   M0H0XgQtxd085/zEo8ZFcrr6okbSH8mDFVkm/3m6O6a8jQyflCnCeu2WK
   jkjUaijikRSO0zusgScmxgr94pMsa3NX00eYyCRUk4S2JsXE5XZXX77Fs
   YrxPyBJoDy/BAqnM5bBPBfEHs2gEvhlhIvveOu2xOxYFpl7CzGehpLWVO
   /fRLZxA3it8l1v65hu7kGxEUqA4Ixr0ef8RFYMlHh5zy/huomQtcdXqbK
   A==;
X-CSE-ConnectionGUID: 5Dgx7DYKS6ywQrXId2dOAQ==
X-CSE-MsgGUID: DWUXAq0xSRiPMGyWLYqYxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17524880"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="17524880"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 13:16:28 -0700
X-CSE-ConnectionGUID: vMKJQQQDSTKGOKE1Q8Agiw==
X-CSE-MsgGUID: lyUuN3yMSNefqgWhV0TMHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="48276498"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Jul 2024 13:16:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQume-000W0Z-0W;
	Mon, 08 Jul 2024 20:16:24 +0000
Date: Tue, 9 Jul 2024 04:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-ci:spi-6.11 20/21]
 arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb:
 spi@2120000: Unevaluated properties are not allowed ('little-endian' was
 unexpected)
Message-ID: <202407090406.mnQqYKYX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Li <Frank.Li@nxp.com>
CC: Mark Brown <broonie@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Vladimir Oltean <olteanv@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git spi-=
6.11
head:   0f17a12787573dda66d2528fff27cd7362b34bfd
commit: 2de9ae2044c4f6490dbbfb8d93fe6b8cc60c91d1 [20/21] spi: dt-bindings: =
fsl-dspi: add dmas and dma-names properties
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm64-randconfig-051-20240708 (https://download.01.org/0day-ci/arch=
ive/20240709/202407090406.mnQqYKYX-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c=
6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240709/202407090406.mnQqYKYX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407090406.mnQqYKYX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: the=
rmal-zones: 'core-cluster', 'ddr-controller' do not match any of the regexe=
s: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: sys=
con@1e60000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: efu=
se@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unex=
pected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /so=
c/clock-controller@1300000: failed to match any schema with compatible: ['f=
sl,ls1028a-clockgen']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: spi=
@2120000: Unevaluated properties are not allowed ('little-endian' was unexp=
ected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /so=
c/mmc@2140000: failed to match any schema with compatible: ['fsl,ls1028a-es=
dhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /so=
c/mmc@2140000: failed to match any schema with compatible: ['fsl,ls1028a-es=
dhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /so=
c/mmc@2150000: failed to match any schema with compatible: ['fsl,ls1028a-es=
dhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /so=
c/mmc@2150000: failed to match any schema with compatible: ['fsl,ls1028a-es=
dhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /so=
c/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1028a-g=
pio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /so=
c/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1028a-g=
pio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /so=
c/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1028a-g=
pio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /so=
c/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1028a-g=
pio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /so=
c/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-g=
pio', 'fsl,qoriq-gpio']
--
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: thermal-zone=
s: 'core-cluster', 'ddr-controller' do not match any of the regexes: '^[a-z=
A-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: syscon@1e600=
00: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: efuse@1e8000=
0: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/clock-c=
ontroller@1300000: failed to match any schema with compatible: ['fsl,ls1028=
a-clockgen']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: spi@2120000:=
 Unevaluated properties are not allowed ('little-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/mmc@214=
0000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fs=
l,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/mmc@214=
0000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fs=
l,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/mmc@215=
0000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fs=
l,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/mmc@215=
0000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fs=
l,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/gpio@23=
00000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fs=
l,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/gpio@23=
00000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fs=
l,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/gpio@23=
10000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fs=
l,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/gpio@23=
10000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fs=
l,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/gpio@23=
20000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fs=
l,qoriq-gpio']
--
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: thermal=
-zones: 'core-cluster', 'ddr-controller' do not match any of the regexes: '=
^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: syscon@=
1e60000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: efuse@1=
e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/cl=
ock-controller@1300000: failed to match any schema with compatible: ['fsl,l=
s1028a-clockgen']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: spi@212=
0000: Unevaluated properties are not allowed ('little-endian' was unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/mm=
c@2140000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/mm=
c@2140000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/mm=
c@2150000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/mm=
c@2150000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/gp=
io@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/gp=
io@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/gp=
io@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/gp=
io@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/gp=
io@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
--
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: thermal=
-zones: 'core-cluster', 'ddr-controller' do not match any of the regexes: '=
^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: syscon@=
1e60000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: efuse@1=
e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/cl=
ock-controller@1300000: failed to match any schema with compatible: ['fsl,l=
s1028a-clockgen']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: spi@212=
0000: Unevaluated properties are not allowed ('little-endian' was unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/mm=
c@2140000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/mm=
c@2140000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/mm=
c@2150000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/mm=
c@2150000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/gp=
io@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/gp=
io@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/gp=
io@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/gp=
io@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/gp=
io@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
--
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: thermal=
-zones: 'core-cluster', 'ddr-controller' do not match any of the regexes: '=
^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: syscon@=
1e60000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: efuse@1=
e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/cl=
ock-controller@1300000: failed to match any schema with compatible: ['fsl,l=
s1028a-clockgen']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: spi@212=
0000: Unevaluated properties are not allowed ('little-endian' was unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/mm=
c@2140000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/mm=
c@2140000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/mm=
c@2150000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/mm=
c@2150000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/gp=
io@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/gp=
io@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/gp=
io@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/gp=
io@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/gp=
io@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: au=
dio-codec@1a: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: au=
dio-codec@1a: 'CPVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: au=
dio-codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: au=
dio-codec@1a: 'DCVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: au=
dio-codec@1a: 'MICVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: sp=
i@2120000: Unevaluated properties are not allowed ('little-endian' was unex=
pected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /s=
oc/mmc@2140000: failed to match any schema with compatible: ['fsl,ls1028a-e=
sdhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /s=
oc/mmc@2140000: failed to match any schema with compatible: ['fsl,ls1028a-e=
sdhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /s=
oc/mmc@2150000: failed to match any schema with compatible: ['fsl,ls1028a-e=
sdhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /s=
oc/mmc@2150000: failed to match any schema with compatible: ['fsl,ls1028a-e=
sdhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /s=
oc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1028a-=
gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /s=
oc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1028a-=
gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /s=
oc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1028a-=
gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /s=
oc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1028a-=
gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /s=
oc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-=
gpio', 'fsl,qoriq-gpio']
--
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: thermal=
-zones: 'core-cluster', 'ddr-controller' do not match any of the regexes: '=
^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: syscon@=
1e60000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: efuse@1=
e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/cl=
ock-controller@1300000: failed to match any schema with compatible: ['fsl,l=
s1028a-clockgen']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: spi@212=
0000: Unevaluated properties are not allowed ('little-endian' was unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/mm=
c@2140000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/mm=
c@2140000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/mm=
c@2150000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/mm=
c@2150000: failed to match any schema with compatible: ['fsl,ls1028a-esdhc'=
, 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/gp=
io@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/gp=
io@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/gp=
io@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/gp=
io@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/gp=
io@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio'=
, 'fsl,qoriq-gpio']
--
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: syscon@1e60000: compa=
tible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: efuse@1e80000: Uneval=
uated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/clock-controller=
@1300000: failed to match any schema with compatible: ['fsl,ls1028a-clockge=
n']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/i2c@2000000/fpga=
@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'f=
sl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/i2c@2000000/fpga=
@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'f=
sl,fpga-qixis-i2c', 'simple-mfd']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: spi@2100000: Unevalua=
ted properties are not allowed ('little-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: spi@2110000: Unevalua=
ted properties are not allowed ('little-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: spi@2120000: Unevalua=
ted properties are not allowed ('little-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/mmc@2140000: fai=
led to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/mmc@2140000: fai=
led to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/mmc@2150000: fai=
led to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/mmc@2150000: fai=
led to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/gpio@2300000: fa=
iled to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-g=
pio']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
