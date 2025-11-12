Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B409535CBC3
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Nov 2025 00:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762906574; cv=none; b=nn6o/nBsQKGZr7xIRmxneJm72LG/+BtekPvL/kIug0mVqh3Mh2q7Dc6VUhOJ0cXAA1ikrmw1Z7E9/zX/56tuIFbEeq/Dprx4aQ2ZxqXPm+mjJNox49yig4KCVN3MmeQMGxeHq64uKkqVQhCOw2cjj3oHnfXSdZt6po2tL8ZqNsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762906574; c=relaxed/simple;
	bh=J0GcsQUYfJv6DiLfg7abi+IAZDJyrjYKkZpVARfcuTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=udzRKCiZx4qkFNz2KgLmtW6goDMt/GU8kULJ0/tM+KVomRYCt8pknBh4ZGrY94/qTf8eNU2puqXZh5tPX4B1Ch97QvgzQHFhhqqGB9RoCnlngpUfJg2NgUVWqTm+Expxb9pynpsRjk5bzB1OVpB28xynsBxEXF2fgieZjTZfr9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJgsZAup; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJgsZAup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762906573; x=1794442573;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=J0GcsQUYfJv6DiLfg7abi+IAZDJyrjYKkZpVARfcuTk=;
  b=hJgsZAupLL0Y0ETn2oPehZWdsZWzIC3/jP3uv888ZOPD0OmVVgeVGGWs
   MztfbASYwytMYDJnl3RfK1cNKP7b55kZArHmnq0vPrKkluhlqk5VbdAgE
   lHFPsg8CzRexUsxtLAFCBTlQeC+P9TfqrCZPgEhMCiaE4LANQNdby53JZ
   TSKtUFroPYo7WOhjo5BHl7XfXMFf9PWoarcmEdAMHQefTUjmZYwJnZiep
   C/0IjYtW9HmKTs5AV4So2zRdeO8aRMEPI1+w7qEJKBZyITTvOv4jlaviV
   pWcyjG6KI+KzLG1XFNmnYKN14rfDSd+Mo6YNo+bqyBIXS2HhbRdzAJTmT
   w==;
X-CSE-ConnectionGUID: z7h0/GrXQtCQq6V08xVWJw==
X-CSE-MsgGUID: mdyEUkbtRw6RU9wcJoFa3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="82598014"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="82598014"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:16:08 -0800
X-CSE-ConnectionGUID: +AWldZUqQeGyonkYedb45w==
X-CSE-MsgGUID: HR0ioGdkRYi96nA8hhnCCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="194064254"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Nov 2025 16:16:06 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vIyWq-000000004Em-3XAR;
	Wed, 12 Nov 2025 00:16:04 +0000
Date: Wed, 12 Nov 2025 01:15:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 18/19]
 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000
 (microchip,pic64gx-mss-top-sysreg): compatible:2: 'simple-mfd' was expected
Message-ID: <202511120133.8WW0XeLB-lkp@intel.com>
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
head:   0f0b8ab0b2d5245d9b9f4d73a6d28421de5c8b7d
commit: 4ab20613b7a7e3a3baf8ad356b30bc537294afb2 [18/19] DROP riscv: dts: m=
icrochip: pic64gx pinctrl
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-2051-20251111 (https://download.01.org/0day-ci/arc=
hive/20251112/202511120133.8WW0XeLB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 00d=
2780cca3438c3f2ce56a2f9d5549bbcb67131)
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251112/202511120133.8WW0XeLB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511120133.8WW0XeLB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'thead,c900-plic' was expected
   	'riscv,plic0' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/sif=
ive,plic-1.0.0.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/interrupt-=
controller@c000000: failed to match any schema with compatible: ['microchip=
,pic64gx-plic', 'sifive,plic-1.0.0']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): 'interrupt-controller@54' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): compatible:0: 'microchip,mpfs-mss-top-=
sysreg' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): compatible:2: 'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): compatible: ['microchip,pic64gx-mss-to=
p-sysreg', 'microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too =
long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): pinctrl@204:compatible:0: 'microchip,m=
pfs-pinctrl-mssio' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): pinctrl@204:compatible: ['microchip,pi=
c64gx-pinctrl-mssio', 'microchip,mpfs-pinctrl-mssio'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@200=
02000: failed to match any schema with compatible: ['microchip,pic64gx-mss-=
top-sysreg', 'microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@200=
02000/interrupt-controller@54: failed to match any schema with compatible: =
['microchip,pic64gx-gpio-irq-mux', 'microchip,mpfs-gpio-irq-mux']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@200=
02000/interrupt-controller@54: failed to match any schema with compatible: =
['microchip,pic64gx-gpio-irq-mux', 'microchip,mpfs-gpio-irq-mux']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: pinctrl@204 (mi=
crochip,pic64gx-pinctrl-mssio): compatible:0: 'microchip,mpfs-pinctrl-mssio=
' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mpfs-p=
inctrl-mssio.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: pinctrl@204 (mi=
crochip,pic64gx-pinctrl-mssio): compatible: ['microchip,pic64gx-pinctrl-mss=
io', 'microchip,mpfs-pinctrl-mssio'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mpfs-p=
inctrl-mssio.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@200=
02000/pinctrl@204: failed to match any schema with compatible: ['microchip,=
pic64gx-pinctrl-mssio', 'microchip,mpfs-pinctrl-mssio']
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
da-3700-usb2-host-device-misc', 'marvell,armada-3700-usb2-host-misc', 'marv=
ell,dove-global-config', 'mediatek,mt2701-pctl-a-syscfg', 'mediatek,mt2712-=
pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt7988-topmis=
c', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'medi=
atek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-infracfg-nao', 'mediatek,mt836=
5-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,mpfs-control-scb', 'm=
icrochip,mpfs-sysreg-scb', 'microchip,sam9x60-sfr', 'microchip,sama7d65-ddr=
3phy', 'microchip,sama7d65-sfrbu', 'microchip,sama7g5-ddr3phy', 'mscc,ocelo=
t-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm4=
50-shm', 'qcom,apq8064-mmss-sfpb', 'qcom,apq8064-sps-sic', 'rockchip,px30-q=
os', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', '=
rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockch=
ip,rk3399-qos', 'rockchip,rk3528-qos', 'rockchip,rk3562-qos', 'rockchip,rk3=
568-qos', 'rockchip,rk3576-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qo=
s', 'st,spear1340-misc', 'stericsson,nomadik-pmu', 'starfive,jh7100-sysmain=
', 'ti,am62-opp-efuse-table', 'ti,am62-usb-phy-ctrl', 'ti,am625-dss-oldi-io=
-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti,j784s4-=
acspcie-proxy-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20003000=
 (microchip,pic64gx-sysreg-scb): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20003000=
 (microchip,pic64gx-sysreg-scb): compatible: ['microchip,pic64gx-sysreg-scb=
', 'microchip,mpfs-sysreg-scb', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@2=
0001000: failed to match any schema with compatible: ['microchip,mpfs-wdt']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@2=
0101000: failed to match any schema with compatible: ['microchip,mpfs-wdt']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@2=
0103000: failed to match any schema with compatible: ['microchip,mpfs-wdt']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
