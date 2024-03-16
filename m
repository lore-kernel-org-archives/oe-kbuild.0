Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8203FD527
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Mar 2024 08:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710578610; cv=none; b=mlLfjzbXAkP7U15oQ++P2+uEc7HAkFWBEdZednlQjjCNysx2gLa8BF3M7ecTJ57bkrwW9DOCDY4wUguhSfXHt42LraEsZCcQ2B00RbtWPx2Q1wFFS/3XF0QXHH6T4irV9gmwmGQKkovpPO4I2R9FscH0AtJFNivgScpFfKC8NlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710578610; c=relaxed/simple;
	bh=Swo95BdSmM+ueprV0W2o1AnC+3oFhUK3Wx65kfn3lsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oUa2lbhog3lUpm8iE3IiIlMMMMRIEJAHl5m0P4dTmrusHXU00w7WK2JZCj6CmQ6yaEhvCvxmMUq0qqNHSIxdCNYh5R7Gt0DvwS34FyJxEBn5i4xetf0bcN68ESzw6BjmlEe02rZEVf3uFyaZmxNNfqnqqbBrxP4zroekUudyUJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vde+h1uA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vde+h1uA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-414006a0115so14210145e9.3
        for <oe-kbuild@lists.linux.dev>; Sat, 16 Mar 2024 01:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710578606; x=1711183406; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lRuPcslgs3SLLXdKLEnMOeBT5kId8aa6+JggeysjSBU=;
        b=Vde+h1uAJJNApTebOQt46Htj55L9c+zdbvaCCAVoEhE2XH080qPFsA9vy8DPy2pMx2
         fczyWhHxXm6Zd5QIyWnKV9QGQD6uE/CMIZM8Pnv/B6oofGSq6Vc2VqgdIsB4FrNxB5jf
         2ZVVCY8RhfrmXQ5Em509u7d0uvlYCyIi6hK1afWUZTVde39Z/rXIcLhVDRMrxxTAU0my
         KtK1BzHP3soyYPPG+VKuDg7jfV2HXwWr4j9THmiMb/EI1dwz+U8VHoEj3YYA8NRlyojV
         Xcehnm59ytrnXYoh7kj9oPpPhtw2QdQnVXZbrBk+mMA2z/FAFQB/scjrL+Ro5K4HllqE
         yPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710578606; x=1711183406;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRuPcslgs3SLLXdKLEnMOeBT5kId8aa6+JggeysjSBU=;
        b=fcwusQ6MWvHswHB9YNal38Qo6tBp33SwW77PCQYDcpQcGG15HhZyM9m7cxfRbpkTjb
         iiyimzI15HwGURNtWohfj9jgNxeQgvWRRuWTHA9b41mQWJLrIYT7IU/zU6Xeu0Md+qB/
         Gz0lUH84Clfo8g1bM8Zn6wKjPUKYkpJMnQA+1mg2B6joQzxOFXZ++Jt5myB1VIXhdBhk
         H1A8PAQLi2D1Nd5tbx3zJ6JFrU2UHp3SDqcW18n/ZM+aiuSxPmjEreuqLHzCofLR9LVd
         S/OP8bIANDib9Vn/cGSirMskXF59snqgptv04fMiwb7uxOCoHZJvc4F/witzImyB/oDk
         jhiQ==
X-Gm-Message-State: AOJu0YxqA/Zue2BGUIJpuNJF4LoIKRsxQyBkvnlbOo1q/0V4DbI1Ycns
	0M5c90aJQTgup7PdHcXgJGLaLET+S3JfhN8sbo3gHZC2EBqZ16RsZkkHerOU3cN6r4ZyAsjLjDb
	r
X-Google-Smtp-Source: AGHT+IG4f7QneWj884C3atjCCfFbEx9ZdhYppQGH8pSVrsWCYNgCaJpmbUsZPt6uGennUMax14tTFg==
X-Received: by 2002:a5d:468e:0:b0:33e:8b95:b350 with SMTP id u14-20020a5d468e000000b0033e8b95b350mr1193946wrq.7.1710578606134;
        Sat, 16 Mar 2024 01:43:26 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id o9-20020adfe809000000b0033ec6ebf878sm4897747wrm.93.2024.03.16.01.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 01:43:25 -0700 (PDT)
Date: Sat, 16 Mar 2024 11:43:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Xie XiuQi <xiexiuqi@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 4556/21871]
 drivers/gpio/gpio-exar.c:152 gpio_exar_probe() warn: missing error code
 'ret'
