Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35E419F12D
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Oct 2026 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067091; cv=none; b=njzUWB+IIu5+TfhAWRjvBsI5rkJQ7Iu6zAwZDPc7NUEGTu86uJX5JeT1Q7oEB3COpjNYn28g10ptLLUN7ENk9+1fz9/6+iqHWf6wSYNVyGScQkuDaFZ9y/8f/8OVGQH+vHFcuWVseHDFr1TIAd993Hg3irDdyYRxO4abYcPYfH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067091; c=relaxed/simple;
	bh=z3ypjf9+arMPxJcPS5+1S8YjdtGuJS1GQZhsg8O+eJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s+scpOZKjgkECgwDgFRUHgaiMyRRBwLX3ER27M6Ueb4aiZ1E8qva5jAKa56gqekhwN6l2BrafeIg1238+by/SSabiuA/x90TJ3C7KLpGB3vbzN10bco36pteVVyYew4FtpUWMPzflqDOOUz1/PqwEWWL2Zl76POYPbUj/+B5+98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDw1Lhdh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDw1Lhdh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49e73611928so45455155e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 15 Oct 2026 05:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792067088; x=1792671888; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxfJL03yCUmbogf01UkuHJxurEyMn6HY9RwQo32N40A=;
        b=ZDw1LhdhRDpkB9Lrdph4/7fsggWG019QFrvEXPWrvn5dLAHcw+WebzNlgjrA40jAM1
         2vrtSIG610lASaiUeYQMxPWl0sOm93UG9zdoKg2mVOrTAiggZNmX82VaEjbJy68iNwiB
         0uVkOGeg18MbAlIKTG96+k7bEnpgyWTEKq5fDPf0Qvb+nt3AU0IREwCthN1M8IxN/+kh
         uB7PZLQED+YAh84REr0MWbQ+Tr5nmEN5Y9fsqzn2nLoAi2ASEdat/eAwy3CGcKnBjj9T
         E+AH0prw0wpPg7h6k9We0IBkVEK6bslukSWZdZbS0BFESWa28PWzW1jkENgzlSXnt5bk
         gpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792067088; x=1792671888;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxfJL03yCUmbogf01UkuHJxurEyMn6HY9RwQo32N40A=;
        b=FOJRspNQaHpdr9VRH6N+nDZ6ZoyobVuO11m9eVcvq1FGfjTy3d92orNdebvWkAaL7U
         gjKrCc/r3lgd+7Mdu/tdYoqBCL/Tg2zTVVwnOcqQf54b3E3gu9Kr1BZQdvsYMrL2sWio
         a5Gi4sdgExafRIQg7LeJxfsA5hQf09uTE8Tm6L5Wdc6JK8dYud0VHy5UDNuoiX8hhjf1
         VPhO3PWEG1ThnKdKbv6OCvMLDk0NFOSpJgrNP6Ebo4c6sCc4K9bcI+Vq8ArEEVtN8WIc
         RMOCbJr/6HCqhu89z+cSwjsJyKM+IyfUUf1iI6P2l8wIADZ+zq4pXY2Q6RMZJy8OGeu1
         ejmg==
X-Gm-Message-State: AFq9FYLvNTCK/72HUSN4XpX5EfZpYWhS/r5PVDxAgoEJZsPuAAVQVNUK
	EU8ARExf7kAujokv17Hw/kV0SK05X6fzmd3lk0SLmM+I4Be8N7/UoNeboAWoThc6CSAKgg==
X-Gm-Gg: AYBFou37LbENPv2UMgq9OTKotpyC2mn4nsHXO/uo8xJpmu1S5W5OpnKnfV5VcII1g+Z
	maOkZGOxl4nPBFmHOoStIiwx6a/DASmkEeTJZP/G9WBUWII0yLyTyTwQo9pJg5SZ9k6dvJv1dW/
	dOB11vgA/o15kMooiGZHQlWbMIDZ/FsST71dCGEu8vkXaQPHkrsS325WWf2t/vppkHpLZ1VG5m0
	E4WXeeBC7UeMeFKkEXfrN1fGpFEoUoBrHe4bqBTNHxP4Sq74AYuXD2u3Y3bVYEfafZep3eT000n
	8fIW540hkHs1vKQ/+SLDDgfGKCqK+8lx3CXQXYZPoHxkK0jdMiirl4wB9Gz1fwPzE0agvMTSTor
	Y5FXYuet9W35rYIfwH68sDmxHXiLqdPdmlls6R1LRzzEL2Y5DbUDmLmDMGSCxeyhkWxUCpNv0Zc
	5AFoqpKpW8uHEMqvUhPgK7cBW0wn1j0if1Y750se8HLd96DZLhbDrTLywNpaK/SRZ6n/E=
