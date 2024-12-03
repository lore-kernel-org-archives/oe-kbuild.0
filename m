Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ED81E1C35
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Dec 2024 09:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733219126; cv=none; b=ITmzDl7dfRT8jcxUTTlzXa4H83zdISNsOb3lAtNIShChGT4Lv+gJ/WvQoasS8uaAqRXjgOSG0hX+7XFdDFV2IkhM5CPFb1P1d/DCNn/8NXxhHBim/Cz/QYsDrJyQVOUpNdzycjqSsfQVv21HSI14BMKQAmxnONhGdGSkwSzOZPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733219126; c=relaxed/simple;
	bh=DsILb5Jh8p2MADdBArwmd+KNyoqJe+ZoRxXnDExAW3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vFL9CqqEyvP5FWV4Mwj9F6TpEuXuDcdTh960Xzz4bjwnnK8mKF2gl5leTIysAx+7+Rkyek72OnrrQiknlOn2d9Y4LYHFDIbW8+tYRYdDZuro69yuKDB9S2/nVw1T7LvFGunoKwocN82/DEa2QSd/qAD1eULo7V3StLDZUhuGIcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGxgCp0P; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGxgCp0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733219124; x=1764755124;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DsILb5Jh8p2MADdBArwmd+KNyoqJe+ZoRxXnDExAW3I=;
  b=CGxgCp0PmvaytkrwLsxwMcigPOASH69T5uMSKtYh8D/u/MY6berlRDq0
   jqGKkRmWwZnBVnttW6hdgDUEE2nkAUZST4mqycNcywkTwm8fRX5ZKU9DA
   MnEJu/OmsNw3XBm31IXKWiHP5q0QYjL1NcY8DpTekkNUdHnujfaOfV+ee
   fCSSn721z+njhwcXaep5qu6SINWduxfKGvqNqKONcSMKC6YkNeMYTqDXQ
   64DlTm5MeC+nsjWOJvXv91BULi7DBU+oSeYyWy/MPwxTN5tAz5gwofBSh
   sXamSnm2ooS0EUPO4NkyciH8zGXBw+IyVpFOdrR22zoa8J46HNI41mnjQ
   w==;
X-CSE-ConnectionGUID: lNWGZkOvSWyvDNAvF/PuNg==
X-CSE-MsgGUID: USaQc2WZQzGsPz4AeoDx3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44810926"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="44810926"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 01:45:23 -0800
X-CSE-ConnectionGUID: Udj9wqkYR8y2p6PUvmR3qQ==
X-CSE-MsgGUID: HZAGlFEnS7itGXFCBz4G4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="94217637"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Dec 2024 01:45:21 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIPT4-0000Ur-2r;
	Tue, 03 Dec 2024 09:45:18 +0000
Date: Tue, 3 Dec 2024 17:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCHv3 2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable
 ACSPCIE output for PCIe1
Message-ID: <202412031723.mOEFhOK9-lkp@intel.com>
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
In-Reply-To: <20241202143331.126800-2-romain.naour@smile.fr>
References: <20241202143331.126800-2-romain.naour@smile.fr>
TO: Romain Naour <romain.naour@smile.fr>
TO: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-omap@vger.kernel.org
CC: conor+dt@kernel.org
CC: krzk+dt@kernel.org
CC: robh@kernel.org
CC: kristo@kernel.org
CC: vigneshr@ti.com
CC: nm@ti.com
CC: Romain Naour <romain.naour@skf.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>

