Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DFB3D6D
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 04:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729399219; cv=none; b=KiNOs3CDUQly4Alkl9syATJizHCaE2N92RA3D3ss9LbI1Jlt7PnMr6oVM0vLcoAtk4GaYjQ20IquMSEEqdMA3kRqWerzsAXXfERpwVIRHS07WpmS0syJFCoLXp6lJqklkiTii0Pd18BKHT7wgKgkWlL/GHuLAbDbGBwCtBgYG2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729399219; c=relaxed/simple;
	bh=Kr9UFETjaoTrMNqfSmBgxm2zV/cgNEV4yr54HIiy3iA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J4llF4S4VrP38sJ9J7KMY71JZ69FQgiTrPt5cgg8au0h1JxqKQpLHsn2OIzGoIpKtM4M/fUnU9Y22UzG+/zcz2tdPlPcq16rKbRT3BEJzPyPWeh7JZEJTMOldj13Xy8aqLQz5v0EEPwWj54MZSpyy6aB7fydXzUwCAi3ijwqriE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LbwO4Php; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LbwO4Php"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729399217; x=1760935217;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Kr9UFETjaoTrMNqfSmBgxm2zV/cgNEV4yr54HIiy3iA=;
  b=LbwO4PhpMdSECQv88wVuDw4LX8rGCeI3+F/Aru4o5zZmEsivRjeuzsQE
   k6d+WPkO0cV+i+rJM4l5xH/RiLiJ1/kWTbZ0wBQnDIIcAc2fJKETM3H68
   ocXOttldm+Q6QOWSoZnyZFIvXeNfoQsOuPySxY8V9ehmQIP/ne9Uus61F
   FDLEgRSmWmbLmcEK1fk5SuHnFl5B2u//afgT8wydkIGophL/CqE51zG+b
   qcY+Q8XGWSQ2b6gVoeWh3cjcY8g6hVjInqnrR4HnHtJG5401v5gWUkpQy
   AR1JFypbQ+cgd/LqZ73Jl08bQ8OMoMIaGdNkhSg1eEvoyb8hUx8Xezwi7
   g==;
X-CSE-ConnectionGUID: HuY7VTztSBepQxAskOKjXw==
X-CSE-MsgGUID: ZZngfMI9RAG1rKbDv/bs1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28355994"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="28355994"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 21:40:16 -0700
X-CSE-ConnectionGUID: KF1TWLHYQ3G70X9OP91QLA==
X-CSE-MsgGUID: 0dSvN0tKRPalHMcaaGKErA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="78873307"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Oct 2024 21:40:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Njh-000Ptx-10;
	Sun, 20 Oct 2024 04:40:13 +0000
Date: Sun, 20 Oct 2024 12:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android-mainline 1/1]
 drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of
 'gi->composite.gadget_driver.driver.name'
Message-ID: <202410201230.ZylcHEFR-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   32c1bffe815c9ed746ce7d84cae07da17db6bca4
commit: 957b40b3b769bc23db3d6491db267e3166f91316 [1/1] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
:::::: branch date: 25 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20241019 (https://download.01.org/0day-ci/archive/20241020/202410201230.ZylcHEFR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410201230.ZylcHEFR-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of 'gi->composite.gadget_driver.driver.name'

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
7c07553807c512 Chanh Nguyen              2023-01-11  2048  	kfree(gi->composite.gadget_driver.driver.name);
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
