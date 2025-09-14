Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7641018E1F
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Sep 2025 19:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757879676; cv=none; b=ho7R5jz7uUmCS7Vtf2HFMqm9Wt3K8Bv2Xw45xRFyZU5GPA/bKatjabDxivlU9jJfdkw82BVpl70upqb9cVZThoCpO0cHfZsNLttGxlfbqZp9utpsL5b04q2ZImML1+CV3jYhvYjwEeoIpFD1kz4f0KpEpnlhZsFBYXOvvY0q/Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757879676; c=relaxed/simple;
	bh=snHwzYrXkl3DTvMkwYVaYUKF0rlkkLEhFonztECP7TA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fLkJhfAFzCGm/taAUnYeB6xXgWd/rUCEO+6mvfME/Xhmcbf6tmXcTFusu8uNhKnouDx0V95VG4DT/+3Kc+/05ZSLfZjKdBwecUvVHhbTvSJFPIyqkgIZMf2VrU9mbzmv9B6Dp/OtEKHylITxA/s6DPRiAAS2CI4IZ5QZcUBjiqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNhpNsQX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNhpNsQX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757879674; x=1789415674;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=snHwzYrXkl3DTvMkwYVaYUKF0rlkkLEhFonztECP7TA=;
  b=aNhpNsQXtCe8mXRvbXBjgZ7KoFcPwYT+b0RK98Qc2pJCzo7L3MCpNyT/
   KHVxJVBbNjASSBDgZnz/17tZM6TdNMEcGq5hC6vZZg9dHU3SWw2tFkXak
   UkjttKSc1bHQLP8oQAa2h+mRSRPRTdpGzKFmUnObr8THIk8AD7Z/Mq6xu
   sB0sIyChL02HUSAiHIentsWFdJbO+9xxw5ED+hO6N9i8RpTZ+mXc47R6z
   rcm33rSOsUEN9cGZteQB11YL/r/KlbParHs2JEfEHBNOLhnFgtiwbIBdc
   VK22rdDxEYmIRf9H/NIL9I/RMjJA6EVrbtG+CcltfSU6Y0atOixtdYIzu
   A==;
X-CSE-ConnectionGUID: 1/eNXFP3QFS7Hg41934eVA==
X-CSE-MsgGUID: TxLh7xgGTeqCrzLz0S7smw==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60008289"
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="60008289"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 12:54:33 -0700
X-CSE-ConnectionGUID: XQR92vdFTV22Gt+5I3TDkQ==
X-CSE-MsgGUID: 6wbRgGj7QNmGOs+te7RASw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="174831934"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 14 Sep 2025 12:54:32 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxsnu-0002fw-1k;
	Sun, 14 Sep 2025 19:54:30 +0000
Date: Mon, 15 Sep 2025 03:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] ARM: dts: at91: sama7g5ek: add
 microchip,lpm-connection on shdwc node
