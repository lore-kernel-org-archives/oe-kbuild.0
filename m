Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B142921A959
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733743709; cv=none; b=Z+53rCOkbV8wNz/Rbw9gOxeHiYDfY2RXaReoId3RMgGaHFrSRZ45W1BOJ5DtespX7tUB6OCyDOAiebZy4shbo7kFpUZlmZlUsJhQ/g6OSobeBl4lPX/XzcIHiWJwkXfYbnPe2zMnST+0g53S2AlB2sKQXGLu1/PudFoonhKGww8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733743709; c=relaxed/simple;
	bh=DGLHIdcZWy+Hyx4VobKXR3j7SyTGj6OANiDkAu0viOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n4HlfgWdugvsVGO/paYjKe6eWRgKP6CWw5H7+77fBKlaqkvbLQcjh67qpOwDal/9qiWemY4jVDD0k2il6yZBPerMq+gvRbbr9u4VYRE09b2lqvVe7/z5KRlyzFoJKSaYtlyev9LE7kkVMngGd1T7PVnEbwrtQ6phbL4rTbdeRik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asp1CcbO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asp1CcbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733743707; x=1765279707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DGLHIdcZWy+Hyx4VobKXR3j7SyTGj6OANiDkAu0viOA=;
  b=asp1CcbOL591rJUt2JSYmJKrN9SamF8tw1ur8yzIruy6XaC0eMKUy2qL
   BMhPG0u67OSDSgXRIgXa2ANaJkPb/SLU2vYRjrIY468iNWyGjgpYvRiyJ
   GEnb7+mX7NME0NP+YHHso+2EyUuCT0U9EdCnBQcDIDP+jHggiohfuyPd+
   TsvqVwPSPgG0OVMfvn5thgOOtCJ3FLFRBPxjYunLnj9UP/AzW5yld0obm
   HAGeupXH4yCK2Onpw33cR3KCSnUtlowq1DPgoNBWBG+LqM/MtfXL7TAfT
   xr2hjTimKJZ+Eip1G0j8qvQMVqUFPl5jWIciAINs2AeVpqZ8k86dc7svq
   w==;
X-CSE-ConnectionGUID: xHCdERd0SF6RrPHUtCZOFg==
X-CSE-MsgGUID: /4UQww2fRSutyvamLgTAYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="45435544"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="45435544"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 03:28:26 -0800
X-CSE-ConnectionGUID: vmn7ZSzkSMuIs98sQ+Wdmg==
X-CSE-MsgGUID: 12XjiKyHTzO6XUXaDoOv6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="95851082"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Dec 2024 03:28:25 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKbw5-0004Gn-2d;
	Mon, 09 Dec 2024 11:28:21 +0000
Date: Mon, 9 Dec 2024 19:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:815
 netxen_setup_pci_map() warn: 'ahw->pci_base0' from ioremap() not released on
 lines: 815.
