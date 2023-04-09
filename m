Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41047184F
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Apr 2023 07:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681025608; x=1712561608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cBqhSYIjgrWfURl3SwSXodKR3E32YBd71/jCspdqKxo=;
  b=PXzaI/mimc44I+VKlYV5NZD8rMdMd1XTPEN2YpLKUew35NiJqhaN1yMS
   c1XkGvY1OJ9ncKKiHHGnVj45nPyyqEQBV6KnG53YkUti56GrvevqqUYak
   84UQY5k1xhQxusn6zoLAZh4eLls8FLmxcRnHVYS8u1hwJShZjboOyUxt6
   x49Q31/wdil80Y3fztUnnsNirnLXK2CccvwR5sJOif7Yr9zY+uwFBIfPh
   CuB03BkfJORYcyG37ePFzmr1ltC23ggZbeFAl9CxEv1iuALGuOjQ76alP
   p+Pg9fCWJqo5MbT3Hdb6ssbURzMlqHwDOrPNUuE2XxaMT7zLwxV1wU7S1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="345863862"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="345863862"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 00:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="681426288"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="681426288"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Apr 2023 00:33:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plPYD-000UP3-0P;
	Sun, 09 Apr 2023 07:33:25 +0000
Date: Sun, 9 Apr 2023 15:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH] mm: introduce defer free for cma
Message-ID: <202304091523.IZcRaGI1-lkp@intel.com>
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
In-Reply-To: <1680864131-4675-1-git-send-email-zhaoyang.huang@unisoc.com>
References: <1680864131-4675-1-git-send-email-zhaoyang.huang@unisoc.com>
TO: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>

Hi zhaoyang.huang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/mm-introduce-defer-free-for-cma/20230407-184459
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/1680864131-4675-1-git-send-email-zhaoyang.huang%40unisoc.com
patch subject: [RFC PATCH] mm: introduce defer free for cma
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230409/202304091523.IZcRaGI1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304091523.IZcRaGI1-lkp@intel.com/

smatch warnings:
mm/cma.c:449 cma_defer_area_fetch() error: dereferencing freed memory 'area'
mm/cma.c:691 cma_defer_free_scan() error: dereferencing freed memory 'area'

vim +/area +449 mm/cma.c

