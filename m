Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8841C5D7D
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894534; cv=none; b=gc5PZhLF6uJJWDg5sbpu1beRsX1XXgqjgz9G23wpFEA9Us4oQdZqrMZSV3WCSDl3KTPVugmlmhjXaIuIZzBsP2b/OMyQ4ED8SlDABhBJTMgyUy3SKj5gfcdFHXRFhr9InGVKuUUy9WcCJarlQbNm7pvx8hASea1E+rmFLdVosBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894534; c=relaxed/simple;
	bh=Sbg5AE31o6usEQHgE1a4n3VwO8hZyirpW+iv5furtm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KMOtcKpD/g/6apGzdLhgmr1o9nr5R0przdx1VufdOt3qaAhLTrXONFBsd7YlgzhB10RXXAzbQjOWjNRJXz2gp0MZICtGQdLPya0Yiff4z37+cC4jQZlGQ3zoLeZU2dg+q3CTUWJiUBdn2/f7jOND22x1D5KFisXmgK/ruFyUCKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZLPX921; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZLPX921"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b8efed61so25229195e9.1
        for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 01:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775894531; x=1776499331; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtcfSVrSfzdZuGAg24UNLfnYvFwPY0Vi4FV2HiYNgpY=;
        b=lZLPX9210fuxewVpuwVxdWwFzjAj8DG4ZNpervFl78Li+sbQjHa1I67p+3mZIRko+H
         HqfHyCYZEm69TBA0YgPVC32AzRkImM4mcow+0a5kv2NG9ApjllR2uPpWzPY9P9OfF0Zq
         aQw2xw4sHTA/rfPoQcsLdTnPY76spCw4SnMk+vvs8bXfdPZpuNYIZpfwFLK5+ukVSrGc
         rgWafps51pWhpIu5O5CA1vzBRI1MXfL3J51H5lFS2lE09M4UilEb360Jr3dcPNPulS8X
         T76PeuSGO89tGwUvcDOJnf2JvZTwrdPsuuJDoaEKFa+sGYYJxe08AFqQv5EPdZgrkNMf
         Txzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775894531; x=1776499331;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LtcfSVrSfzdZuGAg24UNLfnYvFwPY0Vi4FV2HiYNgpY=;
        b=YG+K/Mfo1B0o8vc5ue3R1HBl3suqW4wd/F1VCT5q+c35xj8X1BCEDnqyoNYWYyvYgI
         5yvhOc3obLdEPYCRDMcxq9Nj9l8x5ZeB2dOj13zwRBgPiK8440j+DTRinOwFLO8fhHR+
         PKBteg0IE0fPp/aWfa9uT2zC578PEUq03ozAKuAz6NpblamWTc7qzNX5KgiYuGejJtEY
         QzM3heVVHYfYjJdFJf/MUoCk96WyMKIaVpXPRLKCnm/12o79WihcjRCP2sqmlXqrErfl
         THbtSY+3Hws/Lbg7+80lKN8bKXwdqRPaiNU5zvZISInaFVwSLUykZiz/uPrqeTi1lUoc
         gg3g==
X-Gm-Message-State: AOJu0YzoK7praYNknNP/d0FWcdp6inW8+MX5DqSq7t5c+Iq5GmvsEX1o
	9OOa/mQWIq2NdVwrudOUazYBC8BLEmFsR6fmPshSz3tnd5CZgNNqjgSSyWDrQaip
X-Gm-Gg: AeBDiev5y1HvKlJBqvFJ++3g8QHcIZH1Ews/VnqYMTnlpeISZ+MNXcA4zDSICrC6BXN
	8R/rXv4paFo5+Aaan2YAW/aMYe/3P29TVZEJ6INd6Uy0JQz0cZ0JENNgPciUl0uXxs33JTwQFGd
	gmb51KLIVCr+egMuHAdwCw0WiLEqxgVFGJkQOlyrQz1gIhKP1SyZbMPnhl7eolInE8PD+E9a3qX
	b5R1ffSBDHClO2UjDMn6lqGej+hXb18WCOdRsTUmPlnXdwZTimdnD+uX5c1wMcGRGgQ+Orwr/mU
	dtAXQp3oZCZ2gAMB1BTDcNfLraByiK5IZJ+cp5tmrW9Y+zJz20XYfD44l73cD5hpcdoOfFxI9Fb
	OwPhC6bDJcPAs3exgQl+TGr5Uhuk04gX1o8zVIRpClvBeM59zvBCM0Xxo993eJs750+Czv8ShA4
	Cupv2RUMbj7K3Z5UsHp4Uz/QtMuwW6Vw==
X-Received: by 2002:a05:600c:c0dc:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-488d686837bmr50188945e9.7.1775894530810;
        Sat, 11 Apr 2026 01:02:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d53807d7sm208524325e9.10.2026.04.11.01.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:02:09 -0700 (PDT)
Date: Sat, 11 Apr 2026 11:02:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 3/3]
 drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of
 'gi->composite.gadget_driver.driver.name' (line 2048)
Message-ID: <202604111133.Y9gWRtAh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260411080206.sMGH0LwMXB_AhW_fYkTJkb6NeAqR1t7SLvUtxyX7DHg@z>

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   7d8deb5e05aad8da2ebfe9fa852654185821b6e2
commit: 957b40b3b769bc23db3d6491db267e3166f91316 [3/3] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
config: x86_64-randconfig-161-20260411 (https://download.01.org/0day-ci/archive/20260411/202604111133.Y9gWRtAh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604111133.Y9gWRtAh-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of 'gi->composite.gadget_driver.driver.name' (line 2048)

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
7c07553807c512 Chanh Nguyen              2023-01-11 @2048  	kfree(gi->composite.gadget_driver.driver.name);
                                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

957b40b3b769bc Neill Kapron              2024-02-01  2049  out_free_driver_name_and_function:
957b40b3b769bc Neill Kapron              2024-02-01 @2050  	kfree(gi->composite.gadget_driver.driver.name);
                                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Double free.  Presumably this is fixed upstream.

957b40b3b769bc Neill Kapron              2024-02-01  2051  	kfree(gi->composite.gadget_driver.function);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2052  err:
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2053  	kfree(gi);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2054  	return ERR_PTR(-ENOMEM);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2055  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

