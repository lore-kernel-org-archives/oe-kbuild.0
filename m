Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A31F1D1E74
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 07:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495377; cv=none; b=cyv8YXLWGj+mE8VhQ1E02956RwfKzKXNXx4eb9HayQiVz7enWqoYPCh+eG2ceeuinfdeOFzjgBG09e4dA1+mPVv4BWqBsHdnLpSMKCL9Qgrz8YPca+KTgqArVxoPpwyfec6ZUFzaHwmphHWqdL0RuII1gsIHUI9AG4cKLqKtTE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495377; c=relaxed/simple;
	bh=akqdO3psSSDcqPoPmRfhBaq7KYA8OuLkph2vgmsZ1Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ksTI09kmfBTYPsPOAVMKugXfB0KRPjEnM2xDqWh3445GE36RUtXFplLkEaTlW9ijszHuHTO4bvJ5Y8KwVPJInS+ngxCSzQXll231nMQ15+gkiKFeua+iMmzraNXchXs/ndBHyeGB95h9Nt7k7JBLOCaMUmd5pxvM0AHet6D1AAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hj0D2yPx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hj0D2yPx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so10680665e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 00:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729495373; x=1730100173; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3hGXgeNMIw4U0yQPd3D3dKiR4l6lD9w9YryhZf6FB70=;
        b=Hj0D2yPx6dhFQr2JeA+SnkjyKRAyx22BLP6wMxfUeBK9EpqtIrVH9t3Jf4K8wiW1wK
         KHXm9XXWyrDcuzhQ7GanVKVc66rBmXuVaW9EP6oj6zoDbXacYDe5R1/bznamWLN0ISnL
         SErjr6x6cYZaG+ZfOWIuIOh50YUyM9oOEgqqSZ+ee3HLOsjzdr49aNSdmWTK4iB4KZ0J
         8/98TcGcbzePN6Sd7j5O3w4yu3LLDawJAeaGKqjUVdodSyQGlty6s//5N6wrtMTaK5p3
         k0VaRzzhC5xqaCbkZNJYJ3XcExdWHmJlHXGeegRA0/FHKPZ4p7BvIp7iBb2s68/0YlNW
         BvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495373; x=1730100173;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hGXgeNMIw4U0yQPd3D3dKiR4l6lD9w9YryhZf6FB70=;
        b=JbjxDL1RlO9AWpOdRvgdS/uymuKWCu6uRYtHEHgAcOaLaavWdRseooylwUhDUkYeCt
         LmKe6rgTFitEW0zQg2NZmAn9EJfhmqF0sIENgnOlOnrLIWlfbDqJC0KsqWFh6M21qN24
         TmZf/1Dvmd8OZv82guk2KQyfJmFlv+xM/hKBBNw8OQmLOEX5wQ4QmknU7YjV/0diLbCq
         uxfOuk8h5Dxvi/lh6s2/+RsXZM3eZBHjetflTHkTCcPQVqvFvnBkJBmE8qzMEop+JQz6
         jQyakJi2Wmn8088a1tlCeoMPCRxh7vCmD8vR0vKIWHaEex9rIFdiexEmUT8OjJ9x6GDH
         Tq1Q==
X-Gm-Message-State: AOJu0YzZz1J7UsSvERdmW5XATI8htJKp85r9z6ZmJ4gr1aI7lXzABmvD
	2MwWGIUe5jX8hYkILlJgd2otj2BEuHzbnYQMvkMfFmk6mCGdRuhDs+/wjHS6ojViCU02OE9eree
	l
X-Google-Smtp-Source: AGHT+IHZljiICRUhyxDdbtD4WYuUm0mjjSTqWVUHER2Y2hZLhu0VdV7MjcSaGSeKiI81kTq5jO6bgg==
X-Received: by 2002:a05:600c:4f09:b0:431:2460:5574 with SMTP id 5b1f17b1804b1-4316168f23amr72052835e9.27.1729495373102;
        Mon, 21 Oct 2024 00:22:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57fa35sm46098105e9.19.2024.10.21.00.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:22:52 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:22:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Troy Mitchell <troymitchell988@gmail.com>,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, troymitchell988@gmail.com,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <1e65dbe7-0269-4c96-99be-c4eb224a5a9f@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015075134.1449458-3-TroyMitchell988@gmail.com>

