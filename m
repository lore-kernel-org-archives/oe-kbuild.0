Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA7E33CE80
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Feb 2026 17:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771347718; cv=none; b=eBBfbZCSSbWD/gHuUHGxaREBWWZzLB2C9R9sTS02EXRUESl1b7INQf+CgzrhDAE4XnM4G6sHbOxrToqhNOxUsvnefdXwDLfqHpaLP4s0OXWXF39ry1aWY7eLpSoCUP7t72/4/R/rl55MWXSo2w6EIKjumVj6yBJ04jvTv40SJiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771347718; c=relaxed/simple;
	bh=M0d3YPP89WgT/L4OrzEczf+FUdUKi1GhcLmOjxorO1k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BUjPoFuUxdAPzSLb2ZyWGZFKjg6qOwNZ8oeoxFK6+kngdaeZ3NtCuMhv8f/XqKbsMZ4N8Y/2o7NY2a92t9wvaO1akyyPLa5RqwuUDxJLy0oQeOXPcpjD7Xv7P9W+k2W4XyIpXNEEOwFd17ijFg+HwiLIvyKGH/c8wUjjLHI5q8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmxOqcGg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmxOqcGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771347715; x=1802883715;
  h=date:from:to:cc:subject:message-id;
  bh=M0d3YPP89WgT/L4OrzEczf+FUdUKi1GhcLmOjxorO1k=;
  b=BmxOqcGgWMfCSa+7v1powvFrJjSBjRUUSb+7jthI9deL2WsWtZzUQJNi
   QUGdNIPJd5Hp3AhGN9YfR3+G2wul6+H0TLKEhR6952hW798I2EjWR5wob
   85XIfBWTC7kiyWbUrpHQMBKVfzP/tYRK+pA0jLUOhYeDoDwO9qBuMtHs3
   IKTcvHSEG1rNXMRVlU57S/G27oGR6D4WYiF40scRfIEKPp7zMZxlI4gLN
   Vfb9x5cskczq4USz0xbGsBjKYbU5ypnLY0irvuWNQ36S8zwgyIfEvAg2y
   W08f9CMTTcCGxCWsD3pwg+BJzxH/gVe/uK2bIp/r0zZc8BFDFyctX3VEx
   Q==;
X-CSE-ConnectionGUID: 8cLjvfUEQXOMEgnoHq0H/A==
X-CSE-MsgGUID: Y/Hz8zIKTvaq4NtkFKaPtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="97882022"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="97882022"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 09:01:55 -0800
X-CSE-ConnectionGUID: Dv9GmOfAQYWHGnpTa84hww==
X-CSE-MsgGUID: HFx0gGYqTwOpOjI1px0BEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213182013"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 17 Feb 2026 09:01:55 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsOSP-0000000033B-15Ic;
	Tue, 17 Feb 2026 17:01:53 +0000
Date: Tue, 17 Feb 2026 18:01:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/st/stih410-b2260.dtb:
 /soc/display-controller@9d11000: failed to match any schema with compatible:
 ['st,stih407-compositor']
Message-ID: <202602171856.TVW4toMD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Raphael Gallais-Pou" <rgallaispou@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   57d76ceccee4b497eb835831206b50e72915a501
commit: 7891011fbc9a5e0c07af7c032ba04a2e16587c2e ARM: dts: sti: extract display subsystem out of soc
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-2053-20260215 (https://download.01.org/0day-ci/archive/20260217/202602171856.TVW4toMD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171856.TVW4toMD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602171856.TVW4toMD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-player@8d80000: failed to match any schema with compatible: ['st,stih407-uni-player-hdmi']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-player@8d81000: failed to match any schema with compatible: ['st,stih407-uni-player-pcm-out']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-player@8d82000: failed to match any schema with compatible: ['st,stih407-uni-player-dac']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-player@8d85000: failed to match any schema with compatible: ['st,stih407-uni-player-spdif']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-reader@8d83000: failed to match any schema with compatible: ['st,stih407-uni-reader-pcm_in']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-reader@8d84000: failed to match any schema with compatible: ['st,stih407-uni-reader-hdmi']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/usb@9a03c00: failed to match any schema with compatible: ['st,st-ohci-300x']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/usb@9a03e00: failed to match any schema with compatible: ['st,st-ehci-300x']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/usb@9a83c00: failed to match any schema with compatible: ['st,st-ohci-300x']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/usb@9a83e00: failed to match any schema with compatible: ['st,st-ehci-300x']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/display-controller@9d11000: failed to match any schema with compatible: ['st,stih407-compositor']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/encoder@8d08000: failed to match any schema with compatible: ['st,stih407-tvout']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: encoder@8d08000 (st,stih407-tvout): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/hdmi@8d04000: failed to match any schema with compatible: ['st,stih407-hdmi']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/analog@8d02000: failed to match any schema with compatible: ['st,stih407-hda']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/plane@9c00000: failed to match any schema with compatible: ['st,stih407-hqvdp']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/bdisp@9f10000: failed to match any schema with compatible: ['st,stih407-bdisp']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/hva@8c85000: failed to match any schema with compatible: ['st,st-hva']
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpus: cpu@0: 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpus: cpu@1: 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpu@0 (arm,cortex-a9): 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('#cooling-cells', 'clock-names', 'clocks', 'device_type', 'st,syscfg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpu@1 (arm,cortex-a9): 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('#cooling-cells', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: /restart-controller: failed to match any schema with compatible: ['st,stih407-restart']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /softreset-controller: failed to match any schema with compatible: ['st,stih407-softreset']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /miphy28lp: failed to match any schema with compatible: ['st,miphy28lp-phy']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /st231-gp0: failed to match any schema with compatible: ['st,st231-rproc']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /st231-delta: failed to match any schema with compatible: ['st,st231-rproc']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /delta0: failed to match any schema with compatible: ['st,st-delta']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /display-subsystem: failed to match any schema with compatible: ['st,sti-display-subsystem']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: display-subsystem (st,sti-display-subsystem): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
