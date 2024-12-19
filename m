Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CF919DF60
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Dec 2024 17:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734628699; cv=none; b=EaZ2oa+ArucWH1HasB0M4pMoeVc4vQTQej9IUKaGHP9Hec99evv2WRkjzF1V/EbVqVXO1oopqqKqZ/IfpOcB8GocjtCc9vqtjlmVNstyBPcMIyU5ObXD1DRlcZBwW+Z3HQhPc84gDvhXaA68TFMkm/ZJW1mXIUTraoQp7tj9cj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734628699; c=relaxed/simple;
	bh=rjsI5O1cRlTdKHHCSIMrmlJmgszbJuafDPFV21dLsG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TZTCphEY2+9qySAqdavP5bOShNkouvN/D+7KDsuPE1Ks9erkzLoh0ZHnXizbf02s+NXFUx35CsSlI0qfUy8rzOhe4y6PJvagkreIXZqeewtjOTDd2g0M+eb/81Ba/lEBdvQFJD3ctxrVVlY7qzk4RxBjs86trslB0bmTjACn0Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0tvU/Lt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0tvU/Lt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734628697; x=1766164697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rjsI5O1cRlTdKHHCSIMrmlJmgszbJuafDPFV21dLsG4=;
  b=U0tvU/LtTc+XnwvmKAsO9+VZ6aM/w7JJA/Ljp1bLpaF+fIe56RJmw1f9
   5zrOOySUPplkNJBQudfSe+u0I00rrY5V0kgDbRuYxEtSzSCUY346XHFzJ
   LlBBpamcyrTwDFxnf3y7k9zpQIybia9tdawOTCk+Wmu9Dwu6IMCmgqpZJ
   92uArXX6+FHM4DYL5Gd6ZSvN4Y3DhgXUvoCcyI1o/hVhOlabYiiDKUYW1
   y0w1FZbeOrHwHiZDnMQ1qtB8SD9VJTRGfZkmgCwJrzjHNjexHZEDPYL8J
   GYkyX3+A1BNorZanuHgxcR7ePevd8dDWBYAwRFrre2m+V6A7gEBLgfJ6W
   Q==;
X-CSE-ConnectionGUID: cv9SPW2pTTiPHMlA7lcjDw==
X-CSE-MsgGUID: bC9TUSqQQT+ot4pjLREgPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="46161799"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="46161799"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 09:17:34 -0800
X-CSE-ConnectionGUID: VjkL1n2uTI+y8S2EpUvE3A==
X-CSE-MsgGUID: x92WvlOxTAuBBJUaEpH++g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="98056473"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Dec 2024 09:17:33 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOK9S-0000Nb-2D;
	Thu, 19 Dec 2024 17:17:30 +0000
Date: Fri, 20 Dec 2024 01:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/advansys.c:2671 advansys_info() warn: argument 5 to %lX
 specifier is cast from pointer
