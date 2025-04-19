Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E46288CC
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Apr 2025 11:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745062107; cv=none; b=lRc97zokq3ZFIJObKRMLPGet/W345XcmMKvSK/pbs7zRkjwoXWh1VUGmESz1ldJReIMuK/yR6zaUtwzRRO7NcnHzhbCIRFWcWns0PDUvcuOtFxik8N5QjQF7aG0QzU+kCtb5DKLSOHAyRJdIh8tGh9W0BwM88rSh+es9dcvhOVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745062107; c=relaxed/simple;
	bh=URTQyEb/0Z6aXHMWEMcgPdrVW3VZriZS7+klCJeEkvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QsgjEtLmccPFH91GzTwr/a0VrCJR9yNg66pZ9bqaZrUEPQTgXHaFK/9VrpngquwWjWGQqID5cMPbuZnfGIkXXC72Pg43GKhsYSjwxdTHa0J46Xpfqcfs9YiajzJg9EZfMlFQM0hC0EHPY7Wnx02dXMfy/zbK3TioBCND1g+sUw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifv/f/Qy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifv/f/Qy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745062105; x=1776598105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=URTQyEb/0Z6aXHMWEMcgPdrVW3VZriZS7+klCJeEkvA=;
  b=ifv/f/QynR0L1fLXmXH19zwO1HO2+sunS8V/pnX9aBqY0b3pdB3TunvZ
   0vCTAvs2+3f/WM2sdPkVC6ly/0nIO0f5mjI+csR8G2acV9aEAEZGATmud
   EiCs1vmxRyAA+qJtWV/jAEtAvk8rTH/AHE2DeJrRv5B7CXX2L9SxjNHrK
   t7CYQKCuhiunoJynKLoDLMw1FYNRkgXaAZAi9lz1Yed/+aDEw1djVIBFt
   3Ej8G1eBb1w1nxOncrQKQmtphBpqlH4dhfyli4MUk8VX6/Z9rtHZ8wlu2
   dysD2ghhFfTIRZ36XCuBl2da9stHqZhe9QJopWz9jQKh9zm7qcNdFSB1D
   w==;
X-CSE-ConnectionGUID: PcQAzhjtTxuQJBVkM3XDeA==
X-CSE-MsgGUID: JSiD8inZRaiEfmuNtbjtbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46799823"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="46799823"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 04:28:24 -0700
X-CSE-ConnectionGUID: PWFgoIyRQx+1RivEBaAT/w==
X-CSE-MsgGUID: yk5Qwv7fQpOdh3cG72xLmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="162272989"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Apr 2025 04:28:21 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u66Mu-0003ov-0s;
	Sat, 19 Apr 2025 11:28:20 +0000
