Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7709CA66
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Oct 2023 10:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696157306; x=1727693306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a6759Qp3r6YrJPzPUiVDRtOD+hGziLgMyFD1HaKvpL4=;
  b=GVm/dzVESP+T2Ynv45ApJLWqbpC44w6/yXeneZQBtO4Uw7IyZLsFHCrt
   toMC6hRKnSNR6t4OJ4QgBDDgguTm0dQ4rRaj5t5WRVsD5A76/c7MLK/DK
   tc3y6hynzWAU/Cu+tbWz8QXbbBhQwVn6x3akiwJ2I2FGr4pISFGKAB97J
   5C58NGO/SetwcvR+vZR5vfa0iVmoFURc4PhI3BHpXrLQLhgdvQ2xrRqca
   7xamx+5lpXzyzD5wg1OLwgQrqPLbE2y0Qy1uLj+tuX4i8Ri1R839SWlFB
   j9fuF4RhfG0A4g6E/7nBY7QpFLOLtebyKJ6Q+z3vCE2LOaR9RkoqjHzRh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="362779538"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="362779538"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 03:48:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="820628925"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="820628925"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 01 Oct 2023 03:48:24 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmtzq-0004zV-0R;
	Sun, 01 Oct 2023 10:48:22 +0000
Date: Sun, 1 Oct 2023 18:47:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 189/1370]
 arch/microblaze/include/asm/mmu_context_mm.h: linux/sched.h is included more
 than once.
Message-ID: <202310011838.w32B8u06-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: git@amd.com
TO: Michal Simek <monstr@monstr.eu>
CC: Stefan Asserhall <stefan.asserhall@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 4c0e8851358566e107e3a4242a2886520a9ae7cf [189/1370] microblaze: Rework mmu context management to prepare
:::::: branch date: 9 days ago
:::::: commit date: 9 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231001/202310011838.w32B8u06-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310011838.w32B8u06-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/microblaze/include/asm/mmu_context_mm.h: linux/sched.h is included more than once.

vim +14 arch/microblaze/include/asm/mmu_context_mm.h

    11	
    12	#include <linux/atomic.h>
    13	#include <linux/mm_types.h>
  > 14	#include <linux/sched.h>
    15	
    16	#include <asm/bitops.h>
    17	#include <linux/kernel.h>
    18	#include <linux/mm.h>
  > 19	#include <linux/sched.h>
    20	#include <linux/spinlock.h>
    21	#include <asm/mmu.h>
    22	#include <asm-generic/mm_hooks.h>
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
