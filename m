Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FA4225417
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 08:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603453; cv=none; b=aG5DU6snUJwLuo9mm8nPtOZef7/4tj+siJrjgZBozOIG5kjGIx4nqiPekiI6MqpLzvE3W1EXAhHe+bwCemw6xI2wl/nefsArlJEOmn6Q03Hetv4pSif9oeRPDfDpL59HL2ME3sU/T/pwbAlbnjv8uckUZ3RTGQ4T9ubRHpeeiq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603453; c=relaxed/simple;
	bh=MDlCpvNtRLLd8bW2dSgp14ZYe9txyZmFlLWXLE0ZrT0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rVvy4DZn3KYnTuJi0UY/BTvcqUOvQm9htjK6VAb4HRT8P/c4WgO314/vC9hwtTY0r9hawITYD9UcZDd8FAfImCu7eQ+qmiN7yxes5EwOsAdCJktcnFOUkux9HRxmiRjXXhol2Mj+8UwWp4F0JyjjyNWWho5k0QHWwQ6e/ZH4f7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWOe1c3J; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWOe1c3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767603452; x=1799139452;
  h=date:from:to:cc:subject:message-id;
  bh=MDlCpvNtRLLd8bW2dSgp14ZYe9txyZmFlLWXLE0ZrT0=;
  b=XWOe1c3Jpo+lax4G33iaNR1qfE4UX9/dsJEHmdTdZixOXQjmW+evkbfz
   PTpoo8GFsj+sjwHLCDfuDDTOrwnCC7F//V+Xn7Vag85x2FjDOWIdgf8NH
   OQbE+jqPgvWGuT/+6eVu8ZcVrrNV1no8/yCZexKTejKijUOOzvhss/rE1
   PwipRMl4DlFXshKW2vGbazfZxN30JmZscTgqBHiZx58MHObm1yYu/b2mg
   Lr21/jvu/gUNX4nQhFvxiSGbO/ruRKLiGQvf1arVxnlx991gjPK1DeO83
   BzmOl+0c8ATwOS8jRpHLUZB7kvsqKnGzmsa9i7Et1oWf28CrMnEJIF1RB
   Q==;
X-CSE-ConnectionGUID: BwwofwLsTtiLgmMDiqJQEg==
X-CSE-MsgGUID: d/TuQj+YShya1lwhNbwF1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="56528393"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="56528393"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 00:57:31 -0800
X-CSE-ConnectionGUID: TAsXicKSQDeEU3/3Pej8Pg==
X-CSE-MsgGUID: 4uSF3JnzRya9oLZr8+ze/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="202592016"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jan 2026 00:57:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcgP1-00000000129-45oq;
	Mon, 05 Jan 2026 08:57:27 +0000
Date: Mon, 05 Jan 2026 16:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/damon/stat.c:95 damon_stat_sort_regions() error:
 uninitialized symbol 'region_pointers'.
Message-ID: <202601051656.b1Nrw1bU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: SeongJae Park <sj@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3609fa95fb0f2c1b099e69e56634edb8fc03f87c
commit: e5d2585d9e859df712e5c9308bf19f83927e0021 mm/damon/stat: calculate and expose idle time percentiles
date:   6 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-r071-20260104 (https://download.01.org/0day-ci/archive/20260105/202601051656.b1Nrw1bU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601051656.b1Nrw1bU-lkp@intel.com/

smatch warnings:
mm/damon/stat.c:95 damon_stat_sort_regions() error: uninitialized symbol 'region_pointers'.

vim +/region_pointers +95 mm/damon/stat.c

e5d2585d9e859d SeongJae Park 2025-06-04   73  
e5d2585d9e859d SeongJae Park 2025-06-04   74  static int damon_stat_sort_regions(struct damon_ctx *c,
e5d2585d9e859d SeongJae Park 2025-06-04   75  		struct damon_region ***sorted_ptr, int *nr_regions_ptr,
e5d2585d9e859d SeongJae Park 2025-06-04   76  		unsigned long *total_sz_ptr)
e5d2585d9e859d SeongJae Park 2025-06-04   77  {
e5d2585d9e859d SeongJae Park 2025-06-04   78  	struct damon_target *t;
e5d2585d9e859d SeongJae Park 2025-06-04   79  	struct damon_region *r;
e5d2585d9e859d SeongJae Park 2025-06-04   80  	struct damon_region **region_pointers;
e5d2585d9e859d SeongJae Park 2025-06-04   81  	unsigned int nr_regions = 0;
e5d2585d9e859d SeongJae Park 2025-06-04   82  	unsigned long total_sz = 0;
e5d2585d9e859d SeongJae Park 2025-06-04   83  
e5d2585d9e859d SeongJae Park 2025-06-04   84  	damon_for_each_target(t, c) {
e5d2585d9e859d SeongJae Park 2025-06-04   85  		/* there is only one target */
e5d2585d9e859d SeongJae Park 2025-06-04   86  		region_pointers = kmalloc_array(damon_nr_regions(t),
e5d2585d9e859d SeongJae Park 2025-06-04   87  				sizeof(*region_pointers), GFP_KERNEL);
e5d2585d9e859d SeongJae Park 2025-06-04   88  		if (!region_pointers)
e5d2585d9e859d SeongJae Park 2025-06-04   89  			return -ENOMEM;
e5d2585d9e859d SeongJae Park 2025-06-04   90  		damon_for_each_region(r, t) {
e5d2585d9e859d SeongJae Park 2025-06-04   91  			region_pointers[nr_regions++] = r;
e5d2585d9e859d SeongJae Park 2025-06-04   92  			total_sz += r->ar.end - r->ar.start;
e5d2585d9e859d SeongJae Park 2025-06-04   93  		}
e5d2585d9e859d SeongJae Park 2025-06-04   94  	}
e5d2585d9e859d SeongJae Park 2025-06-04  @95  	sort(region_pointers, nr_regions, sizeof(*region_pointers),
e5d2585d9e859d SeongJae Park 2025-06-04   96  			damon_stat_cmp_regions, NULL);
e5d2585d9e859d SeongJae Park 2025-06-04   97  	*sorted_ptr = region_pointers;
e5d2585d9e859d SeongJae Park 2025-06-04   98  	*nr_regions_ptr = nr_regions;
e5d2585d9e859d SeongJae Park 2025-06-04   99  	*total_sz_ptr = total_sz;
e5d2585d9e859d SeongJae Park 2025-06-04  100  	return 0;
e5d2585d9e859d SeongJae Park 2025-06-04  101  }
e5d2585d9e859d SeongJae Park 2025-06-04  102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
