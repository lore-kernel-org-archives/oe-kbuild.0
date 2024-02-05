Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B16B10A11
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Feb 2024 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707115688; cv=none; b=RRIwFgXbagKhT7+9RN3zqPVJVRrYtJaSoTzdIFBb27Z6j+hU7BmGZ87a9evYwx47qJE/k1pFzRrjfr/zrAiOVZ/lol8ZopnReqHEznSCnWe1DZhe3k+HpSuDm9VSifWhwxdKhuatHAWVZeSfnWctse2ERCIWD0/uokrpd56bPiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707115688; c=relaxed/simple;
	bh=aTU2tjJCNPW6loc4Pxg7Kq1ri1tznc73vBdmoBGcjuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JWvmQccyIfYX+HIWzpXFlu527Bbvdsc+XyulL7ik8B5i09RkvQ9EYpOIcvUMZtusVue6GBawaAyt9aYaVebtjP0AzNemoxaaD6VdqesXtSeDHiG3CGwr+rjWflMJQ0r5jyRGZ5TNwDCGEXBlG+BgU9GOXn2iIvpWkEeGhkBZNk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rU12BHwZ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rU12BHwZ"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-511206d1c89so5505861e87.1
        for <oe-kbuild@lists.linux.dev>; Sun, 04 Feb 2024 22:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707115683; x=1707720483; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g4+4NEgRQmY7sbhuyc0r1b7GxmmtaYAy/MdmnitJ6MU=;
        b=rU12BHwZI8te51KMLrSH3bvW1Cr6hiFLbckWMnoLiSgWWV68L0WQTjGAmui0xN4Ikp
         kPNRHf+AabznIJup4WqGPSxfkm0Bv7Q3cpl758jzMFhIRwfHJg83A34vsR6z6JH8W1Gk
         n8n1Abd2Y87XwTMteb390FPy98xDbrncW0AjaXrfkagZy3iSxU/fbo5xnkhisS3NRWUT
         vHfrAT18lsC7v68jQewOzIrffuQiSoFK5g2GQt6AWnhQL4+eSNTE5yl/gz+nJijW5zgx
         jWV0lIZQlgjeoeUdWwr/+j4NV01qdZ6KkhudulrCtLzDYo69VCakwzlmCKK3+ShGNizV
         U56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707115683; x=1707720483;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4+4NEgRQmY7sbhuyc0r1b7GxmmtaYAy/MdmnitJ6MU=;
        b=f8SM2rlA2mrbPFZwpbOBba7oXvbkWKcpgRyCJb8g+dOs04uyUApXVBYuAISCL05dwo
         4M+6Zsv+UVvlYM9xo0q471NK6/EXrvxz9UyUG70Psr2p2Ijrp9UO9gaFajHJAD5pIsYn
         n7rj4ePY1Hp1DRHx2+HZ4L8ImDRqUiH9g+8Vy0rMzfmbvzWGbyqdwuMblpxm9yccH0QG
         DOQcRwkovRiATYh6GfTMdzo2IaouJ33R8E4wtPy+8M/Nh1bI0oid/eTH8FVV51QuKjsG
         ao6U08J61XOllUCYr93SN+YwqbwfQmbWzE4qt9mr2/FKTuwTiVQ0A+GPPJVMlRAcjjCS
         IBRg==
X-Gm-Message-State: AOJu0YwSXmSNIwP2C76DmZTjVv3fALjzMFqjMm1djyAGb6sgIb1RJpB5
	NTBOMuIWY/JXsLBRw6vfexMfPhHNyIvVbGanC1FkJBVqopK7e3v+LNzZ7Dq9xT0Og3AYzed8K8S
	6
X-Google-Smtp-Source: AGHT+IFMTO7MpzVSlVseVaDDGbsH/RBrBDdMDehTSiOhfnPVgmXBF5TrkbKrK8wAsjwH5oOYQ7VlYA==
X-Received: by 2002:a05:6512:312d:b0:511:3a93:5b7a with SMTP id p13-20020a056512312d00b005113a935b7amr4307919lfd.21.1707115683415;
        Sun, 04 Feb 2024 22:48:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWxQOGIbDCRuUTqO2KweJMY7QXIYvG+Biu38f4sz5vNiEgpisATi8Te2+i/mOMMaayRAiWmdAuXl8DQMdSv0gjWcilG1E9cXKMhwFwhqEaBPmA36w3NQK6r1nTyp02as0segaGtoBo6jC4YIGGsXkL5a/EV+4I=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709063c4f00b00a376329d829sm2302424ejg.172.2024.02.04.22.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 22:48:03 -0800 (PST)
Date: Mon, 5 Feb 2024 09:47:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Pavel Machek <pavel@ucw.cz>
Subject: [cip:linux-6.1.y-cip-rt-rebase 30/208]
 drivers/usb/host/xhci-plat.c:378 xhci_generic_plat_probe() error: we
 previously assumed 'sysdev' could be null (see line 368)
