Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EA870805
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jan 2025 12:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737893071; cv=none; b=RW4mhlOno3/XUsNUMAFzTLubOuOTtMaqHJc33z+yTNdvFzZ6tGBwDQDu7yJuobNwWd3tlJFvjo4PTYthLe3QKLwmWrvs3XpHreUkI07XcPCxvdv90O8PxdXgbDghVQz4y25nfzeHAvEDPJyLXG7UOOisNxdcTtKkMC5LWhx9Q7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737893071; c=relaxed/simple;
	bh=B6nMqMnzgj0W1zfPY8zbaIymW18WG3bk/u7KqEOKUHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfbclvLNY93bA1nz6bWrPl0zdYu1roxlhn3VJQ2pcOEeE5vONy4lnt2YdHKv+HNii8cvXg+2FVbHfJIbBbD4NWsq4EDYuj5Iyk5lD94SxgOQi/ltEbwP2JpmFPseKVfUBSiEpW/aGTtDXyRXJJsb8V6NPHLZrNz10IeLTmBAwzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XeaOGD+S; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XeaOGD+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737893070; x=1769429070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B6nMqMnzgj0W1zfPY8zbaIymW18WG3bk/u7KqEOKUHM=;
  b=XeaOGD+S7b1XgdUwb6QfvqtVwZ4qw1NKxivwEqlloRpA41W2WOnk+kFf
   jBykqnq1gV/bIcZztadxo1qP7UQdHIM6VIvcv+OZ6QPMIWqtYjXh71IPY
   v8ErrPkxxN4DiFk2p+zrmFMMjw+uIhjzDBmQnZ5d/Q0rR9yRcuLefk9Zt
   nK52/b+4p8BqcIkb+//+MR5E7MR2ch4sV+C7WOFY94egp64mbfI4/w08Y
   efa7F5okTTjRyHmUGDgECG8CA2WOD+q3xttS168TeVyMT7+815p1ESleq
   ef8UVrz39H9ugh/Q0c4h6Gtia2kdi1PbyyOHovD8fPGScEg+HK9ARqHq0
   Q==;
X-CSE-ConnectionGUID: DD79Jb88R72F+AhGaeYEFg==
X-CSE-MsgGUID: XSrMjAcLQjOLOgzxXof1QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="48874509"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="48874509"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 04:04:29 -0800
X-CSE-ConnectionGUID: zHH0KZa8Q3m/XDtjg4p/Gw==
X-CSE-MsgGUID: XfvLy+LXSw+g5JFtiim04w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="108079092"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jan 2025 04:04:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tc1NJ-000fKZ-1I;
	Sun, 26 Jan 2025 12:04:25 +0000
Date: Sun, 26 Jan 2025 20:04:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-5.15 2/2] mm/cma.c:548 cma_alloc() error:
 uninitialized symbol 'ts'.
