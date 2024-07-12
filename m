Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4712638DD9
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jul 2024 23:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720828378; cv=none; b=LYMWkrBBdg/fQBuwSBCxQ1NHGT20TXJCeMFaFlQUreJ9C8iYf/EMueYs+s79g5OZUb3EF8uofnD0C8SoN/MeGSwynsHptaT1J2qMPYNtcODU6zeGyD86KedXugPVvPsKaTmE74FLXi7sFojaUXdyVcdZeGLadeVR6zmUD1xsvF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720828378; c=relaxed/simple;
	bh=4HfMEwcHK8/DXQLbdnFSHRuJx49n42zaEjFhEz56NHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dDDLvzoWdnZSVl0GescixjMz67VMAwnv850cf3gm2AxJ54KhS4mMAzHO5NDtqDkFnFvqeebJh+wRooIvGx9v5e5fG3kuiy/8rYPkH42O3atDLu3J42ig5+FT1wfHa1656D6uUPUO94yuWKto/YTB+r3g7ZBu4E17aR2SzVGxQkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTF9yfdx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTF9yfdx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720828375; x=1752364375;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4HfMEwcHK8/DXQLbdnFSHRuJx49n42zaEjFhEz56NHA=;
  b=bTF9yfdxaxlNh7dFcbfNxCKqrTe/kkLs61wxu249L9GqFmWx0bFoy9ht
   DiPd0iQun2PnSJT/4hFXpyP2SRac9htVjCfTupvGABlFYHklCYjvCHt90
   IqYIbTYTWmEeMnxyXp9kSywilEF38p2+viGfPDPCWXwXjoYRKbiUePwES
   X4P+y7p5jHmE+xj7Y53i+/iqWe9gfCeLyCUMiGaU3pj/yGD1aYZFOUAN8
   sAZjfKFURLRJI9X9/L4xo0TAnV16B5qUJR/W5lmoNpy9BPi4B785aQi7Q
   EKv2EYdjNWUxIeLsdmMVglLR+GbiJrSjuk88saXRioQviRnY+crSy09KR
   g==;
X-CSE-ConnectionGUID: F0RTjyOMQDaZjNGmhkvxiQ==
X-CSE-MsgGUID: PkG9fTVoRTqu1lhvrr0ozQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18404765"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="18404765"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 16:52:55 -0700
X-CSE-ConnectionGUID: wlViWAfoSNuf97XZFawfyA==
X-CSE-MsgGUID: wbAyjWmwQeeJ4/5Ubf95jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="54241313"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jul 2024 16:52:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSQ4I-000bSg-36;
	Fri, 12 Jul 2024 23:52:50 +0000
Date: Sat, 13 Jul 2024 07:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [freescale-fslc:6.6-2.0.x-imx 2607/11383]
 arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/i2c@11009000/gpio@20:
 failed to match any schema with compatible: ['ti,tca6416']
