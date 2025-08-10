Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6AE4207F
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 18:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754851334; cv=none; b=cUhMpMmqsvCjZa5gYjyWTtmNy8ROTWj1TkD3s83WarHsv+25zTAb5yA2L2oh95nkO/s+lVsxuhBJIhqlq37LF/20r/nV7ntep8lX9PUKoYgak5YT3jZIwS8Jb2UOStaT2zku/5GGyYL+vFtP8w5+xcLQCr6Nv/9A/bcCmb0V6k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754851334; c=relaxed/simple;
	bh=6yNwRdUagY1OXT8XKUIsY5UfnYaU7VqZjWC922UEr0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gK/uZFxTzOXGu7OX9G1aPhazQR7b+ObB9KR1PamneWVzuzLfHHIT/XhsAJJkn1oWVvGZ7woijhqqz7pw9efGtDBJR1AIYWMn6iZDVi8JX366Mt1UlHV4xZM1ro0CCCxguGB4UuaC3TUzAxDPBC3u5u4y7enQc90i7e49cHCZqBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3jvshEp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3jvshEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754851332; x=1786387332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6yNwRdUagY1OXT8XKUIsY5UfnYaU7VqZjWC922UEr0M=;
  b=N3jvshEpZqvwnyztsM5a4Jm34N7G90xJeS6nMzc9hZ5IOYqhrIUdOpVu
   DAnoC5J/1ZhphPETicyA6ZkBoSYLHFZu24eUvZUMaaVp+x2ZZrjy0/9tY
   /Oh5b9mk3rbBxBkVCYrRl2D9UUZiYZbX7Fw1CNnwkUjmkHdX77mZGZFs2
   rodO6z94IC07IYwmRFzWnL5Yn0+kxyx+ffI906BKJKhZPWhZ2G+HWv7Hi
   xhzm5UlKD/geSZDG5cSyekIWBWpKd6PiWEPxjzw4+JLfFo9Uymn2fpYfp
   VW04sbOk9K2s7+pE+s64mAMWLj+9q0my9odT9s8WG1RJnQNkZ0RzIrRIh
   A==;
X-CSE-ConnectionGUID: eumtQqNrSV6HuKyhwNz+PA==
X-CSE-MsgGUID: NyNCTjZhRxOMAf+B9HV7Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68566856"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68566856"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 11:42:11 -0700
X-CSE-ConnectionGUID: IgRlsrKGQRasI22qz6IgOg==
X-CSE-MsgGUID: YmriyOa6TRq4EAa9LlBxsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196561728"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 10 Aug 2025 11:42:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulAzW-0005PI-0I;
	Sun, 10 Aug 2025 18:42:04 +0000
Date: Mon, 11 Aug 2025 02:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 23/801]
 arch/arm/boot/dts/marvell/armada-390-db.dtb: pmsu@22000
 (marvell,armada-390-pmsu): compatible:0: 'marvell,armada-390-pmsu' is not
 one of ['marvell,armada-370-pmsu', 'marvell,armada-380-pmsu',
 'marvell,armada-370-xp-pmsu']
Message-ID: <202508110254.UmcS4Ez7-lkp@intel.com>
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
commit: baa0ce8d78c6b8cfa07650ce0f72842e26cac415 [23/801] dt-bindings: arm: Convert marvell/marvell,armada-370-pmsu to DT schema
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250811/202508110254.UmcS4Ez7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508110254.UmcS4Ez7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508110254.UmcS4Ez7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/armada-390-db.dtb: interrupt-controller@d000 (arm,cortex-a9-gic): '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-390-db.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6920-pinctrl']
   arch/arm/boot/dts/marvell/armada-390-db.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-390-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-390-db.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-390-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-390-db.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-390-db.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
   arch/arm/boot/dts/marvell/armada-390-db.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-390-db.dtb: /soc/internal-regs/mpcore-soc-ctrl@20d20: failed to match any schema with compatible: ['marvell,armada-380-mpcore-soc-ctrl']
   arch/arm/boot/dts/marvell/armada-390-db.dtb: /soc/internal-regs/coherency-fabric@21010: failed to match any schema with compatible: ['marvell,armada-380-coherency-fabric']
>> arch/arm/boot/dts/marvell/armada-390-db.dtb: pmsu@22000 (marvell,armada-390-pmsu): compatible:0: 'marvell,armada-390-pmsu' is not one of ['marvell,armada-370-pmsu', 'marvell,armada-380-pmsu', 'marvell,armada-370-xp-pmsu']
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,armada-370-pmsu.yaml#
>> arch/arm/boot/dts/marvell/armada-390-db.dtb: pmsu@22000 (marvell,armada-390-pmsu): compatible: ['marvell,armada-390-pmsu', 'marvell,armada-380-pmsu'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,armada-370-pmsu.yaml#
   arch/arm/boot/dts/marvell/armada-390-db.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-390-pmsu', 'marvell,armada-380-pmsu']
   arch/arm/boot/dts/marvell/armada-390-db.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-390-db.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-390-db.dtb: pcie (marvell,armada-370-pcie): $nodename:0: 'pcie' does not match '^pcie?@'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml#
   arch/arm/boot/dts/marvell/armada-390-db.dtb: pcie (marvell,armada-370-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml#
--
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: interrupt-controller@d000 (arm,cortex-a9-gic): '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6925-pinctrl']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-390-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-390-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/mpcore-soc-ctrl@20d20: failed to match any schema with compatible: ['marvell,armada-380-mpcore-soc-ctrl']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/coherency-fabric@21010: failed to match any schema with compatible: ['marvell,armada-380-coherency-fabric']
>> arch/arm/boot/dts/marvell/armada-395-gp.dtb: pmsu@22000 (marvell,armada-390-pmsu): compatible:0: 'marvell,armada-390-pmsu' is not one of ['marvell,armada-370-pmsu', 'marvell,armada-380-pmsu', 'marvell,armada-370-xp-pmsu']
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,armada-370-pmsu.yaml#
>> arch/arm/boot/dts/marvell/armada-395-gp.dtb: pmsu@22000 (marvell,armada-390-pmsu): compatible: ['marvell,armada-390-pmsu', 'marvell,armada-380-pmsu'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/marvell/marvell,armada-370-pmsu.yaml#
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-390-pmsu', 'marvell,armada-380-pmsu']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'clock-frequency', 'no-1-8-v', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
