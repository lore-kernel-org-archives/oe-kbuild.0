Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F9631985F
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Aug 2025 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756201425; cv=none; b=G+DKUtwb27LCcL0u7NpUOtzFpG+mlPU9Ss/haW1hwqnli3eduJl1HbeASFLyGVmAkVIjoBE0Mh/l1FT+yYzT1AKcAjwbX/qCsYr9e9KU8/AsNxj+r9eq93j8zTBPXNIqNJgI7XuWkWeA39DDKTy8A78hafmkc8f92Xq0Q8SqtWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756201425; c=relaxed/simple;
	bh=sXkdmfssFlZ3V909tkQ7trKSj+nHZGx8IOVFHMLBZNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=il3YWOqYnGVgNAtEsqOAnVCcK1vzWkxnlPjxHdO3EPWEkF5k6l66Dyh0NkqhwQUI6LuQ21i2DRTUXre8iJqM9LqDZhfJfG5PW0K68izX8f4OTzqzUTd1gqnN6Wcrz0Uel/z2ddpd2bhgF8tMoY8aBqTJsLzoXx347eSwQnnaW+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ioyK6Mls; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ioyK6Mls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756201421; x=1787737421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXkdmfssFlZ3V909tkQ7trKSj+nHZGx8IOVFHMLBZNE=;
  b=ioyK6MlsV86rxPyJmAVXMzD0g01Pr6T/4PU47JijRC/WcHFQ3LoqmG/A
   ZzRIRJJQx92e1q5bPZv6HgTVeYylqxdNA/Y16lCqQ0QpKoKHkQfTYFCu+
   uRmaz9yFmjtzYaHkJ4ri3qBhbnBC7JID20RzHZg+7ax2bZ1SYYbLc4sSZ
   AvcXXag1VT/Ywyxsw0QsY4Yyg5HfkfVM/9G9HFJPL10VeHwYzNONLLSjz
   3eSsfkPLs5LyY4tE7DRrLuJCq1ALiiOm+s0CxbrAzENldhwcmaGTN1eGx
   +NcL4O5eg4yCBsYQ8McJKvyWW2x23ejMzrvwdF7rR0W1lmo4cjzLKxUeh
   w==;
X-CSE-ConnectionGUID: VlJZMFaOThiAK4eoz2piuw==
X-CSE-MsgGUID: gKuy6sRQS6ma6ux5TCRcAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="62245887"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="62245887"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 02:43:40 -0700
X-CSE-ConnectionGUID: B9zkqo/zRhiIuMRWZm1YZQ==
X-CSE-MsgGUID: 25APWhxFRva6zCrTZccIUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="170355231"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Aug 2025 02:43:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqqCp-000OO3-0f;
	Tue, 26 Aug 2025 09:43:14 +0000
Date: Tue, 26 Aug 2025 17:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 2/24]
 arch/mips/boot/dts/brcm/bcm7425.dtsi:612.3-615.33: Warning (interrupt_map):
 /pcie@8b20000:interrupt-map: Missing property '#address-cells' in node
 /rdb/interrupt-controller@41a400, using 0 as fallback
