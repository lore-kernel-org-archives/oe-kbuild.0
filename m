Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558EE42A9D
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Jun 2025 04:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749358763; cv=none; b=BKzWqb6WeN9njicpbSi7MCGvMkhwRVEpimdqY3d6g2zwYKyCofGjJDHMm3470zgk7gpAwvCjaak0PTr4M18tt9aNcRchStplfRexqHVY3WG9ZHExTtBKf42Z7K94s9ZmhchahHxfGJIAlOve10m7QdI3aNhDX2gbLfdix0gfKVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749358763; c=relaxed/simple;
	bh=ndLi7TfakleFCIMsxt5U3cLSk+Q4h7bDJDLGY5KqMfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p8sXMbXVmlpaEbvrv290OpgtCrqjYbWzAEPZeyOOPCBhUX5HvDYvF7VoKESqf5Jf0pWEStyzVHaOBDvSQZBaE9Pniu+r6HkQ3nXGzviF1A7APcFTo5voCdvoy5PsKqM21g3QgVw5Q8a5tMIY7diIw/1VxxRRaeqS+6dnAKsXEtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9u/cIBP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9u/cIBP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749358761; x=1780894761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ndLi7TfakleFCIMsxt5U3cLSk+Q4h7bDJDLGY5KqMfE=;
  b=K9u/cIBPLTUeeWbFEXkXzcp7Sr5va/579Bc7xM7Tze2b9eaW2LeFTqjJ
   oFf490MHlJ/mfnabEc4emEhk1vNaJ0dEciXr0BW3t8mPndmDo1bQ/rDAl
   YDC1baD48vVwMWM/qfuU0DBufedwuR3keHReHjuXtVO5xP/P75jHsZhX+
   jtamvN9PmeViaCrRUMzVHGTJw7VbsdF5jVFpUBb5x1rM04XWC+wnMGcMC
   eChC+9i8SgA0a/q3hq6hbUKQTwhxrJYYIY5kkoeO9NxqHCJPqtENzzgVc
   KAvp6LjV1+elE/OCK8Ry/vu3V5gZ0gIISRrhWqun2SBeR6iKWZsZnDTJt
   w==;
X-CSE-ConnectionGUID: YZtxb22/RuqDjqUKxfe4Ug==
X-CSE-MsgGUID: bFTDCBpXSU6Antxhy0oCyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="55123907"
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="55123907"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 21:59:21 -0700
X-CSE-ConnectionGUID: RQaX6DKKR+CfuxhI/HEMtA==
X-CSE-MsgGUID: 2HReGO0+S2CMd2DSbucnYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="177091523"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jun 2025 21:59:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uO87p-0006Cj-14;
	Sun, 08 Jun 2025 04:59:17 +0000
Date: Sun, 8 Jun 2025 12:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-new 46/87] mm/damon/stat.c:95 damon_stat_sort_regions()
 error: uninitialized symbol 'region_pointers'.
Message-ID: <202506081225.uEJqjfps-lkp@intel.com>
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
TO: SeongJae Park <sj@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   68c1cada7ea1cb7efdd7fe4cd2f80a561322b8cc
commit: af0af3f952611a4e77d92b4b5a725c679d5a7107 [46/87] mm/damon/stat: calculate and expose idle time percentiles
:::::: branch date: 2 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-161-20250608 (https://download.01.org/0day-ci/archive/20250608/202506081225.uEJqjfps-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506081225.uEJqjfps-lkp@intel.com/

smatch warnings:
mm/damon/stat.c:95 damon_stat_sort_regions() error: uninitialized symbol 'region_pointers'.

vim +/region_pointers +95 mm/damon/stat.c

af0af3f952611a SeongJae Park 2025-06-04   73  
af0af3f952611a SeongJae Park 2025-06-04   74  static int damon_stat_sort_regions(struct damon_ctx *c,
af0af3f952611a SeongJae Park 2025-06-04   75  		struct damon_region ***sorted_ptr, int *nr_regions_ptr,
af0af3f952611a SeongJae Park 2025-06-04   76  		unsigned long *total_sz_ptr)
af0af3f952611a SeongJae Park 2025-06-04   77  {
af0af3f952611a SeongJae Park 2025-06-04   78  	struct damon_target *t;
af0af3f952611a SeongJae Park 2025-06-04   79  	struct damon_region *r;
af0af3f952611a SeongJae Park 2025-06-04   80  	struct damon_region **region_pointers;
af0af3f952611a SeongJae Park 2025-06-04   81  	unsigned int nr_regions = 0;
af0af3f952611a SeongJae Park 2025-06-04   82  	unsigned long total_sz = 0;
af0af3f952611a SeongJae Park 2025-06-04   83  
af0af3f952611a SeongJae Park 2025-06-04   84  	damon_for_each_target(t, c) {
af0af3f952611a SeongJae Park 2025-06-04   85  		/* there is only one target */
af0af3f952611a SeongJae Park 2025-06-04   86  		region_pointers = kmalloc_array(damon_nr_regions(t),
af0af3f952611a SeongJae Park 2025-06-04   87  				sizeof(*region_pointers), GFP_KERNEL);
af0af3f952611a SeongJae Park 2025-06-04   88  		if (!region_pointers)
af0af3f952611a SeongJae Park 2025-06-04   89  			return -ENOMEM;
af0af3f952611a SeongJae Park 2025-06-04   90  		damon_for_each_region(r, t) {
af0af3f952611a SeongJae Park 2025-06-04   91  			region_pointers[nr_regions++] = r;
af0af3f952611a SeongJae Park 2025-06-04   92  			total_sz += r->ar.end - r->ar.start;
af0af3f952611a SeongJae Park 2025-06-04   93  		}
af0af3f952611a SeongJae Park 2025-06-04   94  	}
af0af3f952611a SeongJae Park 2025-06-04  @95  	sort(region_pointers, nr_regions, sizeof(*region_pointers),
af0af3f952611a SeongJae Park 2025-06-04   96  			damon_stat_cmp_regions, NULL);
af0af3f952611a SeongJae Park 2025-06-04   97  	*sorted_ptr = region_pointers;
af0af3f952611a SeongJae Park 2025-06-04   98  	*nr_regions_ptr = nr_regions;
af0af3f952611a SeongJae Park 2025-06-04   99  	*total_sz_ptr = total_sz;
af0af3f952611a SeongJae Park 2025-06-04  100  	return 0;
af0af3f952611a SeongJae Park 2025-06-04  101  }
af0af3f952611a SeongJae Park 2025-06-04  102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
