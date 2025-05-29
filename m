Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002AC18DB03
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748534908; cv=none; b=mx+ACglXA3sz7o5MKJdNqimHf9Dwywo4sQh+69uuUQdu2mZwSphMPLlU7RWDDcbOkW8igTF3pxjpLk0uVf6JTH7hk4QsVJ47rvOslOhKFpkH8sEgXpPECjW+/aGEVVh+9ApWo7ixMXkOivrCZVWg98OFWe36AHyWMPqX1yKEjEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748534908; c=relaxed/simple;
	bh=on3NErWurNHx6MogLAT0cjGjBfR8NNC9cBpLuQeJE0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I4qb/VhyKDlhOoqznbgX3FEAv+6DFK0qkxeebYYU37re78RPDekMOQY9Y2AOh1U15/7WORK/UmUNvX//L/SWO6mDJAUOgeJ/kYhLbkrY7bfOvlGJNFw1dJAg64emmwnVnzbP7rd+txNvhve36Ufa1CZsEF54NlbnrrQ1VQ9KGXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xdo1DzNf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xdo1DzNf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748534907; x=1780070907;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=on3NErWurNHx6MogLAT0cjGjBfR8NNC9cBpLuQeJE0M=;
  b=Xdo1DzNf4i4NS3uhPfk3hu30rTlvWDDyIGmPH8DFRbWkkTHDoRVlL1/S
   2NI7OBl+6k27789qp6HJn+PoTmCQ1jmthSG4uHAsC1lD9mDjlSe2dYrCH
   yp5Bg5oOp1g9xGKoqgUumv3sre/f4llaV9TI1Uv5fIzl9yR/Dm38Yd3vA
   awRYTt7qjn9JpYVXrQ2qADO+wQczgIgPNhftQX9W0rSNW3F/JIB2MHmCy
   A30zBVTk5ScyQwOqPUhja59IIWAuvR0q0yEd8NcjbY2kttaX5geFIAcwN
   bnnhLlTAoY+CrNtrraamXQ7nxiAxiMOajF4Fdw92+xjei8UGwUpgmURwi
   w==;
X-CSE-ConnectionGUID: 2zOKjSbmReqqSHAluCaJIQ==
X-CSE-MsgGUID: UPRh94U9TouipzOWeDw7CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="38229039"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="38229039"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 09:08:21 -0700
X-CSE-ConnectionGUID: aayOoVZKQJ6uzOJ+5sJHjg==
X-CSE-MsgGUID: CKGo8n2nRre8oinKOa3jsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="143940731"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2025 09:07:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKfmx-000WrM-0N;
	Thu, 29 May 2025 16:07:27 +0000
Date: Fri, 30 May 2025 00:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10504/13944]
 drivers/pci/controller/dwc/pcie-qcom.c:1575 qcom_pcie_reset_slot() warn:
 missing unwind goto?
Message-ID: <202505300021.GxvqDH44-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
CC: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2a628f951ed54c30a232230b5b58349d2a8dbb11
commit: b5c714170a4dd73154ae7bf1d01d19e267e668a3 [10504/13944] PCI: qcom: Add support for resetting the slot due to link down event
:::::: branch date: 9 hours ago
:::::: commit date: 2 weeks ago
config: loongarch-randconfig-r073-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300021.GxvqDH44-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505300021.GxvqDH44-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pcie-qcom.c:1575 qcom_pcie_reset_slot() warn: missing unwind goto?

vim +1575 drivers/pci/controller/dwc/pcie-qcom.c

c4860af88d0cb1 Johan Hovold          2022-11-02  1535  
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1536  static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1537  				  struct pci_dev *pdev)
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1538  {
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1539  	struct pci_bus *bus = bridge->bus;
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1540  	struct dw_pcie_rp *pp = bus->sysdata;
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1541  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1542  	struct qcom_pcie *pcie = to_qcom_pcie(pci);
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1543  	struct device *dev = pcie->pci->dev;
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1544  	u32 val;
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1545  	int ret;
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1546  
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1547  	/* Wait for the pending transactions to be completed */
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1548  	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_STATUS, val,
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1549  					 val & FLUSH_COMPLETED, 10,
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1550  					 FLUSH_TIMEOUT_US);
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1551  	if (ret) {
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1552  		dev_err(dev, "Flush completion failed: %d\n", ret);
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1553  		goto err_host_deinit;
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1554  	}
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1555  
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1556  	/* Clear the FLUSH_MODE to allow the core to be reset */
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1557  	val = readl(pcie->parf + PARF_LTSSM);
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1558  	val |= SW_CLEAR_FLUSH_MODE;
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1559  	writel(val, pcie->parf + PARF_LTSSM);
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1560  
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1561  	/* Wait for the FLUSH_MODE to clear */
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1562  	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_LTSSM, val,
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1563  					 !(val & FLUSH_MODE), 10,
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1564  					 FLUSH_TIMEOUT_US);
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1565  	if (ret) {
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1566  		dev_err(dev, "Flush mode clear failed: %d\n", ret);
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1567  		goto err_host_deinit;
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1568  	}
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1569  
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1570  	qcom_pcie_host_deinit(pp);
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1571  
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1572  	ret = qcom_pcie_host_init(pp);
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1573  	if (ret) {
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1574  		dev_err(dev, "Host init failed\n");
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08 @1575  		return ret;
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1576  	}
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1577  
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1578  	ret = dw_pcie_setup_rc(pp);
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1579  	if (ret)
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1580  		goto err_host_deinit;
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1581  
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1582  	/*
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1583  	 * Re-enable global IRQ events as the PARF_INT_ALL_MASK register is
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1584  	 * non-sticky.
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1585  	 */
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1586  	if (pcie->global_irq)
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1587  		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1588  			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1589  
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1590  	qcom_pcie_start_link(pci);
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1591  
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1592  	dev_dbg(dev, "Slot reset completed\n");
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1593  
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1594  	return 0;
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1595  
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1596  err_host_deinit:
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1597  	qcom_pcie_host_deinit(pp);
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1598  
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1599  	return ret;
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1600  }
b5c714170a4dd7 Manivannan Sadhasivam 2025-05-08  1601  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
