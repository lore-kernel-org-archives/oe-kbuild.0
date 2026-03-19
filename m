Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034613A543E
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912245; cv=none; b=J6oJG2mAlSZDA2bParovsk63yZUGfAmU5+R/681yRXFCEmyQ+oxtmueNDs7wzdWQYjg8wa4+6DitqFWF3ygd2N5+CV3ZsBi1pB4o0ISS9LwPyNj5RAmnppZv6SalxRJHVAX7gHh2OqOQ/qkG9lhMMLQcyOJ5eWiN3Q+/1lNV0rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912245; c=relaxed/simple;
	bh=4fVcT6O0JeFRqq6WDRw+M041F2rlwqVlmLt/vjIOnXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bmqyc/gSIMwKZt4A+/454Boi6T8Urn746j4qPp57/9tKYInCMLPE77g+ogphJe0LeHsrdt1s61hyyWUt7NLqGQD6b636P8gbMsAoKnafCxzVfRizoTopa03X8MSPooWb0uxmFhteYfqd58qwIVPa3iadJuIGR3R9A+NgPLMTETQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CUO0f1jR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CUO0f1jR"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439bcec8613so495354f8f.3
        for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 02:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773912242; x=1774517042; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sU7SVJpciufayF8WtllDRuLUotdFrBj08arZWzNIOsE=;
        b=CUO0f1jRWvP2bwAPkorxAjbv1cZ4M1v7ZkmgzsWseHKDp9tDJWqmxKcafsFJCZFnEw
         RsAwBznvOuIJFMgjqjoNBApW1MQbH2nl+aDpiLjLI4kLPB0f1WqPavC43aztx6Qrs4zF
         3AuusylWVipd7XP8Rw2XJuYNxd1sO+J5LKfQ1mKhBJ2flOfa/MFEKJ+iSKE8tFxromqu
         SauGqlmdI1ji77NM2iCYLGsZjViypitzu0OI61uany6IgYHAyZm3f/Mr3Z7L1DmTJHc0
         FPyYSeCZ2y96BDOnaJgeUwkIBSDwjCkOBniVe/sxal8mOco7itkrc3GBfVGt0HL2zhwR
         TUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912242; x=1774517042;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sU7SVJpciufayF8WtllDRuLUotdFrBj08arZWzNIOsE=;
        b=URW3B/sK81JqD/8JOplW82+fiBjesZSlKnuefQ9Dp6wKaOX3HWMt3YKrmK/v9EQxv6
         20Xdlx8U/ryUBS+8VLGlzMVykBzyQElOvAmwhHyxhRXdX+R97iHmOayyEn72rEXAdWir
         iJL93NiREhWCHdR0JusPayt7uVgf72Vfnq3k0R8r17B6oQBWfcd7jxPFVMzmkePoep1R
         qNk9jUVwX7hgU+IU0pf5ZzDORKU6Lc927JMWM83wFQEzdgLdGMc4vHCsTyxZLx+z7FcP
         7ibcTkuf/YiuCvBlcKp7Nj1ylUMDNBtt1OZJYFwsnrP9tC81euFq0r+1OYJPxaKSGfnH
         zOJw==
X-Gm-Message-State: AOJu0YzHdWDWBCrqPHxzX9u36+Wk/WeFlxPhYxnnVNKsbXyVLMUa8ebG
	DdTQ+Xn0WhhcMbt99tcfnvgPmda9fKEZ17NoOW5bEvk4BXlO6mXwoqJNupUmg4ViEzl20NZLcQU
	oigRq
