Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9E13F788A
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 18:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273285; cv=none; b=K125Q9aRrfbIk54upgyhaR3RuRqvQWT1O1/pEORQTNRrfRP64HSP6l1SAR5q4yshwuIm86PleQY6Vybh5yiJuo4zwnX0/RVqJxdXfKcwIUNTn8vkrz+tJCq/jgCFHf9d6KeNlLSVCOC2BUF2aNMZeaO9Slqfs9isTR4Gq8sOL5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273285; c=relaxed/simple;
	bh=SOU/rcy+1eulSTnc65zoY8pg6rGflcNw+HjXWky9RXY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ACeGarc0ySJTEg1wZG6eydzUtAX2Xw1IpCOuKOr21Uay/7y0WaXzDLlGia2EOAV68iAIHr5ACk/eHKek9Ba8nnZ3RFJDUNYriTiFFJJh1sDuADqIaU+1ZNTAP/5YEljxBh63iI+47JogbzoHWTxGIklgbfxG8yfWD36iXVa8Llk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7X6+2Rr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7X6+2Rr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790273284; x=1821809284;
  h=date:from:to:cc:subject:message-id;
  bh=SOU/rcy+1eulSTnc65zoY8pg6rGflcNw+HjXWky9RXY=;
  b=N7X6+2RrXoCIVlL/EB/QER157v32XxObdOxazkl+f3upGIAFekl5jNE1
   K+dUq//a0f7sCSxEKqQyFmyr64UT6+iNJiPQv2V8sTqkwARxcCvqzbIEM
   /sv1hYl0OVZSUMIF8xbt2fZlQgrGOK1NTyKy9dfJk9w6y9/Pqj2IWUKJy
   TkSOqFkEMBx+2RqZyPCBFlX14jRUXe/NKkjsOd3Qqkxyyms1OkZPz0ooF
   Lfbw88YuVsQpL9BO22mLihld7yR/OtBhobxalNoP8+xqjXb+m9RXySFO9
   sIYKHbg6ocqBY8Tef9cmww8CgONSWF4CwcM/NQ8rsytNOZThv3QHJFe3n
   A==;
X-CSE-ConnectionGUID: Eeg5rJFyQ7WdRy0N1ab6pw==
X-CSE-MsgGUID: WF8MzZ23RpCr+poE+vEaAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90118948"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90118948"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:08:04 -0700
X-CSE-ConnectionGUID: ZBFWhIXLSpOppUds21isPA==
X-CSE-MsgGUID: 1pepEmL0QRm85NWdY79ZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272224676"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 24 Sep 2026 11:08:03 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9nrU-000000000OA-1CBQ;
	Thu, 24 Sep 2026 18:08:00 +0000
Date: Thu, 24 Sep 2026 20:07:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-tdx:v7.3-rc4_tdx_connect_phase2.for_upstream 12/44]
 drivers/pci/tsm/core.c:777 pci_tsm_enable_dma() warn: set_bit() takes a bit
 number
Message-ID: <202609242048.Wd3SNMSN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Zhenzhong Duan <zhenzhong.duan@intel.com>

