Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637CDD290
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Nov 2023 06:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hsF1M3Zy"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c50305c5c4so6903301fa.1
        for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 22:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700720421; x=1701325221; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwUvpjNk0CtfVuSdyEhnK0DWsT+ztLd6kwKcaRcM+ik=;
        b=hsF1M3ZyWuZy6Mk3rBatm0+HpTLIVuF7FLVndGb6rQzePPjhVhW+WyUAvNRSuLlhi8
         OowLVKbtw0hWgJthF4xhxkmRcmjIF03WPWiK+3Xh5vlSuZsWTMcHBz5CVgFXT8Njdmgu
         7Gf4qOIFtmTY6Ly7YWWDctzj1HAYd1Pr2I6i3VqLWCWk004d0mPFRr0tEKzDeDeYsRRb
         JzuvdUjTH5WepJrQtt8s70Oo+UhueOhsaQ7bi85mlOZm/LdBEzIldQhm7Vqi2v7t58Ft
         p+n3nxYxODYIp3yg6g9xNjs5V1qTPGNkctCSlNSnQVfqGPeoNxqc49raUbNqVxunxdrs
         US5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700720421; x=1701325221;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwUvpjNk0CtfVuSdyEhnK0DWsT+ztLd6kwKcaRcM+ik=;
        b=OZHT7UpFB+QF7vFwBqP1jlbZufc7139DuL5D3mkvBplNLrCFThAcAEGp44nA+8p27D
         OBOQYgMsoDRh/E5L6hqfYRTsg1/GfRk5JObVoBan3VPxEenAXsUG77hx+NF9/4tmxLGn
         Iw90B8VmZrDHIuDz8BlAOs+jFDooTOcJ0c3mW6VjwYeam8Gj1g6Yw5eEvoX9eo+n63u2
         r3ulF01VwgAdIxkou8e63ytvLYug51LM73MOXOPfcvWdpocbPdP/X7Hb3DuVQIGwytpk
         TxeZmqgtqV/iLS+rfwmdICG9sgCkmofwihnE5KwH+6TvcK7A4MkEzCdabQn8IvwsNLP5
         u4hA==
X-Gm-Message-State: AOJu0YzQFKHmgNeZJUYT9PuK1rSViW9ysiI2eiT3punn7a/h6JfOrWIB
	1RjTSZcP6SnHr4+7z5cwOxGb4VgKL546CIxg1ykS2QiQ
X-Google-Smtp-Source: AGHT+IHnb388etFI99Sz6uHwWwc+yTRZfQ/JmHXrwIlv5eoYENzbt3NxOuNzwXotrQar5c1fFU+OqA==
X-Received: by 2002:a2e:a7d2:0:b0:2c7:b9b3:4ec1 with SMTP id x18-20020a2ea7d2000000b002c7b9b34ec1mr3757741ljp.17.1700720421125;
        Wed, 22 Nov 2023 22:20:21 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l24-20020a05600c1d1800b0040b3566e541sm1196240wms.36.2023.11.22.22.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 22:20:20 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Nov 2023 09:20:17 +0300
To: oe-kbuild@lists.linux.dev, Hector Martin <marcan@marcan.st>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 14/21]
 drivers/soc/apple/dockchannel.c:240 dockchannel_init() warn: passing zero to
 'dev_err_probe'
