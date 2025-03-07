Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273452054E9
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 09:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741340114; cv=none; b=BeHN5AFk2mx06Y6yCcrjNEmAr94uNuYw5YJNO5MbraDPqB9qbW1qwNWvVhp6K7K+mTwzB10peGaoW0o/gh1+V8zo0ywBUjSLyBuDEyHAII/Ht7njWTU3ruRpOSBKU5zVGNk0AfhaBnw/hzSmuADY3Zha2rtI05bScub2CcZfWgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741340114; c=relaxed/simple;
	bh=jYoSV8nQfJp7un5aTqDi+A3w76r2felo0UbylAdqFyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MHvR/NL8brrVPoX3rTg5r+x7iCuGdQWcErRgNS7slZgir5PZHwrHugqBgxi2xGRQpgT9Vm6LxNr2Md2S4kidHJrLxtz3p23c42N/auqCYBlTzWniLvSKnR7PXKgV9nBtUBSV0Lc/pUhQWnr7ubbXNlQfzFw/t2+DGFBRyNLXiK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mK76bCaF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mK76bCaF"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so811196f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 07 Mar 2025 01:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741340110; x=1741944910; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tG4wOjkGDNlxrhDYLef3YLmq5DbwWRyZAglhXkugrhk=;
        b=mK76bCaFl1q3r1FlLwJVB6/TsDIVAGwj53uRAK5qhklB/idkAhU81m0J7L1rTZjReI
         DjJCmWPb56nzdp3Yk2BvHvzBOZGogoy0c0QE8q0xa5Joo6skQt3AxJzbfpTWjtPWVA9O
         IsNLuDye7Jf2WjMnihq6u7uXMROkNSXsz5wPbBlL1SRuRvMW0Y0e0HFBaSf0WLgS5Yio
         vGaEDpq93j6UE3v0mC9NthGQVfbizKqbl0FJQzpx2ivBfTDqnA3Vv7Z03IW+2Y0Q4QCu
         VJVluUhOdtOaoUwFPwoK9Qih9HUcQmYeRpJuGtK+pYWiiYSiORFayVh+Fi0Gl63rzCiS
         UrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741340110; x=1741944910;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tG4wOjkGDNlxrhDYLef3YLmq5DbwWRyZAglhXkugrhk=;
        b=ChPaPb1Yi7IW3Mgdiv6tV37+x50ETqsdqGWndBBXzMVMiykoteedwTEGaAiUHhqq3e
         QdjvZM8eAsEnU8cwF+atWSG937vSPDuWC+bi+FP3GkpKzcFD5rjhs4nR5kPZD24B1/yA
         DWnhfczXrJvHqbl+LzM06bw5yQO6NsSmcdW8JRE/wmzH6rRVQFzgmz0Rp/YqCfXKYQws
         oYRZHMMM8fthJkI0FmnSC0KStGa3Df0D0Dvcj1mhDUaQIpgwfyz9/qTUO41T4pOXsTMn
         W8fduOFl2NfnL7M84yUHQfYmpBmKZUgNz/i6EcFDiH7xZWvfOX5PuYNACYTkV4hV00QE
         rt0g==
X-Gm-Message-State: AOJu0YzZyYo0AbEF8MtI6g0F4trLstZrs0T8IktLiiwCsupk+s5IRHbH
	WOBgHsgDNoJA1D32znp01HFVHW096p/15k9SFV2GbhJC6wMxAo4NEmObcq4PKhhPxxOcArqmS3w
	I
X-Gm-Gg: ASbGncvX3xgnEFmG+jd+/czBGIuYpGcYpzOg5QwhDZwn4EKuSQwJ01g5aYeUZH3RS4p
	ti8CAl2OsdJiIpLWE+08TiHAJfVHMcVmRtg7yzGpQk3+3SzPDbYPLhV2PoVko19AQ+wSX9Xp27p
	3kIxWplmeaNcaS9tZO48j6zPv3QAy5JN/OJrM3TMBwcv8NtH3cv9mCYDY2bujYLP4QGxnScVsaU
	LisdO1nrpkYYeLryswPPAA6Cj2iNYUOCGR+slXldtd8S5v0F8iwNoLP495u1gqaEb30hoQjq5mh
	I++c/d17FPUrUvmnlxZQWXjKJCxnkybj3zruh+Rh0FT9TyjxTg==
X-Google-Smtp-Source: AGHT+IHkXSAqFp5TDNlCnoK05b/KoISEKKsQipby+FODmtnLx9O7Cb6nJRjyYWBfk3StIU8egQB/bg==
X-Received: by 2002:a05:6000:1867:b0:38f:2a53:1d78 with SMTP id ffacd0b85a97d-39132d20b9emr1587470f8f.10.1741340110231;
        Fri, 07 Mar 2025 01:35:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c104acesm4823915f8f.98.2025.03.07.01.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:35:09 -0800 (PST)
