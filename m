Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F53D77104
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Mar 2025 06:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742798966; cv=none; b=A846bchl95mEj8h2TxP3B8FXc5iQfCk8jV1myN6jW3B9g5TXEf2t9yE4KWR0bRWwR7yS/ZKbVgmsWjty3+0jBWtX4R0sww4c2ZHZpa3aPVPAa41MO73Y4CA8w4PXSGjbUqBgTLM/MjM9Pinr8AqsoeJb5UfAon803TxOI1xsGgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742798966; c=relaxed/simple;
	bh=MeBCltGop41WBqugBNpPQKxAaBr5naKJJrxh4qA/ICg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g6Zja+vdgimIGsQSKY7uYBmOjL00aGXN1ndVm6W6ozLwY4Wd1Mi89gc00IrAxb3/XhZNZ5F3MwBISkVy3wx/tN0EFajIj/MYTS4VB5+QVIyL5cxR5YgxQznFWAJzbQce6eeew/C3h2ukzsOWRJInEHg63/KbvaJatvfUX6dBKco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZDYqN4BD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZDYqN4BD"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3996af42857so3188016f8f.0
        for <oe-kbuild@lists.linux.dev>; Sun, 23 Mar 2025 23:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742798962; x=1743403762; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+dDZsz4UIUxmPWUxqRvwlmJXMsHW01F5Vt73n6SdVvk=;
        b=ZDYqN4BD0fDexloLYYpP6XDg4AMFItaH3KXq4fdC3AVTA5FdJJN8qFs4VhBFkvFo6i
         bF8mubBxDXvn+n7ZerDBSmNV25huDpWw36D2bcqO/4jJfgU4XEczw+f3nFn27kk+Isc6
         wOfGV+JApoFxv+o6eevz+Ng5HK5RbEvIRw872Hu7/24Ab4qbjM8zt1CwQb5dghMvwljQ
         SJg/akDYvA3+VkNJckD5XJE0sEIp9fnlqhBYCDmM4NcozUT5RUHyc6qZvwxdNQ9UKnOI
         MchIQaxchc6Hy9nDLBo5PHbh5ZdMVegdNTL55Ff4xlPzZ+J3FvGWWLsN7ut4eC7EqBuR
         zeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742798962; x=1743403762;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+dDZsz4UIUxmPWUxqRvwlmJXMsHW01F5Vt73n6SdVvk=;
        b=l0giAWbFeWJrXSWglTN4K611B2X4At9WhIMSU/iEFl0HyliJi45MfiRd3/vm6fWYvY
         U+OYwTnUS4h9CFQoLvY6Pqun6Ode2L5/dyOGSmfJfKTSAEFoNxiioNNTb+qk61IKGn2T
         88jhELSqwj2uBAuPgayfJqOug9KzrRjGMB18syBiNgB/t8D2XgD8o8jeM5os+M+JHfDo
         Gx0H/OAZCaznpkgGE5QJ5ALUWIi7jz1Pz6LH4DmjJWb5eJzthxbSr5IGjk+6+mlM0Kil
         ICOUPwYCuOGUJBVJ+G03ZldPjOpeFehagumLmlPy/8rlF0+WtK67HMrmVf0jNukzR69Y
         Z6Qg==
X-Gm-Message-State: AOJu0YwCh1aJ7dqPxQBNw3Nj1+3gwMF2+xw9KSlPb3OlsyVeBNWjGdWs
	Ruu58xsB1rDSyS5cS31d6xZ69Qiz8zJlGeHwYo1C5/2c0ntZ91dnK5+5WCjiDk5wEmQXKqwULkg
	UV/o=
