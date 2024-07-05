Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4E9A955
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jul 2024 17:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720200701; cv=none; b=l3IIbp+35wbPiBqJPqec74udaek5e4UN+B4mcZPeQVzAO+QYoyARmaDwJfbJ39+8deR1P2+o9O1oKttKx7X6Tsb5mj2TdI12SIpOHyCZWy1OpwUV2g2q8B0l3L0+MWpP7J3944YRtalXBGBeVA0VZL+2JXzsosCaUAG5wxeuNKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720200701; c=relaxed/simple;
	bh=CG0Ekfb920kZGTsOWJKCscU/S8o8P79oaleSId8fkZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tZZnLg/ie/FX+L/6VPpnW0VdLHC/V1yteVWxlj9hHgYWRhTgCE5Cq0BYA2bRwxNhmrPlUZQb03hLCWavyD73yDO58bqOAgPR1N7kBUz1ifzidt2fKJ3BcQCUyu8NAnEhrnDk2Hgkw+QscG32VubbxhS0SyX0FU+hmRI7GwamWVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nS3aaf1E; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nS3aaf1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720200699; x=1751736699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CG0Ekfb920kZGTsOWJKCscU/S8o8P79oaleSId8fkZs=;
  b=nS3aaf1E6wnFnxLuInvEi1qpT0U4q3vhV5Z4MOF66l2jSs3md7uzCrmZ
   MlOQBGjwk8EVYThFLmZYjQjk3EfJbstaIJ8QR5J0+tSAvxGk4+Qd3NxKe
   Z8JxzXK2hQhq4kzydJCRAx6Ka0WwYLxOl9yDFaXoWUVWbvhG+wPbn10kv
   YIUaXpZBraWJMZaTaPjKT0JXJh1i3TJOEVTP+mLvdOqq21oHp81Y87OoQ
   6o4yWn9ndDTbEGNSAM1eQYTlXj76CIhV8GLsxYGcAbYfmzhg4dnR9l32Q
   mMSwqU6VMUSoAGgkhxr+rl9wdKcGDT9zxzB2iy+wMfa0E45nZyRyKDlOa
   g==;
X-CSE-ConnectionGUID: cyLTLOpqTiO6ToAiMrz+fA==
X-CSE-MsgGUID: 76BpVWu9Qw6/ljgQaG7NjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21267911"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="21267911"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 10:31:38 -0700
X-CSE-ConnectionGUID: AIFgjbJpQm2hSE2b1q6pTw==
X-CSE-MsgGUID: IQqmzL19RE+zP5NdA3ckYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="51352134"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jul 2024 10:31:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPmmU-000SfK-1t;
	Fri, 05 Jul 2024 17:31:34 +0000
Date: Sat, 6 Jul 2024 01:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [libata:for-next 2/19]
 arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: sata@3200000:
 compatible:0: 'fsl,ls1012a-ahci' is not one of ['fsl,ls1021a-ahci',
 'fsl,ls1043a-ahci', 'fsl,ls1028a-ahci', 'fsl,ls1088a-ahci',
 'fsl,ls2080a-ahci', 'fsl,lx2160a-ahci']
Message-ID: <202407060331.vwbdlWi6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Li <Frank.Li@nxp.com>
CC: Niklas Cassel <cassel@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git for-next
head:   f97106b10d9ac0b5472be45cbc2d3de7d654648a
commit: e58e12c5c34ce1f339e09825037a8c86956ff51c [2/19] dt-bindings: ata: ahci-fsl-qoriq: convert to yaml format
:::::: branch date: 34 hours ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240706/202407060331.vwbdlWi6-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407060331.vwbdlWi6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407060331.vwbdlWi6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: sai@2b60000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: usb@2f00000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: sata@3200000: compatible:0: 'fsl,ls1012a-ahci' is not one of ['fsl,ls1021a-ahci', 'fsl,ls1043a-ahci', 'fsl,ls1028a-ahci', 'fsl,ls1088a-ahci', 'fsl,ls2080a-ahci', 'fsl,lx2160a-ahci']
   	from schema $id: http://devicetree.org/schemas/ata/fsl,ahci.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: sata@3200000: compatible: ['fsl,ls1012a-ahci', 'fsl,ls1043a-ahci'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/fsl,ahci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1012a-ahci', 'fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: /soc/usb@8600000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: /soc/usb@8600000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: /soc/msi-controller1@1572000: failed to match any schema with compatible: ['fsl,ls1012a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: pcie@3400000: interrupt-names:0: 'pme' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: pcie@3400000: interrupt-names:1: 'aer' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: power-controller@1ee2140: '#power-domain-cells' is a required property
