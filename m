Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C481FDE
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Apr 2023 23:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681082100; x=1712618100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W8+v1RasDe0s+ErZIgoAfuYxQHnQdnYkrckp0HAA+8U=;
  b=btIc/W8MtDQWgJDV3EzdfpedaqSKG+ClS5AyAJzebG1bFkiRXJtTcc6b
   l9BKbF1cRCgV23j5Y9ve+nxuwKDS1eXOONQbbUS3xpJYHf4D/mrkTTjDY
   bvmwgqhFJ5xmy40hBE40z+IEyPPiceLhDC986D5jHHfBtq1jo2zBCrvM0
   V8Qu9cV0Kx4l6L+MMn+ZFYhjBVQ+M0dpmXoiMTFa4rfkuffK8uc07CZ5B
   mTnUSPpPONIeRrORh3/RsjJ/G9DHDJrViqjiFgFhXPZG8OcS5mu3nCIB2
   hKKUW6lqccoqUNjoPQQ427u7dju0pSm1cOH/3gG8V0m+iFF8wrtxtJ8YM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="406081906"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="406081906"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 16:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="799315629"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="799315629"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2023 16:14:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pleFL-000UqP-12;
	Sun, 09 Apr 2023 23:14:55 +0000
Date: Mon, 10 Apr 2023 07:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH] mm: introduce defer free for cma
Message-ID: <202304100654.yAZ2Wukx-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230410/202304100654.yAZ2Wukx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304100654.yAZ2Wukx-lkp@intel.com/

smatch warnings:
mm/cma.c:730 cma_defer_free_scan() warn: inconsistent returns '&cma->lock'.

vim +730 mm/cma.c

7abee7e8d17803 Zhaoyang Huang 2023-04-07  672  
7abee7e8d17803 Zhaoyang Huang 2023-04-07  673  static unsigned long cma_defer_free_scan(struct shrinker *shrinker,
7abee7e8d17803 Zhaoyang Huang 2023-04-07  674  					struct shrink_control *sc)
7abee7e8d17803 Zhaoyang Huang 2023-04-07  675  {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  676  	struct cma *cma = container_of(shrinker, struct cma, shrinker);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  677  	unsigned long to_scan;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  678  	struct cma_defer_free_area *area;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  679  	unsigned long new_pfn;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  680  	unsigned long defer_count;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  681  
7abee7e8d17803 Zhaoyang Huang 2023-04-07  682  	if (sc->nr_to_scan < cma->batch)
7abee7e8d17803 Zhaoyang Huang 2023-04-07  683  		return 0;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  684  
7abee7e8d17803 Zhaoyang Huang 2023-04-07  685  	to_scan = cma->batch - sc->nr_to_scan;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  686  	defer_count = atomic64_read(&cma->defer_count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  687  	spin_lock_irq(&cma->lock);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  688  
7abee7e8d17803 Zhaoyang Huang 2023-04-07  689  	/*free all node*/
7abee7e8d17803 Zhaoyang Huang 2023-04-07  690  	if (to_scan >= defer_count) {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  691  		list_for_each_entry(area, &cma->defer_free, list) {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  692  			list_del(&area->list);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  693  			free_contig_range(area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  694  			cma_clear_bitmap(cma, area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  695  			kfree(area);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  696  		}
7abee7e8d17803 Zhaoyang Huang 2023-04-07  697  		atomic64_set(&cma->defer_count, 0);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  698  		return defer_count;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  699  	}
7abee7e8d17803 Zhaoyang Huang 2023-04-07  700  
7abee7e8d17803 Zhaoyang Huang 2023-04-07  701  	list_for_each_entry(area, &cma->defer_free, list) {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  702  		if (to_scan <= area->count) {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  703  			list_del(&area->list);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  704  			free_contig_range(area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  705  			cma_clear_bitmap(cma, area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  706  			kfree(area);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  707  			atomic64_sub(to_scan, &cma->defer_count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  708  			/*release the rest pfn to cma*/
7abee7e8d17803 Zhaoyang Huang 2023-04-07  709  			if (!list_empty(&cma->defer_free)) {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  710  				new_pfn = area->pfn + to_scan;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  711  				cma_release(cma, pfn_to_page(new_pfn), area->count - to_scan);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  712  			}
7abee7e8d17803 Zhaoyang Huang 2023-04-07  713  			break;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  714  		}
7abee7e8d17803 Zhaoyang Huang 2023-04-07  715  		else {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  716  			list_del(&area->list);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  717  			free_contig_range(area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  718  			cma_clear_bitmap(cma, area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  719  			kfree(area);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  720  			to_scan = to_scan - atomic64_read(&cma->defer_count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  721  			/*release the rest pfn to cma*/
7abee7e8d17803 Zhaoyang Huang 2023-04-07  722  			if (!list_empty(&cma->defer_free)) {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  723  				new_pfn = area->pfn + to_scan;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  724  				cma_release(cma, pfn_to_page(new_pfn), area->count - to_scan);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  725  			}
7abee7e8d17803 Zhaoyang Huang 2023-04-07  726  			continue;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  727  		}
7abee7e8d17803 Zhaoyang Huang 2023-04-07  728  	}
7abee7e8d17803 Zhaoyang Huang 2023-04-07  729  	spin_unlock_irq(&cma->lock);
7abee7e8d17803 Zhaoyang Huang 2023-04-07 @730  	return 0;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  731  }
7abee7e8d17803 Zhaoyang Huang 2023-04-07  732  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
