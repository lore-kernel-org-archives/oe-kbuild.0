Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC0114F9F4
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Mar 2025 05:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741411704; cv=none; b=UAnCXexwOoy8Fx7P1ylEZXN22tDNKH5aPt3WGV0C6/qpBIKD95ZXMmaL0CludyA1xaYKh+DbIYJLIKWW6vSYXv82kKjkMgjWYKZa0vlwQIuc5Uo3c4O71lmJMvgOSitwSz3nvrtjY1ZSAZOCcboVu2eEk+yyrMDSzN1POqhOIbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741411704; c=relaxed/simple;
	bh=mhwdJ4AygYm1bVAnhHNDdUrYnnLLi3XTT3hl3PHrey4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RgKC0nR9N4uiODIEz2FmNAI5pxsEf3hoefeNGkDboq1uw/nRs3Q3/gPMfB8LCv5E5KjQ1p9HM4hlxHIrMZ8NgsoEPdDnG4jqlxKyM1vytqlWnGWuCTfu+AaQneKVLLvHp2OEHG/tz6f9aaQu5nZicJrOxP9e2R3i0xlU6/Bi1Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKKVqSx/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKKVqSx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741411700; x=1772947700;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mhwdJ4AygYm1bVAnhHNDdUrYnnLLi3XTT3hl3PHrey4=;
  b=TKKVqSx/15bwHSE6VeD3NcWzL8J6rwG9icjZvxf2tqHlae/4/XC3QRxZ
   am8rqM1wYUHH8T8smxP5dFojTC+y7FhB8F9SEg2ICU/UMBbwn0YIygI9t
   TuVpnBq+uRj3AYeu8oQZkHcTn/6mADG5Ll1jXM3jy4oM945ehmyAJCSpX
   aoZ1kcKdieh1GbfVDwdd9tMcUJXukRZGkNFlMaJPfv7RgLt2EIasjKnjA
   Rg8ENO4RRicD2w9PzgfH8k+FNbRYS2HUtAVPqR5cg5igz5e0aY1YjZrdU
   x2Qyhgm/Jq0gPHHbBEngrmrpsiclZeCnPT9YRXY8Y0nx7Dh56Pof4qrGP
   g==;
X-CSE-ConnectionGUID: CAObw+peQc6sBrob6GicJQ==
X-CSE-MsgGUID: 6stpydoqQaGox968t4VF5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="53862000"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="53862000"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 21:28:19 -0800
X-CSE-ConnectionGUID: nxh+qfuYRQiXxosgDVcKLA==
X-CSE-MsgGUID: dahbdkDbQzqWrj4/bikjeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="119252647"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 07 Mar 2025 21:28:18 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqmjP-0001Wu-20;
	Sat, 08 Mar 2025 05:28:15 +0000
Date: Sat, 8 Mar 2025 13:27:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3528 QoS register node
Message-ID: <202503081357.THUIP1ph-lkp@intel.com>
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
In-Reply-To: <20250305140009.2485859-2-amadeus@jmu.edu.cn>
References: <20250305140009.2485859-2-amadeus@jmu.edu.cn>
TO: Chukun Pan <amadeus@jmu.edu.cn>
TO: Yao Zi <ziyao@disroot.org>
CC: Lee Jones <lee@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Chukun Pan <amadeus@jmu.edu.cn>

Hi Chukun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on next-20250307]
[cannot apply to lee-mfd/for-mfd-next lee-leds/for-leds-next robh/for-next =
lee-mfd/for-mfd-fixes linus/master v6.14-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chukun-Pan/arm64-dts=
-rockchip-Add-rk3528-QoS-register-node/20250305-221347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchi=
p.git for-next
patch link:    https://lore.kernel.org/r/20250305140009.2485859-2-amadeus%4=
0jmu.edu.cn
patch subject: [PATCH 2/2] arm64: dts: rockchip: Add rk3528 QoS register no=
de
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250307 (https://download.01.org/0day-ci/arch=
ive/20250308/202503081357.THUIP1ph-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250308/202503081357.THUIP1ph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503081357.THUIP1ph-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:113.6-494.4: Warning (unit_addr=
ess_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:427.20-493.5: Warning (simple_b=
us_reg): /soc/pinctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff200000: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff200080: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff200100: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff200200: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff200280: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff200300: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff200380: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff210000: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff210080: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff220000: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff220080: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff240000: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff250000: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff260000: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff270000: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff270080: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff270100: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff270200: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff270280: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff270300: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff270380: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff270480: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff270500: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff280000: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff280080: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff280100: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff280180: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff280200: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff280280: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff280300: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff280380: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: qos@ff280400: compat=
ible:0: 'rockchip,rk3528-qos' is not one of ['al,alpine-sysfabric-service',=
 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contr=
oller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syst=
em-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', =
'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-anal=
og-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson=
8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'ap=
m,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgen=
e-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu=
', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,s=
r-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', '=
cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controll=
er', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls108=
8a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subc=
trl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-s=
as-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sys=
con', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-=
misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arm=
ada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pc=
tl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-s=
yscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', '=
mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966=
x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'micro=
chip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'n=
uvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,r=
k3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-=
qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', =
'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ct=
rl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/pinctrl: failed=
 to match any schema with compatible: ['rockchip,rk3528-pinctrl']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
