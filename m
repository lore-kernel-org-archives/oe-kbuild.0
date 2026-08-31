Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5903B0AF0
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Aug 2026 23:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788217842; cv=none; b=fZq7CaMZudCAzQEnW3nv7RwMqUjB/D28j//4T4/IguPh204AiMVumrzo+PX9EOxFAuBStgnNJHrfYgfwDuGkrJwdsE7dSzsCZZu6NOxPJxrqmgBMwJPP60rN9Z2I1YwATJQVy00vNuua92CrLUhvMibULbi3BcPcLYjPN7kfdE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788217842; c=relaxed/simple;
	bh=GsNM17NtemV0vFZDA5D5AXOiU+Puk/w4tIixtMEjGas=;
	h=Date:From:To:Cc:Subject:Message-ID; b=skkMBeq+IUzfxkcN4GUx6tR+AVScUwR7mhEdxiMnN52/WD4ozy8k8kLD1x4hBNQp4lft0s9smONF/D4Hl+FQDypSmc40cIZngIGZr320zAHFVYirJYY0tV0LfBuGcp8rDwOeQRTryvetiJD+hIi7fMqj68J/VCumK/2RzPFR8nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6FzXcGL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6FzXcGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788217840; x=1819753840;
  h=date:from:to:cc:subject:message-id;
  bh=GsNM17NtemV0vFZDA5D5AXOiU+Puk/w4tIixtMEjGas=;
  b=Z6FzXcGL3SMhEnl9/YdUsG2ba9i7CcjfQq2UQ/y5jgXMOKz3UyGdKktt
   SKzxrwowhyG6adDDpeqfPbhikFGIFEzl/URDKDPXnOO6bqY/R7w02mTFj
   IRoh82e1xyonjnWkMA5nJfSbvSPtwgVmS5jzfO/M71D68UHdmBaXBbZiv
   YNvwH/KARfnKSM7nvpuBW4vrTpugs7Ec4l2ammN2MuZA4B4msaQRJG7lX
   pICPCyFfcEcn4YL9+SyGd9H7w7bt+O36dhd6tMf2oJR6uExMnUui0P00G
   8Y+5lEpsbc8lkfvMk43FO7m846ZPBXzNp6U2oHxrxtfVQ8lsnYcS8Z4+X
   A==;
