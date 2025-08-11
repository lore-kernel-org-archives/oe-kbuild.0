Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35883296BC7
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Aug 2025 17:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754932447; cv=none; b=p1iKb+ikRjQXJrFxLbM735Dp9Bh24VNOKI3oKi0gxYwpNN9yk5oxXXGX/BKJlHLmEzANQiL3omy3rNR1ulRrTSjUEqRQbDrSsTH5gjlZdKwRVQH2MJ5m0h6ra0HstDHGRF0Vs/QMqSqC9KDYLdxMkR7S+oPHoT9iah2gWYGcHtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754932447; c=relaxed/simple;
	bh=Y6r+jt5Xsy0jGjmkqsaDtc203iKt+uOca6bq6t2ZL/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QtUWQRo8c43KHQKeuiqG6YnPJT5tNSSELK9vIkrVHI/JV9fguJM0ulN8sljFoe1AgO6PqsuAL6fzV4G++au7JZXPMoTrPEJuceAwpkWRIGdmGctgQ1FUoCr8sFt43kb8R0RXzB7R3yaS1TzRHNkB6vRP0Xm0flKt5y9lA3YIi70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eSoFr8K+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eSoFr8K+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754932442; x=1786468442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y6r+jt5Xsy0jGjmkqsaDtc203iKt+uOca6bq6t2ZL/4=;
  b=eSoFr8K+uHgWL3roXCXLndukbldqBP4hVGtWjgUANcyAYq4iyO2Wgy5j
   6C/3hBkzXCBs2vdlvoaWEQUVPDoI4t4BYHR/YyAIFPgEKwqirRzeHODpS
   txyDajRg2fc0hFK5Smhte73QY6/LkvhWKAzdOQYPm3WbZxwzaHGHTRVhX
   2wkGFQaxdjQN/jz7JOx0lw8PLWZQAlEuCwJbQzmpfI9gikMD0Ke6dBXC9
   8jb2WqMIt1EyFBSU9D8oKrYtc2Wo45MrIK+Av8CtclPi99VGoCEOY2H+W
   RG0CnOg6ECZ65Ho724g11J/iec0SPp8NiztwxtUtDZouCN2XnZv8h1WLX
   A==;
X-CSE-ConnectionGUID: 7oLT1+VaR3u/r44/++O/rQ==
X-CSE-MsgGUID: MavKhvX4TXO+xt1bydvVGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67462289"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="67462289"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 10:14:01 -0700
X-CSE-ConnectionGUID: EiD3nLXQTeyYIYC8JaGfOg==
X-CSE-MsgGUID: U9poajN9QYG7Y3tSni3CvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196965998"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 11 Aug 2025 10:13:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulW5j-000655-2J;
	Mon, 11 Aug 2025 17:13:50 +0000
Date: Tue, 12 Aug 2025 01:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 2/9]
 arch/arm64/boot/dts/nvidia/tegra132.dtsi:32.3-41: Warning (interrupt_map):
 /pcie@1003000:interrupt-map: Missing property '#address-cells' in node
 /interrupt-controller@50041000, using 0 as fallback
