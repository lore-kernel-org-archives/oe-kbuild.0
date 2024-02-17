Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70702C6A4
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Feb 2024 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708177119; cv=none; b=fIh0TS7bgrEqdQeUifJQC8zfP0azz9Asuo8rvSYjzwkp5ZAQMrpa8n/u/HBFaQagpwxBCC9fpBPn2MN/MXE7l40U8yNADdMkxcCLdJ0BxVo7WdVfEHFD8zBiONydCza+3BIHoNdKG68LYJGUUTerDJ/rwSQK65XchfX9fOnnXLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708177119; c=relaxed/simple;
	bh=uGtkMWLUknDAj3/ADyWWgrPeQwHwpacHfuT0ByAj26I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sVQTtX5KsTs1+gm5gcuVjY6SBkx/27Pl/MApYjpITxTiSjQyWaQjehXHCMFLHWFNUqv1/vcSloMCO8KZ1JFD+4pVw9GhXAnuKnQcl/JLvN7D+JkxTHh5jL4BBMY7AyNCf2zCLUNP5jYfR1lDhiSkLPrSKRrxJQ/ZoygPx7lzuao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ww1YSAJ3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ww1YSAJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708177118; x=1739713118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uGtkMWLUknDAj3/ADyWWgrPeQwHwpacHfuT0ByAj26I=;
  b=Ww1YSAJ3DUVB7XEAT3eZL5DCRs5IXZaOcsPrQEH8/0FB9TVSgUXoBwkn
   kBFiQZ9wclfXHYxMJ3KhXM2K6MyeumsUgLseLxcjVIs+sG826ptnM+QI6
   QZDA7koo1IASgugNjOzL2HxFuYjcU1U4yYeWphFJ8AOdd0o37eT8rmPt/
   CO8Pwtait8CMNMBneFK/qXWIolL1DrzcZieOUqt9HnvbzsgzuZgQ0Kj2P
   I10Hb+TtbVtFOxyBaQGihw1wCcxlh4NVEO7AB9v1pRLlhlmy0RTB6JmXA
   XWBbLSWs/ps7CWMlgkrtwQUTu+zaIzlir+DPL/K41Y3nqPwYDggUrrnLl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="13011008"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="13011008"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 05:38:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="4108760"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Feb 2024 05:38:36 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbKtN-00029I-1g;
	Sat, 17 Feb 2024 13:38:19 +0000
Date: Sat, 17 Feb 2024 21:37:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sailus-media-tree:ipu6 59/63]
 drivers/media/pci/intel/ipu6/ipu6-bus.c:109:13: error: 'struct device' has
 no member named 'dma_ops'
Message-ID: <202402172115.mTvvIxnQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/media/pci/intel/ipu6/ipu6-bus.c:109:13: error: 'struct device' has no member named 'dma_ops'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Bingbu Cao <bingbu.cao@intel.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Andreas Helbech Kleist <andreaskleist@gmail.com>

