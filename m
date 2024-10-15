Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD65B1B0137
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728984929; cv=none; b=M+I91RsACJJtBGLv3Dss29Ki0Sv3vyb3AYVCX75WkWOajKHrHifXse2cn6bd0/OctHUwht4vhIHryxxGIaFAmp559ydInFXFDmvMHj521BONIdhAhFsTJOHwnY+VprVAXxwLbgbKlZUsc8FXPSECkSnAje5geVkQt78/pmsrZ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728984929; c=relaxed/simple;
	bh=LtkGmQYJngv0+N5zowvnMUUtMR1wazMbXTqoPS4XZIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W6RVCcyf4Qb2L5IRTLp0lJn0m7Se7lT4mQDE5n9Ez6P84hL4w1sNX0kAyzqJztZ5w83f7euS1390asA8UWIIc8kj+RqL5bvqGqE+Xm+C5Xg6vKShNVfJLSsaA/r3SyAmdJzyjw8pnX5vpY4Jx/T1j4pTpksOC4PxXtSc3x8lGj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zeEPxpAw; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zeEPxpAw"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c95a962c2bso3952841a12.2
        for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 02:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728984926; x=1729589726; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dtt5ruZcTqXCpA5r4X1yvSpTefxk7jmtoHyp5gVIjPA=;
        b=zeEPxpAw99b67zQ+HfOfasOoghqYhbXYflC3jDrSIuBaBpZ+NM7MNoHZAF02uhvroo
         YGlvnBKEcvifMLhkhxz8x1HGGUhh3g6eJ9DFFLuJuhN3DOZvGyP6uYtzHQIdASotGWlV
         2HJ9t4NH9+tN5X2E5Pu1Bk8HuG3rRTlPJpLhHFcoImNzBinvHd7Z/xuOZjJb7nBdPzWo
         LtJxiLzaRar9ezFi2C7G5K21jK7QJlHO6wxuzYbJx3e345wwTn6emZZ0txKDJd6/19PL
         bZh6OYq9aasGZXOM4E4Pzf8LqioqC0fkt3HHwk1DmxXNt7oIgZRFNK/FlYL4gvqKbqeL
         Pxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728984926; x=1729589726;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dtt5ruZcTqXCpA5r4X1yvSpTefxk7jmtoHyp5gVIjPA=;
        b=IyJuYnjGgLrnNKZbrTIPnN8cTwj1xVTENYH3WRsymPYMJYYJDKdlZy4BEG3Oz4ivxf
         Mb/s17f/VfsaKkStwtLiqrZNPyvOqZiPXhFmAsmSm4qGI9tJtDb8Z22W5fhvUdg3BKuk
         kGk5k8C9oWvVgaV16IZVBK3Vf1xvqvjon6TVt40OROSbjkGzof4fdgaMQUfnS7C2ZTQg
         cSZCMmigaWO8JVYH8QkQcreWK8K9NW9ydYoYd86yJ0pe554pE1MonWghzj8MCsdONFwf
         n7ztH+YIizn1drRTfthjxsX7tn6UNWKUuCY8OfRhmamyLZ16a0BKO1vOZ9F6aoR2bC/a
         Bm5A==
X-Gm-Message-State: AOJu0Yy+q5EDXtHwky1sDuotin2EiewbN5dKC8Dote4fNV152f9pEs93
	CAMPQL4eLqu1m5gUaxC/aF8tUBL8l28SxGvn1O5JyE5YLhij6Ve07/PSxOwk18Kz/ZwZ8o8betU
	I
X-Google-Smtp-Source: AGHT+IEZzu3niH2ur1wKKaqKOt4J3IT5DAet4B+x9PtVAz5hyNU+yIZsMosyoGLTXXdQTnHuFDVwmg==
X-Received: by 2002:a05:6402:210e:b0:5c9:84f5:d566 with SMTP id 4fb4d7f45d1cf-5c984f5d6a0mr3204312a12.12.1728984925779;
        Tue, 15 Oct 2024 02:35:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d507755sm489819a12.44.2024.10.15.02.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 02:35:25 -0700 (PDT)
Date: Tue, 15 Oct 2024 12:35:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip-rebase 606/1105]
 drivers/usb/host/xhci-plat.c:382 xhci_generic_plat_probe() error: we
 previously assumed 'sysdev' could be null (see line 372)
