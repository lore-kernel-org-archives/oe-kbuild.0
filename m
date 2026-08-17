Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460A32D7DFE
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 02:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786934251; cv=none; b=JbxxOMQllde94PIW+V3RBcxRqWafMt75lnR1QsyPEAURFmcncCP72RQS7KuU1lkcmYNht8pnBKISBjT448OM7VgLgsaAT+kgOgapm2gBETrFhCN6hmZRyAQy/jdIDWAxJUqHUeSlgVXPQ21aOcrjLpnP9rq93FvFah7ShE2hfJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786934251; c=relaxed/simple;
	bh=aH5xjrYS7yrTTwxHiBC+wjW+C1UT3DEeJqVwzTsYjpo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MbzK+7cFmnzFlmC1Y/+W6vOUFnFLFaQaaXkzw4i0iq4rQOzCVmY3oBcLjqf7QO358GpDtj56lXe/us3+fisXpq9jKD6ZHIQlcbUSASJ8yBlpFlbQdS3nSRujLpR/kS5seC/YJYYowqtmwt/K/doIj3GfI+rtOupqteS8SqpEhM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=It0IMrkn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="It0IMrkn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786934249; x=1818470249;
  h=date:from:to:cc:subject:message-id;
  bh=aH5xjrYS7yrTTwxHiBC+wjW+C1UT3DEeJqVwzTsYjpo=;
  b=It0IMrknkxL23zQ+8GCnTLP3J91Ft+ttULuWIWF54IRKUZ3iPG+vXilV
   FYkU2ePtMJB1+aVCGu+1T+3QX8dOP85nR90kQAY4wjc7HTIaugKFDRI4H
   Q2E0q4bxxPQnBiEoScinhNq9sG2broIfIgU/qyXwfXr4bhnLMMqVsJkyk
   ioyOHQzPog5E04b62u5x9O37L852R1od6PzPNv50Gn151NkMXHVM+0LAd
   To0s50KIN5IWU1pPxjMxg3qxM2tMTIkD4cKJHpWyLitk+eC1puL35tbNT
   yozfxMltzJ3IULjX28aydBbwQRvo53MmWvCdLP4Hd6Y250I5dT5oM7p/N
   g==;
X-CSE-ConnectionGUID: cAxNLV7tTCaYDxoxF0uqCw==
X-CSE-MsgGUID: wXJasOlNTly5IqKMUI6cYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="89923489"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="89923489"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 19:37:28 -0700
X-CSE-ConnectionGUID: HPknR7IRRRSxoX5tZ4nW+w==
X-CSE-MsgGUID: w4ReWRneRxSwYOg9IlMGBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="289603026"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 16 Aug 2026 19:37:27 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvnE5-000000006jv-2pG4;
	Mon, 17 Aug 2026 02:37:25 +0000
Date: Mon, 17 Aug 2026 04:37:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb:
 pcie@33800000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus',
 'pcie_phy', 'pcie_aux', 'extref'] is too long
Message-ID: <202608170456.LCuHKdhU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Rudi Heitbaum <rudi@heitbaum.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Rudi-Heitbaum/dt-bindings-pci-fsl-imx6q-pcie-Add-extref-clock-for-i-MX8MQ/20260810-021756
head:   117405804b33d47870b1e2295033d981ae9662a8
commit: 117405804b33d47870b1e2295033d981ae9662a8 arm64: dts: imx8mq: Declare the PCIe extref clock
date:   7 days ago
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-2053-20260815 (https://download.01.org/0day-ci/archive/20260817/202608170456.LCuHKdhU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170456.LCuHKdhU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608170456.LCuHKdhU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1247.27-1297.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: pcie@33800000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'extref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: pcie@33800000 (fsl,imx8mq-pcie): Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: pcie@33c00000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'extref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: pcie@33c00000 (fsl,imx8mq-pcie): Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1247.27-1297.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb: pcie@33800000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'extref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb: pcie@33800000 (fsl,imx8mq-pcie): Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains', 'vph-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb: pcie@33c00000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'extref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb: pcie@33c00000 (fsl,imx8mq-pcie): Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains', 'vph-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1247.27-1297.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: pcie@33c00000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'extref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: pcie@33c00000 (fsl,imx8mq-pcie): Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: pcie@33800000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'extref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: pcie@33800000 (fsl,imx8mq-pcie): Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains', 'vph-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: pcie@33c00000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'extref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: pcie@33c00000 (fsl,imx8mq-pcie): Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains', 'vph-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
