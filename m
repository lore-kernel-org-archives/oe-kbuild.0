Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59051BA22
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Feb 2024 06:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707112835; cv=none; b=tFhsulwYJTKNkCbb98TH/PvRBcdQD3QIHqivC/RuI5dB2xM3Ga7Pjojp3mOYO1tmbljwKuoG3gpnXMfGf2G/JvRdDH7pVEaISHqMekzVEouC4jYqc9xIIbUXuKpiz52pUJnYv7sFGQsq/OInWYprA5NgKN0974UVK7KsfkT46vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707112835; c=relaxed/simple;
	bh=kq67++PrGOHRSPoTJxqLmFHrC5ZBBCoPb0xUFUCOK5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VJVPAreriybe3D1+/yDHODz6KAScP5H603i2gXlBOTOFjoV1Kr+DDg5zNMHPY6+Gu9PfJexnDqrvUFPAG3Os9XrDqnhfeGyd0BR9rdqEvunTAUU0kd+sVSASkrtVbVU6rR4vUuo3+YSLjsJ7rG4AFl+uOLyZfogaKHi4bCw+4GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kqyyTW7P; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kqyyTW7P"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d051fb89fbso52341061fa.2
        for <oe-kbuild@lists.linux.dev>; Sun, 04 Feb 2024 22:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707112831; x=1707717631; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IE8etV8dXymxXxD26dhXxFfWTSA6CW6O1D+5fVLbWAA=;
        b=kqyyTW7PG87DCDYBbNdljQKI3Rp0c2SC6z882aNgygh55WH6c6BeWvQ8dlsTCzucq7
         hFPuhC7KtsXTVevFiD+5GTnNN9TjsvbyBn0N9VHzcYeGXdapGr7USPqfgBxoV6ETeZhy
         UopYkaRBg7r3nb8IzMryYDaW2QGT/LHo1BLkYziAVkAvqh2X/1X0HplaknTHcsMjw+C/
         k3mEQ0tY+wB47IX3Wk9+FxMRp88OdyEMkHCEpDef6ASa0vOOPyGct8xIl25rqdX5EQn9
         /4zV9tCLhEzB+vvhu87cjY3pZpIkqGQCPmQTEIXcsnSleGp9R0mcJT7Gr6CJNnUuUPMb
         5YPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707112831; x=1707717631;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IE8etV8dXymxXxD26dhXxFfWTSA6CW6O1D+5fVLbWAA=;
        b=sGxzLvGrKioHjx8BDNfO2qWTOv7E8NyhGe5YSVLunLE0uvGdJZ56bawbcrs523EFZW
         2AxeKkAYrW/RiliCtadFTuIWwgGA+rMBn+5c06ZkrCAkQjZ8kM49iGmdfspvdKSocCBY
         M9U/IbxsmpYRb+yQ8NynmMZ6hghw9VjIuYt/IEgZgh8EhaZg5NlIbQHqu7cIc8XNKVNQ
         tAJEFfaEQxY1qgv4pQK6yIQghEB+b7r8h4glGjUjSlGjtjfLxhXhq1LVhfmKJF/Lucbp
         YSuJmiSh0icw9+QWXU0zjzi7ZAObhrTpvNEDhfOcIe3Vo1AJIKliGXKNWG4oStUxVnXI
         d3ow==
X-Gm-Message-State: AOJu0YwUANLLZNzvndyhGHqPSOO3Sw4jpMCt3LYmK8Byr96vgd3HWund
	khMVKH+RaNTxvy1Crs34ynohDTSfpits/L129mQO4WRpXiObuhUG2oWac32lI8tp1IH7V760ExV
	d
