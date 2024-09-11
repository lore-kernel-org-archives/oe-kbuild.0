Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132F0185B47
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Sep 2024 11:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055490; cv=none; b=iUrcHXGAnPDxwjxnYEFs38JgFwdVTdCEVO3stgxr/kt5egMxE5PW6uvItvROVU9b1ovvuxlt9lvWk2CtFJKCqNnNCpqXaJ61UDcWrBjscvI8Y5jinzzAokzUEBOHHGmlxrTUN87NISwY7bL063Dwh7lH8kGc6QI050O9QkyHE5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055490; c=relaxed/simple;
	bh=7JdGRNFdmZF7k0l2jNGO8BYgH0A0ST1yXDb2Cyt45aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TiO+muNIwosDbwn9Ps8KoNzCP0Gg1ZM4+5tN4O0oRHslWUtNYURArGL1nzap9WUT233Ml4/U3u5cLISICNhirca3p8e5zwZoXFBgZMrVmuoVtQt+3pkLsqa03vZWYouk2LnauTCxU1QU9vGSjgJtk2qlXXX6t6Q5qL0ojqtp1Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rUBVFuDl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rUBVFuDl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42ca573fd5aso47247565e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 11 Sep 2024 04:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726055486; x=1726660286; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/6I9IuMgBib9/w7Nd302sQAM1SwjsPMhkGsqfnLP/VI=;
        b=rUBVFuDlnrWRwEldz812lVH76SGyyyCPvSNxyPnC6bjurqTkN4t/vy8m+OqEy0R/WS
         BUUbYHzNdmiFeZzWAwdahEdNZAoKuycoew4n+bbn5es6/WacZXUOXbzomjxqRtC+Fq/p
         l78Ta+5z0Q7svmBSIev2Y2iP7bPqadL2YePbIyCvjILTNG9AjyQ/AJiSj6FSkzXPYcHf
         aIDaSkyyI23dCZlp/CeIoeijHk52rw5g5HnT5HiOvvnuQmMIGG21TTEgHqWaA+fUe7Oa
         Ukteo1K5MCT5LB/TMSib7OGBt7lkyGbU2j610DRzfY+6FBEZxmPbIYpp/dQZZoHR3kDc
         fcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726055486; x=1726660286;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6I9IuMgBib9/w7Nd302sQAM1SwjsPMhkGsqfnLP/VI=;
        b=rgbZLd9PMPHmZ2np93oRsDUdkN7rs+z9ITETQFrSDqzssCXL9iCm2H2vqJUWZGK7dj
         kmyhbKxHh9U5lR5A9sZM6eTcA2VrNLEg/SRV4CG9OdT9eWGNKSwGadKkx1oi9u227PSu
         GM6JfopGX1CnepHWMjUti34JulrNwlev7hn6ch9aFqmtlXUcgZQNdaQfc/693COWn2cf
         CDutBoaDwi9qQDuGd/32YI5nlVHV3DBoZzwe8V/KlF2YuoYqfKjQ9EQcMV3bxpuRx07U
         YoUIhTdQ+zG2XKmDRSLZvsE04GznD46VCwOz9rhbZWQ09fHa3a6OrYKlzoGbqBLIEZu4
         s2tg==
X-Gm-Message-State: AOJu0YxjIo7jR0tMkejTKp4V9K06JLqMxPxw51mIcWsiYzqrYcs8AMaj
	ijPX8EynSCR28YFDtgcNgiNiEaHXgw50va8q7QuRXQINasUQxDF2cv3btpa0UV3FyaNMN8QLYSF
	K
X-Google-Smtp-Source: AGHT+IE2rnsFVSGtu9CczjMcs5psiK7V0m/YeQBj1d+DAZHFEYLqu7yGSIxak2i+jUuwosYI+zsM1w==
X-Received: by 2002:a05:600c:1ca0:b0:42c:b995:20d3 with SMTP id 5b1f17b1804b1-42cb9952478mr67205345e9.26.1726055485754;
        Wed, 11 Sep 2024 04:51:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb58d815esm110418295e9.31.2024.09.11.04.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 04:51:25 -0700 (PDT)
Date: Wed, 11 Sep 2024 14:51:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip-rt-rebase 606/1088]
 drivers/usb/host/xhci-plat.c:382 xhci_generic_plat_probe() error: we
 previously assumed 'sysdev' could be null (see line 372)
Message-ID: <e0aea6ee-be94-47c5-8304-c4bb73b1b766@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rt-rebase
head:   a0259975fd96430fc3d3859251a11923a9ccc1d1
commit: e2c2ad91a42ad031d823e03bc4e89478af1ccaad [606/1088] xhci: split out rcar/rz support from xhci-plat.c
config: i386-randconfig-141-20240910 (https://download.01.org/0day-ci/archive/20240911/202409111932.8IfPbgLM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409111932.8IfPbgLM-lkp@intel.com/

smatch warnings:
drivers/usb/host/xhci-plat.c:382 xhci_generic_plat_probe() error: we previously assumed 'sysdev' could be null (see line 372)

vim +/sysdev +382 drivers/usb/host/xhci-plat.c

e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  359  static int xhci_generic_plat_probe(struct platform_device *pdev)
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  360  {
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  361  	const struct xhci_plat_priv *priv_match;
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  362  	struct device *sysdev;
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  363  	int ret;
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  364  
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  365  	/*
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  366  	 * sysdev must point to a device that is known to the system firmware
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  367  	 * or PCI hardware. We handle these three cases here:
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  368  	 * 1. xhci_plat comes from firmware
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  369  	 * 2. xhci_plat is child of a device from firmware (dwc3-plat)
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  370  	 * 3. xhci_plat is grandchild of a pci device (dwc3-pci)
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  371  	 */
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01 @372  	for (sysdev = &pdev->dev; sysdev; sysdev = sysdev->parent) {
                                                                                          ^^^^^^
If sysdev is NULL

e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  373  		if (is_of_node(sysdev->fwnode) ||
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  374  			is_acpi_device_node(sysdev->fwnode))
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  375  			break;
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  376  #ifdef CONFIG_PCI
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  377  		else if (sysdev->bus == &pci_bus_type)
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  378  			break;
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  379  #endif
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  380  	}
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  381  
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01 @382  	if (WARN_ON(!sysdev->dma_mask)) {
                                                                             ^^^^^^^^^^^^^^^^
It will crash

e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  383  		/* Platform did not initialize dma_mask */
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  384  		ret = dma_coerce_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  385  		if (ret)
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  386  			return ret;
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  387  	}
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  388  
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  389  	if (pdev->dev.of_node)
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  390  		priv_match = of_device_get_match_data(&pdev->dev);
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  391  	else
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  392  		priv_match = dev_get_platdata(&pdev->dev);
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  393  
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  394  	return xhci_plat_probe(pdev, sysdev, priv_match);
e2c2ad91a42ad0 Arnd Bergmann             2023-06-01  395  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