Message-ID: <687d643d-9791-4f24-91d8-7a82847c3cab@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rebase
head:   3cdd0cc9c0e53917e2c4e56b1e7256ae8923845e
commit: 7ce55f4ea24048dd70fb4aa8f522c94d5f767f08 [606/1105] xhci: split out rcar/rz support from xhci-plat.c
config: x86_64-randconfig-161-20241014 (https://download.01.org/0day-ci/archive/20241015/202410150653.RDBoPiA3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410150653.RDBoPiA3-lkp@intel.com/

smatch warnings:
drivers/usb/host/xhci-plat.c:382 xhci_generic_plat_probe() error: we previously assumed 'sysdev' could be null (see line 372)

vim +/sysdev +382 drivers/usb/host/xhci-plat.c

7ce55f4ea24048 Arnd Bergmann             2023-06-01  359  static int xhci_generic_plat_probe(struct platform_device *pdev)
7ce55f4ea24048 Arnd Bergmann             2023-06-01  360  {
7ce55f4ea24048 Arnd Bergmann             2023-06-01  361  	const struct xhci_plat_priv *priv_match;
7ce55f4ea24048 Arnd Bergmann             2023-06-01  362  	struct device *sysdev;
7ce55f4ea24048 Arnd Bergmann             2023-06-01  363  	int ret;
7ce55f4ea24048 Arnd Bergmann             2023-06-01  364  
7ce55f4ea24048 Arnd Bergmann             2023-06-01  365  	/*
7ce55f4ea24048 Arnd Bergmann             2023-06-01  366  	 * sysdev must point to a device that is known to the system firmware
7ce55f4ea24048 Arnd Bergmann             2023-06-01  367  	 * or PCI hardware. We handle these three cases here:
7ce55f4ea24048 Arnd Bergmann             2023-06-01  368  	 * 1. xhci_plat comes from firmware
7ce55f4ea24048 Arnd Bergmann             2023-06-01  369  	 * 2. xhci_plat is child of a device from firmware (dwc3-plat)
7ce55f4ea24048 Arnd Bergmann             2023-06-01  370  	 * 3. xhci_plat is grandchild of a pci device (dwc3-pci)
7ce55f4ea24048 Arnd Bergmann             2023-06-01  371  	 */
7ce55f4ea24048 Arnd Bergmann             2023-06-01 @372  	for (sysdev = &pdev->dev; sysdev; sysdev = sysdev->parent) {
                                                                                          ^^^^^^
This loop exits with a NULL sysdev pointer

7ce55f4ea24048 Arnd Bergmann             2023-06-01  373  		if (is_of_node(sysdev->fwnode) ||
7ce55f4ea24048 Arnd Bergmann             2023-06-01  374  			is_acpi_device_node(sysdev->fwnode))
7ce55f4ea24048 Arnd Bergmann             2023-06-01  375  			break;
7ce55f4ea24048 Arnd Bergmann             2023-06-01  376  #ifdef CONFIG_PCI
7ce55f4ea24048 Arnd Bergmann             2023-06-01  377  		else if (sysdev->bus == &pci_bus_type)
7ce55f4ea24048 Arnd Bergmann             2023-06-01  378  			break;
7ce55f4ea24048 Arnd Bergmann             2023-06-01  379  #endif
7ce55f4ea24048 Arnd Bergmann             2023-06-01  380  	}
7ce55f4ea24048 Arnd Bergmann             2023-06-01  381  
7ce55f4ea24048 Arnd Bergmann             2023-06-01 @382  	if (WARN_ON(!sysdev->dma_mask)) {
                                                                             ^^^^^^^^^^^^^^^^
Unchecked dereference

7ce55f4ea24048 Arnd Bergmann             2023-06-01  383  		/* Platform did not initialize dma_mask */
7ce55f4ea24048 Arnd Bergmann             2023-06-01  384  		ret = dma_coerce_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
7ce55f4ea24048 Arnd Bergmann             2023-06-01  385  		if (ret)
7ce55f4ea24048 Arnd Bergmann             2023-06-01  386  			return ret;
7ce55f4ea24048 Arnd Bergmann             2023-06-01  387  	}
7ce55f4ea24048 Arnd Bergmann             2023-06-01  388  
7ce55f4ea24048 Arnd Bergmann             2023-06-01  389  	if (pdev->dev.of_node)
7ce55f4ea24048 Arnd Bergmann             2023-06-01  390  		priv_match = of_device_get_match_data(&pdev->dev);
7ce55f4ea24048 Arnd Bergmann             2023-06-01  391  	else
7ce55f4ea24048 Arnd Bergmann             2023-06-01  392  		priv_match = dev_get_platdata(&pdev->dev);
7ce55f4ea24048 Arnd Bergmann             2023-06-01  393  
7ce55f4ea24048 Arnd Bergmann             2023-06-01  394  	return xhci_plat_probe(pdev, sysdev, priv_match);
7ce55f4ea24048 Arnd Bergmann             2023-06-01  395  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

