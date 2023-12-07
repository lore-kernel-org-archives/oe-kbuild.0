Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A44862D
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 02:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mlfs6dR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701917089; x=1733453089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uv1IQmj84cbJj3OC58fRK2CBTio6l5TmwZxY1oGWm+Y=;
  b=Mlfs6dR2LVY91qwb/NjTisC/6SboBghz+rDFBjGKRKxnXhBXjVvh+p+D
   7CwBkVD5HCFny0vrvU11wqXnWNO063tv3ewQDMwnZbSo9fxz9MKke++K8
   jYxGZd51zKW/sY0zrTenbgOUgyWgEs0hYO1hd6Pwgh9U1Nxgj10ujEkfD
   96pF5n+zxJiASqo6S9Wb7lwY3o/34E3xj3APzxrl7L8f9YH1JaFxL8mht
   Do9cyIw+P8gBlS9GyGU4EVjvaVW1ZFNh5KalS8ZB2f6A7+inH/+RDoK7n
   Hu4rwdQcLmM4pV6AASStdtM27BMZmxYmuvYluCdCOpbdiAogszXTAD/F2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="393033388"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="393033388"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 18:44:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="862314788"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="862314788"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Dec 2023 18:44:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB4NY-000BlQ-16;
	Thu, 07 Dec 2023 02:44:44 +0000
Date: Thu, 7 Dec 2023 10:44:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/irq/msi.c:801 msi_handle_pci_fail() warn: ignoring
 unreachable code.
Message-ID: <202312071015.b1wSGwUZ-lkp@intel.com>
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
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e irqchip: Add IMX MU MSI controller driver
date:   1 year, 2 months ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 2 months ago
config: nios2-randconfig-r081-20231120 (https://download.01.org/0day-ci/archive/20231207/202312071015.b1wSGwUZ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312071015.b1wSGwUZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312071015.b1wSGwUZ-lkp@intel.com/

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