X-Received: by 2002:a05:600c:4e92:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a18e4837e7mr374665925e9.6.1792067086190;
        Thu, 15 Oct 2026 05:24:46 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd66ab3dsm62636355e9.2.2026.10.15.05.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:24:45 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:24:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 13311/15025] drivers/dma/amlogic-dma.c:636
 aml_dma_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <atDGCefULqNew80V@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b018686719706a781c45a874ed51374a2dc4b767
commit: b84b5197e344e2d378a9edf5d782b6fbddff8d06 [13311/15025] dmaengine: amlogic: Add general DMA driver for A9
config: openrisc-randconfig-r2202-20261008 (https://download.01.org/0day-ci/archive/20261008/202610080953.C5TYlCaA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610080953.C5TYlCaA-lkp@intel.com/

smatch warnings:
drivers/dma/amlogic-dma.c:636 aml_dma_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +636 drivers/dma/amlogic-dma.c

b84b5197e344e2 Xianwei Zhao 2026-09-03  597  static int aml_dma_probe(struct platform_device *pdev)
b84b5197e344e2 Xianwei Zhao 2026-09-03  598  {
b84b5197e344e2 Xianwei Zhao 2026-09-03  599  	struct device_node *np = pdev->dev.of_node;
b84b5197e344e2 Xianwei Zhao 2026-09-03  600  	struct dma_device *dma_dev;
b84b5197e344e2 Xianwei Zhao 2026-09-03  601  	struct aml_dma_dev *aml_dma;
b84b5197e344e2 Xianwei Zhao 2026-09-03  602  	int ret, i, len;
b84b5197e344e2 Xianwei Zhao 2026-09-03  603  	u32 chan_nr;
b84b5197e344e2 Xianwei Zhao 2026-09-03  604  
b84b5197e344e2 Xianwei Zhao 2026-09-03  605  	const struct regmap_config aml_regmap_config = {
b84b5197e344e2 Xianwei Zhao 2026-09-03  606  		.reg_bits = 32,
b84b5197e344e2 Xianwei Zhao 2026-09-03  607  		.val_bits = 32,
b84b5197e344e2 Xianwei Zhao 2026-09-03  608  		.reg_stride = 4,
b84b5197e344e2 Xianwei Zhao 2026-09-03  609  		.max_register = 0x3000,
b84b5197e344e2 Xianwei Zhao 2026-09-03  610  	};
b84b5197e344e2 Xianwei Zhao 2026-09-03  611  
b84b5197e344e2 Xianwei Zhao 2026-09-03  612  	ret = of_property_read_u32(np, "dma-channels", &chan_nr);
b84b5197e344e2 Xianwei Zhao 2026-09-03  613  	if (ret)
b84b5197e344e2 Xianwei Zhao 2026-09-03  614  		return dev_err_probe(&pdev->dev, ret, "failed to read dma-channels\n");
b84b5197e344e2 Xianwei Zhao 2026-09-03  615  	if (chan_nr > (MAX_CHAN_ID * 2))
b84b5197e344e2 Xianwei Zhao 2026-09-03  616  		return dev_err_probe(&pdev->dev, -EINVAL, "dma-channels unusual\n");
b84b5197e344e2 Xianwei Zhao 2026-09-03  617  
b84b5197e344e2 Xianwei Zhao 2026-09-03  618  	len = sizeof(struct aml_dma_dev) + sizeof(struct aml_dma_chan) * chan_nr;
b84b5197e344e2 Xianwei Zhao 2026-09-03  619  	aml_dma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
b84b5197e344e2 Xianwei Zhao 2026-09-03  620  	if (!aml_dma)
b84b5197e344e2 Xianwei Zhao 2026-09-03  621  		return -ENOMEM;
b84b5197e344e2 Xianwei Zhao 2026-09-03  622  
b84b5197e344e2 Xianwei Zhao 2026-09-03  623  	aml_dma->free_wq = alloc_ordered_workqueue("aml_dma_free", 0);
b84b5197e344e2 Xianwei Zhao 2026-09-03  624  	if (!aml_dma->free_wq)
b84b5197e344e2 Xianwei Zhao 2026-09-03  625  		return -ENOMEM;
b84b5197e344e2 Xianwei Zhao 2026-09-03  626  
b84b5197e344e2 Xianwei Zhao 2026-09-03  627  	aml_dma->chan_nr = chan_nr;
b84b5197e344e2 Xianwei Zhao 2026-09-03  628  
b84b5197e344e2 Xianwei Zhao 2026-09-03  629  	aml_dma->base = devm_platform_ioremap_resource(pdev, 0);
b84b5197e344e2 Xianwei Zhao 2026-09-03  630  	if (IS_ERR(aml_dma->base))
b84b5197e344e2 Xianwei Zhao 2026-09-03  631  		return PTR_ERR(aml_dma->base);
b84b5197e344e2 Xianwei Zhao 2026-09-03  632  
b84b5197e344e2 Xianwei Zhao 2026-09-03  633  	aml_dma->regmap = devm_regmap_init_mmio(&pdev->dev, aml_dma->base,
b84b5197e344e2 Xianwei Zhao 2026-09-03  634  						&aml_regmap_config);
b84b5197e344e2 Xianwei Zhao 2026-09-03  635  	if (IS_ERR_OR_NULL(aml_dma->regmap))
b84b5197e344e2 Xianwei Zhao 2026-09-03 @636  		return PTR_ERR(aml_dma->regmap);

devm_regmap_init_mmio() can't actually return NULL so
s/IS_ERR_OR_NULL/IS_ERR/.

b84b5197e344e2 Xianwei Zhao 2026-09-03  637  
b84b5197e344e2 Xianwei Zhao 2026-09-03  638  	aml_dma->clk = devm_clk_get_enabled(&pdev->dev, NULL);
b84b5197e344e2 Xianwei Zhao 2026-09-03  639  	if (IS_ERR(aml_dma->clk))
b84b5197e344e2 Xianwei Zhao 2026-09-03  640  		return PTR_ERR(aml_dma->clk);
b84b5197e344e2 Xianwei Zhao 2026-09-03  641  
b84b5197e344e2 Xianwei Zhao 2026-09-03  642  	aml_dma->irq = platform_get_irq(pdev, 0);
b84b5197e344e2 Xianwei Zhao 2026-09-03  643  
b84b5197e344e2 Xianwei Zhao 2026-09-03  644  	aml_dma->pdev = pdev;
b84b5197e344e2 Xianwei Zhao 2026-09-03  645  	aml_dma->dma_device.dev = &pdev->dev;
b84b5197e344e2 Xianwei Zhao 2026-09-03  646  
b84b5197e344e2 Xianwei Zhao 2026-09-03  647  	dma_dev = &aml_dma->dma_device;
b84b5197e344e2 Xianwei Zhao 2026-09-03  648  	INIT_LIST_HEAD(&dma_dev->channels);
b84b5197e344e2 Xianwei Zhao 2026-09-03  649  
b84b5197e344e2 Xianwei Zhao 2026-09-03  650  	/* Initialize channel parameters */
b84b5197e344e2 Xianwei Zhao 2026-09-03  651  	for (i = 0; i < chan_nr; i++) {
b84b5197e344e2 Xianwei Zhao 2026-09-03  652  		struct aml_dma_chan *aml_chan = &aml_dma->aml_chans[i];
b84b5197e344e2 Xianwei Zhao 2026-09-03  653  
b84b5197e344e2 Xianwei Zhao 2026-09-03  654  		aml_chan->aml_dma = aml_dma;
b84b5197e344e2 Xianwei Zhao 2026-09-03  655  		aml_chan->vchan.desc_free = aml_dma_free_desc;
b84b5197e344e2 Xianwei Zhao 2026-09-03  656  		vchan_init(&aml_chan->vchan, &aml_dma->dma_device);
b84b5197e344e2 Xianwei Zhao 2026-09-03  657  	}
b84b5197e344e2 Xianwei Zhao 2026-09-03  658  	aml_dma->chan_used = 0;
b84b5197e344e2 Xianwei Zhao 2026-09-03  659  
b84b5197e344e2 Xianwei Zhao 2026-09-03  660  	dma_set_max_seg_size(dma_dev->dev, SG_MAX_LEN);
b84b5197e344e2 Xianwei Zhao 2026-09-03  661  	dma_cap_set(DMA_SLAVE, dma_dev->cap_mask);
b84b5197e344e2 Xianwei Zhao 2026-09-03  662  	dma_dev->device_alloc_chan_resources = aml_dma_alloc_chan_resources;
b84b5197e344e2 Xianwei Zhao 2026-09-03  663  	dma_dev->device_free_chan_resources = aml_dma_free_chan_resources;
b84b5197e344e2 Xianwei Zhao 2026-09-03  664  	dma_dev->device_tx_status = aml_dma_tx_status;
b84b5197e344e2 Xianwei Zhao 2026-09-03  665  	dma_dev->device_prep_slave_sg = aml_dma_prep_slave_sg;
b84b5197e344e2 Xianwei Zhao 2026-09-03  666  	dma_dev->device_pause = aml_dma_chan_pause;
b84b5197e344e2 Xianwei Zhao 2026-09-03  667  	dma_dev->device_resume = aml_dma_chan_resume;
b84b5197e344e2 Xianwei Zhao 2026-09-03  668  	dma_dev->device_terminate_all = aml_dma_terminate_all;
b84b5197e344e2 Xianwei Zhao 2026-09-03  669  	dma_dev->device_issue_pending = aml_dma_issue_pending;
b84b5197e344e2 Xianwei Zhao 2026-09-03  670  	/* PIO 4 bytes and I2C 1 byte */
b84b5197e344e2 Xianwei Zhao 2026-09-03  671  	dma_dev->dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) | BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
b84b5197e344e2 Xianwei Zhao 2026-09-03  672  	dma_dev->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
b84b5197e344e2 Xianwei Zhao 2026-09-03  673  	dma_dev->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
b84b5197e344e2 Xianwei Zhao 2026-09-03  674  
b84b5197e344e2 Xianwei Zhao 2026-09-03  675  	regmap_write(aml_dma->regmap, RCH_INT_MASK, INT_MASK);
b84b5197e344e2 Xianwei Zhao 2026-09-03  676  	regmap_write(aml_dma->regmap, WCH_INT_MASK, INT_MASK);
b84b5197e344e2 Xianwei Zhao 2026-09-03  677  
b84b5197e344e2 Xianwei Zhao 2026-09-03  678  	ret = devm_request_irq(&pdev->dev, aml_dma->irq, aml_dma_interrupt_handler,
b84b5197e344e2 Xianwei Zhao 2026-09-03  679  			       0, dev_name(&pdev->dev), aml_dma);
b84b5197e344e2 Xianwei Zhao 2026-09-03  680  	if (ret)
b84b5197e344e2 Xianwei Zhao 2026-09-03  681  		return dev_err_probe(&pdev->dev, ret, "failed to register irq\n");
b84b5197e344e2 Xianwei Zhao 2026-09-03  682  
b84b5197e344e2 Xianwei Zhao 2026-09-03  683  	ret = dmaenginem_async_device_register(dma_dev);
b84b5197e344e2 Xianwei Zhao 2026-09-03  684  	if (ret)
b84b5197e344e2 Xianwei Zhao 2026-09-03  685  		return dev_err_probe(&pdev->dev, ret, "failed to register dmaenginem\n");
b84b5197e344e2 Xianwei Zhao 2026-09-03  686  
b84b5197e344e2 Xianwei Zhao 2026-09-03  687  	ret = of_dma_controller_register(np, aml_of_dma_xlate, aml_dma);
b84b5197e344e2 Xianwei Zhao 2026-09-03  688  	if (ret)
b84b5197e344e2 Xianwei Zhao 2026-09-03  689  		return dev_err_probe(&pdev->dev, ret, "failed to register xlate\n");
b84b5197e344e2 Xianwei Zhao 2026-09-03  690  
b84b5197e344e2 Xianwei Zhao 2026-09-03  691  	platform_set_drvdata(pdev, aml_dma);
b84b5197e344e2 Xianwei Zhao 2026-09-03  692  
b84b5197e344e2 Xianwei Zhao 2026-09-03  693  	return 0;
b84b5197e344e2 Xianwei Zhao 2026-09-03  694  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