Message-ID: <2d91fd6c-db89-4590-ba87-5591d9efbbd9@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   16871bb3228eaf55cbdb1dfb81c1cecec4ee0d52
commit: 7c1543b965b465df17e43246abe9ef43c4bd8358 [14/21] soc: apple: Add DockChannel driver
config: mips-randconfig-r081-20231121 (https://download.01.org/0day-ci/archive/20231123/202311231037.4kh3kwIP-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231123/202311231037.4kh3kwIP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311231037.4kh3kwIP-lkp@intel.com/

New smatch warnings:
drivers/soc/apple/dockchannel.c:240 dockchannel_init() warn: passing zero to 'dev_err_probe'
drivers/soc/apple/dockchannel.c:358 dockchannel_probe() warn: passing zero to 'dev_err_probe'

Old smatch warnings:
drivers/soc/apple/dockchannel.c:246 dockchannel_init() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +240 drivers/soc/apple/dockchannel.c

7c1543b965b465 Hector Martin 2022-07-08  212  struct dockchannel *dockchannel_init(struct platform_device *pdev)
7c1543b965b465 Hector Martin 2022-07-08  213  {
7c1543b965b465 Hector Martin 2022-07-08  214  	struct device *dev = &pdev->dev;
7c1543b965b465 Hector Martin 2022-07-08  215  	struct dockchannel *dockchannel;
7c1543b965b465 Hector Martin 2022-07-08  216  	int ret;
7c1543b965b465 Hector Martin 2022-07-08  217  
7c1543b965b465 Hector Martin 2022-07-08  218  	dockchannel = devm_kzalloc(dev, sizeof(*dockchannel), GFP_KERNEL);
7c1543b965b465 Hector Martin 2022-07-08  219  	if (!dockchannel)
7c1543b965b465 Hector Martin 2022-07-08  220  		return ERR_PTR(-ENOMEM);
7c1543b965b465 Hector Martin 2022-07-08  221  
7c1543b965b465 Hector Martin 2022-07-08  222  	dockchannel->dev = dev;
7c1543b965b465 Hector Martin 2022-07-08  223  	dockchannel->config_base = devm_platform_ioremap_resource_byname(pdev, "config");
7c1543b965b465 Hector Martin 2022-07-08  224  	if (IS_ERR(dockchannel->config_base))
7c1543b965b465 Hector Martin 2022-07-08  225  		return (__force void *)dockchannel->config_base;
7c1543b965b465 Hector Martin 2022-07-08  226  
7c1543b965b465 Hector Martin 2022-07-08  227  	dockchannel->data_base = devm_platform_ioremap_resource_byname(pdev, "data");
7c1543b965b465 Hector Martin 2022-07-08  228  	if (IS_ERR(dockchannel->data_base))
7c1543b965b465 Hector Martin 2022-07-08  229  		return (__force void *)dockchannel->data_base;
7c1543b965b465 Hector Martin 2022-07-08  230  
7c1543b965b465 Hector Martin 2022-07-08  231  	ret = of_property_read_u32(dev->of_node, "apple,fifo-size", &dockchannel->fifo_size);
7c1543b965b465 Hector Martin 2022-07-08  232  	if (ret)
7c1543b965b465 Hector Martin 2022-07-08  233  		return ERR_PTR(dev_err_probe(dev, ret, "Missing apple,fifo-size property"));
7c1543b965b465 Hector Martin 2022-07-08  234  
7c1543b965b465 Hector Martin 2022-07-08  235  	init_completion(&dockchannel->tx_comp);
7c1543b965b465 Hector Martin 2022-07-08  236  	init_completion(&dockchannel->rx_comp);
7c1543b965b465 Hector Martin 2022-07-08  237  
7c1543b965b465 Hector Martin 2022-07-08  238  	dockchannel->tx_irq = platform_get_irq_byname(pdev, "tx");
7c1543b965b465 Hector Martin 2022-07-08  239  	if (dockchannel->tx_irq <= 0) {

Change this to < 0.  platform_get_irq_byname() can never return zero.

7c1543b965b465 Hector Martin 2022-07-08 @240  		return ERR_PTR(dev_err_probe(dev, dockchannel->tx_irq,
                                                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Warning.

7c1543b965b465 Hector Martin 2022-07-08  241  				     "Failed to get TX IRQ"));
7c1543b965b465 Hector Martin 2022-07-08  242  	}
7c1543b965b465 Hector Martin 2022-07-08  243  
7c1543b965b465 Hector Martin 2022-07-08  244  	dockchannel->rx_irq = platform_get_irq_byname(pdev, "rx");
7c1543b965b465 Hector Martin 2022-07-08  245  	if (dockchannel->rx_irq <= 0) {
7c1543b965b465 Hector Martin 2022-07-08  246  		return ERR_PTR(dev_err_probe(dev, dockchannel->rx_irq,
7c1543b965b465 Hector Martin 2022-07-08  247  				     "Failed to get RX IRQ"));

[ snip ]

7c1543b965b465 Hector Martin 2022-07-08  344  	dcc->irq_base = devm_platform_ioremap_resource_byname(pdev, "irq");
7c1543b965b465 Hector Martin 2022-07-08  345  	if (IS_ERR(dcc->irq_base))
7c1543b965b465 Hector Martin 2022-07-08  346  		return PTR_ERR(dcc->irq_base);
7c1543b965b465 Hector Martin 2022-07-08  347  
7c1543b965b465 Hector Martin 2022-07-08  348  	writel_relaxed(0, dcc->irq_base + IRQ_MASK);
7c1543b965b465 Hector Martin 2022-07-08  349  	writel_relaxed(~0, dcc->irq_base + IRQ_FLAG);
7c1543b965b465 Hector Martin 2022-07-08  350  
7c1543b965b465 Hector Martin 2022-07-08  351  	dcc->domain = irq_domain_add_linear(dev->of_node, DOCKCHANNEL_MAX_IRQ,
7c1543b965b465 Hector Martin 2022-07-08  352  					    &dockchannel_irq_domain_ops, dcc);
7c1543b965b465 Hector Martin 2022-07-08  353  	if (!dcc->domain)
7c1543b965b465 Hector Martin 2022-07-08  354  		return -ENOMEM;
7c1543b965b465 Hector Martin 2022-07-08  355  
7c1543b965b465 Hector Martin 2022-07-08  356  	dcc->irq = platform_get_irq(pdev, 0);
7c1543b965b465 Hector Martin 2022-07-08  357  	if (dcc->irq <= 0)
7c1543b965b465 Hector Martin 2022-07-08 @358  		return dev_err_probe(dev, dcc->irq, "Failed to get IRQ");

Same thing.  platform_get_irq() can't return zero.

Prior to 2006 these did used to return zero and unfortunately, there
are some legacy get_irq() functions which still do return zero.  I think
the trend is to slowly update them.  Read my blog for more details:
https://staticthinking.wordpress.com/2023/08/07/writing-a-check-for-zero-irq-error-codes/

7c1543b965b465 Hector Martin 2022-07-08  359  
7c1543b965b465 Hector Martin 2022-07-08  360  	irq_set_handler_data(dcc->irq, dcc);
7c1543b965b465 Hector Martin 2022-07-08  361  	irq_set_chained_handler(dcc->irq, dockchannel_irq);
7c1543b965b465 Hector Martin 2022-07-08  362  
7c1543b965b465 Hector Martin 2022-07-08  363  	for_each_child_of_node(dev->of_node, child)
7c1543b965b465 Hector Martin 2022-07-08  364  		of_platform_device_create(child, NULL, dev);
7c1543b965b465 Hector Martin 2022-07-08  365  
7c1543b965b465 Hector Martin 2022-07-08  366  	return 0;
7c1543b965b465 Hector Martin 2022-07-08  367  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