--
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: usb@2f00000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: sata@3200000: compatible:0: 'fsl,ls1012a-ahci' is not one of ['fsl,ls1021a-ahci', 'fsl,ls1043a-ahci', 'fsl,ls1028a-ahci', 'fsl,ls1088a-ahci', 'fsl,ls2080a-ahci', 'fsl,lx2160a-ahci']
   	from schema $id: http://devicetree.org/schemas/ata/fsl,ahci.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: sata@3200000: compatible: ['fsl,ls1012a-ahci', 'fsl,ls1043a-ahci'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/fsl,ahci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1012a-ahci', 'fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: /soc/usb@8600000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: /soc/usb@8600000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: /soc/msi-controller1@1572000: failed to match any schema with compatible: ['fsl,ls1012a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: pcie@3400000: interrupt-names:0: 'pme' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: pcie@3400000: interrupt-names:1: 'aer' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: pcie@3400000: Unevaluated properties are not allowed ('num-viewport' was unexpected)
--
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: sai@2b60000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: usb@2f00000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: sata@3200000: compatible:0: 'fsl,ls1012a-ahci' is not one of ['fsl,ls1021a-ahci', 'fsl,ls1043a-ahci', 'fsl,ls1028a-ahci', 'fsl,ls1088a-ahci', 'fsl,ls2080a-ahci', 'fsl,lx2160a-ahci']
   	from schema $id: http://devicetree.org/schemas/ata/fsl,ahci.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: sata@3200000: compatible: ['fsl,ls1012a-ahci', 'fsl,ls1043a-ahci'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/fsl,ahci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1012a-ahci', 'fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: /soc/usb@8600000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: /soc/usb@8600000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: /soc/msi-controller1@1572000: failed to match any schema with compatible: ['fsl,ls1012a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: pcie@3400000: interrupt-names:0: 'pme' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: pcie@3400000: interrupt-names:1: 'aer' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: pcie@3400000: Unevaluated properties are not allowed ('num-viewport' was unexpected)
--
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: sai@2b60000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: usb@2f00000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: sata@3200000: compatible:0: 'fsl,ls1012a-ahci' is not one of ['fsl,ls1021a-ahci', 'fsl,ls1043a-ahci', 'fsl,ls1028a-ahci', 'fsl,ls1088a-ahci', 'fsl,ls2080a-ahci', 'fsl,lx2160a-ahci']
   	from schema $id: http://devicetree.org/schemas/ata/fsl,ahci.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: sata@3200000: compatible: ['fsl,ls1012a-ahci', 'fsl,ls1043a-ahci'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/fsl,ahci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1012a-ahci', 'fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: /soc/usb@8600000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: /soc/usb@8600000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: /soc/msi-controller1@1572000: failed to match any schema with compatible: ['fsl,ls1012a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: pcie@3400000: interrupt-names:0: 'pme' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: pcie@3400000: interrupt-names:1: 'aer' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: power-controller@1ee2140: '#power-domain-cells' is a required property
--
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: usb@2f00000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: sata@3200000: compatible:0: 'fsl,ls1012a-ahci' is not one of ['fsl,ls1021a-ahci', 'fsl,ls1043a-ahci', 'fsl,ls1028a-ahci', 'fsl,ls1088a-ahci', 'fsl,ls2080a-ahci', 'fsl,lx2160a-ahci']
   	from schema $id: http://devicetree.org/schemas/ata/fsl,ahci.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: sata@3200000: compatible: ['fsl,ls1012a-ahci', 'fsl,ls1043a-ahci'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/fsl,ahci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1012a-ahci', 'fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: /soc/usb@8600000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: /soc/usb@8600000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: /soc/msi-controller1@1572000: failed to match any schema with compatible: ['fsl,ls1012a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: pcie@3400000: interrupt-names:0: 'pme' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: pcie@3400000: interrupt-names:1: 'aer' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: power-controller@1ee2140: '#power-domain-cells' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
