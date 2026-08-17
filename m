Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D22F433AD
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 01:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786930591; cv=none; b=E0sU/5ceAjxI6w9EO45zzC1WUU8rdT3dqnevnyeaI6ikfOpCed12t8j4c3cSGuHGRJJkk1KEuEhZp/y3SVwGRiG3S4rykrNX/eo+nS66MwwH7ZOnUdJPaaisvaD5pAAzbRNyoDxhWt89F7XuzjpH+jFsi/BE1JILkBqcvCSbySU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786930591; c=relaxed/simple;
	bh=gfTugF6A9X2bRNwT+nKQzQje9slNDPY1Io1+vjiD11g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SpVe8MwP4YObssQQGsAp7cS/yjmiZZ4YDjo2IlS2DHDCWieCoiIsMdwMpkW7WDJqyymsydQWCtUYaLWrpfnzJLdmPKQI6foKn7MDAtDq09+cUWRcY85IVHXg+MmyN951fvxKc8PtBNtZhk6okWoKGaALW072bNZs0blAGRjh1yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/zoNTnI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/zoNTnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786930589; x=1818466589;
  h=date:from:to:cc:subject:message-id;
  bh=gfTugF6A9X2bRNwT+nKQzQje9slNDPY1Io1+vjiD11g=;
  b=b/zoNTnInXCCXRt/P1bMq+z1NGrQrZUz11BXldwGWj3Vm6jJZig4rIlD
   coNGW4kG+RfWAqp42XUhbJjpe0PobNxicqKGsZ27vZJjm3fRHNUch7Seq
   7u6LSFk4N1/qRkQchc2a7k3jPPFEoQHOLPM0AWcXpHcW3anOl+XHcBtgn
   RHs+p4/QkFF+wsIYI98gwie7RrkcJ9zO0rGd+3JN0UfxBFFtEdQ8hAoPO
   jpfUvZsp1J/F+n3ZGv7mfz7KX7LuCMWmLfx3Sg6XLPw0hjfrU+AiYdzWL
   2gJjXPAMQiRyWp0O7j2fXk4e/CG72BljMPXca/vrLBkGTctI4a0BaJiW2
   g==;
X-CSE-ConnectionGUID: OcoZR/ZqS0eAzAJaA++SRg==
X-CSE-MsgGUID: VxDqCYQDSmuc3FBZvFq8uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98065218"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="98065218"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 18:36:28 -0700
X-CSE-ConnectionGUID: tEC2xOnBRrSHSX8xZ0j+xg==
X-CSE-MsgGUID: vJZ5PTOmTDOGiDx88AKafQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="261501082"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 16 Aug 2026 18:36:27 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvmH3-000000006jZ-1XJQ;
	Mon, 17 Aug 2026 01:36:25 +0000
Date: Mon, 17 Aug 2026 03:35:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: pcie@33800000
 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux',
 'extref'] is too long
Message-ID: <202608170301.xC3ttLVw-lkp@intel.com>
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
config: arm64-randconfig-2053-20260816 (https://download.01.org/0day-ci/archive/20260817/202608170301.xC3ttLVw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170301.xC3ttLVw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608170301.xC3ttLVw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: pcie@33800000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'extref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: pcie@33800000 (fsl,imx8mq-pcie): Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains', 'vph-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: pcie@33c00000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'extref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: pcie@33c00000 (fsl,imx8mq-pcie): Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains', 'vpcie-supply', 'vph-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1247.27-1297.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: pcie@33800000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'extref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: pcie@33800000 (fsl,imx8mq-pcie): Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains', 'vph-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: pcie@33c00000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'extref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: pcie@33c00000 (fsl,imx8mq-pcie): Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains', 'vph-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1247.27-1297.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: pcie@33800000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'extref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: pcie@33800000 (fsl,imx8mq-pcie): Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains', 'vph-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: pcie@33c00000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'extref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: pcie@33c00000 (fsl,imx8mq-pcie): Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains', 'vph-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mq-evk-pcie1-ep.dtb: pcie@33800000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'extref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-evk-pcie1-ep.dtb: pcie@33800000 (fsl,imx8mq-pcie): Unevaluated properties are not allowed ('fsl,max-link-speed', 'power-domains', 'vph-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-evk-pcie1-ep.dtb: pcie@33c00000 (fsl,imx8mq-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'extref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