X-Gm-Gg: ASbGncvrNJATgysWSIfd9urla/5DlpQCOxrB4yO2JCIB8zu4d89KPbVLYoSj8eiIDvH
	1OofM6I5GzPwYtlBr6L4I9bqmX+4ALh6uJc12fOGuNyjHjcCL4l9lL4hPZZ76+w4wSdCL14BPl+
	cGfqLF9u02p4wgqHAf660KudhEMEKp+YD97Dxsd7EE7Cxwki5oO2bAIOCq+t8Uv1HqWiM8uegQj
	TjdNQh2TUdFl/6XXIs9z+CvoqfMQLtl8I1enkg29D0N5XZwcYxPDTFFOnAO2J350Mfhv6W6mzQD
	rneF/50TD4ACM3Ye5BCgK6QOvjVBp+Hp48N8R4UIoGtZJpks0m9uBNci4+pe
X-Google-Smtp-Source: AGHT+IH/O+SxW/A6tHLl66luw0B3Q+UY6WxKotJgS9M1+9fv6/xBCkqaJIgLc48RFD0NzvhjcR8KOg==
X-Received: by 2002:a05:6000:1565:b0:38d:b028:d906 with SMTP id ffacd0b85a97d-3997f933816mr9868262f8f.21.1742798962016;
        Sun, 23 Mar 2025 23:49:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f995606sm10128335f8f.13.2025.03.23.23.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 23:49:21 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:49:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 9040/13068]
 drivers/dma/amd/ptdma/ptdma-dmaengine.c:358 pt_cmd_callback_work() warn:
 variable dereferenced before check 'desc' (see line 345)
Message-ID: <aa29df80-cb5b-48df-a95b-cd8e55cd301a@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9388ec571cb1adba59d1cded2300eeb11827679c
commit: 6565439894570a07b00dba0b739729fe6b56fba4 [9040/13068] dmaengine: ptdma: Utilize the AE4DMA engine's multi-queue functionality
config: x86_64-randconfig-161-20250323 (https://download.01.org/0day-ci/archive/20250323/202503231648.IEt8P4U5-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503231648.IEt8P4U5-lkp@intel.com/

smatch warnings:
drivers/dma/amd/ptdma/ptdma-dmaengine.c:358 pt_cmd_callback_work() warn: variable dereferenced before check 'desc' (see line 345)

vim +/desc +358 drivers/dma/amd/ptdma/ptdma-dmaengine.c

6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  336  static void pt_cmd_callback_work(void *data, int err)
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  337  {
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  338  	struct dma_async_tx_descriptor *tx_desc;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  339  	struct pt_dma_desc *desc = data;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  340  	struct dma_chan *dma_chan;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  341  	struct virt_dma_desc *vd;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  342  	struct pt_dma_chan *chan;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  343  	unsigned long flags;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  344  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03 @345  	dma_chan = desc->vd.tx.chan;
                                                                                                           ^^^^^^
Most of the function assumes "desc" is a valid non-NULL pointer.

6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  346  	chan = to_pt_chan(dma_chan);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  347  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  348  	if (err == -EINPROGRESS)
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  349  		return;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  350  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  351  	tx_desc = &desc->vd.tx;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  352  	vd = &desc->vd;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  353  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  354  	if (err)
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  355  		desc->status = DMA_ERROR;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  356  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  357  	spin_lock_irqsave(&chan->vc.lock, flags);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03 @358  	if (desc) {
                                                                                                    ^^^^
Checked too late.

6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  359  		if (desc->status != DMA_COMPLETE) {
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  360  			if (desc->status != DMA_ERROR)
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  361  				desc->status = DMA_COMPLETE;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  362  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  363  			dma_cookie_complete(tx_desc);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  364  			dma_descriptor_unmap(tx_desc);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  365  		} else {
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  366  			tx_desc = NULL;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  367  		}
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  368  	}
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  369  	spin_unlock_irqrestore(&chan->vc.lock, flags);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  370  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  371  	if (tx_desc) {
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  372  		dmaengine_desc_get_callback_invoke(tx_desc, NULL);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  373  		dma_run_dependencies(tx_desc);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  374  		list_del(&desc->vd.node);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  375  		vchan_vdesc_fini(vd);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  376  	}
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  377  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

