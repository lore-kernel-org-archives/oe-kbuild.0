Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2913F256A
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Feb 2024 01:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707786852; cv=none; b=h2SCDzUi9Tsp0RrczVJyLnNYMrB0/hncgbaAfQ/z5d5RNxZUFI4pN+QD4DP0cPXvx8Jlmnk7SpdzRRf2OLzwYKP6SBPI+6849J3SE8b+jsDdJ4IfOAIbVZvUFXsmUfKN5sH9Y/qSfDz1MDLauuvt+XiCfCzt0e6JD/PAq899xUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707786852; c=relaxed/simple;
	bh=V06tzA9hSzdJ4aFRiuJxn1t8v8n4DDX3vbdSWhg8gnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fDTjtx8mu/CuNe5VK+Il2a6jE5AtubjWHrJPXBAcyQurOBddj1PQuAwl27vQDb4Q57UVMeK8Y4ov5EMlIN1sy60kmGPPak9zzo80O8m/EZyurzoV3EZvUrHcJSlGRcm2xJkp+B5p2u5LKzvHd446IfFf2o+fCWITao+2tQa9CCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WURP1/34; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WURP1/34"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707786851; x=1739322851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V06tzA9hSzdJ4aFRiuJxn1t8v8n4DDX3vbdSWhg8gnI=;
  b=WURP1/34Y5hkxYhbZWPJyr1w2D9FG7qgecdk/ExGgg3mlnO+FMfn9ygn
   omsK6ptsE8pwC2TgpckfjTW9kvHXq6W3ZDXOFg7KquGBPeUxV15flR0WT
   gymAEvS3VqLLpCMRt6pD3+C48clZdhc1T9bx4pXgyY0OrpOBP/3VkOegh
   TcvDj+uEAp7LqCHi3PVEnLk4ff761pGwvH2eMMpKNglVVto3ZfQJ6lqH/
   hKRBWl1n7Bl9FPBizPKyVno1RaaXQAkHum9s0Xb4b2c4Nl3jloGLN+1/A
   zzoLvpOhEIpQETx+EKphxYcRn27zZnzJ1kIJYRAl7QuVx4F25m1mmd6G9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12340989"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="12340989"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 17:14:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="7372557"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Feb 2024 17:14:08 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZhN8-0007RA-0p;
	Tue, 13 Feb 2024 01:14:06 +0000
Date: Tue, 13 Feb 2024 09:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [l1k:spdm-future 11/18] drivers/pci/cma.c:200:11-12: WARNING
 opportunity for min()
Message-ID: <202402130928.VApcSvtm-lkp@intel.com>
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
TO: Lukas Wunner <lukas@wunner.de>

tree:   https://github.com/l1k/linux spdm-future
head:   cfa69b23f279ca186df9fe36692ccb6ee8650d33
commit: a767893788f626221854db85d7266d280627d797 [11/18] PCI/CMA: Reauthenticate devices on reset and resume
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arc-randconfig-r063-20240213 (https://download.01.org/0day-ci/archive/20240213/202402130928.VApcSvtm-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402130928.VApcSvtm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pci/cma.c:200:11-12: WARNING opportunity for min()

vim +200 drivers/pci/cma.c

a767893788f626 Lukas Wunner     2023-01-16  188  
a767893788f626 Lukas Wunner     2023-01-16  189  int pci_cma_reauthenticate(struct pci_dev *pdev)
a767893788f626 Lukas Wunner     2023-01-16  190  {
a767893788f626 Lukas Wunner     2023-01-16  191  	int rc;
a767893788f626 Lukas Wunner     2023-01-16  192  
a767893788f626 Lukas Wunner     2023-01-16  193  	if (!pdev->cma_capable)
a767893788f626 Lukas Wunner     2023-01-16  194  		return -ENOTTY;
a767893788f626 Lukas Wunner     2023-01-16  195  
a767893788f626 Lukas Wunner     2023-01-16  196  	rc = spdm_authenticate(pdev->spdm_state);
a767893788f626 Lukas Wunner     2023-01-16  197  	if (rc >= 0)
a767893788f626 Lukas Wunner     2023-01-16  198  		pci_info(pdev, "authenticated with certificate slot %d\n", rc);
a767893788f626 Lukas Wunner     2023-01-16  199  
a767893788f626 Lukas Wunner     2023-01-16 @200  	return rc < 0 ? rc : 0;
5f24e7f0eed935 Jonathan Cameron 2022-09-06  201  }
5f24e7f0eed935 Jonathan Cameron 2022-09-06  202  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
