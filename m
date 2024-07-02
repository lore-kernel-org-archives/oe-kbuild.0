Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DA21CE094
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jul 2024 21:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719954919; cv=none; b=tNRlsmR97/aCXwSwMpxFNSIKl5ktdY3St6jUwuynnxZ72dTx0otcE6FfR1BDFnzGi1X0TrI0z7UNBs3+VE3E6CjcrmDrcq4phHENUtDiBGIp58LJ6yFxSRxIk+imwOFVso7rvaiWyhbJ6PisxETETYm2N+ZE4usLKTLZIihYRP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719954919; c=relaxed/simple;
	bh=N9sSHK3g9YvElXIvb8oEff2DLCVDENewBQVDIXDT4PM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HZpEnjdOpods1ojVwOag7yQGBRerxpItfWWjdm2G6r+7wQGkrxgmsqJOa4YYZk+HVusjjZscugA49+tlULS+8Qt8JMeXjQwCvKvQ/6aI8v0nhQ+fW5kkwqugvNcd3uT6HsxaENTOgbVqDMLNIB4NXVP/Y97SLLq5bSNGiusCAAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbzTMbWh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbzTMbWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719954915; x=1751490915;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=N9sSHK3g9YvElXIvb8oEff2DLCVDENewBQVDIXDT4PM=;
  b=SbzTMbWh5wpjcrBqDBwkzqvEjhHKuUbkScUS598Z0gWH//ZqdIrlatUD
   dzo5/avonfXx7yhBowbTM4EL4a8VcgulwtAAgTY0Hevr0hTNA9Gc7K3+X
   DlcGY5qjB6tKZWBgCzP2lh67GrLQvww2dBkdXW09NVdvMm7Kgi013o09h
   f6DcbgJUG2LETHvjJ3uUkehPstQi6A5J+O0fk6fSb3UBe345p/h5T0RCd
   OQHnavMx1mCiSCPjCmZ8yenWZd5TSApU5rcoO5KLDGt4SscM+uClOPiQz
   IHy9Rd4ZFcazprO4dej+MxXUzDZQMA//NrYBEWmjk1axsNxi+DvHvLegU
   g==;
X-CSE-ConnectionGUID: OxnFigR9RO6909fMs5kdfQ==
X-CSE-MsgGUID: 8rlrCCMJRXOU0ljFkv8QUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17031673"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="17031673"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 14:15:13 -0700
X-CSE-ConnectionGUID: vT/SHZTlRxGtCt85K1yG7A==
X-CSE-MsgGUID: Tp1TOuxQRMiw4HZJkd9SCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="45945452"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Jul 2024 14:15:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOkqD-000Ogy-1H;
	Tue, 02 Jul 2024 21:15:09 +0000
Date: Wed, 3 Jul 2024 05:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 26/31]
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: thermal-zones:
 'core-cluster', 'ddr-controller' do not match any of the regexes:
 '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
