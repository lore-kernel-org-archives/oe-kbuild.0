Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EED2ECD27
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Oct 2025 20:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760386784; cv=none; b=efLjcdBZcQdGt5N7Gje2wTc/n5tXf1bUk15jbfDUAMutbbp0WkMOsCuZYZ8Rsh2L+TejMZo63N01qNCfN/3u92Qg/tM+wXlZwdHXo0D7xNMa6Av+4SdNsH8FsAQzGM05XdWra7vXineD4dqDoikMKst9/jm5kJg8ZC53PzpOb7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760386784; c=relaxed/simple;
	bh=cfhF3z380GuR7PX2jKO3mqpyCYH2bIM5eGHuogLN6Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jxY/dVWPJiOb4nXJ3YCnzG56lKARIjq56eBdEMFgxiZx4SP6d7izSqjqXfmQxF3Al2IqTXRBIlabcf80uIyh/pOPxKui7Oo0w0M4QMPM1vlI+DQzKpWUye2Jf1brAeZ2jBfAcNHHZtycvS5InrjKMCcreKhbcH+KfCyLQCjQCBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/HwxY3J; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/HwxY3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760386779; x=1791922779;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cfhF3z380GuR7PX2jKO3mqpyCYH2bIM5eGHuogLN6Gk=;
  b=e/HwxY3J4WhqpMib+SgPZpjw5TpmDSCbI/UY81WrlRcGnzzVVcPN/K8u
   /UbKd6sudRHXxSKezvPMD4VtPtG+P2c52r+ub7LWHtgf6G9YGeWg+qLkW
   60K5SCIbBIYaQvBXzf8RrJBvJRYAz9M+SgOaBzTHqlSEwYTOSTptFUWpG
   6u7NhMhOQp0+IWetliObKkNjyxxkTqSI7f11c7FvWXudGh1z1wP+rH5v3
   gwf/pf9NUYz34GPEznbDlMDiCzLgDXcO9lDWrmfsPDUCRJf381+eFHs5e
   JR5UEa6Rt54B3gGtxVHSbS1rK3I7GkdAWCMMaom4sDE9A9CXStorcdRM6
   Q==;
X-CSE-ConnectionGUID: Rpa9dShoRfK9Ix0pE5aSAQ==
X-CSE-MsgGUID: ztOgpIFYQ9u9KGTByaGLLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="61747106"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="61747106"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 13:19:37 -0700
X-CSE-ConnectionGUID: 5D/w56jTSGeLCfK7ukNAOg==
X-CSE-MsgGUID: RLH18nEnSNaHd4sEJwPXbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="205387582"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Oct 2025 13:19:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8P14-00021f-1A;
	Mon, 13 Oct 2025 20:19:34 +0000
Date: Tue, 14 Oct 2025 04:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 17/18]
 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000
 (microchip,pic64gx-mss-top-sysreg): compatible:2: 'simple-mfd' was expected
Message-ID: <202510140455.WpXQImFs-lkp@intel.com>
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
head:   b54599b193b0acd5321c15d1639fc20ee8f84750
commit: d77002a09b948a4135a2737af9a2181e18285c5a [17/18] DROP riscv: dts: m=
icrochip: pic64gx pinctrl
:::::: branch date: 5 hours ago
:::::: commit date: 9 hours ago
config: riscv-randconfig-051-20251014 (https://download.01.org/0day-ci/arch=
ive/20251014/202510140455.WpXQImFs-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251014/202510140455.WpXQImFs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510140455.WpXQImFs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'thead,c900-plic' was expected
   	'riscv,plic0' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/sif=
ive,plic-1.0.0.yaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/interrupt-=
controller@c000000: failed to match any schema with compatible: ['microchip=
,pic64gx-plic', 'sifive,plic-1.0.0']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
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
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): compatible:2: 'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): compatible: ['microchip,pic64gx-mss-to=
p-sysreg', 'microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too =
long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): pinctrl@204:compatible:0: 'microchip,m=
pfs-pinctrl-mssio' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,=
mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000=
 (microchip,pic64gx-mss-top-sysreg): pinctrl@204:compatible: ['microchip,pi=
c64gx-pinctrl-mssio', 'microchip,mpfs-pinctrl-mssio'] is too long
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
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: pinctrl@204 (mi=
crochip,pic64gx-pinctrl-mssio): compatible:0: 'microchip,mpfs-pinctrl-mssio=
' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mpfs-p=
inctrl-mssio.yaml#
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: pinctrl@204 (mi=
crochip,pic64gx-pinctrl-mssio): compatible: ['microchip,pic64gx-pinctrl-mss=
io', 'microchip,mpfs-pinctrl-mssio'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mpfs-p=
inctrl-mssio.yaml#
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
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20003000=
 (microchip,pic64gx-sysreg-scb): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20003000=
 (microchip,pic64gx-sysreg-scb): compatible: ['microchip,pic64gx-sysreg-scb=
', 'microchip,mpfs-sysreg-scb', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@2=
0001000: failed to match any schema with compatible: ['microchip,mpfs-wdt']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@2=
0101000: failed to match any schema with compatible: ['microchip,mpfs-wdt']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@2=
0103000: failed to match any schema with compatible: ['microchip,mpfs-wdt']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
