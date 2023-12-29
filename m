Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BE112B66
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Dec 2023 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agSxeqpd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703873335; x=1735409335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cLXvZFSIJT352sD3VRSAVL6WPrlTqS8Z0Aqtkg9Lu4k=;
  b=agSxeqpdDQxIbuG4wlvkXObDS8zrhPGnD5v3x2/yPdbksppaC8h1D0GR
   kN/pr9Y0lqMMpfpO0F0z6sXDOLmFLDgQs0aTfK/vvsqjhcznlT8mNOjPA
   o/4vyTNMLrts0BkXTvSxuTFIyrva/kBF/GRhcFhtM3aW9ZTzWrXVn3Lhw
   HW9w/TY3+vg1raxdPLWjVMV9xbZUcjgqolRh3UEYuGGlInjAmhvoPDFfL
   XBEWwKy4djVLWou/ZmF6pRxLcL1sCWqJCdMx7QAV+QYQaqFUcfr5vtolO
   0fWh9d9IQjncAYRfrLCkQ0zA2mPPcic3HavTD9hWlYI8TCz6Y2Zmy75vC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="399442913"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="399442913"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 10:08:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="922402308"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="922402308"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 29 Dec 2023 10:08:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJHHv-000HgP-0B;
	Fri, 29 Dec 2023 18:08:51 +0000
Date: Sat, 30 Dec 2023 02:08:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kleist:ipu4-dev 19/59]
 drivers/media/pci/intel/ipu6/ipu6-bus.c:101:14: error: no member named
 'dma_ops' in 'struct device'
Message-ID: <202312300202.D9KXE9bV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/media/pci/intel/ipu6/ipu6-bus.c:101:14: error: no member named 'dma_ops' in 'struct device'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Andreas Helbech Kleist <andreaskleist@gmail.com>

