Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66505262A6
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 19:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766778872; cv=none; b=T0NHmB0pvqA8vjeiK89ynMRy7IadhD0xLm3ccgoq4Z51k+Uafh8aycQJYIwdIE6bEab2ITJdQ2njqH9N5uJ9k/DNO95h8PQtvwxIG7KB+0G2nZztS1CzwRS0GQkArce+AuMFjr2+4TVvU/+0S2Uf/EXhzbF0MbTq0AjmN0SWVWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766778872; c=relaxed/simple;
	bh=ExP6iKhDYXcFnpSkc5jEoyEpcuCVaRMd86vI8gY75js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K+WxtpYBxSGGgjuKCnWgTREkuDlZ8e2yARSaogyVq/AlkGfORkrNZwThdUvM0WIejmhXie//mi2zwz3iBUqdsU9PZNuqiaKTaz+82aPt9K1hMUscCBjjwkFg6UMT3vYvxzwEXW3dGZh7G1jbiUIwdez7rb1c5oASho1LaEwN3/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Grl/lwQw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Grl/lwQw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766778871; x=1798314871;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ExP6iKhDYXcFnpSkc5jEoyEpcuCVaRMd86vI8gY75js=;
  b=Grl/lwQwgdaJnF84ksZ3RB3k9h+Ct+kup2nXYNJycRUtt4xRHW2+RxPd
   nrGKVzlsFVmgx7yFimOGAScPeRPVlCMoTJCf2BSaRUYEsiwjxu/pDKiwB
   a2q7s8715pNN/D1KL8g6VQ/GdiRX8wDVoRr/BSoB5KkIg3qAbhxrQY3Tz
   dDlHhjXqT2V4VNvx4bKTBNHINbDre+QDp+moaKma+uX7gKAZK51hdP60H
   tcsdArLIHsV7aBFyr+Hn7L9Q6MXGqjeurKjjmRpxEpQrVFf9cG3ZxEEaW
   SocNNRPylTn/0a/C+dgQ1NMUn86JCHnRP2gnBghYie4Bro+s0U9+guO3g
   A==;
X-CSE-ConnectionGUID: QjI0A7dkTfS6Ik6NtxWvCw==
X-CSE-MsgGUID: QrrIRWKgTcix0CWgO7E3ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68568850"
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="68568850"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 11:54:30 -0800
X-CSE-ConnectionGUID: 4cFKz+MSTGqLycXGl2Elxw==
X-CSE-MsgGUID: 1gdeJrw0SCGTGAOWZ4c17g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="200353944"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Dec 2025 11:54:28 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZDtK-000000006yq-1rAB;
	Fri, 26 Dec 2025 19:54:26 +0000
Date: Fri, 26 Dec 2025 20:53:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 2/8] arm64: dts: mediatek: mt7981b: Add PCIe and USB
 support
Message-ID: <202512262001.e4FBk2nD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251223-openwrt-one-network-v5-2-7d1864ea3ad5@collabora.com>
References: <20251223-openwrt-one-network-v5-2-7d1864ea3ad5@collabora.com>
TO: Sjoerd Simons <sjoerd@collabora.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Ryder Lee <ryder.lee@mediatek.com>
TO: Jianjun Wang <jianjun.wang@mediatek.com>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczy=C5=84ski" <kwilczynski@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Chunfeng Yun <chunfeng.yun@mediatek.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Lee Jones <lee@kernel.org>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Lorenzo Bianconi <lorenzo@kernel.org>
TO: Felix Fietkau <nbd@nbd.name>
CC: kernel@collabora.com
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: linux-pci@vger.kernel.org
CC: linux-phy@lists.infradead.org

Hi Sjoerd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b927546677c876e26eba308550207c2ddf812a43]

url:    https://github.com/intel-lab-lkp/linux/commits/Sjoerd-Simons/dt-bin=
dings-PCI-mediatek-gen3-Add-MT7981-PCIe-compatible/20251223-204212
base:   b927546677c876e26eba308550207c2ddf812a43
patch link:    https://lore.kernel.org/r/20251223-openwrt-one-network-v5-2-=
7d1864ea3ad5%40collabora.com
patch subject: [PATCH v5 2/8] arm64: dts: mediatek: mt7981b: Add PCIe and U=
SB support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2052-20251224 (https://download.01.org/0day-ci/arc=
hive/20251226/202512262001.e4FBk2nD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251226/202512262001.e4FBk2nD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512262001.e4FBk2nD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: topmisc@11d1000=
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
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts:111.10-160.4: Warni=
ng (avoid_unnecessary_addr_size): /soc/spi@11009000/flash@0: unnecessary #a=
ddress-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "=
ranges" property
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: topmisc@11d10000 (=
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
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: topmisc@11d1000=
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

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