Hi Troy,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Troy-Mitchell/dt-bindings-i2c-spacemit-add-support-for-K1-SoC/20241015-155402
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20241015075134.1449458-3-TroyMitchell988%40gmail.com
patch subject: [PATCH v1 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
config: alpha-randconfig-r071-20241019 (https://download.01.org/0day-ci/archive/20241019/202410191416.NyqQCvE3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410191416.NyqQCvE3-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-k1.c:621 spacemit_i2c_probe() warn: passing zero to 'PTR_ERR'
drivers/i2c/busses/i2c-k1.c:622 spacemit_i2c_probe() warn: passing zero to 'dev_err_probe'

vim +/PTR_ERR +621 drivers/i2c/busses/i2c-k1.c

aede17b17b7dfb Troy Mitchell 2024-10-15  604  static int spacemit_i2c_probe(struct platform_device *pdev)
aede17b17b7dfb Troy Mitchell 2024-10-15  605  {
aede17b17b7dfb Troy Mitchell 2024-10-15  606  	struct spacemit_i2c_dev *i2c;
aede17b17b7dfb Troy Mitchell 2024-10-15  607  	struct device_node *of_node = pdev->dev.of_node;
aede17b17b7dfb Troy Mitchell 2024-10-15  608  	struct clk *clk;
aede17b17b7dfb Troy Mitchell 2024-10-15  609  	int ret = 0;
aede17b17b7dfb Troy Mitchell 2024-10-15  610  
aede17b17b7dfb Troy Mitchell 2024-10-15  611  	i2c = devm_kzalloc(&pdev->dev,
aede17b17b7dfb Troy Mitchell 2024-10-15  612  			   sizeof(struct spacemit_i2c_dev),
aede17b17b7dfb Troy Mitchell 2024-10-15  613  			   GFP_KERNEL);
aede17b17b7dfb Troy Mitchell 2024-10-15  614  	if (!i2c)
aede17b17b7dfb Troy Mitchell 2024-10-15  615  		return -ENOMEM;
aede17b17b7dfb Troy Mitchell 2024-10-15  616  
aede17b17b7dfb Troy Mitchell 2024-10-15  617  	i2c->dev = &pdev->dev;
aede17b17b7dfb Troy Mitchell 2024-10-15  618  
aede17b17b7dfb Troy Mitchell 2024-10-15  619  	i2c->base = devm_platform_ioremap_resource(pdev, 0);
aede17b17b7dfb Troy Mitchell 2024-10-15  620  	if (!i2c->base) {

This should be if (IS_ERR(i2c->base)) {

aede17b17b7dfb Troy Mitchell 2024-10-15 @621  		ret = PTR_ERR(i2c->base);
aede17b17b7dfb Troy Mitchell 2024-10-15 @622  		return dev_err_probe(&pdev->dev, ret, "failed to do ioremap");
aede17b17b7dfb Troy Mitchell 2024-10-15  623  	}
aede17b17b7dfb Troy Mitchell 2024-10-15  624  
aede17b17b7dfb Troy Mitchell 2024-10-15  625  	i2c->irq = platform_get_irq(pdev, 0);
aede17b17b7dfb Troy Mitchell 2024-10-15  626  	if (i2c->irq < 0) {
aede17b17b7dfb Troy Mitchell 2024-10-15  627  		ret = i2c->irq;
aede17b17b7dfb Troy Mitchell 2024-10-15  628  		return dev_err_probe(&pdev->dev, ret, "failed to get irq resource");
aede17b17b7dfb Troy Mitchell 2024-10-15  629  	}
aede17b17b7dfb Troy Mitchell 2024-10-15  630  
aede17b17b7dfb Troy Mitchell 2024-10-15  631  	ret = devm_request_irq(i2c->dev, i2c->irq,
aede17b17b7dfb Troy Mitchell 2024-10-15  632  			       spacemit_i2c_irq_handler,
aede17b17b7dfb Troy Mitchell 2024-10-15  633  			       IRQF_NO_SUSPEND | IRQF_ONESHOT,
aede17b17b7dfb Troy Mitchell 2024-10-15  634  			       dev_name(i2c->dev), i2c);
aede17b17b7dfb Troy Mitchell 2024-10-15  635  
aede17b17b7dfb Troy Mitchell 2024-10-15  636  	if (ret)
aede17b17b7dfb Troy Mitchell 2024-10-15  637  		return dev_err_probe(&pdev->dev, ret, "failed to request irq");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

