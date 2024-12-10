Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109FA226ED8
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 05:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733808232; cv=none; b=SOo1WC3TZ6gwvMYoeig7wwvpbRxKK6ZnYiPO26f8gIudbmmp9D+hTu6y3qLsg+yTCBKj58iJ/KmZxrR7Zd4vBYhEgHCvfk4U4Th4BQWSW6oqoIB/ojRWnmC34HpuSn7PWgs2XnHSJNYd9xh1TXKLYclZQrX2d1cfT5uOrG8tNw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733808232; c=relaxed/simple;
	bh=Tw2I0qJvHHIIJ7cLKkmX11g/GKPLwdGB3UrtmW520Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RKk3ltunjPPce3+/8VuOz9mQl1oRSHHPmsj8oW0QSK4xrKAw308vo5R9DVEAkI1PIU84zlFd1HA97I/en0DqRJLjQmgUwUSJto3Vc3BhyRcgzizGSJlriYrjU+BJSzGfzZoTHW/vwwPk6HEecevUP8JIWhC3KstylHTPXChWaRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rd/9nY7G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rd/9nY7G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733808230; x=1765344230;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Tw2I0qJvHHIIJ7cLKkmX11g/GKPLwdGB3UrtmW520Sg=;
  b=Rd/9nY7GkmRioqiuUXwq+kwc0+bACbOu4+VlhhGzX8BtSgxsEleI5PfF
   Yg/HWy+XGu5pVtqKwp9B7TwsJOO/iAypUan5MYVlgKrATHaQMwuj2wsCI
   qZPXXQBLKV5kWmN1fDHjEvnQS3fWw6Od74lh1+Jl7iFcVzpNCqNOPnrDd
   TRHM2neNrpTi6jmh/HXl9ktoj++HJgzIvDyCUKE8rtD2ga7ur9hY5lFgq
   8CsKg+Bocd8OvPJMsxd88tH5tjC9fVqUUB5VikdiGOTlDnrKeGMK3mSdD
   UngnBOWD8uejScRq4jadcq/7xBeRCR9r3okFX6s4o3mq/D8ET9KE0gT3M
   Q==;
X-CSE-ConnectionGUID: 2y3cwbvxRuukjDdnTUqS3w==
X-CSE-MsgGUID: Ng8ItA63QJmj/SlvnvXdmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="59530629"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="59530629"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 21:23:47 -0800
X-CSE-ConnectionGUID: f+kXw5j2Rga7PavQyDR/nA==
X-CSE-MsgGUID: NN2uVV2oQcet360Fj9IEeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="95168728"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Dec 2024 21:23:46 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKsil-00058X-1I;
	Tue, 10 Dec 2024 05:23:43 +0000
Date: Tue, 10 Dec 2024 13:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j784s4-j742s2-main-common: Enable
 ACSPCIE output for PCIe1
Message-ID: <202412101243.HkCD2vwD-lkp@intel.com>
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
In-Reply-To: <20241209085157.1203168-1-s-vadapalli@ti.com>
References: <20241209085157.1203168-1-s-vadapalli@ti.com>
TO: Siddharth Vadapalli <s-vadapalli@ti.com>
TO: nm@ti.com
TO: vigneshr@ti.com
TO: kristo@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: srk@ti.com
CC: s-vadapalli@ti.com

