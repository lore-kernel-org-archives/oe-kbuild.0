Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC14E262A6
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Mar 2025 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742566799; cv=none; b=l5B37kN0d4OzNnClAnE+24vbhgXFQNYFDiIz8NUw8ia7IIKF0Z1Ql+q8CECxTL3VYKHtsTnmnvqIbE48+2ZlG0cZWA4hhTy8XvD1ux46WTwaTgFOF38FlmgpVxeYdj6QU7ZqUnCtJ69/pK4lzmfE3HvWAYL75NjMHLv2fa4CCv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742566799; c=relaxed/simple;
	bh=CSPqXv5xCh0kEWyfDJ+4CE+JTR3P7EK0+g98iyv1fMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pKD4F/G9CMmS8wIUsci9qWci+zocIDzhWpVk0hWzO5Gs3KqypkR1w4Sna/J+h29P6bsoUhg0aUpYvd/Q9BI7NNAhonRuONyl1DG33a7eZXt0iZY6mALKnbJGa75I2MDZAhQhDTQmI44bsMUi0W9b6edb6fhrag03cOzY2rl7pe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VvShF+rj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VvShF+rj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742566798; x=1774102798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSPqXv5xCh0kEWyfDJ+4CE+JTR3P7EK0+g98iyv1fMM=;
  b=VvShF+rjg2KQU+DBc4IIvZ6AvGCKnbaLy+Crauij04Xn8ne1nFR5aICf
   PLWmIpVXAgZ1Q1YhnBQCMFUe3YmJtF5JlFYE64zYYBhBOrkSnO2RfxpZz
   n0VutRKFqDZxeAz7oXLvAZ3R9D1IGHf6IJHjQlxvcUWvO/2dCfc8Sbkbm
   odqCA0eyfFCG6iMkQoNtqTLg42QQbrTRvHVpP51Vudz081c+oEDxtcHOo
   fuZf2WsfJrIlGw5FziYSSgzvbYM2R8cSHMSdDrk4sYZgA2aQ8rYwkvFci
   Ud8ZvzFDfry0KJ7+dADGJoTQbis/oItgntYFeicRDDjrLtGPI8dBmS96K
   g==;
X-CSE-ConnectionGUID: 0OAZCDiwRaOltRj/terPyQ==
X-CSE-MsgGUID: L4eXCxXYSPeZvsUDAJRcQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43561872"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="43561872"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 07:19:57 -0700
X-CSE-ConnectionGUID: 6YGe3WdGRQ+jAfhxU05bfw==
X-CSE-MsgGUID: I9gVcA/3RV+90Gp/IO8yQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="154301599"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Mar 2025 07:19:56 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvdE1-0001Nn-1W;
	Fri, 21 Mar 2025 14:19:53 +0000
Date: Fri, 21 Mar 2025 22:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 2/2] mm/vmscan.c:5449 shrink_many()
 error: uninitialized symbol 'lruvec'.
