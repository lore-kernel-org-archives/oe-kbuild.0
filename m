Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19AA320A29
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Sep 2025 17:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758301806; cv=none; b=UlYnpUuSf39pcdNQbb9Evarl0AVfQsNx8OjGHr1Z4LT/PMC8V4Ss2WXUMqoqQ/n2OHt7mWYd/BShR02waq4p59JoxgkNvRY6muJOnHlJRsdMy3KSpwOc6CEtlA2gSyfMr5NMDVrBd3MAFfVVdqZQj4Zuz99FYDlXUbgfFo/THng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758301806; c=relaxed/simple;
	bh=g3BM/qJW3f6p7fBizLDtoCvKVNail7f4OS3ZX5ZKZLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sCO0CYmcF4qFPLsZCqaVGA2hw/Jqg0BL7dsEkPM97gsSYVud7qdXWa5TM1ZYD0vxmvDrbmu0kZIRRqIK1qaqkmG6dG6iQGR66qE9UU5YYeJrq5tU93beFYFj1mqiuP++1r8XOtkMKAhdbwM4aIwcwZuJDWaMn/qUxuvPKOY+JHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrNf944j; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrNf944j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758301804; x=1789837804;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=g3BM/qJW3f6p7fBizLDtoCvKVNail7f4OS3ZX5ZKZLw=;
  b=QrNf944jGcU5cwZ3Dp0p1cF2xztcyjnCnmrS90stFSygAiJaKEatpw9r
   vZ6YXHS/9OMAzYpyfoGZkgNtsbGHANWmvSl9xxEvv34E50uXvbDzlMm/b
   Ywob+YvE2aescE9R4ruyIeXV9KgcxYJVaUaDXhI0kIBy1yFO9+tD4Up15
   2C2stCxXYsC8pkAxN5g1bxMCEvXUwP49FBDAg0ivr8BwfujHMYCp+ER5L
   8JNN7B+QvUL3pkWpFzYPHM7Ed4pkp6dhYhTPdrwgAOkp2kiRC1HesOBo6
   F/kHDA0tdtM0ZtodlM3GoJoiq1sNoTfFP+KixkyXDVy5z1Pid6ffHebCl
   A==;
X-CSE-ConnectionGUID: whtQLD42QnW8RKtZtl5A+A==
X-CSE-MsgGUID: iW5L7hioSD2WHdPDl0dntQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60598196"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60598196"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 10:10:03 -0700
X-CSE-ConnectionGUID: AwEqKHcuQEqe1asfst6KHw==
X-CSE-MsgGUID: ysuva/8HReOFfeaxW7QyEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="175805689"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Sep 2025 10:10:01 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzecR-0004Zb-1M;
	Fri, 19 Sep 2025 17:09:59 +0000
Date: Sat, 20 Sep 2025 01:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 24/28]
 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /: failed to match
 any schema with compatible: ['microchip,pic64gx-curiosity-kit',
 'microchip,pic64gx']
