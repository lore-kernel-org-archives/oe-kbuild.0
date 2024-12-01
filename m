Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E586214A84
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 07:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733037275; cv=none; b=PwDF12BuBgFYc1Di6CHeYKkKcK4O71BlhUzLxytpFnv/kGLWqI1FMmqkm8wXDxR+yjvrvxvkTO/hUnXWOYnogzA39c0Tlqc2wqTCKmhta0EMlUWujRZ2onfVWHjAnrS+4vlITzrv5Vx8DLQOHDnXMuTEuLnPtYQYTnj9rfuyf48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733037275; c=relaxed/simple;
	bh=RzbiDGw88ZVMI6lD5CKB/wLYJcw9EPb+HTNQyJPxM7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JGK2eEVVTtMHtv8R4WdVw796m4N1TwXgcXl9xhelu4tlD1Muehmmg+Z20NDoXn2l8mgw818QIOi7/f5T42i+m8apJn4+rLikdpj3cOfvoa1XwAPK+5OQxAuIEOaYX4Zu9gJxAXA2QvFOsUEa/yRvrecVGT8ojxO+3/DtettOj60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcf3zJet; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcf3zJet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733037273; x=1764573273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RzbiDGw88ZVMI6lD5CKB/wLYJcw9EPb+HTNQyJPxM7o=;
  b=mcf3zJetJuWBlENH3u/FY+ULBsnTUbmKgZMX+KWJ5zPMMZoxtUyp+mSU
   EIs4zBYKaPFra/RaS9Ew+YSET2DmXENubh6fBT2jj/GOgdov00BsckjLK
   mb1k4vbSoJFGs9aN8IWZmL0LH5KJSfW/RdwH2b6BOX1Cqd/SuiKBQiBpb
   QCmS4YsZT8JM2bGA+avDbWDbXL34xBambsP9FL49MR80jF0LheKbM8ys0
   /bVK5iSTxY5yiYKwNJXmLblr+a+EJw9WD8fr2Fpa4HjV+EPxIb7iiCAO0
   NlbBm+LfuSS6w2Fni052bJ3rRHTv400QgCENuBJNTDdgoC3An+kODa3Lb
   w==;
X-CSE-ConnectionGUID: 7cJOMepEQ92mi4k+BC1BeQ==
X-CSE-MsgGUID: hOguU0gUSyKpvx937/kXSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="43885666"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="43885666"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 23:14:32 -0800
X-CSE-ConnectionGUID: ZZGeHvRHTjiGZfJ9XUbs2Q==
X-CSE-MsgGUID: q0cMFJKESli0kBmTwJjjKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="92690893"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Nov 2024 23:14:30 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHe9z-0001Ki-1l;
	Sun, 01 Dec 2024 07:14:27 +0000
Date: Sun, 1 Dec 2024 15:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c:316:1-7: ERROR:
 missing iounmap; ioremap on line 256 and execution via conditional on line
 265