Message-ID: <202503212243.y4I6GS9Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   5145d157731fcdde380e5da461c483b5080a8df5
commit: 0500235e3f9d430936afc1377ac2efd76487ae9a [2/2] ANDROID: vendor_hook: Add vendor hook to decide scan abort policy
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 6 months ago
config: i386-randconfig-141-20250321 (https://download.01.org/0day-ci/archive/20250321/202503212243.y4I6GS9Z-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503212243.y4I6GS9Z-lkp@intel.com/

smatch warnings:
mm/vmscan.c:5449 shrink_many() error: uninitialized symbol 'lruvec'.

vim +/lruvec +5449 mm/vmscan.c

014f97baadc9bc Yu Zhao      2022-12-21  5397  
014f97baadc9bc Yu Zhao      2022-12-21  5398  static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
014f97baadc9bc Yu Zhao      2022-12-21  5399  {
3792ff78b1a131 Yu Zhao      2023-02-13  5400  	int op;
014f97baadc9bc Yu Zhao      2022-12-21  5401  	int gen;
014f97baadc9bc Yu Zhao      2022-12-21  5402  	int bin;
014f97baadc9bc Yu Zhao      2022-12-21  5403  	int first_bin;
014f97baadc9bc Yu Zhao      2022-12-21  5404  	struct lruvec *lruvec;
0500235e3f9d43 Kalesh Singh 2023-07-13  5405  	struct lru_gen_folio *lrugen = NULL;
3792ff78b1a131 Yu Zhao      2023-02-13  5406  	struct mem_cgroup *memcg;
014f97baadc9bc Yu Zhao      2022-12-21  5407  	const struct hlist_nulls_node *pos;
014f97baadc9bc Yu Zhao      2022-12-21  5408  
014f97baadc9bc Yu Zhao      2022-12-21  5409  	bin = first_bin = get_random_u32_below(MEMCG_NR_BINS);
014f97baadc9bc Yu Zhao      2022-12-21  5410  restart:
3792ff78b1a131 Yu Zhao      2023-02-13  5411  	op = 0;
3792ff78b1a131 Yu Zhao      2023-02-13  5412  	memcg = NULL;
014f97baadc9bc Yu Zhao      2022-12-21  5413  	gen = get_memcg_gen(READ_ONCE(pgdat->memcg_lru.seq));
014f97baadc9bc Yu Zhao      2022-12-21  5414  
014f97baadc9bc Yu Zhao      2022-12-21  5415  	rcu_read_lock();
014f97baadc9bc Yu Zhao      2022-12-21  5416  
014f97baadc9bc Yu Zhao      2022-12-21  5417  	hlist_nulls_for_each_entry_rcu(lrugen, pos, &pgdat->memcg_lru.fifo[gen][bin], list) {
014f97baadc9bc Yu Zhao      2022-12-21  5418  		if (op)
014f97baadc9bc Yu Zhao      2022-12-21  5419  			lru_gen_rotate_memcg(lruvec, op);
014f97baadc9bc Yu Zhao      2022-12-21  5420  
014f97baadc9bc Yu Zhao      2022-12-21  5421  		mem_cgroup_put(memcg);
014f97baadc9bc Yu Zhao      2022-12-21  5422  
014f97baadc9bc Yu Zhao      2022-12-21  5423  		lruvec = container_of(lrugen, struct lruvec, lrugen);
014f97baadc9bc Yu Zhao      2022-12-21  5424  		memcg = lruvec_memcg(lruvec);
014f97baadc9bc Yu Zhao      2022-12-21  5425  
014f97baadc9bc Yu Zhao      2022-12-21  5426  		if (!mem_cgroup_tryget(memcg)) {
014f97baadc9bc Yu Zhao      2022-12-21  5427  			op = 0;
014f97baadc9bc Yu Zhao      2022-12-21  5428  			memcg = NULL;
014f97baadc9bc Yu Zhao      2022-12-21  5429  			continue;
014f97baadc9bc Yu Zhao      2022-12-21  5430  		}
014f97baadc9bc Yu Zhao      2022-12-21  5431  
014f97baadc9bc Yu Zhao      2022-12-21  5432  		rcu_read_unlock();
014f97baadc9bc Yu Zhao      2022-12-21  5433  
014f97baadc9bc Yu Zhao      2022-12-21  5434  		op = shrink_one(lruvec, sc);
014f97baadc9bc Yu Zhao      2022-12-21  5435  
014f97baadc9bc Yu Zhao      2022-12-21  5436  		rcu_read_lock();
3792ff78b1a131 Yu Zhao      2023-02-13  5437  
0500235e3f9d43 Kalesh Singh 2023-07-13  5438  		if (should_abort_scan(lruvec, sc))
3792ff78b1a131 Yu Zhao      2023-02-13  5439  			break;
014f97baadc9bc Yu Zhao      2022-12-21  5440  	}
014f97baadc9bc Yu Zhao      2022-12-21  5441  
014f97baadc9bc Yu Zhao      2022-12-21  5442  	rcu_read_unlock();
014f97baadc9bc Yu Zhao      2022-12-21  5443  
3792ff78b1a131 Yu Zhao      2023-02-13  5444  	if (op)
3792ff78b1a131 Yu Zhao      2023-02-13  5445  		lru_gen_rotate_memcg(lruvec, op);
3792ff78b1a131 Yu Zhao      2023-02-13  5446  
3792ff78b1a131 Yu Zhao      2023-02-13  5447  	mem_cgroup_put(memcg);
3792ff78b1a131 Yu Zhao      2023-02-13  5448  
0500235e3f9d43 Kalesh Singh 2023-07-13 @5449  	if (lruvec && should_abort_scan(lruvec, sc))
3792ff78b1a131 Yu Zhao      2023-02-13  5450  		return;
3792ff78b1a131 Yu Zhao      2023-02-13  5451  
014f97baadc9bc Yu Zhao      2022-12-21  5452  	/* restart if raced with lru_gen_rotate_memcg() */
014f97baadc9bc Yu Zhao      2022-12-21  5453  	if (gen != get_nulls_value(pos))
014f97baadc9bc Yu Zhao      2022-12-21  5454  		goto restart;
014f97baadc9bc Yu Zhao      2022-12-21  5455  
014f97baadc9bc Yu Zhao      2022-12-21  5456  	/* try the rest of the bins of the current generation */
014f97baadc9bc Yu Zhao      2022-12-21  5457  	bin = get_memcg_bin(bin + 1);
014f97baadc9bc Yu Zhao      2022-12-21  5458  	if (bin != first_bin)
014f97baadc9bc Yu Zhao      2022-12-21  5459  		goto restart;
014f97baadc9bc Yu Zhao      2022-12-21  5460  }
014f97baadc9bc Yu Zhao      2022-12-21  5461  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
