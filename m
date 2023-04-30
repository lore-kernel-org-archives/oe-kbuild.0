Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE99364
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Apr 2023 01:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682817078; x=1714353078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+386tGaGwzjICFIBiNnoBvWOKmhH4VFo69O/ysbNrVQ=;
  b=RlRNLab8qTJwwQeg2WM55w6LNZb43IMj74AhnOhb7K+4IOnY1o4a30Yc
   hMXKAk4dYlnCDna2YD40Qk3XCMKqQ9XJ+BmChe7FtIrA1RIDf1OCHgufM
   xaWbgFRaVOjO0AjTiedp4higMn3LQ3KrpTy7ZVW/3cozQ4ig2xNGdgAx6
   wnJdINU6/v1UMK6kulVSnfgHD3r/6k8FxUIl7bFuFNMKOuEYq0RF/gOUC
   sXoBfY+Mb2IHid0y0r8mYXiNxnXaORMx40Tvnxm2uflGohsEWBmNxSbX3
   26NzdF4E2H6voDonZDDT1fXxekoM9IWociwr7uATg6Jn9QW5r+NKAu4GM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="434282790"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="434282790"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 18:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="689414854"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="689414854"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Apr 2023 18:11:16 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psvat-0001RB-34;
	Sun, 30 Apr 2023 01:11:15 +0000
Date: Sun, 30 Apr 2023 09:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] misc: hpilo: Fix use after free bug in ilo_remove due
  to race condition with ilo_open
Message-ID: <202304300909.ALHN6Vry-lkp@intel.com>
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
In-Reply-To: <20230417165246.467723-1-zyytlz.wz@163.com>
References: <20230417165246.467723-1-zyytlz.wz@163.com>
TO: Zheng Wang <zyytlz.wz@163.com>
TO: matt.hsiao@hpe.com
CC: arnd@arndb.de
CC: gregkh@linuxfoundation.org
CC: linux-kernel@vger.kernel.org
CC: hackerzheng666@gmail.com
CC: 1395428693sheep@gmail.com
CC: alex000young@gmail.com
CC: Zheng Wang <zyytlz.wz@163.com>

Hi Zheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zheng-Wang/misc-hpilo-Fix-use-after-free-bug-in-ilo_remove-due-to-race-condition-with-ilo_open/20230418-005502
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230417165246.467723-1-zyytlz.wz%40163.com
patch subject: [PATCH] misc: hpilo: Fix use after free bug in ilo_remove due  to race condition with ilo_open
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230430/202304300909.ALHN6Vry-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304300909.ALHN6Vry-lkp@intel.com/

smatch warnings:
drivers/misc/hpilo.c:755 ilo_delete() warn: can 'ilo_hw' even be NULL?

vim +/ilo_hw +755 drivers/misc/hpilo.c

13a22f45e6cb1e Zheng Wang      2023-04-18  748  
13a22f45e6cb1e Zheng Wang      2023-04-18  749  static void ilo_delete(struct kref *kref)
13a22f45e6cb1e Zheng Wang      2023-04-18  750  {
13a22f45e6cb1e Zheng Wang      2023-04-18  751  	int i, minor;
13a22f45e6cb1e Zheng Wang      2023-04-18  752  	struct ilo_hwinfo *ilo_hw = container_of(kref, struct ilo_hwinfo, refcnt);
13a22f45e6cb1e Zheng Wang      2023-04-18  753  	struct pci_dev *pdev = ilo_hw->ilo_dev;
89bcb05d9bbf8b David Altobelli 2008-07-02  754  
ebf1b764aa5cb3 Mark Rusk       2012-11-06 @755  	if (!ilo_hw)
ebf1b764aa5cb3 Mark Rusk       2012-11-06  756  		return;
ebf1b764aa5cb3 Mark Rusk       2012-11-06  757  
89bcb05d9bbf8b David Altobelli 2008-07-02  758  	clear_device(ilo_hw);
89bcb05d9bbf8b David Altobelli 2008-07-02  759  
89bcb05d9bbf8b David Altobelli 2008-07-02  760  	minor = MINOR(ilo_hw->cdev.dev);
98dcd59dd063dd Camuso, Tony    2012-06-10  761  	for (i = minor; i < minor + max_ccb; i++)
89bcb05d9bbf8b David Altobelli 2008-07-02  762  		device_destroy(ilo_class, MKDEV(ilo_major, i));
89bcb05d9bbf8b David Altobelli 2008-07-02  763  
89bcb05d9bbf8b David Altobelli 2008-07-02  764  	cdev_del(&ilo_hw->cdev);
9f7048412163d8 David Altobelli 2009-08-17  765  	ilo_disable_interrupts(ilo_hw);
9f7048412163d8 David Altobelli 2009-08-17  766  	free_irq(pdev->irq, ilo_hw);
89bcb05d9bbf8b David Altobelli 2008-07-02  767  	ilo_unmap_device(pdev, ilo_hw);
89bcb05d9bbf8b David Altobelli 2008-07-02  768  	pci_release_regions(pdev);
bcdee04ea7ae04 Jiri Slaby      2012-09-13  769  	/*
bcdee04ea7ae04 Jiri Slaby      2012-09-13  770  	 * pci_disable_device(pdev) used to be here. But this PCI device has
bcdee04ea7ae04 Jiri Slaby      2012-09-13  771  	 * two functions with interrupt lines connected to a single pin. The
bcdee04ea7ae04 Jiri Slaby      2012-09-13  772  	 * other one is a USB host controller. So when we disable the PIN here
bcdee04ea7ae04 Jiri Slaby      2012-09-13  773  	 * e.g. by rmmod hpilo, the controller stops working. It is because
bcdee04ea7ae04 Jiri Slaby      2012-09-13  774  	 * the interrupt link is disabled in ACPI since it is not refcounted
bcdee04ea7ae04 Jiri Slaby      2012-09-13  775  	 * yet. See acpi_pci_link_free_irq called from acpi_pci_irq_disable.
bcdee04ea7ae04 Jiri Slaby      2012-09-13  776  	 */
89bcb05d9bbf8b David Altobelli 2008-07-02  777  	kfree(ilo_hw);
98dcd59dd063dd Camuso, Tony    2012-06-10  778  	ilo_hwdev[(minor / max_ccb)] = 0;
89bcb05d9bbf8b David Altobelli 2008-07-02  779  }
89bcb05d9bbf8b David Altobelli 2008-07-02  780  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
