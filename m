Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3FE1EB2F
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Apr 2024 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713263445; cv=none; b=VpTR98pAGqUsHjUjcSrXEwwfXoT47NUUZdsH0IK+5hV2BpzgXLAT/e+zAqh2DRvSJGYw9cf6F3HQEO0XPN1DLU703t1PAItjapLYx2kgjqFbKtAHTeAGPyMwQ/ctUyXgTJ8/ygjzoxLTioFurxgJj3NbV+iy/udTIfgFwT0M5aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713263445; c=relaxed/simple;
	bh=Hb4VWuHviVkqjpu2tqxwnE0CvNHLHeTChBD5KU2ZsoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uOpCbsgGTrpXh+26XN6ngDTj9njY4JejXNrcVevwtuT+XkJ7qN9MAQbrjPoBIEMLwGMJ5Cmd4VFOdLDzCjNB28D56nyTM363FTpInvS3xCqCoFLjuCEOj3MU4IZuqeqoo7NKPfU+Bjp/G3gG59Aixtm6QEwsNQQLFHlx5x09NbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=arWEPMr2; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="arWEPMr2"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a526a200879so269697066b.1
        for <oe-kbuild@lists.linux.dev>; Tue, 16 Apr 2024 03:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713263441; x=1713868241; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OpUv8OKDMoCTJbGOeQ/kgwQ8pTbKhM6e7RKVIafCooI=;
        b=arWEPMr2XDd2NcYPkusYIhJ+7mNMPP3kRljXwru6+b/QdDDi/a5DXmeakRr/Vm58NI
         NmNLMrcA4pTvDNta14Lgjd+e99i3Qid6QosRD7avbsi9/MyhkkgopWSPqmDDwnGYc8ly
         msMkTVwPx7eyo7P9x+Bf1gHF1A7HZWU4jn4qfY/4blPrst9MBy9O9sCSBpgEdK+DzhmF
         /ICaoVjrIoigQVIbtgOcjccTHU7Dn91FGd99r1qD37Sao3qfpS1n9rh91RxXXIaNuqBc
         j01Mrfnish69uMR2DCRU6+chs9ETljr/CLMH/FZ3zZ6KC2RZg4AEvav/Fm2fTRZRBuH0
         rp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713263441; x=1713868241;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OpUv8OKDMoCTJbGOeQ/kgwQ8pTbKhM6e7RKVIafCooI=;
        b=EYLuQfiuI1M2gAIG8pxC+v9ysfHVr7WktM0JkwWo3Ixlg/ALPNt7qeLqLa61AhzIo1
         5SaB7mxYN/JKXHPaqu1vDigexT9e3sB7/BfEjbpwqQuVUpGbotmbeKxDUwI3qvPUJJdm
         IUQl4zrc0pQRjcC772N0TGF0M1rxHW1dSa7gReTC1ulOkrjy0EXqPoxSbSqWPp/PYHem
         1AgwS0GOqSw+JCab0QbaVTEwe6S6K/WN3PNq+ki7oETwkjwrToTbRyNsi7M8OvCFlHop
         vnXVyxIMtjoxlM0keVX0JcZsgWyQ0fuI9/89YYhEKaAfXH+UuHdxNXa2vcDgPM2DcRnT
         ausA==
X-Gm-Message-State: AOJu0Yz4x1p0yhMo/Cgp0ToG6ebLmTTXUYaWAE7CW1Xtx8FuxGbSVeL1
	LcoXE6D8/fdqAaEq7joPIhC5v1akffeSxd9MH5BwVDOqvrT88t1XcfqK1HT0/qJ6R7J8tHzGRRN
	j
X-Google-Smtp-Source: AGHT+IHwE8eVjAv/wY0YEU/3Y29Ot/WeEq9zUw451nPyDOXitvz8i2SUYtyGocvpNr3+FM7DTXN4ig==
X-Received: by 2002:a17:906:6b8f:b0:a52:54be:dd8a with SMTP id l15-20020a1709066b8f00b00a5254bedd8amr4331396ejr.15.1713263441187;
        Tue, 16 Apr 2024 03:30:41 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bm23-20020a170906c05700b00a52331dc082sm5720006ejb.11.2024.04.16.03.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 03:30:40 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:30:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Brian Kim <brian.kim@hardkernel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>, memeka <mihailescu2m@gmail.com>,
	Yang Deokgyu <secugyu@gmail.com>
Subject: [tobetter:odroid-5.15.y 21/204] drivers/char/exynos-gpiomem.c:231
 exynos_gpiomem_probe() error: we previously assumed 'inst' could be null
 (see line 156)