Message-ID: <202508120121.bSn3JfH9-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   18adc1b2661a506b233aa53c4fbe2243c7f4db20
commit: 2a52e4d89847745f8ab76265199a371ef5e7f93f [2/9] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-001-20250811 (https://download.01.org/0day-ci/archive/20250812/202508120121.bSn3JfH9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120121.bSn3JfH9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508120121.bSn3JfH9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra132.dtsi:32.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
--
>> arch/arm64/boot/dts/hisilicon/hip07.dtsi:1742.4-1745.40: Warning (interrupt_map): /soc/pcie@af800000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@a0080000/intc_pcie2_a, using 0 as fallback
>> arch/arm64/boot/dts/hisilicon/hip07.dtsi:1742.4-1745.40: Warning (interrupt_map): /soc/pcie@af800000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@a0080000/intc_pcie2_a, using 0 as fallback
>> arch/arm64/boot/dts/hisilicon/hip07.dtsi:1742.4-1745.40: Warning (interrupt_map): /soc/pcie@af800000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@a0080000/intc_pcie2_a, using 0 as fallback
>> arch/arm64/boot/dts/hisilicon/hip07.dtsi:1742.4-1745.40: Warning (interrupt_map): /soc/pcie@af800000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@a0080000/intc_pcie2_a, using 0 as fallback
--
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts:535.22-540.5: Warning (unit_address_vs_reg): /soc/i2s@f7118000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts:302.25-304.6: Warning (unit_address_vs_reg): /soc/dsi@f4107800/ports/port@1/endpoint@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/hisilicon/hi6220.dtsi:301.26-307.5: Warning (simple_bus_reg): /soc/stub_clock: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi6220.dtsi:772.19-777.5: Warning (simple_bus_reg): /soc/usbphy: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi6220.dtsi:875.17-913.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi:63.14-97.5: Warning (simple_bus_reg): /soc/replicator: missing or empty reg/ranges property
>> arch/arm64/boot/dts/hisilicon/hi6220.dtsi:408.25-445.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@f7010000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/hisilicon/hi6220.dtsi:447.25-454.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@f7010800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/hisilicon/hi6220.dtsi:456.25-463.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@f8001800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/hisilicon/hip06.dtsi:751.4-754.37: Warning (interrupt_map): /soc/pcie@b0000000:interrupt-map: Missing property '#address-cells' in node /mbigen_pcie@a0080000/intc_pcie0, using 0 as fallback
>> arch/arm64/boot/dts/hisilicon/hip06.dtsi:751.4-754.37: Warning (interrupt_map): /soc/pcie@b0000000:interrupt-map: Missing property '#address-cells' in node /mbigen_pcie@a0080000/intc_pcie0, using 0 as fallback
>> arch/arm64/boot/dts/hisilicon/hip06.dtsi:751.4-754.37: Warning (interrupt_map): /soc/pcie@b0000000:interrupt-map: Missing property '#address-cells' in node /mbigen_pcie@a0080000/intc_pcie0, using 0 as fallback
>> arch/arm64/boot/dts/hisilicon/hip06.dtsi:751.4-754.37: Warning (interrupt_map): /soc/pcie@b0000000:interrupt-map: Missing property '#address-cells' in node /mbigen_pcie@a0080000/intc_pcie0, using 0 as fallback
--
>> arch/arm64/boot/dts/toshiba/tmpv7708.dtsi:503.4-507.28: Warning (interrupt_map): /soc/pcie@28400000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@24001000, using 0 as fallback
>> arch/arm64/boot/dts/toshiba/tmpv7708.dtsi:503.4-507.28: Warning (interrupt_map): /soc/pcie@28400000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@24001000, using 0 as fallback
>> arch/arm64/boot/dts/toshiba/tmpv7708.dtsi:503.4-507.28: Warning (interrupt_map): /soc/pcie@28400000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@24001000, using 0 as fallback
>> arch/arm64/boot/dts/toshiba/tmpv7708.dtsi:503.4-507.28: Warning (interrupt_map): /soc/pcie@28400000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@24001000, using 0 as fallback
--
>> arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi:1000.2-41: Warning (interrupt_map): /soc@0/pcie@15700000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@11001000, using 0 as fallback
   arch/arm64/boot/dts/exynos/exynos5433.dtsi:978.10-989.6: Warning (graph_child_address): /soc@0/decon@13800000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi:333.8-343.4: Warning (graph_child_address): /soc@0/decon@13880000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/exynos/exynos5433.dtsi:1043.10-1053.6: Warning (graph_child_address): /soc@0/dsi@13900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi:915.4-918.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi:915.4-918.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi:915.4-918.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi:915.4-918.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
--
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:396.22-399.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@3: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:401.22-406.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@4: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:408.24-411.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@5: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:413.22-416.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@6: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:418.22-421.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@7: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:423.29-426.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@8: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:438.11-442.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:444.11-448.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts:77.10-81.5: Warning (unit_address_vs_reg): /spdif-out/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts:88.10-92.5: Warning (unit_address_vs_reg): /comp-spdif-out/port@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:941.4-944.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:941.4-944.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:941.4-944.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:941.4-944.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
--
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:396.22-399.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@3: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:401.22-406.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@4: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:408.24-411.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@5: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:413.22-416.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@6: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:418.22-421.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@7: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:423.29-426.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@8: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:438.11-442.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:444.11-448.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts:71.10-75.5: Warning (unit_address_vs_reg): /spdif-out/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts:82.10-86.5: Warning (unit_address_vs_reg): /comp-spdif-out/port@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:941.4-944.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:941.4-944.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:941.4-944.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:941.4-944.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
--
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:384.22-387.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:389.22-394.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:396.22-399.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@3: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:401.22-406.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@4: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:408.24-411.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@5: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:413.22-416.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@6: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:418.22-421.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@7: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:423.29-426.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@8: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:438.11-442.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:444.11-448.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:941.4-944.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:941.4-944.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:941.4-944.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:941.4-944.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4817.26-4890.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4085.10-4095.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/msm8916.dtsi:1604.27-1652.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:463.26-466.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:478.26-481.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:491.26-494.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:503.26-506.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1591.11-1601.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:4848.27-4921.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:4942.27-4996.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2166.4-2169.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2166.4-2169.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2166.4-2169.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2166.4-2169.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
--
>> arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/sa8775p.dtsi:4485.28-4546.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sa8775p.dtsi:4567.28-4619.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sa8775p.dtsi:7611.3-7614.29: Warning (interrupt_map): /pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sa8775p.dtsi:7611.3-7614.29: Warning (interrupt_map): /pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sa8775p.dtsi:7611.3-7614.29: Warning (interrupt_map): /pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sa8775p.dtsi:7611.3-7614.29: Warning (interrupt_map): /pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sa8775p.dtsi:7777.3-7780.29: Warning (interrupt_map): /pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sa8775p.dtsi:7777.3-7780.29: Warning (interrupt_map): /pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sa8775p.dtsi:7777.3-7780.29: Warning (interrupt_map): /pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sa8775p.dtsi:7777.3-7780.29: Warning (interrupt_map): /pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
--
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:3960.27-4032.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:4053.27-4106.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
--
>> arch/arm64/boot/dts/qcom/msm8939.dtsi:1302.27-1351.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8939.dtsi:504.26-507.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:524.26-527.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:549.24-552.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:559.26-562.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
--
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1221.11-1231.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/msm8939.dtsi:1302.27-1351.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8939.dtsi:504.26-507.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:524.26-527.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:549.24-552.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:559.26-562.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:579.26-582.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
--
>> arch/arm64/boot/dts/qcom/msm8976.dtsi:987.27-1061.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8976.dtsi:1063.27-1118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8004.dtsi:14.23-23.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8950.dtsi:176.9-185.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8976.dtsi:510.27-513.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s0-p1@219: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s0-p2@219)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:530.27-533.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s2-p1@21c: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s2-p2@21c)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:555.27-558.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s4-p1@221: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s4-p2@221)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:575.27-578.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s6-p1@224: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s6-p2@224)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:595.25-598.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@228: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s8-p1@228)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:605.27-608.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s8-p2@229: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p1@229)
--
>> arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:4942.27-4996.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2166.4-2169.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2166.4-2169.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2166.4-2169.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2166.4-2169.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi:740.9-751.5: Warning (graph_child_address): /soc@0/spmi@c440000/pmic@2/typec@1500/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
--
>> arch/arm64/boot/dts/qcom/sc7180.dtsi:1085.21-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/msm8976.dtsi:987.27-1061.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8976.dtsi:1063.27-1118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8004.dtsi:14.23-23.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8950.dtsi:176.9-185.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts:111.20-139.4: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@78b6000/led-controller@30: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8976.dtsi:510.27-513.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s0-p1@219: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s0-p2@219)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:530.27-533.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s2-p1@21c: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s2-p2@21c)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:555.27-558.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s4-p1@221: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s4-p2@221)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:575.27-578.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s6-p1@224: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s6-p2@224)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:595.25-598.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@228: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s8-p1@228)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:605.27-608.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s8-p2@229: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p1@229)
--
>> arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/qcom/sc8180x.dtsi:2634.31-2679.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1743.4-1746.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1743.4-1746.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1743.4-1746.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1743.4-1746.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1862.4-1865.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1862.4-1865.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1862.4-1865.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1862.4-1865.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1982.4-1985.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1982.4-1985.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1982.4-1985.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1982.4-1985.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:2102.4-2105.30: Warning (interrupt_map): /soc@0/pcie@1c18000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:2102.4-2105.30: Warning (interrupt_map): /soc@0/pcie@1c18000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:2102.4-2105.30: Warning (interrupt_map): /soc@0/pcie@1c18000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:2102.4-2105.30: Warning (interrupt_map): /soc@0/pcie@1c18000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
--
>> arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/msm8953.dtsi:980.27-1030.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1410.11-1420.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm630.dtsi:1779.26-1797.5: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@c175000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1617.11-1627.7: Warning (graph_child_address): /soc@0/display-subsystem@c900000/display-controller@c901000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/msm8916.dtsi:1604.27-1652.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts:93.20-127.4: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@78b6000/led-controller@30: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:463.26-466.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:478.26-481.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:491.26-494.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:503.26-506.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1591.11-1601.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:4723.27-4776.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
--
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:4848.27-4921.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:4942.27-4996.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2166.4-2169.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2166.4-2169.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2166.4-2169.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2166.4-2169.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
--
>> arch/arm64/boot/dts/qcom/msm8917.dtsi:1045.27-1111.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8937.dtsi:140.9-157.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8917.dtsi:491.27-494.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s5-p1@1d9: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s5-p2@1d9)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:511.27-514.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s7-p1@1dc: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s7-p2@1dc)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:536.25-539.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@210: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s0-p1@210)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:546.27-549.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s0-p2@211: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s1-p1@211)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:566.27-569.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s2-p2@214: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s3-p1@214)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:591.27-594.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s9-p1@230: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p2@230)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:1031.11-1042.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm630.dtsi:1779.26-1797.5: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@c175000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/msm8994.dtsi:639.28-655.5: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@f9928000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/msm8916.dtsi:1604.27-1652.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:463.26-466.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:478.26-481.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:491.26-494.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:503.26-506.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1591.11-1601.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/sc8180x.dtsi:2634.31-2679.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1743.4-1746.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1743.4-1746.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1743.4-1746.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1743.4-1746.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1862.4-1865.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1862.4-1865.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1862.4-1865.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1862.4-1865.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1982.4-1985.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1982.4-1985.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1982.4-1985.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:1982.4-1985.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:2102.4-2105.30: Warning (interrupt_map): /soc@0/pcie@1c18000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:2102.4-2105.30: Warning (interrupt_map): /soc@0/pcie@1c18000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:2102.4-2105.30: Warning (interrupt_map): /soc@0/pcie@1c18000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sc8180x.dtsi:2102.4-2105.30: Warning (interrupt_map): /soc@0/pcie@1c18000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
--
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5392.27-5448.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:4723.27-4776.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
--
>> arch/arm64/boot/dts/qcom/sm6115.dtsi:1950.27-2021.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1908.11-1918.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1221.11-1231.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1617.11-1627.7: Warning (graph_child_address): /soc@0/display-subsystem@c900000/display-controller@c901000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/qcs404.dtsi:421.27-424.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s4-p1@1fe: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s4-p2@1fe)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:431.27-434.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s5-p1@200: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s5-p2@200)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:451.27-454.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s7-p1@203: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s7-p2@203)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:471.27-474.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s9-p1@206: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p2@206)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:481.25-484.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@208: duplicate unit-address (also used in node /soc@0/qfprom@a4000/base1@208)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:481.25-484.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@208: duplicate unit-address (also used in node /soc@0/qfprom@a4000/base2@208)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:486.27-489.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/base1@208: duplicate unit-address (also used in node /soc@0/qfprom@a4000/base2@208)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:516.43-519.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/ivoltage3@22b: duplicate unit-address (also used in node /soc@0/qfprom@a4000/quot1@22b)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:532.31-535.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/ring1@228: duplicate unit-address (also used in node /soc@0/qfprom@a4000/ring2@228)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:508.43-511.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/ivoltage1@229: duplicate unit-address (also used in node /soc@0/qfprom@a4000/ring3@229)
>> arch/arm64/boot/dts/qcom/qcs404.dtsi:1496.4-1499.30: Warning (interrupt_map): /soc@0/pcie@10000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@b000000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/qcs404.dtsi:1496.4-1499.30: Warning (interrupt_map): /soc@0/pcie@10000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@b000000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/qcs404.dtsi:1496.4-1499.30: Warning (interrupt_map): /soc@0/pcie@10000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@b000000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/qcs404.dtsi:1496.4-1499.30: Warning (interrupt_map): /soc@0/pcie@10000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@b000000, using 0 as fallback
--
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
--
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts:587.10-628.4: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@ac0000/i2c@a98000/pmic@66: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
--
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:3303.27-3318.5: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@7577000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1221.11-1231.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sar2130p.dtsi:2214.27-2289.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sar2130p.dtsi:2310.27-2366.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:503.22-554.5: Warning (simple_bus_reg): /soc@0/usb2@1e00000: simple-bus unit address format error, expected "1ef8800"
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:594.22-647.5: Warning (simple_bus_reg): /soc@0/usb3@8a00000: simple-bus unit address format error, expected "8af8800"
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:224.30-227.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/s10@3dd: duplicate unit-address (also used in node /soc@0/efuse@a4000/s11@3dd)
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:234.30-237.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/s12@3de: duplicate unit-address (also used in node /soc@0/efuse@a4000/s13@3de)
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:254.25-257.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/mode@419: duplicate unit-address (also used in node /soc@0/efuse@a4000/base0@419)
>> arch/arm64/boot/dts/qcom/ipq5424.dtsi:755.4-758.30: Warning (interrupt_map): /soc@0/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@f200000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/ipq5424.dtsi:755.4-758.30: Warning (interrupt_map): /soc@0/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@f200000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/ipq5424.dtsi:755.4-758.30: Warning (interrupt_map): /soc@0/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@f200000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/ipq5424.dtsi:755.4-758.30: Warning (interrupt_map): /soc@0/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@f200000, using 0 as fallback
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:858.4-861.30: Warning (interrupt_map): /soc@0/pcie@50000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@f200000, using 0 as fallback
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:858.4-861.30: Warning (interrupt_map): /soc@0/pcie@50000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@f200000, using 0 as fallback
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:858.4-861.30: Warning (interrupt_map): /soc@0/pcie@50000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@f200000, using 0 as fallback
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:858.4-861.30: Warning (interrupt_map): /soc@0/pcie@50000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@f200000, using 0 as fallback
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:961.4-964.30: Warning (interrupt_map): /soc@0/pcie@60000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@f200000, using 0 as fallback
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:961.4-964.30: Warning (interrupt_map): /soc@0/pcie@60000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@f200000, using 0 as fallback
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:961.4-964.30: Warning (interrupt_map): /soc@0/pcie@60000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@f200000, using 0 as fallback
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:961.4-964.30: Warning (interrupt_map): /soc@0/pcie@60000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@f200000, using 0 as fallback
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:1064.4-1067.30: Warning (interrupt_map): /soc@0/pcie@70000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@f200000, using 0 as fallback
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:1064.4-1067.30: Warning (interrupt_map): /soc@0/pcie@70000000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@f200000, using 0 as fallback
--
>> arch/arm64/boot/dts/qcom/sm6115.dtsi:1950.27-2021.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1908.11-1918.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1221.11-1231.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4817.26-4890.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4085.10-4095.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sm8550.dtsi:3824.27-3898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8550.dtsi:3919.27-3974.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1221.11-1231.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5295.27-5370.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5392.27-5448.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:2946.27-3024.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:3045.27-3123.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1554.4-1557.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1554.4-1557.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1554.4-1557.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1554.4-1557.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1665.4-1668.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1665.4-1668.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1665.4-1668.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1665.4-1668.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
--
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:4723.27-4776.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
--
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:3960.27-4032.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:4053.27-4106.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4817.26-4890.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4085.10-4095.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:3960.27-4032.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:4053.27-4106.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
--
>> arch/arm64/boot/dts/qcom/qcm2290.dtsi:1834.27-1907.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1792.11-1802.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sm6350.dtsi:2323.27-2398.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:2946.27-3024.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:3045.27-3123.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1554.4-1557.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1554.4-1557.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1554.4-1557.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1554.4-1557.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1665.4-1668.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1665.4-1668.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1665.4-1668.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8350.dtsi:1665.4-1668.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
--
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1221.11-1231.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm670.dtsi:1972.27-2025.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts:470.25-491.4: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
--
>> arch/arm64/boot/dts/qcom/sm8550.dtsi:3919.27-3974.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/msm8953.dtsi:980.27-1030.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pmi632.dtsi:189.19-201.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1410.11-1420.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
--
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts:473.10-494.4: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
--
>> arch/arm64/boot/dts/qcom/pmi632.dtsi:189.19-201.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@1c40000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1908.11-1918.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sm6125.dtsi:1322.27-1389.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1280.11-1290.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3339.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/msm8996.dtsi:1931.5-1934.31: Warning (interrupt_map): /soc@0/bus@0/pcie@600000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2008.5-2011.31: Warning (interrupt_map): /soc@0/bus@0/pcie@608000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2083.5-2086.31: Warning (interrupt_map): /soc@0/bus@0/pcie@610000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@9bc0000, using 0 as fallback
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1221.11-1231.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:1562.21-1582.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@894000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
--
>> arch/arm64/boot/dts/qcom/sm8550.dtsi:3824.27-3898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8550.dtsi:3919.27-3974.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/qcom/msm8939.dtsi:1302.27-1351.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts:127.20-161.4: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@78b6000/led-controller@30: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8939.dtsi:504.26-507.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:524.26-527.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:549.24-552.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:559.26-562.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:579.26-582.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
--
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:4723.27-4776.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
--
>> arch/arm64/boot/dts/qcom/msm8939.dtsi:1302.27-1351.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8939.dtsi:504.26-507.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:524.26-527.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:549.24-552.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:559.26-562.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:579.26-582.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/marvell/armada-37xx.dtsi:518.4-521.29: Warning (interrupt_map): /soc/pcie@d0070000:interrupt-map: Missing property '#address-cells' in node /soc/pcie@d0070000/interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-37xx.dtsi:518.4-521.29: Warning (interrupt_map): /soc/pcie@d0070000:interrupt-map: Missing property '#address-cells' in node /soc/pcie@d0070000/interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-37xx.dtsi:518.4-521.29: Warning (interrupt_map): /soc/pcie@d0070000:interrupt-map: Missing property '#address-cells' in node /soc/pcie@d0070000/interrupt-controller, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-37xx.dtsi:518.4-521.29: Warning (interrupt_map): /soc/pcie@d0070000:interrupt-map: Missing property '#address-cells' in node /soc/pcie@d0070000/interrupt-controller, using 0 as fallback
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2600000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2620000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2640000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2600000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2620000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2640000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4600000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4620000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4640000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/cn9130-crb.dtsi:177.10-200.4: Warning (avoid_unnecessary_addr_size): /cp0-bus/bus@f2000000/spi@700680/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2600000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2620000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2640000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts:158.10-187.4: Warning (avoid_unnecessary_addr_size): /cp0-bus/bus@f2000000/spi@700680/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2600000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2620000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2640000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2600000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2620000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2640000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4600000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4620000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4640000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2600000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2620000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2640000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4600000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4620000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4640000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp2-bus/pcie@f6600000:interrupt-map: Missing property '#address-cells' in node /cp2-bus/bus@f6000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp2-bus/pcie@f6620000:interrupt-map: Missing property '#address-cells' in node /cp2-bus/bus@f6000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp2-bus/pcie@f6640000:interrupt-map: Missing property '#address-cells' in node /cp2-bus/bus@f6000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2600000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2620000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2640000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4600000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4620000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4640000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2600000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2620000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2640000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2600000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2620000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2640000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2600000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2620000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2640000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2600000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2620000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2640000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4600000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4620000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4640000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp2-bus/pcie@f6600000:interrupt-map: Missing property '#address-cells' in node /cp2-bus/bus@f6000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp2-bus/pcie@f6620000:interrupt-map: Missing property '#address-cells' in node /cp2-bus/bus@f6000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp2-bus/pcie@f6640000:interrupt-map: Missing property '#address-cells' in node /cp2-bus/bus@f6000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2600000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2620000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2640000:interrupt-map: Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4600000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:571.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4620000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:596.3-47: Warning (interrupt_map): /cp1-bus/pcie@f4640000:interrupt-map: Missing property '#address-cells' in node /cp1-bus/bus@f4000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback

