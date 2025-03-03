Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CF41EBFF9
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Mar 2025 21:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741038983; cv=none; b=UEue/UhflKG9RRCwfvsCMr/Hi0aum88Mccfb/B+3kUORnBEisu+ChURwsnW2YUpaiHQOz82ePWsuvsXmqnDkJtgApLTuJ8KHU4bcPfV++4muqg+ZmnCLk4MCp0Y6l+zQf++9pQivMegIhcdf2mYyXGCEonHWavSvfhYT44F6NBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741038983; c=relaxed/simple;
	bh=oTg9WngwoklRhEDFs7LRRUVD8JHNfHXXkQb0TFD37Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fdTsoVE28IfXQwSLxSyhXqmorRibFlZ9bcRWRjKahuiSgP8n1nJ2iPuJMqzQqWeh3etYbEy6gPaDkdkEoNfl7se3YZvW3MGglC0dISFA40uBxMhKJKB0ZMNM5oBPH5YRtQqGvg6DthKEha1GwGDmJyD+N2UPs3dtzSGSnolA62Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbtJHpF7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbtJHpF7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741038980; x=1772574980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oTg9WngwoklRhEDFs7LRRUVD8JHNfHXXkQb0TFD37Y8=;
  b=TbtJHpF7CF5Utd0/AQuqGcIszIMymGrp3PEYoXy82hK6Y1czGlBiLGHt
   uK2f6VFM41dhbaoNKRaH/i4AcVFKFpSw1GFrUBjFnl599xofOcXpBtHs8
   hgaqqMoxskZc45nbdqxD8UMG/OpNGPg9nDYoBaBmW6vb6hupFWFchw0w1
   /N0J1DaqokVWkkA+au4R5Y2B+jl4E9T7epURdbwCvupvV8tHA6hzE94lu
   0aZ46DzeemAMPW+bTvcpcc+f0ntEF+zRN/5o8O0I37UCHWklJj+6nyZpf
   DkD4i4xsSVpe486ospbrvzRMT7yzOX8zCmX08K7HMIaonxr0n3mRsCk05
   A==;
X-CSE-ConnectionGUID: D8HUBrMgSJusR5bv+3Dqtw==
X-CSE-MsgGUID: s2SiS5EXRH+HdDj69zLqvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="64379861"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="64379861"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 13:56:19 -0800
X-CSE-ConnectionGUID: qALCe2qCQBejP7o2jZUilw==
X-CSE-MsgGUID: ZRI8MWphSoyouq9sHEt/lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="118653190"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2025 13:56:17 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpDlm-000IyE-2w;
	Mon, 03 Mar 2025 21:56:14 +0000
Date: Tue, 4 Mar 2025 05:56:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] PCI: qcom: Add support for retraining the link due
 to link down event
Message-ID: <202503040526.4JdFuLaA-lkp@intel.com>
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
In-Reply-To: <20250221172309.120009-3-manivannan.sadhasivam@linaro.org>
References: <20250221172309.120009-3-manivannan.sadhasivam@linaro.org>
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
TO: lpieralisi@kernel.org
TO: kw@linux.com
TO: bhelgaas@google.com
CC: linux-pci@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: dingwei@marvell.com
CC: cassel@kernel.org
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Hi Manivannan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.14-rc5 next-20250303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam/PCI-Add-pci_host_bridge_handle_link_down-API-to-handle-the-PCI-link-down-event/20250222-012526
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250221172309.120009-3-manivannan.sadhasivam%40linaro.org
patch subject: [PATCH 2/2] PCI: qcom: Add support for retraining the link due to link down event
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: sparc64-randconfig-r071-20250303 (https://download.01.org/0day-ci/archive/20250304/202503040526.4JdFuLaA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503040526.4JdFuLaA-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pcie-qcom.c:1352 qcom_pcie_retrain_link() warn: missing unwind goto?

vim +1352 drivers/pci/controller/dwc/pcie-qcom.c

82a823833f4e37 drivers/pci/host/pcie-qcom.c           Stanimir Varbanov     2015-12-18  1314  
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1315  static int qcom_pcie_retrain_link(struct pci_bus *bus)
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1316  {
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1317  	struct dw_pcie_rp *pp = bus->sysdata;
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1318  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1319  	struct qcom_pcie *pcie = to_qcom_pcie(pci);
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1320  	struct device *dev = pcie->pci->dev;
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1321  	u32 val;
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1322  	int ret;
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1323  
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1324  	/* Wait for the pending transactions to be completed */
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1325  	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_STATUS, val,
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1326  					 val & FLUSH_COMPLETED, 10,
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1327  					 FLUSH_TIMEOUT_US);
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1328  	if (ret) {
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1329  		dev_err(dev, "Flush completion failed: %d\n", ret);
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1330  		goto err_host_deinit;
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1331  	}
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1332  
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1333  	/* Clear the FLUSH_MODE to allow the core to be reset */
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1334  	val = readl(pcie->parf + PARF_LTSSM);
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1335  	val |= SW_CLEAR_FLUSH_MODE;
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1336  	writel(val, pcie->parf + PARF_LTSSM);
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1337  
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1338  	/* Wait for the FLUSH_MODE to clear */
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1339  	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_LTSSM, val,
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1340  					 !(val & FLUSH_MODE), 10,
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1341  					 FLUSH_TIMEOUT_US);
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1342  	if (ret) {
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1343  		dev_err(dev, "Flush mode clear failed: %d\n", ret);
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1344  		goto err_host_deinit;
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1345  	}
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1346  
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1347  	qcom_pcie_host_deinit(pp);
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1348  
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1349  	ret = qcom_pcie_host_init(pp);
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1350  	if (ret) {
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1351  		dev_err(dev, "Host init failed\n");
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21 @1352  		return ret;
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1353  	}
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1354  
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1355  	ret = dw_pcie_setup_rc(pp);
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1356  	if (ret)
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1357  		goto err_host_deinit;
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1358  
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1359  	/*
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1360  	 * Re-enable global IRQ events as the PARF_INT_ALL_MASK register is
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1361  	 * non-sticky.
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1362  	 */
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1363  	if (pcie->global_irq)
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1364  		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1365  			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1366  
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1367  	qcom_pcie_start_link(pci);
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1368  
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1369  	return 0;
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1370  
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1371  err_host_deinit:
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1372  	qcom_pcie_host_deinit(pp);
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1373  
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1374  	return ret;
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1375  }
6d1377b2f82331 drivers/pci/controller/dwc/pcie-qcom.c Manivannan Sadhasivam 2025-02-21  1376  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
