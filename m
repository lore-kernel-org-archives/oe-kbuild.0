Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA8D36B
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Sep 2023 00:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694912073; x=1726448073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HzlzpTvB3ohnJCvbRfDAZGcBljTahIDi/Gz0b+4/CUI=;
  b=WKElZsKyJi8Wdz/WqJfKbsubfx/73gzcJRrqNdy6dKp/a60Uy52Rb9zF
   FmXi1m2JwrVBRcVACxoMGSNyVAepDBufEFD+8Pg58yjUWApECY9aJ2hBp
   1CZhLunUttq6fXWzN3Ax6LqeUOX1+7TXOtbX5vI4E2tjJWznotUTJIvHH
   qaJN8Z8vmZrf60QqV1n03l2TKSczMoWfIfPeD5Hre+AhH5dy3duSSsawy
   WeJlLkSftKyDoZUlIUmx5irLAloKcZlXW+znUrdp1OQtQanVfcP0y98j7
   qaCFJY3V3ijMUMtWY2scUIpAyB1z5OvcAyRYCVSvgYOV/svSoKfJeR3Uq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="382195624"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="382195624"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 17:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="888632907"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="888632907"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2023 17:53:52 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhg3O-0004oi-0A;
	Sun, 17 Sep 2023 00:54:27 +0000
Date: Sun, 17 Sep 2023 08:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/cxl/core/port.c:331 cxl_root_decoder_visible() error: we
 previously assumed 'a' could be null (see line 327)
Message-ID: <202309170852.nXn9fcSu-lkp@intel.com>
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
TO: Dan Williams <dan.j.williams@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Dave Jiang <dave.jiang@intel.com>
CC: Gregory Price <gregory.price@memverge.com>

Hi Dan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b0d403eabbe135d8dbb40ad5e41018947d336c
commit: 45d235c56b2bc51749af9cc8fe6ace18aa8b81be cxl/region: Enable CONFIG_CXL_REGION to be toggled
date:   7 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20230916 (https://download.01.org/0day-ci/archive/20230917/202309170852.nXn9fcSu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309170852.nXn9fcSu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309170852.nXn9fcSu-lkp@intel.com/

smatch warnings:
drivers/cxl/core/port.c:331 cxl_root_decoder_visible() error: we previously assumed 'a' could be null (see line 327)

vim +/a +331 drivers/cxl/core/port.c

6e099264185d05 Dan Williams 2023-02-10  315  
779dd20cfb56c5 Ben Widawsky 2021-06-08  316  static umode_t cxl_root_decoder_visible(struct kobject *kobj, struct attribute *a, int n)
779dd20cfb56c5 Ben Widawsky 2021-06-08  317  {
779dd20cfb56c5 Ben Widawsky 2021-06-08  318  	struct device *dev = kobj_to_dev(kobj);
779dd20cfb56c5 Ben Widawsky 2021-06-08  319  	struct cxl_root_decoder *cxlrd = to_cxl_root_decoder(dev);
779dd20cfb56c5 Ben Widawsky 2021-06-08  320  
779dd20cfb56c5 Ben Widawsky 2021-06-08  321  	if (a == CXL_REGION_ATTR(create_pmem_region) && !can_create_pmem(cxlrd))
779dd20cfb56c5 Ben Widawsky 2021-06-08  322  		return 0;
779dd20cfb56c5 Ben Widawsky 2021-06-08  323  
6e099264185d05 Dan Williams 2023-02-10  324  	if (a == CXL_REGION_ATTR(create_ram_region) && !can_create_ram(cxlrd))
6e099264185d05 Dan Williams 2023-02-10  325  		return 0;
6e099264185d05 Dan Williams 2023-02-10  326  
6e099264185d05 Dan Williams 2023-02-10 @327  	if (a == CXL_REGION_ATTR(delete_region) &&
6e099264185d05 Dan Williams 2023-02-10  328  	    !(can_create_pmem(cxlrd) || can_create_ram(cxlrd)))
779dd20cfb56c5 Ben Widawsky 2021-06-08  329  		return 0;
779dd20cfb56c5 Ben Widawsky 2021-06-08  330  
779dd20cfb56c5 Ben Widawsky 2021-06-08 @331  	return a->mode;
779dd20cfb56c5 Ben Widawsky 2021-06-08  332  }
779dd20cfb56c5 Ben Widawsky 2021-06-08  333  

:::::: The code at line 331 was first introduced by commit
:::::: 779dd20cfb56c510f89877cca45529fa9f8bc450 cxl/region: Add region creation support

:::::: TO: Ben Widawsky <bwidawsk@kernel.org>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
