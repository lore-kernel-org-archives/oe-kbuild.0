Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9101623CC
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 06:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694414499; x=1725950499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8yC1fmGpvpKLHxVcH5sMXldejI+DDTWPX/HwXq9BWAY=;
  b=NpCSCRkN5t64mVJdzYzWWC95WA6HlABNawQr3HwkLZPkEYyKYs2Ru3Sk
   JV1D0CtoSD8MsHY5bvZeAfgbRJt/aaIK8L9T+RBWdof5EPpUNHE/vJ58h
   1O5Vv5ZMsRI+9RBkzpzwlpT2cSyjS4JbkuNBSXtXW9SzBA7nPcMBQLcLW
   OEtn2cMUkEeqoPQfZCQ3Glyqo2UmwM+zX0t5jrH9UCBK4XeWiUzIXPuvz
   5G+1/tV6JAUom5V+1Hjfq0Gru3cQ2/MOPpP2sOH4/OcaNBqSeCGWUKjDK
   mXezGBl31JDAwd5QDrJLsLIu/iUBe0C50lYiQwyYfLJAKDXfkgcj46H6I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="381809423"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="381809423"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 23:41:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="692981434"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="692981434"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Sep 2023 23:41:37 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfac3-0005uA-2R;
	Mon, 11 Sep 2023 06:41:35 +0000
Date: Mon, 11 Sep 2023 14:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] mm/madvise: add cond_resched() in
 madvise_cold_or_pageout_pte_range()
Message-ID: <202309111456.SBqOkY0h-lkp@intel.com>
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
In-Reply-To: <95d610623363009a71024c7a473d6895f39f3caf.1694219361.git.wangjiexun@tinylab.org>
References: <95d610623363009a71024c7a473d6895f39f3caf.1694219361.git.wangjiexun@tinylab.org>
TO: Jiexun Wang <wangjiexun@tinylab.org>
TO: akpm@linux-foundation.org
TO: brauner@kernel.org
CC: linux-mm@kvack.org
CC: linux-kernel@vger.kernel.org
CC: falcon@tinylab.org
CC: Jiexun Wang <wangjiexun@tinylab.org>

Hi Jiexun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiexun-Wang/mm-madvise-add-cond_resched-in-madvise_cold_or_pageout_pte_range/20230909-133707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/95d610623363009a71024c7a473d6895f39f3caf.1694219361.git.wangjiexun%40tinylab.org
patch subject: [PATCH 1/1] mm/madvise: add cond_resched() in madvise_cold_or_pageout_pte_range()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309111456.SBqOkY0h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309111456.SBqOkY0h-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> mm/madvise.c: linux/swap.h is included more than once.

vim +30 mm/madvise.c

  > 30	#include <linux/swap.h>
    31	#include <linux/swapops.h>
    32	#include <linux/shmem_fs.h>
    33	#include <linux/mmu_notifier.h>
  > 34	#include <linux/swap.h>
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