dbe43d4d2837da Jaewon Kim       2017-02-24  428  
7abee7e8d17803 Zhaoyang Huang   2023-04-07  429  static int cma_defer_area_fetch(struct cma *cma, unsigned long pfn,
7abee7e8d17803 Zhaoyang Huang   2023-04-07  430  		unsigned long count)
7abee7e8d17803 Zhaoyang Huang   2023-04-07  431  {
7abee7e8d17803 Zhaoyang Huang   2023-04-07  432  	struct cma_defer_free_area *area;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  433  	unsigned long new_pfn;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  434  	int ret = -1;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  435  
7abee7e8d17803 Zhaoyang Huang   2023-04-07  436  	if (!atomic64_read(&cma->defer_count))
7abee7e8d17803 Zhaoyang Huang   2023-04-07  437  		return ret;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  438  	if (count <= atomic64_read(&cma->defer_count)) {
7abee7e8d17803 Zhaoyang Huang   2023-04-07  439  		spin_lock_irq(&cma->lock);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  440  		list_for_each_entry(area, &cma->defer_free, list) {
7abee7e8d17803 Zhaoyang Huang   2023-04-07  441  			/*area found for given pfn and count*/
7abee7e8d17803 Zhaoyang Huang   2023-04-07  442  			if (pfn >= area->pfn && count <= area->count) {
7abee7e8d17803 Zhaoyang Huang   2023-04-07  443  				list_del(&area->list);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  444  				/*set bits for allocated pfn*/
7abee7e8d17803 Zhaoyang Huang   2023-04-07  445  				bitmap_set(cma->bitmap, pfn - cma->base_pfn, count);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  446  				kfree(area);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  447  				atomic64_sub(count, &cma->defer_count);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  448  				/*release the rest pfn to cma*/
7abee7e8d17803 Zhaoyang Huang   2023-04-07 @449  				if (!list_empty(&cma->defer_free) && (pfn == area->pfn)) {
7abee7e8d17803 Zhaoyang Huang   2023-04-07  450  					new_pfn = pfn + count;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  451  					cma_release(cma, pfn_to_page(new_pfn), area->count - count);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  452  				}
7abee7e8d17803 Zhaoyang Huang   2023-04-07  453  				ret = 0;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  454  				spin_unlock_irq(&cma->lock);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  455  				return ret;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  456  			}
7abee7e8d17803 Zhaoyang Huang   2023-04-07  457  		}
7abee7e8d17803 Zhaoyang Huang   2023-04-07  458  	}
7abee7e8d17803 Zhaoyang Huang   2023-04-07  459  	/*no area found, release all to buddy*/
7abee7e8d17803 Zhaoyang Huang   2023-04-07  460  	list_for_each_entry(area, &cma->defer_free, list) {
7abee7e8d17803 Zhaoyang Huang   2023-04-07  461  		list_del(&area->list);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  462  		free_contig_range(area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  463  		cma_clear_bitmap(cma, area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  464  		kfree(area);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  465  	}
7abee7e8d17803 Zhaoyang Huang   2023-04-07  466  	spin_unlock_irq(&cma->lock);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  467  	return ret;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  468  }
a254129e8686bf Joonsoo Kim      2014-08-06  469  /**
a254129e8686bf Joonsoo Kim      2014-08-06  470   * cma_alloc() - allocate pages from contiguous area
a254129e8686bf Joonsoo Kim      2014-08-06  471   * @cma:   Contiguous memory region for which the allocation is performed.
a254129e8686bf Joonsoo Kim      2014-08-06  472   * @count: Requested number of pages.
a254129e8686bf Joonsoo Kim      2014-08-06  473   * @align: Requested alignment of pages (in PAGE_SIZE order).
6518202970c105 Marek Szyprowski 2018-08-17  474   * @no_warn: Avoid printing message about failed allocation
a254129e8686bf Joonsoo Kim      2014-08-06  475   *
a254129e8686bf Joonsoo Kim      2014-08-06  476   * This function allocates part of contiguous memory on specific
a254129e8686bf Joonsoo Kim      2014-08-06  477   * contiguous memory area.
a254129e8686bf Joonsoo Kim      2014-08-06  478   */
78fa51503fdbe4 Minchan Kim      2021-05-04  479  struct page *cma_alloc(struct cma *cma, unsigned long count,
78fa51503fdbe4 Minchan Kim      2021-05-04  480  		       unsigned int align, bool no_warn)
a254129e8686bf Joonsoo Kim      2014-08-06  481  {
3acaea6804b3a1 Andrew Morton    2015-11-05  482  	unsigned long mask, offset;
3acaea6804b3a1 Andrew Morton    2015-11-05  483  	unsigned long pfn = -1;
3acaea6804b3a1 Andrew Morton    2015-11-05  484  	unsigned long start = 0;
a254129e8686bf Joonsoo Kim      2014-08-06  485  	unsigned long bitmap_maxno, bitmap_no, bitmap_count;
78fa51503fdbe4 Minchan Kim      2021-05-04  486  	unsigned long i;
a254129e8686bf Joonsoo Kim      2014-08-06  487  	struct page *page = NULL;
dbe43d4d2837da Jaewon Kim       2017-02-24  488  	int ret = -ENOMEM;
a254129e8686bf Joonsoo Kim      2014-08-06  489  
835832ba01bb44 Jianqun Xu       2020-08-11  490  	if (!cma || !cma->count || !cma->bitmap)
bbb269206f3c91 Minchan Kim      2021-05-04  491  		goto out;
a254129e8686bf Joonsoo Kim      2014-08-06  492  
78fa51503fdbe4 Minchan Kim      2021-05-04  493  	pr_debug("%s(cma %p, count %lu, align %d)\n", __func__, (void *)cma,
a254129e8686bf Joonsoo Kim      2014-08-06  494  		 count, align);
a254129e8686bf Joonsoo Kim      2014-08-06  495  
a254129e8686bf Joonsoo Kim      2014-08-06  496  	if (!count)
bbb269206f3c91 Minchan Kim      2021-05-04  497  		goto out;
a254129e8686bf Joonsoo Kim      2014-08-06  498  
7bc1aec5e28765 Liam Mark        2021-05-04  499  	trace_cma_alloc_start(cma->name, count, align);
7bc1aec5e28765 Liam Mark        2021-05-04  500  
a254129e8686bf Joonsoo Kim      2014-08-06  501  	mask = cma_bitmap_aligned_mask(cma, align);
b5be83e308f70e Gregory Fong     2014-12-12  502  	offset = cma_bitmap_aligned_offset(cma, align);
a254129e8686bf Joonsoo Kim      2014-08-06  503  	bitmap_maxno = cma_bitmap_maxno(cma);
a254129e8686bf Joonsoo Kim      2014-08-06  504  	bitmap_count = cma_bitmap_pages_to_bits(cma, count);
a254129e8686bf Joonsoo Kim      2014-08-06  505  
6b36ba599d602d Shiraz Hashim    2016-11-10  506  	if (bitmap_count > bitmap_maxno)
bbb269206f3c91 Minchan Kim      2021-05-04  507  		goto out;
6b36ba599d602d Shiraz Hashim    2016-11-10  508  
a254129e8686bf Joonsoo Kim      2014-08-06  509  	for (;;) {
0ef7dcac998fef Mike Kravetz     2021-05-04  510  		spin_lock_irq(&cma->lock);
b5be83e308f70e Gregory Fong     2014-12-12  511  		bitmap_no = bitmap_find_next_zero_area_off(cma->bitmap,
b5be83e308f70e Gregory Fong     2014-12-12  512  				bitmap_maxno, start, bitmap_count, mask,
b5be83e308f70e Gregory Fong     2014-12-12  513  				offset);
a254129e8686bf Joonsoo Kim      2014-08-06  514  		if (bitmap_no >= bitmap_maxno) {
0ef7dcac998fef Mike Kravetz     2021-05-04  515  			spin_unlock_irq(&cma->lock);
a254129e8686bf Joonsoo Kim      2014-08-06  516  			break;
a254129e8686bf Joonsoo Kim      2014-08-06  517  		}
a254129e8686bf Joonsoo Kim      2014-08-06  518  		bitmap_set(cma->bitmap, bitmap_no, bitmap_count);
a254129e8686bf Joonsoo Kim      2014-08-06  519  		/*
a254129e8686bf Joonsoo Kim      2014-08-06  520  		 * It's safe to drop the lock here. We've marked this region for
a254129e8686bf Joonsoo Kim      2014-08-06  521  		 * our exclusive use. If the migration fails we will take the
a254129e8686bf Joonsoo Kim      2014-08-06  522  		 * lock again and unmark it.
a254129e8686bf Joonsoo Kim      2014-08-06  523  		 */
0ef7dcac998fef Mike Kravetz     2021-05-04  524  		spin_unlock_irq(&cma->lock);
a254129e8686bf Joonsoo Kim      2014-08-06  525  
a254129e8686bf Joonsoo Kim      2014-08-06  526  		pfn = cma->base_pfn + (bitmap_no << cma->order_per_bit);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  527  
60a60e32cf9116 Dong Aisheng     2022-05-13  528  		mutex_lock(&cma_mutex);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  529  		/*search for defer area first*/
7abee7e8d17803 Zhaoyang Huang   2023-04-07  530  		ret = cma_defer_area_fetch(cma, pfn, count) ? alloc_contig_range(pfn, pfn + count, MIGRATE_CMA,
7abee7e8d17803 Zhaoyang Huang   2023-04-07  531  				     GFP_KERNEL | (no_warn ? __GFP_NOWARN : 0)) : 0;
60a60e32cf9116 Dong Aisheng     2022-05-13  532  		mutex_unlock(&cma_mutex);
a254129e8686bf Joonsoo Kim      2014-08-06  533  		if (ret == 0) {
a254129e8686bf Joonsoo Kim      2014-08-06  534  			page = pfn_to_page(pfn);
a254129e8686bf Joonsoo Kim      2014-08-06  535  			break;
a254129e8686bf Joonsoo Kim      2014-08-06  536  		}
b7155e76a702d9 Joonsoo Kim      2014-08-06  537  
a254129e8686bf Joonsoo Kim      2014-08-06  538  		cma_clear_bitmap(cma, pfn, count);
b7155e76a702d9 Joonsoo Kim      2014-08-06  539  		if (ret != -EBUSY)
b7155e76a702d9 Joonsoo Kim      2014-08-06  540  			break;
b7155e76a702d9 Joonsoo Kim      2014-08-06  541  
a254129e8686bf Joonsoo Kim      2014-08-06  542  		pr_debug("%s(): memory range at %p is busy, retrying\n",
a254129e8686bf Joonsoo Kim      2014-08-06  543  			 __func__, pfn_to_page(pfn));
7bc1aec5e28765 Liam Mark        2021-05-04  544  
3aab8ae7aace33 Minchan Kim      2021-05-04  545  		trace_cma_alloc_busy_retry(cma->name, pfn, pfn_to_page(pfn),
3aab8ae7aace33 Minchan Kim      2021-05-04  546  					   count, align);
a254129e8686bf Joonsoo Kim      2014-08-06  547  		/* try again with a bit different memory target */
a254129e8686bf Joonsoo Kim      2014-08-06  548  		start = bitmap_no + mask + 1;
a254129e8686bf Joonsoo Kim      2014-08-06  549  	}
a254129e8686bf Joonsoo Kim      2014-08-06  550  
cb6c33d4dc09a8 Wenchao Hao      2022-12-08  551  	trace_cma_alloc_finish(cma->name, pfn, page, count, align, ret);
99e8ea6cd2210c Stefan Strogin   2015-04-15  552  
2813b9c0296259 Andrey Konovalov 2018-12-28  553  	/*
2813b9c0296259 Andrey Konovalov 2018-12-28  554  	 * CMA can allocate multiple page blocks, which results in different
2813b9c0296259 Andrey Konovalov 2018-12-28  555  	 * blocks being marked with different tags. Reset the tags to ignore
2813b9c0296259 Andrey Konovalov 2018-12-28  556  	 * those page blocks.
2813b9c0296259 Andrey Konovalov 2018-12-28  557  	 */
2813b9c0296259 Andrey Konovalov 2018-12-28  558  	if (page) {
2813b9c0296259 Andrey Konovalov 2018-12-28  559  		for (i = 0; i < count; i++)
2813b9c0296259 Andrey Konovalov 2018-12-28  560  			page_kasan_tag_reset(page + i);
2813b9c0296259 Andrey Konovalov 2018-12-28  561  	}
2813b9c0296259 Andrey Konovalov 2018-12-28  562  
6518202970c105 Marek Szyprowski 2018-08-17  563  	if (ret && !no_warn) {
78fa51503fdbe4 Minchan Kim      2021-05-04  564  		pr_err_ratelimited("%s: %s: alloc failed, req-size: %lu pages, ret: %d\n",
a052d4d13d88c2 Patrick Daly     2021-02-25  565  				   __func__, cma->name, count, ret);
dbe43d4d2837da Jaewon Kim       2017-02-24  566  		cma_debug_show_areas(cma);
dbe43d4d2837da Jaewon Kim       2017-02-24  567  	}
dbe43d4d2837da Jaewon Kim       2017-02-24  568  
a254129e8686bf Joonsoo Kim      2014-08-06  569  	pr_debug("%s(): returned %p\n", __func__, page);
bbb269206f3c91 Minchan Kim      2021-05-04  570  out:
43ca106fa8ec7d Minchan Kim      2021-05-04  571  	if (page) {
bbb269206f3c91 Minchan Kim      2021-05-04  572  		count_vm_event(CMA_ALLOC_SUCCESS);
43ca106fa8ec7d Minchan Kim      2021-05-04  573  		cma_sysfs_account_success_pages(cma, count);
43ca106fa8ec7d Minchan Kim      2021-05-04  574  	} else {
bbb269206f3c91 Minchan Kim      2021-05-04  575  		count_vm_event(CMA_ALLOC_FAIL);
43ca106fa8ec7d Minchan Kim      2021-05-04  576  		if (cma)
43ca106fa8ec7d Minchan Kim      2021-05-04  577  			cma_sysfs_account_fail_pages(cma, count);
43ca106fa8ec7d Minchan Kim      2021-05-04  578  	}
bbb269206f3c91 Minchan Kim      2021-05-04  579  
a254129e8686bf Joonsoo Kim      2014-08-06  580  	return page;
a254129e8686bf Joonsoo Kim      2014-08-06  581  }
a254129e8686bf Joonsoo Kim      2014-08-06  582  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
