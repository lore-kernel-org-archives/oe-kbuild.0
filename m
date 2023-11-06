Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0375C28E17
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 19:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqjep6zZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699297281; x=1730833281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lkv79JGtzRJFwsM2vbedAEnVhKviCNXogorOTNk3wBY=;
  b=hqjep6zZ7sydBRMIlCE6jj31gJG7KvNld9vZjS+8tJAKfGglp1CGBcXe
   JfOg0YOtFrqIxEbEgnkBWuqlf5FoXRGiDivy4zOoN1/sso9gaQFL6O3Sn
   sehQ5T74I7TlQk+3vnACuvxm4dPQ8lhHzwpU2J400qFPWZiPXbe9QISeq
   okWq+C7wcTQQTDB/mmaLYXAHZSwl0GFvV2an4RSXPNMPTJ9WfMRxmTbBQ
   kL0WDn9WYlWMwYRwLOhs1BcsPoerFLslgXkukAAKLd8Uq9mP50KLgpcfL
   6MlaEbYqkTpd+GKHZWIMk9AcFW0soWEINYBDXKz50KBJ/ooPIsyDMWOhT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="7981186"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="7981186"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 11:01:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="832814539"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="832814539"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Nov 2023 11:01:16 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r04qZ-0006fE-1t;
	Mon, 06 Nov 2023 19:01:15 +0000
Date: Tue, 7 Nov 2023 03:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.10 7046/30000] mm/cma.c:540 cma_alloc()
 error: uninitialized symbol 'ts'.
