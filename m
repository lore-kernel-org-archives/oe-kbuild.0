Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DD4372ECB
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 17:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270810; cv=none; b=RzJs7/zgeB29Z/7zRbCA1V3TxOp3jsj7nWpqVwR8pQNpzKNWn9HYX3tr6WeLP5lrbL4ySzXhIW3XP4rTbJcsJoGHndf/EViLQuRWSFePX6ZTsWSN66Sb0zb0a+5ZIyyeMSd1qnGYMIe2XdLFQz7sNhjKvR/Ol6fKOBMnHV2P2VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270810; c=relaxed/simple;
	bh=/OGPdRbhrM19eukdFxiUlW8AfhijRlS+z4h80n395m0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l/Off/NNYStk7uuqcymHS4DiR+myfhAS+VA38eR3cycomgFtHCE0MMhMrVptgZjxkhekiYYomBNhBYNU+jRAaPFrT3JJD8Os/VeinofxWsvMYZ9/KhOt6w3nDr6FREXI17aCQn3BEkbKVUIf+QvPZeHfQv0rZgAOCtyvmDbHZlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQa354jJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQa354jJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790270809; x=1821806809;
  h=date:from:to:cc:subject:message-id;
  bh=/OGPdRbhrM19eukdFxiUlW8AfhijRlS+z4h80n395m0=;
  b=XQa354jJZJU4ey9C9YVvw6GMmLVTS+u6nehc1XWDe6JOFxDRCmDw4rTN
   Ji6UG7z98O/48SPdOQXxwFa4E1Y/x0a2ISJpRjygrTNX7MWbIivNTE9C8
   g+4+6svk2MF0cc/onD+BDAsrdl6j8awru2mJJdDwg0AWVU7G+tzJlybRX
   2uLZUHLcgC6dWkHhvHIx/+moIggWus3GJdOUuSYQw+4o8dtrBpNakPkXX
   cbTJfNQo6jjMxjvj/PQvI6D4zfj7Zcu1HlMhTxLMSVWMxB9rmWrByllcj
   W0cS4AmWqM4GsqWrmHhbYNcwLrJSq49sk9Te99LiLy7NTkpnUIW6+se/W
   Q==;
X-CSE-ConnectionGUID: 51mTkYTFQOOCAkfvWuyp3A==
X-CSE-MsgGUID: p6Gzl9KHSA+7M5kuYuLtRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90178471"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="90178471"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 10:26:48 -0700
X-CSE-ConnectionGUID: ydhwkeXdQ7CG6HnGzCLTAw==
X-CSE-MsgGUID: IwWHncnEQzGA5Z/P4bp4LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="273310460"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 24 Sep 2026 10:26:47 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9nDZ-000000000Nm-1jMu;
	Thu, 24 Sep 2026 17:26:45 +0000
Date: Thu, 24 Sep 2026 19:25:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/memcontrol.c:3324 drain_obj_stock_slot() warn: right
 shifting more than type allows 16 vs 16