Message-ID: <fdd23124-4697-4897-9808-bb613792affe@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-5.15.y
head:   28a16e1ab36472a36cac8b10003b29f322f458ff
commit: 61f45d975621becb00c0aef303769f10428b9cd8 [21/204] ODROID-XU4: char: exynos: add /dev/gpiomem device for rootless user GPIO access
config: i386-randconfig-141-20240416 (https://download.01.org/0day-ci/archive/20240416/202404160800.qLr46RNZ-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404160800.qLr46RNZ-lkp@intel.com/

smatch warnings:
drivers/char/exynos-gpiomem.c:231 exynos_gpiomem_probe() error: we previously assumed 'inst' could be null (see line 156)

vim +/inst +231 drivers/char/exynos-gpiomem.c

61f45d975621be Brian Kim 2017-01-10  145  static int exynos_gpiomem_probe(struct platform_device *pdev)
61f45d975621be Brian Kim 2017-01-10  146  {
61f45d975621be Brian Kim 2017-01-10  147  	int err = 0;
61f45d975621be Brian Kim 2017-01-10  148  	struct device *dev = &pdev->dev;
61f45d975621be Brian Kim 2017-01-10  149  	struct device_node *np = dev->of_node;
61f45d975621be Brian Kim 2017-01-10  150  	struct resource *res = NULL;
61f45d975621be Brian Kim 2017-01-10  151  	int i = 0;
61f45d975621be Brian Kim 2017-01-10  152  
61f45d975621be Brian Kim 2017-01-10  153  	/* Allocate buffers and instance data */
61f45d975621be Brian Kim 2017-01-10  154  	inst = kzalloc(sizeof(struct exynos_gpiomem_instance), GFP_KERNEL);
61f45d975621be Brian Kim 2017-01-10  155  
61f45d975621be Brian Kim 2017-01-10 @156  	if (!inst) {
61f45d975621be Brian Kim 2017-01-10  157  		err = -ENOMEM;
61f45d975621be Brian Kim 2017-01-10  158  		goto failed_inst_alloc;
                                                        ^^^^^^^^^^^^^^^^^^^^^^^
This should just return.  Printing an error for failed allocations is
against kernel style.

61f45d975621be Brian Kim 2017-01-10  159  	}
61f45d975621be Brian Kim 2017-01-10  160  
61f45d975621be Brian Kim 2017-01-10  161  	inst->dev = dev;
61f45d975621be Brian Kim 2017-01-10  162  
61f45d975621be Brian Kim 2017-01-10  163  	inst->gpio_area_count = of_property_count_elems_of_size(np, "reg",
61f45d975621be Brian Kim 2017-01-10  164  				sizeof(u32)) / 2;
61f45d975621be Brian Kim 2017-01-10  165  
61f45d975621be Brian Kim 2017-01-10  166  	if (inst->gpio_area_count > 32 || inst->gpio_area_count <= 0) {
61f45d975621be Brian Kim 2017-01-10  167  		dev_err(inst->dev, "failed to get gpio register area.");
61f45d975621be Brian Kim 2017-01-10  168  		err = -EINVAL;
61f45d975621be Brian Kim 2017-01-10  169  		goto failed_inst_alloc;
61f45d975621be Brian Kim 2017-01-10  170  	}
61f45d975621be Brian Kim 2017-01-10  171  
61f45d975621be Brian Kim 2017-01-10  172  	dev_info(inst->dev, "Initialised: GPIO register area is %d",
61f45d975621be Brian Kim 2017-01-10  173  			inst->gpio_area_count);
61f45d975621be Brian Kim 2017-01-10  174  
61f45d975621be Brian Kim 2017-01-10  175  	for (i = 0; i < inst->gpio_area_count; ++i) {
61f45d975621be Brian Kim 2017-01-10  176  		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
61f45d975621be Brian Kim 2017-01-10  177  		if (res) {
61f45d975621be Brian Kim 2017-01-10  178  			inst->gpio_regs_phys[i] = res->start;
61f45d975621be Brian Kim 2017-01-10  179  		} else {
61f45d975621be Brian Kim 2017-01-10  180  			dev_err(inst->dev, "failed to get IO resource");
61f45d975621be Brian Kim 2017-01-10  181  			err = -ENOENT;
61f45d975621be Brian Kim 2017-01-10  182  			goto failed_get_resource;
61f45d975621be Brian Kim 2017-01-10  183  		}
61f45d975621be Brian Kim 2017-01-10  184  	}
61f45d975621be Brian Kim 2017-01-10  185  
61f45d975621be Brian Kim 2017-01-10  186  	/* Create character device entries */
61f45d975621be Brian Kim 2017-01-10  187  	err = alloc_chrdev_region(&exynos_gpiomem_devid,
61f45d975621be Brian Kim 2017-01-10  188  				  DEVICE_MINOR, 1, DEVICE_NAME);
61f45d975621be Brian Kim 2017-01-10  189  	if (err != 0) {
61f45d975621be Brian Kim 2017-01-10  190  		dev_err(inst->dev, "unable to allocate device number");
61f45d975621be Brian Kim 2017-01-10  191  		goto failed_alloc_chrdev;
61f45d975621be Brian Kim 2017-01-10  192  	}
61f45d975621be Brian Kim 2017-01-10  193  	cdev_init(&exynos_gpiomem_cdev, &exynos_gpiomem_fops);
61f45d975621be Brian Kim 2017-01-10  194  	exynos_gpiomem_cdev.owner = THIS_MODULE;
61f45d975621be Brian Kim 2017-01-10  195  	err = cdev_add(&exynos_gpiomem_cdev, exynos_gpiomem_devid, 1);
61f45d975621be Brian Kim 2017-01-10  196  	if (err != 0) {
61f45d975621be Brian Kim 2017-01-10  197  		dev_err(inst->dev, "unable to register device");
61f45d975621be Brian Kim 2017-01-10  198  		goto failed_cdev_add;
61f45d975621be Brian Kim 2017-01-10  199  	}
61f45d975621be Brian Kim 2017-01-10  200  
61f45d975621be Brian Kim 2017-01-10  201  	/* Create sysfs entries */
61f45d975621be Brian Kim 2017-01-10  202  	exynos_gpiomem_class = class_create(THIS_MODULE, DEVICE_NAME);
61f45d975621be Brian Kim 2017-01-10  203  	err = IS_ERR(exynos_gpiomem_class);
61f45d975621be Brian Kim 2017-01-10  204  	if (err)
61f45d975621be Brian Kim 2017-01-10  205  		goto failed_class_create;
61f45d975621be Brian Kim 2017-01-10  206  
61f45d975621be Brian Kim 2017-01-10  207  	exynos_gpiomem_dev = device_create(exynos_gpiomem_class, NULL,
61f45d975621be Brian Kim 2017-01-10  208  					exynos_gpiomem_devid, NULL,
61f45d975621be Brian Kim 2017-01-10  209  					"gpiomem");
61f45d975621be Brian Kim 2017-01-10  210  	err = IS_ERR(exynos_gpiomem_dev);
61f45d975621be Brian Kim 2017-01-10  211  	if (err)
61f45d975621be Brian Kim 2017-01-10  212  		goto failed_device_create;
61f45d975621be Brian Kim 2017-01-10  213  
61f45d975621be Brian Kim 2017-01-10  214  	for (i = 0; i < inst->gpio_area_count; ++i) {
61f45d975621be Brian Kim 2017-01-10  215  		dev_info(inst->dev, "Initialised: Registers at 0x%08lx",
61f45d975621be Brian Kim 2017-01-10  216  				inst->gpio_regs_phys[i]);
61f45d975621be Brian Kim 2017-01-10  217  	}
61f45d975621be Brian Kim 2017-01-10  218  
61f45d975621be Brian Kim 2017-01-10  219  	return 0;
61f45d975621be Brian Kim 2017-01-10  220  
61f45d975621be Brian Kim 2017-01-10  221  failed_device_create:
61f45d975621be Brian Kim 2017-01-10  222  	class_destroy(exynos_gpiomem_class);
61f45d975621be Brian Kim 2017-01-10  223  failed_class_create:
61f45d975621be Brian Kim 2017-01-10  224  	cdev_del(&exynos_gpiomem_cdev);
61f45d975621be Brian Kim 2017-01-10  225  failed_cdev_add:
61f45d975621be Brian Kim 2017-01-10  226  	unregister_chrdev_region(exynos_gpiomem_devid, 1);
61f45d975621be Brian Kim 2017-01-10  227  failed_alloc_chrdev:
61f45d975621be Brian Kim 2017-01-10  228  failed_get_resource:
61f45d975621be Brian Kim 2017-01-10  229  	kfree(inst);
                                                ^^^^^^^^^^^
Ugh...  Why didn't it warn about this use after free?

61f45d975621be Brian Kim 2017-01-10  230  failed_inst_alloc:
61f45d975621be Brian Kim 2017-01-10 @231  	dev_err(inst->dev, "could not load exynos_gpiomem");
                                                        ^^^^^^^^^

61f45d975621be Brian Kim 2017-01-10  232  	return err;
61f45d975621be Brian Kim 2017-01-10  233  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