Message-ID: <202412011545.MPPNO8m4-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
commit: 4bdc0d676a643140bdf17dbf7eafedee3d496a3c remove ioremap_nocache and devm_ioremap_nocache
date:   4 years, 11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 years, 11 months ago
config: x86_64-randconfig-102-20241118 (https://download.01.org/0day-ci/archive/20241201/202412011545.MPPNO8m4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412011545.MPPNO8m4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c:316:1-7: ERROR: missing iounmap; ioremap on line 256 and execution via conditional on line 265

vim +316 drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c

a4d36e20d03514 David VomLehn     2017-01-23  196  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  197  static int aq_pci_probe(struct pci_dev *pdev,
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  198  			const struct pci_device_id *pci_id)
a4d36e20d03514 David VomLehn     2017-01-23  199  {
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  200  	struct net_device *ndev;
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  201  	resource_size_t mmio_pa;
7b0c342f1f6754 Nikita Danilov    2019-11-07  202  	struct aq_nic_s *self;
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  203  	u32 numvecs;
7b0c342f1f6754 Nikita Danilov    2019-11-07  204  	u32 bar;
7b0c342f1f6754 Nikita Danilov    2019-11-07  205  	int err;
a4d36e20d03514 David VomLehn     2017-01-23  206  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  207  	err = pci_enable_device(pdev);
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  208  	if (err)
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  209  		return err;
a4d36e20d03514 David VomLehn     2017-01-23  210  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  211  	err = aq_pci_func_init(pdev);
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  212  	if (err)
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  213  		goto err_pci_func;
a4d36e20d03514 David VomLehn     2017-01-23  214  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  215  	ndev = aq_ndev_alloc();
f03e4f8aadc84d Wei Yongjun       2018-01-23  216  	if (!ndev) {
f03e4f8aadc84d Wei Yongjun       2018-01-23  217  		err = -ENOMEM;
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  218  		goto err_ndev;
f03e4f8aadc84d Wei Yongjun       2018-01-23  219  	}
a4d36e20d03514 David VomLehn     2017-01-23  220  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  221  	self = netdev_priv(ndev);
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  222  	self->pdev = pdev;
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  223  	SET_NETDEV_DEV(ndev, &pdev->dev);
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  224  	pci_set_drvdata(pdev, self);
6849540adc0bcc Igor Russkikh     2017-10-19  225  
f5dce08ab17945 Nikita Danilov    2019-04-29  226  	mutex_init(&self->fwreq_mutex);
f5dce08ab17945 Nikita Danilov    2019-04-29  227  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  228  	err = aq_pci_probe_get_hw_by_id(pdev, &self->aq_hw_ops,
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  229  					&aq_nic_get_cfg(self)->aq_hw_caps);
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  230  	if (err)
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  231  		goto err_ioremap;
a4d36e20d03514 David VomLehn     2017-01-23  232  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  233  	self->aq_hw = kzalloc(sizeof(*self->aq_hw), GFP_KERNEL);
370c10522e96bf Dan Carpenter     2018-02-22  234  	if (!self->aq_hw) {
370c10522e96bf Dan Carpenter     2018-02-22  235  		err = -ENOMEM;
370c10522e96bf Dan Carpenter     2018-02-22  236  		goto err_ioremap;
370c10522e96bf Dan Carpenter     2018-02-22  237  	}
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  238  	self->aq_hw->aq_nic_cfg = aq_nic_get_cfg(self);
a4d36e20d03514 David VomLehn     2017-01-23  239  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  240  	for (bar = 0; bar < 4; ++bar) {
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  241  		if (IORESOURCE_MEM & pci_resource_flags(pdev, bar)) {
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  242  			resource_size_t reg_sz;
a4d36e20d03514 David VomLehn     2017-01-23  243  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  244  			mmio_pa = pci_resource_start(pdev, bar);
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  245  			if (mmio_pa == 0U) {
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  246  				err = -EIO;
370c10522e96bf Dan Carpenter     2018-02-22  247  				goto err_free_aq_hw;
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  248  			}
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  249  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  250  			reg_sz = pci_resource_len(pdev, bar);
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  251  			if ((reg_sz <= 24 /*ATL_REGS_SIZE*/)) {
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  252  				err = -EIO;
370c10522e96bf Dan Carpenter     2018-02-22  253  				goto err_free_aq_hw;
a4d36e20d03514 David VomLehn     2017-01-23  254  			}
a4d36e20d03514 David VomLehn     2017-01-23  255  
4bdc0d676a6431 Christoph Hellwig 2020-01-06 @256  			self->aq_hw->mmio = ioremap(mmio_pa, reg_sz);
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  257  			if (!self->aq_hw->mmio) {
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  258  				err = -EIO;
370c10522e96bf Dan Carpenter     2018-02-22  259  				goto err_free_aq_hw;
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  260  			}
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  261  			break;
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  262  		}
a4d36e20d03514 David VomLehn     2017-01-23  263  	}
a4d36e20d03514 David VomLehn     2017-01-23  264  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19 @265  	if (bar == 4) {
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  266  		err = -EIO;
370c10522e96bf Dan Carpenter     2018-02-22  267  		goto err_free_aq_hw;
a4d36e20d03514 David VomLehn     2017-01-23  268  	}
5b97b0d10eddee Igor Russkikh     2018-01-15  269  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  270  	numvecs = min((u8)AQ_CFG_VECS_DEF,
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  271  		      aq_nic_get_cfg(self)->aq_hw_caps->msix_irqs);
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  272  	numvecs = min(numvecs, num_online_cpus());
04a1839950d92a Egor Pomozov      2019-10-22  273  	/* Request IRQ vector for PTP */
04a1839950d92a Egor Pomozov      2019-10-22  274  	numvecs += 1;
04a1839950d92a Egor Pomozov      2019-10-22  275  
4c83f170b3ac08 Igor Russkikh     2019-04-29  276  	numvecs += AQ_HW_SERVICE_IRQS;
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  277  	/*enable interrupts */
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  278  #if !AQ_CFG_FORCE_LEGACY_INT
58d813afbe8965 Colin Ian King    2018-06-07  279  	err = pci_alloc_irq_vectors(self->pdev, 1, numvecs,
a09bd81b5413d1 Igor Russkikh     2018-05-07  280  				    PCI_IRQ_MSIX | PCI_IRQ_MSI |
a09bd81b5413d1 Igor Russkikh     2018-05-07  281  				    PCI_IRQ_LEGACY);
5b97b0d10eddee Igor Russkikh     2018-01-15  282  
58d813afbe8965 Colin Ian King    2018-06-07  283  	if (err < 0)
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  284  		goto err_hwinit;
58d813afbe8965 Colin Ian King    2018-06-07  285  	numvecs = err;
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  286  #endif
a09bd81b5413d1 Igor Russkikh     2018-05-07  287  	self->irqvecs = numvecs;
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  288  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  289  	/* net device init */
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  290  	aq_nic_cfg_start(self);
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  291  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  292  	aq_nic_ndev_init(self);
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  293  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  294  	err = aq_nic_ndev_register(self);
5b97b0d10eddee Igor Russkikh     2018-01-15  295  	if (err < 0)
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  296  		goto err_register;
5b97b0d10eddee Igor Russkikh     2018-01-15  297  
4c0131539fc0ad Yana Esina        2019-04-29  298  	aq_drvinfo_init(ndev);
4c0131539fc0ad Yana Esina        2019-04-29  299  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  300  	return 0;
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  301  
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  302  err_register:
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  303  	aq_nic_free_vectors(self);
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  304  	aq_pci_free_irq_vectors(self);
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  305  err_hwinit:
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  306  	iounmap(self->aq_hw->mmio);
370c10522e96bf Dan Carpenter     2018-02-22  307  err_free_aq_hw:
370c10522e96bf Dan Carpenter     2018-02-22  308  	kfree(self->aq_hw);
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  309  err_ioremap:
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  310  	free_netdev(ndev);
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  311  err_ndev:
a09bd81b5413d1 Igor Russkikh     2018-05-07  312  	pci_release_regions(pdev);
a09bd81b5413d1 Igor Russkikh     2018-05-07  313  err_pci_func:
23ee07ad3c2fd5 Igor Russkikh     2018-01-19  314  	pci_disable_device(pdev);
7b0c342f1f6754 Nikita Danilov    2019-11-07  315  
5b97b0d10eddee Igor Russkikh     2018-01-15 @316  	return err;
5b97b0d10eddee Igor Russkikh     2018-01-15  317  }
5b97b0d10eddee Igor Russkikh     2018-01-15  318  

:::::: The code at line 316 was first introduced by commit
:::::: 5b97b0d10eddeeec258b807f009a2cb2764653c7 net: aquantia: Simplify dependencies between pci modules

:::::: TO: Igor Russkikh <igor.russkikh@aquantia.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