Date: Fri, 7 Mar 2025 12:35:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Etienne Carriere <etienne.carriere@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Olivier Masse <olivier.masse@nxp.com>
Subject: [jens-wiklander-tee:testing/tuxbuild 6/10] drivers/tee/tee_shm.c:258
 tee_shm_register_fd() warn: passing zero to 'PTR_ERR'
Message-ID: <06bf6c6d-f4f3-4a19-be2e-e8a7f3f6c999@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   http://git.linaro.org/people/jens.wiklander/linux-tee testing/tuxbuild
head:   f4198d1f9ee51430ec81d02bb21f769cb6fd14c1
commit: 7fc3cd07fc7e055deefa3b33ff9f702ccd9f7864 [6/10] tee: new ioctl to a register tee_shm from a dmabuf file descriptor
config: sh-randconfig-r073-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071648.ViJVMQTh-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503071648.ViJVMQTh-lkp@intel.com/

smatch warnings:
drivers/tee/tee_shm.c:258 tee_shm_register_fd() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +258 drivers/tee/tee_shm.c

7fc3cd07fc7e05 Etienne Carriere 2016-10-27  210  struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  211  {
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  212  	struct tee_shm_dmabuf_ref *ref;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  213  	int rc;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  214  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  215  	if (!tee_device_get(ctx->teedev))
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  216  		return ERR_PTR(-EINVAL);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  217  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  218  	teedev_ctx_get(ctx);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  219  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  220  	ref = kzalloc(sizeof(*ref), GFP_KERNEL);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  221  	if (!ref) {
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  222  		rc = -ENOMEM;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  223  		goto err_put_tee;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  224  	}
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  225  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  226  	refcount_set(&ref->shm.refcount, 1);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  227  	ref->shm.ctx = ctx;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  228  	ref->shm.id = -1;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  229  	ref->shm.flags = TEE_SHM_DMA_BUF;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  230  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  231  	ref->dmabuf = dma_buf_get(fd);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  232  	if (IS_ERR(ref->dmabuf)) {
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  233  		rc = PTR_ERR(ref->dmabuf);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  234  		goto err_kfree_ref;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  235  	}
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  236  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  237  	rc = tee_heap_update_from_dma_buf(ctx->teedev, ref->dmabuf,
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  238  					  &ref->offset, &ref->shm,
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  239  					  &ref->parent_shm);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  240  	if (!rc)
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  241  		goto out;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  242  	if (rc != -EINVAL)
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  243  		goto err_put_dmabuf;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  244  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  245  	ref->attach = dma_buf_attach(ref->dmabuf, &ctx->teedev->dev);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  246  	if (IS_ERR(ref->attach)) {
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  247  		rc = PTR_ERR(ref->attach);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  248  		goto err_put_dmabuf;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  249  	}
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  250  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  251  	ref->sgt = dma_buf_map_attachment(ref->attach, DMA_BIDIRECTIONAL);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  252  	if (IS_ERR(ref->sgt)) {
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  253  		rc = PTR_ERR(ref->sgt);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  254  		goto err_detach;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  255  	}
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  256  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  257  	if (sg_nents(ref->sgt->sgl) != 1) {
7fc3cd07fc7e05 Etienne Carriere 2016-10-27 @258  		rc = PTR_ERR(ref->sgt->sgl);

This should be "rc = -EINVAL;"

7fc3cd07fc7e05 Etienne Carriere 2016-10-27  259  		goto err_unmap_attachement;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  260  	}
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  261  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  262  	ref->shm.paddr = page_to_phys(sg_page(ref->sgt->sgl));
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  263  	ref->shm.size = ref->sgt->sgl->length;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  264  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  265  out:
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  266  	mutex_lock(&ref->shm.ctx->teedev->mutex);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  267  	ref->shm.id = idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  268  				1, 0, GFP_KERNEL);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  269  	mutex_unlock(&ref->shm.ctx->teedev->mutex);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  270  	if (ref->shm.id < 0) {
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  271  		rc = ref->shm.id;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  272  		if (ref->attach)
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  273  			goto err_unmap_attachement;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  274  		goto err_put_dmabuf;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  275  	}
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  276  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  277  	return &ref->shm;
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  278  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  279  err_unmap_attachement:
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  280  	dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTIONAL);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  281  err_detach:
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  282  	dma_buf_detach(ref->dmabuf, ref->attach);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  283  err_put_dmabuf:
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  284  	dma_buf_put(ref->dmabuf);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  285  err_kfree_ref:
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  286  	kfree(ref);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  287  err_put_tee:
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  288  	teedev_ctx_put(ctx);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  289  	tee_device_put(ctx->teedev);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  290  
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  291  	return ERR_PTR(rc);
7fc3cd07fc7e05 Etienne Carriere 2016-10-27  292  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

