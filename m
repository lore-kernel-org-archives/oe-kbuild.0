Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D59476
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 22:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742681760; cv=none; b=qgxBw0bSYrGkN7xMHPbXZDJ1TpoufFBRmajzZVDpL9LjA4SW8mg4+lArYekqkWpbTSlRr5NFNBjCQ0CU0lN+M3yKG/h9KMh6LYDa1dDIgR2Anl8NLyeZ/JDLvr0CNhbKbKJoog+kN/8OXDzTWUE/uQ8/QPZjxS3ClM2ILVsQ3ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742681760; c=relaxed/simple;
	bh=bYwChL8YP4syzPTsuiEkxCZkP9ZMDh5DCZQzUhdMcSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PymmgZf4HThoib8SfMR14rpgI1aYu9//w4H8NK8PmhitkN+IYcx64in2gPQNPWCMlDi53xEz51KaX7opz3PTJq4UHticUoYzSOUnRFNblAJ1mfhwnKwxvBxPr9ECFqGqDb1+HP5SJ9UHn9xo1i9+XVPYGTzO1v+ciFJf0wx8LX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PadbtbZw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PadbtbZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742681758; x=1774217758;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bYwChL8YP4syzPTsuiEkxCZkP9ZMDh5DCZQzUhdMcSE=;
  b=PadbtbZw8dDc7cqfPtxiYK3TQGvn4hlyQ6Ud8D6SwOtIz0onqyhkfZJ0
   Sx1AyEcPZrdkZS6vcSZo+KHGFLguEp9+5mdsZYPZOnErH0/TAzmJjLcsD
   7w/B9KVROTSGd06BeASCkvOpjMNTvCF7TydAnFKPQmiadfQaRECkxBCR9
   5DCz45ijNUzLHbQKTEBjf2BDc4J8pEDSRxpbjBOsQoeSu1KExeSHW4U0y
   qepbkoY8MZ6I19Sen4/S/xfcYtql7YH0EbLcns8RUcnhFLF4j8W9ISTCG
   FyItPbw6OfFGcvjL06mcI11nxKIqwnpfILohw9fyObnQttM/Hh2Hzk/Sj
   g==;
X-CSE-ConnectionGUID: JoltBariS4ex8ItDFND6UQ==
X-CSE-MsgGUID: 05HDtnkUT4iEIDxRA3t4ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="54913290"
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="54913290"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 15:15:58 -0700
X-CSE-ConnectionGUID: T8/r8br2The2mr6GX6Nefg==
X-CSE-MsgGUID: PXiSoLdOTcaRtRvuEIHyMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="154592479"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Mar 2025 15:15:57 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw78E-0002Qd-1n;
	Sat, 22 Mar 2025 22:15:54 +0000
Date: Sun, 23 Mar 2025 06:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android-mainline-rust 2/2]
 drivers/usb/gadget/configfs.c:2050:7-46: ERROR: reference preceded by free
 on line 2048
Message-ID: <202503230650.8qAKzUnQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   69e641afed13f4ee53e66be0464646d326f9b5b1
commit: 957b40b3b769bc23db3d6491db267e3166f91316 [2/2] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-103-20250322 (https://download.01.org/0day-ci/archive/20250323/202503230650.8qAKzUnQ-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503230650.8qAKzUnQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/configfs.c:2050:7-46: ERROR: reference preceded by free on line 2048

vim +2050 drivers/usb/gadget/configfs.c

88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1980  
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
957b40b3b769bc Neill Kapron              2024-02-01  2049  out_free_driver_name_and_function:
957b40b3b769bc Neill Kapron              2024-02-01 @2050  	kfree(gi->composite.gadget_driver.driver.name);
957b40b3b769bc Neill Kapron              2024-02-01  2051  	kfree(gi->composite.gadget_driver.function);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2052  err:
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2053  	kfree(gi);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2054  	return ERR_PTR(-ENOMEM);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2055  }
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  2056  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
