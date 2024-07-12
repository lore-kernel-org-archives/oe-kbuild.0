Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37BC2D627
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jul 2024 19:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720812228; cv=none; b=SYbx36J27O8DlPlIsX6ozmDm/Keb1Dw8kgT50MOzIoKWZp1j83JB6vjpDU3dmM15A7qwZcu2bhPNxAUepiOEK7ZMX72PV75Z31PwMVimS7W+DjQpvBbvp3D6R6zjt8lFXszDzfHwOox4ktLAW0tykwpzdCZ7zf3ouPMtFl9JVwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720812228; c=relaxed/simple;
	bh=kR9SPB6a0K4SSXZqqdUyYaLb56LhFvcyEkwxiQjseH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s5SiAdAnI5q1EH0Q9Pp/509hFcdG0Cs3SYIqFBOqYug+6VbFrRDTtbx3WF0B/w6NKhva1982vJiLBpaHYxVdGHWKX99ts9QyTAV2EqKFxUpZwYilifDBQixpBNxJ3vslPOPQeDWKuL0cmhJWkRVg9hvrKlI3NGuUgZb+vc7qOWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljSOheLj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljSOheLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720812226; x=1752348226;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kR9SPB6a0K4SSXZqqdUyYaLb56LhFvcyEkwxiQjseH4=;
  b=ljSOheLjA+lE2wddHb/2kNTpDhi7hszXDKnjqce9810xCgm5LfKVINF4
   5xVq6YTOcn9p2xRbhIm+cnat3/QECR719KNOSmFE6S7x+CqyPyXq9tnta
   neHtoiMNNQsJ9ud/uSBTAj9Sv2VYyL94NhxQJq1W4a6+DwXScjuWfKDj6
   2OLFMQsjBjG3vdfwG4DpUe+s2ewmV9PvInGMKk4iMF40ubkdUXvx9C7oI
   eGOaRM3Efzqxb/9X4wsN8UEAQI8DMS3dcJlSavoVeC7oBdqfsmXiHGyN7
   KKhBZb7RhAApso4f5g9cpD1zB/5oe3xvUaZCu86+OIOiN8GaQA7Wiww3N
   A==;
X-CSE-ConnectionGUID: hVLn0IEzRbW2TApfHGkV0w==
X-CSE-MsgGUID: 34QzlzDeQSWcBM4ZiHiNhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="29662262"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="29662262"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 12:23:45 -0700
X-CSE-ConnectionGUID: pZ7A7akSTiK8VPmbt3eqkw==
X-CSE-MsgGUID: takEv0ZJSEiPW4dVKITQkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="49107709"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jul 2024 12:23:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSLrp-000bBO-2K;
	Fri, 12 Jul 2024 19:23:41 +0000
Date: Sat, 13 Jul 2024 03:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ulfh-mmc:next 26/29] arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb:
 sdio@50430000: $nodename:0: 'sdio@50430000' does not match '^mmc(@.*)?$'
Message-ID: <202407130532.RgLfC0u5-lkp@intel.com>
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
TO: Stanislav Jakubek <stano.jakubek@gmail.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   b85e021853976aaebd3788e7e721020570754199
commit: cb1f1c7d38b56b6289e4e6dde554321be2dd4530 [26/29] dt-bindings: mmc: =
sdhci-sprd: convert to YAML
:::::: branch date: 13 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-051-20240712 (https://download.01.org/0day-ci/arch=
ive/20240713/202407130532.RgLfC0u5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240713/202407130532.RgLfC0u5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407130532.RgLfC0u5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: syscon@70b00000: compatible: =
'anyOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: ap-apb@70000000: $nodename:0:=
 'ap-apb@70000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc=
|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: ap-ahb: $nodename:0: 'ap-ahb'=
 does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)=
?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/ap-ahb/dma-controller@20=
100000: failed to match any schema with compatible: ['sprd,sc9860-dma']
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: sdio@50430000: $nodename:0: '=
sdio@50430000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sprd,sdhci-r11.yaml#
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: sdio@50430000: Unevaluated pr=
operties are not allowed ('bus-width', 'cap-mmc-hw-reset', 'mmc-ddr-1_8v', =
'mmc-hs200-1_8v', 'mmc-hs400-1_8v', 'mmc-hs400-enhanced-strobe', 'no-sd', '=
no-sdio', 'non-removable', 'vmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sprd,sdhci-r11.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: aon: $nodename:0: 'aon' does =
not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0:=
 failed to match any schema with compatible: ['sprd,sc2731']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0/=
led-controller@200: failed to match any schema with compatible: ['sprd,sc27=
31-bltc']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0/=
rtc@280: failed to match any schema with compatible: ['sprd,sc2731-rtc']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0/=
efuse@380: failed to match any schema with compatible: ['sprd,sc2731-efuse']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fgu@a00: 'battery-detect-gpio=
s' is a required property
   	from schema $id: http://devicetree.org/schemas/power/supply/sc27xx-fg.y=
aml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fgu@a00: 'sprd,calib-resistan=
ce-micro-ohms' is a required property
--
   arch/arm64/boot/dts/sprd/sp9863a-1h10.dtb: clock-controller@402d0000: cl=
ock-names:2: 'ext-4m' was expected
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9863a-clk.y=
aml#
   arch/arm64/boot/dts/sprd/sp9863a-1h10.dtb: clock-controller@402d0000: cl=
ock-names:3: 'rco-100m' was expected
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9863a-clk.y=
aml#
   arch/arm64/boot/dts/sprd/sp9863a-1h10.dtb: etf@12002000: 'in-ports' is a=
 required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.ya=
ml#
   arch/arm64/boot/dts/sprd/sp9863a-1h10.dtb: etf@12002000: Unevaluated pro=
perties are not allowed ('in-port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.ya=
ml#
   arch/arm64/boot/dts/sprd/sp9863a-1h10.dtb: ap-ahb: $nodename:0: 'ap-ahb'=
 does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)=
?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/sprd/sp9863a-1h10.dtb: sdio@20300000: $nodename:0: '=
sdio@20300000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sprd,sdhci-r11.yaml#
>> arch/arm64/boot/dts/sprd/sp9863a-1h10.dtb: sdio@20300000: Unevaluated pr=
operties are not allowed ('bus-width', 'no-mmc', 'no-sdio' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sprd,sdhci-r11.yaml#
   arch/arm64/boot/dts/sprd/sp9863a-1h10.dtb: sdio@20600000: $nodename:0: '=
sdio@20600000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sprd,sdhci-r11.yaml#
>> arch/arm64/boot/dts/sprd/sp9863a-1h10.dtb: sdio@20600000: Unevaluated pr=
operties are not allowed ('bus-width', 'cap-mmc-hw-reset', 'no-sd', 'no-sdi=
o', 'non-removable' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sprd,sdhci-r11.yaml#
   arch/arm64/boot/dts/sprd/sp9863a-1h10.dtb: idle-states: 'core-pd' does n=
ot match any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