X-Gm-Gg: ATEYQzx+p9IsOi1yzsExMPCq/7VGVUXj71iy547phZ0/qjMLaWHg2DqTqEt4bdUtCfn
	I8ck5a8MEaFb/RUDmy6try2V6fkt9j4vpqafJUZKQMqqtoGYpZ7NF0oP07CUgCu43KSnkB7KNJo
	rvW7GFAzoe4T0OGRJWjODfZo9vSbYfCBqgiHTxzbLqqG8fRZYH1mM/v/myWi0M2G+RoNASgoX5s
	wV1UUPiRrRri85eCdLZSFzB9sN2yGA8+kQ0cZR0kbimnqdLFHG4SRubOG51LrkBx91agg2fZfPw
	kjd0zkZHXCx/SC4K3Rp3h0bXPsgMI311+hQQCje7D3Lbh2Kyx57Hf7cdfhhW73uQlXtAcry3l64
	+pQWgvRjAIol/9P2RsxFKIqgpDO8IeeY+IPagaq1MBuo7530ZRY8yw0bgb6J3B8IgtH0QrMFivz
	915SM+QlD4snL+DkHfosa3lV+Mp3S7xetPTcKaR2I=
X-Received: by 2002:a05:600c:4453:b0:485:3e20:4013 with SMTP id 5b1f17b1804b1-486f4463622mr106510225e9.28.1773912241703;
        Thu, 19 Mar 2026 02:24:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8c53324sm62169825e9.15.2026.03.19.02.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:24:01 -0700 (PDT)
Date: Thu, 19 Mar 2026 12:23:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Binbin Zhou <zhoubinbin@loongson.cn>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [linux-next:master 6322/7246]
 drivers/dma/loongson/loongson2-apb-cmc-dma.c:516
 loongson2_cmc_dma_tx_status() error: we previously assumed 'lchan->desc'
 could be null (see line 512)
Message-ID: <202603191117.QkPVup2Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260319092357.NEF-kSQq1xYX4acNZQ-zqj2opBADemSL6J-W5EigElg@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
commit: 1c0028e725f156ebabe68b0025f9c8e7a6170ffd [6322/7246] dmaengine: loongson: New driver for the Loongson Multi-Channel DMA controller
config: m68k-randconfig-r073-20260318 (https://download.01.org/0day-ci/archive/20260319/202603191117.QkPVup2Y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603191117.QkPVup2Y-lkp@intel.com/

smatch warnings:
drivers/dma/loongson/loongson2-apb-cmc-dma.c:516 loongson2_cmc_dma_tx_status() error: we previously assumed 'lchan->desc' could be null (see line 512)
drivers/dma/loongson/loongson2-apb-cmc-dma.c:677 loongson2_cmc_dma_probe() warn: unsigned 'lchan->irq' is never less than zero.

vim +516 drivers/dma/loongson/loongson2-apb-cmc-dma.c

1c0028e725f156 Binbin Zhou 2026-03-07  498  
1c0028e725f156 Binbin Zhou 2026-03-07  499  static enum dma_status loongson2_cmc_dma_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
1c0028e725f156 Binbin Zhou 2026-03-07  500  						   struct dma_tx_state *state)
1c0028e725f156 Binbin Zhou 2026-03-07  501  {
1c0028e725f156 Binbin Zhou 2026-03-07  502  	struct loongson2_cmc_dma_chan *lchan = to_lmdma_chan(chan);
1c0028e725f156 Binbin Zhou 2026-03-07  503  	struct virt_dma_desc *vdesc;
1c0028e725f156 Binbin Zhou 2026-03-07  504  	enum dma_status status;
1c0028e725f156 Binbin Zhou 2026-03-07  505  
1c0028e725f156 Binbin Zhou 2026-03-07  506  	status = dma_cookie_status(chan, cookie, state);
1c0028e725f156 Binbin Zhou 2026-03-07  507  	if (status == DMA_COMPLETE || !state)
1c0028e725f156 Binbin Zhou 2026-03-07  508  		return status;
1c0028e725f156 Binbin Zhou 2026-03-07  509  
1c0028e725f156 Binbin Zhou 2026-03-07  510  	scoped_guard(spinlock_irqsave, &lchan->vchan.lock) {
1c0028e725f156 Binbin Zhou 2026-03-07  511  		vdesc = vchan_find_desc(&lchan->vchan, cookie);
                                                                                ^^^^^^^^^^^^^
If lchan->vchan is NULL we are toasted here.

1c0028e725f156 Binbin Zhou 2026-03-07 @512  		if (lchan->desc && cookie == lchan->desc->vdesc.tx.cookie)
                                                            ^^^^^^^^^^^
So this NULL check is too late.

1c0028e725f156 Binbin Zhou 2026-03-07  513  			state->residue = loongson2_cmc_dma_desc_residue(lchan, lchan->desc,
1c0028e725f156 Binbin Zhou 2026-03-07  514  									lchan->next_sg);
1c0028e725f156 Binbin Zhou 2026-03-07  515  		else if (vdesc)
1c0028e725f156 Binbin Zhou 2026-03-07 @516  			state->residue = loongson2_cmc_dma_desc_residue(lchan,

loongson2_cmc_dma_desc_residue() also dereferences
lchan->desc.

1c0028e725f156 Binbin Zhou 2026-03-07  517  									to_lmdma_desc(vdesc), 0);
1c0028e725f156 Binbin Zhou 2026-03-07  518  	}
1c0028e725f156 Binbin Zhou 2026-03-07  519  
1c0028e725f156 Binbin Zhou 2026-03-07  520  	return status;
1c0028e725f156 Binbin Zhou 2026-03-07  521  }

