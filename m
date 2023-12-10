Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B9418628
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 19:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9dN5JOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702237384; x=1733773384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ROkFykE2iT396lVaDigYKU6nHMm8gGsOPlELL1i08Ow=;
  b=R9dN5JOOaesO9MP8Bp2UKBM+y+yOGhAE2EIWCo/up51/Py0nS8Ki1aJU
   K+O4bJvHefjafi9llHICxDiraEMDz9H5mPx7bm0RJkZh6krnww3t6//NB
   mSAWk97GU8aimtnVbpo3w9B1oj9nKD4hFnV5CLiMgNMukid7IaUv4vbZt
   M3XvZn7I1h86ea23V0I2Mm9O0RpJrmkuK7b1woc1rkELsq/IRgQgw/pSM
   58s/7cdeY9OpwTFoow3SujAy0X51nE1QcP8cFqEuspaI+sT0/7F/66Qff
   HyygXUXFxEte0lbiwUY3K/1WCoclQgygJyEkjalEx+5BBk8dfYwlrH0/B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="7928301"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="7928301"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 11:43:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="946044427"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="946044427"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 10 Dec 2023 11:43:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCPhd-000HDS-1N;
	Sun, 10 Dec 2023 19:43:01 +0000
Date: Mon, 11 Dec 2023 03:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:bits/010-soc 7/16] drivers/soc/apple/mailbox.c:290
 apple_mbox_get() warn: passing zero to 'ERR_PTR'
Message-ID: <202312110312.K2yCc9K1-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/010-soc
head:   3d3347e62feacf57f15c7f20c0309c8dac65da44
commit: 818b34e17da79772d796cfbe9cb923f2025af007 [7/16] mailbox: apple: Delete driver
:::::: branch date: 3 weeks ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231211/202312110312.K2yCc9K1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312110312.K2yCc9K1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312110312.K2yCc9K1-lkp@intel.com/

smatch warnings:
drivers/soc/apple/mailbox.c:290 apple_mbox_get() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +290 drivers/soc/apple/mailbox.c

b7bac953131b57 Hector Martin 2023-03-14  279  
b7bac953131b57 Hector Martin 2023-03-14  280  struct apple_mbox *apple_mbox_get(struct device *dev, int index)
b7bac953131b57 Hector Martin 2023-03-14  281  {
b7bac953131b57 Hector Martin 2023-03-14  282  	struct of_phandle_args args;
b7bac953131b57 Hector Martin 2023-03-14  283  	struct platform_device *pdev;
b7bac953131b57 Hector Martin 2023-03-14  284  	struct apple_mbox *mbox;
b7bac953131b57 Hector Martin 2023-03-14  285  	int ret;
b7bac953131b57 Hector Martin 2023-03-14  286  
b7bac953131b57 Hector Martin 2023-03-14  287  	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
b7bac953131b57 Hector Martin 2023-03-14  288  					 index, &args);
b7bac953131b57 Hector Martin 2023-03-14  289  	if (ret || !args.np)
b7bac953131b57 Hector Martin 2023-03-14 @290  		return ERR_PTR(ret);
b7bac953131b57 Hector Martin 2023-03-14  291  
b7bac953131b57 Hector Martin 2023-03-14  292  	pdev = of_find_device_by_node(args.np);
b7bac953131b57 Hector Martin 2023-03-14  293  	of_node_put(args.np);
b7bac953131b57 Hector Martin 2023-03-14  294  
b7bac953131b57 Hector Martin 2023-03-14  295  	if (!pdev)
b7bac953131b57 Hector Martin 2023-03-14  296  		return ERR_PTR(EPROBE_DEFER);
b7bac953131b57 Hector Martin 2023-03-14  297  
b7bac953131b57 Hector Martin 2023-03-14  298  	mbox = platform_get_drvdata(pdev);
b7bac953131b57 Hector Martin 2023-03-14  299  	if (!mbox)
b7bac953131b57 Hector Martin 2023-03-14  300  		return ERR_PTR(EPROBE_DEFER);
b7bac953131b57 Hector Martin 2023-03-14  301  
b7bac953131b57 Hector Martin 2023-03-14  302  	if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER))
b7bac953131b57 Hector Martin 2023-03-14  303  		return ERR_PTR(ENODEV);
b7bac953131b57 Hector Martin 2023-03-14  304  
b7bac953131b57 Hector Martin 2023-03-14  305  	return mbox;
b7bac953131b57 Hector Martin 2023-03-14  306  }
b7bac953131b57 Hector Martin 2023-03-14  307  EXPORT_SYMBOL(apple_mbox_get);
b7bac953131b57 Hector Martin 2023-03-14  308  

:::::: The code at line 290 was first introduced by commit
:::::: b7bac953131b5769237f66dd4eec916a2b486c05 soc: apple: mailbox: Add ASC/M3 mailbox driver

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
