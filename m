Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE55F41930F
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 08:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980109; cv=none; b=rpolFs0ondwAGJbDC+CayDA3mGcxBJuDwOhvQHWStj2ieetoBF6mDHDWws/w0pFUOGqRkVHncHJiAtzk2gvo4AfcowR7hJWOV7df2GOqWV7SosWd20pqmpC6UwaJyTXvs79imNG+9nfM5IjNPOZgJRz99Jl+e2bTHyL4jUHAJ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980109; c=relaxed/simple;
	bh=yY6efiF6duF7KRgYF4jWLLJXrBiMAPtOtRAPmJMwviM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QAgXRRUa9trKDKIDVoymm+v5vycd/pw5mqN9ZMSIyaKwzLaI0envuEChwaBlXk+8KNvRTHqoo1p7aVu6RyVKHclKOSZhTEsbMmaqFtjSINPFlZlpMLSJYQOd3dPgGCBjTtZGIEwr1GCKIBOziWZoyLXLa0rOAbXGWYV3obQHd1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJTTZ/qz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJTTZ/qz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782980104; x=1814516104;
  h=date:from:to:cc:subject:message-id;
  bh=yY6efiF6duF7KRgYF4jWLLJXrBiMAPtOtRAPmJMwviM=;
  b=PJTTZ/qziK+y/etqfq01dG8mmvsv4B+HMUF/VPM2hSz2seBrTmZy5Sy/
   QFqKYkPc163SuAV45zZavNa9SQorpyNq0v+SGI+tFbaD2CtBkMVavKIaw
   CYgWqUmI26m8cqSHTB0WNvQZ/zWguRQMN9O5f2CZTsf00ofuv3YjJlR0f
   3LxVH5Cusn9papOhsH+WyjnMy250GNyBZf2pF7J2hOUCcUz5y2K4femCB
   gk/osRaF0KYryUMS5DgbdjV31ZdagJs/PSiz1qc70JaXnYhZ617xLuYeM
   Er/l3CdqtCmc2ljYEubXFZ1c+39MbIV5I3F3sFXAsEtKRHHhceVldehVS
   g==;
X-CSE-ConnectionGUID: qerYfQU2RY2umWoNNlECGw==
X-CSE-MsgGUID: UFosUfqkSF+cRc/bPtbyBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="71248128"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="71248128"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:15:02 -0700
X-CSE-ConnectionGUID: qHc1dHUGR5+DtqOWkHxhbQ==
X-CSE-MsgGUID: MqntV7JLQ6W9Y/V+VfD7bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251748293"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Jul 2026 01:15:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfCZW-00000000AWP-2DOs;
	Thu, 02 Jul 2026 08:14:58 +0000
Date: Thu, 02 Jul 2026 16:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/loongson/loongson2-apb-cmc-dma.c:516
 loongson2_cmc_dma_tx_status() error: we previously assumed 'lchan->desc'
 could be null (see line 512)
Message-ID: <202607021640.IoeoHcDy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Binbin Zhou <zhoubinbin@loongson.cn>
CC: Vinod Koul <vkoul@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>
CC: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: 1c0028e725f156ebabe68b0025f9c8e7a6170ffd dmaengine: loongson: New driver for the Loongson Multi-Channel DMA controller
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
config: sparc64-randconfig-r072-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021640.IoeoHcDy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1c0028e725f1 ("dmaengine: loongson: New driver for the Loongson Multi-Channel DMA controller")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607021640.IoeoHcDy-lkp@intel.com/

smatch warnings:
drivers/dma/loongson/loongson2-apb-cmc-dma.c:516 loongson2_cmc_dma_tx_status() error: we previously assumed 'lchan->desc' could be null (see line 512)
drivers/dma/loongson/loongson2-apb-cmc-dma.c:677 loongson2_cmc_dma_probe() warn: unsigned 'lchan->irq' is never less than zero.

vim +516 drivers/dma/loongson/loongson2-apb-cmc-dma.c