Message-ID: <202509200052.XtaDu0Lx-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pin=
ctrl
head:   69c073cdb60f2e13a617eb5db437dd667a4d424d
commit: 602d455f76e62da8ea32334bda5e1938d5819810 [24/28] delete unsupported=
 media stuff
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-052-20250919 (https://download.01.org/0day-ci/arch=
ive/20250920/202509200052.XtaDu0Lx-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250920/202509200052.XtaDu0Lx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509200052.XtaDu0Lx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/microchip/pic64gx.dtsi:473.4-22: Warning (reg_format=
): /soc/pinctrl@f00:reg: property has invalid length (8 bytes) (#address-ce=
lls =3D=3D 2, #size-cells =3D=3D 2)
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: Warning (pci_de=
vice_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: Warning (pci_de=
vice_bus_num): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: Warning (simple=
_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: Warning (i2c_bu=
s_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: Warning (spi_bu=
s_reg): Failed prerequisite 'reg_format'
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /: failed to ma=
tch any schema with compatible: ['microchip,pic64gx-curiosity-kit', 'microc=
hip,pic64gx']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /: failed to ma=
tch any schema with compatible: ['microchip,pic64gx-curiosity-kit', 'microc=
hip,pic64gx']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /syscontroller:=
 failed to match any schema with compatible: ['microchip,pic64gx-sys-contro=
ller']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: soc (simple-bus=
): pinctrl@f00:reg:0: [3840, 4] is too short
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clint@2000000 (=
microchip,pic64gx-clint): compatible: 'oneOf' conditional failed, one must =
be fixed:
   	'microchip,pic64gx-clint' is not one of ['canaan,k210-clint', 'eswin,ei=
c7700-clint', 'sifive,fu540-c000-clint', 'spacemit,k1-clint', 'starfive,jh7=
100-clint', 'starfive,jh7110-clint', 'starfive,jh8100-clint']
   	'microchip,pic64gx-clint' is not one of ['allwinner,sun20i-d1-clint', '=
sophgo,cv1800b-clint', 'sophgo,cv1812h-clint', 'sophgo,sg2002-clint', 'thea=
d,th1520-clint']
   	'sifive,clint0' was expected
   	'sifive,clint2' was expected
   	'thead,c900-clint' was expected
   	'riscv,clint0' was expected
   	from schema $id: http://devicetree.org/schemas/timer/sifive,clint.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/clint@2000=
000: failed to match any schema with compatible: ['microchip,pic64gx-clint'=
, 'sifive,clint0']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/cache-cont=
roller@2010000: failed to match any schema with compatible: ['microchip,pic=
64gx-ccache', 'microchip,mpfs-ccache', 'sifive,fu540-c000-ccache', 'cache']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: cache-controlle=
r@2010000 (microchip,pic64gx-ccache): compatible: 'oneOf' conditional faile=
d, one must be fixed:
   	['microchip,pic64gx-ccache', 'microchip,mpfs-ccache', 'sifive,fu540-c00=
0-ccache', 'cache'] is too long
   	'microchip,pic64gx-ccache' is not one of ['sifive,ccache0', 'sifive,fu5=
40-c000-ccache', 'sifive,fu740-c000-ccache']
   	'microchip,pic64gx-ccache' is not one of ['eswin,eic7700-l3-cache', 'st=
arfive,jh7100-ccache', 'starfive,jh7110-ccache']
   	'microchip,mpfs-ccache' was expected
   	'cache' was expected
   	'sifive,ccache0' was expected
   	'sifive,fu540-c000-ccache' was expected
   	from schema $id: http://devicetree.org/schemas/cache/sifive,ccache0.yam=
l#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: interrupt-contr=
oller@c000000 (microchip,pic64gx-plic): compatible: 'oneOf' conditional fai=
led, one must be fixed:
   	'microchip,pic64gx-plic' is not one of ['renesas,r9a07g043-plic']
   	'microchip,pic64gx-plic' is not one of ['canaan,k210-plic', 'sifive,fu5=
40-c000-plic', 'spacemit,k1-plic', 'starfive,jh7100-plic', 'starfive,jh7110=
-plic']
   	'microchip,pic64gx-plic' is not one of ['allwinner,sun20i-d1-plic', 'so=
phgo,cv1800b-plic', 'sophgo,cv1812h-plic', 'sophgo,sg2002-plic', 'sophgo,sg=
2042-plic', 'sophgo,sg2044-plic', 'thead,th1520-plic']
   	'sifive,plic-1.0.0' was expected
   	'andestech,nceplic100' was expected
   	'thead,c900-plic' was expected
   	'riscv,plic0' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/sif=
ive,plic-1.0.0.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/interrupt-=
controller@c000000: failed to match any schema with compatible: ['microchip=
,pic64gx-plic', 'sifive,plic-1.0.0']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): '#address-cells', '#size-cells', 'inte=
rrupt-controller@54', 'pinctrl@200', 'pinctrl@204' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): compatible:0: 'microchip,mpfs-mss-top-=
sysreg' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): compatible: ['microchip,pic64gx-mss-to=
p-sysreg', 'microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too =
long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@200=
02000: failed to match any schema with compatible: ['microchip,pic64gx-mss-=
top-sysreg', 'microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@200=
02000/interrupt-controller@54: failed to match any schema with compatible: =
['microchip,pic64gx-gpio-irq-mux', 'microchip,mpfs-gpio-irq-mux']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@200=
02000/interrupt-controller@54: failed to match any schema with compatible: =
['microchip,pic64gx-gpio-irq-mux', 'microchip,mpfs-gpio-irq-mux']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@200=
02000/pinctrl@200: failed to match any schema with compatible: ['microchip,=
mpfs-pinctrl-iomux0']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@200=
02000/pinctrl@204: failed to match any schema with compatible: ['microchip,=
mpfs-pinctrl-mssio']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/pinctrl@f0=
0: failed to match any schema with compatible: ['microchip,pic64gx-pinctrl-=
gpio2']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@200=
03000: failed to match any schema with compatible: ['microchip,pic64gx-sysr=
eg-scb', 'microchip,mpfs-sysreg-scb', 'syscon']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20003000=
 (microchip,pic64gx-sysreg-scb): compatible:0: 'microchip,pic64gx-sysreg-sc=
b' is not one of ['airoha,en7581-pbus-csr', 'al,alpine-sysfabric-service', =
'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-contro=
ller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-syste=
m-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', '=
amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-analo=
g-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson8=
b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'apm=
,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgene=
-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu'=
, 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,sr=
-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', 'c=
irrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controlle=
r', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls1088=
a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subct=
rl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-sa=
s-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sysc=
on', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-m=
isc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,arma=
da-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pct=
l-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-sy=
scfg', 'mediatek,mt7988-topmisc', 'mediatek,mt8135-pctl-a-syscfg', 'mediate=
k,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-=
infracfg-nao', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'm=
icrochip,mpfs-control-scb', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60=
-sfr', 'microchip,sama7d65-ddr3phy', 'microchip,sama7d65-sfrbu', 'microchip=
,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvot=
on,ma35d1-sys', 'nuvoton,wpcm450-shm', 'qcom,apq8064-mmss-sfpb', 'qcom,apq8=
064-sps-sic', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3528-qos', 'rockc=
hip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockchip,rk=
3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,nomadik-=
pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-usb-ph=
y-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-=
dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ctrl', '=
ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20003000=
 (microchip,pic64gx-sysreg-scb): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20003000=
 (microchip,pic64gx-sysreg-scb): compatible: ['microchip,pic64gx-sysreg-scb=
', 'microchip,mpfs-sysreg-scb', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@2=
0001000: failed to match any schema with compatible: ['microchip,mpfs-wdt']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@2=
0101000: failed to match any schema with compatible: ['microchip,mpfs-wdt']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@2=
0103000: failed to match any schema with compatible: ['microchip,mpfs-wdt']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@2=
0105000: failed to match any schema with compatible: ['microchip,mpfs-wdt']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@2=
0107000: failed to match any schema with compatible: ['microchip,mpfs-wdt']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: can@2010c000 (m=
icrochip,pic64gx-can): 'resets' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/can/microchip,mpfs-c=
an.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: can@2010d000 (m=
icrochip,pic64gx-can): 'resets' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/can/microchip,mpfs-c=
an.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: ethernet@201100=
00 (microchip,pic64gx-macb): compatible: 'oneOf' conditional failed, one mu=
st be fixed:
   	['microchip,pic64gx-macb', 'microchip,mpfs-macb', 'cdns,macb'] is too l=
ong
   	'microchip,pic64gx-macb' is not one of ['cdns,at91rm9200-emac']
   	'microchip,pic64gx-macb' is not one of ['cdns,zynq-gem', 'cdns,zynqmp-g=
em']
   	'microchip,pic64gx-macb' is not one of ['xlnx,versal-gem', 'xlnx,zynq-g=
em', 'xlnx,zynqmp-gem']
   	'microchip,pic64gx-macb' is not one of ['cdns,at91sam9260-macb', 'cdns,=
sam9x60-macb', 'microchip,mpfs-macb']
   	'microchip,pic64gx-macb' is not one of ['atmel,sama5d3-macb']
   	'microchip,pic64gx-macb' is not one of ['atmel,sama5d29-gem', 'atmel,sa=
ma5d2-gem', 'atmel,sama5d3-gem', 'atmel,sama5d4-gem', 'cdns,np4-macb', 'mic=
rochip,sama7g5-emac', 'microchip,sama7g5-gem', 'sifive,fu540-c000-gem', 'cd=
ns,emac', 'cdns,gem', 'cdns,macb']
   	'microchip,pic64gx-macb' is not one of ['microchip,sam9x7-gem']
   	'cdns,emac' was expected
   	'cdns,gem' was expected
   	'cdns,macb' was expected
   	'microchip,mpfs-macb' is not one of ['cdns,at91sam9260-macb']
   	'microchip,sama7g5-gem' was expected
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: ethernet@201100=
00 (microchip,pic64gx-macb): Unevaluated properties are not allowed ('compa=
tible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/ethernet@2=
0110000: failed to match any schema with compatible: ['microchip,pic64gx-ma=
cb', 'microchip,mpfs-macb', 'cdns,macb']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: ethernet@201120=
00 (microchip,pic64gx-macb): compatible: 'oneOf' conditional failed, one mu=
st be fixed:
   	['microchip,pic64gx-macb', 'microchip,mpfs-macb', 'cdns,macb'] is too l=
ong
   	'microchip,pic64gx-macb' is not one of ['cdns,at91rm9200-emac']
   	'microchip,pic64gx-macb' is not one of ['cdns,zynq-gem', 'cdns,zynqmp-g=
em']
   	'microchip,pic64gx-macb' is not one of ['xlnx,versal-gem', 'xlnx,zynq-g=
em', 'xlnx,zynqmp-gem']
   	'microchip,pic64gx-macb' is not one of ['cdns,at91sam9260-macb', 'cdns,=
sam9x60-macb', 'microchip,mpfs-macb']
   	'microchip,pic64gx-macb' is not one of ['atmel,sama5d3-macb']
   	'microchip,pic64gx-macb' is not one of ['atmel,sama5d29-gem', 'atmel,sa=
ma5d2-gem', 'atmel,sama5d3-gem', 'atmel,sama5d4-gem', 'cdns,np4-macb', 'mic=
rochip,sama7g5-emac', 'microchip,sama7g5-gem', 'sifive,fu540-c000-gem', 'cd=
ns,emac', 'cdns,gem', 'cdns,macb']
   	'microchip,pic64gx-macb' is not one of ['microchip,sam9x7-gem']
   	'cdns,emac' was expected
   	'cdns,gem' was expected
   	'cdns,macb' was expected
   	'microchip,mpfs-macb' is not one of ['cdns,at91sam9260-macb']
   	'microchip,sama7g5-gem' was expected
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/ethernet@2=
0112000: failed to match any schema with compatible: ['microchip,pic64gx-ma=
cb', 'microchip,mpfs-macb', 'cdns,macb']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: gpio@20120000 (=
microchip,pic64gx-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio=
=2Eyaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: gpio@20120000 (=
microchip,pic64gx-gpio): compatible:0: 'microchip,pic64gx-gpio' is not one =
of ['microchip,mpfs-gpio', 'microchip,coregpio-rtl-v3']
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio=
=2Eyaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: gpio@20120000 (=
microchip,pic64gx-gpio): compatible: ['microchip,pic64gx-gpio', 'microchip,=
mpfs-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio=
=2Eyaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/gpio@20120=
000: failed to match any schema with compatible: ['microchip,pic64gx-gpio',=
 'microchip,mpfs-gpio']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: gpio@20121000 (=
microchip,pic64gx-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio=
=2Eyaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: gpio@20121000 (=
microchip,pic64gx-gpio): compatible:0: 'microchip,pic64gx-gpio' is not one =
of ['microchip,mpfs-gpio', 'microchip,coregpio-rtl-v3']
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio=
=2Eyaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: gpio@20121000 (=
microchip,pic64gx-gpio): compatible: ['microchip,pic64gx-gpio', 'microchip,=
mpfs-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio=
=2Eyaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/gpio@20121=
000: failed to match any schema with compatible: ['microchip,pic64gx-gpio',=
 'microchip,mpfs-gpio']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: gpio@20122000 (=
microchip,pic64gx-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio=
=2Eyaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: gpio@20122000 (=
microchip,pic64gx-gpio): compatible:0: 'microchip,pic64gx-gpio' is not one =
of ['microchip,mpfs-gpio', 'microchip,coregpio-rtl-v3']
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio=
=2Eyaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: gpio@20122000 (=
microchip,pic64gx-gpio): compatible: ['microchip,pic64gx-gpio', 'microchip,=
mpfs-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio=
=2Eyaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/gpio@20122=
000: failed to match any schema with compatible: ['microchip,pic64gx-gpio',=
 'microchip,mpfs-gpio']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@370=
20000: failed to match any schema with compatible: ['microchip,pic64gx-cont=
rol-scb', 'microchip,mpfs-control-scb', 'syscon']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@37020000=
 (microchip,pic64gx-control-scb): compatible:0: 'microchip,pic64gx-control-=
scb' is not one of ['airoha,en7581-pbus-csr', 'al,alpine-sysfabric-service'=
, 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-cont=
roller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-sys=
tem-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon',=
 'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-ana=
log-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meso=
n8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mailbox', 'a=
pm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xge=
ne-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrb=
u', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,=
sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', =
'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-control=
ler', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls10=
88a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-sub=
ctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisilicon,pcie-=
sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongson,ls1b-sy=
scon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu=
-misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,ar=
mada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-p=
ctl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-=
syscfg', 'mediatek,mt7988-topmisc', 'mediatek,mt8135-pctl-a-syscfg', 'media=
tek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt836=
5-infracfg-nao', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', =
'microchip,mpfs-control-scb', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x=
60-sfr', 'microchip,sama7d65-ddr3phy', 'microchip,sama7d65-sfrbu', 'microch=
ip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuv=
oton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'qcom,apq8064-mmss-sfpb', 'qcom,ap=
q8064-sps-sic', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk306=
6-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos'=
, 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3528-qos', 'roc=
kchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockchip,=
rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,nomadi=
k-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-usb-=
phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am65=
4-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ctrl',=
 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@37020000=
 (microchip,pic64gx-control-scb): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@37020000=
 (microchip,pic64gx-control-scb): compatible: ['microchip,pic64gx-control-s=
cb', 'microchip,mpfs-control-scb', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: mailbox@3702080=
0 (microchip,pic64gx-mailbox): compatible:0: 'microchip,mpfs-mailbox' was e=
xpected
   	from schema $id: http://devicetree.org/schemas/mailbox/microchip,mpfs-m=
ailbox.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: mailbox@3702080=
0 (microchip,pic64gx-mailbox): compatible: ['microchip,pic64gx-mailbox', 'm=
icrochip,mpfs-mailbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/microchip,mpfs-m=
ailbox.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/mailbox@37=
020800: failed to match any schema with compatible: ['microchip,pic64gx-mai=
lbox', 'microchip,mpfs-mailbox']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controlle=
r@38010000 (microchip,pic64gx-ccc): compatible:0: 'microchip,mpfs-ccc' was =
expected
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc=
=2Eyaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controlle=
r@38010000 (microchip,pic64gx-ccc): compatible: ['microchip,pic64gx-ccc', '=
microchip,mpfs-ccc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc=
=2Eyaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/clock-cont=
roller@38010000: failed to match any schema with compatible: ['microchip,pi=
c64gx-ccc', 'microchip,mpfs-ccc']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controlle=
r@38040000 (microchip,pic64gx-ccc): compatible:0: 'microchip,mpfs-ccc' was =
expected
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc=
=2Eyaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controlle=
r@38040000 (microchip,pic64gx-ccc): compatible: ['microchip,pic64gx-ccc', '=
microchip,mpfs-ccc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc=
=2Eyaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/clock-cont=
roller@38040000: failed to match any schema with compatible: ['microchip,pi=
c64gx-ccc', 'microchip,mpfs-ccc']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controlle=
r@38100000 (microchip,pic64gx-ccc): compatible:0: 'microchip,mpfs-ccc' was =
expected
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc=
=2Eyaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controlle=
r@38100000 (microchip,pic64gx-ccc): compatible: ['microchip,pic64gx-ccc', '=
microchip,mpfs-ccc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc=
=2Eyaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/clock-cont=
roller@38100000: failed to match any schema with compatible: ['microchip,pi=
c64gx-ccc', 'microchip,mpfs-ccc']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controlle=
r@38400000 (microchip,pic64gx-ccc): compatible:0: 'microchip,mpfs-ccc' was =
expected
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc=
=2Eyaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controlle=
r@38400000 (microchip,pic64gx-ccc): compatible: ['microchip,pic64gx-ccc', '=
microchip,mpfs-ccc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc=
=2Eyaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/clock-cont=
roller@38400000: failed to match any schema with compatible: ['microchip,pi=
c64gx-ccc', 'microchip,mpfs-ccc']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clkcfg@3e001000=
 (microchip,pic64gx-clkcfg): compatible:0: 'microchip,mpfs-clkcfg' was expe=
cted
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-clk=
cfg.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clkcfg@3e001000=
 (microchip,pic64gx-clkcfg): compatible: ['microchip,pic64gx-clkcfg', 'micr=
ochip,mpfs-clkcfg'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-clk=
cfg.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/clkcfg@3e0=
01000: failed to match any schema with compatible: ['microchip,pic64gx-clkc=
fg', 'microchip,mpfs-clkcfg']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
