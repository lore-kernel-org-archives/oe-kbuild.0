Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E3E1F947
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jun 2023 16:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687452201; x=1718988201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8wxKuLzdZviMk60clemwgRNV5ih0K9BldUukyIacSSE=;
  b=AlvXLfzY0SV+wN40w7MmnlM2jEe33YHGdbvJgnD7Y6gIctJ5OAnAgf0v
   yB9eWuqre6KG+bgua0XKgrYMjDfzz51F8oauSOkVvCKuV0pt2D5ViuScP
   4mcSw6Z49AE6NjEwjbHwBLG8FCUzcsejtrRF7KlDCtIwjIs9v82rslxwM
   FU2s0M/yyj6hIzFuxVfRGLMsEA3cZiwozk6sauHaRR7ikKdZdTOJ4xvqO
   akRa+CdT6kLhHHwvD/LQLfPP6gO+ZkOEHHsKy661cyw++Vyxsu15w96C4
   JanANGCO4u8C2SFq7JY9ZhybQgYqMYyz+jf/NSRU9FyKd6SygfV4GvJrB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="340146658"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="340146658"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 09:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="714963691"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="714963691"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Jun 2023 09:42:44 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCNON-0007h1-1t;
	Thu, 22 Jun 2023 16:42:43 +0000
Date: Fri, 23 Jun 2023 00:42:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/cxl/core/region.c:2634 cxl_add_to_region() error: 'cxlr'
 dereferencing possible ERR_PTR()
