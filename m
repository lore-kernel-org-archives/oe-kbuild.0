Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C98F186B
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Dec 2023 01:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vfl1jyV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702689478; x=1734225478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bjpxq8uNwpf4IWOtkrE+z6TO+Tf68BJjOogyXsjV6wI=;
  b=Vfl1jyV35bzIJrjsvINnKo5LbBjCg7GKqfS3qsM3pS03QwdCn5aN2NBe
   LC9uXKk++w5bMvDjjLbmj+5Ny64zO/OfS3dXkBkMzVMEqQqL7Ny3wnCIv
   CPTOs5FUsBLBGz4OKxz13f4ndMPhU1KjjmlqkkBhN/g2jI2Ff+VISBkaz
   U0Gme6/2UBPeAiRDugy8qToUHCcMubA81DpMmsEMlvb/UNFdQKPzHTtii
   GUwQBCdtLbp6qMr/IC4TNWUT614XUdMlnBeq7vOy6H811rV6EtdhM3mVG
   jmxzdGDGPcfEi/l8zWg6GMS863rC787MX1ZbEzKsklApYeA8mIbOiWHe6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="481535688"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="481535688"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 17:17:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="768181020"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="768181020"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Dec 2023 17:17:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEJJR-0000z6-2p;
	Sat, 16 Dec 2023 01:17:53 +0000
Date: Sat, 16 Dec 2023 09:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/irq/msi.c:801 msi_handle_pci_fail() warn: ignoring
 unreachable code.
Message-ID: <202312160949.CxPieEa7-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3bd7d748816927202268cb335921f7f68b3ca723
commit: 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e irqchip: Add IMX MU MSI controller driver
date:   1 year, 3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 3 months ago
config: nios2-randconfig-r081-20231120 (https://download.01.org/0day-ci/archive/20231216/202312160949.CxPieEa7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312160949.CxPieEa7-lkp@intel.com/

smatch warnings:
kernel/irq/msi.c:801 msi_handle_pci_fail() warn: ignoring unreachable code.

vim +801 kernel/irq/msi.c

da5dd9e854d2ed Thomas Gleixner 2017-12-29  786  
890337624e1fa2 Thomas Gleixner 2021-12-06  787  static int msi_handle_pci_fail(struct irq_domain *domain, struct msi_desc *desc,
890337624e1fa2 Thomas Gleixner 2021-12-06  788  			       int allocated)
890337624e1fa2 Thomas Gleixner 2021-12-06  789  {
890337624e1fa2 Thomas Gleixner 2021-12-06  790  	switch(domain->bus_token) {
890337624e1fa2 Thomas Gleixner 2021-12-06  791  	case DOMAIN_BUS_PCI_MSI:
890337624e1fa2 Thomas Gleixner 2021-12-06  792  	case DOMAIN_BUS_VMD_MSI:
890337624e1fa2 Thomas Gleixner 2021-12-06  793  		if (IS_ENABLED(CONFIG_PCI_MSI))
890337624e1fa2 Thomas Gleixner 2021-12-06  794  			break;
890337624e1fa2 Thomas Gleixner 2021-12-06  795  		fallthrough;
890337624e1fa2 Thomas Gleixner 2021-12-06  796  	default:
890337624e1fa2 Thomas Gleixner 2021-12-06  797  		return -ENOSPC;
890337624e1fa2 Thomas Gleixner 2021-12-06  798  	}
890337624e1fa2 Thomas Gleixner 2021-12-06  799  
890337624e1fa2 Thomas Gleixner 2021-12-06  800  	/* Let a failed PCI multi MSI allocation retry */
890337624e1fa2 Thomas Gleixner 2021-12-06 @801  	if (desc->nvec_used > 1)
890337624e1fa2 Thomas Gleixner 2021-12-06  802  		return 1;
890337624e1fa2 Thomas Gleixner 2021-12-06  803  
890337624e1fa2 Thomas Gleixner 2021-12-06  804  	/* If there was a successful allocation let the caller know */
890337624e1fa2 Thomas Gleixner 2021-12-06  805  	return allocated ? allocated : -ENOSPC;
890337624e1fa2 Thomas Gleixner 2021-12-06  806  }
890337624e1fa2 Thomas Gleixner 2021-12-06  807  

:::::: The code at line 801 was first introduced by commit
:::::: 890337624e1fa2da079fc1c036a62d178c985280 genirq/msi: Handle PCI/MSI allocation fail in core code

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
