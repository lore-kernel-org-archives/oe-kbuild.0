Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C7E54855E
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953775; cv=none; b=MlIB61Cfqs7vpJZxNi/ve9OA6iYctZqThy3YCcNZfXnzdwTxsfxG8bKcDnQBorep7F9CKrHLDbV4XYDa0Dkg8n8h2Zuedite5GZP0UMdx2TfQcnqgNjwsVH9iCCtw7V71iRHYy5jDf8vKUQHFNWDofQNk6znFGf6dDbHPuHNKYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953775; c=relaxed/simple;
	bh=qemW8SzFS57XAitUApZNwy4sQ3TT7TcV0G7+taWeT1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a3jykzcAcpzn+2u4g3/WwEe25vsNOG9xLwMBTcpRj0nayEIIxtfU0/ZuYfGRrXbQ3P+G+WO7JGwwtORMHsGPVujbtji1nk4dPy0tz4k6HlhA1tp+Z8Lp1bp+eWiuExQTtKz97+fDGcoiFjTOskQxyszyvIUeE83CA0VufnAQjLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rEd+FBIG; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rEd+FBIG"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2055573c8cso778183866b.3
        for <oe-kbuild@lists.linux.dev>; Wed, 09 Sep 2026 04:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788953772; x=1789558572; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cy5kq8NLyuBLDyhds0rj5QIT86At3JxPMpPLWi50Ns=;
        b=rEd+FBIGkZm0krJsg0bDn0PpT9SVmJ9zp76nuf/zXM1C1QxjItRnr52w7cXYhxpYmp
         qkj2wXjq9DGONDLf9n+Ne/aJA7lF3KTsNtWGcn1RQJDyB3jN2MF3x/dp2OTUdNQJDw/F
         x8iu8t/cJrOe93cEB05XxjLxy1QfTYxoZ5BD0Gc7iY3wDuA8WIRRlecTKfhd5/lRiT0s
         RSRfPEae8i0djfsrhbIljryvqv2X/pTaJiLOld+P6QcRPLngHJUAshnZB5DtuIVaNwRe
         05KM3P27XTBFd0p9mPbl+7hUKqyzFkff+JHh1psnukySfp7D32uwAmPcOGbdSMJWBVKI
         sBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953772; x=1789558572;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7cy5kq8NLyuBLDyhds0rj5QIT86At3JxPMpPLWi50Ns=;
        b=GAxv6n2opg/Xwtug7wVQHNlDFwkegzq7VYiRKheAtCd6654K6dzbq5YOvo+R9nWX2i
         XKEEBQ3JsS8lioCTQEnX/xUsAp/AKVLVbFIU0y0uDLCGOVs1mBf8rkGmRBVbcaSg+Fhc
         JExzgOQoM7oYRIDkQtp1q/nBPgUR4pGjKn+QCtuuJCzIpVzMHV4KS0/tQp4DJIZ5nF9K
         OCyNGXH3oq3AWfYm/ZmdQnlO8QZPxuf68lQA7Ah7fpzRMm/N/XVOEiEVIKMIVo7BMYvn
         SgPefcwDE/xNFS5oSg/PXW60vPTvHdHM5oZWcf4dniOM9Dr3GEDozsLsWHeRaQrm232o
         9EKw==
X-Gm-Message-State: AFuF++mu7A0xMd9UNVEW1dm/llpF6/hK4cxkux8LGceIF9i9hKKb9+nV
	4U34vCZLmnzzmFuJ1dSHVO8oM1TbabDtSnSQXfGSLJDa+dQ2SHLNTctBp71Ago1V4oCPbA==
X-Gm-Gg: AYBFou3orWZwp/iWeKgsu5lSNcIHtpkL1MPjfcaxP8hXmA2kP2+f/7c7mzac5CdUMcx
	knO63+6K4SkmXYp2/TVyTGoKJlfYgjXwAiIQPaB8vHu2fdDbn01Ai0WtOpIU1fUT5sZReSuhpye
	5ziqDI76uAJDVu+ZJQHo/hFbslVtuEZfG5c1n7U7U2Y3ABByin5FebYY7thq8Oqf7zvGX3qCHjr
	SaAKsZjHvY8Q+gKwVmFqe4ig/14F3MASZb6U+v8RdKS6WnED+qDFryWqsm3Jsee6hH0WSOOk5ip
	vxXNljbNaw8nBR0Zgp87xzcWsdBpJ2lYq2djmq4bN1/TD/qRySD1Lu9xCujYxHXJJSR7ARXZVRX
	zAHCgZPaPfSnaArPIR3xr4PMU5k/WRiS75RMxe9CtbGoogTwoeFL4zgrUGmkm1nKY88iHGuXccC
	8aStU7wmzL19T98FjPsZZ0dcN9W81UoeY/bJMJ+Lh8HnS2uL3wkGA+tjTZflXDcOMh8ZQ=
X-Received: by 2002:a17:906:9fce:b0:c25:b597:60bc with SMTP id a640c23a62f3a-c260ca366eemr1395754166b.23.1788953771441;
        Wed, 09 Sep 2026 04:36:11 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa5acsm760598366b.12.2026.09.09.04.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:36:10 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:36:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: drivers/mtd/nand/raw/cadence-nand-controller.c:2956
 cadence_nand_init() warn: variable dereferenced before check
 'cdns_ctrl->dmac' (see line 2918)
Message-ID: <202609010758.3N8tYZdG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260909113606.p-nyP-HnyZyYFqXi1WKNV2l_oTrX7FRFVBscIrxmTCQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cee9395acd8043be0644b25c34bfa86623f2b935
commit: 5c56bf214af85ca042bf97f8584aab2151035840 mtd: rawnand: cadence: fix DMA device NULL pointer dereference
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

If cdns_ctrl->caps1->has_dma is false

2b9df00cded911 Niravkumar L Rabara 2025-02-10  2910  		cdns_ctrl->dmac = dma_request_chan_by_mask(&mask);
2b9df00cded911 Niravkumar L Rabara 2025-02-10  2911  		if (IS_ERR(cdns_ctrl->dmac)) {
2b9df00cded911 Niravkumar L Rabara 2025-02-10  2912  			ret = dev_err_probe(cdns_ctrl->dev, PTR_ERR(cdns_ctrl->dmac),
2b9df00cded911 Niravkumar L Rabara 2025-02-10  2913  					    "%d: Failed to get a DMA channel\n", ret);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2914  			goto disable_irq;
ec4ba01e894d31 Piotr Sroka         2019-09-26  2915  		}
ec4ba01e894d31 Piotr Sroka         2019-09-26  2916  	}
ec4ba01e894d31 Piotr Sroka         2019-09-26  2917  
5c56bf214af85c Niravkumar L Rabara 2025-10-23 @2918  	dma_dev = cdns_ctrl->dmac->device;
                                                                  ^^^^^^^^^^^^^^^
Then this is a NULL dereference.  I reported this bug in March.

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

