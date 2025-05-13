Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72225298991
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 14:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147339; cv=none; b=czZU1R9Tr0tmrbIJNOpAb3FQgRY5umkxCjxYwTRJTNpvL37erWlSg4nkC0QSDGgXEYUECiIORySrudwHFQrn/H1g2oaiL5QjKWkSLKhIHl126egA4BGQjMxyBNKAlVaa/+dZarr/GJRdnikVaJTPBRAu6AHUZp7wErIyT59eZlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147339; c=relaxed/simple;
	bh=GbVUPWgyGQygF0TIC7ugcyw6hbZIaF/Q8BvoNM6W1TU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QJjQ2xtcxwATWLRQuGaoCfnMA31dlch0ziZdhex+OCfV1cLlxo2r+VhaZYpW6fV/QPHQR8m0r6KW2lW4UVVAoqVwkoEggosYqgBqpQdFIpHAWfpzidUUDXS9M0czCZi54+ihOx7l3duGojneunfYWbpatdxqKTWdCFAPzEhtfw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zgG8sM/a; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zgG8sM/a"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a1fb18420aso3787002f8f.1
        for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747147335; x=1747752135; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wMluixgbgTOmYqWeOknU8H/LWWHpT3IASPBLK+tXxyI=;
        b=zgG8sM/ax+9OXrhRZ72BRFHzmJnn24tM32j5pa91TsdqLstNcuDhJjEU3KEzGznKKu
         7w1shElLdJ60EKVMZpEUYFibWS/NkYEXs5Xy7yajE6WDE8gAW50nSJzgB69nL5AFWnry
         nrucdWoJ5RVtyIPnJGRMCNs/qDpUyKFYRiTm7kxQAab5mPsMQq1ZGl6f9aCrrjAzAkBW
         +2o09zCYUmGZUPObLFvqj7wbkMImbZyaUrzAQFa64Ol0FS4sVAAhnsF7HWfNrRoFOR+3
         fuwY1BlW7txLZF/tb9gX1nLwi/yO/bjBLgGrAKN36AAhTTWZX1TMMpRHMtoi2BOfPCn4
         Ibqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747147335; x=1747752135;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wMluixgbgTOmYqWeOknU8H/LWWHpT3IASPBLK+tXxyI=;
        b=cxR0xRSV8yknBsmpmjO4quoTpnkhoKBZNcxgfGFApf3U2h0KgQouaopNStJdXR0njD
         fYVzG5tX28R56OLpK6YBV6tyQHWWzb8u6qRkTy5RqqgmO1nRDDZ6efaOBFMVohZWeYP9
         d7+xMgOHqBtgLr6xUjIsWVSR0qtnVYjhNW95L59x7mqLUQJNltjW1JHqIYpCizIvGiAh
         75pQKk296TEjtidKhDk8Zia/AqwB+pi8SWes/WS2SPeGqPiUFNjA+wdKE49QGxM62ncy
         j7tkJPIoYs7yMo7gvo1blB8FMXCUP0PfucKhKSDpTGVrI52CHVwW1X0CxNbj+GYAUOGk
         budw==
X-Gm-Message-State: AOJu0YyQr8TuYnUvtsZkQLErIEJ8X/Hfuinj3LI1NU8+UeNAHbRlX2op
	0MqJGxpo2YMiWR5Qq68yf/tRTgQ5GSAOjHTTGoca1cINZGXj5FWAVDaVAVogcKsmFKQ8D/2BoA2
	Rh409cw==
X-Gm-Gg: ASbGncv6NHPD1F24abhLJChwhomyznquTNmy2w/9kGxqH35nCDVq6Q3e5oihTJE4Ne8
	BHUxT4mfGcmIXSfM+OaOiRG2/b+fz6R3VY6GR8dNoiUtijs73n142zxmEQGmnYYhr4r+GNJ8uKW
	3iXzds8whn1X7yrnFrBkhH1l7ry6EkmI//q7VPAlgBon9g7zmtM/Z/tVj3DO1gog1xrrdXfZ2Yj
	criK1TScSJ1bbz4yoeUSCpul1prRy0wJ8v9y0j6XXfivDsPdLXOiNMQEK0ghOLUE5iizMrauPpj
	iJp+HFE5LlofqW+PwQ/s2CCbhpDOChD4Pc2EsmxGfIiHBapn9dzDs+6NVcr5j6TVllOA8/aFn4H
	iCT9aRw==
