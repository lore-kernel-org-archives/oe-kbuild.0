Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFA71FDFB9
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 06:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730788799; cv=none; b=Fpq5o6S06f7vx8Z1vatGpr94HMGuxSPFzxmSSB4Bw38rBnBije6S1WstrsT1Mas05RsYfIP0kmfpdkP/Q/J8tGJWYtt62H0CH65qJ71tM9hx+dQaEzDuuMwVODHpBzwu2MagjMBkKypHhsKe5s32OT8ZQ99iuffaocHmROeGgY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730788799; c=relaxed/simple;
	bh=osWFfjiRMZmln2tfVA40+CxH/vF3L7VYQ7+XM0b4tyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XCmNWCAz9ccQYJhVCvxV/IzbOGOkumSbvaitdD6Og/oCDmVhT1Pm86tlbkWf9aTPvTPGIy/4eR8A7yaVz6nTBAy2JDAGtDUNuPfLPTf9U5v8obhqZrI2xmvX3PrrBPpeEkchAHFLU9dVxIZSxxgrQqNlY13y7ACLUsUJWjIEiNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j1ZcHjwW; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j1ZcHjwW"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso76845131fa.3
        for <oe-kbuild@lists.linux.dev>; Mon, 04 Nov 2024 22:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730788795; x=1731393595; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JjjtXMtGuwIRBr+56AsB967LHxN57g5CTB1bW9ee0Jw=;
        b=j1ZcHjwWsAy00SwrZtwccAJjmQwEVNNg+Cg+m03pxaY0CaCD1DO1fLgA957AZhILd3
         sm0VMa6LHuxB81vVXYRyBp33q8+GcrdgEzf/bX//FyJMXafSSF6Te5wbHHSzTIv2NTxs
         gdw885UmRYHN40J2IHUx0a+aWiSd8VeMYvVSHx/lJJa7rFGmr7pqKr2UF5uM+ivuebj4
         ssWoBRc7v+euj1p46ddgdCFc+WiJYJsGwNJvL+8t/Ccuxbtl9K4s9lkWuCQMnFbsfj+u
         WnS36lG5+LQhptmTW9UMZIXhSpYbl9GVML2/TdFJZ8Ebi0oCMriDF6hP1cnzF4oEoKD/
         +N6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730788795; x=1731393595;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JjjtXMtGuwIRBr+56AsB967LHxN57g5CTB1bW9ee0Jw=;
        b=CBQpdUBqg1I5tldxumSF9SJrratQKcHB5MvoMDIua6yLkxvIA4mqFfZR5hKWi4cHIv
         WtxiMaXYtq9Fv7xUG0BRXKrGLbrI6N9+Gsno88ImOOmZIJA1IT6zZwwQR76NVh4G+Oxx
         YmbiFvqSM1U4aF8Y/nHdiEFGTRTCS3fquyvIzkq3BqtJSzeInAYwYxdQetgH3jfmwyGD
         2zR23A1Q0nsQUgPlm+UoUg3Zgb9MYUTuAx6N/G4OYz+WnDrBjA1iqm7wiCXUmAXMj5RH
         sIQgjZju6QrRo2ar1eFuWpmXmvQ6ir1zpIDRdKMY+bzS0dVcYoXgHtpq0+J+SPSSDeSG
         ZEKQ==
X-Gm-Message-State: AOJu0YzS3wm/KSmlZDIntadEsHJrrwiV5XtMUNvb/Pe7GX26ZtXvw0EF
	iMPgVpNWGu+qgRt9rjbZZsLM3JVST1fZ74SoE8QQ3b+Yu4Gjsq5n5Zu1wv7rxllZdZ4cA3EK/uS
	QAXOUdA==
X-Google-Smtp-Source: AGHT+IEgvF2tKauKjoh+b/U6a4uWkiQllyeHEuJ94jfOhA+ltb0bUXqhs+lH45B8HtflobulBp5l8g==
X-Received: by 2002:a05:651c:158f:b0:2fb:5206:1675 with SMTP id 38308e7fff4ca-2fedb7d8957mr109871771fa.27.1730788794951;
        Mon, 04 Nov 2024 22:39:54 -0800 (PST)