Message-ID: <202609241949.P00Ew5fm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Shakeel Butt <shakeel.butt@linux.dev>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Harry Yoo (Oracle)" <harry@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd
commit: 29a1ea41456b79d657e5f5deced1239477d03af1 memcg: multi objcg charge support
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r2201-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241949.P00Ew5fm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 29a1ea41456b ("memcg: multi objcg charge support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609241949.P00Ew5fm-lkp@intel.com/

New smatch warnings:
mm/memcontrol.c:3324 drain_obj_stock_slot() warn: right shifting more than type allows 16 vs 16

Old smatch warnings:
arch/loongarch/include/asm/atomic.h:117 arch_atomic64_fetch_add_unless() warn: inconsistent indenting

vim +3324 mm/memcontrol.c

29a1ea41456b79 Shakeel Butt    2026-05-25  3315  
29a1ea41456b79 Shakeel Butt    2026-05-25  3316  static void drain_obj_stock_slot(struct obj_stock_pcp *stock, int i)
bf4f059954dcb2 Roman Gushchin  2020-08-06  3317  {
29a1ea41456b79 Shakeel Butt    2026-05-25  3318  	struct obj_cgroup *old = READ_ONCE(stock->cached[i]);
bf4f059954dcb2 Roman Gushchin  2020-08-06  3319  
bf4f059954dcb2 Roman Gushchin  2020-08-06  3320  	if (!old)
ae51c775aa2b1f Shakeel Butt    2025-04-03  3321  		return;
bf4f059954dcb2 Roman Gushchin  2020-08-06  3322  
29a1ea41456b79 Shakeel Butt    2026-05-25  3323  	if (stock->nr_bytes[i]) {
29a1ea41456b79 Shakeel Butt    2026-05-25 @3324  		unsigned int nr_pages = stock->nr_bytes[i] >> PAGE_SHIFT;
29a1ea41456b79 Shakeel Butt    2026-05-25  3325  		unsigned int nr_bytes = stock->nr_bytes[i] & (PAGE_SIZE - 1);
bf4f059954dcb2 Roman Gushchin  2020-08-06  3326  
af9a3b69e84bef Johannes Weiner 2022-03-22  3327  		if (nr_pages) {
af9a3b69e84bef Johannes Weiner 2022-03-22  3328  			struct mem_cgroup *memcg;
af9a3b69e84bef Johannes Weiner 2022-03-22  3329  
af9a3b69e84bef Johannes Weiner 2022-03-22  3330  			memcg = get_mem_cgroup_from_objcg(old);
af9a3b69e84bef Johannes Weiner 2022-03-22  3331  
04fbe921d3b1f5 Roman Gushchin  2024-06-28  3332  			mod_memcg_state(memcg, MEMCG_KMEM, -nr_pages);
04fbe921d3b1f5 Roman Gushchin  2024-06-28  3333  			memcg1_account_kmem(memcg, -nr_pages);
89f342af660332 Shakeel Butt    2025-04-03  3334  			if (!mem_cgroup_is_root(memcg))
89f342af660332 Shakeel Butt    2025-04-03  3335  				memcg_uncharge(memcg, nr_pages);
af9a3b69e84bef Johannes Weiner 2022-03-22  3336  
af9a3b69e84bef Johannes Weiner 2022-03-22  3337  			css_put(&memcg->css);
af9a3b69e84bef Johannes Weiner 2022-03-22  3338  		}
bf4f059954dcb2 Roman Gushchin  2020-08-06  3339  
bf4f059954dcb2 Roman Gushchin  2020-08-06  3340  		/*
bf4f059954dcb2 Roman Gushchin  2020-08-06  3341  		 * The leftover is flushed to the centralized per-memcg value.
bf4f059954dcb2 Roman Gushchin  2020-08-06  3342  		 * On the next attempt to refill obj stock it will be moved
bf4f059954dcb2 Roman Gushchin  2020-08-06  3343  		 * to a per-cpu stock (probably, on an other CPU), see
bf4f059954dcb2 Roman Gushchin  2020-08-06  3344  		 * refill_obj_stock().
bf4f059954dcb2 Roman Gushchin  2020-08-06  3345  		 *
bf4f059954dcb2 Roman Gushchin  2020-08-06  3346  		 * How often it's flushed is a trade-off between the memory
bf4f059954dcb2 Roman Gushchin  2020-08-06  3347  		 * limit enforcement accuracy and potential CPU contention,
bf4f059954dcb2 Roman Gushchin  2020-08-06  3348  		 * so it might be changed in the future.
bf4f059954dcb2 Roman Gushchin  2020-08-06  3349  		 */
bf4f059954dcb2 Roman Gushchin  2020-08-06  3350  		atomic_add(nr_bytes, &old->nr_charged_bytes);
29a1ea41456b79 Shakeel Butt    2026-05-25  3351  		stock->nr_bytes[i] = 0;
bf4f059954dcb2 Roman Gushchin  2020-08-06  3352  	}
bf4f059954dcb2 Roman Gushchin  2020-08-06  3353  
29a1ea41456b79 Shakeel Butt    2026-05-25  3354  	/* Flush vmstat data when its owning slot is being drained. */
29a1ea41456b79 Shakeel Butt    2026-05-25  3355  	if (stock->index == i)
29a1ea41456b79 Shakeel Butt    2026-05-25  3356  		drain_obj_stock_stats(stock);
e0d4e7405f267a Shakeel Butt    2026-05-25  3357  
29a1ea41456b79 Shakeel Butt    2026-05-25  3358  	WRITE_ONCE(stock->cached[i], NULL);
29a1ea41456b79 Shakeel Butt    2026-05-25  3359  	obj_cgroup_put(old);
68ac5b3c8db2fd Waiman Long     2021-06-28  3360  }
68ac5b3c8db2fd Waiman Long     2021-06-28  3361  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