Message-ID: <202509150218.vFtCP64c-lkp@intel.com>
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
In-Reply-To: <ded286a183a5111d8165727111577b088f5d67f3.1757519351.git.Ryan.=
Wanner@microchip.com>
References: <ded286a183a5111d8165727111577b088f5d67f3.1757519351.git.Ryan.W=
anner@microchip.com>
TO: Ryan.Wanner@microchip.com
TO: claudiu.beznea@tuxon.dev
TO: sre@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: nicolas.ferre@microchip.com
TO: alexandre.belloni@bootlin.com
TO: linux@armlinux.org.uk
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on sre-power-supply/for-next robh/for-next cbeznea=
/tests linus/master v6.17-rc5 next-20250912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Wanner-microchi=
p-com/dt-bindings-power-reset-atmel-sama5d2-shdwc-add-lpm-binding/20250911-=
002354
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/ded286a183a5111d8165727111577b088f=
5d67f3.1757519351.git.Ryan.Wanner%40microchip.com
patch subject: [PATCH 4/4] ARM: dts: at91: sama7g5ek: add microchip,lpm-con=
nection on shdwc node
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-051-20250911 (https://download.01.org/0day-ci/archiv=
e/20250915/202509150218.vFtCP64c-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250915/202509150218.vFtCP64c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509150218.vFtCP64c-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/sram@e0000000: fail=
ed to match any schema with compatible: ['microchip,sama7g5-securam', 'atme=
l,sama5d2-securam', 'mmio-sram']
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/sfr@e0008000: faile=
d to match any schema with compatible: ['microchip,sama7g5-sfrbu', 'atmel,s=
ama5d2-sfrbu', 'syscon']
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: sfr@e0008000 (microchip,=
sama7g5-sfrbu): compatible:0: 'microchip,sama7g5-sfrbu' is not one of ['air=
oha,en7581-pbus-csr', 'al,alpine-sysfabric-service', 'allwinner,sun8i-a83t-=
system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8=
i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'altr,l=
3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', 'amlogic,meson-mx-assis=
t', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-analog-top', 'amlogic,meson=
8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson8b-pmu', 'apm,merlin-po=
weroff-mailbox', 'apm,mustang-poweroff-mailbox', 'apm,xgene-csw', 'apm,xgen=
e-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgene-scu', 'atmel,sama5d2-=
sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu', 'atmel,sama5d4-sfrbu=
', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb',=
 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', 'cirrus,ep7209-syscon3',=
 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-=
ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'fsl,vf610-a=
natop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220=
-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-sas-subctrl', 'hisilicon=
,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-syscon', 'loongson,ls1c-sy=
scon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-=
3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc=
', 'marvell,dove-global-config', 'mediatek,mt2701-pctl-a-syscfg', 'mediatek=
,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt798=
8-topmisc', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg=
', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-infracfg-nao', 'mediat=
ek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,mpfs-sysreg-s=
cb', 'microchip,sam9x60-sfr', 'microchip,sama7d65-ddr3phy', 'microchip,sama=
7d65-sfrbu', 'microchip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,=
msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'qcom,apq8064=
-mmss-sfpb', 'qcom,apq8064-sps-sic', 'rockchip,px30-qos', 'rockchip,rk3036-=
qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', =
'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockc=
hip,rk3528-qos', 'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk=
3576-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc=
', 'stericsson,nomadik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-=
table', 'ti,am62-usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw=
-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', '=
ti,j784s4-pcie-ctrl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: sfr@e0008000 (microchip,=
sama7g5-sfrbu): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: sfr@e0008000 (microchip,=
sama7g5-sfrbu): compatible: ['microchip,sama7g5-sfrbu', 'atmel,sama5d2-sfrb=
u', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/pinctrl@e0014000: f=
ailed to match any schema with compatible: ['microchip,sama7g5-pinctrl']
>> arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: poweroff@e001d010 (micro=
chip,sama7g5-shdwc): microchip,lpm-connection:0: [18, 17] is too long
   	from schema $id: http://devicetree.org/schemas/power/reset/atmel,sama5d=
2-shdwc.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/gpbr@e001d060: fail=
ed to match any schema with compatible: ['microchip,sama7g5-gpbr', 'syscon']
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: rtc@e001d0a8 (microchip,=
sama7g5-rtc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7g5-rtc', 'microchip,sam9x60-rtc'] is too long
   	'microchip,sama7g5-rtc' is not one of ['microchip,sam9x7-rtc', 'microch=
ip,sama7d65-rtc']
   	from schema $id: http://devicetree.org/schemas/rtc/atmel,at91rm9200-rtc=
=2Eyaml#
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: watchdog@e001d180 (micro=
chip,sama7g5-wdt): Unevaluated properties are not allowed ('clocks' was une=
xpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-w=
dt.yaml#
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/chipid@e0020000: fa=
iled to match any schema with compatible: ['microchip,sama7g5-chipid']
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e0800000 (atmel,sa=
ma5d2-tcb): clock-names:1: 'gclk' was expected

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