Received: from localhost ([77.241.232.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16d67a6sm87428266b.60.2024.11.04.22.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 22:39:54 -0800 (PST)
Date: Tue, 5 Nov 2024 09:39:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sujuan Chen <sujuan.chen@mediatek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/pci.c:186
 mt7996_pci_probe() error: uninitialized symbol 'hif2_irq'.
Message-ID: <1526b868-7cb2-4929-8bc2-8b78e69ced76@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   59b723cd2adbac2a34fc8e12c74ae26ae45bf230
commit: 83eafc9251d6d30574b629ac637c56d168fcbdd9 wifi: mt76: mt7996: add wed tx support
config: sh-randconfig-r073-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050315.cahqHi8j-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411050315.cahqHi8j-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/pci.c:186 mt7996_pci_probe() error: uninitialized symbol 'hif2_irq'.

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/pci.c:192 mt7996_pci_probe() error: uninitialized symbol 'hif2_dev'.

vim +/hif2_irq +186 drivers/net/wireless/mediatek/mt76/mt7996/pci.c

98686cd21624c7 Shayne Chen 2022-11-22   91  static int mt7996_pci_probe(struct pci_dev *pdev,
98686cd21624c7 Shayne Chen 2022-11-22   92  			    const struct pci_device_id *id)
98686cd21624c7 Shayne Chen 2022-11-22   93  {
98686cd21624c7 Shayne Chen 2022-11-22   94  	struct pci_dev *hif2_dev;
83eafc9251d6d3 Sujuan Chen 2023-10-20   95  	struct mt7996_hif *hif2;
98686cd21624c7 Shayne Chen 2022-11-22   96  	struct mt7996_dev *dev;
83eafc9251d6d3 Sujuan Chen 2023-10-20   97  	int irq, hif2_irq, ret;
98686cd21624c7 Shayne Chen 2022-11-22   98  	struct mt76_dev *mdev;
98686cd21624c7 Shayne Chen 2022-11-22   99  
98686cd21624c7 Shayne Chen 2022-11-22  100  	ret = pcim_enable_device(pdev);
98686cd21624c7 Shayne Chen 2022-11-22  101  	if (ret)
98686cd21624c7 Shayne Chen 2022-11-22  102  		return ret;
98686cd21624c7 Shayne Chen 2022-11-22  103  
98686cd21624c7 Shayne Chen 2022-11-22  104  	ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
98686cd21624c7 Shayne Chen 2022-11-22  105  	if (ret)
98686cd21624c7 Shayne Chen 2022-11-22  106  		return ret;
98686cd21624c7 Shayne Chen 2022-11-22  107  
98686cd21624c7 Shayne Chen 2022-11-22  108  	pci_set_master(pdev);
98686cd21624c7 Shayne Chen 2022-11-22  109  
98686cd21624c7 Shayne Chen 2022-11-22  110  	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
98686cd21624c7 Shayne Chen 2022-11-22  111  	if (ret)
98686cd21624c7 Shayne Chen 2022-11-22  112  		return ret;
98686cd21624c7 Shayne Chen 2022-11-22  113  
98686cd21624c7 Shayne Chen 2022-11-22  114  	mt76_pci_disable_aspm(pdev);
98686cd21624c7 Shayne Chen 2022-11-22  115  
98686cd21624c7 Shayne Chen 2022-11-22  116  	if (id->device == 0x7991)
98686cd21624c7 Shayne Chen 2022-11-22  117  		return mt7996_pci_hif2_probe(pdev);
98686cd21624c7 Shayne Chen 2022-11-22  118  
98686cd21624c7 Shayne Chen 2022-11-22  119  	dev = mt7996_mmio_probe(&pdev->dev, pcim_iomap_table(pdev)[0],
98686cd21624c7 Shayne Chen 2022-11-22  120  				id->device);
98686cd21624c7 Shayne Chen 2022-11-22  121  	if (IS_ERR(dev))
98686cd21624c7 Shayne Chen 2022-11-22  122  		return PTR_ERR(dev);
98686cd21624c7 Shayne Chen 2022-11-22  123  
98686cd21624c7 Shayne Chen 2022-11-22  124  	mdev = &dev->mt76;
98686cd21624c7 Shayne Chen 2022-11-22  125  	mt7996_wfsys_reset(dev);
98686cd21624c7 Shayne Chen 2022-11-22  126  	hif2 = mt7996_pci_init_hif2(pdev);
98686cd21624c7 Shayne Chen 2022-11-22  127  
83eafc9251d6d3 Sujuan Chen 2023-10-20  128  	ret = mt7996_mmio_wed_init(dev, pdev, false, &irq);
83eafc9251d6d3 Sujuan Chen 2023-10-20  129  	if (ret < 0)
83eafc9251d6d3 Sujuan Chen 2023-10-20  130  		goto free_wed_or_irq_vector;
83eafc9251d6d3 Sujuan Chen 2023-10-20  131  
83eafc9251d6d3 Sujuan Chen 2023-10-20  132  	if (!ret) {
98686cd21624c7 Shayne Chen 2022-11-22  133  		ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
98686cd21624c7 Shayne Chen 2022-11-22  134  		if (ret < 0)
98686cd21624c7 Shayne Chen 2022-11-22  135  			goto free_device;
98686cd21624c7 Shayne Chen 2022-11-22  136  
98686cd21624c7 Shayne Chen 2022-11-22  137  		irq = pdev->irq;
83eafc9251d6d3 Sujuan Chen 2023-10-20  138  	}
83eafc9251d6d3 Sujuan Chen 2023-10-20  139  
98686cd21624c7 Shayne Chen 2022-11-22  140  	ret = devm_request_irq(mdev->dev, irq, mt7996_irq_handler,
98686cd21624c7 Shayne Chen 2022-11-22  141  			       IRQF_SHARED, KBUILD_MODNAME, dev);
98686cd21624c7 Shayne Chen 2022-11-22  142  	if (ret)
83eafc9251d6d3 Sujuan Chen 2023-10-20  143  		goto free_wed_or_irq_vector;
98686cd21624c7 Shayne Chen 2022-11-22  144  
98686cd21624c7 Shayne Chen 2022-11-22  145  	mt76_wr(dev, MT_INT_MASK_CSR, 0);
98686cd21624c7 Shayne Chen 2022-11-22  146  	/* master switch of PCIe tnterrupt enable */
98686cd21624c7 Shayne Chen 2022-11-22  147  	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
98686cd21624c7 Shayne Chen 2022-11-22  148  
98686cd21624c7 Shayne Chen 2022-11-22  149  	if (hif2) {
98686cd21624c7 Shayne Chen 2022-11-22  150  		hif2_dev = container_of(hif2->dev, struct pci_dev, dev);
98686cd21624c7 Shayne Chen 2022-11-22  151  		dev->hif2 = hif2;
98686cd21624c7 Shayne Chen 2022-11-22  152  
83eafc9251d6d3 Sujuan Chen 2023-10-20  153  		ret = mt7996_mmio_wed_init(dev, hif2_dev, true, &hif2_irq);
83eafc9251d6d3 Sujuan Chen 2023-10-20  154  		if (ret < 0)
83eafc9251d6d3 Sujuan Chen 2023-10-20  155  			goto free_hif2_wed_irq_vector;
83eafc9251d6d3 Sujuan Chen 2023-10-20  156  
83eafc9251d6d3 Sujuan Chen 2023-10-20  157  		if (!ret) {
83eafc9251d6d3 Sujuan Chen 2023-10-20  158  			ret = pci_alloc_irq_vectors(hif2_dev, 1, 1,
83eafc9251d6d3 Sujuan Chen 2023-10-20  159  						    PCI_IRQ_ALL_TYPES);
98686cd21624c7 Shayne Chen 2022-11-22  160  			if (ret < 0)
98686cd21624c7 Shayne Chen 2022-11-22  161  				goto free_hif2;
98686cd21624c7 Shayne Chen 2022-11-22  162  
98686cd21624c7 Shayne Chen 2022-11-22  163  			dev->hif2->irq = hif2_dev->irq;
83eafc9251d6d3 Sujuan Chen 2023-10-20  164  			hif2_irq = dev->hif2->irq;
83eafc9251d6d3 Sujuan Chen 2023-10-20  165  		}
83eafc9251d6d3 Sujuan Chen 2023-10-20  166  
83eafc9251d6d3 Sujuan Chen 2023-10-20  167  		ret = devm_request_irq(mdev->dev, hif2_irq, mt7996_irq_handler,
83eafc9251d6d3 Sujuan Chen 2023-10-20  168  				       IRQF_SHARED, KBUILD_MODNAME "-hif",
83eafc9251d6d3 Sujuan Chen 2023-10-20  169  				       dev);
98686cd21624c7 Shayne Chen 2022-11-22  170  		if (ret)
83eafc9251d6d3 Sujuan Chen 2023-10-20  171  			goto free_hif2_wed_irq_vector;
98686cd21624c7 Shayne Chen 2022-11-22  172  
98686cd21624c7 Shayne Chen 2022-11-22  173  		mt76_wr(dev, MT_INT1_MASK_CSR, 0);
98686cd21624c7 Shayne Chen 2022-11-22  174  		/* master switch of PCIe tnterrupt enable */
98686cd21624c7 Shayne Chen 2022-11-22  175  		mt76_wr(dev, MT_PCIE1_MAC_INT_ENABLE, 0xff);
98686cd21624c7 Shayne Chen 2022-11-22  176  	}

hif2_irq is uninitialized on else path

98686cd21624c7 Shayne Chen 2022-11-22  177  
98686cd21624c7 Shayne Chen 2022-11-22  178  	ret = mt7996_register_device(dev);
98686cd21624c7 Shayne Chen 2022-11-22  179  	if (ret)
98686cd21624c7 Shayne Chen 2022-11-22  180  		goto free_hif2_irq;
98686cd21624c7 Shayne Chen 2022-11-22  181  
98686cd21624c7 Shayne Chen 2022-11-22  182  	return 0;
98686cd21624c7 Shayne Chen 2022-11-22  183  
98686cd21624c7 Shayne Chen 2022-11-22  184  free_hif2_irq:
98686cd21624c7 Shayne Chen 2022-11-22  185  	if (dev->hif2)
83eafc9251d6d3 Sujuan Chen 2023-10-20 @186  		devm_free_irq(mdev->dev, hif2_irq, dev);

Uninitialized.  No need to call devm_free_irq().  devm_ stuff is freed
automatically if probe() fails.

83eafc9251d6d3 Sujuan Chen 2023-10-20  187  free_hif2_wed_irq_vector:
83eafc9251d6d3 Sujuan Chen 2023-10-20  188  	if (dev->hif2) {
83eafc9251d6d3 Sujuan Chen 2023-10-20  189  		if (mtk_wed_device_active(&dev->mt76.mmio.wed_hif2))
83eafc9251d6d3 Sujuan Chen 2023-10-20  190  			mtk_wed_device_detach(&dev->mt76.mmio.wed_hif2);
83eafc9251d6d3 Sujuan Chen 2023-10-20  191  		else
98686cd21624c7 Shayne Chen 2022-11-22  192  			pci_free_irq_vectors(hif2_dev);
83eafc9251d6d3 Sujuan Chen 2023-10-20  193  	}
98686cd21624c7 Shayne Chen 2022-11-22  194  free_hif2:
98686cd21624c7 Shayne Chen 2022-11-22  195  	if (dev->hif2)
98686cd21624c7 Shayne Chen 2022-11-22  196  		put_device(dev->hif2->dev);
98686cd21624c7 Shayne Chen 2022-11-22  197  	devm_free_irq(mdev->dev, irq, dev);
83eafc9251d6d3 Sujuan Chen 2023-10-20  198  free_wed_or_irq_vector:
83eafc9251d6d3 Sujuan Chen 2023-10-20  199  	if (mtk_wed_device_active(&dev->mt76.mmio.wed))
83eafc9251d6d3 Sujuan Chen 2023-10-20  200  		mtk_wed_device_detach(&dev->mt76.mmio.wed);
83eafc9251d6d3 Sujuan Chen 2023-10-20  201  	else
98686cd21624c7 Shayne Chen 2022-11-22  202  		pci_free_irq_vectors(pdev);
98686cd21624c7 Shayne Chen 2022-11-22  203  free_device:
98686cd21624c7 Shayne Chen 2022-11-22  204  	mt76_free_device(&dev->mt76);
98686cd21624c7 Shayne Chen 2022-11-22  205  
98686cd21624c7 Shayne Chen 2022-11-22  206  	return ret;
98686cd21624c7 Shayne Chen 2022-11-22  207  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

