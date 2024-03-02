Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1A311C88
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Mar 2024 07:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709366347; cv=none; b=SY76x3RHbM725iaGtQwvUUalHuwBlLLUaml/16msc+sXcq3aKF+O6KWF4ZMp3yRTob4qrOarmYoBvCoSQV22dhjSGI6x2p4GTCIB8RV8FNyA1uTV1OkWLfXKF7KRe2WiOiVF/MIXStAoEv5Vzcil6iBLo62SdbD/d9m7o2lPvdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709366347; c=relaxed/simple;
	bh=pZMXns63eS7vb4qPRLVEzESiwQlEX/86iHv0Ws/3NQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A+2XKOJB71UTHHr3JEV0i0WpHHs6oMBMg9w9rqrYEHck3nlD15Gz33xkUsfyEnFTXWt6kmkVrDq83cEpJCtq5EHvEH/TUKV+QWEmvtm2TnvVyN+Ja6ZNTK7qVRGX6OezYerl87R0FV2+pJS7P1dVzzTHtPBaKQfxgq1MTif5l3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8BpzF3T; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8BpzF3T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709366345; x=1740902345;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pZMXns63eS7vb4qPRLVEzESiwQlEX/86iHv0Ws/3NQQ=;
  b=H8BpzF3Ta/j+Kc+Q/MZH0dV/x2lPdX0wNdK+hHKryE4y3qofzh4V76XP
   0xiWFx3y86hzIAIimfsKCkfCqtPLBGqQatL194Zhyu01ifrNF78vfMhD5
   5x1rdxhb1wEkf0/f7Ou3vY0I7GqWxDtwNKHRlJPAYa4gdGA+TGWaqzhuv
   ka9Ximegs3qyGfsrszLtJ4cwffBuiXWM7ibK2eYqEWpv9t8aGXSg27fqa
   jcqEqSV561rNvByraoPuHWvkEVl+mXAISjGhQG7neZgv6CPgbAEvxFthn
   M0AjdUKPtgTGhjeMyuwu7Vj6o4jJk07XZZcUTHFc1NNZPk+WSPSgoLA4a
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4034641"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="4034641"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 23:59:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="13093291"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Mar 2024 23:59:03 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgKGq-000ERM-0s;
	Sat, 02 Mar 2024 07:59:00 +0000
Date: Sat, 2 Mar 2024 15:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/intel/pmc/core.c:500 pmc_core_send_ltr_ignore()
 error: uninitialized symbol 'map'.
Message-ID: <202403021544.6qtkaAly-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Xi Pardee <xi.pardee@intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: Rajvi Jingar <rajvi.jingar@linux.intel.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5ad3cb0ed525b80c7f66c32b49a68c1f3510bec9
commit: 2bcef4529222424559ac9b45948ee9d82c09d9b5 platform/x86:intel/pmc: Enable debugfs multiple PMC support
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-141-20240302 (https://download.01.org/0day-ci/archive/20240302/202403021544.6qtkaAly-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403021544.6qtkaAly-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel/pmc/core.c:500 pmc_core_send_ltr_ignore() error: uninitialized symbol 'map'.

Old smatch warnings:
drivers/platform/x86/intel/pmc/core.c:500 pmc_core_send_ltr_ignore() error: uninitialized symbol 'pmc'.

vim +/map +500 drivers/platform/x86/intel/pmc/core.c

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