vim +32 arch/arm64/boot/dts/nvidia/tegra132.dtsi

ed9e9a6eb118da Thierry Reding 2021-12-07  12  
34b4f6d0599e92 Thierry Reding 2015-05-13  13  / {
34b4f6d0599e92 Thierry Reding 2015-05-13  14  	compatible = "nvidia,tegra132", "nvidia,tegra124";
34b4f6d0599e92 Thierry Reding 2015-05-13  15  	interrupt-parent = <&lic>;
34b4f6d0599e92 Thierry Reding 2015-05-13  16  	#address-cells = <2>;
34b4f6d0599e92 Thierry Reding 2015-05-13  17  	#size-cells = <2>;
34b4f6d0599e92 Thierry Reding 2015-05-13  18  
475d99fc216f4b Rob Herring    2017-03-21  19  	pcie@1003000 {
34b4f6d0599e92 Thierry Reding 2015-05-13  20  		compatible = "nvidia,tegra124-pcie";
34b4f6d0599e92 Thierry Reding 2015-05-13  21  		device_type = "pci";
644c569d7e540a Thierry Reding 2020-06-12  22  		reg = <0x0 0x01003000 0x0 0x00000800>, /* PADS registers */
644c569d7e540a Thierry Reding 2020-06-12  23  		      <0x0 0x01003800 0x0 0x00000800>, /* AFI registers */
644c569d7e540a Thierry Reding 2020-06-12  24  		      <0x0 0x02000000 0x0 0x10000000>; /* configuration space */
34b4f6d0599e92 Thierry Reding 2015-05-13  25  		reg-names = "pads", "afi", "cs";
34b4f6d0599e92 Thierry Reding 2015-05-13  26  		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
34b4f6d0599e92 Thierry Reding 2015-05-13  27  			     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
34b4f6d0599e92 Thierry Reding 2015-05-13  28  		interrupt-names = "intr", "msi";
34b4f6d0599e92 Thierry Reding 2015-05-13  29  
34b4f6d0599e92 Thierry Reding 2015-05-13  30  		#interrupt-cells = <1>;
34b4f6d0599e92 Thierry Reding 2015-05-13  31  		interrupt-map-mask = <0 0 0 0>;
34b4f6d0599e92 Thierry Reding 2015-05-13 @32  		interrupt-map = <0 0 0 0 &gic GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;

:::::: The code at line 32 was first introduced by commit
:::::: 34b4f6d0599e920e0aca34816e5940b418188b03 arm64: tegra: Add Tegra132 support

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
