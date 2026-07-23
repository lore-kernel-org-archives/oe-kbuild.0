Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7FA1C84A2
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 01:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769513; cv=none; b=lB4+mymT6ykbbKfdKRMNN0OJ283sWyUKFId3rfmoo06ND9iSoSkfYaD0KmSAp61Tin0Ei4+gPcqUaym1IaxdtwN9ha3Brx/o8722s7gQv2z4I+aRH2+UdnX9hW9RsTUB2bZX70LojqWwQno98jaXm1b2C93MpCNeOlNX0XGTBmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769513; c=relaxed/simple;
	bh=noryUS1UZhRZ8CqLqzNuG8w7Ia0em/fsum9cU3mZqdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rlq2z/IIZocHTH+z+zDCfKdGvZjJPR3vRay3B5hR1MVjOEOuhvpQyO0gLiFeZN7JNNgrIFPUiIH9sqjXUA4oHynNLOI/+vdFsKcbdqnzVZj/zWjMCxXRNSsDOgsjQrqrFhvdTsvN9FXIof9q463hlSJQujEJvI9xI0ybjOA7GTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hj9Y7f//; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hj9Y7f//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784769511; x=1816305511;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=noryUS1UZhRZ8CqLqzNuG8w7Ia0em/fsum9cU3mZqdk=;
  b=hj9Y7f//UpI9LVL68K2DrruUS3NnWuC9m7kkJ/6LFseJ5mfLE3eyMckV
   Zajb4dZRUOwZIjieOdSAIGwDr0jYJZZl3ybrgXswjSklu6lgWCOvwLSRL
   LMwmqu0SGDtloON1HVXgVNHvZMPDEhjX1WsefFIMYLzlNgzHDv1PQi3Y2
   zS6++g84FNB3tdOb2SX+HT2Mj+1E2zeb+GKcrZK5Ea35Zod4kj0Gva8uo
   V27chHxYVjMr3zlfjG0IKRuWG+8yL0X+faXCu48nE5MW4OD/ND3KWKAWL
   obhX9wUtoy7XbWSfrLjSehYOVkxPJAlffQg6pE0rCDxQWJWXW4SVkZvun
   w==;
X-CSE-ConnectionGUID: HuXFhInmSnm3QsDh2033xA==
X-CSE-MsgGUID: 7TCq/1ETQkWXnX5gAXQxlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85610953"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="85610953"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 18:18:28 -0700
X-CSE-ConnectionGUID: 6277u2SNRIuJEOY8SKDP6g==
X-CSE-MsgGUID: NipxFeINT9S5EzqUYZl+jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="255604755"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jul 2026 18:18:27 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmi4u-000000000cq-3Mvj;
	Thu, 23 Jul 2026 01:18:24 +0000
Date: Thu, 23 Jul 2026 03:18:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb:
 topmisc@11d10000 (mediatek,mt7981-topmisc): Unevaluated properties are not
 allowed ('#clock-cells' was unexpected)
