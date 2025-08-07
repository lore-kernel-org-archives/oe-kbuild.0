Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A801D23D294
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 14:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754577229; cv=none; b=tD6/JiHAIf5Eu0TFOJ800qoLLUtqV0Dd+2ntRKiSSABPzJ4NEKLhwh2gUtjQkdXG1zJKwOEHPEXkZoKP09OXh9xq6rRRhOCoNSHb+08Ab4R3BCyDu/1rI4w+2ptKaR2Es4qqlBaSKR+P8M2Ky7EteZD6+ddHGQc/kP06VEK3YQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754577229; c=relaxed/simple;
	bh=IUp/VNjv6g5GGOusILtUjTM1gTkx6RNUq87FzAyKS2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=igVVymMDKcqX833rFATLIflZ7gd/XlUGTGoMNbh3wMsJW3qDYRs1gwsh/a9MLSuuM6W79P090pgmPGPbVQsT+IpMqDBT6kK1ys/Jv8l6MoiE7tVKGxn5x3CXlsGtWtYTyoe6u4RXne6OQbBVIHRjpwCvnBuf7gmW2s6cu02XkrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USlt1Fpe; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USlt1Fpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754577228; x=1786113228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IUp/VNjv6g5GGOusILtUjTM1gTkx6RNUq87FzAyKS2c=;
  b=USlt1FpeKoiFeyumXnQisPicE35c1KXZ7HJ15Oh0XCSUOoDQtxvDu0JM
   5lAR3X262nom20xTJh4mdVlWjMhBzAftXEwGFerb0eu/25RnoJ2V3vnJ4
   0ZlGDX0px7de0FeoufLfI7gqSnajUkyLnW6vJCz0sm0zTL5KUYeBfeVMp
   v+hh2PeMRrEZzlodxulY7g6t0FVAhp99Y2tKaMTFD6KPAIpFMXj8lJaME
   aO7B21bdAzDIY7LXfeMs2cCErMlamKcOKsdmwO4DkhVQ4GZy9gjiVRzq6
   e0UGTxBPpuxjv46QXt4BN7eJ4Y5tTTkzxVf9SEdPq8IEEkLMGnQxTB3yZ
   A==;
X-CSE-ConnectionGUID: j71Nj4jSRmGuVOcwhiW0QA==
X-CSE-MsgGUID: bxj2Eg2fSYOy9dKF8lss3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74492096"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="74492096"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 07:33:45 -0700
X-CSE-ConnectionGUID: y94vIxmxTlahJAWxgXY2jg==
X-CSE-MsgGUID: Nor2g6+xS/ydZLYyePOT2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="202239544"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Aug 2025 07:33:43 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk1gb-0002t2-1f;
	Thu, 07 Aug 2025 14:33:41 +0000
Date: Thu, 7 Aug 2025 22:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 73/801]
 arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: clock@70110000
 (nvidia,tegra210-dfll): reset-names: ['dvco', 'dfll'] is too long
Message-ID: <202508072234.HesAFA5B-lkp@intel.com>
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
commit: f879014474b7b7f0ad4a4714e0f22cbd5b8c1ab9 [73/801] dt-bindings: clock: Convert nvidia,tegra124-dfll to DT schema
:::::: branch date: 21 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072234.HesAFA5B-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072234.HesAFA5B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508072234.HesAFA5B-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: clock@70110000 (nvidia,tegra210-dfll): reset-names: ['dvco', 'dfll'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/nvidia,tegra124-dfll.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: clock@70110000 (nvidia,tegra210-dfll): resets: [[3, 224], [3, 155]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/nvidia,tegra124-dfll.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: usb-phy@7d004000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
--
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: clock@70110000 (nvidia,tegra210-dfll): reset-names: ['dvco', 'dfll'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/nvidia,tegra124-dfll.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: clock@70110000 (nvidia,tegra210-dfll): resets: [[3, 224], [3, 155]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/nvidia,tegra124-dfll.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: usb-phy@7d004000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