Message-ID: <202501262051.hF7TLvLB-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   49bd830ea5e30f59495e703aae18331882b76760
commit: 1b2de5aa2d0c121cea40aa2f529ca929dc13381b [2/2] ANDROID: mm: cma: add vendor hoook in cma_alloc()
:::::: branch date: 18 hours ago
:::::: commit date: 2 years, 1 month ago
config: i386-randconfig-141-20250126 (https://download.01.org/0day-ci/archive/20250126/202501262051.hF7TLvLB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501262051.hF7TLvLB-lkp@intel.com/

smatch warnings:
mm/cma.c:548 cma_alloc() error: uninitialized symbol 'ts'.

vim +/ts +548 mm/cma.c

dbe43d4d2837da Jaewon Kim        2017-02-24  423  
a254129e8686bf Joonsoo Kim       2014-08-06  424  /**
a254129e8686bf Joonsoo Kim       2014-08-06  425   * cma_alloc() - allocate pages from contiguous area
a254129e8686bf Joonsoo Kim       2014-08-06  426   * @cma:   Contiguous memory region for which the allocation is performed.
a254129e8686bf Joonsoo Kim       2014-08-06  427   * @count: Requested number of pages.
a254129e8686bf Joonsoo Kim       2014-08-06  428   * @align: Requested alignment of pages (in PAGE_SIZE order).
eebff8eab25414 Minchan Kim       2021-01-21  429   * @gfp_mask: GFP mask to use during the cma allocation.
a254129e8686bf Joonsoo Kim       2014-08-06  430   *
a254129e8686bf Joonsoo Kim       2014-08-06  431   * This function allocates part of contiguous memory on specific
a254129e8686bf Joonsoo Kim       2014-08-06  432   * contiguous memory area.
a254129e8686bf Joonsoo Kim       2014-08-06  433   */
78fa51503fdbe4 Minchan Kim       2021-05-04  434  struct page *cma_alloc(struct cma *cma, unsigned long count,
eebff8eab25414 Minchan Kim       2021-01-21  435  		       unsigned int align, gfp_t gfp_mask)
a254129e8686bf Joonsoo Kim       2014-08-06  436  {
3acaea6804b3a1 Andrew Morton     2015-11-05  437  	unsigned long mask, offset;
3acaea6804b3a1 Andrew Morton     2015-11-05  438  	unsigned long pfn = -1;
3acaea6804b3a1 Andrew Morton     2015-11-05  439  	unsigned long start = 0;
a254129e8686bf Joonsoo Kim       2014-08-06  440  	unsigned long bitmap_maxno, bitmap_no, bitmap_count;
78fa51503fdbe4 Minchan Kim       2021-05-04  441  	unsigned long i;
a254129e8686bf Joonsoo Kim       2014-08-06  442  	struct page *page = NULL;
dbe43d4d2837da Jaewon Kim        2017-02-24  443  	int ret = -ENOMEM;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  444  	int num_attempts = 0;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  445  	int max_retries = 5;
1b2de5aa2d0c12 Minchan Kim       2021-04-01  446  	s64 ts;
1b2de5aa2d0c12 Minchan Kim       2021-04-01  447  
1b2de5aa2d0c12 Minchan Kim       2021-04-01  448  	trace_android_vh_cma_alloc_start(&ts);
a254129e8686bf Joonsoo Kim       2014-08-06  449  
835832ba01bb44 Jianqun Xu        2020-08-11  450  	if (!cma || !cma->count || !cma->bitmap)
bbb269206f3c91 Minchan Kim       2021-05-04  451  		goto out;
a254129e8686bf Joonsoo Kim       2014-08-06  452  
eebff8eab25414 Minchan Kim       2021-01-21  453  	pr_debug("%s(cma %p, count %lu, align %d gfp_mask 0x%x)\n", __func__,
eebff8eab25414 Minchan Kim       2021-01-21  454  			(void *)cma, count, align, gfp_mask);
a254129e8686bf Joonsoo Kim       2014-08-06  455  
a254129e8686bf Joonsoo Kim       2014-08-06  456  	if (!count)
bbb269206f3c91 Minchan Kim       2021-05-04  457  		goto out;
a254129e8686bf Joonsoo Kim       2014-08-06  458  
7bc1aec5e28765 Liam Mark         2021-05-04  459  	trace_cma_alloc_start(cma->name, count, align);
a254129e8686bf Joonsoo Kim       2014-08-06  460  
a254129e8686bf Joonsoo Kim       2014-08-06  461  	mask = cma_bitmap_aligned_mask(cma, align);
b5be83e308f70e Gregory Fong      2014-12-12  462  	offset = cma_bitmap_aligned_offset(cma, align);
a254129e8686bf Joonsoo Kim       2014-08-06  463  	bitmap_maxno = cma_bitmap_maxno(cma);
a254129e8686bf Joonsoo Kim       2014-08-06  464  	bitmap_count = cma_bitmap_pages_to_bits(cma, count);
a254129e8686bf Joonsoo Kim       2014-08-06  465  
6b36ba599d602d Shiraz Hashim     2016-11-10  466  	if (bitmap_count > bitmap_maxno)
bbb269206f3c91 Minchan Kim       2021-05-04  467  		goto out;
6b36ba599d602d Shiraz Hashim     2016-11-10  468  
a254129e8686bf Joonsoo Kim       2014-08-06  469  	for (;;) {
0ef7dcac998fef Mike Kravetz      2021-05-04  470  		spin_lock_irq(&cma->lock);
b5be83e308f70e Gregory Fong      2014-12-12  471  		bitmap_no = bitmap_find_next_zero_area_off(cma->bitmap,
b5be83e308f70e Gregory Fong      2014-12-12  472  				bitmap_maxno, start, bitmap_count, mask,
b5be83e308f70e Gregory Fong      2014-12-12  473  				offset);
a254129e8686bf Joonsoo Kim       2014-08-06  474  		if (bitmap_no >= bitmap_maxno) {
73eda8ec747b68 Chris Goldsworthy 2020-09-18  475  			if ((num_attempts < max_retries) && (ret == -EBUSY)) {
0ef7dcac998fef Mike Kravetz      2021-05-04  476  				spin_unlock_irq(&cma->lock);
73eda8ec747b68 Chris Goldsworthy 2020-09-18  477  
73eda8ec747b68 Chris Goldsworthy 2020-09-18  478  				if (fatal_signal_pending(current))
a254129e8686bf Joonsoo Kim       2014-08-06  479  					break;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  480  
73eda8ec747b68 Chris Goldsworthy 2020-09-18  481  				/*
73eda8ec747b68 Chris Goldsworthy 2020-09-18  482  				 * Page may be momentarily pinned by some other
73eda8ec747b68 Chris Goldsworthy 2020-09-18  483  				 * process which has been scheduled out, e.g.
73eda8ec747b68 Chris Goldsworthy 2020-09-18  484  				 * in exit path, during unmap call, or process
73eda8ec747b68 Chris Goldsworthy 2020-09-18  485  				 * fork and so cannot be freed there. Sleep
73eda8ec747b68 Chris Goldsworthy 2020-09-18  486  				 * for 100ms and retry the allocation.
73eda8ec747b68 Chris Goldsworthy 2020-09-18  487  				 */
73eda8ec747b68 Chris Goldsworthy 2020-09-18  488  				start = 0;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  489  				ret = -ENOMEM;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  490  				schedule_timeout_killable(msecs_to_jiffies(100));
73eda8ec747b68 Chris Goldsworthy 2020-09-18  491  				num_attempts++;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  492  				continue;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  493  			} else {
85adc860fdf366 Lee Jones         2021-05-15  494  				spin_unlock_irq(&cma->lock);
73eda8ec747b68 Chris Goldsworthy 2020-09-18  495  				break;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  496  			}
a254129e8686bf Joonsoo Kim       2014-08-06  497  		}
a254129e8686bf Joonsoo Kim       2014-08-06  498  		bitmap_set(cma->bitmap, bitmap_no, bitmap_count);
a254129e8686bf Joonsoo Kim       2014-08-06  499  		/*
a254129e8686bf Joonsoo Kim       2014-08-06  500  		 * It's safe to drop the lock here. We've marked this region for
a254129e8686bf Joonsoo Kim       2014-08-06  501  		 * our exclusive use. If the migration fails we will take the
a254129e8686bf Joonsoo Kim       2014-08-06  502  		 * lock again and unmark it.
a254129e8686bf Joonsoo Kim       2014-08-06  503  		 */
0ef7dcac998fef Mike Kravetz      2021-05-04  504  		spin_unlock_irq(&cma->lock);
a254129e8686bf Joonsoo Kim       2014-08-06  505  
a254129e8686bf Joonsoo Kim       2014-08-06  506  		pfn = cma->base_pfn + (bitmap_no << cma->order_per_bit);
c142bddf370649 Dong Aisheng      2022-05-13  507  		mutex_lock(&cma_mutex);
eebff8eab25414 Minchan Kim       2021-01-21  508  		ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA, gfp_mask);
c142bddf370649 Dong Aisheng      2022-05-13  509  		mutex_unlock(&cma_mutex);
a254129e8686bf Joonsoo Kim       2014-08-06  510  		if (ret == 0) {
a254129e8686bf Joonsoo Kim       2014-08-06  511  			page = pfn_to_page(pfn);
a254129e8686bf Joonsoo Kim       2014-08-06  512  			break;
a254129e8686bf Joonsoo Kim       2014-08-06  513  		}
b7155e76a702d9 Joonsoo Kim       2014-08-06  514  
a254129e8686bf Joonsoo Kim       2014-08-06  515  		cma_clear_bitmap(cma, pfn, count);
b7155e76a702d9 Joonsoo Kim       2014-08-06  516  		if (ret != -EBUSY)
b7155e76a702d9 Joonsoo Kim       2014-08-06  517  			break;
b7155e76a702d9 Joonsoo Kim       2014-08-06  518  
a254129e8686bf Joonsoo Kim       2014-08-06  519  		pr_debug("%s(): memory range at %p is busy, retrying\n",
a254129e8686bf Joonsoo Kim       2014-08-06  520  			 __func__, pfn_to_page(pfn));
7bc1aec5e28765 Liam Mark         2021-05-04  521  
3aab8ae7aace33 Minchan Kim       2021-05-04  522  		trace_cma_alloc_busy_retry(cma->name, pfn, pfn_to_page(pfn),
3aab8ae7aace33 Minchan Kim       2021-05-04  523  					   count, align);
a254129e8686bf Joonsoo Kim       2014-08-06  524  		/* try again with a bit different memory target */
a254129e8686bf Joonsoo Kim       2014-08-06  525  		start = bitmap_no + mask + 1;
a254129e8686bf Joonsoo Kim       2014-08-06  526  	}
a254129e8686bf Joonsoo Kim       2014-08-06  527  
3aab8ae7aace33 Minchan Kim       2021-05-04  528  	trace_cma_alloc_finish(cma->name, pfn, page, count, align);
99e8ea6cd2210c Stefan Strogin    2015-04-15  529  
2813b9c0296259 Andrey Konovalov  2018-12-28  530  	/*
2813b9c0296259 Andrey Konovalov  2018-12-28  531  	 * CMA can allocate multiple page blocks, which results in different
2813b9c0296259 Andrey Konovalov  2018-12-28  532  	 * blocks being marked with different tags. Reset the tags to ignore
2813b9c0296259 Andrey Konovalov  2018-12-28  533  	 * those page blocks.
2813b9c0296259 Andrey Konovalov  2018-12-28  534  	 */
2813b9c0296259 Andrey Konovalov  2018-12-28  535  	if (page) {
2813b9c0296259 Andrey Konovalov  2018-12-28  536  		for (i = 0; i < count; i++)
2813b9c0296259 Andrey Konovalov  2018-12-28  537  			page_kasan_tag_reset(page + i);
2813b9c0296259 Andrey Konovalov  2018-12-28  538  	}
2813b9c0296259 Andrey Konovalov  2018-12-28  539  
eebff8eab25414 Minchan Kim       2021-01-21  540  	if (ret && !(gfp_mask & __GFP_NOWARN)) {
78fa51503fdbe4 Minchan Kim       2021-05-04  541  		pr_err_ratelimited("%s: %s: alloc failed, req-size: %lu pages, ret: %d\n",
a052d4d13d88c2 Patrick Daly      2021-02-25  542  				   __func__, cma->name, count, ret);
dbe43d4d2837da Jaewon Kim        2017-02-24  543  		cma_debug_show_areas(cma);
dbe43d4d2837da Jaewon Kim        2017-02-24  544  	}
dbe43d4d2837da Jaewon Kim        2017-02-24  545  
a254129e8686bf Joonsoo Kim       2014-08-06  546  	pr_debug("%s(): returned %p\n", __func__, page);
bbb269206f3c91 Minchan Kim       2021-05-04  547  out:
1b2de5aa2d0c12 Minchan Kim       2021-04-01 @548  	trace_android_vh_cma_alloc_finish(cma, page, count, align, gfp_mask, ts);
43ca106fa8ec7d Minchan Kim       2021-05-04  549  	if (page) {
bbb269206f3c91 Minchan Kim       2021-05-04  550  		count_vm_event(CMA_ALLOC_SUCCESS);
43ca106fa8ec7d Minchan Kim       2021-05-04  551  		cma_sysfs_account_success_pages(cma, count);
43ca106fa8ec7d Minchan Kim       2021-05-04  552  	} else {
bbb269206f3c91 Minchan Kim       2021-05-04  553  		count_vm_event(CMA_ALLOC_FAIL);
43ca106fa8ec7d Minchan Kim       2021-05-04  554  		if (cma)
43ca106fa8ec7d Minchan Kim       2021-05-04  555  			cma_sysfs_account_fail_pages(cma, count);
43ca106fa8ec7d Minchan Kim       2021-05-04  556  	}
bbb269206f3c91 Minchan Kim       2021-05-04  557  
a254129e8686bf Joonsoo Kim       2014-08-06  558  	return page;
a254129e8686bf Joonsoo Kim       2014-08-06  559  }
716306e82c3cdc Sandeep Patil     2019-09-13  560  EXPORT_SYMBOL_GPL(cma_alloc);
a254129e8686bf Joonsoo Kim       2014-08-06  561  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
