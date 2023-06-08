Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918B92A9CA
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jun 2023 23:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686266269; x=1717802269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b85vVQJWIEvGYuwQsY72zDJQJNRar7SxOH8ZiQjYXDo=;
  b=AIgSiLwvCLcA+1bl5L07kzQfw7KLdyyUfrTThflosiyUbJkO943zXdO8
   qEmuWaY3P+XbH2NSwac5ndsHPS82hFb5da7WVEOnIFxrlZ1KQET2+uwPv
   3AUePHSy6ySe93TfPt9NZAvjf2yegFQJVxIPWBGh72dkmW+EgrpgP+G4c
   QMiOctmt1qN9wBqUgNPysNcodVb5Ju2Ej/9mRNKFElCQDY1rgtSAL0et8
   0Z/K9Gqm6Col+Nb6fZsprbicUDtC/IM1rPTv6QInCl3e5fhz/0VqM42hF
   aEcQqy/T6ZE3vA9FhpFQVsjC4Zv/je1HiRS3E0thec86N9x0KJlZBumaM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337816529"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="337816529"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 16:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="956921316"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="956921316"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2023 16:17:47 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7Ot0-0008LA-2L;
	Thu, 08 Jun 2023 23:17:46 +0000
Date: Fri, 9 Jun 2023 07:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 10/19] cxl/memdev: Indicate probe deferral
Message-ID: <202306090732.SLD5PmoG-lkp@intel.com>
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
In-Reply-To: <168592155270.1948938.11536845108449547920.stgit@dwillia2-xfh.jf.intel.com>
References: <168592155270.1948938.11536845108449547920.stgit@dwillia2-xfh.jf.intel.com>
TO: Dan Williams <dan.j.williams@intel.com>

Hi Dan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9561de3a55bed6bdd44a12820ba81ec416e705a7]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/cxl-regs-Clarify-when-a-struct-cxl_register_map-is-input-vs-output/20230605-073402
base:   9561de3a55bed6bdd44a12820ba81ec416e705a7
patch link:    https://lore.kernel.org/r/168592155270.1948938.11536845108449547920.stgit%40dwillia2-xfh.jf.intel.com
patch subject: [PATCH 10/19] cxl/memdev: Indicate probe deferral
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021-20230608 (https://download.01.org/0day-ci/archive/20230609/202306090732.SLD5PmoG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306090732.SLD5PmoG-lkp@intel.com/

smatch warnings:
drivers/cxl/core/memdev.c:642 cxl_acquire_endpoint() warn: inconsistent returns '&cxlmd->dev.mutex'.

vim +642 drivers/cxl/core/memdev.c

3d135db510240f Ben Widawsky 2021-08-02  611  
126ed1e685e817 Dan Williams 2023-06-04  612  /*
126ed1e685e817 Dan Williams 2023-06-04  613   * Try to get a locked reference on a memdev's CXL port topology
126ed1e685e817 Dan Williams 2023-06-04  614   * connection. Be careful to observe when cxl_mem_probe() has deposited
126ed1e685e817 Dan Williams 2023-06-04  615   * a probe deferral awaiting the arrival of the CXL root driver
126ed1e685e817 Dan Williams 2023-06-04  616   */
126ed1e685e817 Dan Williams 2023-06-04  617  struct cxl_port *cxl_acquire_endpoint(struct cxl_memdev *cxlmd)
126ed1e685e817 Dan Williams 2023-06-04  618  {
126ed1e685e817 Dan Williams 2023-06-04  619  	struct cxl_port *endpoint;
126ed1e685e817 Dan Williams 2023-06-04  620  	int rc = -ENXIO;
126ed1e685e817 Dan Williams 2023-06-04  621  
126ed1e685e817 Dan Williams 2023-06-04  622  	device_lock(&cxlmd->dev);
126ed1e685e817 Dan Williams 2023-06-04  623  	endpoint = cxlmd->endpoint;
126ed1e685e817 Dan Williams 2023-06-04  624  	if (!endpoint)
126ed1e685e817 Dan Williams 2023-06-04  625  		goto err;
126ed1e685e817 Dan Williams 2023-06-04  626  
126ed1e685e817 Dan Williams 2023-06-04  627  	if (IS_ERR(endpoint)) {
126ed1e685e817 Dan Williams 2023-06-04  628  		rc = PTR_ERR(endpoint);
126ed1e685e817 Dan Williams 2023-06-04  629  		goto err;
126ed1e685e817 Dan Williams 2023-06-04  630  	}
126ed1e685e817 Dan Williams 2023-06-04  631  
126ed1e685e817 Dan Williams 2023-06-04  632  	device_lock(&endpoint->dev);
126ed1e685e817 Dan Williams 2023-06-04  633  	if (!endpoint->dev.driver)
126ed1e685e817 Dan Williams 2023-06-04  634  		goto err_endpoint;
126ed1e685e817 Dan Williams 2023-06-04  635  
126ed1e685e817 Dan Williams 2023-06-04  636  	return endpoint;
126ed1e685e817 Dan Williams 2023-06-04  637  
126ed1e685e817 Dan Williams 2023-06-04  638  err_endpoint:
126ed1e685e817 Dan Williams 2023-06-04  639  	device_unlock(&endpoint->dev);
126ed1e685e817 Dan Williams 2023-06-04  640  err:
126ed1e685e817 Dan Williams 2023-06-04  641  	device_unlock(&cxlmd->dev);
126ed1e685e817 Dan Williams 2023-06-04 @642  	return ERR_PTR(rc);
126ed1e685e817 Dan Williams 2023-06-04  643  }
126ed1e685e817 Dan Williams 2023-06-04  644  EXPORT_SYMBOL_NS(cxl_acquire_endpoint, CXL);
126ed1e685e817 Dan Williams 2023-06-04  645  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
