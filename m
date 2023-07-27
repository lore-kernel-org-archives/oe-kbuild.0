Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF50174F4
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 14:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690467116; x=1722003116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M2m/l1lg1Pnb32RulaIm4G1P3FWmkImhfT7Ejk5qxyU=;
  b=HFi31YpbPPtkvJLgW42sfiI+Myu81TbiWq67t0V0SF8tvHJpFssCdk/C
   eg2GskxGOnGU9ctMqmTHEBL9bLNa3uiELmxpsYxPPUZ17DI9//25naiTW
   KqV9jN7u65MqjVt4O0KVwehixEQacatSma4gfpTdCYCrzSJ1DfQ/+AtDx
   6iJTorZqLF59UuQLwFMfH4kpN3oeQz8ChW1PgrXWc39OVPxYuHlyhnYBD
   ZO0RQeApU70yQ0mRZVpvDoGDC553P4DemrDyQEs9Pj/3rbaj4Eq97jdb1
   H6TJnlq4gRV0xjG9+8Bk+fkinx6/3YyNCunC1UXBi5uxsD4uZwRFaLX4+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399256851"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="399256851"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 07:11:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="720891893"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="720891893"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Jul 2023 07:11:51 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP1iY-0002Jj-2M;
	Thu, 27 Jul 2023 14:11:50 +0000
Date: Thu, 27 Jul 2023 22:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/irq/msi.c:801 msi_handle_pci_fail() warn: ignoring
 unreachable code.
Message-ID: <202307272213.4XeMAbNw-lkp@intel.com>
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
head:   0a8db05b571ad5b8d5c8774a004c0424260a90bd
commit: 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e irqchip: Add IMX MU MSI controller driver
date:   10 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-m041-20230727 (https://download.01.org/0day-ci/archive/20230727/202307272213.4XeMAbNw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307272213.4XeMAbNw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307272213.4XeMAbNw-lkp@intel.com/

smatch warnings:
kernel/irq/msi.c:801 msi_handle_pci_fail() warn: ignoring unreachable code.

vim +801 kernel/irq/msi.c

da5dd9e854d2edd Thomas Gleixner 2017-12-29  786  
890337624e1fa2d Thomas Gleixner 2021-12-06  787  static int msi_handle_pci_fail(struct irq_domain *domain, struct msi_desc *desc,
890337624e1fa2d Thomas Gleixner 2021-12-06  788  			       int allocated)
890337624e1fa2d Thomas Gleixner 2021-12-06  789  {
890337624e1fa2d Thomas Gleixner 2021-12-06  790  	switch(domain->bus_token) {
890337624e1fa2d Thomas Gleixner 2021-12-06  791  	case DOMAIN_BUS_PCI_MSI:
890337624e1fa2d Thomas Gleixner 2021-12-06  792  	case DOMAIN_BUS_VMD_MSI:
890337624e1fa2d Thomas Gleixner 2021-12-06  793  		if (IS_ENABLED(CONFIG_PCI_MSI))
890337624e1fa2d Thomas Gleixner 2021-12-06  794  			break;
890337624e1fa2d Thomas Gleixner 2021-12-06  795  		fallthrough;
890337624e1fa2d Thomas Gleixner 2021-12-06  796  	default:
890337624e1fa2d Thomas Gleixner 2021-12-06  797  		return -ENOSPC;
890337624e1fa2d Thomas Gleixner 2021-12-06  798  	}
890337624e1fa2d Thomas Gleixner 2021-12-06  799  
890337624e1fa2d Thomas Gleixner 2021-12-06  800  	/* Let a failed PCI multi MSI allocation retry */
890337624e1fa2d Thomas Gleixner 2021-12-06 @801  	if (desc->nvec_used > 1)
890337624e1fa2d Thomas Gleixner 2021-12-06  802  		return 1;
890337624e1fa2d Thomas Gleixner 2021-12-06  803  
890337624e1fa2d Thomas Gleixner 2021-12-06  804  	/* If there was a successful allocation let the caller know */
890337624e1fa2d Thomas Gleixner 2021-12-06  805  	return allocated ? allocated : -ENOSPC;
890337624e1fa2d Thomas Gleixner 2021-12-06  806  }
890337624e1fa2d Thomas Gleixner 2021-12-06  807  

:::::: The code at line 801 was first introduced by commit
:::::: 890337624e1fa2da079fc1c036a62d178c985280 genirq/msi: Handle PCI/MSI allocation fail in core code

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
