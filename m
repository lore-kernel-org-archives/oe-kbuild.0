Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55D74AA033
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269564; cv=none; b=rcP8Om4pMSDFEJWXFRh8JEtY/KwRKP9Q+X4g0iHLI+QMAouII/0k/p7t7AJO3IkjbdwxbNTmx3LLnYDE/cAxgv1nnW57r5VI8Q6Buuc89LXP+3n4OPOks4xhMZ7QPetXYRMAEmm95NR83k8qJiEgWrtfcW2YJq0CbODel2/ppa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269564; c=relaxed/simple;
	bh=65pYsSQi7tBc0SbEZZh3xGh7jasvR7uVhpC9eV5vkac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TDHXBODlu0ZDqGnt/JRXG2IfBe6SWWDsK7js+LasuFKGEG/THdD+/Ou3r7V9ScV7Hwo1PLIcNQgSYTyIXSireQ/HcssE62ec0x0tWFGokX0Nwf1ch2HCuxy2+zrBZHq+03ycDuQrnmvIytP2C5R61qG2jGEjhlyUtMMjfA5gDcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNa3c16H; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNa3c16H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790269563; x=1821805563;
  h=date:from:to:cc:subject:message-id;
  bh=65pYsSQi7tBc0SbEZZh3xGh7jasvR7uVhpC9eV5vkac=;
  b=LNa3c16Hp5XcJdgDe+LiFIuCR2DFAqORcGTyJDtwxfLLLjQqsqa4xzNd
   HFjkybipFWY6Ej3U4nrkFkDi0Ss7nY193K3SE+BiPSZBjkO53adFLnu0h
   qDl/2N0D/vxPO14Uiz2LzAUVLvv04RUyJw36pJ/6IGE0Le597iY2jqcI+
   NMILbNQpCgV6QZjCY05d1NFuh5TabP0jW6AAMXddFfVqx+fvj4wBEEHvY
   uFoPw2hiMRXeiMfZ0mAN7zUJnnkHGiWGD5yKWu0N7uRYNb/U20UU0cPnR
   sLSwZDqVxLF6Q1rZ6elq+NnNVIsxvrnh//MUQwD2Vj3PWVYauLCZ5RFjl
   Q==;
X-CSE-ConnectionGUID: RUltB0SgTnWsXvIjmt0f4g==
X-CSE-MsgGUID: 3iZzyXzaTVS66AuAFqXnpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93769005"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="93769005"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 10:06:03 -0700
X-CSE-ConnectionGUID: /0th6XNSSRq5b+CWEat1uA==
X-CSE-MsgGUID: fIBH4xCNR02sKNY+Sm7mXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="303604614"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 24 Sep 2026 10:05:46 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9mtE-000000000Ne-0VHu;
	Thu, 24 Sep 2026 17:05:44 +0000
Date: Thu, 24 Sep 2026 19:05:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-tdx:v7.3-rc4_tdx_connect_phase2.for_upstream 11/44]
 drivers/pci/tsm/core.c:589 pci_tsm_accept() warn: set_bit() takes a bit
 number
Message-ID: <202609241930.KhG7E8hz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Zhenzhong Duan <zhenzhong.duan@intel.com>
CC: Xu Yilun <yilun.xu@linux.intel.com>
CC: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>

tree:   https://github.com/intel/tdx.git v7.3-rc4_tdx_connect_phase2.for_upstream
head:   69fd611d89afafa408b11f0e1304297433d3d471
commit: 36ae7ba2d3e2102d24370481ce968489667bff26 [11/44] PCI/TSM: Add device interface security RUN support
:::::: branch date: 13 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-r2202-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241930.KhG7E8hz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609241930.KhG7E8hz-lkp@intel.com/

smatch warnings:
drivers/pci/tsm/core.c:589 pci_tsm_accept() warn: set_bit() takes a bit number

vim +589 drivers/pci/tsm/core.c

f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  554  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  555  /**
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  556   * pci_tsm_accept() - accept a device for private MMIO operation
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  557   * @pdev: PCI device to accept
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  558   *
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  559   * "Accept" transitions the device interface to the RUN state, it is
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  560   * only suitable to make that transition from a known idle (no active
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  561   * DMA / MMIO mappings) state. The "driver detached" state is a coarse
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  562   * way to assert that requirement.
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  563   */
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  564  static int pci_tsm_accept(struct pci_dev *pdev)
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  565  {
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  566  	int rc;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  567  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  568  	ACQUIRE(rwsem_read_intr, lock)(&pci_tsm_rwsem);
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  569  	if ((rc = ACQUIRE_ERR(rwsem_read_intr, &lock)))
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  570  		return rc;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  571  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  572  	if (!pdev->tsm)
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  573  		return -EINVAL;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  574  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  575  	ACQUIRE(device_intr, dev_lock)(&pdev->dev);
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  576  	if ((rc = ACQUIRE_ERR(device_intr, &dev_lock)))
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  577  		return rc;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  578  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  579  	if (pdev->dev.driver)
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  580  		return -EBUSY;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  581  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  582  	if (test_bit(PCI_TSM_F_ACCEPT, &pdev->tsm->flags))
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  583  		return 0;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  584  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  585  	rc = to_pci_tsm_ops(pdev->tsm)->run(pdev);
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  586  	if (rc)
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  587  		return rc;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  588  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24 @589  	set_bit(PCI_TSM_F_ACCEPT, &pdev->tsm->flags);
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  590  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  591  	return 0;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  592  }
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  593  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