Message-ID: <202407030533.ZNMekRzd-lkp@intel.com>
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
:::::: Manual check reason: "only scripts/Makefile.* file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
head:   bbf9b1ffa198aaef6b6b0062bc8d08b5f0a4fe1c
commit: afbd730d0f3ec9ec01dad32b3aed5e00ffe5b22b [26/31] kbuild: verify dto=
verlay files against schema
:::::: branch date: 4 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/arch=
ive/20240703/202407030533.ZNMekRzd-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326=
ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240703/202407030533.ZNMekRzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407030533.ZNMekRzd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: interrupt-contro=
ller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: thermal-zones: '=
core-cluster', 'ddr-controller' do not match any of the regexes: '^[a-zA-Z]=
[a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: syscon@1e60000: =
compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: efuse@1e80000: U=
nevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/clock-contr=
oller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-cl=
ockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/i2c@2000000=
/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga=
', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/i2c@2000000=
/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga=
', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/spi@2100000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/spi@2100000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/spi@2110000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/spi@2110000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/spi@2120000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/spi@2120000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/mmc@2140000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/mmc@2140000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/mmc@2150000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/mmc@2150000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/gpio@230000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/gpio@230000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/gpio@231000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/gpio@231000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/gpio@232000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/gpio@232000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/usb@3100000=
: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dw=
c3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/usb@3110000=
: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dw=
c3']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/sata@320000=
0: failed to match any schema with compatible: ['fsl,ls1028a-ahci']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: pcie-ep@3400000:=
 compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-=
ep.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie-ep@340=
0000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', '=
fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: pcie-ep@3500000:=
 compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-=
ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie-ep@350=
0000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', '=
fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: dma-controller@8=
380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/dma-control=
ler@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma=
', 'fsl,ls1021a-qdma']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/dma-control=
ler@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma=
', 'fsl,ls1021a-qdma']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: audio-controller=
@f100000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: audio-controller=
@f100000: Unevaluated properties are not allowed ('dma-names' was unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: audio-controller=
@f110000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: audio-controller=
@f120000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: audio-controller=
@f130000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: audio-controller=
@f140000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: audio-controller=
@f150000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: pcie@1f0000000: =
ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [325477990=
4, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1,=
 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 1310=
72], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1,=
 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227=
858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yam=
l#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie@1f0000=
000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie@1f0000=
000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie@1f0000=
000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie@1f0000=
000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', =
'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie@1f0000=
000/ethernet@0,4: failed to match any schema with compatible: ['pci1957,ee0=
2', 'fsl,enetc-ptp']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie@1f0000=
000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/ierb@1f0800=
000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pwm@2800000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pwm@2810000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pwm@2820000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pwm@2830000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pwm@2840000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pwm@2850000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pwm@2860000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pwm@2870000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: power-controller=
@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/power-contr=
oller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rc=
pm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/power-contr=
oller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rc=
pm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/timer@28000=
00: failed to match any schema with compatible: ['fsl,ls1028a-ftm-alarm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/timer@28100=
00: failed to match any schema with compatible: ['fsl,ls1028a-ftm-alarm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: interrupt-contro=
ller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: thermal-zones: '=
core-cluster', 'ddr-controller' do not match any of the regexes: '^[a-zA-Z]=
[a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: syscon@1e60000: =
compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: efuse@1e80000: U=
nevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/clock-contr=
oller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-cl=
ockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/i2c@2000000=
/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga=
', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/i2c@2000000=
/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga=
', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/spi@2100000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/spi@2100000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/spi@2110000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/spi@2110000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/spi@2120000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/spi@2120000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/mmc@2140000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/mmc@2140000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/mmc@2150000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/mmc@2150000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/gpio@230000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/gpio@230000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/gpio@231000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/gpio@231000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/gpio@232000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/gpio@232000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/usb@3100000=
: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dw=
c3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/usb@3110000=
: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dw=
c3']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/sata@320000=
0: failed to match any schema with compatible: ['fsl,ls1028a-ahci']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: pcie-ep@3400000:=
 compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-=
ep.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie-ep@340=
0000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', '=
fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: pcie-ep@3500000:=
 compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-=
ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie-ep@350=
0000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', '=
fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: dma-controller@8=
380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/dma-control=
ler@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma=
', 'fsl,ls1021a-qdma']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/dma-control=
ler@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma=
', 'fsl,ls1021a-qdma']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: audio-controller=
@f100000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: audio-controller=
@f100000: Unevaluated properties are not allowed ('dma-names' was unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: audio-controller=
@f110000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: audio-controller=
@f120000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: audio-controller=
@f130000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: audio-controller=
@f140000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: audio-controller=
@f150000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: pcie@1f0000000: =
ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [325477990=
4, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1,=
 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 1310=
72], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1,=
 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227=
858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yam=
l#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie@1f0000=
000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie@1f0000=
000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie@1f0000=
000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie@1f0000=
000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', =
'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie@1f0000=
000/ethernet@0,4: failed to match any schema with compatible: ['pci1957,ee0=
2', 'fsl,enetc-ptp']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie@1f0000=
000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/ierb@1f0800=
000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pwm@2800000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pwm@2810000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pwm@2820000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pwm@2830000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pwm@2840000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pwm@2850000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pwm@2860000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pwm@2870000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: power-controller=
@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/power-contr=
oller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rc=
pm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/power-contr=
oller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rc=
pm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/timer@28000=
00: failed to match any schema with compatible: ['fsl,ls1028a-ftm-alarm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/timer@28100=
00: failed to match any schema with compatible: ['fsl,ls1028a-ftm-alarm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: interrupt-contro=
ller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: thermal-zones: '=
core-cluster', 'ddr-controller' do not match any of the regexes: '^[a-zA-Z]=
[a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: syscon@1e60000: =
compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: efuse@1e80000: U=
nevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/clock-contr=
oller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-cl=
ockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/i2c@2000000=
/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga=
', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/i2c@2000000=
/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga=
', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/spi@2100000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/spi@2100000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/spi@2110000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/spi@2110000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/spi@2120000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/spi@2120000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/mmc@2140000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/mmc@2140000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/mmc@2150000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/mmc@2150000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/gpio@230000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/gpio@230000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/gpio@231000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/gpio@231000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/gpio@232000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/gpio@232000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/usb@3100000=
: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dw=
c3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/usb@3110000=
: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dw=
c3']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/sata@320000=
0: failed to match any schema with compatible: ['fsl,ls1028a-ahci']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: pcie-ep@3400000:=
 compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-=
ep.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie-ep@340=
0000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', '=
fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: pcie-ep@3500000:=
 compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-=
ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie-ep@350=
0000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', '=
fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: dma-controller@8=
380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/dma-control=
ler@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma=
', 'fsl,ls1021a-qdma']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/dma-control=
ler@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma=
', 'fsl,ls1021a-qdma']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: audio-controller=
@f100000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: audio-controller=
@f100000: Unevaluated properties are not allowed ('dma-names' was unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: audio-controller=
@f110000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: audio-controller=
@f120000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: audio-controller=
@f130000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: audio-controller=
@f140000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: audio-controller=
@f150000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: pcie@1f0000000: =
ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [325477990=
4, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1,=
 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 1310=
72], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1,=
 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227=
858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yam=
l#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie@1f0000=
000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie@1f0000=
000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie@1f0000=
000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie@1f0000=
000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', =
'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie@1f0000=
000/ethernet@0,4: failed to match any schema with compatible: ['pci1957,ee0=
2', 'fsl,enetc-ptp']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie@1f0000=
000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/ierb@1f0800=
000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pwm@2800000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pwm@2810000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pwm@2820000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pwm@2830000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pwm@2840000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pwm@2850000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pwm@2860000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pwm@2870000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: power-controller=
@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/power-contr=
oller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rc=
pm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/power-contr=
oller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rc=
pm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/timer@28000=
00: failed to match any schema with compatible: ['fsl,ls1028a-ftm-alarm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/timer@28100=
00: failed to match any schema with compatible: ['fsl,ls1028a-ftm-alarm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: interrupt-contro=
ller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: thermal-zones: '=
core-cluster', 'ddr-controller' do not match any of the regexes: '^[a-zA-Z]=
[a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: syscon@1e60000: =
compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: efuse@1e80000: U=
nevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/clock-contr=
oller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-cl=
ockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/i2c@2000000=
/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga=
', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/i2c@2000000=
/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga=
', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/spi@2100000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/spi@2100000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/spi@2110000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/spi@2110000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/spi@2120000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/spi@2120000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/mmc@2140000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/mmc@2140000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/mmc@2150000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/mmc@2150000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/gpio@230000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/gpio@230000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/gpio@231000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/gpio@231000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/gpio@232000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/gpio@232000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/usb@3100000=
: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dw=
c3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/usb@3110000=
: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dw=
c3']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/sata@320000=
0: failed to match any schema with compatible: ['fsl,ls1028a-ahci']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: pcie-ep@3400000:=
 compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-=
ep.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie-ep@340=
0000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', '=
fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: pcie-ep@3500000:=
 compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-=
ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie-ep@350=
0000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', '=
fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: dma-controller@8=
380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/dma-control=
ler@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma=
', 'fsl,ls1021a-qdma']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/dma-control=
ler@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma=
', 'fsl,ls1021a-qdma']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: audio-controller=
@f100000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: audio-controller=
@f100000: Unevaluated properties are not allowed ('dma-names' was unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: audio-controller=
@f110000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: audio-controller=
@f120000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: audio-controller=
@f130000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: audio-controller=
@f140000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: audio-controller=
@f150000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: pcie@1f0000000: =
ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [325477990=
4, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1,=
 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 1310=
72], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1,=
 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227=
858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yam=
l#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie@1f0000=
000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie@1f0000=
000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie@1f0000=
000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie@1f0000=
000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', =
'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie@1f0000=
000/ethernet@0,4: failed to match any schema with compatible: ['pci1957,ee0=
2', 'fsl,enetc-ptp']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie@1f0000=
000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/ierb@1f0800=
000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pwm@2800000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pwm@2810000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pwm@2820000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pwm@2830000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pwm@2840000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pwm@2850000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pwm@2860000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pwm@2870000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: power-controller=
@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/power-contr=
oller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rc=
pm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/power-contr=
oller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rc=
pm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/timer@28000=
00: failed to match any schema with compatible: ['fsl,ls1028a-ftm-alarm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/timer@28100=
00: failed to match any schema with compatible: ['fsl,ls1028a-ftm-alarm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: interrupt-contro=
ller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: thermal-zones: '=
core-cluster', 'ddr-controller' do not match any of the regexes: '^[a-zA-Z]=
[a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: syscon@1e60000: =
compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: efuse@1e80000: U=
nevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/clock-contr=
oller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-cl=
ockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/i2c@2000000=
/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga=
', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/i2c@2000000=
/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga=
', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/spi@2100000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/spi@2100000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/spi@2110000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/spi@2110000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/spi@2120000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/spi@2120000=
: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1=
021a-v1.0-dspi']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/mmc@2140000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/mmc@2140000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/mmc@2150000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/mmc@2150000=
: failed to match any schema with compatible: ['fsl,ls1028a-esdhc', 'fsl,es=
dhc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/gpio@230000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/gpio@230000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/gpio@231000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/gpio@231000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/gpio@232000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/gpio@232000=
0: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/usb@3100000=
: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dw=
c3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/usb@3110000=
: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dw=
c3']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/sata@320000=
0: failed to match any schema with compatible: ['fsl,ls1028a-ahci']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: pcie-ep@3400000:=
 compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-=
ep.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie-ep@340=
0000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', '=
fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: pcie-ep@3500000:=
 compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-=
ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie-ep@350=
0000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', '=
fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: dma-controller@8=
380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/dma-control=
ler@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma=
', 'fsl,ls1021a-qdma']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/dma-control=
ler@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma=
', 'fsl,ls1021a-qdma']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: audio-controller=
@f100000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: audio-controller=
@f100000: Unevaluated properties are not allowed ('dma-names' was unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: audio-controller=
@f110000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: audio-controller=
@f120000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: audio-controller=
@f130000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: audio-controller=
@f140000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: audio-controller=
@f150000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: pcie@1f0000000: =
ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [325477990=
4, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1,=
 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 1310=
72], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1,=
 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227=
858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yam=
l#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie@1f0000=
000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie@1f0000=
000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie@1f0000=
000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie@1f0000=
000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', =
'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie@1f0000=
000/ethernet@0,4: failed to match any schema with compatible: ['pci1957,ee0=
2', 'fsl,enetc-ptp']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie@1f0000=
000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e10=
0', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/ierb@1f0800=
000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pwm@2800000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pwm@2810000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pwm@2820000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pwm@2830000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pwm@2840000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pwm@2850000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pwm@2860000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pwm@2870000=
: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: power-controller=
@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/power-contr=
oller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rc=
pm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/power-contr=
oller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rc=
pm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/timer@28000=
00: failed to match any schema with compatible: ['fsl,ls1028a-ftm-alarm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/timer@28100=
00: failed to match any schema with compatible: ['fsl,ls1028a-ftm-alarm']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a=
 required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: thermal-zones: 'ccn-dpaa-tbu', 'cluster2-3', 'cluster4-hsio3', 'cluster=
6-7', 'dce-qbman-hsio2', 'ddr-cluster5', 'wriop' do not match any of the re=
gexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/clock-controller@1300000: failed to match any schema with compatib=
le: ['fsl,lx2160a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,=
lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, =
0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [=
1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0]=
, [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: i2c@2000000: clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: i2c@2000000: Unevaluated properties are not allowed ('clock-names' was =
unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: i2c@2010000: clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: i2c@2020000: clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: i2c@2030000: clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: i2c@2040000: clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: i2c@2040000: Unevaluated properties are not allowed ('clock-names' was =
unexpected)
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: i2c@2060000: clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: i2c@2070000: clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,lx2=
160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,lx2=
160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2=
160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2=
160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2=
160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2=
160a-dspi', 'fsl,ls2085a-dspi']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/esdhc@2140000: failed to match any schema with compatible: ['fsl,e=
sdhc']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/esdhc@2150000: failed to match any schema with compatible: ['fsl,e=
sdhc']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,qo=
riq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/power-controller@1e34040: failed to match any schema with compatib=
le: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/power-controller@1e34040: failed to match any schema with compatib=
le: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/timer@2800000: failed to match any schema with compatible: ['fsl,l=
x2160a-ftm-alarm']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: hub@1: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: hub@2: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,lx=
2160a-ahci']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/sata@3210000: failed to match any schema with compatible: ['fsl,lx=
2160a-ahci']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/sata@3220000: failed to match any schema with compatible: ['fsl,lx=
2160a-ahci']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/sata@3230000: failed to match any schema with compatible: ['fsl,lx=
2160a-ahci']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.=
yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: pcie@3400000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.=
yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: pcie@3400000: interrupts: [[0, 108, 4], [0, 108, 4], [0, 108, 4]] is to=
o long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.=
yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: pcie@3400000: interrupt-names: ['aer', 'pme', 'intr'] is too long
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: pcie@3800000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.=
yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: pcie@3900000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.=
yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: pcie@3900000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.=
yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: pcie@3900000: interrupts: [[0, 103, 4], [0, 103, 4], [0, 103, 4]] is to=
o long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.=
yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: pcie@3900000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.=
yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/ptp-timer@8b95000: failed to match any schema with compatible: ['f=
sl,dpaa2-ptp']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8b96000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8b97000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c07000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c0b000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c0f000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c13000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c17000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c1b000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c1f000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c23000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c27000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c2b000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c2f000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c33000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c37000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c3b000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c3f000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c43000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c47000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/mdio@8c4b000: failed to match any schema with compatible: ['fsl,fm=
an-memac-mdio']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: pinmux@70010012c: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: pinmux@70010012c: #size-cells:0:0: 0 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.d=
tb: /soc/fsl-mc@80c000000: failed to match any schema with compatible: ['fs=
l,qoriq-mc']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
