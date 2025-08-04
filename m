Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0737D19066D
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Aug 2025 00:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754267863; cv=none; b=W8OvmcXRMjDnQQNV9pDVqTYR2RIS3ewAcm9lEPZJkn9h1cwy2Jw+RYZNMaScQjgbNIRxrmr31Q+KTnHE37lCvu0BxGdwVyPqFeE975yivjRk4vDLk5PAgzjMERiHSpNMBfBOAerfmf7gNKRhs+yrxd+IbKHsDnzvUH9++9d6xl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754267863; c=relaxed/simple;
	bh=ffSFKlS60DScBVUWXUC0lWq9tJRAe2LHpUL6yHJNwUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pNyUAvbtEHPb5OreYJgM4KZ4PfhvqlqXk5ObmVOLrYDoNl/SOfSxuz5dDDy3DsdQSuzKQ5W5mlWJvP7ZCPNxaJjQagnsipBtvECgwaaKp2LDGMvUiveuNQJOpdHAqtl+d6uqTcqT17OScHlbDzq9wsmUWNN1/B9YZZooI6SIInk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpTLVuec; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpTLVuec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754267861; x=1785803861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ffSFKlS60DScBVUWXUC0lWq9tJRAe2LHpUL6yHJNwUU=;
  b=SpTLVuecEKnDJstrij2Ud9+tN0KSFPc/Jc9uIwiGfLD3EtOg1qfqtqrX
   jru0vBcdLXLJqplb5lIbPVIZjoc1ieYCojW6h9aV2zG1G/K6gjqDzdXIM
   HbyYRP86HvTAz/Srt3AukGy5z8eRSdDhV2RGq1cyqzR8KlAxNQGACPlZH
   BSPTychD759pEfjeRZrLMRWdRHpsTZpGDezy886e22WRzQ+xrGl19flfs
   WQ3W8JLf4cghN1Y0lWFscwlhmI8PR/6lmYpumgJMdAU3hXf4uEhYkC/ki
   nBKzx5Gi4bqXIlbFbtdGTMkRlrfQq4hOqF+a4NtJ1zltsV/8tsmTR4MmV
   w==;
X-CSE-ConnectionGUID: BqyWg51SQYyWbcoKG15IrA==
X-CSE-MsgGUID: yc+wtXHdTyayHDttbtDBYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="67588897"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67588897"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 17:37:40 -0700
X-CSE-ConnectionGUID: X3mSCpR1RhGNtkbEIn1a5w==
X-CSE-MsgGUID: CU0ZAo6tRQK9yN0fLqJo0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163700595"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Aug 2025 17:37:39 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uijCr-0006hg-16;
	Mon, 04 Aug 2025 00:37:37 +0000
Date: Mon, 4 Aug 2025 08:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:asahi-wip 59/208]
 arch/arm64/boot/dts/apple/t602x-die0.dtsi:61.45-64.7: Warning
 (unique_unit_address_if_enabled):
 /soc/spmi@29e114000/pmic@f/nvmem-layout/boot-error-count@6002: duplicate
 unit-address (also used in node
 /soc/spmi@29e114000/pmic@f/nvmem-layout/panic-count@60...
Message-ID: <202508040841.RSUcwP5K-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: 7e7b8ae212b035366de78f49b5e4387e1a0e81e1 [59/208] arm64: dts: apple: Add initial t602x device trees
:::::: branch date: 5 hours ago
:::::: commit date: 7 days ago
config: arm64-randconfig-001-20250804 (https://download.01.org/0day-ci/archive/20250804/202508040841.RSUcwP5K-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040841.RSUcwP5K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508040841.RSUcwP5K-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6021.dtsi:33.28-35.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t6021.dtsi:37.34-39.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t6021.dtsi:41.22-43.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:293.14-309.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:311.14-320.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:220.29-225.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:193.21-218.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t602x-die0.dtsi:61.45-64.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmic@f/nvmem-layout/boot-error-count@6002: duplicate unit-address (also used in node /soc/spmi@29e114000/pmic@f/nvmem-layout/panic-count@6002)
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:13.10-24.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

vim +61 arch/arm64/boot/dts/apple/t602x-die0.dtsi

7e7b8ae212b035 Hector Martin 2023-04-09 @61  				boot_error_count: boot-error-count@6002 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