X-Google-Smtp-Source: AGHT+IGG/AGVPP7LiZNlnh5kCNRsd5c+DeHu3TIgGXHZtMB/ODPl6wHXaWTmA7nlzvycP2j9PHyMHA==
X-Received: by 2002:a2e:b602:0:b0:2d0:aa28:6f77 with SMTP id r2-20020a2eb602000000b002d0aa286f77mr1395893ljn.45.1707112829238;
        Sun, 04 Feb 2024 22:00:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWpmknaqH7W7vctyYKHv/5HxbGPtVEdM/5peP6NthYwIBiKW+GlBgl6RovtVsmJaCF+iuaHwSFV5+hYlvdoHIndnki6V+WKrZ1llxDKvUNJ8o1rD2RtUSET/sJ2SjA7f+FtYrXQS3ARvky1LdUTVcS+ynlb27Kj2mXYhZl7SopvI0XR78OaYAjGuJk+WmpTGg==
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n7-20020a50cc47000000b0055c63205052sm3389068edi.37.2024.02.04.22.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 22:00:28 -0800 (PST)
Date: Mon, 5 Feb 2024 09:00:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Steve Jeong <how2soft@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.6.y 42/51] drivers/char/aml-gpiomem.c:242
 aml_gpiomem_probe() error: we previously assumed 'inst' could be null (see
 line 164)