Hi Romain,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on lee-mfd/for-mfd-next arm64/for-next/core clk/cl=
k-next kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/m=
aster v6.13-rc1 next-20241128]
[cannot apply to lee-mfd/for-mfd-fixes arm/for-next arm/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Romain-Naour/arm64-d=
ts-ti-k3-j721e-beagleboneai64-Enable-ACSPCIE-output-for-PCIe1/20241202-2255=
18
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
patch link:    https://lore.kernel.org/r/20241202143331.126800-2-romain.nao=
ur%40smile.fr
patch subject: [PATCHv3 2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enabl=
e ACSPCIE output for PCIe1
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-051-20241203 (https://download.01.org/0day-ci/arch=
ive/20241203/202412031723.mOEFhOK9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592=
c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241203/202412031723.mOEFhOK9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412031723.mOEFhOK9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: scm-conf@100000: 'sy=
scon@18090' does not match any of the regexes: '^chipid@[0-9a-f]+$', '^cloc=
k-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', '=
pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-c=
ontroller.yaml#
>> arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: syscon@18090: compat=
ible:0: 'ti,j721e-acspcie-proxy-ctrl' is not one of ['al,alpine-sysfabric-s=
ervice', 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-syst=
em-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-=
a64-system-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-s=
yscon', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,mes=
on8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlog=
ic,meson8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailb=
ox', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', '=
apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5=
d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset',=
 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-sys=
con2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-=
controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'f=
sl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,=
dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilico=
n,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,=
ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3=
700-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'mar=
vell,armada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,m=
t2701-pctl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pct=
l-pmic-syscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-sy=
scfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchi=
p,lan966x-cpu-syscon', 'microchip,sam9x60-sfr', 'microchip,sama7g5-ddr3phy'=
, 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', '=
nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip=
,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk328=
8-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos'=
, 'rockchip,rk3576-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', 'st,=
spear1340-misc', 'stericsson,nomadik-pmu', 'starfive,jh7100-sysmain', 'ti,a=
m62-opp-efuse-table', 'ti,am62-usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', =
'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti,j784s4-pcie-ctr=
l', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: scm-conf@100000: =
'syscon@18090' does not match any of the regexes: '^chipid@[0-9a-f]+$', '^c=
lock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$'=
, 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-c=
ontroller.yaml#
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: syscon@18090: com=
patible:0: 'ti,j721e-acspcie-proxy-ctrl' is not one of ['al,alpine-sysfabri=
c-service', 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-s=
ystem-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun5=
0i-a64-system-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elb=
a-syscon', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,=
meson8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'am=
logic,meson8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-ma=
ilbox', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb'=
, 'apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sa=
ma5d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkse=
t', 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-=
syscon2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-syst=
em-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg',=
 'fsl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilic=
on,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisil=
icon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongs=
on,ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armad=
a-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', '=
marvell,armada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediate=
k,mt2701-pctl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-=
pctl-pmic-syscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b=
-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'micro=
chip,lan966x-cpu-syscon', 'microchip,sam9x60-sfr', 'microchip,sama7g5-ddr3p=
hy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys'=
, 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockc=
hip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk=
3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-q=
os', 'rockchip,rk3576-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', '=
st,spear1340-misc', 'stericsson,nomadik-pmu', 'starfive,jh7100-sysmain', 't=
i,am62-opp-efuse-table', 'ti,am62-usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl=
', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti,j784s4-pcie-=
ctrl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
   arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: scm-conf@100000: 'syscon@18090' =
does not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controller=
@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9=
]+'
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-c=
ontroller.yaml#
>> arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: syscon@18090: compatible:0: 'ti,=
j721e-acspcie-proxy-ctrl' is not one of ['al,alpine-sysfabric-service', 'al=
lwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controlle=
r', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-c=
ontroller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', 'aml=
ogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-analog-t=
op', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson8b-p=
mu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'apm,xg=
ene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgene-sc=
u', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu', '=
atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,sr-cd=
ru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', 'cirr=
us,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controller',=
 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls1088a-r=
eset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subctrl'=
, 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-sas-s=
ubctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-syscon'=
, 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-misc=
', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,armada-=
3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pctl-a=
-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscf=
g', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'medi=
atek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cp=
u-syscon', 'microchip,sam9x60-sfr', 'microchip,sama7g5-ddr3phy', 'mscc,ocel=
ot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm=
450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos'=
, 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'roc=
kchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockchip,=
rk3576-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-mi=
sc', 'stericsson,nomadik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efus=
e-table', 'ti,am62-usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cp=
sw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,keys=
tone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: dvi-=
bridge: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,tfp410=
=2Eyaml#
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: dvi-=
bridge: 'ti,deskew' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,tfp410=
=2Eyaml#
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: dvi-=
bridge: '#address-cells', '#size-cells', 'port@0', 'port@1' do not match an=
y of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,tfp410=
=2Eyaml#
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: hdmi=
-connector: 'digital' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/connector/hdmi-c=
onnector.yaml#
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: scm-=
conf@100000: 'syscon@18090' does not match any of the regexes: '^chipid@[0-=
9a-f]+$', '^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'ph=
y@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-c=
ontroller.yaml#
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: sysc=
on@18090: compatible:0: 'ti,j721e-acspcie-proxy-ctrl' is not one of ['al,al=
pine-sysfabric-service', 'allwinner,sun8i-a83t-system-controller', 'allwinn=
er,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'a=
llwinner,sun50i-a64-system-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd=
,pensando-elba-syscon', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootro=
m', 'amlogic,meson8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic,mes=
on8-pmu', 'amlogic,meson8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustan=
g-poweroff-mailbox', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', '=
apm,xgene-rb', 'apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-i=
o', 'atmel,sama5d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'b=
rcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'c=
irrus,ep7209-syscon2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom=
,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeu=
pmix-syscfg', 'fsl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpuc=
fg', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04=
-ppe', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sys=
reg', 'loongson,ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', '=
marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,armada=
-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'marvell,dove-global-conf=
ig', 'mediatek,mt2701-pctl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'med=
iatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,=
mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-sy=
scfg', 'microchip,lan966x-cpu-syscon', 'microchip,sam9x60-sfr', 'microchip,=
sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoto=
n,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036=
-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos',=
 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rock=
chip,rk3568-qos', 'rockchip,rk3576-qos', 'rockchip,rk3588-qos', 'rockchip,r=
v1126-qos', 'st,spear1340-misc', 'stericsson,nomadik-pmu', 'starfive,jh7100=
-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-usb-phy-ctrl', 'ti,am625-dss=
-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,j784s4-pcie-ctrl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: dss@=
4a00000: ports: {'#size-cells': 0, '#address-cells': 1, 'phandle': 334, 'po=
rt@1': {'reg': [[1]], 'endpoint': {'phandle': 427, 'remote-endpoint': [[431=
]]}}, 'port': {'endpoint': {'remote-endpoint': [[109]], 'phandle': 107}}} i=
s valid under each of {'required': ['#address-cells', '#size-cells']}, {'re=
quired': ['port']}
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,j721e-dss.=
yaml#
--
   arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtb: scm-conf@100000: 'sysc=
on@18090' does not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-=
controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pi=
nctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-c=
ontroller.yaml#
>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtb: syscon@18090: compatib=
le:0: 'ti,j721e-acspcie-proxy-ctrl' is not one of ['al,alpine-sysfabric-ser=
vice', 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system=
-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a6=
4-system-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-sys=
con', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson=
8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic=
,meson8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox=
', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'ap=
m,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3=
-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', '=
brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-sysco=
n2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-co=
ntroller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl=
,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,ds=
a-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,=
pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls=
1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-370=
0-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marve=
ll,armada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2=
701-pctl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-=
pmic-syscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-sysc=
fg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,=
lan966x-cpu-syscon', 'microchip,sam9x60-sfr', 'microchip,sama7g5-ddr3phy', =
'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nu=
voton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,r=
k3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-=
qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', =
'rockchip,rk3576-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', 'st,sp=
ear1340-misc', 'stericsson,nomadik-pmu', 'starfive,jh7100-sysmain', 'ti,am6=
2-opp-efuse-table', 'ti,am62-usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 't=
i,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti,j784s4-pcie-ctrl'=
, 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
   arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: scm-conf@100000=
: 'syscon@18090' does not match any of the regexes: '^chipid@[0-9a-f]+$', '=
^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+=
$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-c=
ontroller.yaml#
>> arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: syscon@18090: c=
ompatible:0: 'ti,j721e-acspcie-proxy-ctrl' is not one of ['al,alpine-sysfab=
ric-service', 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3=
-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,su=
n50i-a64-system-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-e=
lba-syscon', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogi=
c,meson8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', '=
amlogic,meson8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-=
mailbox', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-r=
b', 'apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,=
sama5d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clk=
set', 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep720=
9-syscon2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-sy=
stem-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg=
', 'fsl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisil=
icon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'his=
ilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loon=
gson,ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,arm=
ada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs',=
 'marvell,armada-3700-usb2-host-misc', 'marvell,dove-global-config', 'media=
tek,mt2701-pctl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt639=
7-pctl-pmic-syscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl=
-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'mic=
rochip,lan966x-cpu-syscon', 'microchip,sam9x60-sfr', 'microchip,sama7g5-ddr=
3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sy=
s', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'roc=
kchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,=
rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568=
-qos', 'rockchip,rk3576-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos',=
 'st,spear1340-misc', 'stericsson,nomadik-pmu', 'starfive,jh7100-sysmain', =
'ti,am62-opp-efuse-table', 'ti,am62-usb-phy-ctrl', 'ti,am625-dss-oldi-io-ct=
rl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti,j784s4-pci=
e-ctrl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: imx219-0@10: 'V=
ANA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: imx219-0@10: 'V=
DIG-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: imx219-0@10: 'V=
DDL-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: imx219-0@10: 'c=
lock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: imx219-1@10: 'V=
ANA-supply' is a required property
--
   arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: scm-conf@100000: 'syscon@18090'=
 does not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controlle=
r@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-=
9]+'
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-c=
ontroller.yaml#
>> arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: syscon@18090: compatible:0: 'ti=
,j721e-acspcie-proxy-ctrl' is not one of ['al,alpine-sysfabric-service', 'a=
llwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controll=
er', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-=
controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', 'am=
logic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-analog-=
top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson8b-=
pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'apm,x=
gene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgene-s=
cu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu', =
'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,sr-c=
dru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', 'cir=
rus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controller'=
, 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls1088a-=
reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subctrl=
', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-sas-=
subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-syscon=
', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-mis=
c', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,armada=
-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pctl-=
a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-sysc=
fg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'med=
iatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-c=
pu-syscon', 'microchip,sam9x60-sfr', 'microchip,sama7g5-ddr3phy', 'mscc,oce=
lot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpc=
m450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos=
', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'ro=
ckchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockchip=
,rk3576-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-m=
isc', 'stericsson,nomadik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efu=
se-table', 'ti,am62-usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-c=
psw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,key=
stone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: serdes@5000000: phy@1:cdns,phy-=
type: 9 is not one of [2, 4]
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-sierra.y=
aml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