Message-ID: <202412091944.DMm9sdBA-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
commit: c0d94aa54bd893bd41ca35e2a2de332742bb167d x86: Clean up ioremap()
date:   5 years ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 years ago
config: i386-randconfig-141-20241120 (https://download.01.org/0day-ci/archive/20241209/202412091944.DMm9sdBA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412091944.DMm9sdBA-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:815 netxen_setup_pci_map() warn: 'ahw->pci_base0' from ioremap() not released on lines: 815.
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:815 netxen_setup_pci_map() warn: 'ahw->pci_base1' from ioremap() not released on lines: 815.
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:815 netxen_setup_pci_map() warn: 'ahw->pci_base1' from ioremap() not released on lines: 815.
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:815 netxen_setup_pci_map() warn: 'ahw->pci_base2' from ioremap() not released on lines: 815.
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:815 netxen_setup_pci_map() warn: 'ahw->pci_base2' from ioremap() not released on lines: 815.

Old smatch warnings:
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:737 netxen_setup_pci_map() warn: consider using resource_size() here
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:738 netxen_setup_pci_map() warn: consider using resource_size() here
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:740 netxen_setup_pci_map() warn: consider using resource_size() here
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:753 netxen_setup_pci_map() warn: consider using resource_size() here
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:754 netxen_setup_pci_map() warn: consider using resource_size() here
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:850 netxen_check_options() warn: inconsistent indenting

vim +815 drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c

97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  708  
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  709  static int
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  710  netxen_setup_pci_map(struct netxen_adapter *adapter)
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  711  {
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  712  	void __iomem *db_ptr = NULL;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  713  
71fb62fb6dd4ed drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-10-13  714  	resource_size_t mem_base, db_base;
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  715  	unsigned long mem_len, db_len = 0;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  716  
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  717  	struct pci_dev *pdev = adapter->pdev;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  718  	int pci_func = adapter->ahw.pci_func;
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  719  	struct netxen_hardware_context *ahw = &adapter->ahw;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  720  
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  721  	int err = 0;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  722  
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  723  	/*
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  724  	 * Set the CRB window to invalid. If any register in window 0 is
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  725  	 * accessed it should set the window to 0 and then reset it to 1.
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  726  	 */
907fa1201c76f4 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-10-13  727  	adapter->ahw.crb_win = -1;
47abe35610cbbf drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-10-13  728  	adapter->ahw.ocm_win = -1;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  729  
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  730  	/* remap phys address */
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  731  	mem_base = pci_resource_start(pdev, 0);	/* 0 is for BAR 0 */
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  732  	mem_len = pci_resource_len(pdev, 0);
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  733  
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  734  	/* 128 Meg of memory */
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  735  	if (mem_len == NETXEN_PCI_128MB_SIZE) {
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  736  
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  737  		ahw->pci_base0 = ioremap(mem_base, FIRST_PAGE_GROUP_SIZE);
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  738  		ahw->pci_base1 = ioremap(mem_base + SECOND_PAGE_GROUP_START,
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  739  				SECOND_PAGE_GROUP_SIZE);
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  740  		ahw->pci_base2 = ioremap(mem_base + THIRD_PAGE_GROUP_START,
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  741  				THIRD_PAGE_GROUP_SIZE);
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  742  		if (ahw->pci_base0 == NULL || ahw->pci_base1 == NULL ||
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  743  						ahw->pci_base2 == NULL) {
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  744  			dev_err(&pdev->dev, "failed to map PCI bar 0\n");
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  745  			err = -EIO;
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  746  			goto err_out;
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  747  		}
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  748  
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  749  		ahw->pci_len0 = FIRST_PAGE_GROUP_SIZE;
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  750  
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  751  	} else if (mem_len == NETXEN_PCI_32MB_SIZE) {
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  752  
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  753  		ahw->pci_base1 = ioremap(mem_base, SECOND_PAGE_GROUP_SIZE);
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  754  		ahw->pci_base2 = ioremap(mem_base + THIRD_PAGE_GROUP_START -
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  755  			SECOND_PAGE_GROUP_START, THIRD_PAGE_GROUP_SIZE);
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  756  		if (ahw->pci_base1 == NULL || ahw->pci_base2 == NULL) {
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  757  			dev_err(&pdev->dev, "failed to map PCI bar 0\n");
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  758  			err = -EIO;
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  759  			goto err_out;
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  760  		}
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  761  
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  762  	} else if (mem_len == NETXEN_PCI_2MB_SIZE) {
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  763  
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  764  		ahw->pci_base0 = pci_ioremap_bar(pdev, 0);
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  765  		if (ahw->pci_base0 == NULL) {
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  766  			dev_err(&pdev->dev, "failed to map PCI bar 0\n");
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  767  			return -EIO;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  768  		}
afbe5cd6c40e0f drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2010-03-26  769  		ahw->pci_len0 = mem_len;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  770  	} else {
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  771  		return -EIO;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  772  	}
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  773  
195c5f98294078 drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2009-09-05  774  	netxen_setup_hwops(adapter);
195c5f98294078 drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2009-09-05  775  
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  776  	dev_info(&pdev->dev, "%dMB memory map\n", (int)(mem_len>>20));
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  777  
6abb4b83eac25d drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2009-10-16  778  	if (NX_IS_REVISION_P3P(adapter->ahw.revision_id)) {
6abb4b83eac25d drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2009-10-16  779  		adapter->ahw.ocm_win_crb = netxen_get_ioaddr(adapter,
6abb4b83eac25d drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2009-10-16  780  			NETXEN_PCIX_PS_REG(PCIX_OCM_WINDOW_REG(pci_func)));
6abb4b83eac25d drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2009-10-16  781  
6abb4b83eac25d drivers/net/netxen/netxen_nic_main.c Amit Kumar Salecha 2009-10-16  782  	} else if (NX_IS_REVISION_P3(adapter->ahw.revision_id)) {
47abe35610cbbf drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-10-13  783  		adapter->ahw.ocm_win_crb = netxen_get_ioaddr(adapter,
47abe35610cbbf drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-10-13  784  			NETXEN_PCIX_PS_REG(PCIE_MN_WINDOW_REG(pci_func)));
47abe35610cbbf drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-10-13  785  	}
47abe35610cbbf drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-10-13  786  
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  787  	if (NX_IS_REVISION_P3(adapter->ahw.revision_id))
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  788  		goto skip_doorbell;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  789  
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  790  	db_base = pci_resource_start(pdev, 4);	/* doorbell is on bar 4 */
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  791  	db_len = pci_resource_len(pdev, 4);
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  792  
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  793  	if (db_len == 0) {
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  794  		printk(KERN_ERR "%s: doorbell is disabled\n",
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  795  				netxen_nic_driver_name);
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  796  		err = -EIO;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  797  		goto err_out;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  798  	}
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  799  
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  800  	db_ptr = ioremap(db_base, NETXEN_DB_MAPSIZE_BYTES);
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  801  	if (!db_ptr) {
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  802  		printk(KERN_ERR "%s: Failed to allocate doorbell map.",
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  803  				netxen_nic_driver_name);
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  804  		err = -EIO;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  805  		goto err_out;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  806  	}
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  807  
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  808  skip_doorbell:
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  809  	adapter->ahw.db_base = db_ptr;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  810  	adapter->ahw.db_len = db_len;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  811  	return 0;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  812  
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  813  err_out:
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  814  	netxen_cleanup_pci_map(adapter);
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24 @815  	return err;
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  816  }
97daee83b0fd23 drivers/net/netxen/netxen_nic_main.c Dhananjay Phadke   2009-02-24  817  

:::::: The code at line 815 was first introduced by commit
:::::: 97daee83b0fd2361cc70be6f3d6ecda69def2103 netxen: refactor pci probe

:::::: TO: Dhananjay Phadke <dhananjay@netxen.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
