Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6DC200D7
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Nov 2023 18:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJNotyCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699642196; x=1731178196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LjPtKxMiEdP7jEqtax2OUVhfow8UgkBaKYB/daMExPo=;
  b=AJNotyCMnP9hP/p2gPP9+bYBXdQzq8xgXJZJEj3AKgQMxMXmXtVry/+p
   8xVE1Ess0cwREuM+VGGTNcsprIT2l+3fOCB80ZhEspp593N1q2MwgIKaO
   3UbrRev9GaIpWwwCBar0186QbvaJTcUsxOAPO5oxg+6NoJjJ8a2gqDMKj
   49X5tU+xuN2nyo5T+oXM51h1VJocrYRgXCYpTWksvOudFeQQC0RhSUgW0
   u6omLGE3qIs9a+ZxNrWIwxkct1JkevYpxBLnbXhon9TF97aFqPVCQafYK
   h7gVJ8yklDOTiVH4r7eGiQSrUobBsD9TIzXDXjQncToHBONNu74dMWTcG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="454523871"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="454523871"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:49:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="881032500"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="881032500"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2023 10:49:54 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1WZj-0009pS-33;
	Fri, 10 Nov 2023 18:49:51 +0000
Date: Sat, 11 Nov 2023 02:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] locking: Introduce prepare_sync_core_cmd()
Message-ID: <202311110257.iSkoKoPu-lkp@intel.com>
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
In-Reply-To: <ZU0sliwUQJyNAH1y@andrea>
References: <ZU0sliwUQJyNAH1y@andrea>
TO: Andrea Parri <parri.andrea@gmail.com>
TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: charlie@rivosinc.com
CC: rehn@rivosinc.com
CC: paulmck@kernel.org
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: aou@eecs.berkeley.edu
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: mmaas@google.com
CC: hboehm@google.com
CC: striker@us.ibm.com

Hi Andrea,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-Parri/locking-Introduce-prepare_sync_core_cmd/20231110-035816
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/ZU0sliwUQJyNAH1y%40andrea
patch subject: [PATCH 1/2] locking: Introduce prepare_sync_core_cmd()
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110257.iSkoKoPu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311110257.iSkoKoPu-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/sync_core.h: asm/sync_core.h is included more than once.

vim +6 include/linux/sync_core.h

     4	
     5	#ifdef CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
   > 6	#include <asm/sync_core.h>
     7	#else
     8	/*
     9	 * This is a dummy sync_core_before_usermode() implementation that can be used
    10	 * on all architectures which return to user-space through core serializing
    11	 * instructions.
    12	 * If your architecture returns to user-space through non-core-serializing
    13	 * instructions, you need to write your own functions.
    14	 */
    15	static inline void sync_core_before_usermode(void)
    16	{
    17	}
    18	#endif
    19	
    20	#ifdef CONFIG_ARCH_HAS_PREPARE_SYNC_CORE_CMD
  > 21	#include <asm/sync_core.h>
    22	#else
    23	/*
    24	 * This is a dummy prepare_sync_core_cmd() implementation that can be used on
    25	 * all architectures which provide unconditional core serializing instructions
    26	 * in switch_mm().
    27	 * If your architecture doesn't provide such core serializing instructions in
    28	 * switch_mm(), you may need to write your own functions.
    29	 */
    30	static inline void prepare_sync_core_cmd(struct mm_struct *mm)
    31	{
    32	}
    33	#endif
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
