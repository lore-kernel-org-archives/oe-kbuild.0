Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE8F20E6
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 00:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742085236; cv=none; b=ShiSbQWiZ5vsIwokCC0VJBryJ7X3IiLPiv6iDbdkpb3IVTSeoEqd72e4ZalXPfUH5Vs+ll/mJzwAVcGxRoxp27K45q0kHBzpv6qi+e+5SYAQ4yum6PqvxP1GipKT5YwdxSLzX3Wz18HniIyYnoXHGkhCax3LleF2+ArZWSx/MQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742085236; c=relaxed/simple;
	bh=MVSXxlXq+aZjjsy92sZ989nr/2g0vVmlVkGY7HV2Ud0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V998scwyesUpfxhb/yY8hZTgfUqVgb0vbTvlBv76KLbBx9+Hg4AUK6c85//jtbWXbgLOtWKsVC7qrkF/oqxbvRg1F3FeZoNA0kIOpVn7C0W0uXZwdEDvlKLJ5E2Ze9A63QoB24ict/2iPazTAhByqIRf/6VITGxRmPMjehn3shI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DKDO+PbG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DKDO+PbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742085233; x=1773621233;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MVSXxlXq+aZjjsy92sZ989nr/2g0vVmlVkGY7HV2Ud0=;
  b=DKDO+PbG7kk5nUZ+ZCSKrPs8sKe6ecA902hj7DyTeuzHUj1i1l92+C+D
   p2E5ssY7l5kmpCxejxzIkcHcJqNerQ0uy4Y/Z8EZMsmI4wEcL3Y0Bc6Mr
   3/4BTSOnm3TtP7zH3UPFEQ01LcYbTxOkJSLSbKj211KAJ3zpLls1HUI+s
   Ex1oglj6L8oAfcC5zZhwA4tYYoyq7awWfzOcdzFa9a//Z3/tTfTx8G2Tt
   V7wwWWJpfojBB0+8mUsXR4zHfrvfkG+vb8QTjckaNBfS6kG1bWVcl7zg6
   bhZp+emuuZn3bpdgZLMZOIDi/08RBuJr9j+PrRsFJy2YjWPS6iTV5dpV1
   g==;
X-CSE-ConnectionGUID: PZg47P4LQfapzvQXtvjQeA==
X-CSE-MsgGUID: McPBdrtDTeaYkRRNY7wDWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="53842330"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="53842330"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 17:33:53 -0700
X-CSE-ConnectionGUID: eXzDUKL0QcmmZCtsGZw+7Q==
X-CSE-MsgGUID: 6ZWh4Z8fQ7qyi4zkNSVbRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="126248794"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 15 Mar 2025 17:33:52 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttbwr-000Bjf-2X;
	Sun, 16 Mar 2025 00:33:49 +0000
Date: Sun, 16 Mar 2025 08:33:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] dt-bindings: soc: airoha: Add the pbus-csr node for
 EN7581 SoC
