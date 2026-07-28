Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD5F41E6AD
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jul 2026 10:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233330; cv=none; b=AnY9UnD+u1v2FI9iNV7sFIVvQwff9c7hdoeYOi3BEe6z0jQW9OjkuQ2vZZceQH+2Ag9fxmprPMIqn8O6auqYzcGlkQTifvoIDsXxjTqhkFo55ajccPh6rA9f2mbcmxOoukOARWfeyw7xjyHQ6h3ozREtv7d8TNJoHETfu5cNHBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233330; c=relaxed/simple;
	bh=vlcAPvX8JdUFJMF6LbJur6MslBFqfDypT2+Opb/WJe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dmTCreI8t3BcFJ+ypjAve1I3MDfMcfNg7dBduL4VbbbbRay2uIibpbh2Ah9xUGYsoX4izN+iTva1ycb+oCENFo5Uc2h1EcHWBjWekcsb7gCwS6uhF5XDBY/YWImNtPB9yu4SLica58H0rLtmFVOlvEhHDZdFZLWNH8fIdWMKSsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwVncGTm; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwVncGTm"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso4054637a91.2
        for <oe-kbuild@lists.linux.dev>; Tue, 28 Jul 2026 03:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785233322; x=1785838122; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AW03QCwb4tZ4pZU7Z0s76TiVdNSC8GQ9AsKNW3dlvqU=;
        b=hwVncGTmLnKSMMw5hjHwpzWVfJx0p78wtIqjupSWNkknKcajeBfhPw+nmngYYLDHAr
         Uf2fo26Mvu264UnInhX9W3XL3R1XDnTYCsmEI7GjQXDZoh2fIZXzTry8LSavxlxO/Q+I
         K+HUNoooZD10LFu/W539uIjY7reYH9/G/xFXDBroGOzlI9JH6xCJsGah+jFHS2rjnfv4
         O2FeBNG9hAg5I3JI+MDLugpL6Jb/cV9uFXg5+tvWAH2QEelqEBKGejOgonLUvqyk8w8S
         1QYK48ejoPsurT3GkP0Whm3S1E3RjeCZs9m2kR5x4wz1oapX+qWTMYXxuEkzJj56YisF
         mLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785233322; x=1785838122;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AW03QCwb4tZ4pZU7Z0s76TiVdNSC8GQ9AsKNW3dlvqU=;
        b=ETmjB13DZdyxA9tAnnekkSlz+4QzpWbILG8btFAPDJAfMNIcFvXUzX39g1VfLat8yT
         y8wvdz8OWtI71/ubT8QVDZOeVNlpCjZgEgbOhOePC62Yxeo5nMEUqJ65ZMkx9R9yjwJ3
         aWlrCUfQOM8gWMLJj+fIZZODdJ3P0cImVnX6I/PJ+2XlMp3jyrcdkBBmMZ7aSw2ijrZQ
         hvC22Y7EVRKvHUbrxPXlBW7mNaoJOQuvpHhq+uxWqZotZO3y9Sa6MII+v+tPrdh70x37
         2aDlT+sRSmHcW3i83k4tp1ekCdA0vogPWdmDvNZpP4xZRwqP1cgW6VLr5dl27J1mLY/M
         RxOw==
X-Gm-Message-State: AOJu0Yz9MxS9f4y37X+3UTk9jp5YpWMqP1tUTYFNGaC82GJaBcaUVAlW
	JHEpqlKA4Qa1c8vrEKPflosV7l7ZODu6igKElwN35ea3581ARVTLmsiiqYNJUP+V/No=
X-Gm-Gg: AR+sD10thYOEcWez5xIoDR5PAPxkJzaBdN/b8b8z7c4DvPejj5jtUujZuLYCV4CVspm
	20KNy5nb+9gS8tySIXnFBM80cnKdQ8m/B0Behzz6mm//bK+3mwA6AGoYhQbB94MGjT3TBhpmUbT
	W+iemNJBOeMMZG5xrGSVFyfhyzvt9MXjj05vkSEAwyiMlzV6rC16gxoEGWxp2ip/TiXz/fU6pdu
	4mCcfdaJv7dnPQUXvxfMF/j1N2iKkMckuktoLuAUHYPNy/jQ/hLnEeBfBLNrrA+EaohixLMLFwu
	xdtkMSn3SenimHwX6l+fQBoo6iY1Xi1CCWYVIsGU6dVLrXY/GdYQXe+qhfCwawCVgZFqUvLj5dG
	gfTo4SbW7X0v+CY5ljDlU3S/n/AJQK0oVXAe+A7WVQsUqObOIEpJlPM8lAORtTnOeEZSH6z7d
X-Received: by 2002:a17:90b:4c41:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-38f6a425c43mr1834995a91.7.1785233321770;
        Tue, 28 Jul 2026 03:08:41 -0700 (PDT)