Message-ID: <202607230344.ucxajiCJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sjoerd Simons <sjoerd@collabora.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: 262cb81069c65373d4d6b773413552a65b478f7e arm64: dts: mediatek: mt79=
81b: Add PCIe and USB support
date:   7 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-2055-20260721 (https://download.01.org/0day-ci/arc=
hive/20260723/202607230344.ucxajiCJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260723/202607230344.ucxajiCJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 262cb81069c6 ("arm64: dts: mediatek: mt7981b: Add PCIe and USB sup=
port")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607230344.ucxajiCJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: topmisc@11d1000=
0 (mediatek,mt7981-topmisc): compatible: 'oneOf' conditional failed, one mu=
st be fixed:
   	['mediatek,mt7981-topmisc', 'syscon'] is too short
   	'mediatek,mt7981-topmisc' is not one of ['airoha,en7581-pbus-csr', 'al,=
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
da-3700-avs', 'marvell,armada-3700-usb2-host-device-misc', 'marvell,armada-=
3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pctl-a=
-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscf=
g', 'mediatek,mt7988-topmisc', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,m=
t8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-inf=
racfg-nao', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'micr=
ochip,mpfs-control-scb', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sf=
r', 'microchip,sama7d65-ddr3phy', 'microchip,sama7d65-sfrbu', 'microchip,sa=
ma7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,=
ma35d1-sys', 'nuvoton,wpcm450-shm', 'qcom,apq8064-mmss-sfpb', 'qcom,apq8064=
-sps-sic', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos=
', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'ro=
ckchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3528-qos', 'rockchip=
,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockchip,rk358=
8-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,nomadik-pmu=
', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-usb-phy-c=
trl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss=
-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,=
keystone-pllctrl']
   	'mediatek,mt7981-topmisc' is not one of ['microchip,sama7g5-sfrbu', 'mi=
crochip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	'atmel,sama5d2-sfrbu' was expected
   	'microchip,mpfs-control-scb' was expected
   	'microchip,mpfs-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: topmisc@11d1000=
0 (mediatek,mt7981-topmisc): Unevaluated properties are not allowed ('#cloc=
k-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
--
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: topmisc@11d10000 (=
mediatek,mt7981-topmisc): compatible: 'oneOf' conditional failed, one must =
be fixed:
   	['mediatek,mt7981-topmisc', 'syscon'] is too short
   	'mediatek,mt7981-topmisc' is not one of ['airoha,en7581-pbus-csr', 'al,=
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
da-3700-avs', 'marvell,armada-3700-usb2-host-device-misc', 'marvell,armada-=
3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pctl-a=
-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscf=
g', 'mediatek,mt7988-topmisc', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,m=
t8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-inf=
racfg-nao', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'micr=
ochip,mpfs-control-scb', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sf=
r', 'microchip,sama7d65-ddr3phy', 'microchip,sama7d65-sfrbu', 'microchip,sa=
ma7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,=
ma35d1-sys', 'nuvoton,wpcm450-shm', 'qcom,apq8064-mmss-sfpb', 'qcom,apq8064=
-sps-sic', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos=
', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'ro=
ckchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3528-qos', 'rockchip=
,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockchip,rk358=
8-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,nomadik-pmu=
', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-usb-phy-c=
trl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss=
-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,=
keystone-pllctrl']
   	'mediatek,mt7981-topmisc' is not one of ['microchip,sama7g5-sfrbu', 'mi=
crochip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	'atmel,sama5d2-sfrbu' was expected
   	'microchip,mpfs-control-scb' was expected
   	'microchip,mpfs-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: topmisc@11d10000 (=
mediatek,mt7981-topmisc): Unevaluated properties are not allowed ('#clock-c=
ells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
--
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: topmisc@11d1000=
0 (mediatek,mt7981-topmisc): compatible: 'oneOf' conditional failed, one mu=
st be fixed:
   	['mediatek,mt7981-topmisc', 'syscon'] is too short
   	'mediatek,mt7981-topmisc' is not one of ['airoha,en7581-pbus-csr', 'al,=
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
da-3700-avs', 'marvell,armada-3700-usb2-host-device-misc', 'marvell,armada-=
3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pctl-a=
-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscf=
g', 'mediatek,mt7988-topmisc', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,m=
t8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-inf=
racfg-nao', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'micr=
ochip,mpfs-control-scb', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sf=
r', 'microchip,sama7d65-ddr3phy', 'microchip,sama7d65-sfrbu', 'microchip,sa=
ma7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,=
ma35d1-sys', 'nuvoton,wpcm450-shm', 'qcom,apq8064-mmss-sfpb', 'qcom,apq8064=
-sps-sic', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos=
', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'ro=
ckchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3528-qos', 'rockchip=
,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockchip,rk358=
8-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,nomadik-pmu=
', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-usb-phy-c=
trl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss=
-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,=
keystone-pllctrl']
   	'mediatek,mt7981-topmisc' is not one of ['microchip,sama7g5-sfrbu', 'mi=
crochip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	'atmel,sama5d2-sfrbu' was expected
   	'microchip,mpfs-control-scb' was expected
   	'microchip,mpfs-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: topmisc@11d1000=
0 (mediatek,mt7981-topmisc): Unevaluated properties are not allowed ('#cloc=
k-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
