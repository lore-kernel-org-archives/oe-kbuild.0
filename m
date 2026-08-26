Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672553B2FD6
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Aug 2026 23:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787787871; cv=none; b=b7Qmqe4Ngu1is5xXOb/9EeCceHEEoQvrlJmN/3H/OzUje6WYqZVaAgWNedy3UIWCPGYAlR+TMx+mJy9C5+7nNlGq5kLYoWGDH1k3WX3640tvBO2uAt8W94zGJdU0lrVt+vJRym2dnL7dJX2Eifs1wFbXbsu/xUPDNIjQk4VboJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787787871; c=relaxed/simple;
	bh=55ggYoBbAlbthke/nu/2Kuk9oAT/7zBU6O5Y9EfPTwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LQEg6EgLxhdWlpI5dhZNCfz57Jd5FTuorpNaMxF4oN1qn1SuGw5vyGbJOJoPmxS6SSvpwTOmXVuHI8KPhecBbAPfyzw2smMASRb07OxnL4E6tRErlV0aZgHaVOBr83VyLKrMfN4/dfvL0NUMEg14GAx9pdlvWO7jU3MeubtRbIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WpORTVea; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpORTVea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787787869; x=1819323869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=55ggYoBbAlbthke/nu/2Kuk9oAT/7zBU6O5Y9EfPTwc=;
  b=WpORTVeaSt8d4866RS6YPxBJOfOap1EkYSk2lIr0R4yS89Y/qPHIEEdE
   8QPzyzezRNawfvK7LZMFKbFSjKZbetvGrNVblZXOiuKAbWnss30zowsRd
   8oZW21rxPSNEsOvHjuoFmGaInnSpQXNyA7PaskYihkMpwd0YVK1JFx3ii
   oVc3t0MIs/3SmS+vr7ppjN0sQp3WaxxPRirBEu16hkEVelON6eBO/v0x8
   VTTTci3E/yLepKOvp2mDh1LikNJmMhD3maGPdOV5a2uKgFtzqsNS2QHwD
   zWLdBE/g98MWWCGfFFSQap6591V8Eolg8/AOKvUeK/gTYdVD2rgdykWdg
   Q==;
X-CSE-ConnectionGUID: 7SfYxgd8R1iXCZXrBJWxHg==
X-CSE-MsgGUID: 58KZlA9xQsibf5O2/fZuBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99446072"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="99446072"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 16:44:28 -0700
X-CSE-ConnectionGUID: DWkYHwYlR1emSk0m+RNnEg==
X-CSE-MsgGUID: I4Zb9z7qSE6iQ0VVsY2FGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="271919903"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Aug 2026 16:44:27 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzNI8-000000008cj-2fer;
	Wed, 26 Aug 2026 23:44:24 +0000
Date: Thu, 27 Aug 2026 07:44:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] mm: workingset: judge cross-memcg refaults by generation
 age
Message-ID: <202608270754.MUJBalZd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260826075133.751049-1-zhaoyang.huang@unisoc.com>
References: <20260826075133.751049-1-zhaoyang.huang@unisoc.com>
TO: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Hildenbrand <david@kernel.org>
TO: Axel Rasmussen <axelrasmussen@google.com>
TO: Yuanchu Xie <yuanchu@google.com>
TO: Wei Xu <weixugc@google.com>
TO: Johannes Weiner <hannes@cmpxchg.org>
TO: Michal Hocko <mhocko@kernel.org>
TO: Qi Zheng <zhengqi.arch@bytedance.com>
TO: Shakeel Butt <shakeel.butt@linux.dev>
TO: Lorenzo Stoakes <ljs@kernel.org>
TO: Barry Song <baohua@kernel.org>
TO: linux-kernel@vger.kernel.org
TO: Zhaoyang Huang <huangzhaoyang@gmail.com>
TO: steve.kang@unisoc.com

