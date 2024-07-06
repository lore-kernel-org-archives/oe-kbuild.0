Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AE25336B
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jul 2024 16:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720283046; cv=none; b=fPz59YZhpH0XSqcvrqcT5YFqTJAKpU+yu1mT43r49IA1xpJ8nMgk9yAUHoJwFgO0rSY87GTzBe9J3Qp2wt1WYoIj8hNPsoc287HrYaM0XnhM0KPq0xEWP/e/TkGYkP9v4ExYHgvT4oV6ndTxKBkQOzl0a/TJumfejCaSuBkgF1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720283046; c=relaxed/simple;
	bh=vdgAf7s/BynzNl/zuKMLPf77hKnWMltMYdqf4HfnpWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UDdhZ12VBEBOBgIMXEkljptRWNcFm7GZ/5a3urIlpgfRleSdnnUIAj8bv4eSZ7G4mAKcpUzGslxDTaRMEtGLP+htBs1RsYxJxqDRusNyb7CzWlY4LB9wohXtcBGFAgp75NOBxJM4nFk734cx/VvW4z5R6t6FM7yme4/zzTTxHCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESrPd2Lx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESrPd2Lx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720283044; x=1751819044;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vdgAf7s/BynzNl/zuKMLPf77hKnWMltMYdqf4HfnpWw=;
  b=ESrPd2LxAr8+pTeLbKNgfk+f4MBRlOXczGAIXak3XyogH/nmVT++KAa7
   T+fKtLxRuIxHacb6YiigJcFlNqdIJCEpFUJnt3iYioJxSixE1nnlD48I1
   DHRVGK14a5/LMb5CKHkJvIT8DfgpWK7mXWzOs+4T4/fOTo4ybVL57yhAf
   WaaPwLT+VXK9SlKHIzOE4O4wG2nEkK/gNmdkFzbhXizARbXzz9DvYjU+U
   3EdXW/P/y/aXLJB/FH6IL7eqlyASdsbWR9EO4QFx4rtb/5KVhUcHKETdu
   LBVE07spO6QXrrmQhl4ungmdx1oyg/h7WNGgRx1/5BuUvcVy8XuDEcKpN
   Q==;
X-CSE-ConnectionGUID: wW0jPlBjQ0a7diHTJYjLqA==
X-CSE-MsgGUID: 6ERemPaBSKmNrcmKu1VDhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="21352021"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="21352021"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 09:24:03 -0700
X-CSE-ConnectionGUID: DAEe49PVQUywEFvq5DM1NQ==
X-CSE-MsgGUID: ZcZiWtd4REGhxTMYVBoEoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="47223977"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Jul 2024 09:24:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ8Cd-000U1U-11;
	Sat, 06 Jul 2024 16:23:59 +0000
