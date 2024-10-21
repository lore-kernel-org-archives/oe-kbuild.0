Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDEE1DF999
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 07:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729496110; cv=none; b=k9vreDkrubsVHb+Z+JcabjPrIwOMFeNZALTs7fwVpR2yqmKuohACkT42kEjT6dJKPvlmqPaEpJFoM84XG4cLxMiNbSearJK9sV/i/JatJBhRmkDudbXykzo2JaigrZHLHOnodQNWNYM8Ay76uDBmMHBqwPK6V5TlPJqXtl/uqV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729496110; c=relaxed/simple;
	bh=WZFDhguuFuyTX2813Yrbn8nWnyRmm71977J0GZ2Ep4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QVVFvzL3gbRcQt4aWdfU4nOHqyDtuSRtwI/YxBhLuE0wSj1f90iDrHr6XqtQlR3DYjgkNnNkmHTdVFvm9uOewCLlAApZaipB3YxnV7JQ0CWefHFDkXY294ZcDerEE0mr/iGcH2KgUFToFgBoaYkgFUpeX50cVkMo1xGdkCu653g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QPNLUGIR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QPNLUGIR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-431688d5127so17718075e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 00:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729496105; x=1730100905; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6YHeYxnRBTJ38pAimfzmAWpxi3G4XwWLr0+tIMfVfc=;
        b=QPNLUGIRCBagoxMQasah41z150sBSyESzRcxYVBM5F7mso3j0ekakenmWdxDKaWtER
         2DT66id1rI+GBDhoeXXtWiq3y6RDgPnE3ca94/aQ0hNKFDNVGisL3dK79EGNYasQVK55
         0QbsjoRecsMh3b3QzuSTVj3tj+froy4qiU+bFc/mFCzvWdCxZ8DnWLDxUgF6aeuekcIf
         a1VKOJbA9mStrIwHPSEWX8K5rSbckkl4v5XKNg5Ynao2w4MFbgrfQCjl+s+CKteJH7+W
         M5AS0duQo6jKwQwTXvy9mHizlwqyWcblmBKYO0KBgKM37S9KzMruiKpto1cHU5VVgDzB
         AZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729496105; x=1730100905;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6YHeYxnRBTJ38pAimfzmAWpxi3G4XwWLr0+tIMfVfc=;
        b=Kqil9bzY5o8j6p+GZz8L/hY7IxX7Fx0vYIhnvbp+jFhPFruaiw9MjSd3M0vI9IdXCU
         1l39oX9RmVMG4K8QSIJ81t4+64EX4G7MlB6vaBrRO1sgMEn8pPgD8CKyFUPmIadF3lPY
         kNVJ8rQLHOwOKuOK8xlbykIVkWnxUiIrdz0/OmngWTHlCTdNQXjq9Fcu83/+uTMYrfYD
         lVtgo49GXlCkK0btfMJKygtePvpcEwRMoNPDLKvSQrzJmRKVfxN+gALARNR0IoQnLifL
         c5DBywzr6aUvTMep8jg+CMUAxw4ltcK8MMqmjHZBB8pH5bVWsWIL/icvc3+Pb8frXNhC
         mshQ==
X-Gm-Message-State: AOJu0YwheOWUF23KqWxDG/kLFJEpo5AkE4SNtfF5+2mvSdL3naYfHFfK
	LgCXs6IzGpBcZzBADHiaoz0JKRjmqE4X54oejEQj1bHUqcmBGW8jit3hX3AfPdqDdIqjeHgZ/QR
	l
X-Google-Smtp-Source: AGHT+IEdk2YpW+sQaZQRkGdETqHQKLqz/s0IpdK5W/+PmCfv+7bAqH/mJZvei35/EmyTZlowf1uHBg==
X-Received: by 2002:a05:600c:4341:b0:431:5ab3:d28d with SMTP id 5b1f17b1804b1-4317744af65mr6705015e9.9.1729496105502;
        Mon, 21 Oct 2024 00:35:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f58b896sm46957155e9.25.2024.10.21.00.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:35:05 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:35:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1]
 drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of
 'gi->composite.gadget_driver.driver.name'
