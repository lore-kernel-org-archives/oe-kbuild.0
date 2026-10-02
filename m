Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E70631F986
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 03:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790912138; cv=none; b=CM3V2VsG2Zruoq6DCqSF9z9p509NIWa8uHItvTTbmurD5numawdHrKGB4AHwPVq3+7b3f/7mliFmD/dISZOr3nl5lyjSOHnf618l53sGI41oeJ1DRr8De4uof2j7IJN+IGhPAkaAqh10FbMiHHVtra1+mA7L39iRI+TXkr/GnTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790912138; c=relaxed/simple;
	bh=TR+NPpBd911RZExzo97SyMIzfTu5TbVdL8d09BAypm4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hWvS+QAAU679Qnhqr886PbR0Hmu7lQIvwF4ReVIsHpe9cIy1+NQ+iZF8OMoP6yG831E+eYuSZSW+dZQRQUN+Uh6VZn6R6TRkmPmvLYmQCFReBddy5KEOMQizMrT7ZqVq8mqq79NT2deW36EHLuJ8SoifDyNjpkSlJ2vb0WjMPiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5xjAl/X; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5xjAl/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790912136; x=1822448136;
  h=date:from:to:cc:subject:message-id;
  bh=TR+NPpBd911RZExzo97SyMIzfTu5TbVdL8d09BAypm4=;
  b=e5xjAl/XckUlFDE3NO2EGg437rYNawZ5p0JhtrE6L0XUfge899ZoaesB
   omZ+VJM2Q+6JHJmt0p0WsI1sIgfBOyYCX+AB1ouZyA0l+tIRluyDwgWlU
   1sJBxzZby+5Yul+p1Rfd2pibiQ4cjs6aa0nk9MeOwX/ZeBsaVwkkMa7DC
   S0rpmpyEM/dyz9Ju1qXThIQVdzG2/QiZhCjkPRvMAEsl5bvwwYh74ak6J
   jnCBWPxmRZUuV8yKEhAd071tm/g57hfGXLcVrMzfSJw1mRmupZ0VgZO55
   dXYsl74VOo1oXl/1MY+Ml/DfsDZoegD6IkRaqux/tvA7ItLdD0OIneu5E
   Q==;
X-CSE-ConnectionGUID: 19SQGbFkSuKduH13NOBNjg==
X-CSE-MsgGUID: Z4FRt5NNRtGPberivsBNkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90448270"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90448270"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 20:35:25 -0700
X-CSE-ConnectionGUID: fU2w9wRFTm+N76uVq7t1tA==
X-CSE-MsgGUID: Xx0jrKI/R5+G30f4WNW5YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="274802742"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Oct 2026 20:35:24 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCU3O-00000000Sbx-11e4;
	Fri, 02 Oct 2026 03:35:22 +0000
Date: Fri, 02 Oct 2026 11:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpio/gpiolib-kunit.c:914:48: warning: implicit
 conversion from 'enum gpio_lookup_flags' to 'enum gpiod_flags'
Message-ID: <202610021118.3YnVbQoU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Bartosz-Golaszewski/gpio-kunit-fix-the-label-of-the-dummy-GPIO-chip/20261001-144053, commit: a3de9e52abf8088aa329337733ae4ad3cdb6f10f"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-kunit-fix-the-label-of-the-dummy-GPIO-chip/20261001-144053
head:   a3de9e52abf8088aa329337733ae4ad3cdb6f10f
commit: a3de9e52abf8088aa329337733ae4ad3cdb6f10f gpio: kunit: add a test case for platform lookup tables
date:   15 hours ago
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: sparc-randconfig-1000-20261002 (https://download.01.org/0day-ci/archive/20261002/202610021118.3YnVbQoU-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021118.3YnVbQoU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021118.3YnVbQoU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpiolib-kunit.c: In function 'gpio_lookup_table_global':
>> drivers/gpio/gpiolib-kunit.c:914:48: warning: implicit conversion from 'enum gpio_lookup_flags' to 'enum gpiod_flags' [-Wenum-conversion]
     914 |         desc = gpiod_get_index(NULL, "foo", 0, GPIO_ACTIVE_HIGH);
         |                                                ^~~~~~~~~~~~~~~~
>> drivers/gpio/gpiolib-kunit.c:897:42: warning: unused variable 'pdata' [-Wunused-variable]
     897 |         struct gpio_test_consumer_pdata *pdata;
         |                                          ^~~~~


vim +914 drivers/gpio/gpiolib-kunit.c

a3de9e52abf808 Bartosz Golaszewski 2026-10-01  894  
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  895  static void gpio_lookup_table_global(struct kunit *test)
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  896  {
a3de9e52abf808 Bartosz Golaszewski 2026-10-01 @897  	struct gpio_test_consumer_pdata *pdata;
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  898  	struct platform_device_info pdevinfo;
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  899  	struct platform_device *pdev;
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  900  	struct gpio_desc *desc;
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  901  	int ret;
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  902  
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  903  	ret = kunit_gpiod_add_lookup_table(test, &gpio_test_lookup_table_global);
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  904  	KUNIT_ASSERT_EQ(test, ret, 0);
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  905  
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  906  	pdevinfo = (struct platform_device_info){
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  907  		.name = GPIO_TEST_PROVIDER,
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  908  		.id = PLATFORM_DEVID_NONE,
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  909  	};
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  910  
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  911  	pdev = kunit_platform_device_register_full(test, &pdevinfo);
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  912  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  913  
a3de9e52abf808 Bartosz Golaszewski 2026-10-01 @914  	desc = gpiod_get_index(NULL, "foo", 0, GPIO_ACTIVE_HIGH);
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  915  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc);
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  916  
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  917  	gpiod_put(desc);
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  918  }
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  919  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