Message-ID: <202412200157.BiIY7yVk-lkp@intel.com>
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
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eabcdba3ad4098460a376538df2ae36500223c1e
commit: 5284984a4fbacb0883bfebe905902cdda2891a07 bug: Fix no-return-statement warning with !CONFIG_BUG
date:   8 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 months ago
config: sparc64-randconfig-r071-20241219 (https://download.01.org/0day-ci/archive/20241220/202412200157.BiIY7yVk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412200157.BiIY7yVk-lkp@intel.com/

smatch warnings:
drivers/scsi/advansys.c:2671 advansys_info() warn: argument 5 to %lX specifier is cast from pointer
drivers/net/ethernet/dec/tulip/winbond-840.c:653 netdev_open() warn: 'np->pci_dev->irq' from request_irq() not released on lines: 653.

vim +2671 drivers/scsi/advansys.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  2608  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2609  /*
27c868c2233fe0 Matthew Wilcox    2007-07-26  2610   * advansys_info()
^1da177e4c3f41 Linus Torvalds    2005-04-16  2611   *
27c868c2233fe0 Matthew Wilcox    2007-07-26  2612   * Return suitable for printing on the console with the argument
27c868c2233fe0 Matthew Wilcox    2007-07-26  2613   * adapter's configuration information.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2614   *
27c868c2233fe0 Matthew Wilcox    2007-07-26  2615   * Note: The information line should not exceed ASC_INFO_SIZE bytes,
27c868c2233fe0 Matthew Wilcox    2007-07-26  2616   * otherwise the static 'info' array will be overrun.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2617   */
27c868c2233fe0 Matthew Wilcox    2007-07-26  2618  static const char *advansys_info(struct Scsi_Host *shost)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2619  {
27c868c2233fe0 Matthew Wilcox    2007-07-26  2620  	static char info[ASC_INFO_SIZE];
d24114955846c3 Matthew Wilcox    2007-10-02  2621  	struct asc_board *boardp = shost_priv(shost);
27c868c2233fe0 Matthew Wilcox    2007-07-26  2622  	ASC_DVC_VAR *asc_dvc_varp;
27c868c2233fe0 Matthew Wilcox    2007-07-26  2623  	ADV_DVC_VAR *adv_dvc_varp;
27c868c2233fe0 Matthew Wilcox    2007-07-26  2624  	char *busname;
27c868c2233fe0 Matthew Wilcox    2007-07-26  2625  	char *widename = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2626  
27c868c2233fe0 Matthew Wilcox    2007-07-26  2627  	if (ASC_NARROW_BOARD(boardp)) {
27c868c2233fe0 Matthew Wilcox    2007-07-26  2628  		asc_dvc_varp = &boardp->dvc_var.asc_dvc_var;
b352f9237622c6 Matthew Wilcox    2007-10-02  2629  		ASC_DBG(1, "begin\n");
9b4c8eaa68d0ce Christoph Hellwig 2021-03-31  2630  
27c868c2233fe0 Matthew Wilcox    2007-07-26  2631  		if (asc_dvc_varp->bus_type & ASC_IS_VL) {
27c868c2233fe0 Matthew Wilcox    2007-07-26  2632  			busname = "VL";
27c868c2233fe0 Matthew Wilcox    2007-07-26  2633  		} else if (asc_dvc_varp->bus_type & ASC_IS_EISA) {
27c868c2233fe0 Matthew Wilcox    2007-07-26  2634  			busname = "EISA";
27c868c2233fe0 Matthew Wilcox    2007-07-26  2635  		} else if (asc_dvc_varp->bus_type & ASC_IS_PCI) {
27c868c2233fe0 Matthew Wilcox    2007-07-26  2636  			if ((asc_dvc_varp->bus_type & ASC_IS_PCI_ULTRA)
27c868c2233fe0 Matthew Wilcox    2007-07-26  2637  			    == ASC_IS_PCI_ULTRA) {
27c868c2233fe0 Matthew Wilcox    2007-07-26  2638  				busname = "PCI Ultra";
27c868c2233fe0 Matthew Wilcox    2007-07-26  2639  			} else {
27c868c2233fe0 Matthew Wilcox    2007-07-26  2640  				busname = "PCI";
^1da177e4c3f41 Linus Torvalds    2005-04-16  2641  			}
27c868c2233fe0 Matthew Wilcox    2007-07-26  2642  		} else {
27c868c2233fe0 Matthew Wilcox    2007-07-26  2643  			busname = "?";
9d0e96eba19e99 Matthew Wilcox    2007-10-02  2644  			shost_printk(KERN_ERR, shost, "unknown bus "
9d0e96eba19e99 Matthew Wilcox    2007-10-02  2645  				"type %d\n", asc_dvc_varp->bus_type);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2646  		}
27c868c2233fe0 Matthew Wilcox    2007-07-26  2647  		sprintf(info,
27c868c2233fe0 Matthew Wilcox    2007-07-26  2648  			"AdvanSys SCSI %s: %s: IO 0x%lX-0x%lX, IRQ 0x%X",
ecec1947479e52 Matthew Wilcox    2007-07-30  2649  			ASC_VERSION, busname, (ulong)shost->io_port,
4a2d31c811542d Matthew Wilcox    2007-07-26  2650  			(ulong)shost->io_port + ASC_IOADR_GAP - 1,
d361db48324148 Matthew Wilcox    2007-10-02  2651  			boardp->irq);
27c868c2233fe0 Matthew Wilcox    2007-07-26  2652  	} else {
27c868c2233fe0 Matthew Wilcox    2007-07-26  2653  		/*
27c868c2233fe0 Matthew Wilcox    2007-07-26  2654  		 * Wide Adapter Information
27c868c2233fe0 Matthew Wilcox    2007-07-26  2655  		 *
27c868c2233fe0 Matthew Wilcox    2007-07-26  2656  		 * Memory-mapped I/O is used instead of I/O space to access
27c868c2233fe0 Matthew Wilcox    2007-07-26  2657  		 * the adapter, but display the I/O Port range. The Memory
27c868c2233fe0 Matthew Wilcox    2007-07-26  2658  		 * I/O address is displayed through the driver /proc file.
27c868c2233fe0 Matthew Wilcox    2007-07-26  2659  		 */
27c868c2233fe0 Matthew Wilcox    2007-07-26  2660  		adv_dvc_varp = &boardp->dvc_var.adv_dvc_var;
27c868c2233fe0 Matthew Wilcox    2007-07-26  2661  		if (adv_dvc_varp->chip_type == ADV_CHIP_ASC3550) {
27c868c2233fe0 Matthew Wilcox    2007-07-26  2662  			widename = "Ultra-Wide";
27c868c2233fe0 Matthew Wilcox    2007-07-26  2663  		} else if (adv_dvc_varp->chip_type == ADV_CHIP_ASC38C0800) {
27c868c2233fe0 Matthew Wilcox    2007-07-26  2664  			widename = "Ultra2-Wide";
27c868c2233fe0 Matthew Wilcox    2007-07-26  2665  		} else {
27c868c2233fe0 Matthew Wilcox    2007-07-26  2666  			widename = "Ultra3-Wide";
^1da177e4c3f41 Linus Torvalds    2005-04-16  2667  		}
27c868c2233fe0 Matthew Wilcox    2007-07-26  2668  		sprintf(info,
27c868c2233fe0 Matthew Wilcox    2007-07-26  2669  			"AdvanSys SCSI %s: PCI %s: PCIMEM 0x%lX-0x%lX, IRQ 0x%X",
27c868c2233fe0 Matthew Wilcox    2007-07-26  2670  			ASC_VERSION, widename, (ulong)adv_dvc_varp->iop_base,
d361db48324148 Matthew Wilcox    2007-10-02 @2671  			(ulong)adv_dvc_varp->iop_base + boardp->asc_n_io_port - 1, boardp->irq);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2672  	}
b009bef6cd2c6c Matthew Wilcox    2007-09-09  2673  	BUG_ON(strlen(info) >= ASC_INFO_SIZE);
b352f9237622c6 Matthew Wilcox    2007-10-02  2674  	ASC_DBG(1, "end\n");
27c868c2233fe0 Matthew Wilcox    2007-07-26  2675  	return info;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2676  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  2677  

:::::: The code at line 2671 was first introduced by commit
:::::: d361db483241489fc4b37cd168c2ce7940a7845b [SCSI] advansys: Sort out irq number mess

:::::: TO: Matthew Wilcox <matthew@wil.cx>
:::::: CC: James Bottomley <jejb@mulgrave.localdomain>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