tree:   https://github.com/intel/tdx.git v7.3-rc4_tdx_connect_phase2.for_upstream
head:   69fd611d89afafa408b11f0e1304297433d3d471
commit: c0574e0bc66aaa1e44d4a31e64b79c4197d3285f [12/44] PCI/TSM: Add device interface security DMA enable/disable
:::::: branch date: 14 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-r2202-20260924 (https://download.01.org/0day-ci/archive/20260924/202609242048.Wd3SNMSN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609242048.Wd3SNMSN-lkp@intel.com/

New smatch warnings:
drivers/pci/tsm/core.c:777 pci_tsm_enable_dma() warn: set_bit() takes a bit number
drivers/pci/tsm/core.c:792 pci_tsm_disable_dma() warn: test_and_clear_bit() takes a bit number

Old smatch warnings:
drivers/pci/tsm/core.c:589 pci_tsm_accept() warn: set_bit() takes a bit number

vim +777 drivers/pci/tsm/core.c

da2ae199703c8a Dan Williams 2026-09-24  756  
c0574e0bc66aaa Dan Williams 2026-09-24  757  /* pci_dma_configure() helper to finalize access to private memory. */
c0574e0bc66aaa Dan Williams 2026-09-24  758  int pci_tsm_enable_dma(struct pci_dev *pdev) __must_hold(&pdev->dev->mutex)
c0574e0bc66aaa Dan Williams 2026-09-24  759  {
c0574e0bc66aaa Dan Williams 2026-09-24  760  	struct device *dev = &pdev->dev;
c0574e0bc66aaa Dan Williams 2026-09-24  761  	const struct pci_tsm_ops *ops;
c0574e0bc66aaa Dan Williams 2026-09-24  762  	int rc;
c0574e0bc66aaa Dan Williams 2026-09-24  763  
c0574e0bc66aaa Dan Williams 2026-09-24  764  	if (dev_WARN_ONCE(dev, !dev->driver,
c0574e0bc66aaa Dan Williams 2026-09-24  765  			  "DMA access only finalized at driver attach\n"))
c0574e0bc66aaa Dan Williams 2026-09-24  766  		return -ENXIO;
c0574e0bc66aaa Dan Williams 2026-09-24  767  
c0574e0bc66aaa Dan Williams 2026-09-24  768  	if (!pdev->tsm)
c0574e0bc66aaa Dan Williams 2026-09-24  769  		return 0;
c0574e0bc66aaa Dan Williams 2026-09-24  770  
c0574e0bc66aaa Dan Williams 2026-09-24  771  	ops = to_pci_tsm_ops(pdev->tsm);
c0574e0bc66aaa Dan Williams 2026-09-24  772  	if (!ops->enable_dma)
c0574e0bc66aaa Dan Williams 2026-09-24  773  		return 0;
c0574e0bc66aaa Dan Williams 2026-09-24  774  
c0574e0bc66aaa Dan Williams 2026-09-24  775  	rc = ops->enable_dma(pdev);
c0574e0bc66aaa Dan Williams 2026-09-24  776  	if (rc == 0)
c0574e0bc66aaa Dan Williams 2026-09-24 @777  		set_bit(PCI_TSM_F_DMA, &pdev->tsm->flags);
c0574e0bc66aaa Dan Williams 2026-09-24  778  	return rc;
c0574e0bc66aaa Dan Williams 2026-09-24  779  }
c0574e0bc66aaa Dan Williams 2026-09-24  780  
c0574e0bc66aaa Dan Williams 2026-09-24  781  /*
c0574e0bc66aaa Dan Williams 2026-09-24  782   * pci_dma_cleanup() helper to block private memory access as device is
c0574e0bc66aaa Dan Williams 2026-09-24  783   * going idle
c0574e0bc66aaa Dan Williams 2026-09-24  784   */
c0574e0bc66aaa Dan Williams 2026-09-24  785  void pci_tsm_disable_dma(struct pci_dev *pdev) __must_hold(&pdev->dev->mutex)
c0574e0bc66aaa Dan Williams 2026-09-24  786  {
c0574e0bc66aaa Dan Williams 2026-09-24  787  	const struct pci_tsm_ops *ops;
c0574e0bc66aaa Dan Williams 2026-09-24  788  
c0574e0bc66aaa Dan Williams 2026-09-24  789  	if (!pdev->tsm)
c0574e0bc66aaa Dan Williams 2026-09-24  790  		return;
c0574e0bc66aaa Dan Williams 2026-09-24  791  
c0574e0bc66aaa Dan Williams 2026-09-24 @792  	if (!test_and_clear_bit(PCI_TSM_F_DMA, &pdev->tsm->flags))
c0574e0bc66aaa Dan Williams 2026-09-24  793  		return;
c0574e0bc66aaa Dan Williams 2026-09-24  794  
c0574e0bc66aaa Dan Williams 2026-09-24  795  	ops = to_pci_tsm_ops(pdev->tsm);
c0574e0bc66aaa Dan Williams 2026-09-24  796  	ops->disable_dma(pdev);
c0574e0bc66aaa Dan Williams 2026-09-24  797  }
c0574e0bc66aaa Dan Williams 2026-09-24  798  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
