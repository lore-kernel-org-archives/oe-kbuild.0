Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB921EE013
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730976075; cv=none; b=ptlIvSRoIBBPlxEvqhKyYweIoUh2sbOACSHyiB02yxf4lG2R3oZ29W8YnqrfkdpIzMoPbedR32JTlCaU0Bc62xgjW0riO8YoUZjPs5/CG2pd48lRV/a4u3KUeKErWbGDCV02USTDwwHgUwuzZEeZhsHh9mWfu8x2SOhGazaPSaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730976075; c=relaxed/simple;
	bh=UgxzgboixJXkLqu4ab/Xwin6DeKSgOjjCmZmKv+QIsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XGNGllsVTMj2cbsuXcwICEEM1oj6BR9u3vkkGODTHiXWODEI4cS1PRJ7QpGIq/wxWRGj9iNAoPMxNQVUuBh7UEd1EaCEDJNQsAxetXuHNiGLglMKcUIgHMihJs0Rv09YoMzGTwjBV5dAZPNtrQylrpaFPViryPSdZ2Koc++ZSWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aep81L6D; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aep81L6D"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d49a7207cso560432f8f.0
        for <oe-kbuild@lists.linux.dev>; Thu, 07 Nov 2024 02:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730976072; x=1731580872; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2MdfhOwFUJAJ1Av4wwaUm3cyPxx43+agM3C6R5cAYgk=;
        b=aep81L6DULpPCDFrcRjibm9HCFtzphETJpwV5gm8hQbyJ6FwYljEAab3cVgoO+yPAV
         OnRUbmzhbo3VAQnBcYgOe/OcOuwtqwyxdbI+bPxz9knkUAQYovAHgdLjHY1V97JAEMow
         PHXy5xB/Kqt43W1ij2JtRv+JylyHcD0pcnFg8iTiU44ZN+8tTVTWhqGyU4lgKo1wadK3
         4JV7sLlSxm2WOM2gjsMUCv4GtCWDrEWr5CtQxZWeLKFJyfbuHEpIjIC9WNojk3kbdwyd
         MdsT8HOcVnzq5PgBi6x7cvVAZBCcAfEbe7CnCNtf8xg21xJZal2q1D5tWQjngUJNLje8
         cH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730976072; x=1731580872;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2MdfhOwFUJAJ1Av4wwaUm3cyPxx43+agM3C6R5cAYgk=;
        b=UpM+I6IMfhmFr1qkeOEL9Jy8rwcNJictLWHmtxXUdXuzTBKxSmUeniA55ztYdQ+HJg
         syAN+9Wi9IGIiu2O2/4YVwteeC7DFLjWm9m54fHZhgc3RgiA0wJqq4+grcsQpzGEDAfQ
         g97MrG0Hl63S/rwGhJehOJR+Y94CPa2nVOVzar9Qa2kH1rW/PVMj4x84nr+al4CSuv/r
         yCG3VyfTHtOruMnjZUDrvFGCgjS2saWXOmePUsQPiX0abyk70eHTy6q4aCpVb5Q9ejK1
         Lk8BbkSGc2D89E53BNfLZz+XCActQQRX4vU73zUcU5DbWH2adkE3zOXMR+uNdVixpSOZ
         ItGg==
X-Gm-Message-State: AOJu0YyjOpyluGx7EbJserhlPeWDW8+3MjPgSviNfE8it5IGW+dX+1MM
	aefEO+WNan0a6Day0tiEIIldhQnnlYRo7fDG+7d46VBcosSNeq2BN7M8H8Tgb261S1pGeVkj2vv
	E+k8=
X-Google-Smtp-Source: AGHT+IFZXF0V7WMeT06AXGALya9Po/A8KoC4gBeGyesJhlw47SBizAJBs+Ut/IQSXftc+RbTl8duIQ==
X-Received: by 2002:a05:6000:188b:b0:37d:4c8f:2e1 with SMTP id ffacd0b85a97d-381c7a4c76amr14933208f8f.22.1730976071959;
        Thu, 07 Nov 2024 02:41:11 -0800 (PST)
Received: from localhost ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6b35c0sm57687635e9.16.2024.11.07.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 02:41:11 -0800 (PST)
Date: Thu, 7 Nov 2024 13:41:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	He Yujie <coka.heyujie@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29907/30000] drivers/gpio/gpiolib.c:797
 gpiochip_add_data_with_key() error: dereferencing freed memory 'gdev'
