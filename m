Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55F43B2FCC
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 10:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964398; cv=none; b=c7zt/yqhpyhz4yhiKeItmX/0L45CwbPz+n/6UevYJ8uXVuLkBr20NGlgbm258/vpbQV61BFJWZof9A2e0ztPYDlZhlho33INSxUxUQXt4K5bJfDBuUVbuTP0M7FIPQqkeL8oP0jC/lmy+qSkEnWK5gpSph7I0O5qnqAHqRM0EK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964398; c=relaxed/simple;
	bh=razaG0nknTmVPOAN3Dc2QwE3sySB24IqbKtJFqgpans=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tqt76789p0llQaOqNgPi3GBXGM+TakT2fq8ubsvLVsWb/36/VcIVB3xxdwYrS4CAWhhT/3hLwRDfqW99m5xu1qm8aQtGdCZe2iiB1nBoi2e6Sp45xLQNSIAb7pS554XO078oBjUGhokEwZtca5y/g6sJ8ASsoNlPA/NDpYne4q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYFWbGFw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYFWbGFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779964396; x=1811500396;
  h=date:from:to:cc:subject:message-id;
  bh=razaG0nknTmVPOAN3Dc2QwE3sySB24IqbKtJFqgpans=;
  b=MYFWbGFw8l9nYDsxb7l8AAKy6dmCXaH0cpa+UL62uRW5eIwmIszSh1mr
   XvN8ZvKK/ZFe+EbApQsHHt6+SMsm0doce1X445SvR1atfDVzEUm7oMV1p
   /VmQqnlB9aE0DqS4wBI6X31b9EYm7keGuqzhanbaP04TBDdDZsAnc6W2N
   xGX66zc5WnIyu+Cej1buoppLMTEy/YVYD/GvPexswXL+7h3MAov/IMnX+
   E8sXTpgFbKeYxtix/ttnpevRTFdQIC35oAjaPp+ULeHqtBVnLEchTL6VM
   KBk8wfsxJk7EpseKOV3xruJAhvNQgobkfOj1hfICk4dXKTdUTRSLrs93h
   A==;
X-CSE-ConnectionGUID: 0Xx3aVr/Tr6ZcOEwFP5aFw==
X-CSE-MsgGUID: jG6zhKqvTa6t8Qp1vJckXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="106256607"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="106256607"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 03:33:15 -0700
X-CSE-ConnectionGUID: 4LZyU9kzTt+9d1PSc6hG+Q==
X-CSE-MsgGUID: ZWNkb8zFQz+V2O1W7oLG+A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 May 2026 03:33:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSY35-000000005qm-36Nv;
	Thu, 28 May 2026 10:33:11 +0000
Date: Thu, 28 May 2026 18:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 415/420] mm/memcontrol.c:3324
 drain_obj_stock_slot() warn: right shifting more than type allows 16 vs 16
Message-ID: <202605281843.zJ46f9Zo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: Shakeel Butt <shakeel.butt@linux.dev>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Harry Yoo (Oracle)" <harry@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   8a74e22643189e0ae339afc91110ddb4cab1941b
commit: ec16b15b21f5643e5521efb24bcd6666986b560b [415/420] memcg: multi objcg charge support
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: hexagon-randconfig-r071-20260528 (https://download.01.org/0day-ci/archive/20260528/202605281843.zJ46f9Zo-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605281843.zJ46f9Zo-lkp@intel.com/

smatch warnings:
mm/memcontrol.c:3324 drain_obj_stock_slot() warn: right shifting more than type allows 16 vs 16

vim +3324 mm/memcontrol.c

ec16b15b21f564 Shakeel Butt    2026-05-25  3315  
ec16b15b21f564 Shakeel Butt    2026-05-25  3316  static void drain_obj_stock_slot(struct obj_stock_pcp *stock, int i)
bf4f059954dcb2 Roman Gushchin  2020-08-06  3317  {
ec16b15b21f564 Shakeel Butt    2026-05-25  3318  	struct obj_cgroup *old = READ_ONCE(stock->cached[i]);
bf4f059954dcb2 Roman Gushchin  2020-08-06  3319  
bf4f059954dcb2 Roman Gushchin  2020-08-06  3320  	if (!old)
ae51c775aa2b1f Shakeel Butt    2025-04-03  3321  		return;
bf4f059954dcb2 Roman Gushchin  2020-08-06  3322  
ec16b15b21f564 Shakeel Butt    2026-05-25  3323  	if (stock->nr_bytes[i]) {
ec16b15b21f564 Shakeel Butt    2026-05-25 @3324  		unsigned int nr_pages = stock->nr_bytes[i] >> PAGE_SHIFT;
ec16b15b21f564 Shakeel Butt    2026-05-25  3325  		unsigned int nr_bytes = stock->nr_bytes[i] & (PAGE_SIZE - 1);
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
ec16b15b21f564 Shakeel Butt    2026-05-25  3351  		stock->nr_bytes[i] = 0;
bf4f059954dcb2 Roman Gushchin  2020-08-06  3352  	}
bf4f059954dcb2 Roman Gushchin  2020-08-06  3353  
ec16b15b21f564 Shakeel Butt    2026-05-25  3354  	/* Flush vmstat data when its owning slot is being drained. */
ec16b15b21f564 Shakeel Butt    2026-05-25  3355  	if (stock->index == i)
ec16b15b21f564 Shakeel Butt    2026-05-25  3356  		drain_obj_stock_stats(stock);
fc3324ad450f86 Shakeel Butt    2026-05-25  3357  
ec16b15b21f564 Shakeel Butt    2026-05-25  3358  	WRITE_ONCE(stock->cached[i], NULL);
ec16b15b21f564 Shakeel Butt    2026-05-25  3359  	obj_cgroup_put(old);
68ac5b3c8db2fd Waiman Long     2021-06-28  3360  }
68ac5b3c8db2fd Waiman Long     2021-06-28  3361  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