tree:   git://linuxtv.org/sailus/media_tree.git ipu6
head:   31343acd3c3ab852367e3f986d12b5e743d5c5c5
commit: 736ca9b346fc52b187fc620f36b20ec7dc9870d1 [59/63] media: add Kconfig and Makefile for IPU6
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-123-20240217 (https://download.01.org/0day-ci/archive/20240217/202402172115.mTvvIxnQ-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402172115.mTvvIxnQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402172115.mTvvIxnQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/ipu6-bus.c: In function 'ipu6_bus_initialize_device':
>> drivers/media/pci/intel/ipu6/ipu6-bus.c:109:13: error: 'struct device' has no member named 'dma_ops'
     109 |  auxdev->dev.dma_ops = &ipu6_dma_ops;
         |             ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - VIDEO_INTEL_IPU6 [=y] && PCI [=y] && (ACPI [=y] || COMPILE_TEST [=n]) && MEDIA_SUPPORT [=y] && MEDIA_PCI_SUPPORT [=y] && X86 [=y] && X86_64 [=y]


vim +109 drivers/media/pci/intel/ipu6/ipu6-bus.c

eaad32dd9543c6 Bingbu Cao 2024-01-31   82  
eaad32dd9543c6 Bingbu Cao 2024-01-31   83  struct ipu6_bus_device *
eaad32dd9543c6 Bingbu Cao 2024-01-31   84  ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
eaad32dd9543c6 Bingbu Cao 2024-01-31   85  			   void *pdata, struct ipu6_buttress_ctrl *ctrl,
eaad32dd9543c6 Bingbu Cao 2024-01-31   86  			   char *name)
eaad32dd9543c6 Bingbu Cao 2024-01-31   87  {
eaad32dd9543c6 Bingbu Cao 2024-01-31   88  	struct auxiliary_device *auxdev;
eaad32dd9543c6 Bingbu Cao 2024-01-31   89  	struct ipu6_bus_device *adev;
eaad32dd9543c6 Bingbu Cao 2024-01-31   90  	struct ipu6_device *isp = pci_get_drvdata(pdev);
eaad32dd9543c6 Bingbu Cao 2024-01-31   91  	int ret;
eaad32dd9543c6 Bingbu Cao 2024-01-31   92  
eaad32dd9543c6 Bingbu Cao 2024-01-31   93  	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
eaad32dd9543c6 Bingbu Cao 2024-01-31   94  	if (!adev)
eaad32dd9543c6 Bingbu Cao 2024-01-31   95  		return ERR_PTR(-ENOMEM);
eaad32dd9543c6 Bingbu Cao 2024-01-31   96  
eaad32dd9543c6 Bingbu Cao 2024-01-31   97  	adev->dma_mask = DMA_BIT_MASK(isp->secure_mode ? IPU6_MMU_ADDR_BITS :
eaad32dd9543c6 Bingbu Cao 2024-01-31   98  				      IPU6_MMU_ADDR_BITS_NON_SECURE);
eaad32dd9543c6 Bingbu Cao 2024-01-31   99  	adev->isp = isp;
eaad32dd9543c6 Bingbu Cao 2024-01-31  100  	adev->ctrl = ctrl;
eaad32dd9543c6 Bingbu Cao 2024-01-31  101  	adev->pdata = pdata;
eaad32dd9543c6 Bingbu Cao 2024-01-31  102  	auxdev = &adev->auxdev;
eaad32dd9543c6 Bingbu Cao 2024-01-31  103  	auxdev->name = name;
eaad32dd9543c6 Bingbu Cao 2024-01-31  104  	auxdev->id = (pci_domain_nr(pdev->bus) << 16) |
eaad32dd9543c6 Bingbu Cao 2024-01-31  105  		      PCI_DEVID(pdev->bus->number, pdev->devfn);
eaad32dd9543c6 Bingbu Cao 2024-01-31  106  
eaad32dd9543c6 Bingbu Cao 2024-01-31  107  	auxdev->dev.parent = parent;
eaad32dd9543c6 Bingbu Cao 2024-01-31  108  	auxdev->dev.release = ipu6_bus_release;
eaad32dd9543c6 Bingbu Cao 2024-01-31 @109  	auxdev->dev.dma_ops = &ipu6_dma_ops;
eaad32dd9543c6 Bingbu Cao 2024-01-31  110  	auxdev->dev.dma_mask = &adev->dma_mask;
eaad32dd9543c6 Bingbu Cao 2024-01-31  111  	auxdev->dev.dma_parms = pdev->dev.dma_parms;
eaad32dd9543c6 Bingbu Cao 2024-01-31  112  	auxdev->dev.coherent_dma_mask = adev->dma_mask;
eaad32dd9543c6 Bingbu Cao 2024-01-31  113  
eaad32dd9543c6 Bingbu Cao 2024-01-31  114  	ret = auxiliary_device_init(auxdev);
eaad32dd9543c6 Bingbu Cao 2024-01-31  115  	if (ret < 0) {
eaad32dd9543c6 Bingbu Cao 2024-01-31  116  		dev_err(&isp->pdev->dev, "auxiliary device init failed (%d)\n",
eaad32dd9543c6 Bingbu Cao 2024-01-31  117  			ret);
eaad32dd9543c6 Bingbu Cao 2024-01-31  118  		kfree(adev);
eaad32dd9543c6 Bingbu Cao 2024-01-31  119  		return ERR_PTR(ret);
eaad32dd9543c6 Bingbu Cao 2024-01-31  120  	}
eaad32dd9543c6 Bingbu Cao 2024-01-31  121  
eaad32dd9543c6 Bingbu Cao 2024-01-31  122  	dev_pm_domain_set(&auxdev->dev, &ipu6_bus_pm_domain);
eaad32dd9543c6 Bingbu Cao 2024-01-31  123  
eaad32dd9543c6 Bingbu Cao 2024-01-31  124  	pm_runtime_forbid(&adev->auxdev.dev);
eaad32dd9543c6 Bingbu Cao 2024-01-31  125  	pm_runtime_enable(&adev->auxdev.dev);
eaad32dd9543c6 Bingbu Cao 2024-01-31  126  
eaad32dd9543c6 Bingbu Cao 2024-01-31  127  	return adev;
eaad32dd9543c6 Bingbu Cao 2024-01-31  128  }
eaad32dd9543c6 Bingbu Cao 2024-01-31  129  

:::::: The code at line 109 was first introduced by commit
:::::: eaad32dd9543c687d6ebe0f3c027461984965245 media: intel/ipu6: add IPU auxiliary devices

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
