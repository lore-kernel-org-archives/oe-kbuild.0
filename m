Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3642D6400
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Nov 2025 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762700640; cv=none; b=iK20YK6K9EKGda9lleV4jVYZulR8IP+sGJklPBROKppij5OTgOPHElRvjohFgv1eNUCUAznQoKGXUuShBxGRwG4sj3xcDVH5W2alMV8r4q+rxhx+HiI6EQc+w0cPHRYf/3PFmTZ+Cq+FdNCvR6CxUmkPjOjJu4CFaCvEvbfJT3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762700640; c=relaxed/simple;
	bh=CEdha+MsJ7O+s+14RRBx9O5D5tNI7D3vK8GI3xMD99M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UTUpHFvkwyJ1EkxP8AgYxrheiyrhEBBBCA1pfBl4ow3KLExDQQhdGR08IGbyThh72nMdj6oKDvpn7LY6l2df6gwRTI8Ur4BDKe/8h/6LOIFk4NOiV6vvLB3tqtHvx1QNdCbjXnamleoXxhundOZ2F2VqS0lIKtqvl4MmOlHEHsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtBbac0w; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtBbac0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762700639; x=1794236639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CEdha+MsJ7O+s+14RRBx9O5D5tNI7D3vK8GI3xMD99M=;
  b=EtBbac0wIK9tCBQ8XaAWJPSmF1oUByc4glIJIcczMRkMnYU5pZ7OUluB
   OCFdDIY1tIwxj3umaJQuWANU2mc2eN0uYtbM4QN9AxcMbixrLFXYHnFqF
   A2sIDOX5GK5JHlHHpow1AhfC0ioAvYy/TlrWH90yayc15TGTE1adP0e7y
   IZJvXpusMNx/9JEgJp0R+a+3taG07Rix1/3qAl51FdIMcMcTI3Mj9/+99
   qVwtSn2NR+aRbxw80hsQaM4dS7I3BZbRFA1ghh939G2dtw3NNqKfcAKEH
   RROg3tfGQcikDnq8ty5h/50Sy4P/9vy0IVlhstO1TaGX+qulhQ3BMwSrs
   A==;
X-CSE-ConnectionGUID: 5eh7zfUtSMuwpGjbEgqtxA==
X-CSE-MsgGUID: IFPiHyXtT1qt5UX6zpfBkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64472580"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="64472580"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 07:03:59 -0800
X-CSE-ConnectionGUID: tbMX6SuwRHKnOnYoBW8osw==
X-CSE-MsgGUID: qd9IrQ7BQTOBePprsQnFNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="187724519"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Nov 2025 07:03:57 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vI6xO-00025H-36;
	Sun, 09 Nov 2025 15:03:54 +0000
Date: Sun, 9 Nov 2025 23:03:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pci:controller/dwc 4/4]
 drivers/pci/controller/dwc/pcie-designware-host.c:1178
 dw_pcie_suspend_noirq() error: uninitialized symbol 'ret'.