Message-ID: <3b813542-6a16-4b10-b866-7bccdefbf3bd@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   0ea9759612aba09cc99b50301b281417f70e847c
commit: 7d68a4b7edc4029f164a974f900a2eb2f1fc2919 [42/51] ODROID-N2/C4: char: Add /dev/gpiomem device
config: x86_64-randconfig-161-20240203 (https://download.01.org/0day-ci/archive/20240204/202402040226.dWKVclcB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402040226.dWKVclcB-lkp@intel.com/

smatch warnings:
drivers/char/aml-gpiomem.c:242 aml_gpiomem_probe() error: we previously assumed 'inst' could be null (see line 164)

vim +/inst +242 drivers/char/aml-gpiomem.c

7d68a4b7edc402 Steve Jeong 2023-04-04  153  static int aml_gpiomem_probe(struct platform_device *pdev)
7d68a4b7edc402 Steve Jeong 2023-04-04  154  {
7d68a4b7edc402 Steve Jeong 2023-04-04  155  	int err = 0;
7d68a4b7edc402 Steve Jeong 2023-04-04  156  	struct device *dev = &pdev->dev;
7d68a4b7edc402 Steve Jeong 2023-04-04  157  	struct device_node *np = dev->of_node;
7d68a4b7edc402 Steve Jeong 2023-04-04  158  	struct resource *res = NULL;
7d68a4b7edc402 Steve Jeong 2023-04-04  159  	int i = 0;
7d68a4b7edc402 Steve Jeong 2023-04-04  160  
7d68a4b7edc402 Steve Jeong 2023-04-04  161  	/* Allocate buffers and instance data */
7d68a4b7edc402 Steve Jeong 2023-04-04  162  	inst = kzalloc(sizeof(struct aml_gpiomem_instance), GFP_KERNEL);
7d68a4b7edc402 Steve Jeong 2023-04-04  163  
7d68a4b7edc402 Steve Jeong 2023-04-04 @164  	if (!inst) {
7d68a4b7edc402 Steve Jeong 2023-04-04  165  		err = -ENOMEM;
7d68a4b7edc402 Steve Jeong 2023-04-04  166  		goto failed_inst_alloc;

inst is NULL so this goto will crash.  No need to print a warning after
a kmalloc() by the way.  kmalloc() has it's own warning built in.

7d68a4b7edc402 Steve Jeong 2023-04-04  167  	}
7d68a4b7edc402 Steve Jeong 2023-04-04  168  
7d68a4b7edc402 Steve Jeong 2023-04-04  169  	inst->dev = dev;
7d68a4b7edc402 Steve Jeong 2023-04-04  170  	inst->gpio_area_count = of_property_count_elems_of_size(np, "reg",
7d68a4b7edc402 Steve Jeong 2023-04-04  171  				sizeof(u32)) / 4;
7d68a4b7edc402 Steve Jeong 2023-04-04  172  
7d68a4b7edc402 Steve Jeong 2023-04-04  173  	if (inst->gpio_area_count > 32 || inst->gpio_area_count <= 0) {
7d68a4b7edc402 Steve Jeong 2023-04-04  174  		dev_err(inst->dev, "failed to get gpio register area.");
7d68a4b7edc402 Steve Jeong 2023-04-04  175  		err = -EINVAL;
7d68a4b7edc402 Steve Jeong 2023-04-04  176  		goto failed_inst_alloc;
7d68a4b7edc402 Steve Jeong 2023-04-04  177  	}
7d68a4b7edc402 Steve Jeong 2023-04-04  178  
7d68a4b7edc402 Steve Jeong 2023-04-04  179  	dev_info(inst->dev, "Initialised: GPIO register area is %d",
7d68a4b7edc402 Steve Jeong 2023-04-04  180  			inst->gpio_area_count);
7d68a4b7edc402 Steve Jeong 2023-04-04  181  
7d68a4b7edc402 Steve Jeong 2023-04-04  182  	for (i = 0; i < inst->gpio_area_count; ++i) {
7d68a4b7edc402 Steve Jeong 2023-04-04  183  		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
7d68a4b7edc402 Steve Jeong 2023-04-04  184  		if (res) {
7d68a4b7edc402 Steve Jeong 2023-04-04  185  			inst->gpio_regs_phys[i].start = res->start;
7d68a4b7edc402 Steve Jeong 2023-04-04  186  			inst->gpio_regs_phys[i].end   = res->end;
7d68a4b7edc402 Steve Jeong 2023-04-04  187  		} else {
7d68a4b7edc402 Steve Jeong 2023-04-04  188  			dev_err(inst->dev, "failed to get IO resource area %d", i);
7d68a4b7edc402 Steve Jeong 2023-04-04  189  			err = -ENOENT;
7d68a4b7edc402 Steve Jeong 2023-04-04  190  			goto failed_get_resource;
7d68a4b7edc402 Steve Jeong 2023-04-04  191  		}
7d68a4b7edc402 Steve Jeong 2023-04-04  192  	}
7d68a4b7edc402 Steve Jeong 2023-04-04  193  
7d68a4b7edc402 Steve Jeong 2023-04-04  194  	/* Create character device entries */
7d68a4b7edc402 Steve Jeong 2023-04-04  195  	err = alloc_chrdev_region(&aml_gpiomem_devid,
7d68a4b7edc402 Steve Jeong 2023-04-04  196  				  DEVICE_MINOR, 1, DEVICE_NAME);
7d68a4b7edc402 Steve Jeong 2023-04-04  197  	if (err != 0) {
7d68a4b7edc402 Steve Jeong 2023-04-04  198  		dev_err(inst->dev, "unable to allocate device number");
7d68a4b7edc402 Steve Jeong 2023-04-04  199  		goto failed_alloc_chrdev;
7d68a4b7edc402 Steve Jeong 2023-04-04  200  	}
7d68a4b7edc402 Steve Jeong 2023-04-04  201  	cdev_init(&aml_gpiomem_cdev, &aml_gpiomem_fops);
7d68a4b7edc402 Steve Jeong 2023-04-04  202  	aml_gpiomem_cdev.owner = THIS_MODULE;
7d68a4b7edc402 Steve Jeong 2023-04-04  203  	err = cdev_add(&aml_gpiomem_cdev, aml_gpiomem_devid, 1);
7d68a4b7edc402 Steve Jeong 2023-04-04  204  	if (err != 0) {
7d68a4b7edc402 Steve Jeong 2023-04-04  205  		dev_err(inst->dev, "unable to register device");
7d68a4b7edc402 Steve Jeong 2023-04-04  206  		goto failed_cdev_add;
7d68a4b7edc402 Steve Jeong 2023-04-04  207  	}
7d68a4b7edc402 Steve Jeong 2023-04-04  208  
7d68a4b7edc402 Steve Jeong 2023-04-04  209  	/* Create sysfs entries */
7d68a4b7edc402 Steve Jeong 2023-04-04  210  	aml_gpiomem_class = class_create(DEVICE_NAME);
7d68a4b7edc402 Steve Jeong 2023-04-04  211  	err = IS_ERR(aml_gpiomem_class);
7d68a4b7edc402 Steve Jeong 2023-04-04  212  	if (err)
7d68a4b7edc402 Steve Jeong 2023-04-04  213  		goto failed_class_create;
7d68a4b7edc402 Steve Jeong 2023-04-04  214  
7d68a4b7edc402 Steve Jeong 2023-04-04  215  	aml_gpiomem_dev = device_create(aml_gpiomem_class, NULL,
7d68a4b7edc402 Steve Jeong 2023-04-04  216  					aml_gpiomem_devid, NULL,
7d68a4b7edc402 Steve Jeong 2023-04-04  217  					"gpiomem");
7d68a4b7edc402 Steve Jeong 2023-04-04  218  	err = IS_ERR(aml_gpiomem_dev);
7d68a4b7edc402 Steve Jeong 2023-04-04  219  	if (err)
7d68a4b7edc402 Steve Jeong 2023-04-04  220  		goto failed_device_create;
7d68a4b7edc402 Steve Jeong 2023-04-04  221  
7d68a4b7edc402 Steve Jeong 2023-04-04  222  	for (i = 0; i < inst->gpio_area_count; ++i) {
7d68a4b7edc402 Steve Jeong 2023-04-04  223  		dev_info(inst->dev,
7d68a4b7edc402 Steve Jeong 2023-04-04  224  			"Initialised: Registers at start:0x%08lx end:0x%08lx size:0x%08lx",
7d68a4b7edc402 Steve Jeong 2023-04-04  225  			inst->gpio_regs_phys[i].start,
7d68a4b7edc402 Steve Jeong 2023-04-04  226  			inst->gpio_regs_phys[i].end,
7d68a4b7edc402 Steve Jeong 2023-04-04  227  			inst->gpio_regs_phys[i].end - inst->gpio_regs_phys[i].start);
7d68a4b7edc402 Steve Jeong 2023-04-04  228  	}
7d68a4b7edc402 Steve Jeong 2023-04-04  229  
7d68a4b7edc402 Steve Jeong 2023-04-04  230  	return 0;
7d68a4b7edc402 Steve Jeong 2023-04-04  231  
7d68a4b7edc402 Steve Jeong 2023-04-04  232  failed_device_create:
7d68a4b7edc402 Steve Jeong 2023-04-04  233  	class_destroy(aml_gpiomem_class);
7d68a4b7edc402 Steve Jeong 2023-04-04  234  failed_class_create:
7d68a4b7edc402 Steve Jeong 2023-04-04  235  	cdev_del(&aml_gpiomem_cdev);
7d68a4b7edc402 Steve Jeong 2023-04-04  236  failed_cdev_add:
7d68a4b7edc402 Steve Jeong 2023-04-04  237  	unregister_chrdev_region(aml_gpiomem_devid, 1);
7d68a4b7edc402 Steve Jeong 2023-04-04  238  failed_alloc_chrdev:
7d68a4b7edc402 Steve Jeong 2023-04-04  239  failed_get_resource:
7d68a4b7edc402 Steve Jeong 2023-04-04  240  	kfree(inst);
                                                ^^^^^^^^^^^
inst is freed here...  Why is Smatch not detecting the use after free?
I will investigate.

7d68a4b7edc402 Steve Jeong 2023-04-04  241  failed_inst_alloc:
7d68a4b7edc402 Steve Jeong 2023-04-04 @242  	dev_err(inst->dev, "could not load aml_gpiomem");
                                                ^^^^^^^^^^^^^^^^^^
Here.

7d68a4b7edc402 Steve Jeong 2023-04-04  243  	return err;
7d68a4b7edc402 Steve Jeong 2023-04-04  244  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

