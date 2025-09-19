Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300702236E1
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Sep 2025 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758304391; cv=none; b=OC4MHV+/oICn7fEjrDUlIpQi3xU6Gc7d5Nn7gxH+oP4XV1sSdFgYGXSkYjPnoWCMgjCMKC8BS5ZvlDjr6kZk8fW/f8dt5i58bc1tbPHPQaaHJVL05fmmWN2IUQo7IcCRe7xyj74onBKAejdIvXAZ4WQx7lqZ9jmUGBrtIuV50dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758304391; c=relaxed/simple;
	bh=bGIPnBNOx5GJ19dALSyDOtUcbAaL4OdnNxC0zwCohnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=norBkCIMmZbZZjXDB9UTQVC8HM2qZD66KuvIa+BalSHJObkvS7r3qs3bJdyCUKcfuqm2GDS4vStWu2Pu38JIoWI+U9pC552mNJyXuG0AsSRZqh8S4IUiiTpowxLn/UlKpJya8c0SzhaqdkI5TCYkGiyADXj0T4lU/Bpeo9vja9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B21DWEL6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B21DWEL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758304389; x=1789840389;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bGIPnBNOx5GJ19dALSyDOtUcbAaL4OdnNxC0zwCohnM=;
  b=B21DWEL6VqUnC+urHF6NUxkQ/fGIh6xZH8sRtT6dMIWU5mh2dBAhVsOU
   IUuAY7YfRXQf2E5lFAQBBU2RMsIkKk6AkV6ltQj81QhtYSDdncUgsUoJe
   ZAU8FJh1Ufu4NSzayzCKptilOYXNcb9YVmI/R+93npDx/V7lumfmRZXwu
   cWqrm0wMYKD3lCa2uvihXbvyTUdpze3W8LRDz0IV8l+J7lExrJFMpr4N5
   FFGYSDrgKLqMLMIuaeZsntc249L4KvjTDzi/Zay+cetzSmUv9ZmpaoO1I
   isTgOe/a+TaSrf6Q0yuE3nWD/vZn0kQ4oZeTKhLbkArEUIW1L/4vep9Vu
   w==;
X-CSE-ConnectionGUID: QaGC8UXMQeiwwn25n+xPZQ==
X-CSE-MsgGUID: YX7v2MFLQu6FYD9cIytt0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="59875087"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="59875087"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 10:53:09 -0700
X-CSE-ConnectionGUID: APXHScoBSPSSPF7pL21nEA==
X-CSE-MsgGUID: xsHr2GrER0KnrQsZqjAuAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="175813496"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Sep 2025 10:53:07 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzfI9-0004cz-0I;
	Fri, 19 Sep 2025 17:53:05 +0000
Date: Sat, 20 Sep 2025 01:52:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 28/28]
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000
 (microchip,mpfs-mss-top-sysreg): pinctrl@204:compatible: 'oneOf' conditional
 failed, one must be fixed:
