Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72312DCBF4
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452193; cv=none; b=sazVDNwpsFhlGMn2pCvX8RMrOEl8BGm3X1UAHWo4paQyR2aRA1E8cSCkghEevQ3Bh8LweO3LyGyoYvF4NOLioZ62MOw2AwfhsZsriZhuvRqIQ1ZRyCYhQ4jtvsgkVJe1rslMV1wOYTwyOFFet/PZ17ZSNvjeYH9zrkaSR5egvRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452193; c=relaxed/simple;
	bh=oNLHpH7T5kJwifYo81vK9X66FiYRwFm60XFqdt55kbM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rvOulLKefBW8CYr/2RluTL05sd9umiGPGbknaV+2gUmr25Z18SmK/4/GdQtg1BM6tmAD1I4FRkVR04RH2ZXVz9xk56tdRWxUQ2B8xea8D61QPd6u7QT7KHfNm0tRpmE/qUWCEu5vCaJlJCHI7rP4e0LUA5odk8xm80rj8PrHDec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDNmFveq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDNmFveq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774452191; x=1805988191;
  h=date:from:to:cc:subject:message-id;
  bh=oNLHpH7T5kJwifYo81vK9X66FiYRwFm60XFqdt55kbM=;
  b=bDNmFveqO2iLRiEgmjCTETs3tl5RnKFyL+91ZYVfl9e3WTmMzZxWZxZ9
   /h+K0G0qFgInTSGZYgetbMe/L+cshy+IDvwi9exkc7x+f9ZrC460zixpH
   rT89LHKz7vB0jMAVQ41+rea2kYefvCX7K7kMvHl7LL5HYGsHYPsJYtWeJ
   GFUvzdntyoe/jS8E18NoRiTDqD2E5t1N6tOmxnHSpnKsu4nbPsBM/rFvy
   /WeRsTr63X/QPdjcInOPQ/xape7wAGzF3pKb2jRn0nf/6TD67DO3BWUFC
   j+XXWN4YdFD4SyJWGPNT+vJ9LV/Ewp4wvDp8UGLJaedbj6VC7xJCX8DnC
   g==;
X-CSE-ConnectionGUID: ZrPKFvFLTh670UxqzPwYtw==
X-CSE-MsgGUID: TYJTuX+RQT6Cc3LKUgyP2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86572244"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="86572244"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 08:23:00 -0700
X-CSE-ConnectionGUID: mkD8GkTtQByBIGRWmWPg4A==
X-CSE-MsgGUID: Dp3sUMqRRP+e3TjK3o+pQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="248211227"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2026 08:22:59 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Q4O-0000000077l-3iap;
	Wed, 25 Mar 2026 15:22:56 +0000
Date: Wed, 25 Mar 2026 23:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mtd/nand/raw/cadence-nand-controller.c:2956
 cadence_nand_init() warn: variable dereferenced before check
 'cdns_ctrl->dmac' (see line 2918)
