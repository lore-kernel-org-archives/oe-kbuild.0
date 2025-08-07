Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9319482EB
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 22:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754604187; cv=none; b=f1NN42/QkrckiI/IqWlxBw2pTK1UUlKkQgjynR84eJtCzlX2n+F4Rc8bVJbK+8gXhu8NAkPeeRQuk16gfwE2G15bqxNlNDfAOf8SqY8lnvhEDHvLDo/B+7ELLDlvsm3NhLYglBSA6hw9f87I2L92G/nBTLyxGwth5Y6ByK/zcOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754604187; c=relaxed/simple;
	bh=cxzmOQeQ1qMrfTOr0bwNKmJZBTbw7SOcPEHOJBT2o9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aEsSwMmEUAQ4s2UE5ioDCeq6sfEUzTIFSKWQqdW+mC+ln7/DBrzA+xQT7sUos76ZWkIm2Ukg15ZakCYVxcg49QtIlshAnM6eWxA0kIngwte4qLODZXl1ZiowkPPLhRxmm9oUeemz6dkfpM0s70zJTucb7DHAyRyTY1sh14GKUgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Or3xhaTu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Or3xhaTu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754604186; x=1786140186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cxzmOQeQ1qMrfTOr0bwNKmJZBTbw7SOcPEHOJBT2o9g=;
  b=Or3xhaTutO3UQUFqCoulEoAfXHY22K1Ppa8iijDcykhPN1n32qvAV/UY
   KePfCsZ0a2AXX0rIeGXkMow8n1LKLtfSmzp5ZXDLpiYI+OZ4tmTHJhaCc
   0acHATfFaVHTEJXSNp27gL121PG2CwBLpcDy3yMkmSzUZBWfmv+VGKHcs
   agOovE9i8+9oghaKrjS844KP2CetusPuBLwxcaJjcXUfQxy3LfJ7dAL/3
   fzV8vMsHQdbETTKkd955On1hLde//AykGNDqgA80g/5h0NyQ/P5zVR4Sq
   PL3dFAX945OqAokb9OzDK5PZVx/6rlccv6Sqk2VAhHYm8u1YGB21ZAA07
   A==;
X-CSE-ConnectionGUID: FDXDy+AKRta8nuLrw0foOw==
X-CSE-MsgGUID: UILMxiVSRFGkCaH/cstFnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56668708"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56668708"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 15:03:05 -0700
X-CSE-ConnectionGUID: Wep1bX9mRvWnrl22srqLBQ==
X-CSE-MsgGUID: dNGBRnqBTGeZP1hQa4K1rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="169291405"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 07 Aug 2025 15:03:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk8hS-0003IS-0U;
	Thu, 07 Aug 2025 22:03:02 +0000
Date: Fri, 8 Aug 2025 06:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 175/801]
 arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: gpu@57000000
 (nvidia,gm20b): clock-names: ['gpu', 'pwr', 'ref'] is too long
Message-ID: <202508080540.ViqtwIP6-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 2b20cbe44b51244ca2dd702835d3b70c7cf2bccd [175/801] dt-bindings: gpu: Convert nvidia,gk20a to DT schema
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080540.ViqtwIP6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080540.ViqtwIP6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080540.ViqtwIP6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: gpu@57000000 (nvidia,gm20b): clock-names: ['gpu', 'pwr', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/nvidia,gk20a.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: gpu@57000000 (nvidia,gm20b): clocks: [[3, 184], [3, 299], [3, 189]] is too long
   	from schema $id: http://devicetree.org/schemas/nvidia,gk20a.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: gpu@57000000 (nvidia,gm20b): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,gm20b'] is too short
   	'nvidia,gk20a' was expected
   	from schema $id: http://devicetree.org/schemas/nvidia,gk20a.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: clock@70110000 (nvidia,tegra210-dfll): reset-names: ['dvco', 'dfll'] is too long
--
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
>> arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: gpu@57000000 (nvidia,gm20b): clock-names: ['gpu', 'pwr', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/nvidia,gk20a.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: gpu@57000000 (nvidia,gm20b): clocks: [[3, 184], [3, 299], [3, 189]] is too long
   	from schema $id: http://devicetree.org/schemas/nvidia,gk20a.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: gpu@57000000 (nvidia,gm20b): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,gm20b'] is too short
   	'nvidia,gk20a' was expected
   	from schema $id: http://devicetree.org/schemas/nvidia,gk20a.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: clock@70110000 (nvidia,tegra210-dfll): reset-names: ['dvco', 'dfll'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