Message-ID: <202306230007.t9nFY3ML-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dad9774deaf1cf8e8f7483310dfb2690310193d2
commit: 7abcb0b10668eaf3c174ff383f3b2a7a8c95fb34 cxl: avoid returning uninitialized error code
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-m021-20230622 (https://download.01.org/0day-ci/archive/20230623/202306230007.t9nFY3ML-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230007.t9nFY3ML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306230007.t9nFY3ML-lkp@intel.com/

New smatch warnings:
drivers/cxl/core/region.c:2634 cxl_add_to_region() error: 'cxlr' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/cxl/core/region.c:2644 cxl_add_to_region() error: 'cxlr' dereferencing possible ERR_PTR()

vim +/cxlr +2634 drivers/cxl/core/region.c

a32320b71f085f Dan Williams  2023-02-10  2587  
a32320b71f085f Dan Williams  2023-02-10  2588  int cxl_add_to_region(struct cxl_port *root, struct cxl_endpoint_decoder *cxled)
a32320b71f085f Dan Williams  2023-02-10  2589  {
a32320b71f085f Dan Williams  2023-02-10  2590  	struct cxl_memdev *cxlmd = cxled_to_memdev(cxled);
a32320b71f085f Dan Williams  2023-02-10  2591  	struct range *hpa = &cxled->cxld.hpa_range;
a32320b71f085f Dan Williams  2023-02-10  2592  	struct cxl_decoder *cxld = &cxled->cxld;
a32320b71f085f Dan Williams  2023-02-10  2593  	struct device *cxlrd_dev, *region_dev;
a32320b71f085f Dan Williams  2023-02-10  2594  	struct cxl_root_decoder *cxlrd;
a32320b71f085f Dan Williams  2023-02-10  2595  	struct cxl_region_params *p;
a32320b71f085f Dan Williams  2023-02-10  2596  	struct cxl_region *cxlr;
a32320b71f085f Dan Williams  2023-02-10  2597  	bool attach = false;
a32320b71f085f Dan Williams  2023-02-10  2598  	int rc;
a32320b71f085f Dan Williams  2023-02-10  2599  
a32320b71f085f Dan Williams  2023-02-10  2600  	cxlrd_dev = device_find_child(&root->dev, &cxld->hpa_range,
a32320b71f085f Dan Williams  2023-02-10  2601  				      match_decoder_by_range);
a32320b71f085f Dan Williams  2023-02-10  2602  	if (!cxlrd_dev) {
a32320b71f085f Dan Williams  2023-02-10  2603  		dev_err(cxlmd->dev.parent,
a32320b71f085f Dan Williams  2023-02-10  2604  			"%s:%s no CXL window for range %#llx:%#llx\n",
a32320b71f085f Dan Williams  2023-02-10  2605  			dev_name(&cxlmd->dev), dev_name(&cxld->dev),
a32320b71f085f Dan Williams  2023-02-10  2606  			cxld->hpa_range.start, cxld->hpa_range.end);
a32320b71f085f Dan Williams  2023-02-10  2607  		return -ENXIO;
a32320b71f085f Dan Williams  2023-02-10  2608  	}
a32320b71f085f Dan Williams  2023-02-10  2609  
a32320b71f085f Dan Williams  2023-02-10  2610  	cxlrd = to_cxl_root_decoder(cxlrd_dev);
a32320b71f085f Dan Williams  2023-02-10  2611  
a32320b71f085f Dan Williams  2023-02-10  2612  	/*
a32320b71f085f Dan Williams  2023-02-10  2613  	 * Ensure that if multiple threads race to construct_region() for @hpa
a32320b71f085f Dan Williams  2023-02-10  2614  	 * one does the construction and the others add to that.
a32320b71f085f Dan Williams  2023-02-10  2615  	 */
a32320b71f085f Dan Williams  2023-02-10  2616  	mutex_lock(&cxlrd->range_lock);
a32320b71f085f Dan Williams  2023-02-10  2617  	region_dev = device_find_child(&cxlrd->cxlsd.cxld.dev, hpa,
a32320b71f085f Dan Williams  2023-02-10  2618  				       match_region_by_range);
a32320b71f085f Dan Williams  2023-02-10  2619  	if (!region_dev) {
a32320b71f085f Dan Williams  2023-02-10  2620  		cxlr = construct_region(cxlrd, cxled);
a32320b71f085f Dan Williams  2023-02-10  2621  		region_dev = &cxlr->dev;
a32320b71f085f Dan Williams  2023-02-10  2622  	} else
a32320b71f085f Dan Williams  2023-02-10  2623  		cxlr = to_cxl_region(region_dev);
a32320b71f085f Dan Williams  2023-02-10  2624  	mutex_unlock(&cxlrd->range_lock);
a32320b71f085f Dan Williams  2023-02-10  2625  
7abcb0b10668ea Arnd Bergmann 2023-02-13  2626  	rc = PTR_ERR_OR_ZERO(cxlr);
7abcb0b10668ea Arnd Bergmann 2023-02-13  2627  	if (rc)
a32320b71f085f Dan Williams  2023-02-10  2628  		goto out;
a32320b71f085f Dan Williams  2023-02-10  2629  
a32320b71f085f Dan Williams  2023-02-10  2630  	attach_target(cxlr, cxled, -1, TASK_UNINTERRUPTIBLE);
a32320b71f085f Dan Williams  2023-02-10  2631  
a32320b71f085f Dan Williams  2023-02-10  2632  	down_read(&cxl_region_rwsem);
a32320b71f085f Dan Williams  2023-02-10  2633  	p = &cxlr->params;
a32320b71f085f Dan Williams  2023-02-10 @2634  	attach = p->state == CXL_CONFIG_COMMIT;
a32320b71f085f Dan Williams  2023-02-10  2635  	up_read(&cxl_region_rwsem);
a32320b71f085f Dan Williams  2023-02-10  2636  
a32320b71f085f Dan Williams  2023-02-10  2637  	if (attach) {
a32320b71f085f Dan Williams  2023-02-10  2638  		/*
a32320b71f085f Dan Williams  2023-02-10  2639  		 * If device_attach() fails the range may still be active via
a32320b71f085f Dan Williams  2023-02-10  2640  		 * the platform-firmware memory map, otherwise the driver for
a32320b71f085f Dan Williams  2023-02-10  2641  		 * regions is local to this file, so driver matching can't fail.
a32320b71f085f Dan Williams  2023-02-10  2642  		 */
a32320b71f085f Dan Williams  2023-02-10  2643  		if (device_attach(&cxlr->dev) < 0)
a32320b71f085f Dan Williams  2023-02-10  2644  			dev_err(&cxlr->dev, "failed to enable, range: %pr\n",
a32320b71f085f Dan Williams  2023-02-10  2645  				p->res);
a32320b71f085f Dan Williams  2023-02-10  2646  	}
a32320b71f085f Dan Williams  2023-02-10  2647  
a32320b71f085f Dan Williams  2023-02-10  2648  	put_device(region_dev);
a32320b71f085f Dan Williams  2023-02-10  2649  out:
a32320b71f085f Dan Williams  2023-02-10  2650  	put_device(cxlrd_dev);
a32320b71f085f Dan Williams  2023-02-10  2651  	return rc;
a32320b71f085f Dan Williams  2023-02-10  2652  }
a32320b71f085f Dan Williams  2023-02-10  2653  EXPORT_SYMBOL_NS_GPL(cxl_add_to_region, CXL);
a32320b71f085f Dan Williams  2023-02-10  2654  

:::::: The code at line 2634 was first introduced by commit
:::::: a32320b71f085f8d82afedcf285f1682c8c00aed cxl/region: Add region autodiscovery

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
