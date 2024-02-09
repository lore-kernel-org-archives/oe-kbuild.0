Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96577691B
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Feb 2024 16:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707497918; cv=none; b=M3Ly+ck0E3nZ8Miiztr1MO8naMwYVaRaM5+rZK+/ZLJW6b7I2Bwm4SMpKGHbwLeDdjnQI1+tHxeWyKNgMYl51gHJk3U60fZamaM64iKQ/PiwLhw0+mTFf2W+EwiwJXEgQ4tPHYAhmjwyhuJ+ROG2QhapE1inCiRElkMURJCRtLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707497918; c=relaxed/simple;
	bh=T6asM81sYFmImxAr+n+mms+heSbqhw4B1gtrS3MvcWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KyaYjIiJkq95cOcbzs7ahDriN5BeTljYzvaK5FbGaFfr66aCPiXaz/q4Z0GwRmz0HilEZNvCN8mdzOvlBKUSvQHArU0IvDmks5JsHXqoULuanrKMSDimmhpzn/RYVhnTuaYVpMdToLVw83FS3qEsiM2Z275l1OdAuLRGumgD6cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apilOA2N; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apilOA2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707497914; x=1739033914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T6asM81sYFmImxAr+n+mms+heSbqhw4B1gtrS3MvcWQ=;
  b=apilOA2Nr4YU3Np2KXi1lGHnr/afA2XOnVadK+XtC01+svB71laI2jpk
   0YZB3A1P2P3/Q5tP5cJ4+QVz8UrPXZUkFHeBdMCTUePoPTclbq2klPfuk
   fLwPz6q5V1htVTWfHEPhyYY57sZQpgA2lNjvuX+/8cYqySdJvYbpejKcQ
   o8Nnv637o34zIQPBk0Q+aiALpHo2QMG5MLCCqZbnz5pfWI7LVOJhBfJ+E
   S2bmlwclwnk/iXh49CFDNaT2PFhvEjATQAEbJ7vJ1d/D41Pr3c/tDyNTU
   ECfibWfneVHMiCN8SEHIHjLU+NOrtYqMKXHnTg982cLn/gEbIztpsNsRS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1615946"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1615946"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 08:58:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="6592211"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Feb 2024 08:58:33 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYUCt-0004vm-0R;
	Fri, 09 Feb 2024 16:58:31 +0000
Date: Sat, 10 Feb 2024 00:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pci:endpoint 3/5] drivers/pci/endpoint/pci-epf-core.c:275
 pci_epf_alloc_space() error: uninitialized symbol 'dev'.
Message-ID: <202402100046.9zcFnPl3-lkp@intel.com>
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
TO: Niklas Cassel <cassel@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git endpoint
head:   f7bcec825e728e0baecf96118e36c8afb7b93f8a
commit: 6441639b8a253254b00d7ccfbc2c9c67a8f42d10 [3/5] PCI: endpoint: Improve pci_epf_alloc_space() API
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-161-20240209 (https://download.01.org/0day-ci/archive/20240210/202402100046.9zcFnPl3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402100046.9zcFnPl3-lkp@intel.com/

smatch warnings:
drivers/pci/endpoint/pci-epf-core.c:275 pci_epf_alloc_space() error: uninitialized symbol 'dev'.

vim +/dev +275 drivers/pci/endpoint/pci-epf-core.c

5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  248  
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  249  /**
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  250   * pci_epf_alloc_space() - allocate memory for the PCI EPF register space
9b41d19aff4090 Krzysztof Kozlowski    2020-07-29  251   * @epf: the EPF device to whom allocate the memory
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  252   * @size: the size of the memory that has to be allocated
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  253   * @bar: the BAR number corresponding to the allocated register space
e891becdccaa90 Niklas Cassel          2024-02-07  254   * @epc_features: the features provided by the EPC specific to this EPF
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  255   * @type: Identifies if the allocation is for primary EPC or secondary EPC
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  256   *
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  257   * Invoke to allocate memory for the PCI EPF register space.
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  258   */
2a9a801620efac Kishon Vijay Abraham I 2019-03-25  259  void *pci_epf_alloc_space(struct pci_epf *epf, size_t size, enum pci_barno bar,
e891becdccaa90 Niklas Cassel          2024-02-07  260  			  const struct pci_epc_features *epc_features,
e891becdccaa90 Niklas Cassel          2024-02-07  261  			  enum pci_epc_interface_type type)
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  262  {
6441639b8a2532 Niklas Cassel          2024-02-07  263  	u64 bar_fixed_size = epc_features->bar_fixed_size[bar];
e891becdccaa90 Niklas Cassel          2024-02-07  264  	size_t align = epc_features->align;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  265  	struct pci_epf_bar *epf_bar;
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  266  	dma_addr_t phys_addr;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  267  	struct pci_epc *epc;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  268  	struct device *dev;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  269  	void *space;
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  270  
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  271  	if (size < 128)
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  272  		size = 128;
2a9a801620efac Kishon Vijay Abraham I 2019-03-25  273  
6441639b8a2532 Niklas Cassel          2024-02-07  274  	if (bar_fixed_size && size > bar_fixed_size) {
6441639b8a2532 Niklas Cassel          2024-02-07 @275  		dev_err(dev, "requested BAR size is larger than fixed size\n");
6441639b8a2532 Niklas Cassel          2024-02-07  276  		return NULL;
6441639b8a2532 Niklas Cassel          2024-02-07  277  	}
6441639b8a2532 Niklas Cassel          2024-02-07  278  
6441639b8a2532 Niklas Cassel          2024-02-07  279  	if (bar_fixed_size)
6441639b8a2532 Niklas Cassel          2024-02-07  280  		size = bar_fixed_size;
6441639b8a2532 Niklas Cassel          2024-02-07  281  
2a9a801620efac Kishon Vijay Abraham I 2019-03-25  282  	if (align)
2a9a801620efac Kishon Vijay Abraham I 2019-03-25  283  		size = ALIGN(size, align);
2a9a801620efac Kishon Vijay Abraham I 2019-03-25  284  	else
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  285  		size = roundup_pow_of_two(size);
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  286  
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  287  	if (type == PRIMARY_INTERFACE) {
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  288  		epc = epf->epc;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  289  		epf_bar = epf->bar;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  290  	} else {
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  291  		epc = epf->sec_epc;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  292  		epf_bar = epf->sec_epc_bar;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  293  	}
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  294  
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  295  	dev = epc->dev.parent;
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  296  	space = dma_alloc_coherent(dev, size, &phys_addr, GFP_KERNEL);
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  297  	if (!space) {
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  298  		dev_err(dev, "failed to allocate mem space\n");
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  299  		return NULL;
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  300  	}
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  301  
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  302  	epf_bar[bar].phys_addr = phys_addr;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  303  	epf_bar[bar].addr = space;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  304  	epf_bar[bar].size = size;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  305  	epf_bar[bar].barno = bar;
63840ff5322373 Kishon Vijay Abraham I 2021-02-02  306  	epf_bar[bar].flags |= upper_32_bits(size) ?
5544d67ed11245 Kishon Vijay Abraham I 2019-01-14  307  				PCI_BASE_ADDRESS_MEM_TYPE_64 :
5544d67ed11245 Kishon Vijay Abraham I 2019-01-14  308  				PCI_BASE_ADDRESS_MEM_TYPE_32;
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  309  
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  310  	return space;
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  311  }
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  312  EXPORT_SYMBOL_GPL(pci_epf_alloc_space);
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  313  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