Message-ID: <202311070225.YMOvpdfY-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   f40707abde2eb5cd21cf8848f33aefb7e394ad1a
commit: c6e85ea56baac84818fd5d82dda064ef80eef2f6 [7046/30000] ANDROID: mm: cma: add vendor hoook in cma_alloc()
:::::: branch date: 3 days ago
:::::: commit date: 2 years, 7 months ago
config: x86_64-randconfig-161-20231106 (https://download.01.org/0day-ci/archive/20231107/202311070225.YMOvpdfY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311070225.YMOvpdfY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311070225.YMOvpdfY-lkp@intel.com/

smatch warnings:
mm/cma.c:540 cma_alloc() error: uninitialized symbol 'ts'.

vim +/ts +540 mm/cma.c

dbe43d4d2837da Jaewon Kim        2017-02-24  422  
a254129e8686bf Joonsoo Kim       2014-08-06  423  /**
a254129e8686bf Joonsoo Kim       2014-08-06  424   * cma_alloc() - allocate pages from contiguous area
a254129e8686bf Joonsoo Kim       2014-08-06  425   * @cma:   Contiguous memory region for which the allocation is performed.
a254129e8686bf Joonsoo Kim       2014-08-06  426   * @count: Requested number of pages.
a254129e8686bf Joonsoo Kim       2014-08-06  427   * @align: Requested alignment of pages (in PAGE_SIZE order).
23ba990a3e2dde Minchan Kim       2021-01-21  428   * @gfp_mask: GFP mask to use during the cma allocation.
a254129e8686bf Joonsoo Kim       2014-08-06  429   *
a254129e8686bf Joonsoo Kim       2014-08-06  430   * This function allocates part of contiguous memory on specific
a254129e8686bf Joonsoo Kim       2014-08-06  431   * contiguous memory area.
a254129e8686bf Joonsoo Kim       2014-08-06  432   */
e2f466e32f56c8 Lucas Stach       2017-02-24  433  struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
23ba990a3e2dde Minchan Kim       2021-01-21  434  		       gfp_t gfp_mask)
a254129e8686bf Joonsoo Kim       2014-08-06  435  {
3acaea6804b3a1 Andrew Morton     2015-11-05  436  	unsigned long mask, offset;
3acaea6804b3a1 Andrew Morton     2015-11-05  437  	unsigned long pfn = -1;
3acaea6804b3a1 Andrew Morton     2015-11-05  438  	unsigned long start = 0;
a254129e8686bf Joonsoo Kim       2014-08-06  439  	unsigned long bitmap_maxno, bitmap_no, bitmap_count;
2813b9c0296259 Andrey Konovalov  2018-12-28  440  	size_t i;
a254129e8686bf Joonsoo Kim       2014-08-06  441  	struct page *page = NULL;
dbe43d4d2837da Jaewon Kim        2017-02-24  442  	int ret = -ENOMEM;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  443  	int num_attempts = 0;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  444  	int max_retries = 5;
c6e85ea56baac8 Minchan Kim       2021-04-01  445  	s64 ts;
c6e85ea56baac8 Minchan Kim       2021-04-01  446  
c6e85ea56baac8 Minchan Kim       2021-04-01  447  	trace_android_vh_cma_alloc_start(&ts);
a254129e8686bf Joonsoo Kim       2014-08-06  448  
835832ba01bb44 Jianqun Xu        2020-08-11  449  	if (!cma || !cma->count || !cma->bitmap)
0fb3917d8a354d Minchan Kim       2021-03-04  450  		goto out;
a254129e8686bf Joonsoo Kim       2014-08-06  451  
23ba990a3e2dde Minchan Kim       2021-01-21  452  	pr_debug("%s(cma %p, count %zu, align %d gfp_mask 0x%x)\n", __func__,
23ba990a3e2dde Minchan Kim       2021-01-21  453  			(void *)cma, count, align, gfp_mask);
a254129e8686bf Joonsoo Kim       2014-08-06  454  
a254129e8686bf Joonsoo Kim       2014-08-06  455  	if (!count)
0fb3917d8a354d Minchan Kim       2021-03-04  456  		goto out;
a254129e8686bf Joonsoo Kim       2014-08-06  457  
a254129e8686bf Joonsoo Kim       2014-08-06  458  	mask = cma_bitmap_aligned_mask(cma, align);
b5be83e308f70e Gregory Fong      2014-12-12  459  	offset = cma_bitmap_aligned_offset(cma, align);
a254129e8686bf Joonsoo Kim       2014-08-06  460  	bitmap_maxno = cma_bitmap_maxno(cma);
a254129e8686bf Joonsoo Kim       2014-08-06  461  	bitmap_count = cma_bitmap_pages_to_bits(cma, count);
a254129e8686bf Joonsoo Kim       2014-08-06  462  
6b36ba599d602d Shiraz Hashim     2016-11-10  463  	if (bitmap_count > bitmap_maxno)
0fb3917d8a354d Minchan Kim       2021-03-04  464  		goto out;
6b36ba599d602d Shiraz Hashim     2016-11-10  465  
a254129e8686bf Joonsoo Kim       2014-08-06  466  	for (;;) {
a254129e8686bf Joonsoo Kim       2014-08-06  467  		mutex_lock(&cma->lock);
b5be83e308f70e Gregory Fong      2014-12-12  468  		bitmap_no = bitmap_find_next_zero_area_off(cma->bitmap,
b5be83e308f70e Gregory Fong      2014-12-12  469  				bitmap_maxno, start, bitmap_count, mask,
b5be83e308f70e Gregory Fong      2014-12-12  470  				offset);
a254129e8686bf Joonsoo Kim       2014-08-06  471  		if (bitmap_no >= bitmap_maxno) {
73eda8ec747b68 Chris Goldsworthy 2020-09-18  472  			if ((num_attempts < max_retries) && (ret == -EBUSY)) {
a254129e8686bf Joonsoo Kim       2014-08-06  473  				mutex_unlock(&cma->lock);
73eda8ec747b68 Chris Goldsworthy 2020-09-18  474  
73eda8ec747b68 Chris Goldsworthy 2020-09-18  475  				if (fatal_signal_pending(current))
a254129e8686bf Joonsoo Kim       2014-08-06  476  					break;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  477  
73eda8ec747b68 Chris Goldsworthy 2020-09-18  478  				/*
73eda8ec747b68 Chris Goldsworthy 2020-09-18  479  				 * Page may be momentarily pinned by some other
73eda8ec747b68 Chris Goldsworthy 2020-09-18  480  				 * process which has been scheduled out, e.g.
73eda8ec747b68 Chris Goldsworthy 2020-09-18  481  				 * in exit path, during unmap call, or process
73eda8ec747b68 Chris Goldsworthy 2020-09-18  482  				 * fork and so cannot be freed there. Sleep
73eda8ec747b68 Chris Goldsworthy 2020-09-18  483  				 * for 100ms and retry the allocation.
73eda8ec747b68 Chris Goldsworthy 2020-09-18  484  				 */
73eda8ec747b68 Chris Goldsworthy 2020-09-18  485  				start = 0;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  486  				ret = -ENOMEM;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  487  				schedule_timeout_killable(msecs_to_jiffies(100));
73eda8ec747b68 Chris Goldsworthy 2020-09-18  488  				num_attempts++;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  489  				continue;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  490  			} else {
73eda8ec747b68 Chris Goldsworthy 2020-09-18  491  				mutex_unlock(&cma->lock);
73eda8ec747b68 Chris Goldsworthy 2020-09-18  492  				break;
73eda8ec747b68 Chris Goldsworthy 2020-09-18  493  			}
a254129e8686bf Joonsoo Kim       2014-08-06  494  		}
a254129e8686bf Joonsoo Kim       2014-08-06  495  		bitmap_set(cma->bitmap, bitmap_no, bitmap_count);
a254129e8686bf Joonsoo Kim       2014-08-06  496  		/*
a254129e8686bf Joonsoo Kim       2014-08-06  497  		 * It's safe to drop the lock here. We've marked this region for
a254129e8686bf Joonsoo Kim       2014-08-06  498  		 * our exclusive use. If the migration fails we will take the
a254129e8686bf Joonsoo Kim       2014-08-06  499  		 * lock again and unmark it.
a254129e8686bf Joonsoo Kim       2014-08-06  500  		 */
a254129e8686bf Joonsoo Kim       2014-08-06  501  		mutex_unlock(&cma->lock);
a254129e8686bf Joonsoo Kim       2014-08-06  502  
a254129e8686bf Joonsoo Kim       2014-08-06  503  		pfn = cma->base_pfn + (bitmap_no << cma->order_per_bit);
23ba990a3e2dde Minchan Kim       2021-01-21  504  		ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA, gfp_mask);
a254129e8686bf Joonsoo Kim       2014-08-06  505  		if (ret == 0) {
a254129e8686bf Joonsoo Kim       2014-08-06  506  			page = pfn_to_page(pfn);
a254129e8686bf Joonsoo Kim       2014-08-06  507  			break;
a254129e8686bf Joonsoo Kim       2014-08-06  508  		}
b7155e76a702d9 Joonsoo Kim       2014-08-06  509  
a254129e8686bf Joonsoo Kim       2014-08-06  510  		cma_clear_bitmap(cma, pfn, count);
b7155e76a702d9 Joonsoo Kim       2014-08-06  511  		if (ret != -EBUSY)
b7155e76a702d9 Joonsoo Kim       2014-08-06  512  			break;
b7155e76a702d9 Joonsoo Kim       2014-08-06  513  
a254129e8686bf Joonsoo Kim       2014-08-06  514  		pr_debug("%s(): memory range at %p is busy, retrying\n",
a254129e8686bf Joonsoo Kim       2014-08-06  515  			 __func__, pfn_to_page(pfn));
a254129e8686bf Joonsoo Kim       2014-08-06  516  		/* try again with a bit different memory target */
a254129e8686bf Joonsoo Kim       2014-08-06  517  		start = bitmap_no + mask + 1;
a254129e8686bf Joonsoo Kim       2014-08-06  518  	}
a254129e8686bf Joonsoo Kim       2014-08-06  519  
3acaea6804b3a1 Andrew Morton     2015-11-05  520  	trace_cma_alloc(pfn, page, count, align);
99e8ea6cd2210c Stefan Strogin    2015-04-15  521  
2813b9c0296259 Andrey Konovalov  2018-12-28  522  	/*
2813b9c0296259 Andrey Konovalov  2018-12-28  523  	 * CMA can allocate multiple page blocks, which results in different
2813b9c0296259 Andrey Konovalov  2018-12-28  524  	 * blocks being marked with different tags. Reset the tags to ignore
2813b9c0296259 Andrey Konovalov  2018-12-28  525  	 * those page blocks.
2813b9c0296259 Andrey Konovalov  2018-12-28  526  	 */
2813b9c0296259 Andrey Konovalov  2018-12-28  527  	if (page) {
2813b9c0296259 Andrey Konovalov  2018-12-28  528  		for (i = 0; i < count; i++)
2813b9c0296259 Andrey Konovalov  2018-12-28  529  			page_kasan_tag_reset(page + i);
2813b9c0296259 Andrey Konovalov  2018-12-28  530  	}
2813b9c0296259 Andrey Konovalov  2018-12-28  531  
23ba990a3e2dde Minchan Kim       2021-01-21  532  	if (ret && !(gfp_mask & __GFP_NOWARN)) {
0567ea33cfb890 Patrick Daly      2021-02-25  533  		pr_err("%s: %s: alloc failed, req-size: %zu pages, ret: %d\n",
0567ea33cfb890 Patrick Daly      2021-02-25  534  		       __func__, cma->name, count, ret);
dbe43d4d2837da Jaewon Kim        2017-02-24  535  		cma_debug_show_areas(cma);
dbe43d4d2837da Jaewon Kim        2017-02-24  536  	}
dbe43d4d2837da Jaewon Kim        2017-02-24  537  
a254129e8686bf Joonsoo Kim       2014-08-06  538  	pr_debug("%s(): returned %p\n", __func__, page);
0fb3917d8a354d Minchan Kim       2021-03-04  539  out:
c6e85ea56baac8 Minchan Kim       2021-04-01 @540  	trace_android_vh_cma_alloc_finish(cma, page, count, align, gfp_mask, ts);
a5903592595d8b Minchan Kim       2021-03-24  541  	if (page) {
0fb3917d8a354d Minchan Kim       2021-03-04  542  		count_vm_event(CMA_ALLOC_SUCCESS);
a5903592595d8b Minchan Kim       2021-03-24  543  		cma_sysfs_account_success_pages(cma, count);
a5903592595d8b Minchan Kim       2021-03-24  544  	} else {
0fb3917d8a354d Minchan Kim       2021-03-04  545  		count_vm_event(CMA_ALLOC_FAIL);
a5903592595d8b Minchan Kim       2021-03-24  546  		if (cma)
a5903592595d8b Minchan Kim       2021-03-24  547  			cma_sysfs_account_fail_pages(cma, count);
a5903592595d8b Minchan Kim       2021-03-24  548  	}
0fb3917d8a354d Minchan Kim       2021-03-04  549  
a254129e8686bf Joonsoo Kim       2014-08-06  550  	return page;
a254129e8686bf Joonsoo Kim       2014-08-06  551  }
716306e82c3cdc Sandeep Patil     2019-09-13  552  EXPORT_SYMBOL_GPL(cma_alloc);
a254129e8686bf Joonsoo Kim       2014-08-06  553  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
