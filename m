Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F19D4C91
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 03:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732938118; cv=none; b=KQ3ayHxnmw1oS5yHo6qtfUrLJInUgFjm8MYwMu1+OyYQ2IYt0oWQI0YdWQuc1EWskMZwpl/4mah8vCyYPjSurbS6OmlEubLuc/Fu6tE5b/zE8JagbPR8ysKMnumMIUIrDAeF0h9PriG872rCweJqSUA+rmkjZWY/A8Yh4jDsIRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732938118; c=relaxed/simple;
	bh=Oc2gLnIDZZqOFCBeOd4NItvgGfwuqN0AASko1BxkibI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PMLvJAFqcLQA4dmEFpj3HhIu7Tkb3mwAUoQV7kX/x+FWBWIhZFchX/CSNo/eKyafW+Uv+KbFkULij3z5+twUSsz593kNmJGdY/KJC12MmE1k15tjJHWf/daC4N0/us4r2xQdJQN1bKFah9hy7iWTESWrvr071pzT1QqQcD19ES4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbH0n68g; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbH0n68g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732938115; x=1764474115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oc2gLnIDZZqOFCBeOd4NItvgGfwuqN0AASko1BxkibI=;
  b=JbH0n68g+nJm9bya1oE1Yq0+hmWUPskgdZkHoxdEMeDaZ1x/T8Yd7Shb
   YsfnR6cgxhdhhPV64hIcvIuSXkd/G7Bu1cF+9m52+8T0cOYyrjakgleIR
   Fbm3ba7GI2+OjTGrPDv2Gf/vKbNA7ZoSwSFCSHNeFTemzZ4YWVhDembJJ
   57SwPHDdcytrohz8Fdjf/+2UafQ2N8lAN8FnwsRM1uAF3ZfnHSTElUsOi
   EXcjA/WXG+pyBdlQpOa/Rwo00t4Ozrr++P5FXzNrHtabz+qlZt8o4M3tb
   2js63nrL7AuGwc7VAo3mdXKPdQIrj4vlHexjkJcf/b+AxEwDZibXdvw7z
   w==;
X-CSE-ConnectionGUID: WalryGxxRHaeH2c0iBQNkw==
X-CSE-MsgGUID: MyeyGsfeSWKwyge6KoPurQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="32917973"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="32917973"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 19:41:55 -0800
X-CSE-ConnectionGUID: 6gkzAXBCSFa2I/RJHZP2uQ==
X-CSE-MsgGUID: 0sVaRS1BQii9tOcxsqrmJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92939117"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Nov 2024 19:41:53 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHEMh-00003n-1B;
	Sat, 30 Nov 2024 03:41:51 +0000
Date: Sat, 30 Nov 2024 11:41:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2483/2483] drivers/gpio/gpiolib.c:797
 gpiochip_add_data_with_key() error: dereferencing freed memory 'gdev' (line
 795)
