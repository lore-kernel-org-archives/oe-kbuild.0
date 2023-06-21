Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8215015B1
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jun 2023 01:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687312500; x=1718848500;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hazIMhya6H9RrPp8Os7sQspF+TJTseQns/pmsj1jaVo=;
  b=eSN3W6CL53Zna94zoIYUtYw5arG6keSdl19O/vtAxR68gl5P/TYiOjqJ
   urdQ2BJkKwRoeX2yBphakvKDNc8z4OafPqR3cPinLBMMGjeV3VzxiiDgQ
   QFUbS3bNzj54ewpmaFD1uhbFbR1IDILGAS1N0qATzY27JiwZ7knO2Lly7
   wLpp15MRX5t+s1YBkQHsXo66dThMtYIP+ShjyLIE/mIhcMqTnLVTz2HLw
   p6e490mDdRBZwN+e7ApD+bEGouScO8AOE/oRotKxf2nQHg1DGp2Ne3QrR
   huoH7LYxA/HcxpUI7jdF+UUfmb/5oGBpDpHF60/P2j5rkl616yDEU869p
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="360044688"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="360044688"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 18:54:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="714261152"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="714261152"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Jun 2023 18:54:49 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBn3Z-0006Qa-0M;
	Wed, 21 Jun 2023 01:54:49 +0000
Date: Wed, 21 Jun 2023 09:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pdx86-platform-drivers-x86:review-hans 93/97]
 drivers/platform/x86/intel/pmc/core.c:500 pmc_core_send_ltr_ignore() error:
 uninitialized symbol 'pmc'.
Message-ID: <202306210915.0aKb5RTx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
TO: Xi Pardee <xi.pardee@intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: Rajvi Jingar <rajvi.jingar@linux.intel.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
head:   d2a7bd3690990ab8a8239096ee432ad51985d5b6
commit: 2bcef4529222424559ac9b45948ee9d82c09d9b5 [93/97] platform/x86:intel/pmc: Enable debugfs multiple PMC support
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-m001-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210915.0aKb5RTx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210915.0aKb5RTx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306210915.0aKb5RTx-lkp@intel.com/

smatch warnings:
drivers/platform/x86/intel/pmc/core.c:500 pmc_core_send_ltr_ignore() error: uninitialized symbol 'pmc'.
drivers/platform/x86/intel/pmc/core.c:500 pmc_core_send_ltr_ignore() error: potentially dereferencing uninitialized 'map'.

vim +/pmc +500 drivers/platform/x86/intel/pmc/core.c

fe748227570107 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  462  
92f530edd7c955 drivers/platform/x86/intel/pmc/core.c Gayatri Kammela   2022-11-14  463  int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value)
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  464  {
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  465  	struct pmc *pmc;
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  466  	const struct pmc_reg_map *map;
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  467  	u32 reg;
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  468  	int pmc_index, ltr_index;
9592438886756c drivers/platform/x86/intel_pmc_core.c Andy Shevchenko   2019-12-18  469  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  470  	ltr_index = value;
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  471  	/* For platforms with multiple pmcs, ltr index value given by user
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  472  	 * is based on the contiguous indexes from ltr_show output.
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  473  	 * pmc index and ltr index needs to be calculated from it.
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  474  	 */
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  475  	for (pmc_index = 0; pmc_index < ARRAY_SIZE(pmcdev->pmcs) && ltr_index > 0; pmc_index++) {
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  476  		pmc = pmcdev->pmcs[pmc_index];
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  477  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  478  		if (!pmc)
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  479  			continue;
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  480  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  481  		map = pmc->map;
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  482  		if (ltr_index <= map->ltr_ignore_max)
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  483  			break;
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  484  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  485  		/* Along with IP names, ltr_show map includes CURRENT_PLATFORM
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  486  		 * and AGGREGATED_SYSTEM values per PMC. Take these two index
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  487  		 * values into account in ltr_index calculation. Also, to start
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  488  		 * ltr index from zero for next pmc, subtract it by 1.
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  489  		 */
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  490  		ltr_index = ltr_index - (map->ltr_ignore_max + 2) - 1;
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  491  	}
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  492  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  493  	if (pmc_index >= ARRAY_SIZE(pmcdev->pmcs) || ltr_index < 0)
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  494  		return -EINVAL;
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  495  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  496  	pr_debug("ltr_ignore for pmc%d: ltr_index:%d\n", pmc_index, ltr_index);
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  497  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  498  	mutex_lock(&pmcdev->lock);
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  499  
1c709ae12dad6f drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13 @500  	reg = pmc_core_reg_read(pmc, map->ltr_ignore_offset);
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  501  	reg |= BIT(ltr_index);
1c709ae12dad6f drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  502  	pmc_core_reg_write(pmc, map->ltr_ignore_offset, reg);
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  503  
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  504  	mutex_unlock(&pmcdev->lock);
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  505  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  506  	return 0;
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  507  }
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  508  

:::::: The code at line 500 was first introduced by commit
:::::: 1c709ae12dad6f7e2dd5becfbac0f5141c2e15fd platform/x86:intel/pmc: Add support to handle multiple PMCs

:::::: TO: Xi Pardee <xi.pardee@intel.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
