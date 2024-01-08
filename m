Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730273FE3B
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jan 2024 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNfDTIWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704716064; x=1736252064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ML2LvJXDiPiZJI2fyv9GvzGg3eqeSu4vUgxfRjsoHHE=;
  b=CNfDTIWL/rXa1BK86CYIxgfxsEDq29owDHDTzHJZ2b6NxhKSKA2lOhWt
   lmD2kKwCciI6OGXLfpRT3ovzlo+6toeP8x4b+mfe3doUwJsSAf+VvBrtJ
   PEoATHNgEDDvcPMooEw0ZMun+MwHHG/hf2p6QwgBMBY7djS77oNiaXPHR
   Hz/6wynhVCd6nsNZJydH+ydAc99An6obF97b6Ctlq3vk/2LLJDnT636hu
   pePea7lt64tBJyUWVpAibii40KOBLQR6hKUyHk4cos8JonwIZ/bcCuAc7
   W1vGFMIz+VpfU4gNb/IBIFsb8K9ZSS8w/nYSi9G1vw3eN1Vv0Cvsjp95D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="5235109"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; 
   d="scan'208";a="5235109"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 04:14:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="781394762"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; 
   d="scan'208";a="781394762"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 08 Jan 2024 04:14:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMoWK-0004g4-04;
	Mon, 08 Jan 2024 12:14:20 +0000
Date: Mon, 8 Jan 2024 20:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9386/12908] mm/huge_memory.c:546 thpsize_create()
 warn: Calling kobject_put|get with state->initialized unset from line: 533
Message-ID: <202401082055.s03XC1wp-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ryan Roberts <ryan.roberts@arm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Barry Song <v-songbaohua@oppo.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bffdfd2e7e63175ae261131a620f809d946cf9a7
commit: 3485b88390b0af9e05dc2c3f57e9936f41e159a0 [9386/12908] mm: thp: introduce multi-size THP sysfs interface
:::::: branch date: 7 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-141-20240106 (https://download.01.org/0day-ci/archive/20240108/202401082055.s03XC1wp-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401082055.s03XC1wp-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:546 thpsize_create() warn: Calling kobject_put|get with state->initialized unset from line: 533

vim +546 mm/huge_memory.c

3485b88390b0af Ryan Roberts 2023-12-07  526  
3485b88390b0af Ryan Roberts 2023-12-07  527  static struct thpsize *thpsize_create(int order, struct kobject *parent)
3485b88390b0af Ryan Roberts 2023-12-07  528  {
3485b88390b0af Ryan Roberts 2023-12-07  529  	unsigned long size = (PAGE_SIZE << order) / SZ_1K;
3485b88390b0af Ryan Roberts 2023-12-07  530  	struct thpsize *thpsize;
3485b88390b0af Ryan Roberts 2023-12-07  531  	int ret;
3485b88390b0af Ryan Roberts 2023-12-07  532  
3485b88390b0af Ryan Roberts 2023-12-07  533  	thpsize = kzalloc(sizeof(*thpsize), GFP_KERNEL);
3485b88390b0af Ryan Roberts 2023-12-07  534  	if (!thpsize)
3485b88390b0af Ryan Roberts 2023-12-07  535  		return ERR_PTR(-ENOMEM);
3485b88390b0af Ryan Roberts 2023-12-07  536  
3485b88390b0af Ryan Roberts 2023-12-07  537  	ret = kobject_init_and_add(&thpsize->kobj, &thpsize_ktype, parent,
3485b88390b0af Ryan Roberts 2023-12-07  538  				   "hugepages-%lukB", size);
3485b88390b0af Ryan Roberts 2023-12-07  539  	if (ret) {
3485b88390b0af Ryan Roberts 2023-12-07  540  		kfree(thpsize);
3485b88390b0af Ryan Roberts 2023-12-07  541  		return ERR_PTR(ret);
3485b88390b0af Ryan Roberts 2023-12-07  542  	}
3485b88390b0af Ryan Roberts 2023-12-07  543  
3485b88390b0af Ryan Roberts 2023-12-07  544  	ret = sysfs_create_group(&thpsize->kobj, &thpsize_attr_group);
3485b88390b0af Ryan Roberts 2023-12-07  545  	if (ret) {
3485b88390b0af Ryan Roberts 2023-12-07 @546  		kobject_put(&thpsize->kobj);
3485b88390b0af Ryan Roberts 2023-12-07  547  		return ERR_PTR(ret);
3485b88390b0af Ryan Roberts 2023-12-07  548  	}
3485b88390b0af Ryan Roberts 2023-12-07  549  
3485b88390b0af Ryan Roberts 2023-12-07  550  	thpsize->order = order;
3485b88390b0af Ryan Roberts 2023-12-07  551  	return thpsize;
3485b88390b0af Ryan Roberts 2023-12-07  552  }
3485b88390b0af Ryan Roberts 2023-12-07  553  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
