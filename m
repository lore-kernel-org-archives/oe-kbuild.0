Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3C626CE32
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 08:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765267819; cv=none; b=Jy6Csx9G1f3XmC1jPKKAzZ5m79MqBmDqjreyd1Q22r2iA9NzZStiGTTa3ddwiSiMOtrhAZ7pLITSgNHembcswcmtuLyOx+ebfYwshB4nUH+c1gwqDCSIZnM1lRU3oTM7Elh3p94EobfFDcH4CE2YBSeyjGJQNNVqv7lJujso+SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765267819; c=relaxed/simple;
	bh=7gniuGys6H7+WxWWXaMfm1YwOTO7kOhCA9PYKfonc2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gBfHX3+mgi2kPi0vN3Gbzyf4IAR1DIGVSOAAm4c+Uk+B9GVu+5H74M9+CyrgKX2PpxNWOBkPTQNixtJQYgUzt1LPSRBYcRnWwBj/6V/6SrMY25V4bT6j7zfSTmkKJ7DHD8LEhmvHydj0EbroeEvxoOjcgGCrNNR5CBdMRiW6GT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B2nw8VB1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2nw8VB1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso61426885e9.3
        for <oe-kbuild@lists.linux.dev>; Tue, 09 Dec 2025 00:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765267816; x=1765872616; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spRySZyV+VOtRcH5DjORY7pppljB96Ce+Il4WCp5AM8=;
        b=B2nw8VB1GvchFbELTC956t+AndqznMeeK8sUWVXqwphvoqd03FVDS2DqUdBMEQKD9+
         FicsbuyZIgufHXwH9rFqmpd6HTxiL5lyOYJUoWypB8NUdcqmwJ3OcMv7FfgvMrBIPwAO
         rxaE97x3pw8GdUkQ2uqC0Gdu7umLodA8ZS9MM9k0VfRSXb+QDfqn8VwvwuYNgmgABjL0
         /x9APjf/7aLHhRy18sFG3CXhwQP3C3a+ql5BWKiEaVU4byoLHklmoVkun3iFDOuEPuRE
         zbd4jZZUNFmmdLqpm6ay6kMZdRsUsiKhrg6+p7aTpFW3nWZWRmJxvbKVgOMOwziacwMw
         RMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765267816; x=1765872616;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spRySZyV+VOtRcH5DjORY7pppljB96Ce+Il4WCp5AM8=;
        b=hOegfivNNTFk+sLO7ATu8uwhiUQHgz/SdUNK3JFVHmHZCqISIKgtLUcKpt6tt1B9Q0
         620Avxtdqm3iw/7Hz/xe8qQRIbd9FvyU65IVsy+JBoB6RQ9OdO3aAKkJ4AkUaqqbmojB
         R+X2jY56nZzBXsZZL2kqFZavXHk3wjdR3KpI7lOmEDskYtaktn/tYChiHT4qwQfRYKzE
         N4SVS2wA+PF5fLI/Yjgr6SOf/nHpLqIIWsW/PYjQnb1FLoAdCPxBnWbDZN72/YjUSAJN
         59dew0Q1gVEbwIXjuAsCYHTLbv0bU57nSuQJf2yAIZIQ5EtGgfdR2nky2aCK515QUNrJ
         6YnA==
X-Gm-Message-State: AOJu0YxwXqoRnF6S8Pl59vBz948IwaU7nWTHgdPM2n4HQ7SsdHgc56x+
	FTc0NuS2fJJsOgqU3V6k38jfOkGPiQJKJiiyeZY3Vh1Ujkmx6KTissGCxe5YKJ4PT0WTFEhHqmz
	KjVKq
X-Gm-Gg: ASbGnctqu/MSP6YVJUpI+JqdX4JmbsojiPAOGiVDfsdk0wEWbZFUVQluOcmfpoSTL6W
	l3uWIYhZfQQyM4v8m/bRRj8iFGbmRhZke64vYMULMjXvCaavNLdxOx1/QJPdpLmd1W++g1PCfVQ
	EHV7v9NQQh8MASB20UoOcD9+5tV9YIeR/TNWIdB/YbDpls62wYGy0zkdBbqc3TkOngdsJwEwsk+
	8X+vhkysBNCcgCFm3s8khWFalsRmsPwY5mljIf3if8Wdxh8cnbfPAu2p7ryczwS7xwBmBaLUFgd
	driDWMlcE98lYJNf2SAIRtAj0wncSZvaRYmyWsXLZzr7Vz4yP1c5PHFdNNRK2D4euI3tTt4oMAz
	8Lo2kNh5NijVFMMl8rpXlRrERwrTD2Uf0mdyaTLLpC7m3RhTOFXhars+xobk2g5Z8vpLPI7kCsV
	qAGjvTRrVWL/V1Uizj
X-Google-Smtp-Source: AGHT+IFDA3qG7tfHKOUMmoIHKf4R4Il2Eu0O9T+v7vLC242anRcuYF8kcvLH3Eyq2rSRJwwYxrLuCQ==
X-Received: by 2002:a05:600c:354d:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-47939e49338mr102941665e9.34.1765267815724;
        Tue, 09 Dec 2025 00:10:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7da1dff5sm10650055e9.15.2025.12.09.00.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 00:10:15 -0800 (PST)
Date: Tue, 9 Dec 2025 11:10:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>
Subject: drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn:
 variable dereferenced before check 'pdev' (see line 500)
