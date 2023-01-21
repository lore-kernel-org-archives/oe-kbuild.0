Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DA239E
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Jan 2023 05:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674278637; x=1705814637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tr5a9VFedqtkdoV1H5roByZj6YGA1xeK8XzYi75bdso=;
  b=FkHDM07T/sq1bvKA3lgb6ft9Dj1bkfi3ulmJvStQg9a6vpqr1PSEwplT
   KreBEKMnFBMoEYt0uAzGwvW89EYOd9Q76RS0/39qB5K9NkokRKri7yUs2
   b+VrHx53jaCYim3vMopZveay/q0w6Vf6d3BtTIfGIenHP7t3JjCwnHXvb
   tTe7JRcm0F6BjBtk/c+hVCfuMCAcaLxREYootiq3GMz1+lTA56EyVZNjC
   tZ9ilpyZdhEv/v+09CW9RCMSfmBZAHTdV2eOCYrSuYqPBQ6zqHdjOJS/4
   lAbQVMEq9ATLCu/V8qJEK/wwOKAHGS2YvqS8KSMRuTqY5VDCyGgPnppI/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="324448204"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="324448204"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 21:23:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="768938380"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="768938380"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2023 21:23:55 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ6M6-0003YY-0j;
	Sat, 21 Jan 2023 05:23:54 +0000
Date: Sat, 21 Jan 2023 13:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/video/fbdev/imsttfb.c:1538 imsttfb_probe() warn:
 'par->cmap_regs' from ioremap() not released on lines: 1538.
Message-ID: <202301211314.K1jPf4TD-lkp@intel.com>
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
TO: Kefeng Wang <wangkefeng.wang@huawei.com>
CC: Will Deacon <will@kernel.org>
CC: Anshuman Khandual <anshuman.khandual@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f883675bf6522b52cd75dc3de791680375961769
commit: f23eab0bfaefb3319c7de90c9c632bebf53a03bc arm64: mm: Convert to GENERIC_IOREMAP
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-m031-20230119 (https://download.01.org/0day-ci/archive/20230121/202301211314.K1jPf4TD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/video/fbdev/imsttfb.c:1538 imsttfb_probe() warn: 'par->cmap_regs' from ioremap() not released on lines: 1538.

vim +1538 drivers/video/fbdev/imsttfb.c

^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1465  
48c68c4f1b5424 drivers/video/imsttfb.c       Greg Kroah-Hartman        2012-12-21  1466  static int imsttfb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1467  {
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1468  	unsigned long addr, size;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1469  	struct imstt_par *par;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1470  	struct fb_info *info;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1471  	struct device_node *dp;
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1472  	int ret = -ENOMEM;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1473  	
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1474  	dp = pci_device_to_OF_node(pdev);
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1475  	if(dp)
5c63e407aaabb0 drivers/video/fbdev/imsttfb.c Rob Herring               2018-10-08  1476  		printk(KERN_INFO "%s: OF name %pOFn\n",__func__, dp);
e9cfb2d62befcd drivers/video/fbdev/imsttfb.c Kevin Hao                 2015-03-12  1477  	else if (IS_ENABLED(CONFIG_OF))
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1478  		printk(KERN_ERR "imsttfb: no OF node for pci device\n");
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1479  
94f9e09ce531d4 drivers/video/imsttfb.c       Antonino A. Daplas        2006-01-09  1480  	info = framebuffer_alloc(sizeof(struct imstt_par), &pdev->dev);
0adcdbcb179624 drivers/video/fbdev/imsttfb.c Bartlomiej Zolnierkiewicz 2019-06-28  1481  	if (!info)
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1482  		return -ENOMEM;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1483  
94f9e09ce531d4 drivers/video/imsttfb.c       Antonino A. Daplas        2006-01-09  1484  	par = info->par;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1485  
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1486  	addr = pci_resource_start (pdev, 0);
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1487  	size = pci_resource_len (pdev, 0);
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1488  
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1489  	if (!request_mem_region(addr, size, "imsttfb")) {
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1490  		printk(KERN_ERR "imsttfb: Can't reserve memory region\n");
94f9e09ce531d4 drivers/video/imsttfb.c       Antonino A. Daplas        2006-01-09  1491  		framebuffer_release(info);
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1492  		return -ENODEV;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1493  	}
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1494  
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1495  	switch (pdev->device) {
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1496  		case PCI_DEVICE_ID_IMS_TT128: /* IMS,tt128mbA */
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1497  			par->ramdac = IBM;
a6f13af4d115a1 drivers/video/fbdev/imsttfb.c Rob Herring               2019-02-08  1498  			if (of_node_name_eq(dp, "IMS,tt128mb8") ||
a6f13af4d115a1 drivers/video/fbdev/imsttfb.c Rob Herring               2019-02-08  1499  			    of_node_name_eq(dp, "IMS,tt128mb8A"))
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1500  				par->ramdac = TVP;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1501  			break;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1502  		case PCI_DEVICE_ID_IMS_TT3D:  /* IMS,tt3d */
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1503  			par->ramdac = TVP;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1504  			break;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1505  		default:
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1506  			printk(KERN_INFO "imsttfb: Device 0x%x unknown, "
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1507  					 "contact maintainer.\n", pdev->device);
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1508  			ret = -ENODEV;
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1509  			goto error;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1510  	}
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1511  
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1512  	info->fix.smem_start = addr;
94f9e09ce531d4 drivers/video/imsttfb.c       Antonino A. Daplas        2006-01-09  1513  	info->screen_base = (__u8 *)ioremap(addr, par->ramdac == IBM ?
94f9e09ce531d4 drivers/video/imsttfb.c       Antonino A. Daplas        2006-01-09  1514  					    0x400000 : 0x800000);
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1515  	if (!info->screen_base)
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1516  		goto error;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1517  	info->fix.mmio_start = addr + 0x800000;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1518  	par->dc_regs = ioremap(addr + 0x800000, 0x1000);
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1519  	if (!par->dc_regs)
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1520  		goto error;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1521  	par->cmap_regs_phys = addr + 0x840000;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1522  	par->cmap_regs = (__u8 *)ioremap(addr + 0x840000, 0x1000);
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1523  	if (!par->cmap_regs)
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1524  		goto error;
94f9e09ce531d4 drivers/video/imsttfb.c       Antonino A. Daplas        2006-01-09  1525  	info->pseudo_palette = par->palette;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1526  	init_imstt(info);
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1527  
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1528  	pci_set_drvdata(pdev, info);
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1529  	return 0;
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1530  
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1531  error:
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1532  	if (par->dc_regs)
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1533  		iounmap(par->dc_regs);
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1534  	if (info->screen_base)
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1535  		iounmap(info->screen_base);
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1536  	release_mem_region(addr, size);
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1537  	framebuffer_release(info);
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03 @1538  	return ret;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1539  }
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1540  

:::::: The code at line 1538 was first introduced by commit
:::::: 13b7c0390a5d3840e1e2cda8f44a310fdbb982de video: imsttfb: check for ioremap() failures

:::::: TO: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