Message-ID: <8c7d9ca9-4f0e-4de3-972c-8701ea48c127@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a234e03166aac46cb089a13cbee4826541b66684
commit: aa1e2bfdc899e89efc51fb9364fc0e8227db24b1 [29907/30000] gpiolib: fix memory leak in gpiochip_setup_dev()
config: x86_64-randconfig-161-20241106 (https://download.01.org/0day-ci/archive/20241107/202411071403.YmYOl1z1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411071403.YmYOl1z1-lkp@intel.com/

New smatch warnings:
drivers/gpio/gpiolib.c:797 gpiochip_add_data_with_key() error: dereferencing freed memory 'gdev'

vim +/gdev +797 drivers/gpio/gpiolib.c

59f3cd92f17c6 Guenter Roeck       2016-03-31  757  	if (gpiolib_initialized) {
d377f56f34f5bc Linus Walleij       2019-07-16  758  		ret = gpiochip_setup_dev(gdev);
d377f56f34f5bc Linus Walleij       2019-07-16  759  		if (ret)
48057ed1840fde Linus Walleij       2019-08-20  760  			goto err_remove_irqchip;
159f3cd92f17c6 Guenter Roeck       2016-03-31  761  	}
cedb1881ba32f7 Anton Vorontsov     2010-06-08  762  	return 0;
3bae4811fb6d0b Zhangfei Gao        2013-06-09  763  
48057ed1840fde Linus Walleij       2019-08-20  764  err_remove_irqchip:
a0b66a73785ccc Linus Walleij       2020-03-29  765  	gpiochip_irqchip_remove(gc);
48057ed1840fde Linus Walleij       2019-08-20  766  err_remove_irqchip_mask:
a0b66a73785ccc Linus Walleij       2020-03-29  767  	gpiochip_irqchip_free_valid_mask(gc);
81a271c12c6d58 Bartosz Golaszewski 2024-02-29  768  err_free_hogs:
81a271c12c6d58 Bartosz Golaszewski 2024-02-29  769  	gpiochip_free_hogs(gc);
a0b66a73785ccc Linus Walleij       2020-03-29  770  	acpi_gpiochip_remove(gc);
d66cff1dd8b0ca Andy Shevchenko     2024-02-21  771  	gpiochip_remove_pin_ranges(gc);
357798909164bf Geert Uytterhoeven  2019-04-24  772  err_remove_of_chip:
a0b66a73785ccc Linus Walleij       2020-03-29  773  	of_gpiochip_remove(gc);
357798909164bf Geert Uytterhoeven  2019-04-24  774  err_free_gpiochip_mask:
a0b66a73785ccc Linus Walleij       2020-03-29  775  	gpiochip_free_valid_mask(gc);
aa1e2bfdc899e8 Zeng Heng           2024-11-03  776  	if (gdev->dev.release) {
aa1e2bfdc899e8 Zeng Heng           2024-11-03  777  		/* release() has been registered by gpiochip_setup_dev() */
aa1e2bfdc899e8 Zeng Heng           2024-11-03  778  		put_device(&gdev->dev);
aa1e2bfdc899e8 Zeng Heng           2024-11-03  779  		goto err_print_message;
aa1e2bfdc899e8 Zeng Heng           2024-11-03  780  	}
5f3ca7329b049b Markus Pargmann     2015-08-14  781  err_remove_from_list:
225fce83cb72e1 Johan Hovold        2015-01-12  782  	spin_lock_irqsave(&gpio_lock, flags);
ff2b1359229927 Linus Walleij       2015-10-20  783  	list_del(&gdev->list);
3bae4811fb6d0b Zhangfei Gao        2013-06-09  784  	spin_unlock_irqrestore(&gpio_lock, flags);
476e2fc5cd430b Guenter Roeck       2016-03-31  785  err_free_label:
fcf273e5807976 Bartosz Golaszewski 2017-12-14  786  	kfree_const(gdev->label);
476e2fc5cd430b Guenter Roeck       2016-03-31  787  err_free_descs:
476e2fc5cd430b Guenter Roeck       2016-03-31  788  	kfree(gdev->descs);
0dc6680f9a5932 Quanyang Wang       2021-02-19  789  err_free_dev_name:
0dc6680f9a5932 Quanyang Wang       2021-02-19  790  	kfree(dev_name(&gdev->dev));
a05a1404999959 Vladimir Zapolskiy  2018-11-02  791  err_free_ida:
8d4a85b6abd3cd Bartosz Golaszewski 2020-09-08  792  	ida_free(&gpio_ida, gdev->id);
a05a1404999959 Vladimir Zapolskiy  2018-11-02  793  err_free_gdev:
aa1e2bfdc899e8 Zeng Heng           2024-11-03  794  	kfree(gdev);
                                                              ^^^^
Freed

aa1e2bfdc899e8 Zeng Heng           2024-11-03  795  err_print_message:
d2876d08d86f22 David Brownell      2008-02-04  796  	/* failures here can mean systems won't boot... */
1777fc97302997 Marcel Ziswiler     2018-07-20 @797  	pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
aa1e2bfdc899e8 Zeng Heng           2024-11-03  798  	       base, base + gdev->ngpio - 1,
                                                                            ^^^^^^^^^^^
Use after free

a0b66a73785ccc Linus Walleij       2020-03-29  799  	       gc->label ? : "generic", ret);
d377f56f34f5bc Linus Walleij       2019-07-16  800  	return ret;
d2876d08d86f22 David Brownell      2008-02-04  801  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

