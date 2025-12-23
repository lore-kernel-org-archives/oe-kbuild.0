Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6F6340D86
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766496859; cv=none; b=uk6pAkSSjg/q8LPnsQ/TMJWOgbods1VRbhBSIfvLPSpL96wCDT/PI91ax+crblocSSwbOicLRwLcKUsJ4kV6tJhpH0j1PIb8YHNDbQi0tceLhucYxlZsb5In6SbjUpw5teiEXQNV3OjdKDgGX0P24UiLCnTH4VRiDjJuC/6EZBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766496859; c=relaxed/simple;
	bh=hsv2R4chMey+2GrxjpBpmucpKiXDGRfbiE+YB5Ddpyo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W2lw7aoFID6ui26tYXX41Ve/yGb0g+U/P87fUsZOjY5h9mIM1Ebqenrx0ReXYEV9wyagI9Ddxf/W7jykdMfYQa7jwIfTWOslSwRDv/7A+8U1qRW7gCaLUtGOMrHVkCaZ4/d1nCJLERlih26tSFdcNaMd8IJMLYaoKwwHJHr4PH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R23nbTtG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R23nbTtG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766496857; x=1798032857;
  h=date:from:to:cc:subject:message-id;
  bh=hsv2R4chMey+2GrxjpBpmucpKiXDGRfbiE+YB5Ddpyo=;
  b=R23nbTtG+ly7cFySza5WJ4Pqd8YjoNQFBAVY+c6DbZQPjFeA8tEsXk7N
   PvnXDjle2wjkGjRN0CWtvXAQ1g/gkBRSUG1uolgvWSkVZEn0ofghoQzbE
   xO+YE60kgbMVcuxBP8aVcf+QTlutLgWkbQJdeBttb05QL+onywi2b7IIk
   ECUpW/rKXqdt7yD+94Leg3XImnvrD3ksT8LUxjQVCBHiq7THYpnabHveH
   Zj/JmFy094hneeCxosj/kpABDttj6WQDv5fmhVFP333Tiu1GnnXvzKtlB
   Jrc37j6Bxve2hKo6h0Hsrby3ihPuzruHPffwyNtfm9mtxPoK9OAMPrVDY
   g==;
X-CSE-ConnectionGUID: b6Dleg3BQO+cI4LwWqdZ8g==
X-CSE-MsgGUID: ztTlxm3CSGWiuyVdaK0PHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="85759886"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="85759886"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:34:15 -0800
X-CSE-ConnectionGUID: 1GmkgunJTCOa5LTzbw/G1A==
X-CSE-MsgGUID: o/2UgPssQuWfIZhSoM7PNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="204283663"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Dec 2025 05:34:13 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY2Wh-000000001yN-1lnF;
	Tue, 23 Dec 2025 13:34:11 +0000
Date: Tue, 23 Dec 2025 21:33:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/haps_hs.dtb: Warning (interrupt_map):
 Failed prerequisite 'interrupt_provider'
Message-ID: <202512232143.dQcnXISg-lkp@intel.com>
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
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: linux-snps-arc@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: 3b7f793acc13b6108452271b306d4aa94a3c4940 ARC: migrate to the generic rule for built-in DTB
date:   11 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 11 months ago
config: arc-haps_hs_defconfig (https://download.01.org/0day-ci/archive/20251223/202512232143.dQcnXISg-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232143.dQcnXISg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512232143.dQcnXISg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/skeleton_hs.dtsi:45.9-48.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/haps_hs.dts:31.7-98.4: Warning (unit_address_vs_reg): /fpga: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/haps_hs.dts:40.22-44.5: Warning (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs.dts:46.35-50.5: Warning (simple_bus_reg): /fpga/interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs.dts:63.16-67.5: Warning (simple_bus_reg): /fpga/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs.dts:63.16-67.5: Warning (interrupt_provider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/haps_hs.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