Date: Sat, 19 Apr 2025 19:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/cma.c:509:3-5: opportunity for str_plural(nr)
Message-ID: <202504191949.RsRida7L-lkp@intel.com>
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
TO: Frank van der Linden <fvdl@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8560697b23dc2f405cb463af2b17256a9888129d
commit: c009da4258f9885c5a3749fc004870db9c0e7a99 mm, cma: support multiple contiguous ranges, if requested
date:   5 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 weeks ago
config: hexagon-randconfig-r064-20250419 (https://download.01.org/0day-ci/archive/20250419/202504191949.RsRida7L-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504191949.RsRida7L-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/cma.c:509:3-5: opportunity for str_plural(nr)

vim +509 mm/cma.c

c009da4258f9885 Frank van der Linden 2025-02-28  319  
c009da4258f9885 Frank van der Linden 2025-02-28  320  /*
c009da4258f9885 Frank van der Linden 2025-02-28  321   * Create CMA areas with a total size of @total_size. A normal allocation
c009da4258f9885 Frank van der Linden 2025-02-28  322   * for one area is tried first. If that fails, the biggest memblock
c009da4258f9885 Frank van der Linden 2025-02-28  323   * ranges above 4G are selected, and allocated bottom up.
c009da4258f9885 Frank van der Linden 2025-02-28  324   *
c009da4258f9885 Frank van der Linden 2025-02-28  325   * The complexity here is not great, but this function will only be
c009da4258f9885 Frank van der Linden 2025-02-28  326   * called during boot, and the lists operated on have fewer than
c009da4258f9885 Frank van der Linden 2025-02-28  327   * CMA_MAX_RANGES elements (default value: 8).
c009da4258f9885 Frank van der Linden 2025-02-28  328   */
c009da4258f9885 Frank van der Linden 2025-02-28  329  int __init cma_declare_contiguous_multi(phys_addr_t total_size,
c009da4258f9885 Frank van der Linden 2025-02-28  330  			phys_addr_t align, unsigned int order_per_bit,
c009da4258f9885 Frank van der Linden 2025-02-28  331  			const char *name, struct cma **res_cma, int nid)
c009da4258f9885 Frank van der Linden 2025-02-28  332  {
c009da4258f9885 Frank van der Linden 2025-02-28  333  	phys_addr_t start, end;
c009da4258f9885 Frank van der Linden 2025-02-28  334  	phys_addr_t size, sizesum, sizeleft;
c009da4258f9885 Frank van der Linden 2025-02-28  335  	struct cma_init_memrange *mrp, *mlp, *failed;
c009da4258f9885 Frank van der Linden 2025-02-28  336  	struct cma_memrange *cmrp;
c009da4258f9885 Frank van der Linden 2025-02-28  337  	LIST_HEAD(ranges);
c009da4258f9885 Frank van der Linden 2025-02-28  338  	LIST_HEAD(final_ranges);
c009da4258f9885 Frank van der Linden 2025-02-28  339  	struct list_head *mp, *next;
c009da4258f9885 Frank van der Linden 2025-02-28  340  	int ret, nr = 1;
c009da4258f9885 Frank van der Linden 2025-02-28  341  	u64 i;
c009da4258f9885 Frank van der Linden 2025-02-28  342  	struct cma *cma;
c009da4258f9885 Frank van der Linden 2025-02-28  343  
c009da4258f9885 Frank van der Linden 2025-02-28  344  	/*
c009da4258f9885 Frank van der Linden 2025-02-28  345  	 * First, try it the normal way, producing just one range.
c009da4258f9885 Frank van der Linden 2025-02-28  346  	 */
c009da4258f9885 Frank van der Linden 2025-02-28  347  	ret = __cma_declare_contiguous_nid(0, total_size, 0, align,
c009da4258f9885 Frank van der Linden 2025-02-28  348  			order_per_bit, false, name, res_cma, nid);
c009da4258f9885 Frank van der Linden 2025-02-28  349  	if (ret != -ENOMEM)
c009da4258f9885 Frank van der Linden 2025-02-28  350  		goto out;
c009da4258f9885 Frank van der Linden 2025-02-28  351  
c009da4258f9885 Frank van der Linden 2025-02-28  352  	/*
c009da4258f9885 Frank van der Linden 2025-02-28  353  	 * Couldn't find one range that fits our needs, so try multiple
c009da4258f9885 Frank van der Linden 2025-02-28  354  	 * ranges.
c009da4258f9885 Frank van der Linden 2025-02-28  355  	 *
c009da4258f9885 Frank van der Linden 2025-02-28  356  	 * No need to do the alignment checks here, the call to
c009da4258f9885 Frank van der Linden 2025-02-28  357  	 * cma_declare_contiguous_nid above would have caught
c009da4258f9885 Frank van der Linden 2025-02-28  358  	 * any issues. With the checks, we know that:
c009da4258f9885 Frank van der Linden 2025-02-28  359  	 *
c009da4258f9885 Frank van der Linden 2025-02-28  360  	 * - @align is a power of 2
c009da4258f9885 Frank van der Linden 2025-02-28  361  	 * - @align is >= pageblock alignment
c009da4258f9885 Frank van der Linden 2025-02-28  362  	 * - @size is aligned to @align and to @order_per_bit
c009da4258f9885 Frank van der Linden 2025-02-28  363  	 *
c009da4258f9885 Frank van der Linden 2025-02-28  364  	 * So, as long as we create ranges that have a base
c009da4258f9885 Frank van der Linden 2025-02-28  365  	 * aligned to @align, and a size that is aligned to
c009da4258f9885 Frank van der Linden 2025-02-28  366  	 * both @align and @order_to_bit, things will work out.
c009da4258f9885 Frank van der Linden 2025-02-28  367  	 */
c009da4258f9885 Frank van der Linden 2025-02-28  368  	nr = 0;
c009da4258f9885 Frank van der Linden 2025-02-28  369  	sizesum = 0;
c009da4258f9885 Frank van der Linden 2025-02-28  370  	failed = NULL;
c009da4258f9885 Frank van der Linden 2025-02-28  371  
c009da4258f9885 Frank van der Linden 2025-02-28  372  	ret = cma_new_area(name, total_size, order_per_bit, &cma);
c009da4258f9885 Frank van der Linden 2025-02-28  373  	if (ret != 0)
c009da4258f9885 Frank van der Linden 2025-02-28  374  		goto out;
c009da4258f9885 Frank van der Linden 2025-02-28  375  
c009da4258f9885 Frank van der Linden 2025-02-28  376  	align = max_t(phys_addr_t, align, CMA_MIN_ALIGNMENT_BYTES);
c009da4258f9885 Frank van der Linden 2025-02-28  377  	/*
c009da4258f9885 Frank van der Linden 2025-02-28  378  	 * Create a list of ranges above 4G, largest range first.
c009da4258f9885 Frank van der Linden 2025-02-28  379  	 */
c009da4258f9885 Frank van der Linden 2025-02-28  380  	for_each_free_mem_range(i, nid, MEMBLOCK_NONE, &start, &end, NULL) {
c009da4258f9885 Frank van der Linden 2025-02-28  381  		if (upper_32_bits(start) == 0)
c009da4258f9885 Frank van der Linden 2025-02-28  382  			continue;
c009da4258f9885 Frank van der Linden 2025-02-28  383  
c009da4258f9885 Frank van der Linden 2025-02-28  384  		start = ALIGN(start, align);
c009da4258f9885 Frank van der Linden 2025-02-28  385  		if (start >= end)
c009da4258f9885 Frank van der Linden 2025-02-28  386  			continue;
c009da4258f9885 Frank van der Linden 2025-02-28  387  
c009da4258f9885 Frank van der Linden 2025-02-28  388  		end = ALIGN_DOWN(end, align);
c009da4258f9885 Frank van der Linden 2025-02-28  389  		if (end <= start)
c009da4258f9885 Frank van der Linden 2025-02-28  390  			continue;
c009da4258f9885 Frank van der Linden 2025-02-28  391  
c009da4258f9885 Frank van der Linden 2025-02-28  392  		size = end - start;
c009da4258f9885 Frank van der Linden 2025-02-28  393  		size = ALIGN_DOWN(size, (PAGE_SIZE << order_per_bit));
c009da4258f9885 Frank van der Linden 2025-02-28  394  		if (!size)
c009da4258f9885 Frank van der Linden 2025-02-28  395  			continue;
c009da4258f9885 Frank van der Linden 2025-02-28  396  		sizesum += size;
c009da4258f9885 Frank van der Linden 2025-02-28  397  
c009da4258f9885 Frank van der Linden 2025-02-28  398  		pr_debug("consider %016llx - %016llx\n", (u64)start, (u64)end);
c009da4258f9885 Frank van der Linden 2025-02-28  399  
c009da4258f9885 Frank van der Linden 2025-02-28  400  		/*
c009da4258f9885 Frank van der Linden 2025-02-28  401  		 * If we don't yet have used the maximum number of
c009da4258f9885 Frank van der Linden 2025-02-28  402  		 * areas, grab a new one.
c009da4258f9885 Frank van der Linden 2025-02-28  403  		 *
c009da4258f9885 Frank van der Linden 2025-02-28  404  		 * If we can't use anymore, see if this range is not
c009da4258f9885 Frank van der Linden 2025-02-28  405  		 * smaller than the smallest one already recorded. If
c009da4258f9885 Frank van der Linden 2025-02-28  406  		 * not, re-use the smallest element.
c009da4258f9885 Frank van der Linden 2025-02-28  407  		 */
c009da4258f9885 Frank van der Linden 2025-02-28  408  		if (nr < CMA_MAX_RANGES)
c009da4258f9885 Frank van der Linden 2025-02-28  409  			mrp = &memranges[nr++];
c009da4258f9885 Frank van der Linden 2025-02-28  410  		else {
c009da4258f9885 Frank van der Linden 2025-02-28  411  			mrp = list_last_entry(&ranges,
c009da4258f9885 Frank van der Linden 2025-02-28  412  					      struct cma_init_memrange, list);
c009da4258f9885 Frank van der Linden 2025-02-28  413  			if (size < mrp->size)
c009da4258f9885 Frank van der Linden 2025-02-28  414  				continue;
c009da4258f9885 Frank van der Linden 2025-02-28  415  			list_del(&mrp->list);
c009da4258f9885 Frank van der Linden 2025-02-28  416  			sizesum -= mrp->size;
c009da4258f9885 Frank van der Linden 2025-02-28  417  			pr_debug("deleted %016llx - %016llx from the list\n",
c009da4258f9885 Frank van der Linden 2025-02-28  418  				(u64)mrp->base, (u64)mrp->base + size);
c009da4258f9885 Frank van der Linden 2025-02-28  419  		}
c009da4258f9885 Frank van der Linden 2025-02-28  420  		mrp->base = start;
c009da4258f9885 Frank van der Linden 2025-02-28  421  		mrp->size = size;
c009da4258f9885 Frank van der Linden 2025-02-28  422  
c009da4258f9885 Frank van der Linden 2025-02-28  423  		/*
c009da4258f9885 Frank van der Linden 2025-02-28  424  		 * Now do a sorted insert.
c009da4258f9885 Frank van der Linden 2025-02-28  425  		 */
c009da4258f9885 Frank van der Linden 2025-02-28  426  		list_insert_sorted(&ranges, mrp, revsizecmp);
c009da4258f9885 Frank van der Linden 2025-02-28  427  		pr_debug("added %016llx - %016llx to the list\n",
c009da4258f9885 Frank van der Linden 2025-02-28  428  		    (u64)mrp->base, (u64)mrp->base + size);
c009da4258f9885 Frank van der Linden 2025-02-28  429  		pr_debug("total size now %llu\n", (u64)sizesum);
c009da4258f9885 Frank van der Linden 2025-02-28  430  	}
c009da4258f9885 Frank van der Linden 2025-02-28  431  
c009da4258f9885 Frank van der Linden 2025-02-28  432  	/*
c009da4258f9885 Frank van der Linden 2025-02-28  433  	 * There is not enough room in the CMA_MAX_RANGES largest
c009da4258f9885 Frank van der Linden 2025-02-28  434  	 * ranges, so bail out.
c009da4258f9885 Frank van der Linden 2025-02-28  435  	 */
c009da4258f9885 Frank van der Linden 2025-02-28  436  	if (sizesum < total_size) {
c009da4258f9885 Frank van der Linden 2025-02-28  437  		cma_drop_area(cma);
c009da4258f9885 Frank van der Linden 2025-02-28  438  		ret = -ENOMEM;
c009da4258f9885 Frank van der Linden 2025-02-28  439  		goto out;
c009da4258f9885 Frank van der Linden 2025-02-28  440  	}
c009da4258f9885 Frank van der Linden 2025-02-28  441  
c009da4258f9885 Frank van der Linden 2025-02-28  442  	/*
c009da4258f9885 Frank van der Linden 2025-02-28  443  	 * Found ranges that provide enough combined space.
c009da4258f9885 Frank van der Linden 2025-02-28  444  	 * Now, sorted them by address, smallest first, because we
c009da4258f9885 Frank van der Linden 2025-02-28  445  	 * want to mimic a bottom-up memblock allocation.
c009da4258f9885 Frank van der Linden 2025-02-28  446  	 */
c009da4258f9885 Frank van der Linden 2025-02-28  447  	sizesum = 0;
c009da4258f9885 Frank van der Linden 2025-02-28  448  	list_for_each_safe(mp, next, &ranges) {
c009da4258f9885 Frank van der Linden 2025-02-28  449  		mlp = list_entry(mp, struct cma_init_memrange, list);
c009da4258f9885 Frank van der Linden 2025-02-28  450  		list_del(mp);
c009da4258f9885 Frank van der Linden 2025-02-28  451  		list_insert_sorted(&final_ranges, mlp, basecmp);
c009da4258f9885 Frank van der Linden 2025-02-28  452  		sizesum += mlp->size;
c009da4258f9885 Frank van der Linden 2025-02-28  453  		if (sizesum >= total_size)
c009da4258f9885 Frank van der Linden 2025-02-28  454  			break;
c009da4258f9885 Frank van der Linden 2025-02-28  455  	}
c009da4258f9885 Frank van der Linden 2025-02-28  456  
c009da4258f9885 Frank van der Linden 2025-02-28  457  	/*
c009da4258f9885 Frank van der Linden 2025-02-28  458  	 * Walk the final list, and add a CMA range for
c009da4258f9885 Frank van der Linden 2025-02-28  459  	 * each range, possibly not using the last one fully.
c009da4258f9885 Frank van der Linden 2025-02-28  460  	 */
c009da4258f9885 Frank van der Linden 2025-02-28  461  	nr = 0;
c009da4258f9885 Frank van der Linden 2025-02-28  462  	sizeleft = total_size;
c009da4258f9885 Frank van der Linden 2025-02-28  463  	list_for_each(mp, &final_ranges) {
c009da4258f9885 Frank van der Linden 2025-02-28  464  		mlp = list_entry(mp, struct cma_init_memrange, list);
c009da4258f9885 Frank van der Linden 2025-02-28  465  		size = min(sizeleft, mlp->size);
c009da4258f9885 Frank van der Linden 2025-02-28  466  		if (memblock_reserve(mlp->base, size)) {
c009da4258f9885 Frank van der Linden 2025-02-28  467  			/*
c009da4258f9885 Frank van der Linden 2025-02-28  468  			 * Unexpected error. Could go on to
c009da4258f9885 Frank van der Linden 2025-02-28  469  			 * the next one, but just abort to
c009da4258f9885 Frank van der Linden 2025-02-28  470  			 * be safe.
c009da4258f9885 Frank van der Linden 2025-02-28  471  			 */
c009da4258f9885 Frank van der Linden 2025-02-28  472  			failed = mlp;
c009da4258f9885 Frank van der Linden 2025-02-28  473  			break;
c009da4258f9885 Frank van der Linden 2025-02-28  474  		}
c009da4258f9885 Frank van der Linden 2025-02-28  475  
c009da4258f9885 Frank van der Linden 2025-02-28  476  		pr_debug("created region %d: %016llx - %016llx\n",
c009da4258f9885 Frank van der Linden 2025-02-28  477  		    nr, (u64)mlp->base, (u64)mlp->base + size);
c009da4258f9885 Frank van der Linden 2025-02-28  478  		cmrp = &cma->ranges[nr++];
c009da4258f9885 Frank van der Linden 2025-02-28  479  		cmrp->base_pfn = PHYS_PFN(mlp->base);
c009da4258f9885 Frank van der Linden 2025-02-28  480  		cmrp->count = size >> PAGE_SHIFT;
c009da4258f9885 Frank van der Linden 2025-02-28  481  
c009da4258f9885 Frank van der Linden 2025-02-28  482  		sizeleft -= size;
c009da4258f9885 Frank van der Linden 2025-02-28  483  		if (sizeleft == 0)
c009da4258f9885 Frank van der Linden 2025-02-28  484  			break;
c009da4258f9885 Frank van der Linden 2025-02-28  485  	}
c009da4258f9885 Frank van der Linden 2025-02-28  486  
c009da4258f9885 Frank van der Linden 2025-02-28  487  	if (failed) {
c009da4258f9885 Frank van der Linden 2025-02-28  488  		list_for_each(mp, &final_ranges) {
c009da4258f9885 Frank van der Linden 2025-02-28  489  			mlp = list_entry(mp, struct cma_init_memrange, list);
c009da4258f9885 Frank van der Linden 2025-02-28  490  			if (mlp == failed)
c009da4258f9885 Frank van der Linden 2025-02-28  491  				break;
c009da4258f9885 Frank van der Linden 2025-02-28  492  			memblock_phys_free(mlp->base, mlp->size);
c009da4258f9885 Frank van der Linden 2025-02-28  493  		}
c009da4258f9885 Frank van der Linden 2025-02-28  494  		cma_drop_area(cma);
c009da4258f9885 Frank van der Linden 2025-02-28  495  		ret = -ENOMEM;
c009da4258f9885 Frank van der Linden 2025-02-28  496  		goto out;
c009da4258f9885 Frank van der Linden 2025-02-28  497  	}
c009da4258f9885 Frank van der Linden 2025-02-28  498  
c009da4258f9885 Frank van der Linden 2025-02-28  499  	cma->nranges = nr;
de9e14eebf33a60 Marek Szyprowski     2014-10-13  500  	*res_cma = cma;
de9e14eebf33a60 Marek Szyprowski     2014-10-13  501  
c009da4258f9885 Frank van der Linden 2025-02-28  502  out:
c009da4258f9885 Frank van der Linden 2025-02-28  503  	if (ret != 0)
c009da4258f9885 Frank van der Linden 2025-02-28  504  		pr_err("Failed to reserve %lu MiB\n",
c009da4258f9885 Frank van der Linden 2025-02-28  505  			(unsigned long)total_size / SZ_1M);
c009da4258f9885 Frank van der Linden 2025-02-28  506  	else
c009da4258f9885 Frank van der Linden 2025-02-28  507  		pr_info("Reserved %lu MiB in %d range%s\n",
c009da4258f9885 Frank van der Linden 2025-02-28  508  			(unsigned long)total_size / SZ_1M, nr,
c009da4258f9885 Frank van der Linden 2025-02-28 @509  			nr > 1 ? "s" : "");
c009da4258f9885 Frank van der Linden 2025-02-28  510  
c009da4258f9885 Frank van der Linden 2025-02-28  511  	return ret;
de9e14eebf33a60 Marek Szyprowski     2014-10-13  512  }
de9e14eebf33a60 Marek Szyprowski     2014-10-13  513  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