Message-ID: <202503160834.z1GaHw4Y-lkp@intel.com>
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
In-Reply-To: <20250311-en7581-pbus_csr-binding-v2-1-1fc5b5e482e3@kernel.org>
References: <20250311-en7581-pbus_csr-binding-v2-1-1fc5b5e482e3@kernel.org>
TO: Lorenzo Bianconi <lorenzo@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Lee Jones <lee@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: devicetree@vger.kernel.org
CC: linux-mediatek@lists.infradead.org
CC: linux-pci@vger.kernel.org
CC: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d71fc910c58ed85a2ad5143502030bff73fc2088]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/dt-=
bindings-soc-airoha-Add-the-pbus-csr-node-for-EN7581-SoC/20250312-045813
base:   d71fc910c58ed85a2ad5143502030bff73fc2088
patch link:    https://lore.kernel.org/r/20250311-en7581-pbus_csr-binding-v=
2-1-1fc5b5e482e3%40kernel.org
patch subject: [PATCH v2] dt-bindings: soc: airoha: Add the pbus-csr node f=
or EN7581 SoC
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-052-20250313 (https://download.01.org/0day-ci/archiv=
e/20250316/202503160834.z1GaHw4Y-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250316/202503160834.z1GaHw4Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503160834.z1GaHw4Y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: /soc/ebi@400000=
00: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: nand-controller=
: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: nand-controller=
: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: /soc/ebi@400000=
00/nand-controller: failed to match any schema with compatible: ['atmel,sam=
a5d3-nand-controller']
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: /soc/sram@e0000=
000: failed to match any schema with compatible: ['microchip,sama7g5-secura=
m', 'atmel,sama5d2-securam', 'mmio-sram']
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: /soc/secumod@e0=
004000: failed to match any schema with compatible: ['microchip,sama7g5-sec=
umod', 'atmel,sama5d2-secumod', 'syscon']
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: /soc/secumod@e0=
004000: failed to match any schema with compatible: ['microchip,sama7g5-sec=
umod', 'atmel,sama5d2-secumod', 'syscon']
>> arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: sfr@e0008000: c=
ompatible:0: 'microchip,sama7g5-sfrbu' is not one of ['airoha,en7581-pbus-c=
sr', 'al,alpine-sysfabric-service', 'allwinner,sun8i-a83t-system-controller=
', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-cont=
roller', 'allwinner,sun50i-a64-system-controller', 'altr,l3regs', 'altr,sdr=
-ctl', 'amd,pensando-elba-syscon', 'amlogic,meson-mx-assist', 'amlogic,meso=
n-mx-bootrom', 'amlogic,meson8-analog-top', 'amlogic,meson8b-analog-top', '=
amlogic,meson8-pmu', 'amlogic,meson8b-pmu', 'apm,merlin-poweroff-mailbox', =
'apm,mustang-poweroff-mailbox', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xg=
ene-mcb', 'apm,xgene-rb', 'apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sa=
ma5d3-nfc-io', 'atmel,sama5d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-=
syscon', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-s=
yscon1', 'cirrus,ep7209-syscon2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc=
', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,=
imx93-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf61=
0-mscm-cpucfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisi=
licon,hip04-ppe', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', '=
hpe,gxp-sysreg', 'loongson,ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia=
-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'mar=
vell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'marvell,dove-=
global-config', 'mediatek,mt2701-pctl-a-syscfg', 'mediatek,mt2712-pctl-a-sy=
scfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-pctl-a-syscfg',=
 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediate=
k,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,mpfs-sysreg-sc=
b', 'microchip,sam9x60-sfr', 'microchip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-=
syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm=
', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rock=
chip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'rockchip,r=
k3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3562-qos', 'rockchip,rk3568-=
qos', 'rockchip,rk3576-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'st,spear1340-misc', 'stericsson,nomadik-pmu', 'starfive,jh7100-sysmain', '=
ti,am62-opp-efuse-table', 'ti,am62-usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctr=
l', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti,j784s4-acsp=
cie-proxy-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: sfr@e0008000: c=
ompatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: sfr@e0008000: c=
ompatible: ['microchip,sama7g5-sfrbu', 'atmel,sama5d2-sfrbu', 'syscon'] is =
too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: /soc/sfr@e00080=
00: failed to match any schema with compatible: ['microchip,sama7g5-sfrbu',=
 'atmel,sama5d2-sfrbu', 'syscon']
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: /soc/pinctrl@e0=
014000: failed to match any schema with compatible: ['microchip,sama7g5-pin=
ctrl']
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: /soc/gpbr@e001d=
060: failed to match any schema with compatible: ['microchip,sama7g5-gpbr',=
 'syscon']
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: rtc@e001d0a8: c=
ompatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7g5-rtc', 'microchip,sam9x60-rtc'] is too long
--
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/ebi@40000000: faile=
d to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: nand-controller: #addres=
s-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: nand-controller: #size-c=
ells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/ebi@40000000/nand-c=
ontroller: failed to match any schema with compatible: ['atmel,sama5d3-nand=
-controller']
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/sram@e0000000: fail=
ed to match any schema with compatible: ['microchip,sama7g5-securam', 'atme=
l,sama5d2-securam', 'mmio-sram']
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/secumod@e0004000: f=
ailed to match any schema with compatible: ['microchip,sama7g5-secumod', 'a=
tmel,sama5d2-secumod', 'syscon']
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/secumod@e0004000: f=
ailed to match any schema with compatible: ['microchip,sama7g5-secumod', 'a=
tmel,sama5d2-secumod', 'syscon']
>> arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: sfr@e0008000: compatible=
:0: 'microchip,sama7g5-sfrbu' is not one of ['airoha,en7581-pbus-csr', 'al,=
alpine-sysfabric-service', 'allwinner,sun8i-a83t-system-controller', 'allwi=
nner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', =
'allwinner,sun50i-a64-system-controller', 'altr,l3regs', 'altr,sdr-ctl', 'a=
md,pensando-elba-syscon', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-boot=
rom', 'amlogic,meson8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic,m=
eson8-pmu', 'amlogic,meson8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,must=
ang-poweroff-mailbox', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb',=
 'apm,xgene-rb', 'apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc=
-io', 'atmel,sama5d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', =
'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', =
'cirrus,ep7209-syscon2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freec=
om,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wak=
eupmix-syscfg', 'fsl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cp=
ucfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip=
04-ppe', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-s=
ysreg', 'loongson,ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon',=
 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,arma=
da-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'marvell,dove-global-co=
nfig', 'mediatek,mt2701-pctl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'm=
ediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediate=
k,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-=
syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'micr=
ochip,sam9x60-sfr', 'microchip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', =
'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockc=
hip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk31=
28-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos=
', 'rockchip,rk3399-qos', 'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'ro=
ckchip,rk3576-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear=
1340-misc', 'stericsson,nomadik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-o=
pp-efuse-table', 'ti,am62-usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,a=
m62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy=
-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: sfr@e0008000: compatible=
:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: sfr@e0008000: compatible=
: ['microchip,sama7g5-sfrbu', 'atmel,sama5d2-sfrbu', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/sfr@e0008000: faile=
d to match any schema with compatible: ['microchip,sama7g5-sfrbu', 'atmel,s=
ama5d2-sfrbu', 'syscon']
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/pinctrl@e0014000: f=
ailed to match any schema with compatible: ['microchip,sama7g5-pinctrl']
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/gpbr@e001d060: fail=
ed to match any schema with compatible: ['microchip,sama7g5-gpbr', 'syscon']
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: rtc@e001d0a8: compatible=
: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7g5-rtc', 'microchip,sam9x60-rtc'] is too long

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