Message-ID: <ea664101-3d43-4545-b9e6-894e778e042e@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[ This is a Long Term Support tree.  The warning was fixed upstream.
  I removed Arnd and Greg from the CC list because I don't think they
  want to track the CIP kernel.

  I feel like if you're backporting patches, then you should look for
  Fixes tags which mention those patches.

  Fixes: 77191db5ba7b ("xhci: host: potential NULL dereference in xhci_generic_plat_probe()")

  - dan ]

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip-rt-rebase
head:   c3f80d7eeb70a51f6e05a5ca8424af3780072f29
commit: e60d31e628503adf7418431d64d198d700748550 [30/208] xhci: split out rcar/rz support from xhci-plat.c
config: x86_64-randconfig-161-20240205 (https://download.01.org/0day-ci/archive/20240205/202402051022.79SV50bg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402051022.79SV50bg-lkp@intel.com/

New smatch warnings:
drivers/usb/host/xhci-plat.c:378 xhci_generic_plat_probe() error: we previously assumed 'sysdev' could be null (see line 368)

vim +/sysdev +378 drivers/usb/host/xhci-plat.c

e60d31e628503a Arnd Bergmann             2023-01-31  355  static int xhci_generic_plat_probe(struct platform_device *pdev)
e60d31e628503a Arnd Bergmann             2023-01-31  356  {
e60d31e628503a Arnd Bergmann             2023-01-31  357  	const struct xhci_plat_priv *priv_match;
e60d31e628503a Arnd Bergmann             2023-01-31  358  	struct device *sysdev;
e60d31e628503a Arnd Bergmann             2023-01-31  359  	int ret;
e60d31e628503a Arnd Bergmann             2023-01-31  360  
e60d31e628503a Arnd Bergmann             2023-01-31  361  	/*
e60d31e628503a Arnd Bergmann             2023-01-31  362  	 * sysdev must point to a device that is known to the system firmware
e60d31e628503a Arnd Bergmann             2023-01-31  363  	 * or PCI hardware. We handle these three cases here:
e60d31e628503a Arnd Bergmann             2023-01-31  364  	 * 1. xhci_plat comes from firmware
e60d31e628503a Arnd Bergmann             2023-01-31  365  	 * 2. xhci_plat is child of a device from firmware (dwc3-plat)
e60d31e628503a Arnd Bergmann             2023-01-31  366  	 * 3. xhci_plat is grandchild of a pci device (dwc3-pci)
e60d31e628503a Arnd Bergmann             2023-01-31  367  	 */
e60d31e628503a Arnd Bergmann             2023-01-31 @368  	for (sysdev = &pdev->dev; sysdev; sysdev = sysdev->parent) {
                                                                                          ^^^^^^


e60d31e628503a Arnd Bergmann             2023-01-31  369  		if (is_of_node(sysdev->fwnode) ||
e60d31e628503a Arnd Bergmann             2023-01-31  370  			is_acpi_device_node(sysdev->fwnode))
e60d31e628503a Arnd Bergmann             2023-01-31  371  			break;
e60d31e628503a Arnd Bergmann             2023-01-31  372  #ifdef CONFIG_PCI
e60d31e628503a Arnd Bergmann             2023-01-31  373  		else if (sysdev->bus == &pci_bus_type)
e60d31e628503a Arnd Bergmann             2023-01-31  374  			break;
e60d31e628503a Arnd Bergmann             2023-01-31  375  #endif
e60d31e628503a Arnd Bergmann             2023-01-31  376  	}
e60d31e628503a Arnd Bergmann             2023-01-31  377  
e60d31e628503a Arnd Bergmann             2023-01-31 @378  	if (WARN_ON(!sysdev->dma_mask)) {
                                                                             ^^^^^^
Unchecked dereference

e60d31e628503a Arnd Bergmann             2023-01-31  379  		/* Platform did not initialize dma_mask */
e60d31e628503a Arnd Bergmann             2023-01-31  380  		ret = dma_coerce_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
e60d31e628503a Arnd Bergmann             2023-01-31  381  		if (ret)
e60d31e628503a Arnd Bergmann             2023-01-31  382  			return ret;
e60d31e628503a Arnd Bergmann             2023-01-31  383  	}
e60d31e628503a Arnd Bergmann             2023-01-31  384  
e60d31e628503a Arnd Bergmann             2023-01-31  385  	if (pdev->dev.of_node)
e60d31e628503a Arnd Bergmann             2023-01-31  386  		priv_match = of_device_get_match_data(&pdev->dev);
e60d31e628503a Arnd Bergmann             2023-01-31  387  	else
e60d31e628503a Arnd Bergmann             2023-01-31  388  		priv_match = dev_get_platdata(&pdev->dev);
e60d31e628503a Arnd Bergmann             2023-01-31  389  
e60d31e628503a Arnd Bergmann             2023-01-31  390  	return xhci_plat_probe(pdev, sysdev, priv_match);
e60d31e628503a Arnd Bergmann             2023-01-31  391  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

