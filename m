Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA8115575D
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Jan 2025 23:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738365397; cv=none; b=U3EY/uyFIbf0GrVuZy9xh5Ek8aOuj6O9UdRGRXjv1mZhfZrf4LnaIUvdxJ/KCOXlblpX4d4MYc+dJb76TfjnkGTmdmm2ktq/s7xJH7ngz7/qZ8qthAl6Xx7oXnPC109HSdZf/aJ/Z9VLktcrDXngbiEkxbz5TNO06omBfrvR0MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738365397; c=relaxed/simple;
	bh=StV5n+7Sl9oc3pj08WIlH7PLBDmg8P51XGWk7NKgwTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PJnjd83UqjzvUQpzLaYaQIcTRLE7oPrXPf+OimOK0Xlp6o8eBpsuVQo1fVweuiNGPijr7h7WDhK0ZGc5Nohcjr4lCoNOqXnbmfEkc6OVbqLdcnEQ4kac0GKatcYT6fWPPaKZMUskx9rgQfbCic/Qn1FkusQT0Vz0Ihy8VP4t8Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjs1i42E; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjs1i42E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738365395; x=1769901395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=StV5n+7Sl9oc3pj08WIlH7PLBDmg8P51XGWk7NKgwTA=;
  b=hjs1i42E426zCDZz5oV9ClbBC6YtUNLCo4rnjJlxRKeBB1XniOJURuzG
   dEutlfCZMO9A1jomcbcK6deDdIS5YU4rlziIhrGw8hO24r2eFDZHSRhxG
   /f1rvh1ctu+GP2liCcu+j2sfbxHncCA58M1u7zdlUvkXrgROVJlb3GgAE
   W2LmOCscz7wvAdetlBQtYmUBzqNIdjPvdJ4JADZIRtdi86DZDXBhuAzVp
   5igfBFF7Q75YliMuif5+zAjzUNrCJntTGBCblLBaeCW1Y5N+2m2A7OaQ2
   RzYDWSWk616ZA5kNYX/JJUlexAyMmMzfqA6I5PnL4I3+GHfSvGR1Ed7Zf
   w==;
X-CSE-ConnectionGUID: VvbgmCBVSd+4QKZG9b3W+w==
X-CSE-MsgGUID: Dk20pb31TLSiG5qp0nLZcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="41777339"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="41777339"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 15:16:34 -0800
X-CSE-ConnectionGUID: 1ciN6T1LRFKY2oWcz4xV4w==
X-CSE-MsgGUID: PvuyTuf5RKWrvPEJWMIYQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="110334298"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jan 2025 15:16:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te0FS-000nNv-2J;
	Fri, 31 Jan 2025 23:16:30 +0000
Date: Sat, 1 Feb 2025 07:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 66/111] mm/cma.c:316 list_insert_sorted()
 error: uninitialized symbol 'mlp'.