[ snip to probe function ]

1c0028e725f156 Binbin Zhou 2026-03-07  669  	ret = dmaenginem_async_device_register(ddev);
1c0028e725f156 Binbin Zhou 2026-03-07  670  	if (ret)
1c0028e725f156 Binbin Zhou 2026-03-07  671  		return dev_err_probe(dev, ret, "Failed to register DMA engine device.\n");
1c0028e725f156 Binbin Zhou 2026-03-07  672  
1c0028e725f156 Binbin Zhou 2026-03-07  673  	for (i = 0; i < nr_chans; i++) {
1c0028e725f156 Binbin Zhou 2026-03-07  674  		lchan = &lddev->chan[i];
1c0028e725f156 Binbin Zhou 2026-03-07  675  
1c0028e725f156 Binbin Zhou 2026-03-07  676  		lchan->irq = platform_get_irq(pdev, i);
1c0028e725f156 Binbin Zhou 2026-03-07 @677  		if (lchan->irq < 0)
1c0028e725f156 Binbin Zhou 2026-03-07  678  			return lchan->irq;

Make lchan->irq an int.  Unsigned breaks error checking.

1c0028e725f156 Binbin Zhou 2026-03-07  679  
1c0028e725f156 Binbin Zhou 2026-03-07  680  		ret = devm_request_irq(dev, lchan->irq, loongson2_cmc_dma_chan_irq, IRQF_SHARED,
1c0028e725f156 Binbin Zhou 2026-03-07  681  				       dev_name(chan2dev(lchan)), lchan);
1c0028e725f156 Binbin Zhou 2026-03-07  682  		if (ret)
1c0028e725f156 Binbin Zhou 2026-03-07  683  			return ret;
1c0028e725f156 Binbin Zhou 2026-03-07  684  	}
1c0028e725f156 Binbin Zhou 2026-03-07  685  
1c0028e725f156 Binbin Zhou 2026-03-07  686  	ret = loongson2_cmc_dma_acpi_controller_register(lddev);
1c0028e725f156 Binbin Zhou 2026-03-07  687  	if (ret)
1c0028e725f156 Binbin Zhou 2026-03-07  688  		return dev_err_probe(dev, ret, "Failed to register dma controller with ACPI.\n");
1c0028e725f156 Binbin Zhou 2026-03-07  689  
1c0028e725f156 Binbin Zhou 2026-03-07  690  	ret = loongson2_cmc_dma_of_controller_register(lddev);
1c0028e725f156 Binbin Zhou 2026-03-07  691  	if (ret)
1c0028e725f156 Binbin Zhou 2026-03-07  692  		return dev_err_probe(dev, ret, "Failed to register dma controller with FDT.\n");
1c0028e725f156 Binbin Zhou 2026-03-07  693  
1c0028e725f156 Binbin Zhou 2026-03-07  694  	dev_info(dev, "Loongson-2 Multi-Channel DMA Controller registered successfully.\n");
1c0028e725f156 Binbin Zhou 2026-03-07  695  
1c0028e725f156 Binbin Zhou 2026-03-07  696  	return 0;
1c0028e725f156 Binbin Zhou 2026-03-07  697  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