Message-ID: <202511092213.AlpOPvkg-lkp@intel.com>
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
CC: linux-pci@vger.kernel.org
TO: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/dwc
head:   e8fe6b3413a1b92b4bc0f0182ea4b49ee369541b
commit: e8fe6b3413a1b92b4bc0f0182ea4b49ee369541b [4/4] PCI: dwc: Check for the device presence during suspend and resume
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-161-20251109 (https://download.01.org/0day-ci/archive/20251109/202511092213.AlpOPvkg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511092213.AlpOPvkg-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pcie-designware-host.c:1178 dw_pcie_suspend_noirq() error: uninitialized symbol 'ret'.

vim +/ret +1178 drivers/pci/controller/dwc/pcie-designware-host.c

e1a4ec1a9520bf Frank Li              2024-04-18  1128  
4774faf854f534 Frank Li              2023-08-21  1129  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
4774faf854f534 Frank Li              2023-08-21  1130  {
4774faf854f534 Frank Li              2023-08-21  1131  	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
4774faf854f534 Frank Li              2023-08-21  1132  	u32 val;
112aba9a79345a Richard Zhu           2024-12-10  1133  	int ret;
4774faf854f534 Frank Li              2023-08-21  1134  
e8fe6b3413a1b9 Manivannan Sadhasivam 2025-11-07  1135  	if (!pci_root_ports_have_device(pci->pp.bridge->bus))
e8fe6b3413a1b9 Manivannan Sadhasivam 2025-11-07  1136  		goto stop_link;
e8fe6b3413a1b9 Manivannan Sadhasivam 2025-11-07  1137  
4774faf854f534 Frank Li              2023-08-21  1138  	/*
4774faf854f534 Frank Li              2023-08-21  1139  	 * If L1SS is supported, then do not put the link into L2 as some
4774faf854f534 Frank Li              2023-08-21  1140  	 * devices such as NVMe expect low resume latency.
4774faf854f534 Frank Li              2023-08-21  1141  	 */
4774faf854f534 Frank Li              2023-08-21  1142  	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
4774faf854f534 Frank Li              2023-08-21  1143  		return 0;
4774faf854f534 Frank Li              2023-08-21  1144  
112aba9a79345a Richard Zhu           2024-12-10  1145  	if (pci->pp.ops->pme_turn_off) {
4774faf854f534 Frank Li              2023-08-21  1146  		pci->pp.ops->pme_turn_off(&pci->pp);
112aba9a79345a Richard Zhu           2024-12-10  1147  	} else {
e1a4ec1a9520bf Frank Li              2024-04-18  1148  		ret = dw_pcie_pme_turn_off(pci);
e1a4ec1a9520bf Frank Li              2024-04-18  1149  		if (ret)
e1a4ec1a9520bf Frank Li              2024-04-18  1150  			return ret;
112aba9a79345a Richard Zhu           2024-12-10  1151  	}
4774faf854f534 Frank Li              2023-08-21  1152  
112aba9a79345a Richard Zhu           2024-12-10  1153  	ret = read_poll_timeout(dw_pcie_get_ltssm, val,
112aba9a79345a Richard Zhu           2024-12-10  1154  				val == DW_PCIE_LTSSM_L2_IDLE ||
112aba9a79345a Richard Zhu           2024-12-10  1155  				val <= DW_PCIE_LTSSM_DETECT_WAIT,
4774faf854f534 Frank Li              2023-08-21  1156  				PCIE_PME_TO_L2_TIMEOUT_US/10,
4774faf854f534 Frank Li              2023-08-21  1157  				PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
4774faf854f534 Frank Li              2023-08-21  1158  	if (ret) {
112aba9a79345a Richard Zhu           2024-12-10  1159  		/* Only log message when LTSSM isn't in DETECT or POLL */
4774faf854f534 Frank Li              2023-08-21  1160  		dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
4774faf854f534 Frank Li              2023-08-21  1161  		return ret;
4774faf854f534 Frank Li              2023-08-21  1162  	}
4774faf854f534 Frank Li              2023-08-21  1163  
112aba9a79345a Richard Zhu           2024-12-10  1164  	/*
112aba9a79345a Richard Zhu           2024-12-10  1165  	 * Per PCIe r6.0, sec 5.3.3.2.1, software should wait at least
112aba9a79345a Richard Zhu           2024-12-10  1166  	 * 100ns after L2/L3 Ready before turning off refclock and
112aba9a79345a Richard Zhu           2024-12-10  1167  	 * main power. This is harmless when no endpoint is connected.
112aba9a79345a Richard Zhu           2024-12-10  1168  	 */
112aba9a79345a Richard Zhu           2024-12-10  1169  	udelay(1);
112aba9a79345a Richard Zhu           2024-12-10  1170  
e8fe6b3413a1b9 Manivannan Sadhasivam 2025-11-07  1171  stop_link:
86a016e278b78c Richard Zhu           2024-12-10  1172  	dw_pcie_stop_link(pci);
aea370b2aec9d3 Yoshihiro Shimoda     2023-12-20  1173  	if (pci->pp.ops->deinit)
aea370b2aec9d3 Yoshihiro Shimoda     2023-12-20  1174  		pci->pp.ops->deinit(&pci->pp);
4774faf854f534 Frank Li              2023-08-21  1175  
4774faf854f534 Frank Li              2023-08-21  1176  	pci->suspended = true;
4774faf854f534 Frank Li              2023-08-21  1177  
4774faf854f534 Frank Li              2023-08-21 @1178  	return ret;
4774faf854f534 Frank Li              2023-08-21  1179  }
4774faf854f534 Frank Li              2023-08-21  1180  EXPORT_SYMBOL_GPL(dw_pcie_suspend_noirq);
4774faf854f534 Frank Li              2023-08-21  1181  

:::::: The code at line 1178 was first introduced by commit
:::::: 4774faf854f53461fd22daa73f3881fe11b6b755 PCI: dwc: Implement generic suspend/resume functionality

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Lorenzo Pieralisi <lpieralisi@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