X-Google-Smtp-Source: AGHT+IFYejKzEH3qIllIXstVeJt/kuvZEBvkgPfkjDZbAFF5algNuopHW3jtYJc5kH4mXRov6/D+sA==
X-Received: by 2002:a5d:5188:0:b0:3a0:b58c:dd8 with SMTP id ffacd0b85a97d-3a1f64588e6mr10221963f8f.30.1747147334963;
        Tue, 13 May 2025 07:42:14 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4cc2esm16887784f8f.90.2025.05.13.07.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:42:14 -0700 (PDT)
Date: Tue, 13 May 2025 17:42:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Keguang Zhang <keguang.zhang@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [linux-next:master 6048/10031]
 drivers/mtd/nand/raw/loongson1-nand-controller.c:374
 ls1x_nand_dma_transfer() warn: passing zero to 'PTR_ERR'
Message-ID: <1f6eea14-762f-47ab-ab84-4e9d1e95883b@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: d2d10ede04b1671dc4762479a2d06f183aaafbba [6048/10031] mtd: rawnand: Add Loongson-1 NAND Controller Driver
config: microblaze-randconfig-r072-20250511 (https://download.01.org/0day-ci/archive/20250511/202505111115.FfRZilcq-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505111115.FfRZilcq-lkp@intel.com/

smatch warnings:
drivers/mtd/nand/raw/loongson1-nand-controller.c:374 ls1x_nand_dma_transfer() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +374 drivers/mtd/nand/raw/loongson1-nand-controller.c

d2d10ede04b1671 Keguang Zhang 2025-03-20  342  static int ls1x_nand_dma_transfer(struct ls1x_nand_host *host, struct ls1x_nand_op *op)
d2d10ede04b1671 Keguang Zhang 2025-03-20  343  {
d2d10ede04b1671 Keguang Zhang 2025-03-20  344  	struct nand_chip *chip = &host->chip;
d2d10ede04b1671 Keguang Zhang 2025-03-20  345  	struct dma_chan *chan = host->dma_chan;
d2d10ede04b1671 Keguang Zhang 2025-03-20  346  	struct device *dev = chan->device->dev;
d2d10ede04b1671 Keguang Zhang 2025-03-20  347  	struct dma_async_tx_descriptor *desc;
d2d10ede04b1671 Keguang Zhang 2025-03-20  348  	enum dma_data_direction data_dir = op->is_write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
d2d10ede04b1671 Keguang Zhang 2025-03-20  349  	enum dma_transfer_direction xfer_dir = op->is_write ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
d2d10ede04b1671 Keguang Zhang 2025-03-20  350  	void *buf = op->buf;
d2d10ede04b1671 Keguang Zhang 2025-03-20  351  	char *dma_buf = NULL;
d2d10ede04b1671 Keguang Zhang 2025-03-20  352  	dma_addr_t dma_addr;
d2d10ede04b1671 Keguang Zhang 2025-03-20  353  	int ret;
d2d10ede04b1671 Keguang Zhang 2025-03-20  354  
d2d10ede04b1671 Keguang Zhang 2025-03-20  355  	if (IS_ALIGNED((uintptr_t)buf, chip->buf_align) &&
d2d10ede04b1671 Keguang Zhang 2025-03-20  356  	    IS_ALIGNED(op->orig_len, chip->buf_align)) {
d2d10ede04b1671 Keguang Zhang 2025-03-20  357  		dma_addr = dma_map_single(dev, buf, op->orig_len, data_dir);
d2d10ede04b1671 Keguang Zhang 2025-03-20  358  		if (dma_mapping_error(dev, dma_addr)) {
d2d10ede04b1671 Keguang Zhang 2025-03-20  359  			dev_err(dev, "failed to map DMA buffer\n");
d2d10ede04b1671 Keguang Zhang 2025-03-20  360  			return -ENXIO;
d2d10ede04b1671 Keguang Zhang 2025-03-20  361  		}
d2d10ede04b1671 Keguang Zhang 2025-03-20  362  	} else if (!op->is_write) {
d2d10ede04b1671 Keguang Zhang 2025-03-20  363  		dma_buf = dma_alloc_coherent(dev, op->len, &dma_addr, GFP_KERNEL);
d2d10ede04b1671 Keguang Zhang 2025-03-20  364  		if (!dma_buf)
d2d10ede04b1671 Keguang Zhang 2025-03-20  365  			return -ENOMEM;
d2d10ede04b1671 Keguang Zhang 2025-03-20  366  	} else {
d2d10ede04b1671 Keguang Zhang 2025-03-20  367  		dev_err(dev, "subpage writing not supported\n");
d2d10ede04b1671 Keguang Zhang 2025-03-20  368  		return -EOPNOTSUPP;
d2d10ede04b1671 Keguang Zhang 2025-03-20  369  	}
d2d10ede04b1671 Keguang Zhang 2025-03-20  370  
d2d10ede04b1671 Keguang Zhang 2025-03-20  371  	desc = dmaengine_prep_slave_single(chan, dma_addr, op->len, xfer_dir, DMA_PREP_INTERRUPT);
d2d10ede04b1671 Keguang Zhang 2025-03-20  372  	if (!desc) {
d2d10ede04b1671 Keguang Zhang 2025-03-20  373  		dev_err(dev, "failed to prepare DMA descriptor\n");
d2d10ede04b1671 Keguang Zhang 2025-03-20 @374  		ret = PTR_ERR(desc);

desc is NULL not an error pointer.

d2d10ede04b1671 Keguang Zhang 2025-03-20  375  		goto err;
d2d10ede04b1671 Keguang Zhang 2025-03-20  376  	}
d2d10ede04b1671 Keguang Zhang 2025-03-20  377  	desc->callback = ls1x_nand_dma_callback;
d2d10ede04b1671 Keguang Zhang 2025-03-20  378  	desc->callback_param = host;
d2d10ede04b1671 Keguang Zhang 2025-03-20  379  
d2d10ede04b1671 Keguang Zhang 2025-03-20  380  	host->dma_cookie = dmaengine_submit(desc);
d2d10ede04b1671 Keguang Zhang 2025-03-20  381  	ret = dma_submit_error(host->dma_cookie);
d2d10ede04b1671 Keguang Zhang 2025-03-20  382  	if (ret) {
d2d10ede04b1671 Keguang Zhang 2025-03-20  383  		dev_err(dev, "failed to submit DMA descriptor\n");
d2d10ede04b1671 Keguang Zhang 2025-03-20  384  		goto err;
d2d10ede04b1671 Keguang Zhang 2025-03-20  385  	}
d2d10ede04b1671 Keguang Zhang 2025-03-20  386  
d2d10ede04b1671 Keguang Zhang 2025-03-20  387  	dev_dbg(dev, "issue DMA with cookie=%d\n", host->dma_cookie);
d2d10ede04b1671 Keguang Zhang 2025-03-20  388  	dma_async_issue_pending(chan);
d2d10ede04b1671 Keguang Zhang 2025-03-20  389  
d2d10ede04b1671 Keguang Zhang 2025-03-20  390  	if (!wait_for_completion_timeout(&host->dma_complete, msecs_to_jiffies(1000))) {
d2d10ede04b1671 Keguang Zhang 2025-03-20  391  		dmaengine_terminate_sync(chan);
d2d10ede04b1671 Keguang Zhang 2025-03-20  392  		reinit_completion(&host->dma_complete);
d2d10ede04b1671 Keguang Zhang 2025-03-20  393  		ret = -ETIMEDOUT;
d2d10ede04b1671 Keguang Zhang 2025-03-20  394  		goto err;
d2d10ede04b1671 Keguang Zhang 2025-03-20  395  	}
d2d10ede04b1671 Keguang Zhang 2025-03-20  396  
d2d10ede04b1671 Keguang Zhang 2025-03-20  397  	if (dma_buf)
d2d10ede04b1671 Keguang Zhang 2025-03-20  398  		memcpy(buf, dma_buf + op->aligned_offset, op->orig_len);
d2d10ede04b1671 Keguang Zhang 2025-03-20  399  err:
d2d10ede04b1671 Keguang Zhang 2025-03-20  400  	if (dma_buf)
d2d10ede04b1671 Keguang Zhang 2025-03-20  401  		dma_free_coherent(dev, op->len, dma_buf, dma_addr);
d2d10ede04b1671 Keguang Zhang 2025-03-20  402  	else
d2d10ede04b1671 Keguang Zhang 2025-03-20  403  		dma_unmap_single(dev, dma_addr, op->orig_len, data_dir);
d2d10ede04b1671 Keguang Zhang 2025-03-20  404  
d2d10ede04b1671 Keguang Zhang 2025-03-20  405  	return ret;
d2d10ede04b1671 Keguang Zhang 2025-03-20  406  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