1c0028e725f156e Binbin Zhou 2026-03-07  498  
1c0028e725f156e Binbin Zhou 2026-03-07  499  static enum dma_status loongson2_cmc_dma_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
1c0028e725f156e Binbin Zhou 2026-03-07  500  						   struct dma_tx_state *state)
1c0028e725f156e Binbin Zhou 2026-03-07  501  {
1c0028e725f156e Binbin Zhou 2026-03-07  502  	struct loongson2_cmc_dma_chan *lchan = to_lmdma_chan(chan);
1c0028e725f156e Binbin Zhou 2026-03-07  503  	struct virt_dma_desc *vdesc;
1c0028e725f156e Binbin Zhou 2026-03-07  504  	enum dma_status status;
1c0028e725f156e Binbin Zhou 2026-03-07  505  
1c0028e725f156e Binbin Zhou 2026-03-07  506  	status = dma_cookie_status(chan, cookie, state);
1c0028e725f156e Binbin Zhou 2026-03-07  507  	if (status == DMA_COMPLETE || !state)
1c0028e725f156e Binbin Zhou 2026-03-07  508  		return status;
1c0028e725f156e Binbin Zhou 2026-03-07  509  
1c0028e725f156e Binbin Zhou 2026-03-07  510  	scoped_guard(spinlock_irqsave, &lchan->vchan.lock) {
1c0028e725f156e Binbin Zhou 2026-03-07  511  		vdesc = vchan_find_desc(&lchan->vchan, cookie);
1c0028e725f156e Binbin Zhou 2026-03-07 @512  		if (lchan->desc && cookie == lchan->desc->vdesc.tx.cookie)
1c0028e725f156e Binbin Zhou 2026-03-07  513  			state->residue = loongson2_cmc_dma_desc_residue(lchan, lchan->desc,
1c0028e725f156e Binbin Zhou 2026-03-07  514  									lchan->next_sg);
1c0028e725f156e Binbin Zhou 2026-03-07  515  		else if (vdesc)
1c0028e725f156e Binbin Zhou 2026-03-07 @516  			state->residue = loongson2_cmc_dma_desc_residue(lchan,
1c0028e725f156e Binbin Zhou 2026-03-07  517  									to_lmdma_desc(vdesc), 0);
1c0028e725f156e Binbin Zhou 2026-03-07  518  	}
1c0028e725f156e Binbin Zhou 2026-03-07  519  
1c0028e725f156e Binbin Zhou 2026-03-07  520  	return status;
1c0028e725f156e Binbin Zhou 2026-03-07  521  }
1c0028e725f156e Binbin Zhou 2026-03-07  522  
1c0028e725f156e Binbin Zhou 2026-03-07  523  static void loongson2_cmc_dma_free_chan_resources(struct dma_chan *chan)
1c0028e725f156e Binbin Zhou 2026-03-07  524  {
1c0028e725f156e Binbin Zhou 2026-03-07  525  	vchan_free_chan_resources(to_virt_chan(chan));
1c0028e725f156e Binbin Zhou 2026-03-07  526  }
1c0028e725f156e Binbin Zhou 2026-03-07  527  
1c0028e725f156e Binbin Zhou 2026-03-07  528  static void loongson2_cmc_dma_desc_free(struct virt_dma_desc *vdesc)
1c0028e725f156e Binbin Zhou 2026-03-07  529  {
1c0028e725f156e Binbin Zhou 2026-03-07  530  	kfree(to_lmdma_desc(vdesc));
1c0028e725f156e Binbin Zhou 2026-03-07  531  }
1c0028e725f156e Binbin Zhou 2026-03-07  532  
1c0028e725f156e Binbin Zhou 2026-03-07  533  static bool loongson2_cmc_dma_acpi_filter(struct dma_chan *chan, void *param)
1c0028e725f156e Binbin Zhou 2026-03-07  534  {
1c0028e725f156e Binbin Zhou 2026-03-07  535  	struct loongson2_cmc_dma_chan *lchan = to_lmdma_chan(chan);
1c0028e725f156e Binbin Zhou 2026-03-07  536  	struct acpi_dma_spec *dma_spec = param;
1c0028e725f156e Binbin Zhou 2026-03-07  537  
1c0028e725f156e Binbin Zhou 2026-03-07  538  	memset(&lchan->chan_reg, 0, sizeof(struct loongson2_cmc_dma_chan_reg));
1c0028e725f156e Binbin Zhou 2026-03-07  539  	lchan->chan_reg.ccr = dma_spec->chan_id & LOONGSON2_CMCDMA_STREAM_MASK;
1c0028e725f156e Binbin Zhou 2026-03-07  540  
1c0028e725f156e Binbin Zhou 2026-03-07  541  	return true;
1c0028e725f156e Binbin Zhou 2026-03-07  542  }
1c0028e725f156e Binbin Zhou 2026-03-07  543  
1c0028e725f156e Binbin Zhou 2026-03-07  544  static int loongson2_cmc_dma_acpi_controller_register(struct loongson2_cmc_dma_dev *lddev)
1c0028e725f156e Binbin Zhou 2026-03-07  545  {
1c0028e725f156e Binbin Zhou 2026-03-07  546  	struct device *dev = lddev->ddev.dev;
1c0028e725f156e Binbin Zhou 2026-03-07  547  	struct acpi_dma_filter_info *info;
1c0028e725f156e Binbin Zhou 2026-03-07  548  
1c0028e725f156e Binbin Zhou 2026-03-07  549  	if (!is_acpi_node(dev_fwnode(dev)))
1c0028e725f156e Binbin Zhou 2026-03-07  550  		return 0;
1c0028e725f156e Binbin Zhou 2026-03-07  551  
1c0028e725f156e Binbin Zhou 2026-03-07  552  	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
1c0028e725f156e Binbin Zhou 2026-03-07  553  	if (!info)
1c0028e725f156e Binbin Zhou 2026-03-07  554  		return -ENOMEM;
1c0028e725f156e Binbin Zhou 2026-03-07  555  
1c0028e725f156e Binbin Zhou 2026-03-07  556  	dma_cap_zero(info->dma_cap);
1c0028e725f156e Binbin Zhou 2026-03-07  557  	info->dma_cap = lddev->ddev.cap_mask;
1c0028e725f156e Binbin Zhou 2026-03-07  558  	info->filter_fn = loongson2_cmc_dma_acpi_filter;
1c0028e725f156e Binbin Zhou 2026-03-07  559  
1c0028e725f156e Binbin Zhou 2026-03-07  560  	return devm_acpi_dma_controller_register(dev, acpi_dma_simple_xlate, info);
1c0028e725f156e Binbin Zhou 2026-03-07  561  }
1c0028e725f156e Binbin Zhou 2026-03-07  562  
1c0028e725f156e Binbin Zhou 2026-03-07  563  static struct dma_chan *loongson2_cmc_dma_of_xlate(struct of_phandle_args *dma_spec,
1c0028e725f156e Binbin Zhou 2026-03-07  564  						   struct of_dma *ofdma)
1c0028e725f156e Binbin Zhou 2026-03-07  565  {
1c0028e725f156e Binbin Zhou 2026-03-07  566  	struct loongson2_cmc_dma_dev *lddev = ofdma->of_dma_data;
1c0028e725f156e Binbin Zhou 2026-03-07  567  	struct device *dev = lddev->ddev.dev;
1c0028e725f156e Binbin Zhou 2026-03-07  568  	struct loongson2_cmc_dma_chan *lchan;
1c0028e725f156e Binbin Zhou 2026-03-07  569  	struct dma_chan *chan;
1c0028e725f156e Binbin Zhou 2026-03-07  570  
1c0028e725f156e Binbin Zhou 2026-03-07  571  	if (dma_spec->args_count < 2)
1c0028e725f156e Binbin Zhou 2026-03-07  572  		return ERR_PTR(-EINVAL);
1c0028e725f156e Binbin Zhou 2026-03-07  573  
1c0028e725f156e Binbin Zhou 2026-03-07  574  	if (dma_spec->args[0] >= lddev->nr_channels) {
1c0028e725f156e Binbin Zhou 2026-03-07  575  		dev_err(dev, "Invalid channel id.\n");
1c0028e725f156e Binbin Zhou 2026-03-07  576  		return ERR_PTR(-EINVAL);
1c0028e725f156e Binbin Zhou 2026-03-07  577  	}
1c0028e725f156e Binbin Zhou 2026-03-07  578  
1c0028e725f156e Binbin Zhou 2026-03-07  579  	lchan = &lddev->chan[dma_spec->args[0]];
1c0028e725f156e Binbin Zhou 2026-03-07  580  	chan = dma_get_slave_channel(&lchan->vchan.chan);
1c0028e725f156e Binbin Zhou 2026-03-07  581  	if (!chan) {
1c0028e725f156e Binbin Zhou 2026-03-07  582  		dev_err(dev, "No more channels available.\n");
1c0028e725f156e Binbin Zhou 2026-03-07  583  		return ERR_PTR(-EINVAL);
1c0028e725f156e Binbin Zhou 2026-03-07  584  	}
1c0028e725f156e Binbin Zhou 2026-03-07  585  
1c0028e725f156e Binbin Zhou 2026-03-07  586  	memset(&lchan->chan_reg, 0, sizeof(struct loongson2_cmc_dma_chan_reg));
1c0028e725f156e Binbin Zhou 2026-03-07  587  	lchan->chan_reg.ccr = dma_spec->args[1] & LOONGSON2_CMCDMA_STREAM_MASK;
1c0028e725f156e Binbin Zhou 2026-03-07  588  
1c0028e725f156e Binbin Zhou 2026-03-07  589  	return chan;
1c0028e725f156e Binbin Zhou 2026-03-07  590  }
1c0028e725f156e Binbin Zhou 2026-03-07  591  
1c0028e725f156e Binbin Zhou 2026-03-07  592  static int loongson2_cmc_dma_of_controller_register(struct loongson2_cmc_dma_dev *lddev)
1c0028e725f156e Binbin Zhou 2026-03-07  593  {
1c0028e725f156e Binbin Zhou 2026-03-07  594  	struct device *dev = lddev->ddev.dev;
1c0028e725f156e Binbin Zhou 2026-03-07  595  
1c0028e725f156e Binbin Zhou 2026-03-07  596  	if (!is_of_node(dev_fwnode(dev)))
1c0028e725f156e Binbin Zhou 2026-03-07  597  		return 0;
1c0028e725f156e Binbin Zhou 2026-03-07  598  
1c0028e725f156e Binbin Zhou 2026-03-07  599  	return of_dma_controller_register(dev->of_node, loongson2_cmc_dma_of_xlate, lddev);
1c0028e725f156e Binbin Zhou 2026-03-07  600  }
1c0028e725f156e Binbin Zhou 2026-03-07  601  
1c0028e725f156e Binbin Zhou 2026-03-07  602  static int loongson2_cmc_dma_probe(struct platform_device *pdev)
1c0028e725f156e Binbin Zhou 2026-03-07  603  {
1c0028e725f156e Binbin Zhou 2026-03-07  604  	const struct loongson2_cmc_dma_config *config;
1c0028e725f156e Binbin Zhou 2026-03-07  605  	struct loongson2_cmc_dma_chan *lchan;
1c0028e725f156e Binbin Zhou 2026-03-07  606  	struct loongson2_cmc_dma_dev *lddev;
1c0028e725f156e Binbin Zhou 2026-03-07  607  	struct device *dev = &pdev->dev;
1c0028e725f156e Binbin Zhou 2026-03-07  608  	struct dma_device *ddev;
1c0028e725f156e Binbin Zhou 2026-03-07  609  	u32 nr_chans, i;
1c0028e725f156e Binbin Zhou 2026-03-07  610  	int ret;
1c0028e725f156e Binbin Zhou 2026-03-07  611  
1c0028e725f156e Binbin Zhou 2026-03-07  612  	config = (const struct loongson2_cmc_dma_config *)device_get_match_data(dev);
1c0028e725f156e Binbin Zhou 2026-03-07  613  	if (!config)
1c0028e725f156e Binbin Zhou 2026-03-07  614  		return -EINVAL;
1c0028e725f156e Binbin Zhou 2026-03-07  615  
1c0028e725f156e Binbin Zhou 2026-03-07  616  	ret = device_property_read_u32(dev, "dma-channels", &nr_chans);
1c0028e725f156e Binbin Zhou 2026-03-07  617  	if (ret || nr_chans > config->max_channels) {
1c0028e725f156e Binbin Zhou 2026-03-07  618  		dev_err(dev, "missing or invalid dma-channels property\n");
1c0028e725f156e Binbin Zhou 2026-03-07  619  		nr_chans = config->max_channels;
1c0028e725f156e Binbin Zhou 2026-03-07  620  	}
1c0028e725f156e Binbin Zhou 2026-03-07  621  
1c0028e725f156e Binbin Zhou 2026-03-07  622  	lddev = devm_kzalloc(dev, struct_size(lddev, chan, nr_chans), GFP_KERNEL);
1c0028e725f156e Binbin Zhou 2026-03-07  623  	if (!lddev)
1c0028e725f156e Binbin Zhou 2026-03-07  624  		return -ENOMEM;
1c0028e725f156e Binbin Zhou 2026-03-07  625  
1c0028e725f156e Binbin Zhou 2026-03-07  626  	lddev->base = devm_platform_ioremap_resource(pdev, 0);
1c0028e725f156e Binbin Zhou 2026-03-07  627  	if (IS_ERR(lddev->base))
1c0028e725f156e Binbin Zhou 2026-03-07  628  		return PTR_ERR(lddev->base);
1c0028e725f156e Binbin Zhou 2026-03-07  629  
1c0028e725f156e Binbin Zhou 2026-03-07  630  	platform_set_drvdata(pdev, lddev);
1c0028e725f156e Binbin Zhou 2026-03-07  631  	lddev->nr_channels = nr_chans;
1c0028e725f156e Binbin Zhou 2026-03-07  632  	lddev->chan_reg_offset = config->chan_reg_offset;
1c0028e725f156e Binbin Zhou 2026-03-07  633  
1c0028e725f156e Binbin Zhou 2026-03-07  634  	lddev->dma_clk = devm_clk_get_optional_enabled(dev, NULL);
1c0028e725f156e Binbin Zhou 2026-03-07  635  	if (IS_ERR(lddev->dma_clk))
1c0028e725f156e Binbin Zhou 2026-03-07  636  		return dev_err_probe(dev, PTR_ERR(lddev->dma_clk), "Failed to get dma clock\n");
1c0028e725f156e Binbin Zhou 2026-03-07  637  
1c0028e725f156e Binbin Zhou 2026-03-07  638  	ddev = &lddev->ddev;
1c0028e725f156e Binbin Zhou 2026-03-07  639  	ddev->dev = dev;
1c0028e725f156e Binbin Zhou 2026-03-07  640  
1c0028e725f156e Binbin Zhou 2026-03-07  641  	dma_cap_zero(ddev->cap_mask);
1c0028e725f156e Binbin Zhou 2026-03-07  642  	dma_cap_set(DMA_SLAVE, ddev->cap_mask);
1c0028e725f156e Binbin Zhou 2026-03-07  643  	dma_cap_set(DMA_PRIVATE, ddev->cap_mask);
1c0028e725f156e Binbin Zhou 2026-03-07  644  	dma_cap_set(DMA_CYCLIC, ddev->cap_mask);
1c0028e725f156e Binbin Zhou 2026-03-07  645  
1c0028e725f156e Binbin Zhou 2026-03-07  646  	ddev->device_free_chan_resources = loongson2_cmc_dma_free_chan_resources;
1c0028e725f156e Binbin Zhou 2026-03-07  647  	ddev->device_config = loongson2_cmc_dma_slave_config;
1c0028e725f156e Binbin Zhou 2026-03-07  648  	ddev->device_prep_slave_sg = loongson2_cmc_dma_prep_slave_sg;
1c0028e725f156e Binbin Zhou 2026-03-07  649  	ddev->device_prep_dma_cyclic = loongson2_cmc_dma_prep_dma_cyclic;
1c0028e725f156e Binbin Zhou 2026-03-07  650  	ddev->device_issue_pending = loongson2_cmc_dma_issue_pending;
1c0028e725f156e Binbin Zhou 2026-03-07  651  	ddev->device_synchronize = loongson2_cmc_dma_synchronize;
1c0028e725f156e Binbin Zhou 2026-03-07  652  	ddev->device_tx_status = loongson2_cmc_dma_tx_status;
1c0028e725f156e Binbin Zhou 2026-03-07  653  	ddev->device_terminate_all = loongson2_cmc_dma_terminate_all;
1c0028e725f156e Binbin Zhou 2026-03-07  654  
1c0028e725f156e Binbin Zhou 2026-03-07  655  	ddev->max_sg_burst = LOONSON2_CMCDMA_MAX_DATA_ITEMS;
1c0028e725f156e Binbin Zhou 2026-03-07  656  	ddev->src_addr_widths = LOONGSON2_CMCDMA_BUSWIDTHS;
1c0028e725f156e Binbin Zhou 2026-03-07  657  	ddev->dst_addr_widths = LOONGSON2_CMCDMA_BUSWIDTHS;
1c0028e725f156e Binbin Zhou 2026-03-07  658  	ddev->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
1c0028e725f156e Binbin Zhou 2026-03-07  659  	INIT_LIST_HEAD(&ddev->channels);
1c0028e725f156e Binbin Zhou 2026-03-07  660  
1c0028e725f156e Binbin Zhou 2026-03-07  661  	for (i = 0; i < nr_chans; i++) {
1c0028e725f156e Binbin Zhou 2026-03-07  662  		lchan = &lddev->chan[i];
1c0028e725f156e Binbin Zhou 2026-03-07  663  
1c0028e725f156e Binbin Zhou 2026-03-07  664  		lchan->id = i;
1c0028e725f156e Binbin Zhou 2026-03-07  665  		lchan->vchan.desc_free = loongson2_cmc_dma_desc_free;
1c0028e725f156e Binbin Zhou 2026-03-07  666  		vchan_init(&lchan->vchan, ddev);
1c0028e725f156e Binbin Zhou 2026-03-07  667  	}
1c0028e725f156e Binbin Zhou 2026-03-07  668  
1c0028e725f156e Binbin Zhou 2026-03-07  669  	ret = dmaenginem_async_device_register(ddev);
1c0028e725f156e Binbin Zhou 2026-03-07  670  	if (ret)
1c0028e725f156e Binbin Zhou 2026-03-07  671  		return dev_err_probe(dev, ret, "Failed to register DMA engine device.\n");
1c0028e725f156e Binbin Zhou 2026-03-07  672  
1c0028e725f156e Binbin Zhou 2026-03-07  673  	for (i = 0; i < nr_chans; i++) {
1c0028e725f156e Binbin Zhou 2026-03-07  674  		lchan = &lddev->chan[i];
1c0028e725f156e Binbin Zhou 2026-03-07  675  
1c0028e725f156e Binbin Zhou 2026-03-07  676  		lchan->irq = platform_get_irq(pdev, i);
1c0028e725f156e Binbin Zhou 2026-03-07 @677  		if (lchan->irq < 0)
1c0028e725f156e Binbin Zhou 2026-03-07  678  			return lchan->irq;
1c0028e725f156e Binbin Zhou 2026-03-07  679  
1c0028e725f156e Binbin Zhou 2026-03-07  680  		ret = devm_request_irq(dev, lchan->irq, loongson2_cmc_dma_chan_irq, IRQF_SHARED,
1c0028e725f156e Binbin Zhou 2026-03-07  681  				       dev_name(chan2dev(lchan)), lchan);
1c0028e725f156e Binbin Zhou 2026-03-07  682  		if (ret)
1c0028e725f156e Binbin Zhou 2026-03-07  683  			return ret;
1c0028e725f156e Binbin Zhou 2026-03-07  684  	}
1c0028e725f156e Binbin Zhou 2026-03-07  685  
1c0028e725f156e Binbin Zhou 2026-03-07  686  	ret = loongson2_cmc_dma_acpi_controller_register(lddev);
1c0028e725f156e Binbin Zhou 2026-03-07  687  	if (ret)
1c0028e725f156e Binbin Zhou 2026-03-07  688  		return dev_err_probe(dev, ret, "Failed to register dma controller with ACPI.\n");
1c0028e725f156e Binbin Zhou 2026-03-07  689  
1c0028e725f156e Binbin Zhou 2026-03-07  690  	ret = loongson2_cmc_dma_of_controller_register(lddev);
1c0028e725f156e Binbin Zhou 2026-03-07  691  	if (ret)
1c0028e725f156e Binbin Zhou 2026-03-07  692  		return dev_err_probe(dev, ret, "Failed to register dma controller with FDT.\n");
1c0028e725f156e Binbin Zhou 2026-03-07  693  
1c0028e725f156e Binbin Zhou 2026-03-07  694  	dev_info(dev, "Loongson-2 Multi-Channel DMA Controller registered successfully.\n");
1c0028e725f156e Binbin Zhou 2026-03-07  695  
1c0028e725f156e Binbin Zhou 2026-03-07  696  	return 0;
1c0028e725f156e Binbin Zhou 2026-03-07  697  }
1c0028e725f156e Binbin Zhou 2026-03-07  698  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