Message-ID: <202603252339.fQzI6oc8-lkp@intel.com>
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
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: 5c56bf214af85ca042bf97f8584aab2151035840 mtd: rawnand: cadence: fix DMA device NULL pointer dereference
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: openrisc-randconfig-r073-20260325 (https://download.01.org/0day-ci/archive/20260325/202603252339.fQzI6oc8-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603252339.fQzI6oc8-lkp@intel.com/

smatch warnings:
drivers/mtd/nand/raw/cadence-nand-controller.c:2956 cadence_nand_init() warn: variable dereferenced before check 'cdns_ctrl->dmac' (see line 2918)

vim +2956 drivers/mtd/nand/raw/cadence-nand-controller.c

ec4ba01e894d316 Piotr Sroka         2019-09-26  2870  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2871  static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
ec4ba01e894d316 Piotr Sroka         2019-09-26  2872  {
ec4ba01e894d316 Piotr Sroka         2019-09-26  2873  	dma_cap_mask_t mask;
5c56bf214af85ca Niravkumar L Rabara 2025-10-23  2874  	struct dma_device *dma_dev;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2875  	int ret;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2876  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2877  	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
ec4ba01e894d316 Piotr Sroka         2019-09-26  2878  						  sizeof(*cdns_ctrl->cdma_desc),
ec4ba01e894d316 Piotr Sroka         2019-09-26  2879  						  &cdns_ctrl->dma_cdma_desc,
ec4ba01e894d316 Piotr Sroka         2019-09-26  2880  						  GFP_KERNEL);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2881  	if (!cdns_ctrl->dma_cdma_desc)
ec4ba01e894d316 Piotr Sroka         2019-09-26  2882  		return -ENOMEM;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2883  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2884  	cdns_ctrl->buf_size = SZ_16K;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2885  	cdns_ctrl->buf = kmalloc(cdns_ctrl->buf_size, GFP_KERNEL);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2886  	if (!cdns_ctrl->buf) {
ec4ba01e894d316 Piotr Sroka         2019-09-26  2887  		ret = -ENOMEM;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2888  		goto free_buf_desc;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2889  	}
ec4ba01e894d316 Piotr Sroka         2019-09-26  2890  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2891  	if (devm_request_irq(cdns_ctrl->dev, cdns_ctrl->irq, cadence_nand_isr,
ec4ba01e894d316 Piotr Sroka         2019-09-26  2892  			     IRQF_SHARED, "cadence-nand-controller",
ec4ba01e894d316 Piotr Sroka         2019-09-26  2893  			     cdns_ctrl)) {
ec4ba01e894d316 Piotr Sroka         2019-09-26  2894  		dev_err(cdns_ctrl->dev, "Unable to allocate IRQ\n");
ec4ba01e894d316 Piotr Sroka         2019-09-26  2895  		ret = -ENODEV;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2896  		goto free_buf;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2897  	}
ec4ba01e894d316 Piotr Sroka         2019-09-26  2898  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2899  	spin_lock_init(&cdns_ctrl->irq_lock);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2900  	init_completion(&cdns_ctrl->complete);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2901  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2902  	ret = cadence_nand_hw_init(cdns_ctrl);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2903  	if (ret)
ec4ba01e894d316 Piotr Sroka         2019-09-26  2904  		goto disable_irq;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2905  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2906  	dma_cap_zero(mask);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2907  	dma_cap_set(DMA_MEMCPY, mask);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2908  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2909  	if (cdns_ctrl->caps1->has_dma) {
2b9df00cded911e Niravkumar L Rabara 2025-02-10  2910  		cdns_ctrl->dmac = dma_request_chan_by_mask(&mask);
2b9df00cded911e Niravkumar L Rabara 2025-02-10  2911  		if (IS_ERR(cdns_ctrl->dmac)) {
2b9df00cded911e Niravkumar L Rabara 2025-02-10  2912  			ret = dev_err_probe(cdns_ctrl->dev, PTR_ERR(cdns_ctrl->dmac),
2b9df00cded911e Niravkumar L Rabara 2025-02-10  2913  					    "%d: Failed to get a DMA channel\n", ret);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2914  			goto disable_irq;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2915  		}
ec4ba01e894d316 Piotr Sroka         2019-09-26  2916  	}
ec4ba01e894d316 Piotr Sroka         2019-09-26  2917  
5c56bf214af85ca Niravkumar L Rabara 2025-10-23 @2918  	dma_dev = cdns_ctrl->dmac->device;
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2919  	cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev->dev, cdns_ctrl->io.dma,
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2920  						  cdns_ctrl->io.size,
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2921  						  DMA_BIDIRECTIONAL, 0);
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2922  
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2923  	ret = dma_mapping_error(dma_dev->dev, cdns_ctrl->io.iova_dma);
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2924  	if (ret) {
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2925  		dev_err(cdns_ctrl->dev, "Failed to map I/O resource to DMA\n");
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2926  		goto dma_release_chnl;
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2927  	}
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2928  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2929  	nand_controller_init(&cdns_ctrl->controller);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2930  	INIT_LIST_HEAD(&cdns_ctrl->chips);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2931  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2932  	cdns_ctrl->controller.ops = &cadence_nand_controller_ops;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2933  	cdns_ctrl->curr_corr_str_idx = 0xFF;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2934  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2935  	ret = cadence_nand_chips_init(cdns_ctrl);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2936  	if (ret) {
ec4ba01e894d316 Piotr Sroka         2019-09-26  2937  		dev_err(cdns_ctrl->dev, "Failed to register MTD: %d\n",
ec4ba01e894d316 Piotr Sroka         2019-09-26  2938  			ret);
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2939  		goto unmap_dma_resource;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2940  	}
ec4ba01e894d316 Piotr Sroka         2019-09-26  2941  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2942  	kfree(cdns_ctrl->buf);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2943  	cdns_ctrl->buf = kzalloc(cdns_ctrl->buf_size, GFP_KERNEL);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2944  	if (!cdns_ctrl->buf) {
ec4ba01e894d316 Piotr Sroka         2019-09-26  2945  		ret = -ENOMEM;
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2946  		goto unmap_dma_resource;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2947  	}
ec4ba01e894d316 Piotr Sroka         2019-09-26  2948  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2949  	return 0;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2950  
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2951  unmap_dma_resource:
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2952  	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2953  			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2954  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2955  dma_release_chnl:
ec4ba01e894d316 Piotr Sroka         2019-09-26 @2956  	if (cdns_ctrl->dmac)
ec4ba01e894d316 Piotr Sroka         2019-09-26  2957  		dma_release_channel(cdns_ctrl->dmac);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2958  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2959  disable_irq:
ec4ba01e894d316 Piotr Sroka         2019-09-26  2960  	cadence_nand_irq_cleanup(cdns_ctrl->irq, cdns_ctrl);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2961  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2962  free_buf:
ec4ba01e894d316 Piotr Sroka         2019-09-26  2963  	kfree(cdns_ctrl->buf);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2964  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2965  free_buf_desc:
ec4ba01e894d316 Piotr Sroka         2019-09-26  2966  	dma_free_coherent(cdns_ctrl->dev, sizeof(struct cadence_nand_cdma_desc),
ec4ba01e894d316 Piotr Sroka         2019-09-26  2967  			  cdns_ctrl->cdma_desc, cdns_ctrl->dma_cdma_desc);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2968  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2969  	return ret;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2970  }
ec4ba01e894d316 Piotr Sroka         2019-09-26  2971  

:::::: The code at line 2956 was first introduced by commit
:::::: ec4ba01e894d3165e4d1ccbef782ef5593b708b4 mtd: rawnand: Add new Cadence NAND driver to MTD subsystem

:::::: TO: Piotr Sroka <piotrs@cadence.com>
:::::: CC: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