tree:   https://github.com/Kleist/linux ipu4-dev
head:   15245fe26e07c9118f0f5c03af5469832928f3dc
commit: d35c2043fb50817f1e5eb1ddb6ae4b95d367ae55 [19/59] media: intel/ipu4: HACK: Re-purpose ipu6 files for ipu4 driver
:::::: branch date: 9 days ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-r112-20231229 (https://download.01.org/0day-ci/archive/20231230/202312300202.D9KXE9bV-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300202.D9KXE9bV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312300202.D9KXE9bV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/ipu6-bus.c:101:14: error: no member named 'dma_ops' in 'struct device'
     101 |         auxdev->dev.dma_ops = &ipu6_dma_ops;
         |         ~~~~~~~~~~~ ^
   1 error generated.


vim +101 drivers/media/pci/intel/ipu6/ipu6-bus.c

214681ec4e2bf1 Bingbu Cao             2023-10-24   74  
214681ec4e2bf1 Bingbu Cao             2023-10-24   75  struct ipu6_bus_device *
214681ec4e2bf1 Bingbu Cao             2023-10-24   76  ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
89e2423725f00f Andreas Helbech Kleist 2023-11-10   77  			   void *pdata, const struct ipu6_buttress_ctrl *ctrl,
214681ec4e2bf1 Bingbu Cao             2023-10-24   78  			   char *name)
214681ec4e2bf1 Bingbu Cao             2023-10-24   79  {
214681ec4e2bf1 Bingbu Cao             2023-10-24   80  	struct auxiliary_device *auxdev;
214681ec4e2bf1 Bingbu Cao             2023-10-24   81  	struct ipu6_bus_device *adev;
214681ec4e2bf1 Bingbu Cao             2023-10-24   82  	struct ipu6_device *isp = pci_get_drvdata(pdev);
214681ec4e2bf1 Bingbu Cao             2023-10-24   83  	int ret;
214681ec4e2bf1 Bingbu Cao             2023-10-24   84  
214681ec4e2bf1 Bingbu Cao             2023-10-24   85  	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
214681ec4e2bf1 Bingbu Cao             2023-10-24   86  	if (!adev)
214681ec4e2bf1 Bingbu Cao             2023-10-24   87  		return ERR_PTR(-ENOMEM);
214681ec4e2bf1 Bingbu Cao             2023-10-24   88  
214681ec4e2bf1 Bingbu Cao             2023-10-24   89  	adev->dma_mask = DMA_BIT_MASK(isp->secure_mode ? IPU6_MMU_ADDR_BITS :
214681ec4e2bf1 Bingbu Cao             2023-10-24   90  				      IPU6_MMU_ADDR_BITS_NON_SECURE);
214681ec4e2bf1 Bingbu Cao             2023-10-24   91  	adev->isp = isp;
214681ec4e2bf1 Bingbu Cao             2023-10-24   92  	adev->ctrl = ctrl;
214681ec4e2bf1 Bingbu Cao             2023-10-24   93  	adev->pdata = pdata;
214681ec4e2bf1 Bingbu Cao             2023-10-24   94  	auxdev = &adev->auxdev;
214681ec4e2bf1 Bingbu Cao             2023-10-24   95  	auxdev->name = name;
214681ec4e2bf1 Bingbu Cao             2023-10-24   96  	auxdev->id = (pci_domain_nr(pdev->bus) << 16) |
214681ec4e2bf1 Bingbu Cao             2023-10-24   97  		      PCI_DEVID(pdev->bus->number, pdev->devfn);
214681ec4e2bf1 Bingbu Cao             2023-10-24   98  
214681ec4e2bf1 Bingbu Cao             2023-10-24   99  	auxdev->dev.parent = parent;
214681ec4e2bf1 Bingbu Cao             2023-10-24  100  	auxdev->dev.release = ipu6_bus_release;
214681ec4e2bf1 Bingbu Cao             2023-10-24 @101  	auxdev->dev.dma_ops = &ipu6_dma_ops;
214681ec4e2bf1 Bingbu Cao             2023-10-24  102  	auxdev->dev.dma_mask = &adev->dma_mask;
214681ec4e2bf1 Bingbu Cao             2023-10-24  103  	auxdev->dev.dma_parms = pdev->dev.dma_parms;
214681ec4e2bf1 Bingbu Cao             2023-10-24  104  	auxdev->dev.coherent_dma_mask = adev->dma_mask;
214681ec4e2bf1 Bingbu Cao             2023-10-24  105  
214681ec4e2bf1 Bingbu Cao             2023-10-24  106  	ret = auxiliary_device_init(auxdev);
214681ec4e2bf1 Bingbu Cao             2023-10-24  107  	if (ret < 0) {
214681ec4e2bf1 Bingbu Cao             2023-10-24  108  		dev_err(&isp->pdev->dev, "auxiliary device init failed (%d)\n",
214681ec4e2bf1 Bingbu Cao             2023-10-24  109  			ret);
214681ec4e2bf1 Bingbu Cao             2023-10-24  110  		kfree(adev);
214681ec4e2bf1 Bingbu Cao             2023-10-24  111  		return ERR_PTR(ret);
214681ec4e2bf1 Bingbu Cao             2023-10-24  112  	}
214681ec4e2bf1 Bingbu Cao             2023-10-24  113  
214681ec4e2bf1 Bingbu Cao             2023-10-24  114  	dev_pm_domain_set(&auxdev->dev, &ipu6_bus_pm_domain);
214681ec4e2bf1 Bingbu Cao             2023-10-24  115  
214681ec4e2bf1 Bingbu Cao             2023-10-24  116  	pm_runtime_forbid(&adev->auxdev.dev);
214681ec4e2bf1 Bingbu Cao             2023-10-24  117  	pm_runtime_enable(&adev->auxdev.dev);
214681ec4e2bf1 Bingbu Cao             2023-10-24  118  
214681ec4e2bf1 Bingbu Cao             2023-10-24  119  	return adev;
214681ec4e2bf1 Bingbu Cao             2023-10-24  120  }
214681ec4e2bf1 Bingbu Cao             2023-10-24  121  

:::::: The code at line 101 was first introduced by commit
:::::: 214681ec4e2bf174045d6527cb97d44941d84eb5 media: intel/ipu6: add IPU auxiliary devices

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Andreas Helbech Kleist <andreaskleist@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
