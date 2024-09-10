Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6890817A5A4
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 09:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725960039; cv=none; b=BR3ZLYisoV/r2fWJnM13y1fBPwt9rt7wK0GyrvebY+FO6YS4FbK6qokG6WU2hIJITOcRwAazYobIX8OCd9Lnsjr5tiaM+LKR+YEofNUplUFKxxFo6V5/MHaxW1ZX+Skz/1QgikcP/Igf6IEMmKKPHIGq0ehII/cMsQjVo7HuU90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725960039; c=relaxed/simple;
	bh=8+dCpkOW8iBiEz5yPaF72LDT887m4VnqG2AW+wQ8XoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WKK2TcbUPIDwrtx5nEU43vl6k0uUcoXOWx2m0hbGNyJXKxhfk7bIjAYXHunDVHBnw2FUBkL30kHLPRybo1yzTOYoUEqtG73MAlh/f9G3JLVRjrV7cIucfphV4qFGItNYcsQ6yCkdQjnAR5I9W+LR39YmSTG7Dm/2WOVxjBFrZKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=myg/Mrge; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="myg/Mrge"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42bb6d3e260so5187465e9.1
        for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 02:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725960035; x=1726564835; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaVuov/GMKYob9rnqk10dKYifuJlj6SVPmyKe/nzanI=;
        b=myg/MrgeYBmTAHXaI2zux3hLNvDtlExZx9XKFgJ+fCYJqmxZT2Ol99Wpzm6MS7rlya
         cewQ1o5VRGmofQrC8K55uQ36TminMdAiL1Wn/XMUu7eGegIkovBese55/XJgt3pBCMoM
         wBoaV82DPEFhVdGvcHD0LwnmYqsW1JhPns7FS74fcULr46CVoPlnN5F2u6SK7AZXKhK6
         oxhSOdQqwrPvsrkzgrqCZmZRIgY+Rm5EqgtzQn8WgJvYrEvbnHptMOcbhHVIDNPtwQ6N
         I/aRU/z3tSjnCK060ctljjMGqJssxFehUjIHTiDSkZtdc4zpkL0Orz5FWub86epBAzOu
         SpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725960035; x=1726564835;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaVuov/GMKYob9rnqk10dKYifuJlj6SVPmyKe/nzanI=;
        b=cfW2q9OHKRkmkBKo6mT6a7eE+B7i3upr8S1wMCAFkoyVDjOj+D1CUaXZi7RPf5MN1L
         BqPVDF92T2f90zv1U4A9ybgIEOrlaCfRjynT+xedQyMnNN68O67X4oFxZrOmj+BpOF6x
         DmVjThSXY2xMvbay2EnL3bJAqUN9fxjxPWVnPQlBC2ZSqLgiG+s/WjfFUQXSneF6BE5n
         yfD47mLreGQacIUMYK+H2Inmasm1981g765M59rgQgqFQzW85dRMZ6tCi+9HCGaE2fV7
         4AWzzoYGCBirP8DQQ5Bblt345TLt734qP9+j2kJHtg/eCvAZJHKwrbJcHgeQp8zZYYbw
         o4YQ==
X-Gm-Message-State: AOJu0YxVX2NkvrezGa7mJ/teny5YdJw75dX6p7c8+p0qdF/uamrmyjBo
	vlg1LRgJie2ExVRMZY6y/WHYlJj5wqtX74QSV+hVwl3ULeWm6ibWevVF7UGcqVkfNMAJqXfXiLE
	P
X-Google-Smtp-Source: AGHT+IHdQlXsqnNH1io28/qy8pwsediidCY0yocjW/6T9f2sDTX85XSttflhDNL4NWYsLAXBUQ/vuQ==
X-Received: by 2002:a05:600c:4692:b0:428:10d7:a4b1 with SMTP id 5b1f17b1804b1-42c9f9d6f06mr110127165e9.25.1725960035362;
        Tue, 10 Sep 2024 02:20:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956654ffsm8331611f8f.40.2024.09.10.02.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 02:20:35 -0700 (PDT)
Date: Tue, 10 Sep 2024 12:20:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1]
 drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of
 'gi->composite.gadget_driver.driver.name'
Message-ID: <6ba088e2-126f-4f4d-a1e5-b50aea604cd7@stanley.mountain>
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
head:   2dd00822d42905f5d4a7db95fbac52c47daf9bf6
commit: 957b40b3b769bc23db3d6491db267e3166f91316 [1/1] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
config: i386-randconfig-141-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101015.b0Oixg1v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409101015.b0Oixg1v-lkp@intel.com/

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
                                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
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

