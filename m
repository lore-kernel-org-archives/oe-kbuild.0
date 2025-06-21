Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B996229405
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Jun 2025 00:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750467163; cv=none; b=lJKnU7uocyCqbECb4tDyG6xlJZUQ6PZ1dJujjI5gelIyqnKLv895VZDefQoqcLYFve2BrYFzfi9RDdoO2sD1dX0SGQKRUDeDPVnDK+Tse0H7HGZxjp7SVhyx22Lh7mrqewkTQj8e0VVghDK7ZuomQYEqpaSg8Yab9lom24Rdn7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750467163; c=relaxed/simple;
	bh=dImg2YI0v/2EJGOyvqVXTf39lgp+6blS5zdcSsrxZo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XjBS3aOLr0jFrykQs0Hh3I31mQyYp0bIg4UtfkZ+DfXVX85Xs+h6GAuougNLsUl5cV2VADoDqdz6qW5nuhbwd0s+Lcn8oK+wJjHUORIKwdU+kME42J2+I+3xHtAg2ZGparMVJhSF05q5CdGZRBltff7CeE16/JERhUICCflCohQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9nZc85y; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9nZc85y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750467161; x=1782003161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dImg2YI0v/2EJGOyvqVXTf39lgp+6blS5zdcSsrxZo8=;
  b=m9nZc85yUSzY05GOdFWi7A98B3Gb7X58urorD5ExS3UEaL0rJuL0EXFd
   RbP5ylJ7Y15LrKcFzzL+lhhD9r01mfOVmyaAUH1DO+okRWzOZia9LEN51
   CVPNeAcUCZQF9RERKs8k3KYNPETD15MKdASYbD1616txiXjGeWFSwXTpn
   v7iIu5SmyGwZ9gXFcC6RCP6F1zkjb+j14J87aT4vdHsCoqULEx/kI5Itm
   QqF8Mp8yGGzp8yvW5IMCgT+iF0ixNhyUxHng3yZecg0rJRDSUWwsFvFIY
   wBYVCC4jXrNX6LDt7b/Q1jJNK8QPvPm1HGy9+eJBhl8osSN0C2yD/o6QB
   g==;
X-CSE-ConnectionGUID: XtELfoF3T0WWZ6CHPSctlw==
X-CSE-MsgGUID: 2ppEEuFUQ3WYH77P+3LrwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63787008"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="63787008"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 17:52:40 -0700
X-CSE-ConnectionGUID: vxRxKRScSpWadXwsc1yKdw==
X-CSE-MsgGUID: lRVYo/QeQ3+MJ9Gg4drMmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="151187271"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jun 2025 17:52:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSmTE-000MG5-3B;
	Sat, 21 Jun 2025 00:52:36 +0000
Date: Sat, 21 Jun 2025 08:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 4297/4336]
 drivers/gpio/gpiolib-sysfs.c:785:17-21: ERROR: reference preceded by free on
 line 784