Message-ID: <a901f762-10ba-4106-9bb4-a833669dc1b4@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   32c1bffe815c9ed746ce7d84cae07da17db6bca4
commit: 957b40b3b769bc23db3d6491db267e3166f91316 [1/1] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
config: x86_64-randconfig-161-20241019 (https://download.01.org/0day-ci/archive/20241020/202410201230.ZylcHEFR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410201230.ZylcHEFR-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of 'gi->composite.gadget_driver.driver.name'

vim +2050 drivers/usb/gadget/configfs.c

88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1981  static struct config_group *gadgets_make(
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1982  		struct config_group *group,
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1983  		const char *name)
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1984  {
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1985  	struct gadget_info *gi;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1986  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1987  	gi = kzalloc(sizeof(*gi), GFP_KERNEL);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1988  	if (!gi)
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1989  		return ERR_PTR(-ENOMEM);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1990  
1ae1602de028ac Christoph Hellwig         2016-02-26  1991  	config_group_init_type_name(&gi->group, name, &gadget_root_type);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1992  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1993  	config_group_init_type_name(&gi->functions_group, "functions",
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1994  			&functions_type);
1ae1602de028ac Christoph Hellwig         2016-02-26  1995  	configfs_add_default_group(&gi->functions_group, &gi->group);
1ae1602de028ac Christoph Hellwig         2016-02-26  1996  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1997  	config_group_init_type_name(&gi->configs_group, "configs",
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1998  			&config_desc_type);
1ae1602de028ac Christoph Hellwig         2016-02-26  1999  	configfs_add_default_group(&gi->configs_group, &gi->group);
1ae1602de028ac Christoph Hellwig         2016-02-26  2000  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2001  	config_group_init_type_name(&gi->strings_group, "strings",
6e2a512d9532c5 Daniel Scally             2023-02-06  2002  			&gadget_language_strings_type);
1ae1602de028ac Christoph Hellwig         2016-02-26  2003  	configfs_add_default_group(&gi->strings_group, &gi->group);
1ae1602de028ac Christoph Hellwig         2016-02-26  2004  
87213d388e927a Andrzej Pietrasiewicz     2014-05-08  2005  	config_group_init_type_name(&gi->os_desc_group, "os_desc",
87213d388e927a Andrzej Pietrasiewicz     2014-05-08  2006  			&os_desc_type);
1ae1602de028ac Christoph Hellwig         2016-02-26  2007  	configfs_add_default_group(&gi->os_desc_group, &gi->group);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2008  
93c473948c5889 Jó Ágila Bitsch           2023-01-13  2009  	config_group_init_type_name(&gi->webusb_group, "webusb",
93c473948c5889 Jó Ágila Bitsch           2023-01-13  2010  			&webusb_type);
93c473948c5889 Jó Ágila Bitsch           2023-01-13  2011  	configfs_add_default_group(&gi->webusb_group, &gi->group);
93c473948c5889 Jó Ágila Bitsch           2023-01-13  2012  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2013  	gi->composite.bind = configfs_do_nothing;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2014  	gi->composite.unbind = configfs_do_nothing;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2015  	gi->composite.suspend = NULL;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2016  	gi->composite.resume = NULL;
e2459108b5a060 taehyun.cho               2021-01-07  2017  	gi->composite.max_speed = USB_SPEED_SUPER_PLUS;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2018  
093edc2baad2c2 Wei Yongjun               2019-10-30  2019  	spin_lock_init(&gi->spinlock);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2020  	mutex_init(&gi->lock);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2021  	INIT_LIST_HEAD(&gi->string_list);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2022  	INIT_LIST_HEAD(&gi->available_func);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2023  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2024  	composite_init_dev(&gi->cdev);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2025  	gi->cdev.desc.bLength = USB_DT_DEVICE_SIZE;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2026  	gi->cdev.desc.bDescriptorType = USB_DT_DEVICE;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2027  	gi->cdev.desc.bcdDevice = cpu_to_le16(get_default_bcdDevice());
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2028  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2029  	gi->composite.gadget_driver = configfs_driver_template;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2030  
7c07553807c512 Chanh Nguyen              2023-01-11  2031  	gi->composite.gadget_driver.driver.name = kasprintf(GFP_KERNEL,
7c07553807c512 Chanh Nguyen              2023-01-11  2032  							    "configfs-gadget.%s", name);
7c07553807c512 Chanh Nguyen              2023-01-11  2033  	if (!gi->composite.gadget_driver.driver.name)
7c07553807c512 Chanh Nguyen              2023-01-11  2034  		goto err;
7c07553807c512 Chanh Nguyen              2023-01-11  2035  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2036  	gi->composite.gadget_driver.function = kstrdup(name, GFP_KERNEL);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2037  	gi->composite.name = gi->composite.gadget_driver.function;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2038  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2039  	if (!gi->composite.gadget_driver.function)
7c07553807c512 Chanh Nguyen              2023-01-11  2040  		goto out_free_driver_name;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2041  
957b40b3b769bc Neill Kapron              2024-02-01  2042  	if (android_device_create(&gi->cdev.android_opts))
957b40b3b769bc Neill Kapron              2024-02-01  2043  		goto out_free_driver_name_and_function;
957b40b3b769bc Neill Kapron              2024-02-01  2044  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2045  	return &gi->group;
7c07553807c512 Chanh Nguyen              2023-01-11  2046  
7c07553807c512 Chanh Nguyen              2023-01-11  2047  out_free_driver_name:
7c07553807c512 Chanh Nguyen              2023-01-11  2048  	kfree(gi->composite.gadget_driver.driver.name);
                                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Free

957b40b3b769bc Neill Kapron              2024-02-01  2049  out_free_driver_name_and_function:
957b40b3b769bc Neill Kapron              2024-02-01 @2050  	kfree(gi->composite.gadget_driver.driver.name);
                                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Double free

957b40b3b769bc Neill Kapron              2024-02-01  2051  	kfree(gi->composite.gadget_driver.function);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2052  err:
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2053  	kfree(gi);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2054  	return ERR_PTR(-ENOMEM);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2055  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

