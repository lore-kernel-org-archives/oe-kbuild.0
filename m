Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B3C2032D
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406368; cv=none; b=hzK5qu3lb5NB+FrG2v1NWmcRHGM5qxE91KCQNZ8DVxuiHdQ5lMqei5SBqi5qM8SC18RR10q7sErO4OGxfUmb9/tu3lWdVWfZTSnDL5ZnGl1iv7X4cJwCSYVS1YdE/YwCvLDUqWtom1j7BFzDN0+3TXDV8BDjNk0zHqQnzmswGP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406368; c=relaxed/simple;
	bh=+CceKN2ws699t1ZqBDz15SYsl3cTGb/4vajhuz1N8Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KUe7La/InJZzPj02LnHAGUBpxexpOpYBwpynLQ5HyBVGmwSS9DmfV91LgnjA1Z//QkE3sUytBckwmYACdovlBg0cwmigHgrHNeuzPyLtY/IoIIzZ0q1OciElPfm4nO6NoiQnIAQQuJg41I3+PNWrKDd7clqsAcR/3l6/8nkZmmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtjYDGXD; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtjYDGXD"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8b7f937ef44so19111916d6.0
        for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 02:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406365; x=1779011165; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9KAbR7vsIAj8ZBEhNBPo3PYKLN4kzerKm2zqXV0BBMw=;
        b=OtjYDGXDMEssr1prL/7Lf7eAl73MVX7qjiiTwHfqVDgsB6bvgR7gur7K3H2+ApZH6D
         VDX38uI8FywTrRviA+7xacfGTyX27peB70s+pG13498tC34eNxtqoCp0iEXwZs129JBm
         Q38SU0reaEy97YUsx3rNs0MswfrTyetQuYtTjUwopR0tZ1tc17nVb3rTO7yVq2qWG69j
         76QvzkKmwoHhT/BaHlhD73GUkN6BeGdB+AlTCgJS2ZLxmrGnTBfcXMw7x9UnVrECQo36
         /BYSCok9dkj4+ABLuCPblhCVd/umr2zTRmu67cKocfcWJCH2whVTugYV8AMBmOvFhx2A
         xD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406365; x=1779011165;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KAbR7vsIAj8ZBEhNBPo3PYKLN4kzerKm2zqXV0BBMw=;
        b=IamGDjLAwBIuBLUmH/8Pa7nyFhCsVHlnAUJhXguc9xPnRfWNmlUeaCrSYQLuFHhy0c
         oA8gzS4haBNI7WFul/LkbCvEI8jKT54VHPhM6/ydQPpOdcpJnZSQIYGOdkJuf3EJRF/d
         v8P2f0zHvVp+YLevntwqijoBmLe/gh6nt5sYDeEAOduamaZc5WBXhL08wDB4osbhLUam
         uQc6pvb+Z52BdDMdk0eGpmCOWOdMlQkWiC/mRDlG7F8E+/ojdU+oiOqCgTOWJ/MEMn8H
         7tqiuTYnIhso5j/Hn0qMkjs7Wogier2sOaCdVpsMV/xc5GwV9i2XtVOGkp3azLVtqW64
         zDMQ==
X-Gm-Message-State: AOJu0Yyp+VvLwIZIsS29lYhKOQyZ9B1hGq9fcz+ScYkZTehx/TFufzLH
	O4gaLVxoSD0KVEcvnWJAKNnYWXOrJwOH7Iy68xN+jZZTl5g5gAS1nDtXyvskDUr0
X-Gm-Gg: Acq92OFldvI2bUZmbEinGXKnNRjCHM+IlmEMCvkWWIQTI5gpL5uTpKojyLCw0/zbQcN
	jf/LjC0Rn9DarfPzY8Xq8XmdgKy1Cnd+Q+5O/hMZGPQ/2A391DfrGcOh2bugAG962/OLxJJKNPC
	Sfx51mCZkIWIm6l8vwQo4fEKXsSd0f4+y8TA7VTyu4jhKlQltWwZfi0rdtuH9BK+O2/pvDFz6N8
	3uiGcZbz570AFWfNEiJsOolbxJjd2u2BULNUT9/lYFm7YmzTwQsufmsnvwWkWihlGbmRxMwYauo
	/pOwg+HcZ1p7fAjW1qwro0POJp/F5JoQqFAvKuJ+vY0m2+BcTkg3iPcOPIOZNAtH9y3dnAnds8G
	HNbL64cIwTO1BP+Wr4vlEhl0YKia7w4CMWDvH4tJcFpn/7B/CWT7ZjoZxReUt/EvULZvNP4ruQE
	KLji3tgkCz6kTJyw897w==
X-Received: by 2002:a05:6214:3f8f:b0:8a0:4e92:c45f with SMTP id 6a1803df08f44-8bc42b685eamr311568426d6.11.1778406365173;
        Sun, 10 May 2026 02:46:05 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d0702aasm299973856d6.43.2026.05.10.02.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:46:04 -0700 (PDT)
Date: Sun, 10 May 2026 12:45:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Hector Martin <marcan@marcan.st>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/090-spi-hid 17/19]
 drivers/soc/apple/dockchannel.c:241 dockchannel_init() warn: passing zero to
 'dev_err_probe'