Message-ID: <202502010703.ttwDjC7q-lkp@intel.com>
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
TO: Frank van der Linden <fvdl@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f5604ad70091eabe663ea7106ced99449d653320
commit: 6d96239d471a1262aefa0e9594fa0b1f5e45e3aa [66/111] mm, cma: support multiple contiguous ranges, if requested
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: s390-randconfig-r071-20250201 (https://download.01.org/0day-ci/archive/20250201/202502010703.ttwDjC7q-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502010703.ttwDjC7q-lkp@intel.com/

smatch warnings:
mm/cma.c:316 list_insert_sorted() error: uninitialized symbol 'mlp'.
mm/cma.c:380 cma_declare_contiguous_multi() warn: iterator 'i' not incremented
mm/cma.c:963 cma_release() error: uninitialized symbol 'cmr'.

vim +/mlp +316 mm/cma.c

6d96239d471a12 Frank van der Linden 2025-01-29  296  
6d96239d471a12 Frank van der Linden 2025-01-29  297  /*
6d96239d471a12 Frank van der Linden 2025-01-29  298   * Helper function to create sorted lists.
6d96239d471a12 Frank van der Linden 2025-01-29  299   */
6d96239d471a12 Frank van der Linden 2025-01-29  300  static void __init list_insert_sorted(
6d96239d471a12 Frank van der Linden 2025-01-29  301  	struct list_head *ranges,
6d96239d471a12 Frank van der Linden 2025-01-29  302  	struct cma_init_memrange *mrp,
6d96239d471a12 Frank van der Linden 2025-01-29  303  	bool (*cmp)(struct cma_init_memrange *lh, struct cma_init_memrange *rh))
6d96239d471a12 Frank van der Linden 2025-01-29  304  {
6d96239d471a12 Frank van der Linden 2025-01-29  305  	struct list_head *mp;
6d96239d471a12 Frank van der Linden 2025-01-29  306  	struct cma_init_memrange *mlp;
6d96239d471a12 Frank van der Linden 2025-01-29  307  
6d96239d471a12 Frank van der Linden 2025-01-29  308  	if (list_empty(ranges))
6d96239d471a12 Frank van der Linden 2025-01-29  309  		list_add(&mrp->list, ranges);
6d96239d471a12 Frank van der Linden 2025-01-29  310  	{
6d96239d471a12 Frank van der Linden 2025-01-29  311  		list_for_each(mp, ranges) {
6d96239d471a12 Frank van der Linden 2025-01-29  312  			mlp = list_entry(mp, struct cma_init_memrange, list);
6d96239d471a12 Frank van der Linden 2025-01-29  313  			if (cmp(mlp, mrp))
6d96239d471a12 Frank van der Linden 2025-01-29  314  				break;
6d96239d471a12 Frank van der Linden 2025-01-29  315  		}
6d96239d471a12 Frank van der Linden 2025-01-29 @316  		__list_add(&mrp->list, mlp->list.prev, &mlp->list);
6d96239d471a12 Frank van der Linden 2025-01-29  317  	}
6d96239d471a12 Frank van der Linden 2025-01-29  318  }
6d96239d471a12 Frank van der Linden 2025-01-29  319  
6d96239d471a12 Frank van der Linden 2025-01-29  320  /*
6d96239d471a12 Frank van der Linden 2025-01-29  321   * Create CMA areas with a total size of @total_size. A normal allocation
6d96239d471a12 Frank van der Linden 2025-01-29  322   * for one area is tried first. If that fails, the biggest memblock
6d96239d471a12 Frank van der Linden 2025-01-29  323   * ranges above 4G are selected, and allocated bottom up.
6d96239d471a12 Frank van der Linden 2025-01-29  324   *
6d96239d471a12 Frank van der Linden 2025-01-29  325   * The complexity here is not great, but this function will only be
6d96239d471a12 Frank van der Linden 2025-01-29  326   * called during boot, and the lists operated on have fewer than
6d96239d471a12 Frank van der Linden 2025-01-29  327   * CMA_MAX_RANGES elements (default value: 8).
6d96239d471a12 Frank van der Linden 2025-01-29  328   */
6d96239d471a12 Frank van der Linden 2025-01-29  329  int __init cma_declare_contiguous_multi(phys_addr_t total_size,
6d96239d471a12 Frank van der Linden 2025-01-29  330  			phys_addr_t align, unsigned int order_per_bit,
6d96239d471a12 Frank van der Linden 2025-01-29  331  			const char *name, struct cma **res_cma, int nid)
6d96239d471a12 Frank van der Linden 2025-01-29  332  {
6d96239d471a12 Frank van der Linden 2025-01-29  333  	phys_addr_t start, end;
6d96239d471a12 Frank van der Linden 2025-01-29  334  	phys_addr_t size, sizesum, sizeleft;
6d96239d471a12 Frank van der Linden 2025-01-29  335  	struct cma_init_memrange *mrp, *mlp, *failed;
6d96239d471a12 Frank van der Linden 2025-01-29  336  	struct cma_memrange *cmrp;
6d96239d471a12 Frank van der Linden 2025-01-29  337  	LIST_HEAD(ranges);
6d96239d471a12 Frank van der Linden 2025-01-29  338  	LIST_HEAD(final_ranges);
6d96239d471a12 Frank van der Linden 2025-01-29  339  	struct list_head *mp, *next;
6d96239d471a12 Frank van der Linden 2025-01-29  340  	int ret, nr = 1;
6d96239d471a12 Frank van der Linden 2025-01-29  341  	u64 i;
6d96239d471a12 Frank van der Linden 2025-01-29  342  	struct cma *cma;
6d96239d471a12 Frank van der Linden 2025-01-29  343  
6d96239d471a12 Frank van der Linden 2025-01-29  344  	/*
6d96239d471a12 Frank van der Linden 2025-01-29  345  	 * First, try it the normal way, producing just one range.
6d96239d471a12 Frank van der Linden 2025-01-29  346  	 */
6d96239d471a12 Frank van der Linden 2025-01-29  347  	ret = __cma_declare_contiguous_nid(0, total_size, 0, align,
6d96239d471a12 Frank van der Linden 2025-01-29  348  			order_per_bit, false, name, res_cma, nid);
6d96239d471a12 Frank van der Linden 2025-01-29  349  	if (ret != -ENOMEM)
6d96239d471a12 Frank van der Linden 2025-01-29  350  		goto out;
6d96239d471a12 Frank van der Linden 2025-01-29  351  
6d96239d471a12 Frank van der Linden 2025-01-29  352  	/*
6d96239d471a12 Frank van der Linden 2025-01-29  353  	 * Couldn't find one range that fits our needs, so try multiple
6d96239d471a12 Frank van der Linden 2025-01-29  354  	 * ranges.
6d96239d471a12 Frank van der Linden 2025-01-29  355  	 *
6d96239d471a12 Frank van der Linden 2025-01-29  356  	 * No need to do the alignment checks here, the call to
6d96239d471a12 Frank van der Linden 2025-01-29  357  	 * cma_declare_contiguous_nid above would have caught
6d96239d471a12 Frank van der Linden 2025-01-29  358  	 * any issues. With the checks, we know that:
6d96239d471a12 Frank van der Linden 2025-01-29  359  	 *
6d96239d471a12 Frank van der Linden 2025-01-29  360  	 * - @align is a power of 2
6d96239d471a12 Frank van der Linden 2025-01-29  361  	 * - @align is >= pageblock alignment
6d96239d471a12 Frank van der Linden 2025-01-29  362  	 * - @size is aligned to @align and to @order_per_bit
6d96239d471a12 Frank van der Linden 2025-01-29  363  	 *
6d96239d471a12 Frank van der Linden 2025-01-29  364  	 * So, as long as we create ranges that have a base
6d96239d471a12 Frank van der Linden 2025-01-29  365  	 * aligned to @align, and a size that is aligned to
6d96239d471a12 Frank van der Linden 2025-01-29  366  	 * both @align and @order_to_bit, things will work out.
6d96239d471a12 Frank van der Linden 2025-01-29  367  	 */
6d96239d471a12 Frank van der Linden 2025-01-29  368  	nr = 0;
6d96239d471a12 Frank van der Linden 2025-01-29  369  	sizesum = 0;
6d96239d471a12 Frank van der Linden 2025-01-29  370  	failed = NULL;
6d96239d471a12 Frank van der Linden 2025-01-29  371  
6d96239d471a12 Frank van der Linden 2025-01-29  372  	ret = cma_new_area(name, total_size, order_per_bit, &cma);
6d96239d471a12 Frank van der Linden 2025-01-29  373  	if (ret != 0)
6d96239d471a12 Frank van der Linden 2025-01-29  374  		goto out;
6d96239d471a12 Frank van der Linden 2025-01-29  375  
6d96239d471a12 Frank van der Linden 2025-01-29  376  	align = max_t(phys_addr_t, align, CMA_MIN_ALIGNMENT_BYTES);
6d96239d471a12 Frank van der Linden 2025-01-29  377  	/*
6d96239d471a12 Frank van der Linden 2025-01-29  378  	 * Create a list of ranges above 4G, largest range first.
6d96239d471a12 Frank van der Linden 2025-01-29  379  	 */
6d96239d471a12 Frank van der Linden 2025-01-29 @380  	for_each_free_mem_range(i, nid, MEMBLOCK_NONE, &start, &end, NULL) {
6d96239d471a12 Frank van der Linden 2025-01-29  381  		if (start < SZ_4G)
6d96239d471a12 Frank van der Linden 2025-01-29  382  			continue;
6d96239d471a12 Frank van der Linden 2025-01-29  383  
6d96239d471a12 Frank van der Linden 2025-01-29  384  		start = ALIGN(start, align);
6d96239d471a12 Frank van der Linden 2025-01-29  385  		if (start >= end)
6d96239d471a12 Frank van der Linden 2025-01-29  386  			continue;
6d96239d471a12 Frank van der Linden 2025-01-29  387  
6d96239d471a12 Frank van der Linden 2025-01-29  388  		end = ALIGN_DOWN(end, align);
6d96239d471a12 Frank van der Linden 2025-01-29  389  		if (end <= start)
6d96239d471a12 Frank van der Linden 2025-01-29  390  			continue;
6d96239d471a12 Frank van der Linden 2025-01-29  391  
6d96239d471a12 Frank van der Linden 2025-01-29  392  		size = end - start;
6d96239d471a12 Frank van der Linden 2025-01-29  393  		size = ALIGN_DOWN(size, (PAGE_SIZE << order_per_bit));
6d96239d471a12 Frank van der Linden 2025-01-29  394  		if (!size)
6d96239d471a12 Frank van der Linden 2025-01-29  395  			continue;
6d96239d471a12 Frank van der Linden 2025-01-29  396  		sizesum += size;
6d96239d471a12 Frank van der Linden 2025-01-29  397  
6d96239d471a12 Frank van der Linden 2025-01-29  398  		pr_debug("consider %016llx - %016llx\n", (u64)start, (u64)end);
6d96239d471a12 Frank van der Linden 2025-01-29  399  
6d96239d471a12 Frank van der Linden 2025-01-29  400  		/*
6d96239d471a12 Frank van der Linden 2025-01-29  401  		 * If we don't yet have used the maximum number of
6d96239d471a12 Frank van der Linden 2025-01-29  402  		 * areas, grab a new one.
6d96239d471a12 Frank van der Linden 2025-01-29  403  		 *
6d96239d471a12 Frank van der Linden 2025-01-29  404  		 * If we can't use anymore, see if this range is not
6d96239d471a12 Frank van der Linden 2025-01-29  405  		 * smaller than the smallest one already recorded. If
6d96239d471a12 Frank van der Linden 2025-01-29  406  		 * not, re-use the smallest element.
6d96239d471a12 Frank van der Linden 2025-01-29  407  		 */
6d96239d471a12 Frank van der Linden 2025-01-29  408  		if (nr < CMA_MAX_RANGES)
6d96239d471a12 Frank van der Linden 2025-01-29  409  			mrp = &memranges[nr++];
6d96239d471a12 Frank van der Linden 2025-01-29  410  		else {
6d96239d471a12 Frank van der Linden 2025-01-29  411  			mrp = list_last_entry(&ranges,
6d96239d471a12 Frank van der Linden 2025-01-29  412  					      struct cma_init_memrange, list);
6d96239d471a12 Frank van der Linden 2025-01-29  413  			if (size < mrp->size)
6d96239d471a12 Frank van der Linden 2025-01-29  414  				continue;
6d96239d471a12 Frank van der Linden 2025-01-29  415  			list_del(&mrp->list);
6d96239d471a12 Frank van der Linden 2025-01-29  416  			sizesum -= mrp->size;
6d96239d471a12 Frank van der Linden 2025-01-29  417  			pr_debug("deleted %016llx - %016llx from the list\n",
6d96239d471a12 Frank van der Linden 2025-01-29  418  				(u64)mrp->base, (u64)mrp->base + size);
6d96239d471a12 Frank van der Linden 2025-01-29  419  		}
6d96239d471a12 Frank van der Linden 2025-01-29  420  		mrp->base = start;
6d96239d471a12 Frank van der Linden 2025-01-29  421  		mrp->size = size;
6d96239d471a12 Frank van der Linden 2025-01-29  422  
6d96239d471a12 Frank van der Linden 2025-01-29  423  		/*
6d96239d471a12 Frank van der Linden 2025-01-29  424  		 * Now do a sorted insert.
6d96239d471a12 Frank van der Linden 2025-01-29  425  		 */
6d96239d471a12 Frank van der Linden 2025-01-29  426  		list_insert_sorted(&ranges, mrp, revsizecmp);
6d96239d471a12 Frank van der Linden 2025-01-29  427  		pr_debug("added %016llx - %016llx to the list\n",
6d96239d471a12 Frank van der Linden 2025-01-29  428  		    (u64)mrp->base, (u64)mrp->base + size);
6d96239d471a12 Frank van der Linden 2025-01-29  429  		pr_debug("total size now %llu\n", (u64)sizesum);
6d96239d471a12 Frank van der Linden 2025-01-29  430  	}
6d96239d471a12 Frank van der Linden 2025-01-29  431  
6d96239d471a12 Frank van der Linden 2025-01-29  432  	/*
6d96239d471a12 Frank van der Linden 2025-01-29  433  	 * There is not enough room in the CMA_MAX_RANGES largest
6d96239d471a12 Frank van der Linden 2025-01-29  434  	 * ranges, so bail out.
6d96239d471a12 Frank van der Linden 2025-01-29  435  	 */
6d96239d471a12 Frank van der Linden 2025-01-29  436  	if (sizesum < total_size) {
6d96239d471a12 Frank van der Linden 2025-01-29  437  		cma_drop_area(cma);
6d96239d471a12 Frank van der Linden 2025-01-29  438  		ret = -ENOMEM;
6d96239d471a12 Frank van der Linden 2025-01-29  439  		goto out;
6d96239d471a12 Frank van der Linden 2025-01-29  440  	}
6d96239d471a12 Frank van der Linden 2025-01-29  441  
6d96239d471a12 Frank van der Linden 2025-01-29  442  	/*
6d96239d471a12 Frank van der Linden 2025-01-29  443  	 * Found ranges that provide enough combined space.
6d96239d471a12 Frank van der Linden 2025-01-29  444  	 * Now, sorted them by address, smallest first, because we
6d96239d471a12 Frank van der Linden 2025-01-29  445  	 * want to mimic a bottom-up memblock allocation.
6d96239d471a12 Frank van der Linden 2025-01-29  446  	 */
6d96239d471a12 Frank van der Linden 2025-01-29  447  	sizesum = 0;
6d96239d471a12 Frank van der Linden 2025-01-29  448  	list_for_each_safe(mp, next, &ranges) {
6d96239d471a12 Frank van der Linden 2025-01-29  449  		mlp = list_entry(mp, struct cma_init_memrange, list);
6d96239d471a12 Frank van der Linden 2025-01-29  450  		list_del(mp);
6d96239d471a12 Frank van der Linden 2025-01-29  451  		list_insert_sorted(&final_ranges, mlp, basecmp);
6d96239d471a12 Frank van der Linden 2025-01-29  452  		sizesum += mlp->size;
6d96239d471a12 Frank van der Linden 2025-01-29  453  		if (sizesum >= total_size)
6d96239d471a12 Frank van der Linden 2025-01-29  454  			break;
6d96239d471a12 Frank van der Linden 2025-01-29  455  	}
6d96239d471a12 Frank van der Linden 2025-01-29  456  
6d96239d471a12 Frank van der Linden 2025-01-29  457  	/*
6d96239d471a12 Frank van der Linden 2025-01-29  458  	 * Walk the final list, and add a CMA range for
6d96239d471a12 Frank van der Linden 2025-01-29  459  	 * each range, possibly not using the last one fully.
6d96239d471a12 Frank van der Linden 2025-01-29  460  	 */
6d96239d471a12 Frank van der Linden 2025-01-29  461  	nr = 0;
6d96239d471a12 Frank van der Linden 2025-01-29  462  	sizeleft = total_size;
6d96239d471a12 Frank van der Linden 2025-01-29  463  	list_for_each(mp, &final_ranges) {
6d96239d471a12 Frank van der Linden 2025-01-29  464  		mlp = list_entry(mp, struct cma_init_memrange, list);
6d96239d471a12 Frank van der Linden 2025-01-29  465  		size = min(sizeleft, mlp->size);
6d96239d471a12 Frank van der Linden 2025-01-29  466  		if (memblock_reserve(mlp->base, size)) {
6d96239d471a12 Frank van der Linden 2025-01-29  467  			/*
6d96239d471a12 Frank van der Linden 2025-01-29  468  			 * Unexpected error. Could go on to
6d96239d471a12 Frank van der Linden 2025-01-29  469  			 * the next one, but just abort to
6d96239d471a12 Frank van der Linden 2025-01-29  470  			 * be safe.
6d96239d471a12 Frank van der Linden 2025-01-29  471  			 */
6d96239d471a12 Frank van der Linden 2025-01-29  472  			failed = mlp;
6d96239d471a12 Frank van der Linden 2025-01-29  473  			break;
6d96239d471a12 Frank van der Linden 2025-01-29  474  		}
6d96239d471a12 Frank van der Linden 2025-01-29  475  
6d96239d471a12 Frank van der Linden 2025-01-29  476  		pr_debug("created region %d: %016llx - %016llx\n",
6d96239d471a12 Frank van der Linden 2025-01-29  477  		    nr, (u64)mlp->base, (u64)mlp->base + size);
6d96239d471a12 Frank van der Linden 2025-01-29  478  		cmrp = &cma->ranges[nr++];
6d96239d471a12 Frank van der Linden 2025-01-29  479  		cmrp->base_pfn = PHYS_PFN(mlp->base);
6d96239d471a12 Frank van der Linden 2025-01-29  480  		cmrp->count = size >> PAGE_SHIFT;
6d96239d471a12 Frank van der Linden 2025-01-29  481  
6d96239d471a12 Frank van der Linden 2025-01-29  482  		sizeleft -= size;
6d96239d471a12 Frank van der Linden 2025-01-29  483  		if (sizeleft == 0)
6d96239d471a12 Frank van der Linden 2025-01-29  484  			break;
6d96239d471a12 Frank van der Linden 2025-01-29  485  	}
6d96239d471a12 Frank van der Linden 2025-01-29  486  
6d96239d471a12 Frank van der Linden 2025-01-29  487  	if (failed) {
6d96239d471a12 Frank van der Linden 2025-01-29  488  		list_for_each(mp, &final_ranges) {
6d96239d471a12 Frank van der Linden 2025-01-29  489  			mlp = list_entry(mp, struct cma_init_memrange, list);
6d96239d471a12 Frank van der Linden 2025-01-29  490  			if (mlp == failed)
6d96239d471a12 Frank van der Linden 2025-01-29  491  				break;
6d96239d471a12 Frank van der Linden 2025-01-29  492  			memblock_phys_free(mlp->base, mlp->size);
6d96239d471a12 Frank van der Linden 2025-01-29  493  		}
6d96239d471a12 Frank van der Linden 2025-01-29  494  		cma_drop_area(cma);
6d96239d471a12 Frank van der Linden 2025-01-29  495  		ret = -ENOMEM;
6d96239d471a12 Frank van der Linden 2025-01-29  496  		goto out;
6d96239d471a12 Frank van der Linden 2025-01-29  497  	}
6d96239d471a12 Frank van der Linden 2025-01-29  498  
6d96239d471a12 Frank van der Linden 2025-01-29  499  	cma->nranges = nr;
de9e14eebf33a6 Marek Szyprowski     2014-10-13  500  	*res_cma = cma;
de9e14eebf33a6 Marek Szyprowski     2014-10-13  501  
6d96239d471a12 Frank van der Linden 2025-01-29  502  out:
6d96239d471a12 Frank van der Linden 2025-01-29  503  	if (ret != 0)
6d96239d471a12 Frank van der Linden 2025-01-29  504  		pr_err("Failed to reserve %lu MiB\n",
6d96239d471a12 Frank van der Linden 2025-01-29  505  			(unsigned long)total_size / SZ_1M);
6d96239d471a12 Frank van der Linden 2025-01-29  506  	else
6d96239d471a12 Frank van der Linden 2025-01-29  507  		pr_info("Reserved %lu MiB in %d range%s\n",
6d96239d471a12 Frank van der Linden 2025-01-29  508  			(unsigned long)total_size / SZ_1M, nr,
6d96239d471a12 Frank van der Linden 2025-01-29  509  			nr > 1 ? "s" : "");
6d96239d471a12 Frank van der Linden 2025-01-29  510  
6d96239d471a12 Frank van der Linden 2025-01-29  511  	return ret;
de9e14eebf33a6 Marek Szyprowski     2014-10-13  512  }
de9e14eebf33a6 Marek Szyprowski     2014-10-13  513  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