Hi zhaoyang.huang,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/mm-workingset-judge-cross-memcg-refaults-by-generation-age/20260826-155133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260826075133.751049-1-zhaoyang.huang%40unisoc.com
patch subject: [PATCH] mm: workingset: judge cross-memcg refaults by generation age
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: hexagon-randconfig-002-20260827 (https://download.01.org/0day-ci/archive/20260827/202608270754.MUJBalZd-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 771bdfdab2d66a4eb85b8ea7673cfa30152718b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608270754.MUJBalZd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608270754.MUJBalZd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/workingset.c:275:2: error: call to '__compiletime_assert_655' declared with 'error' attribute: BUILD_BUG_ON failed: EVICT_TS_WIDTH <= 0
     275 |         BUILD_BUG_ON(EVICT_TS_WIDTH <= 0);
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:22:1: note: expanded from here
      22 | __compiletime_assert_655
         | ^
   mm/workingset.c:275:2: note: called by function 'lru_gen_eviction'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:22:1: note: expanded from here
      22 | __compiletime_assert_655
         | ^
   mm/workingset.c:275:2: note: inlined by function 'workingset_eviction'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:22:1: note: expanded from here
      22 | __compiletime_assert_655
         | ^
   1 error generated.


vim +275 mm/workingset.c

ac35a490237446 Yu Zhao        2022-09-18  256  
ac35a490237446 Yu Zhao        2022-09-18  257  static void *lru_gen_eviction(struct folio *folio)
ac35a490237446 Yu Zhao        2022-09-18  258  {
ac35a490237446 Yu Zhao        2022-09-18  259  	int hist;
ac35a490237446 Yu Zhao        2022-09-18  260  	unsigned long token;
ac35a490237446 Yu Zhao        2022-09-18  261  	unsigned long min_seq;
ac35a490237446 Yu Zhao        2022-09-18  262  	struct lruvec *lruvec;
391655fe08d1f9 Yu Zhao        2022-12-21  263  	struct lru_gen_folio *lrugen;
ac35a490237446 Yu Zhao        2022-09-18  264  	int type = folio_is_file_lru(folio);
ac35a490237446 Yu Zhao        2022-09-18  265  	int delta = folio_nr_pages(folio);
ac35a490237446 Yu Zhao        2022-09-18  266  	int refs = folio_lru_refs(folio);
4d5d14a01e2c90 Yu Zhao        2024-12-30  267  	bool workingset = folio_test_workingset(folio);
4d5d14a01e2c90 Yu Zhao        2024-12-30  268  	int tier = lru_tier_from_refs(refs, workingset);
b3ca98297cd98a Muchun Song    2026-03-05  269  	struct mem_cgroup *memcg;
ac35a490237446 Yu Zhao        2022-09-18  270  	struct pglist_data *pgdat = folio_pgdat(folio);
b3ca98297cd98a Muchun Song    2026-03-05  271  	unsigned short memcg_id;
ac35a490237446 Yu Zhao        2022-09-18  272  
f3d652b0604375 Kairui Song    2026-02-18  273  	BUILD_BUG_ON(LRU_GEN_WIDTH + LRU_REFS_WIDTH >
f3d652b0604375 Kairui Song    2026-02-18  274  		     BITS_PER_LONG - max(EVICTION_SHIFT, EVICTION_SHIFT_ANON));
21d81639858ca7 Zhaoyang Huang 2026-08-26 @275  	BUILD_BUG_ON(EVICT_TS_WIDTH <= 0);
21d81639858ca7 Zhaoyang Huang 2026-08-26  276  	BUILD_BUG_ON(EVICT_SEQ_WIDTH < 16);
21d81639858ca7 Zhaoyang Huang 2026-08-26  277  	BUILD_BUG_ON(LRU_REFS_WIDTH + EVICT_SEQ_WIDTH +
21d81639858ca7 Zhaoyang Huang 2026-08-26  278  		     EVICT_TS_WIDTH != EVICTION_BITS);
ac35a490237446 Yu Zhao        2022-09-18  279  
b3ca98297cd98a Muchun Song    2026-03-05  280  	rcu_read_lock();
b3ca98297cd98a Muchun Song    2026-03-05  281  	memcg = folio_memcg(folio);
ac35a490237446 Yu Zhao        2022-09-18  282  	lruvec = mem_cgroup_lruvec(memcg, pgdat);
ac35a490237446 Yu Zhao        2022-09-18  283  	lrugen = &lruvec->lrugen;
ac35a490237446 Yu Zhao        2022-09-18  284  	min_seq = READ_ONCE(lrugen->min_seq[type]);
21d81639858ca7 Zhaoyang Huang 2026-08-26  285  	token = ((min_seq & EVICT_SEQ_MASK) << LRU_REFS_WIDTH) |
21d81639858ca7 Zhaoyang Huang 2026-08-26  286  		max(refs - 1, 0);
21d81639858ca7 Zhaoyang Huang 2026-08-26  287  	token |= (jiffies & EVICT_TS_MASK) << EVICT_TS_PGOFF;
ac35a490237446 Yu Zhao        2022-09-18  288  
ac35a490237446 Yu Zhao        2022-09-18  289  	hist = lru_hist_from_seq(min_seq);
ac35a490237446 Yu Zhao        2022-09-18  290  	atomic_long_add(delta, &lrugen->evicted[hist][type][tier]);
b3ca98297cd98a Muchun Song    2026-03-05  291  	memcg_id = mem_cgroup_private_id(memcg);
b3ca98297cd98a Muchun Song    2026-03-05  292  	rcu_read_unlock();
ac35a490237446 Yu Zhao        2022-09-18  293  
b3ca98297cd98a Muchun Song    2026-03-05  294  	return pack_shadow(memcg_id, pgdat, token, workingset, type);
ac35a490237446 Yu Zhao        2022-09-18  295  }
ac35a490237446 Yu Zhao        2022-09-18  296  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