Message-ID: <202605101332.SfUuii8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260510094558.rW2pRX_66m8VKxWE-PUSI2f0s5wt5yrMf98VU-HjGrc@z>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   7b3c6e8461f3035d025ece758919facbc1c6d854
commit: 9ac13ff0fc75010681a6ea5fd694db592dea9069 [17/19] soc: apple: Add DockChannel driver
config: um-randconfig-r072-20260509 (https://download.01.org/0day-ci/archive/20260510/202605101332.SfUuii8x-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605101332.SfUuii8x-lkp@intel.com/

New smatch warnings:
drivers/soc/apple/dockchannel.c:241 dockchannel_init() warn: passing zero to 'dev_err_probe'
drivers/soc/apple/dockchannel.c:358 dockchannel_probe() warn: passing zero to 'dev_err_probe'

Old smatch warnings:
drivers/soc/apple/dockchannel.c:247 dockchannel_init() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +241 drivers/soc/apple/dockchannel.c

9ac13ff0fc7501 Hector Martin 2022-07-08  213  struct dockchannel *dockchannel_init(struct platform_device *pdev)
9ac13ff0fc7501 Hector Martin 2022-07-08  214  {
9ac13ff0fc7501 Hector Martin 2022-07-08  215  	struct device *dev = &pdev->dev;
9ac13ff0fc7501 Hector Martin 2022-07-08  216  	struct dockchannel *dockchannel;
9ac13ff0fc7501 Hector Martin 2022-07-08  217  	int ret;
9ac13ff0fc7501 Hector Martin 2022-07-08  218  
9ac13ff0fc7501 Hector Martin 2022-07-08  219  	dockchannel = devm_kzalloc(dev, sizeof(*dockchannel), GFP_KERNEL);
9ac13ff0fc7501 Hector Martin 2022-07-08  220  	if (!dockchannel)
9ac13ff0fc7501 Hector Martin 2022-07-08  221  		return ERR_PTR(-ENOMEM);
9ac13ff0fc7501 Hector Martin 2022-07-08  222  
9ac13ff0fc7501 Hector Martin 2022-07-08  223  	dockchannel->dev = dev;
9ac13ff0fc7501 Hector Martin 2022-07-08  224  	dockchannel->config_base = devm_platform_ioremap_resource_byname(pdev, "config");
9ac13ff0fc7501 Hector Martin 2022-07-08  225  	if (IS_ERR(dockchannel->config_base))
9ac13ff0fc7501 Hector Martin 2022-07-08  226  		return (__force void *)dockchannel->config_base;
9ac13ff0fc7501 Hector Martin 2022-07-08  227  
9ac13ff0fc7501 Hector Martin 2022-07-08  228  	dockchannel->data_base = devm_platform_ioremap_resource_byname(pdev, "data");
9ac13ff0fc7501 Hector Martin 2022-07-08  229  	if (IS_ERR(dockchannel->data_base))
9ac13ff0fc7501 Hector Martin 2022-07-08  230  		return (__force void *)dockchannel->data_base;
9ac13ff0fc7501 Hector Martin 2022-07-08  231  
9ac13ff0fc7501 Hector Martin 2022-07-08  232  	ret = of_property_read_u32(dev->of_node, "apple,fifo-size", &dockchannel->fifo_size);
9ac13ff0fc7501 Hector Martin 2022-07-08  233  	if (ret)
9ac13ff0fc7501 Hector Martin 2022-07-08  234  		return ERR_PTR(dev_err_probe(dev, ret, "Missing apple,fifo-size property"));
9ac13ff0fc7501 Hector Martin 2022-07-08  235  
9ac13ff0fc7501 Hector Martin 2022-07-08  236  	init_completion(&dockchannel->tx_comp);
9ac13ff0fc7501 Hector Martin 2022-07-08  237  	init_completion(&dockchannel->rx_comp);
9ac13ff0fc7501 Hector Martin 2022-07-08  238  
9ac13ff0fc7501 Hector Martin 2022-07-08  239  	dockchannel->tx_irq = platform_get_irq_byname(pdev, "tx");
9ac13ff0fc7501 Hector Martin 2022-07-08  240  	if (dockchannel->tx_irq <= 0) {
                                                    ^^^^^^^^^^^^^^^^^^^^^^^^
This should be < 0 since platform_get_irq_byname() can't return zero.

9ac13ff0fc7501 Hector Martin 2022-07-08 @241  		return ERR_PTR(dev_err_probe(dev, dockchannel->tx_irq,
9ac13ff0fc7501 Hector Martin 2022-07-08  242  				     "Failed to get TX IRQ"));

Otherwise we'd have to set a correct error code.

9ac13ff0fc7501 Hector Martin 2022-07-08  243  	}
9ac13ff0fc7501 Hector Martin 2022-07-08  244  
9ac13ff0fc7501 Hector Martin 2022-07-08  245  	dockchannel->rx_irq = platform_get_irq_byname(pdev, "rx");
9ac13ff0fc7501 Hector Martin 2022-07-08  246  	if (dockchannel->rx_irq <= 0) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

