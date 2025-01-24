Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FD478F57
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Jan 2025 15:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731036; cv=none; b=LlT8JMkoUWhQ3sAN+T4KJrVWQBdCCu7qU89/KysDpQ/50h7ouH1YJwNpc0wl+migWkj3+6SM0f/0t8dKzI/fSo3BjCxOHn7NUNCZvrp7UQKnz75jzVeUntqWZhPA1hQH/jXd05IpbR7VftR3cC1ahrsxYvqXfSZHDYx5vV7ILlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731036; c=relaxed/simple;
	bh=xQURHjxQ9m7f7WTYiOy8lnOiOCya/PLVyF85OUrlp1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jv1ov6JS/Ju8ouf3rrcA7lidd1l0gd4gduCNF9vKnQz3PerCx5a0BQeCwQjrJZBp8iqBbrSNrDYqnLdBukX7I606Mw/JSN0PzERWywv7UTDi3KX4H9x2c5mpmy2e4AF8XDag0wTJcMM/zv/du+xSV8Ru0RoKV8ErN8uzUNPqV1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dB50rJjZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dB50rJjZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737731035; x=1769267035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xQURHjxQ9m7f7WTYiOy8lnOiOCya/PLVyF85OUrlp1I=;
  b=dB50rJjZ30mr1v51bs85oXaT7tBdM3UUkA5xf+uQg78XExkAK+Aj7yBO
   P9qAFrqTNyWzi9RhzPcBLu2BaYB4ThQL9nm2oJ0O/eEfDq76hCpu87agp
   kNicMBSK2uESApkXbfhvYlzAkkHs3tNT9Nm0pJsm6AYAe9WNoty/DvooB
   yp6g+hVwfwR5BZxRRIxBSzIV1iRgE/mitEUC5XEahOAQjRpZ9U2wPJwTb
   V//jDK+T7DeQKNcHkVG4BHKdAjqhO01Jp5912iN3/0uEj38xDxF11iEBQ
   DJYAKZ3Gf13gVHPeG1P4rvmca1DSHI3H3IwIQ05C5xGDXxFmULOstUKDM
   A==;
X-CSE-ConnectionGUID: grEPwTWzTjan4wyAzF5tTw==
X-CSE-MsgGUID: YGi+9Qg6TwGgc8R8I65/8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="49253503"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="49253503"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 07:03:54 -0800
X-CSE-ConnectionGUID: 5Hoo7XjLRLekkaiI5uEwRQ==
X-CSE-MsgGUID: anC4WvOHRNG+6CQMRVHCww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112731455"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Jan 2025 07:03:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbLDr-000cmT-1g;
	Fri, 24 Jan 2025 15:03:51 +0000
Date: Fri, 24 Jan 2025 23:03:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: block/kyber-iosched.o: warning: objtool: .discard.annotate_insn:
 dodgy linker, sh_entsize != 8
Message-ID: <202501242202.Td9pMcfi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "objtool: .discard.annotate_insn: dodgy linker"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bc8198dc7ebc492ec3e9fa1617dcdfbe98e73b17
commit: 22c3d58079688b697f36d670616e463cbb14d058 objtool: Convert ANNOTATE_NOENDBR to ANNOTATE
date:   8 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-r121-20250124 (https://download.01.org/0day-ci/archive/20250124/202501242202.Td9pMcfi-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501242202.Td9pMcfi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501242202.Td9pMcfi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/kyber-iosched.c:10:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> block/kyber-iosched.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
