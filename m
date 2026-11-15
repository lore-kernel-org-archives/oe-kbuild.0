Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737816;
	b=ercDWnMZOTt/bLGDUW1b8rEwh6BMECA+pxmuOnb0clD84Gmmx4Rre89Ek+6cabOrRzKd
	 VAm29WzZwpsD3no1qZVyw/G0tv+wyvFbWcqyr50RVqW73lN1HkbahUp84LHtesY71noI5
	 DnnBcNc7vCTR/Z8iu+C9C1zkyI0BWK8vPWLpEq1n3G/7KzRwUj+Zxru2sP+qMwLB6VBeD
	 Y1T5s7LQxMBcxCjRTjgy9JSTXzl1r+laiEwsB6uTf4a5PS/Y03G+AdBLn0iBD0Rg8qGiD
	 cGuq5v0thuKRT8DwQlMKFBSRhxaVGW5eR/GK48Sx034X6CzZyKOnDDd0RMiMzF6YtwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737816;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=j7aR/8L0ayHSv3xPe/Yq3ulbpAvTvcqOTXiqYpjb7CY=;
	b=WG3FobFjJRU8F9W8IG+S0WPhoYcjMWYn2PKVolMQvYs/zfYjXKdYQKEUCXsr6I3ofxn+
	 lv095p8w9LfwDv0K/oq5/cCIibt6IdnEhb2o4QXwtFIEgeWzuqE/ytJAv8POw2hFlKRuZ
	 HFEsT5WxKtNjH8fzCwLbwFSNG9njyEKjGhNr6UiOlECfSJ7KQq4FjIQ/KPjDabWeA6D/2
	 n+74vHnI2EWvKiD19QHlX0QR3cjrVTsfWuuqEOz4x2nPGlc0TvUMRUI6qR7O/NfxGvEJX
	 vth67J/Noq2hbizTOOVFx7T2M+Z4jmEwqGLE5a6FIoER5JhgBcBkZUgqL5ko9mxUuZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WJNOwlF5;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7929B606A323
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 10:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7929B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WJNOwlF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794737815; x=1826273815;
  h=date:from:to:cc:subject:message-id;
  bh=EWVGcgb3u687bosV9NAuO/cqcNjgilpL3ZUk7zzE3IA=;
  b=WJNOwlF51ajKVP54hT6Iowi+o0R8d+vHub6tJErYZDG11GDvATbgk+ax
   2zKJcoTmotEZHL3ZxQ1QdZ6/DlUCLg1WbnkCh7kWH4wh5+4aL4RudmHay
   TdoaySZw5FqA08GeTzfV7srEKlwvD+3hLMvgJwIkWDfgKbtiKDGvvkZ2A
   DDMOh1avDLq7TFShRsBfOaq9SHpMTya8c/I3fHMBS0CGCoSwmAWGcD90s
   uLNVMpCz7HUoikYsaU9yT0sdfM6qQVGE7k2XD4iJA06NAEtuuXX3FHfWB
   /s0Vj3Nvdy2WRgzCrpbZTyotT2NgjV6QKVUPC3huyDIcBOmp1YZDk7XA3
   w==;
X-CSE-ConnectionGUID: D7BQRxbCSvKxEYEOvQFK3Q==
X-CSE-MsgGUID: dxc+5F+dTKuwVvNJFvkegg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3387210"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3387210"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 02:16:55 -0800
X-CSE-ConnectionGUID: ZhFzNXTKSHOwNVii/yOdOA==
X-CSE-MsgGUID: zDLR0RkuRAyZxrQcWtUHXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9139800"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 15 Nov 2026 02:16:54 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSXI3-0000000028i-3FiQ;
	Sun, 15 Nov 2026 10:16:51 +0000
Date: Sun, 15 Nov 2026 11:16:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 82/242]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e20c000
 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202611151103.UgwSrbFW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   c46abf5713fa41e1574fb50c462f53392d6f5cd7
commit: 3e2114629f945662e8f83d3d3db1eba2f8a9db2b [82/242] DROP_v7.4: arm64: dts: apple: t600x: Add legacy "apple,dcs-min-ps" property
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261115/202611151103.UgwSrbFW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev6+ged91b647c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151103.UgwSrbFW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151103.UgwSrbFW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