Message-ID: <202506210804.m4CZ8Q5h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5d4809e25903ab8e74034c1f23c787fd26d52934
commit: fd19792851db77e74cff4e2dc772d25a83cdc34d [4297/4336] gpio: sysfs: remove the mockdev pointer from struct gpio_device
:::::: branch date: 13 hours ago
:::::: commit date: 17 hours ago
config: s390-randconfig-r053-20250621 (https://download.01.org/0day-ci/archive/20250621/202506210804.m4CZ8Q5h-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506210804.m4CZ8Q5h-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpio/gpiolib-sysfs.c:785:17-21: ERROR: reference preceded by free on line 784

vim +785 drivers/gpio/gpiolib-sysfs.c

0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  738  
afbc4f312b5e6e Linus Walleij       2016-02-09  739  int gpiochip_sysfs_register(struct gpio_device *gdev)
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  740  {
fd19792851db77 Bartosz Golaszewski 2025-06-10  741  	struct gpiodev_data *data;
d83cee3d2bb131 Bartosz Golaszewski 2024-01-23  742  	struct gpio_chip *chip;
513246a34b8dc5 Bartosz Golaszewski 2023-12-21  743  	struct device *parent;
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  744  
426577bd8846d6 Johan Hovold        2015-05-04  745  	/*
426577bd8846d6 Johan Hovold        2015-05-04  746  	 * Many systems add gpio chips for SOC support very early,
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  747  	 * before driver model support is available.  In those cases we
426577bd8846d6 Johan Hovold        2015-05-04  748  	 * register later, in gpiolib_sysfs_init() ... here we just
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  749  	 * verify that _some_ field of gpio_class got initialized.
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  750  	 */
6f14c02220c791 Greg Kroah-Hartman  2023-03-31  751  	if (!class_is_registered(&gpio_class))
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  752  		return 0;
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  753  
d83cee3d2bb131 Bartosz Golaszewski 2024-01-23  754  	guard(srcu)(&gdev->srcu);
d83cee3d2bb131 Bartosz Golaszewski 2024-01-23  755  
d82b9e0887e69d Bartosz Golaszewski 2024-02-14  756  	chip = srcu_dereference(gdev->chip, &gdev->srcu);
d83cee3d2bb131 Bartosz Golaszewski 2024-01-23  757  	if (!chip)
d83cee3d2bb131 Bartosz Golaszewski 2024-01-23  758  		return -ENODEV;
d83cee3d2bb131 Bartosz Golaszewski 2024-01-23  759  
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  760  	/*
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  761  	 * For sysfs backward compatibility we need to preserve this
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  762  	 * preferred parenting to the gpio_chip parent field, if set.
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  763  	 */
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  764  	if (chip->parent)
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  765  		parent = chip->parent;
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  766  	else
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  767  		parent = &gdev->dev;
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  768  
fd19792851db77 Bartosz Golaszewski 2025-06-10  769  	data = kmalloc(sizeof(*data), GFP_KERNEL);
fd19792851db77 Bartosz Golaszewski 2025-06-10  770  	if (!data)
fd19792851db77 Bartosz Golaszewski 2025-06-10  771  		return -ENOMEM;
fd19792851db77 Bartosz Golaszewski 2025-06-10  772  
fd19792851db77 Bartosz Golaszewski 2025-06-10  773  	data->gdev = gdev;
3ff74be5c1a72d Johan Hovold        2015-05-04  774  
f4af1671c28854 Bartosz Golaszewski 2024-10-31  775  	guard(mutex)(&sysfs_lock);
fd19792851db77 Bartosz Golaszewski 2025-06-10  776  
fd19792851db77 Bartosz Golaszewski 2025-06-10  777  	/* use chip->base for the ID; it's already known to be unique */
fd19792851db77 Bartosz Golaszewski 2025-06-10  778  	data->cdev_base = device_create_with_groups(&gpio_class, parent,
fd19792851db77 Bartosz Golaszewski 2025-06-10  779  						    MKDEV(0, 0), data,
fd19792851db77 Bartosz Golaszewski 2025-06-10  780  						    gpiochip_groups,
fd19792851db77 Bartosz Golaszewski 2025-06-10  781  						    GPIOCHIP_NAME "%d",
fd19792851db77 Bartosz Golaszewski 2025-06-10  782  						    chip->base);
fd19792851db77 Bartosz Golaszewski 2025-06-10  783  	if (IS_ERR(data->cdev_base)) {
fd19792851db77 Bartosz Golaszewski 2025-06-10 @784  		kfree(data);
fd19792851db77 Bartosz Golaszewski 2025-06-10 @785  		return PTR_ERR(data->cdev_base);
fd19792851db77 Bartosz Golaszewski 2025-06-10  786  	}
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  787  
6a4b6b0a3b55f2 Johan Hovold        2015-05-04  788  	return 0;
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  789  }
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  790  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