Hi Siddharth,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.13-rc2 next-20241209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Siddharth-Vadapalli/=
arm64-dts-ti-k3-j784s4-j742s2-main-common-Enable-ACSPCIE-output-for-PCIe1/2=
0241209-170313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
patch link:    https://lore.kernel.org/r/20241209085157.1203168-1-s-vadapal=
li%40ti.com
patch subject: [PATCH v2] arm64: dts: ti: k3-j784s4-j742s2-main-common: Ena=
ble ACSPCIE output for PCIe1
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-051-20241209 (https://download.01.org/0day-ci/arch=
ive/20241210/202412101243.HkCD2vwD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241210/202412101243.HkCD2vwD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412101243.HkCD2vwD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: clock-controller@1a090: compatibl=
e:0: 'ti,j784s4-acspcie-proxy-ctrl' is not one of ['al,alpine-sysfabric-ser=
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
lan966x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', =
'microchip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmslee=
p', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rock=
chip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockchip,rk3588-qos', =
'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,nomadik-pmu', 'star=
five,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-usb-phy-ctrl', 't=
i,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io=
-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: clock-controller@1a090: compat=
ible:0: 'ti,j784s4-acspcie-proxy-ctrl' is not one of ['al,alpine-sysfabric-=
service', 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-sys=
tem-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i=
-a64-system-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-=
syscon', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,me=
son8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlo=
gic,meson8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mail=
box', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', =
'apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama=
5d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset'=
, 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-sy=
scon2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system=
-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', '=
fsl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon=
,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilic=
on,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson=
,ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-=
3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'ma=
rvell,armada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,=
mt2701-pctl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pc=
tl-pmic-syscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-s=
yscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microch=
ip,lan966x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr=
', 'microchip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pms=
leep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'r=
ockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchi=
p,rk3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk33=
99-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockchip,rk3588-qos=
', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,nomadik-pmu', 's=
tarfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-usb-phy-ctrl',=
 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi=
-io-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: clock-controller@1a090: compat=
ible:0: 'ti,j784s4-acspcie-proxy-ctrl' is not one of ['al,alpine-sysfabric-=
service', 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-sys=
tem-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i=
-a64-system-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-=
syscon', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,me=
son8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlo=
gic,meson8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mail=
box', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', =
'apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama=
5d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset'=
, 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-sy=
scon2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system=
-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', '=
fsl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon=
,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilic=
on,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson=
,ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-=
3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'ma=
rvell,armada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,=
mt2701-pctl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pc=
tl-pmic-syscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-s=
yscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microch=
ip,lan966x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr=
', 'microchip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pms=
leep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'r=
ockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchi=
p,rk3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk33=
99-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockchip,rk3588-qos=
', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,nomadik-pmu', 's=
tarfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-usb-phy-ctrl',=
 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi=
-io-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: clock-controller=
@1a090: compatible:0: 'ti,j784s4-acspcie-proxy-ctrl' is not one of ['al,alp=
ine-sysfabric-service', 'allwinner,sun8i-a83t-system-controller', 'allwinne=
r,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'al=
lwinner,sun50i-a64-system-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,=
pensando-elba-syscon', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom=
', 'amlogic,meson8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic,meso=
n8-pmu', 'amlogic,meson8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang=
-poweroff-mailbox', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'a=
pm,xgene-rb', 'apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io=
', 'atmel,sama5d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'br=
cm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'ci=
rrus,ep7209-syscon2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,=
fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeup=
mix-syscfg', 'fsl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucf=
g', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-=
ppe', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysr=
eg', 'loongson,ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'm=
arvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-=
3700-avs', 'marvell,armada-3700-usb2-host-misc', 'marvell,dove-global-confi=
g', 'mediatek,mt2701-pctl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'medi=
atek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,m=
t8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-sys=
cfg', 'microchip,lan966x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microch=
ip,sam9x60-sfr', 'microchip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'ms=
tar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip=
,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-=
qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', =
'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,no=
madik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-=
usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,=
am654-dss-oldi-io-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: imx219-0@10: 'VA=
NA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: imx219-0@10: 'VD=
IG-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: imx219-0@10: 'VD=
DL-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: imx219-0@10: 'cl=
ock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: imx219-1@10: 'VA=
NA-supply' is a required property
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: clock-controlle=
r@1a090: compatible:0: 'ti,j784s4-acspcie-proxy-ctrl' is not one of ['al,al=
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
scfg', 'microchip,lan966x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microc=
hip,sam9x60-sfr', 'microchip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'm=
star,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchi=
p,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128=
-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos',=
 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rock=
chip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,n=
omadik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62=
-usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti=
,am654-dss-oldi-io-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: clock-contr=
oller@1a090: compatible:0: 'ti,j784s4-acspcie-proxy-ctrl' is not one of ['a=
l,alpine-sysfabric-service', 'allwinner,sun8i-a83t-system-controller', 'all=
winner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller'=
, 'allwinner,sun50i-a64-system-controller', 'altr,l3regs', 'altr,sdr-ctl', =
'amd,pensando-elba-syscon', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-bo=
otrom', 'amlogic,meson8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic=
,meson8-pmu', 'amlogic,meson8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mu=
stang-poweroff-mailbox', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb=
', 'apm,xgene-rb', 'apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-n=
fc-io', 'atmel,sama5d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon'=
, 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1'=
, 'cirrus,ep7209-syscon2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'fre=
ecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-w=
akeupmix-syscfg', 'fsl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-=
cpucfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,h=
ip04-ppe', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp=
-sysreg', 'loongson,ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon=
', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,ar=
mada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'marvell,dove-global-=
config', 'mediatek,mt2701-pctl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', =
'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-pctl-a-syscfg', 'media=
tek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt836=
5-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'mi=
crochip,sam9x60-sfr', 'microchip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon'=
, 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'roc=
kchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk=
3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-q=
os', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', '=
rockchip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericss=
on,nomadik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,=
am62-usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse',=
 'ti,am654-dss-oldi-io-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: clock-contro=
ller@1a090: compatible:0: 'ti,j784s4-acspcie-proxy-ctrl' is not one of ['al=
,alpine-sysfabric-service', 'allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,l3regs', 'altr,sdr-ctl', '=
amd,pensando-elba-syscon', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-boo=
trom', 'amlogic,meson8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic,=
meson8-pmu', 'amlogic,meson8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mus=
tang-poweroff-mailbox', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb'=
, 'apm,xgene-rb', 'apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nf=
c-io', 'atmel,sama5d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon',=
 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1',=
 'cirrus,ep7209-syscon2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'free=
com,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wa=
keupmix-syscfg', 'fsl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-c=
pucfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hi=
p04-ppe', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-=
sysreg', 'loongson,ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon'=
, 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,arm=
ada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'marvell,dove-global-c=
onfig', 'mediatek,mt2701-pctl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', '=
mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediat=
ek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365=
-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'mic=
rochip,sam9x60-sfr', 'microchip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon',=
 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rock=
chip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3=
128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qo=
s', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'r=
ockchip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsso=
n,nomadik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,a=
m62-usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', =
'ti,am654-dss-oldi-io-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: ethernet@c00=
0000: ethernet-ports:port@1:fixed-link: 'oneOf' conditional failed, one mus=
t be fixed:
   	{'full-duplex': True, 'speed': 5000} is not of type 'array'
   	5000 is not one of [10, 100, 1000, 2500, 10000]
   	from schema $id: http://devicetree.org/schemas/net/ti,k3-am654-cpsw-nus=
s.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: ethernet@c00=
0000: ethernet-ports:port@1: Unevaluated properties are not allowed ('fixed=
-link' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/ti,k3-am654-cpsw-nus=
s.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: ethernet@c00=
0000: ethernet-ports:port@2:fixed-link: 'oneOf' conditional failed, one mus=
t be fixed:
   	{'full-duplex': True, 'speed': 5000} is not of type 'array'
   	5000 is not one of [10, 100, 1000, 2500, 10000]

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