Message-ID: <202411301126.OTCJrphe-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: He Yujie <coka.heyujie@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   904d8467526c1be69cb1155ef1391f777d99d0cb
commit: aa1e2bfdc899e89efc51fb9364fc0e8227db24b1 [2483/2483] gpiolib: fix memory leak in gpiochip_setup_dev()
:::::: branch date: 2 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20241126 (https://download.01.org/0day-ci/archive/20241130/202411301126.OTCJrphe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411301126.OTCJrphe-lkp@intel.com/

New smatch warnings:
drivers/gpio/gpiolib.c:797 gpiochip_add_data_with_key() error: dereferencing freed memory 'gdev' (line 795)

Old smatch warnings:
drivers/gpio/gpiolib.c:4135 fwnode_get_named_gpiod() error: 'desc' dereferencing possible ERR_PTR()
drivers/gpio/gpiolib.c:4287 gpiod_get_array() warn: potentially one past the end of array 'descs->desc[count]'
drivers/gpio/gpiolib.c:4287 gpiod_get_array() warn: potentially one past the end of array 'descs->desc[count]'

vim +/gdev +797 drivers/gpio/gpiolib.c

f23f1516b6757c Shiraz Hashim       2012-10-27  697  
7cba1a4d5e1628 Bartosz Golaszewski 2020-09-09  698  	if (gc->names)
a0b66a73785ccc Linus Walleij       2020-03-29  699  		ret = gpiochip_set_desc_names(gc);
7cba1a4d5e1628 Bartosz Golaszewski 2020-09-09  700  	else
7cba1a4d5e1628 Bartosz Golaszewski 2020-09-09  701  		ret = devprop_gpiochip_set_names(gc);
d377f56f34f5bc Linus Walleij       2019-07-16  702  	if (ret)
5f3ca7329b049b Markus Pargmann     2015-08-14  703  		goto err_remove_from_list;
5f3ca7329b049b Markus Pargmann     2015-08-14  704  
a0b66a73785ccc Linus Walleij       2020-03-29  705  	ret = gpiochip_alloc_valid_mask(gc);
d377f56f34f5bc Linus Walleij       2019-07-16  706  	if (ret)
48057ed1840fde Linus Walleij       2019-08-20  707  		goto err_remove_from_list;
e0d89728981393 Thierry Reding      2017-11-07  708  
a0b66a73785ccc Linus Walleij       2020-03-29  709  	ret = of_gpiochip_add(gc);
d377f56f34f5bc Linus Walleij       2019-07-16  710  	if (ret)
48057ed1840fde Linus Walleij       2019-08-20  711  		goto err_free_gpiochip_mask;
28355f81969962 Tomeu Vizoso        2015-07-14  712  
a0b66a73785ccc Linus Walleij       2020-03-29  713  	ret = gpiochip_init_valid_mask(gc);
d377f56f34f5bc Linus Walleij       2019-07-16  714  	if (ret)
357798909164bf Geert Uytterhoeven  2019-04-24  715  		goto err_remove_of_chip;
f8ec92a9f63b3b Ricardo Ribalda     2018-10-05  716  
a0b66a73785ccc Linus Walleij       2020-03-29  717  	for (i = 0; i < gc->ngpio; i++) {
3edfb7bd76bd1c Ricardo Ribalda     2018-10-05  718  		struct gpio_desc *desc = &gdev->descs[i];
3edfb7bd76bd1c Ricardo Ribalda     2018-10-05  719  
a0b66a73785ccc Linus Walleij       2020-03-29  720  		if (gc->get_direction && gpiochip_line_is_valid(gc, i)) {
4fc5bfeb4b7d83 Andy Shevchenko     2019-12-04  721  			assign_bit(FLAG_IS_OUT,
a0b66a73785ccc Linus Walleij       2020-03-29  722  				   &desc->flags, !gc->get_direction(gc, i));
d95da993383c78 Chris Packham       2019-07-08  723  		} else {
4fc5bfeb4b7d83 Andy Shevchenko     2019-12-04  724  			assign_bit(FLAG_IS_OUT,
a0b66a73785ccc Linus Walleij       2020-03-29  725  				   &desc->flags, !gc->direction_input);
d95da993383c78 Chris Packham       2019-07-08  726  		}
3edfb7bd76bd1c Ricardo Ribalda     2018-10-05  727  	}
3edfb7bd76bd1c Ricardo Ribalda     2018-10-05  728  
a0b66a73785ccc Linus Walleij       2020-03-29  729  	ret = gpiochip_add_pin_ranges(gc);
b056ca1c2f01b2 Andy Shevchenko     2019-11-04  730  	if (ret)
b056ca1c2f01b2 Andy Shevchenko     2019-11-04  731  		goto err_remove_of_chip;
b056ca1c2f01b2 Andy Shevchenko     2019-11-04  732  
a0b66a73785ccc Linus Walleij       2020-03-29  733  	acpi_gpiochip_add(gc);
391c970c0dd110 Anton Vorontsov     2010-06-08  734  
a0b66a73785ccc Linus Walleij       2020-03-29  735  	machine_gpiochip_add(gc);
a411e81e61df24 Bartosz Golaszewski 2018-04-10  736  
a0b66a73785ccc Linus Walleij       2020-03-29  737  	ret = gpiochip_irqchip_init_valid_mask(gc);
9411e3aaa6342e Andy Shevchenko     2019-10-09  738  	if (ret)
81a271c12c6d58 Bartosz Golaszewski 2024-02-29  739  		goto err_free_hogs;
9411e3aaa6342e Andy Shevchenko     2019-10-09  740  
a0b66a73785ccc Linus Walleij       2020-03-29  741  	ret = gpiochip_irqchip_init_hw(gc);
fbdf8d4bef4917 Linus Walleij       2019-09-06  742  	if (ret)
81a271c12c6d58 Bartosz Golaszewski 2024-02-29  743  		goto err_remove_irqchip_mask;
48057ed1840fde Linus Walleij       2019-08-20  744  
a0b66a73785ccc Linus Walleij       2020-03-29  745  	ret = gpiochip_add_irqchip(gc, lock_key, request_key);
fbdf8d4bef4917 Linus Walleij       2019-09-06  746  	if (ret)
48057ed1840fde Linus Walleij       2019-08-20  747  		goto err_remove_irqchip_mask;
48057ed1840fde Linus Walleij       2019-08-20  748  
3c702e9987e261 Linus Walleij       2015-10-21  749  	/*
3c702e9987e261 Linus Walleij       2015-10-21  750  	 * By first adding the chardev, and then adding the device,
3c702e9987e261 Linus Walleij       2015-10-21  751  	 * we get a device node entry in sysfs under
3c702e9987e261 Linus Walleij       2015-10-21  752  	 * /sys/bus/gpio/devices/gpiochipN/dev that can be used for
3c702e9987e261 Linus Walleij       2015-10-21  753  	 * coldplug of device nodes and other udev business.
159f3cd92f17c6 Guenter Roeck       2016-03-31  754  	 * We can do this only if gpiolib has been initialized.
159f3cd92f17c6 Guenter Roeck       2016-03-31  755  	 * Otherwise, defer until later.
3c702e9987e261 Linus Walleij       2015-10-21  756  	 */
159f3cd92f17c6 Guenter Roeck       2016-03-31  757  	if (gpiolib_initialized) {
d377f56f34f5bc Linus Walleij       2019-07-16  758  		ret = gpiochip_setup_dev(gdev);
d377f56f34f5bc Linus Walleij       2019-07-16  759  		if (ret)
48057ed1840fde Linus Walleij       2019-08-20  760  			goto err_remove_irqchip;
159f3cd92f17c6 Guenter Roeck       2016-03-31  761  	}
cedb1881ba32f7 Anton Vorontsov     2010-06-08  762  	return 0;
3bae4811fb6d0b Zhangfei Gao        2013-06-09  763  
48057ed1840fde Linus Walleij       2019-08-20  764  err_remove_irqchip:
a0b66a73785ccc Linus Walleij       2020-03-29  765  	gpiochip_irqchip_remove(gc);
48057ed1840fde Linus Walleij       2019-08-20  766  err_remove_irqchip_mask:
a0b66a73785ccc Linus Walleij       2020-03-29  767  	gpiochip_irqchip_free_valid_mask(gc);
81a271c12c6d58 Bartosz Golaszewski 2024-02-29  768  err_free_hogs:
81a271c12c6d58 Bartosz Golaszewski 2024-02-29  769  	gpiochip_free_hogs(gc);
a0b66a73785ccc Linus Walleij       2020-03-29  770  	acpi_gpiochip_remove(gc);
d66cff1dd8b0ca Andy Shevchenko     2024-02-21  771  	gpiochip_remove_pin_ranges(gc);
357798909164bf Geert Uytterhoeven  2019-04-24  772  err_remove_of_chip:
a0b66a73785ccc Linus Walleij       2020-03-29  773  	of_gpiochip_remove(gc);
357798909164bf Geert Uytterhoeven  2019-04-24  774  err_free_gpiochip_mask:
a0b66a73785ccc Linus Walleij       2020-03-29  775  	gpiochip_free_valid_mask(gc);
aa1e2bfdc899e8 Zeng Heng           2024-11-03  776  	if (gdev->dev.release) {
aa1e2bfdc899e8 Zeng Heng           2024-11-03  777  		/* release() has been registered by gpiochip_setup_dev() */
aa1e2bfdc899e8 Zeng Heng           2024-11-03  778  		put_device(&gdev->dev);
aa1e2bfdc899e8 Zeng Heng           2024-11-03  779  		goto err_print_message;
aa1e2bfdc899e8 Zeng Heng           2024-11-03  780  	}
5f3ca7329b049b Markus Pargmann     2015-08-14  781  err_remove_from_list:
225fce83cb72e1 Johan Hovold        2015-01-12  782  	spin_lock_irqsave(&gpio_lock, flags);
ff2b1359229927 Linus Walleij       2015-10-20  783  	list_del(&gdev->list);
3bae4811fb6d0b Zhangfei Gao        2013-06-09  784  	spin_unlock_irqrestore(&gpio_lock, flags);
476e2fc5cd430b Guenter Roeck       2016-03-31  785  err_free_label:
fcf273e5807976 Bartosz Golaszewski 2017-12-14  786  	kfree_const(gdev->label);
476e2fc5cd430b Guenter Roeck       2016-03-31  787  err_free_descs:
476e2fc5cd430b Guenter Roeck       2016-03-31  788  	kfree(gdev->descs);
0dc6680f9a5932 Quanyang Wang       2021-02-19  789  err_free_dev_name:
0dc6680f9a5932 Quanyang Wang       2021-02-19  790  	kfree(dev_name(&gdev->dev));
a05a1404999959 Vladimir Zapolskiy  2018-11-02  791  err_free_ida:
8d4a85b6abd3cd Bartosz Golaszewski 2020-09-08  792  	ida_free(&gpio_ida, gdev->id);
a05a1404999959 Vladimir Zapolskiy  2018-11-02  793  err_free_gdev:
aa1e2bfdc899e8 Zeng Heng           2024-11-03  794  	kfree(gdev);
aa1e2bfdc899e8 Zeng Heng           2024-11-03 @795  err_print_message:
d2876d08d86f22 David Brownell      2008-02-04  796  	/* failures here can mean systems won't boot... */
1777fc97302997 Marcel Ziswiler     2018-07-20 @797  	pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
aa1e2bfdc899e8 Zeng Heng           2024-11-03  798  	       base, base + gdev->ngpio - 1,
a0b66a73785ccc Linus Walleij       2020-03-29  799  	       gc->label ? : "generic", ret);
d377f56f34f5bc Linus Walleij       2019-07-16  800  	return ret;
d2876d08d86f22 David Brownell      2008-02-04  801  }
959bc7b22bd25a Thierry Reding      2017-11-07  802  EXPORT_SYMBOL_GPL(gpiochip_add_data_with_key);
d2876d08d86f22 David Brownell      2008-02-04  803  

:::::: The code at line 797 was first introduced by commit
:::::: 1777fc97302997f016b720fea9c4d0e1ad858f56 gpiolib: probe deferral error reporting

:::::: TO: Marcel Ziswiler <marcel.ziswiler@toradex.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
