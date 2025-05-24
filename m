Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28417E9
	for <oe-kbuild@lists.linux.dev>; Sat, 24 May 2025 03:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748056207; cv=none; b=EuWnL0Wer4QpdIqNse8sZJGyT+MslQhiMNyZ6KgcIHU50ZJUG6uYb7M+2ivvu/T16qKhCYK0ZIBb8Vk2ZkMC5jYtRl4tlzdWkHRi258R2f4Mkma+Q/fp8UCe7RTliUa3oIEjLk+kjUUE5veTx1vXW055aJFNzMDAWsMFwk4nsTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748056207; c=relaxed/simple;
	bh=nrQUVuANaypscrZunQKtczAMUaLJz4U2NXLwLJI+GRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fg4V1oFHwmJ121NQV/tum3eD1uOHM10AHC5zBIwk5nIm0FHghLnx8X0bHytnNbS/dXeCNiHBB5gGhj4yFgmIZsc5Mu81mmoqIgHHgPm1l5SYVsx11mx1JFO9ohgYJJKnRxQ8dVJkTOL7UxhplVziXZf21IAGstneIQrR9MwRkfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oLB5ogos; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oLB5ogos"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748056204; x=1779592204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nrQUVuANaypscrZunQKtczAMUaLJz4U2NXLwLJI+GRw=;
  b=oLB5ogos4XyMpdNWgbDHIMLw6/c49SgR7D4uBWKyIM9SpvLlv3C328dQ
   afKp7+4e7Oh5HMPhM37g2med+girmnashf1p7GP13XpVPM8AQg86Gn2MO
   b7t0pIhRQPnYOWAwz5Vldym2/rfyNreU2vwdYeWlebWfp3y6wlxW3+U5I
   EU2V1rNH1+mUzpS8SRsIlEAoI4a7RYFIQcpzkhifqjevZ3REZf/g7KCBZ
   VYqi2paI8dkl63iD3wTd4yNijUeXX9Ne8SUmA9wLflR/JYsZ9kP9xWC3R
   s/ja8Q7D/bHb8twJglLC5bzg7ijzpSk1s+uUXbrKJRuHmcpcqRyN5uZj5
   g==;
X-CSE-ConnectionGUID: 64F9HjNcS+Sw2DGaWRMhVg==
X-CSE-MsgGUID: 5sH7/ItBT32+tULAaUXKXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61466988"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="61466988"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 20:10:04 -0700
X-CSE-ConnectionGUID: 51hh0ab9SKW8ZwtXxYS86g==
X-CSE-MsgGUID: poXnj4+aSLuURD844V8sUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="178522970"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa001.jf.intel.com with ESMTP; 23 May 2025 20:10:03 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIfGq-0001b0-2J;
	Sat, 24 May 2025 03:10:00 +0000
Date: Sat, 24 May 2025 11:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 32/236]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/display-pipe@228200000:
 failed to match any schema with compatible: ['apple,t8103-display-pipe',
 'apple,h7-display-pipe']
Message-ID: <202505241142.tbKyrL7N-lkp@intel.com>
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
TO: Sasha Finkelstein <fnkl.kernel@gmail.com>
CC: Janne Grunau <j@jannau.net>
CC: Nick Chan <towinchenmi@gmail.com>
CC: Neal Gompa <neal@gompa.dev>
CC: Sven Peter <sven@svenpeter.dev>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   25a6e10c983dcd254c925e79298049dfb29c1d9f
commit: 232b95d0ce111111245335e7ad02b1e5e9f659af [32/236] arm64: dts: apple: Add touchbar screen nodes
:::::: branch date: 8 days ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-2051-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241142.tbKyrL7N-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241142.tbKyrL7N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505241142.tbKyrL7N-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103.dtsi:403.34-432.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:415.25-424.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8103-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8103-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8103-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8103-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:415.25-424.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:426.26-430.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8103-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8103-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8103-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8103-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dsi@228600000/panel@0: failed to match any schema with compatible: ['apple,j293-summit', 'apple,summit']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dsi@228600000/panel@0: failed to match any schema with compatible: ['apple,j293-summit', 'apple,summit']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235100000/touchbar@0: failed to match any schema with compatible: ['apple,j293-touchbar']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: network@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
   arch/arm64/boot/dts/apple/t8103.dtsi:403.34-432.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:415.25-424.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8103-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8103-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8103-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8103-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: network@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
   arch/arm64/boot/dts/apple/t8103.dtsi:403.34-432.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:415.25-424.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8103-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8103-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8103-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8103-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: network@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
   arch/arm64/boot/dts/apple/t8103.dtsi:403.34-432.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:415.25-424.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8103-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8103-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8103-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8103-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: network@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
   arch/arm64/boot/dts/apple/t8112.dtsi:419.34-448.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:431.25-440.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8112-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8112-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: wifi@0,0 (pci14e4,4433): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
   arch/arm64/boot/dts/apple/t8112.dtsi:419.34-448.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:431.25-440.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8112-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8112-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
--
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:431.25-440.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:442.26-446.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8112-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dsi@228600000: failed to match any schema with compatible: ['apple,t8112-display-pipe-mipi', 'apple,h7-display-pipe-mipi']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dsi@228600000/panel@0: failed to match any schema with compatible: ['apple,j493-summit', 'apple,summit']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dsi@228600000/panel@0: failed to match any schema with compatible: ['apple,j493-summit', 'apple,summit']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@23510c000/touchbar@0: failed to match any schema with compatible: ['apple,j493-touchbar']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
