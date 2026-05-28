Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC473FE350
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980902; cv=none; b=YTL18oghQUiFy22qEfTz7gIbXuKfUsJJmZq6mEwTRml2hH+1oe/1rhQUVC52Y58apX/yJ4T0sf4mrtXSR+l7lDz7efh4RjMkGxqZqQm9ghINzMDGy0+r8wnlF2rlhooP9qWbqBCLn4WajA8EJd7JY7AkFpDcYPHPYLoEwiLMseo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980902; c=relaxed/simple;
	bh=QlO4iwl6393QNYUIotVZd43s8ZmIrpWHj0EpMdHTCrM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fb9q5SN7F8H6lDUz2zfX93sto4oz+xJwKCkvX/wNcG+PMkZf7qMGYt+066APLLy5tfsAGJCpuZhCHlr8SJkB/4lBbnwSLzNFZCTDJj2AGRwvehWtl/EAgWKjy1FF+ZzjTQc/sWL7uCu0OGlz2hSfZIdhkkPcYUShDzFcsYS6utM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bdtUEG6H; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bdtUEG6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779980901; x=1811516901;
  h=date:from:to:cc:subject:message-id;
  bh=QlO4iwl6393QNYUIotVZd43s8ZmIrpWHj0EpMdHTCrM=;
  b=bdtUEG6HYbwupl0j1nrTqgBZe2ro/Vw4eI4M5P3GmcYP6r9oRCo9Y11F
   kUW7GjjnQV0Gn4c/cCU3byEYp6cMkqzRpa+tvJt/vC9OAwGbc5hXRFQyd
   HcVD2iMpslQlFhjrkH3ITgLsOc0525MLS46/u1nF5v402+BHwFDOrxTYw
   gmK287p2Rjh2CrCqxPLbne4OwOytF95bgHlXFO4JuF125U+n3YpI0zcqM
   aMIWB+MTzXRJd3CxyK1alImBFoqrhU+6dZi2mPnzssiD3F2OlANctNwBQ
   VJfPx0U+zD3bDKjaxCR3LVtXH5jo5PQDcc49z+k+Ig8H5/h5DLXkA1IGU
   w==;
X-CSE-ConnectionGUID: Zd522pvyS/Se6sZSzLQygQ==
X-CSE-MsgGUID: DXsE46uuSdqhJtqfVJ9bFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="103499748"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="103499748"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 08:08:20 -0700
X-CSE-ConnectionGUID: jOnNO1y2Sq2tYGoJCXNQHg==
X-CSE-MsgGUID: zsim6I/nT0qgUhyXPUoyBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="247664069"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 28 May 2026 08:08:18 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wScLI-000000000X7-2mcy;
	Thu, 28 May 2026 15:08:16 +0000
Date: Thu, 28 May 2026 17:07:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: tools/include/linux/kernel.h:50:55: error: incompatible
 types when assigning to type 'union perf_event *' from type '_Bool'
Message-ID: <202605281723.5vjXWAJl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Piotr Zarycki <piotr.zarycki@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Piotr-Zarycki/KVM-selftests-hyperv_tlb_flush-use-swap-to-swap-PTEs/20260528-221405
head:   67c706105a2d87e0e1457497938d00490cfbc846
commit: 67c706105a2d87e0e1457497938d00490cfbc846 KVM: selftests: hyperv_tlb_flush: use swap() to swap PTEs
date:   50 minutes ago
:::::: branch date: 50 minutes ago
:::::: commit date: 50 minutes ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260528/202605281723.5vjXWAJl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281723.5vjXWAJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605281723.5vjXWAJl-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:577: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:1160: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.1.rc2.g67c706105a2d
   In file included from util/session.c:6:
   util/session.c: In function 'event_swap':
>> tools/include/linux/kernel.h:50:55: error: incompatible types when assigning to type 'union perf_event *' from type '_Bool'
      50 | #define swap(a, b)  do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                                       ^
   util/session.c:1768:17: note: in expansion of macro 'swap'
    1768 |                 swap(event, sample_id_all);
         |                 ^~~~
   make[4]: *** [tools/build/Makefile.build:95: util/session.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [tools/build/Makefile.build:158: util] Error 2
   make[2]: *** [Makefile.perf:797: perf-util-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:289: sub-make] Error 2


vim +50 tools/include/linux/kernel.h

5cf67a6051ea25 Karolina Drobnik 2022-02-02  48  
67c706105a2d87 Piotr Zarycki    2026-05-28  49  #ifndef swap
67c706105a2d87 Piotr Zarycki    2026-05-28 @50  #define swap(a, b)  do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
67c706105a2d87 Piotr Zarycki    2026-05-28  51  #endif
67c706105a2d87 Piotr Zarycki    2026-05-28  52  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