X-CSE-ConnectionGUID: v7tcIQ06Rmi/BmLswDiGDA==
X-CSE-MsgGUID: lMp5wRiiSgKqXHD1PoAtFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="76183498"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="76183498"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 16:10:39 -0700
X-CSE-ConnectionGUID: Kct8aNolSGu4/HtSqfBBFw==
X-CSE-MsgGUID: RJLL2duEQ0unbY+7gPU1gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="269503750"
Received: from lkp-server01.sh.intel.com (HELO 793b8a0addc2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Aug 2026 16:10:38 -0700
Received: from kbuild by 793b8a0addc2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1B99-0000000003f-2zKM;
	Mon, 31 Aug 2026 23:10:35 +0000
Date: Tue, 01 Sep 2026 07:10:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mtd/nand/raw/cadence-nand-controller.c:2956
 cadence_nand_init() warn: variable dereferenced before check
 'cdns_ctrl->dmac' (see line 2918)
Message-ID: <202609010758.3N8tYZdG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cee9395acd8043be0644b25c34bfa86623f2b935
commit: 5c56bf214af85ca042bf97f8584aab2151035840 mtd: rawnand: cadence: fix DMA device NULL pointer dereference
date:   10 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20260831 (https://download.01.org/0day-ci/archive/20260901/202609010758.3N8tYZdG-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5c56bf214af8 ("mtd: rawnand: cadence: fix DMA device NULL pointer dereference")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609010758.3N8tYZdG-lkp@intel.com/

smatch warnings:
drivers/mtd/nand/raw/cadence-nand-controller.c:2956 cadence_nand_init() warn: variable dereferenced before check 'cdns_ctrl->dmac' (see line 2918)

vim +2956 drivers/mtd/nand/raw/cadence-nand-controller.c

ec4ba01e894d31 Piotr Sroka         2019-09-26  2870  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2871  static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
ec4ba01e894d31 Piotr Sroka         2019-09-26  2872  {
ec4ba01e894d31 Piotr Sroka         2019-09-26  2873  	dma_cap_mask_t mask;
5c56bf214af85c Niravkumar L Rabara 2025-10-23  2874  	struct dma_device *dma_dev;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2875  	int ret;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2876  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2877  	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
ec4ba01e894d31 Piotr Sroka         2019-09-26  2878  						  sizeof(*cdns_ctrl->cdma_desc),
ec4ba01e894d31 Piotr Sroka         2019-09-26  2879  						  &cdns_ctrl->dma_cdma_desc,
ec4ba01e894d31 Piotr Sroka         2019-09-26  2880  						  GFP_KERNEL);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2881  	if (!cdns_ctrl->dma_cdma_desc)
ec4ba01e894d31 Piotr Sroka         2019-09-26  2882  		return -ENOMEM;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2883  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2884  	cdns_ctrl->buf_size = SZ_16K;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2885  	cdns_ctrl->buf = kmalloc(cdns_ctrl->buf_size, GFP_KERNEL);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2886  	if (!cdns_ctrl->buf) {
ec4ba01e894d31 Piotr Sroka         2019-09-26  2887  		ret = -ENOMEM;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2888  		goto free_buf_desc;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2889  	}
ec4ba01e894d31 Piotr Sroka         2019-09-26  2890  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2891  	if (devm_request_irq(cdns_ctrl->dev, cdns_ctrl->irq, cadence_nand_isr,
ec4ba01e894d31 Piotr Sroka         2019-09-26  2892  			     IRQF_SHARED, "cadence-nand-controller",
ec4ba01e894d31 Piotr Sroka         2019-09-26  2893  			     cdns_ctrl)) {
ec4ba01e894d31 Piotr Sroka         2019-09-26  2894  		dev_err(cdns_ctrl->dev, "Unable to allocate IRQ\n");
ec4ba01e894d31 Piotr Sroka         2019-09-26  2895  		ret = -ENODEV;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2896  		goto free_buf;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2897  	}
ec4ba01e894d31 Piotr Sroka         2019-09-26  2898  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2899  	spin_lock_init(&cdns_ctrl->irq_lock);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2900  	init_completion(&cdns_ctrl->complete);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2901  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2902  	ret = cadence_nand_hw_init(cdns_ctrl);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2903  	if (ret)
ec4ba01e894d31 Piotr Sroka         2019-09-26  2904  		goto disable_irq;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2905  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2906  	dma_cap_zero(mask);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2907  	dma_cap_set(DMA_MEMCPY, mask);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2908  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2909  	if (cdns_ctrl->caps1->has_dma) {
2b9df00cded911 Niravkumar L Rabara 2025-02-10  2910  		cdns_ctrl->dmac = dma_request_chan_by_mask(&mask);
2b9df00cded911 Niravkumar L Rabara 2025-02-10  2911  		if (IS_ERR(cdns_ctrl->dmac)) {
2b9df00cded911 Niravkumar L Rabara 2025-02-10  2912  			ret = dev_err_probe(cdns_ctrl->dev, PTR_ERR(cdns_ctrl->dmac),
2b9df00cded911 Niravkumar L Rabara 2025-02-10  2913  					    "%d: Failed to get a DMA channel\n", ret);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2914  			goto disable_irq;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2915  		}
ec4ba01e894d31 Piotr Sroka         2019-09-26  2916  	}
ec4ba01e894d31 Piotr Sroka         2019-09-26  2917  
5c56bf214af85c Niravkumar L Rabara 2025-10-23 @2918  	dma_dev = cdns_ctrl->dmac->device;
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2919  	cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev->dev, cdns_ctrl->io.dma,
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2920  						  cdns_ctrl->io.size,
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2921  						  DMA_BIDIRECTIONAL, 0);
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2922  
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2923  	ret = dma_mapping_error(dma_dev->dev, cdns_ctrl->io.iova_dma);
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2924  	if (ret) {
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2925  		dev_err(cdns_ctrl->dev, "Failed to map I/O resource to DMA\n");
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2926  		goto dma_release_chnl;
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2927  	}
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2928  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2929  	nand_controller_init(&cdns_ctrl->controller);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2930  	INIT_LIST_HEAD(&cdns_ctrl->chips);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2931  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2932  	cdns_ctrl->controller.ops = &cadence_nand_controller_ops;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2933  	cdns_ctrl->curr_corr_str_idx = 0xFF;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2934  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2935  	ret = cadence_nand_chips_init(cdns_ctrl);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2936  	if (ret) {
ec4ba01e894d31 Piotr Sroka         2019-09-26  2937  		dev_err(cdns_ctrl->dev, "Failed to register MTD: %d\n",
ec4ba01e894d31 Piotr Sroka         2019-09-26  2938  			ret);
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2939  		goto unmap_dma_resource;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2940  	}
ec4ba01e894d31 Piotr Sroka         2019-09-26  2941  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2942  	kfree(cdns_ctrl->buf);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2943  	cdns_ctrl->buf = kzalloc(cdns_ctrl->buf_size, GFP_KERNEL);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2944  	if (!cdns_ctrl->buf) {
ec4ba01e894d31 Piotr Sroka         2019-09-26  2945  		ret = -ENOMEM;
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2946  		goto unmap_dma_resource;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2947  	}
ec4ba01e894d31 Piotr Sroka         2019-09-26  2948  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2949  	return 0;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2950  
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2951  unmap_dma_resource:
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2952  	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2953  			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
d76d22b5096c5b Niravkumar L Rabara 2025-02-10  2954  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2955  dma_release_chnl:
ec4ba01e894d31 Piotr Sroka         2019-09-26 @2956  	if (cdns_ctrl->dmac)
ec4ba01e894d31 Piotr Sroka         2019-09-26  2957  		dma_release_channel(cdns_ctrl->dmac);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2958  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2959  disable_irq:
ec4ba01e894d31 Piotr Sroka         2019-09-26  2960  	cadence_nand_irq_cleanup(cdns_ctrl->irq, cdns_ctrl);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2961  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2962  free_buf:
ec4ba01e894d31 Piotr Sroka         2019-09-26  2963  	kfree(cdns_ctrl->buf);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2964  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2965  free_buf_desc:
ec4ba01e894d31 Piotr Sroka         2019-09-26  2966  	dma_free_coherent(cdns_ctrl->dev, sizeof(struct cadence_nand_cdma_desc),
ec4ba01e894d31 Piotr Sroka         2019-09-26  2967  			  cdns_ctrl->cdma_desc, cdns_ctrl->dma_cdma_desc);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2968  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2969  	return ret;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2970  }
ec4ba01e894d31 Piotr Sroka         2019-09-26  2971  

:::::: The code at line 2956 was first introduced by commit
:::::: ec4ba01e894d3165e4d1ccbef782ef5593b708b4 mtd: rawnand: Add new Cadence NAND driver to MTD subsystem

:::::: TO: Piotr Sroka <piotrs@cadence.com>
:::::: CC: Miquel Raynal <miquel.raynal@bootlin.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