Date: Sun, 7 Jul 2024 00:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next] dt-bindings: net: Define properties at top-level
Message-ID: <202407070041.Kik6MNcp-lkp@intel.com>
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
In-Reply-To: <20240625215442.190557-2-robh@kernel.org>
References: <20240625215442.190557-2-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-b=
indings-net-Define-properties-at-top-level/20240626-091748
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240625215442.190557-2-robh%40ker=
nel.org
patch subject: [PATCH net-next] dt-bindings: net: Define properties at top-=
level
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm-randconfig-051-20240626 (https://download.01.org/0day-ci/archiv=
e/20240707/202407070041.Kik6MNcp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240707/202407070041.Kik6MNcp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407070041.Kik6MNcp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: pcie@0,0: 'device_type'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: pcie@1,0: 'device_type'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: ethernet@1b100000: comp=
atible: ['mediatek,mt7623-eth', 'mediatek,mt2701-eth', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: ethernet@1b100000: cloc=
ks: [[16, 110], [50, 2], [50, 4], [50, 3], [3, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: ethernet@1b100000: cloc=
k-names: ['ethif', 'esw', 'gp1', 'gp2', 'trgpll'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: ethernet@1b100000: Unev=
aluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: ethernet@1b100000: rese=
ts: [[50, 6], [50, 23], [50, 31]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /crypto@1b240000: faile=
d to match any schema with compatible: ['mediatek,eip97-crypto']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /syscon@1c000000: faile=
d to match any schema with compatible: ['mediatek,mt7623-bdpsys', 'mediatek=
,mt2701-bdpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /syscon@1c000000: faile=
d to match any schema with compatible: ['mediatek,mt7623-bdpsys', 'mediatek=
,mt2701-bdpsys', 'syscon']
--
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: pcie@0,0: 'device_type'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: pcie@1,0: 'device_type'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: ethernet@1b100000: comp=
atible: ['mediatek,mt7623-eth', 'mediatek,mt2701-eth', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: ethernet@1b100000: cloc=
ks: [[16, 110], [48, 2], [48, 4], [48, 3], [3, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: ethernet@1b100000: cloc=
k-names: ['ethif', 'esw', 'gp1', 'gp2', 'trgpll'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: ethernet@1b100000: Unev=
aluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: ethernet@1b100000: rese=
ts: [[48, 6], [48, 23], [48, 31]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /crypto@1b240000: faile=
d to match any schema with compatible: ['mediatek,eip97-crypto']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /syscon@1c000000: faile=
d to match any schema with compatible: ['mediatek,mt7623-bdpsys', 'mediatek=
,mt2701-bdpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /syscon@1c000000: faile=
d to match any schema with compatible: ['mediatek,mt7623-bdpsys', 'mediatek=
,mt2701-bdpsys', 'syscon']
--
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: pcie@0,0: 'device_type'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: pcie@1,0: 'device_type'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: ethernet@1b100000: comp=
atible: ['mediatek,mt7623-eth', 'mediatek,mt2701-eth', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: ethernet@1b100000: cloc=
ks: [[16, 110], [54, 2], [54, 4], [54, 3], [3, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: ethernet@1b100000: cloc=
k-names: ['ethif', 'esw', 'gp1', 'gp2', 'trgpll'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: ethernet@1b100000: Unev=
aluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: ethernet@1b100000: rese=
ts: [[54, 6], [54, 23], [54, 31]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /crypto@1b240000: faile=
d to match any schema with compatible: ['mediatek,eip97-crypto']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /syscon@1c000000: faile=
d to match any schema with compatible: ['mediatek,mt7623-bdpsys', 'mediatek=
,mt2701-bdpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /syscon@1c000000: faile=
d to match any schema with compatible: ['mediatek,mt7623-bdpsys', 'mediatek=
,mt2701-bdpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /syscon@13000000: faile=
d to match any schema with compatible: ['mediatek,mt7623-g3dsys', 'mediatek=
,mt2701-g3dsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /syscon@13000000: faile=
d to match any schema with compatible: ['mediatek,mt7623-g3dsys', 'mediatek=
,mt2701-g3dsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /syscon@15000000: faile=
d to match any schema with compatible: ['mediatek,mt7623-imgsys', 'mediatek=
,mt2701-imgsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /syscon@15000000: faile=
d to match any schema with compatible: ['mediatek,mt7623-imgsys', 'mediatek=
,mt2701-imgsys', 'syscon']
--
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: pcie@0,0: 'devic=
e_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: pcie@1,0: 'devic=
e_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: ethernet@1b10000=
0: compatible: ['mediatek,mt7623-eth', 'mediatek,mt2701-eth', 'syscon'] is =
too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: ethernet@1b10000=
0: clocks: [[16, 110], [52, 2], [52, 4], [52, 3], [3, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: ethernet@1b10000=
0: clock-names: ['ethif', 'esw', 'gp1', 'gp2', 'trgpll'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: ethernet@1b10000=
0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: ethernet@1b10000=
0: resets: [[52, 6], [52, 23], [52, 31]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /crypto@1b240000=
: failed to match any schema with compatible: ['mediatek,eip97-crypto']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /syscon@1c000000=
: failed to match any schema with compatible: ['mediatek,mt7623-bdpsys', 'm=
ediatek,mt2701-bdpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /syscon@1c000000=
: failed to match any schema with compatible: ['mediatek,mt7623-bdpsys', 'm=
ediatek,mt2701-bdpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /syscon@13000000=
: failed to match any schema with compatible: ['mediatek,mt7623-g3dsys', 'm=
ediatek,mt2701-g3dsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /syscon@13000000=
: failed to match any schema with compatible: ['mediatek,mt7623-g3dsys', 'm=
ediatek,mt2701-g3dsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /syscon@15000000=
: failed to match any schema with compatible: ['mediatek,mt7623-imgsys', 'm=
ediatek,mt2701-imgsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /syscon@15000000=
: failed to match any schema with compatible: ['mediatek,mt7623-imgsys', 'm=
ediatek,mt2701-imgsys', 'syscon']
--
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
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: amba: $nodename:0: 'amba'=
 does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)=
?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: syscon@1bb00000: compatib=
le: 'anyOf' conditional failed, one must be fixed:
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
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: /soc/sata@29000000: faile=
d to match any schema with compatible: ['qcom,ipq806x-ahci', 'generic-ahci']
>> arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: ethernet@37000000: snps,p=
bl: False schema does not allow [[32]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: ethernet@37200000: snps,p=
bl: False schema does not allow [[32]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: ethernet@37400000: snps,p=
bl: False schema does not allow [[32]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: ethernet@37600000: snps,p=
bl: False schema does not allow [[32]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: leds: led-0:linux,default=
-trigger: 'oneOf' conditional failed, one must be fixed:
   	'usbdev' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-a=
ctivity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', '=
audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk'=
, 'none', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'usbdev' does not match '^cpu[0-9]*$'
--
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: amba: $nodename:0: 'amba=
' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+=
)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: syscon@1bb00000: compati=
ble: 'anyOf' conditional failed, one must be fixed:
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
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: /soc/sata@29000000: fail=
ed to match any schema with compatible: ['qcom,ipq806x-ahci', 'generic-ahci=
']
>> arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: ethernet@37000000: snps,=
pbl: False schema does not allow [[32]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: ethernet@37200000: snps,=
pbl: False schema does not allow [[32]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: ethernet@37400000: snps,=
pbl: False schema does not allow [[32]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: ethernet@37600000: snps,=
pbl: False schema does not allow [[32]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
--
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/lpc@8787000: failed to matc=
h any schema with compatible: ['st,stih407-lpc']
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/lpc@8788000: failed to matc=
h any schema with compatible: ['st,stih407-lpc']
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/spifsm@9022000: failed to m=
atch any schema with compatible: ['st,spi-fsm']
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/sata@9b20000: failed to mat=
ch any schema with compatible: ['st,ahci']
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/sata@9b28000: failed to mat=
ch any schema with compatible: ['st,ahci']
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/dwc3@8f94000: failed to mat=
ch any schema with compatible: ['st,stih407-dwc3']
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/pwm@9810000: failed to matc=
h any schema with compatible: ['st,sti-pwm']
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/pwm@9510000: failed to matc=
h any schema with compatible: ['st,sti-pwm']
   arch/arm/boot/dts/st/stih407-b2120.dtb: dwmac@9630000: $nodename:0: 'dwm=
ac@9630000' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm/boot/dts/st/stih407-b2120.dtb: dwmac@9630000: snps,pbl: False s=
chema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/dwmac@9630000: failed to ma=
tch any schema with compatible: ['st,stih407-dwmac', 'snps,dwmac', 'snps,dw=
mac-3.710']
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/dma-controller@8e20000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-11', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/dma-controller@8e20000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-11', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/dma-controller@8e40000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-12', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/dma-controller@8e40000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-12', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/dma-controller@8e60000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-13', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/dma-controller@8e60000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-13', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/sti-uni-player@8d80000: fai=
led to match any schema with compatible: ['st,stih407-uni-player-hdmi']
   arch/arm/boot/dts/st/stih407-b2120.dtb: /soc/sti-uni-player@8d81000: fai=
led to match any schema with compatible: ['st,stih407-uni-player-pcm-out']
--
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/lpc@8787000: failed to matc=
h any schema with compatible: ['st,stih407-lpc']
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/lpc@8788000: failed to matc=
h any schema with compatible: ['st,stih407-lpc']
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/spifsm@9022000: failed to m=
atch any schema with compatible: ['st,spi-fsm']
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/sata@9b20000: failed to mat=
ch any schema with compatible: ['st,ahci']
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/sata@9b28000: failed to mat=
ch any schema with compatible: ['st,ahci']
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/dwc3@8f94000: failed to mat=
ch any schema with compatible: ['st,stih407-dwc3']
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/pwm@9810000: failed to matc=
h any schema with compatible: ['st,sti-pwm']
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/pwm@9510000: failed to matc=
h any schema with compatible: ['st,sti-pwm']
   arch/arm/boot/dts/st/stih410-b2120.dtb: dwmac@9630000: $nodename:0: 'dwm=
ac@9630000' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm/boot/dts/st/stih410-b2120.dtb: dwmac@9630000: snps,pbl: False s=
chema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/dwmac@9630000: failed to ma=
tch any schema with compatible: ['st,stih407-dwmac', 'snps,dwmac', 'snps,dw=
mac-3.710']
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/dma-controller@8e20000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-11', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/dma-controller@8e20000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-11', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/dma-controller@8e40000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-12', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/dma-controller@8e40000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-12', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/dma-controller@8e60000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-13', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/dma-controller@8e60000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-13', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/sti-uni-player@8d80000: fai=
led to match any schema with compatible: ['st,stih407-uni-player-hdmi']
   arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/sti-uni-player@8d81000: fai=
led to match any schema with compatible: ['st,stih407-uni-player-pcm-out']
--
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/lpc@8787000: failed to matc=
h any schema with compatible: ['st,stih407-lpc']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/lpc@8788000: failed to matc=
h any schema with compatible: ['st,stih407-lpc']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/spifsm@9022000: failed to m=
atch any schema with compatible: ['st,spi-fsm']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sata@9b20000: failed to mat=
ch any schema with compatible: ['st,ahci']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sata@9b28000: failed to mat=
ch any schema with compatible: ['st,ahci']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/dwc3@8f94000: failed to mat=
ch any schema with compatible: ['st,stih407-dwc3']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/pwm@9810000: failed to matc=
h any schema with compatible: ['st,sti-pwm']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/pwm@9510000: failed to matc=
h any schema with compatible: ['st,sti-pwm']
   arch/arm/boot/dts/st/stih410-b2260.dtb: dwmac@9630000: $nodename:0: 'dwm=
ac@9630000' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm/boot/dts/st/stih410-b2260.dtb: dwmac@9630000: snps,pbl: False s=
chema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/dwmac@9630000: failed to ma=
tch any schema with compatible: ['st,stih407-dwmac', 'snps,dwmac', 'snps,dw=
mac-3.710']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/dma-controller@8e20000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-11', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/dma-controller@8e20000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-11', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/dma-controller@8e40000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-12', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/dma-controller@8e40000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-12', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/dma-controller@8e60000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-13', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/dma-controller@8e60000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-13', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-player@8d80000: fai=
led to match any schema with compatible: ['st,stih407-uni-player-hdmi']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-player@8d81000: fai=
led to match any schema with compatible: ['st,stih407-uni-player-pcm-out']
--
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/lpc@8787000: failed to matc=
h any schema with compatible: ['st,stih407-lpc']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/lpc@8788000: failed to matc=
h any schema with compatible: ['st,stih407-lpc']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/spifsm@9022000: failed to m=
atch any schema with compatible: ['st,spi-fsm']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/sata@9b20000: failed to mat=
ch any schema with compatible: ['st,ahci']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/sata@9b28000: failed to mat=
ch any schema with compatible: ['st,ahci']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/dwc3@8f94000: failed to mat=
ch any schema with compatible: ['st,stih407-dwc3']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/pwm@9810000: failed to matc=
h any schema with compatible: ['st,sti-pwm']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/pwm@9510000: failed to matc=
h any schema with compatible: ['st,sti-pwm']
   arch/arm/boot/dts/st/stih418-b2199.dtb: dwmac@9630000: $nodename:0: 'dwm=
ac@9630000' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm/boot/dts/st/stih418-b2199.dtb: dwmac@9630000: snps,pbl: False s=
chema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/dwmac@9630000: failed to ma=
tch any schema with compatible: ['st,stih407-dwmac', 'snps,dwmac', 'snps,dw=
mac-3.710']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/dma-controller@8e20000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-11', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/dma-controller@8e20000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-11', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/dma-controller@8e40000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-12', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/dma-controller@8e40000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-12', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/dma-controller@8e60000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-13', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/dma-controller@8e60000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-13', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/sti-uni-player@8d80000: fai=
led to match any schema with compatible: ['st,stih407-uni-player-hdmi']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /soc/sti-uni-player@8d81000: fai=
led to match any schema with compatible: ['st,stih407-uni-player-pcm-out']
--
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/lpc@8787000: failed to matc=
h any schema with compatible: ['st,stih407-lpc']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/lpc@8788000: failed to matc=
h any schema with compatible: ['st,stih407-lpc']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/spifsm@9022000: failed to m=
atch any schema with compatible: ['st,spi-fsm']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/sata@9b20000: failed to mat=
ch any schema with compatible: ['st,ahci']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/sata@9b28000: failed to mat=
ch any schema with compatible: ['st,ahci']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/dwc3@8f94000: failed to mat=
ch any schema with compatible: ['st,stih407-dwc3']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/pwm@9810000: failed to matc=
h any schema with compatible: ['st,sti-pwm']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/pwm@9510000: failed to matc=
h any schema with compatible: ['st,sti-pwm']
   arch/arm/boot/dts/st/stih418-b2264.dtb: dwmac@9630000: $nodename:0: 'dwm=
ac@9630000' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm/boot/dts/st/stih418-b2264.dtb: dwmac@9630000: snps,pbl: False s=
chema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/dwmac@9630000: failed to ma=
tch any schema with compatible: ['st,stih407-dwmac', 'snps,dwmac', 'snps,dw=
mac-3.710']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/dma-controller@8e20000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-11', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/dma-controller@8e20000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-11', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/dma-controller@8e40000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-12', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/dma-controller@8e40000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-12', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/dma-controller@8e60000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-13', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/dma-controller@8e60000: fai=
led to match any schema with compatible: ['st,stih407-fdma-mpe31-13', 'st,s=
lim-rproc']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/sti-uni-player@8d80000: fai=
led to match any schema with compatible: ['st,stih407-uni-player-hdmi']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/sti-uni-player@8d81000: fai=
led to match any schema with compatible: ['st,stih407-uni-player-pcm-out']
--
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: mmcsd@40004000: clock-names:=
0: 'biu' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yam=
l#
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: mmcsd@40004000: clock-names:=
1: 'ciu' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yam=
l#
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: mmcsd@40004000: $nodename:0:=
 'mmcsd@40004000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yam=
l#
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /soc/memory-controller@40005=
000: failed to match any schema with compatible: ['arm,pl172', 'arm,primece=
ll']
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: lcd-controller@40008000: 're=
sets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /soc/eeprom@4000e000: failed=
 to match any schema with compatible: ['nxp,lpc1857-eeprom']
>> arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: ethernet@40010000: snps,pbl:=
 False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /soc/ethernet@40010000: fail=
ed to match any schema with compatible: ['nxp,lpc1850-dwmac', 'snps,dwmac-3=
=2E611', 'snps,dwmac']
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /soc/ethernet@40010000: fail=
ed to match any schema with compatible: ['nxp,lpc1850-dwmac', 'snps,dwmac-3=
=2E611', 'snps,dwmac']
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /soc/syscon@40043000: failed=
 to match any schema with compatible: ['nxp,lpc1850-creg', 'syscon', 'simpl=
e-mfd']
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /soc/syscon@40043000/clock-c=
ontroller: failed to match any schema with compatible: ['nxp,lpc1850-creg-c=
lk']
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /soc/syscon@40043000/phy: fa=
iled to match any schema with compatible: ['nxp,lpc1850-usb-otg-phy']
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /soc/syscon@40043000/dma-mux=
: failed to match any schema with compatible: ['nxp,lpc1850-dmamux']
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: rtc@40046000: compatible:0: =
'nxp,lpc1788-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,lpc1788-rtc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: rtc@40046000: compatible: ['=
nxp,lpc1850-rtc', 'nxp,lpc1788-rtc'] is too long
--
   arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: /soc/memory-controller=
@40005000: failed to match any schema with compatible: ['arm,pl172', 'arm,p=
rimecell']
   arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: sram@2,0: '#address-ce=
lls' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: sram@2,0: '#size-cells=
' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: sram@2,0: 'ranges' is =
a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: lcd-controller@4000800=
0: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: /soc/eeprom@4000e000: =
failed to match any schema with compatible: ['nxp,lpc1857-eeprom']
>> arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: ethernet@40010000: snp=
s,pbl: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: /soc/ethernet@40010000=
: failed to match any schema with compatible: ['nxp,lpc1850-dwmac', 'snps,d=
wmac-3.611', 'snps,dwmac']
   arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: /soc/ethernet@40010000=
: failed to match any schema with compatible: ['nxp,lpc1850-dwmac', 'snps,d=
wmac-3.611', 'snps,dwmac']
   arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: /soc/syscon@40043000: =
failed to match any schema with compatible: ['nxp,lpc1850-creg', 'syscon', =
'simple-mfd']
   arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: /soc/syscon@40043000/c=
lock-controller: failed to match any schema with compatible: ['nxp,lpc1850-=
creg-clk']
   arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: /soc/syscon@40043000/p=
hy: failed to match any schema with compatible: ['nxp,lpc1850-usb-otg-phy']
   arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: /soc/syscon@40043000/d=
ma-mux: failed to match any schema with compatible: ['nxp,lpc1850-dmamux']
   arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: rtc@40046000: compatib=
le:0: 'nxp,lpc1788-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,lpc1788-rtc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: rtc@40046000: compatib=
le: ['nxp,lpc1850-rtc', 'nxp,lpc1788-rtc'] is too long
--
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yam=
l#
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: mmcsd@40004000: $no=
dename:0: 'mmcsd@40004000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yam=
l#
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: mmcsd@40004000: Une=
valuated properties are not allowed ('bus-width', 'clock-names', 'resets', =
'vmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yam=
l#
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: /soc/memory-control=
ler@40005000: failed to match any schema with compatible: ['arm,pl172', 'ar=
m,primecell']
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: /soc/memory-control=
ler@40005000/cs2/gpio@2,0: failed to match any schema with compatible: ['ti=
,7416374']
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: lcd-controller@4000=
8000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: /soc/eeprom@4000e00=
0: failed to match any schema with compatible: ['nxp,lpc1857-eeprom']
>> arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: ethernet@40010000: =
snps,pbl: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: /soc/ethernet@40010=
000: failed to match any schema with compatible: ['nxp,lpc1850-dwmac', 'snp=
s,dwmac-3.611', 'snps,dwmac']
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: /soc/ethernet@40010=
000: failed to match any schema with compatible: ['nxp,lpc1850-dwmac', 'snp=
s,dwmac-3.611', 'snps,dwmac']
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: /soc/syscon@4004300=
0: failed to match any schema with compatible: ['nxp,lpc1850-creg', 'syscon=
', 'simple-mfd']
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: /soc/syscon@4004300=
0/clock-controller: failed to match any schema with compatible: ['nxp,lpc18=
50-creg-clk']
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: /soc/syscon@4004300=
0/phy: failed to match any schema with compatible: ['nxp,lpc1850-usb-otg-ph=
y']
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: /soc/syscon@4004300=
0/dma-mux: failed to match any schema with compatible: ['nxp,lpc1850-dmamux=
']
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: rtc@40046000: compa=
tible:0: 'nxp,lpc1788-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,lpc1788-rtc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: rtc@40046000: compa=
tible: ['nxp,lpc1850-rtc', 'nxp,lpc1788-rtc'] is too long
--
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: mmcsd@40004000: clock=
-names:1: 'ciu' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yam=
l#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: mmcsd@40004000: $node=
name:0: 'mmcsd@40004000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yam=
l#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: mmcsd@40004000: Uneva=
luated properties are not allowed ('bus-width', 'clock-names', 'resets', 'v=
mmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yam=
l#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/memory-controlle=
r@40005000: failed to match any schema with compatible: ['arm,pl172', 'arm,=
primecell']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: lcd-controller@400080=
00: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/eeprom@4000e000:=
 failed to match any schema with compatible: ['nxp,lpc1857-eeprom']
>> arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: ethernet@40010000: sn=
ps,pbl: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/ethernet@4001000=
0: failed to match any schema with compatible: ['nxp,lpc1850-dwmac', 'snps,=
dwmac-3.611', 'snps,dwmac']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/ethernet@4001000=
0: failed to match any schema with compatible: ['nxp,lpc1850-dwmac', 'snps,=
dwmac-3.611', 'snps,dwmac']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/syscon@40043000:=
 failed to match any schema with compatible: ['nxp,lpc1850-creg', 'syscon',=
 'simple-mfd']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/syscon@40043000/=
clock-controller: failed to match any schema with compatible: ['nxp,lpc1850=
-creg-clk']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/syscon@40043000/=
phy: failed to match any schema with compatible: ['nxp,lpc1850-usb-otg-phy']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/syscon@40043000/=
dma-mux: failed to match any schema with compatible: ['nxp,lpc1850-dmamux']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: rtc@40046000: compati=
ble:0: 'nxp,lpc1788-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,lpc1788-rtc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: rtc@40046000: compati=
ble: ['nxp,lpc1850-rtc', 'nxp,lpc1788-rtc'] is too long

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