Received: from localhost ([172.216.252.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6412a92bsm1082326a91.5.2026.07.28.03.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:08:40 -0700 (PDT)
Date: Tue, 28 Jul 2026 13:08:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 5/5]
 drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of
 'gi->composite.gadget_driver.driver.name' (line 2048)
Message-ID: <202607281748.tMhAiK8E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260728100834.JEajpwF6NIJaEAt0-XeYBoI4a48q6GQNH1BC8Y-p6WA@z>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   579215f16d4e5c3062e423a583897e83473e1435
commit: 957b40b3b769bc23db3d6491db267e3166f91316 [5/5] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260728/202607281748.tMhAiK8E-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607281748.tMhAiK8E-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of 'gi->composite.gadget_driver.driver.name' (line 2048)

vim +2050 drivers/usb/gadget/configfs.c

88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1981  static struct config_group *gadgets_make(
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1982  		struct config_group *group,
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1983  		const char *name)
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1984  {
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1985  	struct gadget_info *gi;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1986  
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1987  	gi = kzalloc(sizeof(*gi), GFP_KERNEL);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1988  	if (!gi)
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1989  		return ERR_PTR(-ENOMEM);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1990  
1ae1602de028aca Christoph Hellwig         2016-02-26  1991  	config_group_init_type_name(&gi->group, name, &gadget_root_type);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1992  
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1993  	config_group_init_type_name(&gi->functions_group, "functions",
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1994  			&functions_type);
1ae1602de028aca Christoph Hellwig         2016-02-26  1995  	configfs_add_default_group(&gi->functions_group, &gi->group);
1ae1602de028aca Christoph Hellwig         2016-02-26  1996  
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1997  	config_group_init_type_name(&gi->configs_group, "configs",
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  1998  			&config_desc_type);
1ae1602de028aca Christoph Hellwig         2016-02-26  1999  	configfs_add_default_group(&gi->configs_group, &gi->group);
1ae1602de028aca Christoph Hellwig         2016-02-26  2000  
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2001  	config_group_init_type_name(&gi->strings_group, "strings",
6e2a512d9532c51 Daniel Scally             2023-02-06  2002  			&gadget_language_strings_type);
1ae1602de028aca Christoph Hellwig         2016-02-26  2003  	configfs_add_default_group(&gi->strings_group, &gi->group);
1ae1602de028aca Christoph Hellwig         2016-02-26  2004  
87213d388e927aa Andrzej Pietrasiewicz     2014-05-08  2005  	config_group_init_type_name(&gi->os_desc_group, "os_desc",
87213d388e927aa Andrzej Pietrasiewicz     2014-05-08  2006  			&os_desc_type);
1ae1602de028aca Christoph Hellwig         2016-02-26  2007  	configfs_add_default_group(&gi->os_desc_group, &gi->group);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2008  
93c473948c58897 Jó Ágila Bitsch           2023-01-13  2009  	config_group_init_type_name(&gi->webusb_group, "webusb",
93c473948c58897 Jó Ágila Bitsch           2023-01-13  2010  			&webusb_type);
93c473948c58897 Jó Ágila Bitsch           2023-01-13  2011  	configfs_add_default_group(&gi->webusb_group, &gi->group);
93c473948c58897 Jó Ágila Bitsch           2023-01-13  2012  
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2013  	gi->composite.bind = configfs_do_nothing;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2014  	gi->composite.unbind = configfs_do_nothing;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2015  	gi->composite.suspend = NULL;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2016  	gi->composite.resume = NULL;
e2459108b5a0604 taehyun.cho               2021-01-07  2017  	gi->composite.max_speed = USB_SPEED_SUPER_PLUS;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2018  
093edc2baad2c25 Wei Yongjun               2019-10-30  2019  	spin_lock_init(&gi->spinlock);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2020  	mutex_init(&gi->lock);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2021  	INIT_LIST_HEAD(&gi->string_list);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2022  	INIT_LIST_HEAD(&gi->available_func);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2023  
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2024  	composite_init_dev(&gi->cdev);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2025  	gi->cdev.desc.bLength = USB_DT_DEVICE_SIZE;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2026  	gi->cdev.desc.bDescriptorType = USB_DT_DEVICE;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2027  	gi->cdev.desc.bcdDevice = cpu_to_le16(get_default_bcdDevice());
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2028  
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2029  	gi->composite.gadget_driver = configfs_driver_template;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2030  
7c07553807c5125 Chanh Nguyen              2023-01-11  2031  	gi->composite.gadget_driver.driver.name = kasprintf(GFP_KERNEL,
7c07553807c5125 Chanh Nguyen              2023-01-11  2032  							    "configfs-gadget.%s", name);
7c07553807c5125 Chanh Nguyen              2023-01-11  2033  	if (!gi->composite.gadget_driver.driver.name)
7c07553807c5125 Chanh Nguyen              2023-01-11  2034  		goto err;
7c07553807c5125 Chanh Nguyen              2023-01-11  2035  
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2036  	gi->composite.gadget_driver.function = kstrdup(name, GFP_KERNEL);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2037  	gi->composite.name = gi->composite.gadget_driver.function;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2038  
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2039  	if (!gi->composite.gadget_driver.function)
7c07553807c5125 Chanh Nguyen              2023-01-11  2040  		goto out_free_driver_name;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2041  
957b40b3b769bc2 Neill Kapron              2024-02-01  2042  	if (android_device_create(&gi->cdev.android_opts))
957b40b3b769bc2 Neill Kapron              2024-02-01  2043  		goto out_free_driver_name_and_function;
957b40b3b769bc2 Neill Kapron              2024-02-01  2044  
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2045  	return &gi->group;
7c07553807c5125 Chanh Nguyen              2023-01-11  2046  
7c07553807c5125 Chanh Nguyen              2023-01-11  2047  out_free_driver_name:
7c07553807c5125 Chanh Nguyen              2023-01-11 @2048  	kfree(gi->composite.gadget_driver.driver.name);
                                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
957b40b3b769bc2 Neill Kapron              2024-02-01  2049  out_free_driver_name_and_function:
957b40b3b769bc2 Neill Kapron              2024-02-01 @2050  	kfree(gi->composite.gadget_driver.driver.name);
                                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Double free.

957b40b3b769bc2 Neill Kapron              2024-02-01  2051  	kfree(gi->composite.gadget_driver.function);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2052  err:
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2053  	kfree(gi);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2054  	return ERR_PTR(-ENOMEM);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2055  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

