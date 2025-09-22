Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A7219A288
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 02:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758508987; cv=none; b=qweGCWkNGCZdrBQVZ/UpQoxlZPMzdJOh948IiXWL2wNZ4AtGqhCWObjE3KBPRfQGVvDwx03MXR36bdeXgo2sm5j7jcDJU5OTM9o5lo0RgJJJPKazB3L0seKj/puvE4p/IGcrfGwBGgGdI4++U1gZaCppEQJZn/gNuRqSaGnau+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758508987; c=relaxed/simple;
	bh=dToidtFaMkmz245M3vUA4t0zpnuMrzzu8fD2zmLinNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L15SYduC2h65Co2KOGQfz+lpuqQmC3aiPwkeoqEcUw0CF/8DFZrJWBGSdo3hDzNN92NPA0EbnXQxIxWIYsafWgZgyj0SryJ+SgI1Awgv5G3aQzB97giCnD1dIgTtEeeGe0Kmhut+3whC9xbrIOz4lXrIY2anKfA2ppsbGQW9YbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+lBQN+T; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+lBQN+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758508985; x=1790044985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dToidtFaMkmz245M3vUA4t0zpnuMrzzu8fD2zmLinNI=;
  b=X+lBQN+TkqZTyrtf4YV8IVUfxHXpdfunRuCNbcRRkoZ1OMxI2zte0CKE
   Mkdi+xStsKLiolNm/q84quoPaDn+9q20MvkpyPzpUKUcx1vsy4q4Po8ea
   RIw6fzQGw9dSHlUR9hr1sT6Lf9fWvcYiG1VD0/SwbyXCQZm5Zt1b58U5c
   OIlhwgXf+F2Det5I7DTrFhcGkvaL7ynNZ62gtV8WDPYevPee0viFgikwK
   NUoEIfK/QouSrnwyen5KLlEdvUSdL1oGmMuFNtRGqqY9kivPH07oSkRTA
   MqmwQ/49jVkfR0gvfT9Uq/G+MyAc/z44/jU69atmu5ZPXg49NaGf2tJlK
   w==;
X-CSE-ConnectionGUID: kLwFM2aFR2OLdrAOeDI40Q==
X-CSE-MsgGUID: n2gUVTJaR82Fjlyq81/yPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="86204878"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="86204878"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 19:43:05 -0700
X-CSE-ConnectionGUID: i/WFrPFrSyySG0TEbegC6g==
X-CSE-MsgGUID: Vv35tn94Q7GDDUONkGmuXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="180376751"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Sep 2025 19:43:04 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0WW5-0001Gx-05;
	Mon, 22 Sep 2025 02:43:01 +0000
Date: Mon, 22 Sep 2025 10:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/damon/stat.c:95 damon_stat_sort_regions() error: uninitialized
 symbol 'region_pointers'.
Message-ID: <202509221015.YRQMsqDN-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: SeongJae Park <sj@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   07e27ad16399afcd693be20211b0dfae63e0615f
commit: e5d2585d9e859df712e5c9308bf19f83927e0021 mm/damon/stat: calculate and expose idle time percentiles
date:   2 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 2 months ago
config: i386-randconfig-141-20250922 (https://download.01.org/0day-ci/archive/20250922/202509221015.YRQMsqDN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509221015.YRQMsqDN-lkp@intel.com/

smatch warnings:
mm/damon/stat.c:95 damon_stat_sort_regions() error: uninitialized symbol 'region_pointers'.

vim +/region_pointers +95 mm/damon/stat.c

e5d2585d9e859df SeongJae Park 2025-06-04   73  
e5d2585d9e859df SeongJae Park 2025-06-04   74  static int damon_stat_sort_regions(struct damon_ctx *c,
e5d2585d9e859df SeongJae Park 2025-06-04   75  		struct damon_region ***sorted_ptr, int *nr_regions_ptr,
e5d2585d9e859df SeongJae Park 2025-06-04   76  		unsigned long *total_sz_ptr)
e5d2585d9e859df SeongJae Park 2025-06-04   77  {
e5d2585d9e859df SeongJae Park 2025-06-04   78  	struct damon_target *t;
e5d2585d9e859df SeongJae Park 2025-06-04   79  	struct damon_region *r;
e5d2585d9e859df SeongJae Park 2025-06-04   80  	struct damon_region **region_pointers;
e5d2585d9e859df SeongJae Park 2025-06-04   81  	unsigned int nr_regions = 0;
e5d2585d9e859df SeongJae Park 2025-06-04   82  	unsigned long total_sz = 0;
e5d2585d9e859df SeongJae Park 2025-06-04   83  
e5d2585d9e859df SeongJae Park 2025-06-04   84  	damon_for_each_target(t, c) {
e5d2585d9e859df SeongJae Park 2025-06-04   85  		/* there is only one target */
e5d2585d9e859df SeongJae Park 2025-06-04   86  		region_pointers = kmalloc_array(damon_nr_regions(t),
e5d2585d9e859df SeongJae Park 2025-06-04   87  				sizeof(*region_pointers), GFP_KERNEL);
e5d2585d9e859df SeongJae Park 2025-06-04   88  		if (!region_pointers)
e5d2585d9e859df SeongJae Park 2025-06-04   89  			return -ENOMEM;
e5d2585d9e859df SeongJae Park 2025-06-04   90  		damon_for_each_region(r, t) {
e5d2585d9e859df SeongJae Park 2025-06-04   91  			region_pointers[nr_regions++] = r;
e5d2585d9e859df SeongJae Park 2025-06-04   92  			total_sz += r->ar.end - r->ar.start;
e5d2585d9e859df SeongJae Park 2025-06-04   93  		}
e5d2585d9e859df SeongJae Park 2025-06-04   94  	}
e5d2585d9e859df SeongJae Park 2025-06-04  @95  	sort(region_pointers, nr_regions, sizeof(*region_pointers),
e5d2585d9e859df SeongJae Park 2025-06-04   96  			damon_stat_cmp_regions, NULL);
e5d2585d9e859df SeongJae Park 2025-06-04   97  	*sorted_ptr = region_pointers;
e5d2585d9e859df SeongJae Park 2025-06-04   98  	*nr_regions_ptr = nr_regions;
e5d2585d9e859df SeongJae Park 2025-06-04   99  	*total_sz_ptr = total_sz;
e5d2585d9e859df SeongJae Park 2025-06-04  100  	return 0;
e5d2585d9e859df SeongJae Park 2025-06-04  101  }
e5d2585d9e859df SeongJae Park 2025-06-04  102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