Message-ID: <202407130715.dx1a7Wyo-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Otavio Salvador <otavio@ossystems.com.br>

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   a9adc0280d6e8fde5718caf259e89692ba67a9ea
commit: 5c8cf515d45b79e8a788443c1446204e742a1549 [2607/11383] MLK-19251-01 =
gpio: max732x: add output IO default voltage set
:::::: branch date: 31 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-051-20240712 (https://download.01.org/0day-ci/arch=
ive/20240713/202407130715.dx1a7Wyo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240713/202407130715.dx1a7Wyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407130715.dx1a7Wyo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/timer@10008000: fa=
iled to match any schema with compatible: ['mediatek,mt8516-timer', 'mediat=
ek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/timer@10008000: fa=
iled to match any schema with compatible: ['mediatek,mt8516-timer', 'mediat=
ek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: syscfg-pctl@10005000: c=
ompatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: pinctrl@1000b000: 'ethe=
rnet', 'gpiodefault', 'i2c0', 'i2c2' do not match any of the regexes: 'pinc=
trl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/interrupt-controll=
er@10200620: failed to match any schema with compatible: ['mediatek,mt8516-=
sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/interrupt-controll=
er@10200620: failed to match any schema with compatible: ['mediatek,mt8516-=
sysirq', 'mediatek,mt6577-sysirq']
>> arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/i2c@11009000/gpio@=
20: failed to match any schema with compatible: ['ti,tca6416']
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/syscon@15000000: f=
ailed to match any schema with compatible: ['mediatek,mt8167-imgsys', 'sysc=
on']
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/syscon@16000000: f=
ailed to match any schema with compatible: ['mediatek,mt8167-vdecsys', 'sys=
con']
--
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: /soc/timer@10008000: fa=
iled to match any schema with compatible: ['mediatek,mt8516-timer', 'mediat=
ek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: /soc/timer@10008000: fa=
iled to match any schema with compatible: ['mediatek,mt8516-timer', 'mediat=
ek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: syscfg-pctl@10005000: c=
ompatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: pinctrl@1000b000: 'ethe=
rnet', 'gpiodefault', 'i2c0', 'i2c2' do not match any of the regexes: 'pinc=
trl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: /soc/interrupt-controll=
er@10200620: failed to match any schema with compatible: ['mediatek,mt8516-=
sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: /soc/interrupt-controll=
er@10200620: failed to match any schema with compatible: ['mediatek,mt8516-=
sysirq', 'mediatek,mt6577-sysirq']
>> arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: /soc/i2c@11009000/gpio@=
20: failed to match any schema with compatible: ['ti,tca6416']
--
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /pcie@1003000: faile=
d to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tse=
c@54100000: failed to match any schema with compatible: ['nvidia,tegra210-t=
sec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tse=
c@54500000: failed to match any schema with compatible: ['nvidia,tegra210-t=
sec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /gpu@57000000: faile=
d to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /interrupt-controlle=
r@60004000: failed to match any schema with compatible: ['nvidia,tegra210-i=
ctlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: faile=
d to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,t=
egra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: faile=
d to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,t=
egra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /i2c@7000c400/gpio@7=
4: failed to match any schema with compatible: ['ti,tca9539']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /i2c@7000c400/gpio@7=
7: failed to match any schema with compatible: ['ti,tca9539']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /i2c@7000d000/pmic@3=
c: failed to match any schema with compatible: ['maxim,max77620']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmc@7000e400: powerg=
ates:sor:clocks: [[3, 182], [3, 183], [3, 144], [3, 145], [3, 146], [3, 48]=
, [3, 82], [3, 181], [3, 207], [3, 56]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20=
-pmc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmc@7000e400: 'pinmu=
x' does not match any of the regexes: '^[a-f0-9]+-[a-f0-9]+$', 'pinctrl-[0-=
9]+'
   	from schema $id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20=
-pmc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /memory-controller@7=
0019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: external-memory-cont=
roller@7001b000: '#cooling-cells' does not match any of the regexes: 'pinct=
rl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidi=
a,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /clock@70110000: fai=
led to match any schema with compatible: ['nvidia,tegra210-dfll']
--
>> arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb: /soc/i2c@e6500000/gpio@2=
0: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb: hdmi@39: 'avdd-supply' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb: hdmi@39: 'dvdd-supply' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb: hdmi@39: 'pvdd-supply' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb: hdmi@39: 'dvdd-3v-supply=
' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb: hdmi@39: 'bgvdd-supply' =
is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77980-condor.dtb: /soc/i2c@e6500000/gpio@=
20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a77980-condor.dtb: /soc/i2c@e6500000/gpio@=
21: failed to match any schema with compatible: ['onnn,pca9654']
--
>> arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dtb: /soc/i2c@e6500000/gp=
io@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dtb: /soc/i2c@e6500000/gp=
io@21: failed to match any schema with compatible: ['onnn,pca9654']
--
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: /soc/i2c@e6500000/gpio@2=
0: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: hdmi-encoder@39: 'avdd-s=
upply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: hdmi-encoder@39: 'dvdd-s=
upply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: hdmi-encoder@39: 'pvdd-s=
upply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: hdmi-encoder@39: 'dvdd-3=
v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: hdmi-encoder@39: 'bgvdd-=
supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
--
   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi:328.10-338.6: Warning (gr=
aph_child_address): /bus@f0000/i2c@20000000/tps6598x@3f/connector/ports: gr=
aph node has single child node 'port@0', #address-cells/#size-cells are not=
 necessary
   arch/arm64/boot/dts/ti/k3-am62-main.dtsi:608.22-616.5: Warning (graph_ch=
ild_address): /bus@f0000/dwc3-usb@f900000/usb@31000000: graph node has sing=
le child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: syscon@43000000: compatible: ['s=
yscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: syscon@100000: compatible: ['sys=
con', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /bus@f0000/i2c@20010000/gpio@22:=
 failed to match any schema with compatible: ['ti,tca6424']
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: syscon@43000000:=
 compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: syscon@100000: c=
ompatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /bus@f0000/i2c@2=
0010000/gpio@21: failed to match any schema with compatible: ['nxp,pcal6416=
']
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: syscon@43000000: co=
mpatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: syscon@100000: comp=
atible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /bus@f0000/i2c@2001=
0000/gpio@21: failed to match any schema with compatible: ['nxp,pcal6416']
--
   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi:328.10-338.6: Warning (gr=
aph_child_address): /bus@f0000/i2c@20000000/tps6598x@3f/connector/ports: gr=
aph node has single child node 'port@0', #address-cells/#size-cells are not=
 necessary
   arch/arm64/boot/dts/ti/k3-am62-main.dtsi:608.22-616.5: Warning (graph_ch=
ild_address): /bus@f0000/dwc3-usb@f900000/usb@31000000: graph node has sing=
le child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: syscon@43000000: compatible: [=
'syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: syscon@100000: compatible: ['s=
yscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /bus@f0000/i2c@20010000/gpio@2=
2: failed to match any schema with compatible: ['ti,tca6424']
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /bus@f0000/i2c@20010000/gpio@2=
3: failed to match any schema with compatible: ['ti,tca6424']
--
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /bus@f0000/i2c@20010000/gpio@22=
: failed to match any schema with compatible: ['ti,tca6424']
--
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: syscon@43000000: 'mux-controlle=
r' does not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-control=
ler@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[=
0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-cont=
roller.yaml#
>> arch/arm64/boot/dts/ti/k3-am642-evm.dtb: /bus@f4000/i2c@20010000/gpio@22=
: failed to match any schema with compatible: ['ti,tca6424']
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: tscadc@28001000: 'dmas' is a re=
quired property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,am3359-tscadc.yam=
l#
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: tscadc@28001000: 'dma-names' is=
 a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,am3359-tscadc.yam=
l#
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: adc: 'ti,adc-channels' is a req=
uired property
   	from schema $id: http://devicetree.org/schemas/iio/adc/ti,am3359-adc.ya=
ml#
--
   arch/arm64/boot/dts/ti/k3-am642-sk.dtb: syscon@43000000: 'mux-controller=
' does not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controll=
er@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0=
-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-cont=
roller.yaml#
>> arch/arm64/boot/dts/ti/k3-am642-sk.dtb: /bus@f4000/i2c@20010000/gpio@70:=
 failed to match any schema with compatible: ['nxp,pca9538']
--
   arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi:281.20-319.4: Warning (unit_addr=
ess_vs_reg): /bus@100000/bus@28380000/bus@47000000: node has a unit name, b=
ut no reg or ranges property
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: scm-conf@40f00000: c=
ompatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: /bus@100000/bus@2838=
0000/i2c@40b00000/gpio@20: failed to match any schema with compatible: ['nx=
p,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: /bus@100000/bus@2838=
0000/i2c@40b00000/gpio@21: failed to match any schema with compatible: ['nx=
p,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: /bus@100000/bus@2838=
0000/i2c@40b00000/gpio@25: failed to match any schema with compatible: ['nx=
p,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: scm-conf@100000: com=
patible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: clock@4080: compatib=
le: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: clock@4090: compatib=
le: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
--
   arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi:281.20-319.4: Warning (unit_addr=
ess_vs_reg): /bus@100000/bus@28380000/bus@47000000: node has a unit name, b=
ut no reg or ranges property
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: scm-conf@40f0000=
0: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: /bus@100000/bus@=
28380000/i2c@40b00000/gpio@20: failed to match any schema with compatible: =
['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: /bus@100000/bus@=
28380000/i2c@40b00000/gpio@21: failed to match any schema with compatible: =
['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: /bus@100000/bus@=
28380000/i2c@40b00000/gpio@25: failed to match any schema with compatible: =
['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: scm-conf@100000:=
 compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: clock@4080: comp=
atible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: clock@4090: comp=
atible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
--
   arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi:281.20-319.4: Warning (unit_addr=
ess_vs_reg): /bus@100000/bus@28380000/bus@47000000: node has a unit name, b=
ut no reg or ranges property
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: scm-conf@40f00000=
: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: /bus@100000/bus@2=
8380000/i2c@40b00000/gpio@20: failed to match any schema with compatible: [=
'nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: /bus@100000/bus@2=
8380000/i2c@40b00000/gpio@21: failed to match any schema with compatible: [=
'nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: /bus@100000/bus@2=
8380000/i2c@40b00000/gpio@25: failed to match any schema with compatible: [=
'nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: scm-conf@100000: =
compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: clock@4080: compa=
tible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: clock@4090: compa=
tible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
--
   arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi:281.20-319.4: Warning (unit_addr=
ess_vs_reg): /bus@100000/bus@28380000/bus@47000000: node has a unit name, b=
ut no reg or ranges property
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: scm-conf@40f00=
000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: /bus@100000/bu=
s@28380000/i2c@40b00000/gpio@20: failed to match any schema with compatible=
: ['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: /bus@100000/bu=
s@28380000/i2c@40b00000/gpio@21: failed to match any schema with compatible=
: ['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: /bus@100000/bu=
s@28380000/i2c@40b00000/gpio@25: failed to match any schema with compatible=
: ['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: scm-conf@10000=
0: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: clock@4080: co=
mpatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: clock@4090: co=
mpatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
--
   arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi:281.20-319.4: Warning (unit_addr=
ess_vs_reg): /bus@100000/bus@28380000/bus@47000000: node has a unit name, b=
ut no reg or ranges property
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: scm-conf@40f0=
0000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: /bus@100000/b=
us@28380000/i2c@40b00000/gpio@20: failed to match any schema with compatibl=
e: ['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: /bus@100000/b=
us@28380000/i2c@40b00000/gpio@21: failed to match any schema with compatibl=
e: ['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: /bus@100000/b=
us@28380000/i2c@40b00000/gpio@25: failed to match any schema with compatibl=
e: ['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: scm-conf@1000=
00: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: clock@4080: c=
ompatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: clock@4090: c=
ompatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
--
   arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi:281.20-319.4: Warning (unit_addr=
ess_vs_reg): /bus@100000/bus@28380000/bus@47000000: node has a unit name, b=
ut no reg or ranges property
>> arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: /bus@100000/bus@28380000=
/bus@42040000/i2c@42120000/gpio@39: failed to match any schema with compati=
ble: ['nxp,pca9554']
   arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: scm-conf@40f00000: compa=
tible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: /bus@100000/i2c@2000000/=
gpio@21: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: scm-conf@100000: compati=
ble: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: clock@4080: compatible: =
'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: clock@4090: compatible: =
'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi:35.39-40.5: Warning (unit_addr=
ess_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4080: node has a un=
it name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi:49.39-53.5: Warning (unit_addr=
ess_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4000: node has a un=
it name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: syscon@40f00000: =
compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: syscon@47000000: =
compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: hbmc-mux: $nodena=
me:0: 'hbmc-mux' does not match '^mux-controller(@.*|-[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml#
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/i2c@2=
000000/gpio@21: failed to match any schema with compatible: ['ti,tca6408']
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/i2c@2=
000000/gpio@20: failed to match any schema with compatible: ['ti,tca6416']
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/i2c@2=
000000/gpio@22: failed to match any schema with compatible: ['ti,tca6424']
   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/i2c@2=
010000/gpio@20: failed to match any schema with compatible: ['ti,tca6408']
--
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:72.39-77.5: Warning (unit_addr=
ess_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4000: node has a un=
it name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: syscon@40f00000: =
compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: /bus@100000/i2c@2=
000000/gpio@20: failed to match any schema with compatible: ['ti,tca6416']
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: /bus@100000/i2c@2=
000000/gpio@22: failed to match any schema with compatible: ['ti,tca6424']
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: /bus@100000/i2c@2=
010000/gpio@20: failed to match any schema with compatible: ['ti,tca6408']
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: /bus@100000/i2c@2=
030000/gpio@20: failed to match any schema with compatible: ['ti,tca6408']
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: /bus@100000/i2c@2=
060000/gpio@20: failed to match any schema with compatible: ['ti,tca6408']
--
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: syscon@40f00000: compa=
tible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: /bus@100000/bus@283800=
00/i2c@40b10000/gpio@20: failed to match any schema with compatible: ['ti,t=
ca6408']
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: /bus@100000/i2c@200000=
0/gpio@21: failed to match any schema with compatible: ['ti,tca6416']
--
   arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: syscon@40f00000:=
 compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: /bus@100000/i2c@=
2000000/gpio@21: failed to match any schema with compatible: ['ti,tca6408']
>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: /bus@100000/i2c@=
2000000/gpio@20: failed to match any schema with compatible: ['ti,tca6416']
>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: /bus@100000/i2c@=
2000000/gpio@22: failed to match any schema with compatible: ['ti,tca6424']
--
>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: /bus@100000/i2c@2000000/gpio@21: =
failed to match any schema with compatible: ['ti,tca6416']
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: /bus@100000/i2c@2000000/gpio@2=
0: failed to match any schema with compatible: ['ti,tca6416']
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: /bus@100000/i2c@2000000/gpio@2=
2: failed to match any schema with compatible: ['ti,tca6424']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