Message-ID: <45321a17-8501-4e8f-94dc-adc2e3d4a0cb@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c0f28264ce70e762ccdf396767a85688e6ed4810
commit: 96386d11646351bda8a42bc3e2115e03b489f992 [4556/21871] gpio: exar: add a check for the return value of ida_simple_get fails
config: x86_64-randconfig-161-20240303 (https://download.01.org/0day-ci/archive/20240316/202403160655.9n8qKqP3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403160655.9n8qKqP3-lkp@intel.com/

New smatch warnings:
drivers/gpio/gpio-exar.c:152 gpio_exar_probe() warn: missing error code 'ret'

vim +/ret +152 drivers/gpio/gpio-exar.c

6596e59e63cd4c Sudip Mukherjee 2017-01-19  119  static int gpio_exar_probe(struct platform_device *pdev)
6596e59e63cd4c Sudip Mukherjee 2017-01-19  120  {
d3936d7437e388 Jan Kiszka      2017-06-09  121  	struct pci_dev *pcidev = to_pci_dev(pdev->dev.parent);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  122  	struct exar_gpio_chip *exar_gpio;
380b1e2f3a2f32 Jan Kiszka      2017-05-22  123  	u32 first_pin, ngpios;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  124  	void __iomem *p;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  125  	int index, ret;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  126  
6596e59e63cd4c Sudip Mukherjee 2017-01-19  127  	/*
8847f5f9ef5542 Jan Kiszka      2017-05-02  128  	 * The UART driver must have mapped region 0 prior to registering this
8847f5f9ef5542 Jan Kiszka      2017-05-02  129  	 * device - use it.
6596e59e63cd4c Sudip Mukherjee 2017-01-19  130  	 */
8847f5f9ef5542 Jan Kiszka      2017-05-02  131  	p = pcim_iomap_table(pcidev)[0];
6596e59e63cd4c Sudip Mukherjee 2017-01-19  132  	if (!p)
6596e59e63cd4c Sudip Mukherjee 2017-01-19  133  		return -ENOMEM;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  134  
a589e211bd7471 Jan Kiszka      2017-07-19  135  	ret = device_property_read_u32(&pdev->dev, "exar,first-pin",
380b1e2f3a2f32 Jan Kiszka      2017-05-22  136  				       &first_pin);
380b1e2f3a2f32 Jan Kiszka      2017-05-22  137  	if (ret)
380b1e2f3a2f32 Jan Kiszka      2017-05-22  138  		return ret;
380b1e2f3a2f32 Jan Kiszka      2017-05-22  139  
380b1e2f3a2f32 Jan Kiszka      2017-05-22  140  	ret = device_property_read_u32(&pdev->dev, "ngpios", &ngpios);
380b1e2f3a2f32 Jan Kiszka      2017-05-22  141  	if (ret)
380b1e2f3a2f32 Jan Kiszka      2017-05-22  142  		return ret;
380b1e2f3a2f32 Jan Kiszka      2017-05-22  143  
5dab5872e59390 Jan Kiszka      2017-06-09  144  	exar_gpio = devm_kzalloc(&pdev->dev, sizeof(*exar_gpio), GFP_KERNEL);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  145  	if (!exar_gpio)
6596e59e63cd4c Sudip Mukherjee 2017-01-19  146  		return -ENOMEM;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  147  
6596e59e63cd4c Sudip Mukherjee 2017-01-19  148  	mutex_init(&exar_gpio->lock);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  149  
6596e59e63cd4c Sudip Mukherjee 2017-01-19  150  	index = ida_simple_get(&ida_index, 0, 0, GFP_KERNEL);
96386d11646351 Kangjie Lu      2019-03-08  151  	if (index < 0)
96386d11646351 Kangjie Lu      2019-03-08 @152  		goto err_destroy;

Missing error code on this path.

6596e59e63cd4c Sudip Mukherjee 2017-01-19  153  
6596e59e63cd4c Sudip Mukherjee 2017-01-19  154  	sprintf(exar_gpio->name, "exar_gpio%d", index);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  155  	exar_gpio->gpio_chip.label = exar_gpio->name;
4076cf08ac7673 Jan Kiszka      2017-05-21  156  	exar_gpio->gpio_chip.parent = &pdev->dev;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  157  	exar_gpio->gpio_chip.direction_output = exar_direction_output;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  158  	exar_gpio->gpio_chip.direction_input = exar_direction_input;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  159  	exar_gpio->gpio_chip.get_direction = exar_get_direction;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  160  	exar_gpio->gpio_chip.get = exar_get_value;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  161  	exar_gpio->gpio_chip.set = exar_set_value;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  162  	exar_gpio->gpio_chip.base = -1;
380b1e2f3a2f32 Jan Kiszka      2017-05-22  163  	exar_gpio->gpio_chip.ngpio = ngpios;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  164  	exar_gpio->regs = p;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  165  	exar_gpio->index = index;
380b1e2f3a2f32 Jan Kiszka      2017-05-22  166  	exar_gpio->first_pin = first_pin;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  167  
5dab5872e59390 Jan Kiszka      2017-06-09  168  	ret = devm_gpiochip_add_data(&pdev->dev,
6596e59e63cd4c Sudip Mukherjee 2017-01-19  169  				     &exar_gpio->gpio_chip, exar_gpio);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  170  	if (ret)
6596e59e63cd4c Sudip Mukherjee 2017-01-19  171  		goto err_destroy;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  172  
6596e59e63cd4c Sudip Mukherjee 2017-01-19  173  	platform_set_drvdata(pdev, exar_gpio);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  174  
6596e59e63cd4c Sudip Mukherjee 2017-01-19  175  	return 0;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  176  
6596e59e63cd4c Sudip Mukherjee 2017-01-19  177  err_destroy:
6596e59e63cd4c Sudip Mukherjee 2017-01-19  178  	ida_simple_remove(&ida_index, index);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  179  	mutex_destroy(&exar_gpio->lock);
6596e59e63cd4c Sudip Mukherjee 2017-01-19  180  	return ret;
6596e59e63cd4c Sudip Mukherjee 2017-01-19  181  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