Message-ID: <202512082235.2rH8XoPX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251209081012.pHKssybr2WbbC8mHeGcfiNZ4lhAsljth0tvWW1Af9Vs@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2f2b01b74be8b40a2173372bcd770723f87e7b2
commit: 491fadb2b818e1d900229a1f8243de6458381306 drm/msm/adreno: Move adreno_gpu_func to catalogue
config: arm64-randconfig-r072-20251207 (https://download.01.org/0day-ci/archive/20251208/202512082235.2rH8XoPX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512082235.2rH8XoPX-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 500)
drivers/gpu/drm/msm/adreno/a3xx_gpu.c:530 a3xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 525)
drivers/gpu/drm/msm/adreno/a4xx_gpu.c:642 a4xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 637)

vim +/pdev +503 drivers/gpu/drm/msm/adreno/a2xx_gpu.c

491fadb2b818e1 Akhil P Oommen 2025-11-18  493  static struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
21af872cd8c695 Jonathan Marek 2018-11-21  494  {
21af872cd8c695 Jonathan Marek 2018-11-21  495  	struct a2xx_gpu *a2xx_gpu = NULL;
21af872cd8c695 Jonathan Marek 2018-11-21  496  	struct adreno_gpu *adreno_gpu;
21af872cd8c695 Jonathan Marek 2018-11-21  497  	struct msm_gpu *gpu;
21af872cd8c695 Jonathan Marek 2018-11-21  498  	struct msm_drm_private *priv = dev->dev_private;
21af872cd8c695 Jonathan Marek 2018-11-21  499  	struct platform_device *pdev = priv->gpu_pdev;
491fadb2b818e1 Akhil P Oommen 2025-11-18 @500  	struct adreno_platform_config *config = pdev->dev.platform_data;
                                                                                        ^^^^^^^^^
Patch adds a dereference.

21af872cd8c695 Jonathan Marek 2018-11-21  501  	int ret;
21af872cd8c695 Jonathan Marek 2018-11-21  502  
21af872cd8c695 Jonathan Marek 2018-11-21 @503  	if (!pdev) {

but the old code checked for NULL.  Probably this NULL check can be
removed?

21af872cd8c695 Jonathan Marek 2018-11-21  504  		dev_err(dev->dev, "no a2xx device\n");
21af872cd8c695 Jonathan Marek 2018-11-21  505  		ret = -ENXIO;
21af872cd8c695 Jonathan Marek 2018-11-21  506  		goto fail;
21af872cd8c695 Jonathan Marek 2018-11-21  507  	}
21af872cd8c695 Jonathan Marek 2018-11-21  508  
21af872cd8c695 Jonathan Marek 2018-11-21  509  	a2xx_gpu = kzalloc(sizeof(*a2xx_gpu), GFP_KERNEL);
21af872cd8c695 Jonathan Marek 2018-11-21  510  	if (!a2xx_gpu) {
21af872cd8c695 Jonathan Marek 2018-11-21  511  		ret = -ENOMEM;
21af872cd8c695 Jonathan Marek 2018-11-21  512  		goto fail;
21af872cd8c695 Jonathan Marek 2018-11-21  513  	}
21af872cd8c695 Jonathan Marek 2018-11-21  514  
21af872cd8c695 Jonathan Marek 2018-11-21  515  	adreno_gpu = &a2xx_gpu->base;
21af872cd8c695 Jonathan Marek 2018-11-21  516  	gpu = &adreno_gpu->base;
21af872cd8c695 Jonathan Marek 2018-11-21  517  
21af872cd8c695 Jonathan Marek 2018-11-21  518  	gpu->perfcntrs = perfcntrs;
21af872cd8c695 Jonathan Marek 2018-11-21  519  	gpu->num_perfcntrs = ARRAY_SIZE(perfcntrs);
21af872cd8c695 Jonathan Marek 2018-11-21  520  
491fadb2b818e1 Akhil P Oommen 2025-11-18  521  	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, 1);
db07ce5da8b26b Fabio Estevam  2023-06-20  522  	if (ret)
db07ce5da8b26b Fabio Estevam  2023-06-20  523  		goto fail;
db07ce5da8b26b Fabio Estevam  2023-06-20  524  
21af872cd8c695 Jonathan Marek 2018-11-21  525  	if (adreno_is_a20x(adreno_gpu))
21af872cd8c695 Jonathan Marek 2018-11-21  526  		adreno_gpu->registers = a200_registers;
21af872cd8c695 Jonathan Marek 2018-11-21  527  	else if (adreno_is_a225(adreno_gpu))
21af872cd8c695 Jonathan Marek 2018-11-21  528  		adreno_gpu->registers = a225_registers;
21af872cd8c695 Jonathan Marek 2018-11-21  529  	else
21af872cd8c695 Jonathan Marek 2018-11-21  530  		adreno_gpu->registers = a220_registers;
21af872cd8c695 Jonathan Marek 2018-11-21  531  
21af872cd8c695 Jonathan Marek 2018-11-21  532  	return gpu;
21af872cd8c695 Jonathan Marek 2018-11-21  533  
21af872cd8c695 Jonathan Marek 2018-11-21  534  fail:
21af872cd8c695 Jonathan Marek 2018-11-21  535  	if (a2xx_gpu)
21af872cd8c695 Jonathan Marek 2018-11-21  536  		a2xx_destroy(&a2xx_gpu->base.base);
21af872cd8c695 Jonathan Marek 2018-11-21  537  
21af872cd8c695 Jonathan Marek 2018-11-21  538  	return ERR_PTR(ret);
21af872cd8c695 Jonathan Marek 2018-11-21  539  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

