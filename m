Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7640B2EF652
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770229687; cv=none; b=iBhi0sjvGdrxds7jo3oeD9qACVkgiOQCUM61UHTiCA9kNOu6CMhB8a2kuY2ZYYkVzzjuv8lywlI9/rIeK82J20BA4Y7/0DOjWjRf41iYYAmuJWTqwF1OV6Q7JByuZeVu+ze7BOUoo4x/g6VNl+k6ScqMT77x4aBAPpOnmFfkLx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770229687; c=relaxed/simple;
	bh=Zsc6STv9Sm5drwYU1WY+snFh3GvtvbDvLMn5RSU8I5s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F1+yNNtWCMU/narxIY3evFIF7fyc36pU4svO0NX0pxooStVpMUHLRD7zXwHe4F/DEUh08qMuR8pBTYwH5ammh8Rv17d2PWKpwRM/y7vBtknM6mtT6Ws5MvbWkC6IvRSdMLwF8jmGgSPciYH8bJJIeqEWlTXouzCqjICugkNpNMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxcD1JBb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxcD1JBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770229687; x=1801765687;
  h=date:from:to:cc:subject:message-id;
  bh=Zsc6STv9Sm5drwYU1WY+snFh3GvtvbDvLMn5RSU8I5s=;
  b=HxcD1JBb0ld8MbnfqmYSbOrrpZ3TP/UzeDgWZrkM6YkTQHKBP6pekMcm
   jHLZDfs+m30Ga5usG6k9Pk8X7LcJ+XhvwOW5WTvDaHUsNFTGj1VZFZU/J
   AJZ1Yf4D6j/oaLoqxgg9wrYe5EHeYqqLA3IOjCGyypMcMQQkPC3V6zrnE
   ykclrZMJcZlf3BwjcN+No9o+wBP3JXKDEuUxsCpzjgQx8JQIqMHrwCwgb
   09svFKvJt4B8rkKOJbICyGw5VnFCXV/7Rtc6ELRFqUYPdWl9NO9Ktpq+y
   hUpNlyGjPx3YJvLt1Pkvpp3A192YgtQ1wGVRnWYgO1r9108Wx4ZkAFhm2
   g==;
X-CSE-ConnectionGUID: Q/1LXJ8HQ7Gb9t52/rE0jg==
X-CSE-MsgGUID: VDX13dJRRRmBJ/5tfk6cag==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71319938"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="71319938"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 10:28:06 -0800
X-CSE-ConnectionGUID: urgBtwnzTCOziAdj20GnRg==
X-CSE-MsgGUID: 3OVnPJDWRtOjNT4YLBWIEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="214921317"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 Feb 2026 10:28:06 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnhbf-000000003k1-3OpZ;
	Wed, 04 Feb 2026 18:28:03 +0000
Date: Wed, 04 Feb 2026 19:27:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error: unknown target triple 's390-unknown-linux'
Message-ID: <202602041919.T3dFYGw9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Leo Yan <leo.yan@arm.com>
CC: Arnaldo Carvalho de Melo <acme@redhat.com>
CC: Ian Rogers <irogers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5fd0a1df5d05ad066e5618ccdd3d0fa6cb686c27
commit: 4772e66cb45e0dd2c3c9ac649532756c523afd1e perf build: Support build with clang
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260204/202602041919.T3dFYGw9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041919.T3dFYGw9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602041919.T3dFYGw9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: unknown target triple 's390-unknown-linux'
   Makefile.config:491: *** No gnu/libc-version.h found, please install glibc-dev[el].  Stop.
   make[1]: *** [Makefile.perf:289: sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