Message-ID: <202509200148.W5roujWC-lkp@intel.com>
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
commit: 69c073cdb60f2e13a617eb5db437dd667a4d424d [28/28] add bindings
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-052-20250919 (https://download.01.org/0day-ci/arch=
ive/20250920/202509200148.W5roujWC-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250920/202509200148.W5roujWC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509200148.W5roujWC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000 (mi=
crochip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg',=
 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000 (mi=
crochip,mpfs-mss-top-sysreg): pinctrl@204:compatible: 'oneOf' conditional f=
ailed, one must be fixed:
   	['microchip,mpfs-pinctrl-mssio'] is too short
   	'microchip,mpfs-pinctrl-iomux0' was expected
   	'microchip,pic64gx-pinctrl-iomux0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: /soc/syscon@2000200=
0/pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs=
-pinctrl-mssio']
--
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: syscon@20002000 (micr=
ochip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', '=
syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: syscon@20002000 (micr=
ochip,mpfs-mss-top-sysreg): pinctrl@204:compatible: 'oneOf' conditional fai=
led, one must be fixed:
   	['microchip,mpfs-pinctrl-mssio'] is too short
   	'microchip,mpfs-pinctrl-iomux0' was expected
   	'microchip,pic64gx-pinctrl-iomux0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: /soc/syscon@20002000/=
pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs-p=
inctrl-mssio']
--
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: syscon@20002000 (micr=
ochip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', '=
syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: syscon@20002000 (micr=
ochip,mpfs-mss-top-sysreg): pinctrl@204:compatible: 'oneOf' conditional fai=
led, one must be fixed:
   	['microchip,mpfs-pinctrl-mssio'] is too short
   	'microchip,mpfs-pinctrl-iomux0' was expected
   	'microchip,pic64gx-pinctrl-iomux0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: /soc/syscon@20002000/=
pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs-p=
inctrl-mssio']
--
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: syscon@20002000 (micr=
ochip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', '=
syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: syscon@20002000 (micr=
ochip,mpfs-mss-top-sysreg): pinctrl@204:compatible: 'oneOf' conditional fai=
led, one must be fixed:
   	['microchip,mpfs-pinctrl-mssio'] is too short
   	'microchip,mpfs-pinctrl-iomux0' was expected
   	'microchip,pic64gx-pinctrl-iomux0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: /soc/syscon@20002000/=
pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs-p=
inctrl-mssio']
--
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: syscon@20002000 (microch=
ip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'sys=
con', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: syscon@20002000 (microch=
ip,mpfs-mss-top-sysreg): pinctrl@204:compatible: 'oneOf' conditional failed=
, one must be fixed:
   	['microchip,mpfs-pinctrl-mssio'] is too short
   	'microchip,mpfs-pinctrl-iomux0' was expected
   	'microchip,pic64gx-pinctrl-iomux0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: /soc/syscon@20002000/pin=
ctrl@204: failed to match any schema with compatible: ['microchip,mpfs-pinc=
trl-mssio']
--
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: syscon@20002000 (microch=
ip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'sys=
con', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: syscon@20002000 (microch=
ip,mpfs-mss-top-sysreg): pinctrl@204:compatible: 'oneOf' conditional failed=
, one must be fixed:
   	['microchip,mpfs-pinctrl-mssio'] is too short
   	'microchip,mpfs-pinctrl-iomux0' was expected
   	'microchip,pic64gx-pinctrl-iomux0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: /soc/syscon@20002000/pin=
ctrl@204: failed to match any schema with compatible: ['microchip,mpfs-pinc=
trl-mssio']
--
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: interrupt-contr=
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
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/interrupt-=
controller@c000000: failed to match any schema with compatible: ['microchip=
,pic64gx-plic', 'sifive,plic-1.0.0']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): 'interrupt-controller@54' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): compatible:0: 'microchip,mpfs-mss-top-=
sysreg' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): compatible: ['microchip,pic64gx-mss-to=
p-sysreg', 'microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too =
long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): pinctrl@204:compatible: 'oneOf' condit=
ional failed, one must be fixed:
   	['microchip,mpfs-pinctrl-mssio'] is too short
   	'microchip,mpfs-pinctrl-iomux0' was expected
   	'microchip,pic64gx-pinctrl-iomux0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@200=
02000: failed to match any schema with compatible: ['microchip,pic64gx-mss-=
top-sysreg', 'microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@200=
02000/interrupt-controller@54: failed to match any schema with compatible: =
['microchip,pic64gx-gpio-irq-mux', 'microchip,mpfs-gpio-irq-mux']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@200=
02000/interrupt-controller@54: failed to match any schema with compatible: =
['microchip,pic64gx-gpio-irq-mux', 'microchip,mpfs-gpio-irq-mux']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@200=
02000/pinctrl@204: failed to match any schema with compatible: ['microchip,=
mpfs-pinctrl-mssio']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@200=
03000: failed to match any schema with compatible: ['microchip,pic64gx-sysr=
eg-scb', 'microchip,mpfs-sysreg-scb', 'syscon']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20003000=
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

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