Message-ID: <202508261955.ftHAp1sN-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   0a021c1a6be869e82341ebf28df3ada39b0ecc8d
commit: c072d2b49507420edd57ba3d87690ab81ef5273a [2/24] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
:::::: branch date: 13 hours ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-r052-20250825 (https://download.01.org/0day-ci/archive/20250826/202508261955.ftHAp1sN-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508261955.ftHAp1sN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/brcm/bcm7425.dtsi:52.6-525.4: Warning (unit_address_vs_reg): /rdb: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/brcm/bcm7425.dtsi:527.21-586.4: Warning (unit_address_vs_reg): /memory_controllers: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/brcm/bcm7425.dtsi:131.10-134.5: Warning (simple_bus_reg): /rdb/reboot: missing or empty reg/ranges property
   arch/mips/boot/dts/brcm/bcm7425.dtsi:482.20-500.5: Warning (simple_bus_reg): /rdb/spi@41c000: simple-bus unit address format error, expected "419920"
   arch/mips/boot/dts/brcm/bcm7425.dtsi:560.23-585.5: Warning (simple_bus_reg): /memory_controllers/memory-controller@1: simple-bus unit address format error, expected "10000"
>> arch/mips/boot/dts/brcm/bcm7425.dtsi:612.3-615.33: Warning (interrupt_map): /pcie@8b20000:interrupt-map: Missing property '#address-cells' in node /rdb/interrupt-controller@41a400, using 0 as fallback
>> arch/mips/boot/dts/brcm/bcm7425.dtsi:612.3-615.33: Warning (interrupt_map): /pcie@8b20000:interrupt-map: Missing property '#address-cells' in node /rdb/interrupt-controller@41a400, using 0 as fallback
>> arch/mips/boot/dts/brcm/bcm7425.dtsi:612.3-615.33: Warning (interrupt_map): /pcie@8b20000:interrupt-map: Missing property '#address-cells' in node /rdb/interrupt-controller@41a400, using 0 as fallback
>> arch/mips/boot/dts/brcm/bcm7425.dtsi:612.3-615.33: Warning (interrupt_map): /pcie@8b20000:interrupt-map: Missing property '#address-cells' in node /rdb/interrupt-controller@41a400, using 0 as fallback
--
   arch/mips/boot/dts/brcm/bcm7435.dtsi:64.6-541.4: Warning (unit_address_vs_reg): /rdb: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/brcm/bcm7435.dtsi:543.21-602.4: Warning (unit_address_vs_reg): /memory_controllers: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/brcm/bcm7435.dtsi:146.10-149.5: Warning (simple_bus_reg): /rdb/reboot: missing or empty reg/ranges property
   arch/mips/boot/dts/brcm/bcm7435.dtsi:498.20-516.5: Warning (simple_bus_reg): /rdb/spi@41d200: simple-bus unit address format error, expected "41a920"
   arch/mips/boot/dts/brcm/bcm7435.dtsi:576.23-601.5: Warning (simple_bus_reg): /memory_controllers/memory-controller@1: simple-bus unit address format error, expected "10000"
>> arch/mips/boot/dts/brcm/bcm7435.dtsi:628.3-631.33: Warning (interrupt_map): /pcie@8b20000:interrupt-map: Missing property '#address-cells' in node /rdb/interrupt-controller@41b500, using 0 as fallback
>> arch/mips/boot/dts/brcm/bcm7435.dtsi:628.3-631.33: Warning (interrupt_map): /pcie@8b20000:interrupt-map: Missing property '#address-cells' in node /rdb/interrupt-controller@41b500, using 0 as fallback
>> arch/mips/boot/dts/brcm/bcm7435.dtsi:628.3-631.33: Warning (interrupt_map): /pcie@8b20000:interrupt-map: Missing property '#address-cells' in node /rdb/interrupt-controller@41b500, using 0 as fallback
>> arch/mips/boot/dts/brcm/bcm7435.dtsi:628.3-631.33: Warning (interrupt_map): /pcie@8b20000:interrupt-map: Missing property '#address-cells' in node /rdb/interrupt-controller@41b500, using 0 as fallback

vim +612 arch/mips/boot/dts/brcm/bcm7425.dtsi

6fffb01e3b78ba3 Jim Quinlan 2021-12-09 @612  		interrupt-map = <0 0 0 1 &periph_intc 0x21

:::::: The code at line 612 was first introduced by commit
:::::: 6fffb01e3b78ba3a38baf49c1dc7eeb5edfd5818 MIPS: bmips: Add support PCIe controller device nodes

:::::: TO: Jim Quinlan <jim2101024@gmail.com>
:::::: CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
