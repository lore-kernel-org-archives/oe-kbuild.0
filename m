Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35D623F424
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Aug 2025 16:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754498399; cv=none; b=ZwDtxagDQaYfhUHrXaUKKql2lYj9Mb1RA2bLDJ0kCLwnrK4L4zYtEi4SYtFs6eLycj+ilSHEJjJzaWLgVN9uO/HMOUsHICSFHbdgYyf6gYzhzmpgb5xA3WiYLAxKBOBK/cqiNMqxHvndIMdETViS7/FfYCOCImKMGeKfpBEcjlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754498399; c=relaxed/simple;
	bh=QDnNen6iSRK2JDS4Uq0bhN9T16vdKMkugLph9hAQFsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Asafe/8H1JXR3gyym1Mteb5FlufHSY8aB9KOk+AwyF+xXg3K8a1VA56k+h+Qx5VYictQ6z4e/jNDqJ2Tzhx0qF2fn/8e+8Cwa7eC743bfY2JH3MXugQ4Cj08Z4GI/kiX5BCUAxFwnWp2QsL23VfF8uhTLyly5Y0X7jawvH9mLvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVASkFhj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVASkFhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754498397; x=1786034397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QDnNen6iSRK2JDS4Uq0bhN9T16vdKMkugLph9hAQFsM=;
  b=UVASkFhjR3JesEV4J+d95wGLCadT7M/m1B+fkbXGvXuaO/3xpvqScJsz
   lOIqdvtQw6hvaYLr4luZUvTJ2IF6loInNV5X5zvI1hEQ0n5SYtQFwtDz5
   zfu2T+nlCgZ4RxHvKH6wF+Nw6Uqh7kUkCtdPBl7UN5kOCElyjaYB2Flfd
   BC4F+x45HMovYz7hsKys0QTw8FDC9FfFn8WzUb4jnk53SqYkq8cMDmruP
   WWCVBNoBi727mF64quWGwPhV1D8EZHxBWN/+fvWqJwTpbY/xXb1U2ur2t
   48AGITH1zrbTDpIh5VcAoh5EHVooLnbqRboXpS6TjZ1zgYQwrZ4wHqFDK
   g==;
X-CSE-ConnectionGUID: mkK87sG+SHOruJ8kaYsfow==
X-CSE-MsgGUID: 4DvuH7IMTSCiTFO/V04sLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74403084"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="74403084"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 09:39:56 -0700
X-CSE-ConnectionGUID: pcXjM70STnSg4sRgYkRkoA==
X-CSE-MsgGUID: z8g6WPdQSLau0y66Iv2G2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164830525"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Aug 2025 09:39:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujhBA-0001t8-26;
	Wed, 06 Aug 2025 16:39:52 +0000
Date: Thu, 7 Aug 2025 00:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:asahi-wip 17/208]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@702280000 (apple,t6000-dwc3):
 iommus: [[131, 0], [132, 1]] is too long
Message-ID: <202508070031.dG8Aghgk-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: d60c31602a7c8d3dba30885247aa3b03e96aa31c [17/208] arm64: dts: apple: t600x: Add dwc3 nodes
:::::: branch date: 3 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-052-20250804 (https://download.01.org/0day-ci/archive/20250807/202508070031.dG8Aghgk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070031.dG8Aghgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508070031.dG8Aghgk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:113.45-116.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmic@f/nvmem-layout/boot-error-count@6002: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmic@f/nvmem-layout/panic-count@6002)
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:72.10-81.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:98.10-107.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:124.10-133.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3b/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[131, 0], [132, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[135, 0], [136, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[139, 0], [140, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[143, 0], [144, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:113.45-116.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmic@f/nvmem-layout/boot-error-count@6002: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmic@f/nvmem-layout/panic-count@6002)
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:72.10-81.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:98.10-107.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:124.10-133.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3b/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[145, 0], [146, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[149, 0], [150, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[153, 0], [154, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[157, 0], [158, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:113.45-116.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmic@f/nvmem-layout/boot-error-count@6002: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmic@f/nvmem-layout/panic-count@6002)
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:72.10-81.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:98.10-107.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:124.10-133.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3b/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[131, 0], [132, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[135, 0], [136, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[139, 0], [140, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[143, 0], [144, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:113.45-116.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmic@f/nvmem-layout/boot-error-count@6002: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmic@f/nvmem-layout/panic-count@6002)
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:72.10-81.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:98.10-107.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:124.10-133.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3b/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[145, 0], [146, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[149, 0], [150, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[153, 0], [154, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[157, 0], [158, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:113.45-116.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmic@f/nvmem-layout/boot-error-count@6002: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmic@f/nvmem-layout/panic-count@6002)
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:58.10-67.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:84.10-93.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:110.10-119.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3b/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:136.10-145.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3c/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[146, 0], [147, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[150, 0], [151, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[154, 0], [155, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[158, 0], [159, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@1302280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:58.10-67.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:84.10-93.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:110.10-119.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3b/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:136.10-145.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3c/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6002-j375d.dts:36.10-45.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@39/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6002-j375d.dts:63.10-72.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3a/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[165, 0], [166, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[169, 0], [170, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@f02280000 (apple,t6000-dwc3): iommus: [[173, 0], [174, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@f02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[177, 0], [178, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@1302280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[248, 0], [249, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[252, 0], [253, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
