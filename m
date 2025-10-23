Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFC04CB5B
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 06:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761199266; cv=none; b=A4g8vpJJ6SWTA6sHtFyOI8tSXidJ6eHUYOtOXtG0Qk8txBgfP2eb+OFOGofHz2B7LuglpRciFy2559bwIKSiE9os7vKENomqKXU/j2WbK0i0WXhD/no9osUbaWSlD/RGJOUw3cIyC/erDj2JRKC6Io3m3YgaaJNyXjt/GecjEEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761199266; c=relaxed/simple;
	bh=DMPKegijgS1/weUjhEVmtku1eOyYcC4rdU3BJe32arg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=POBSwp17D1XqIZe5AgJ3y6XCdAsGrrTPaun2CMpmxZ/iOZwB4V2CMKqn/aGBAMNa1mLo3PslOLmeqzLs51ZWhZSIWHmbozwBWKBqT7SbWMMN6PJXXcN0FasabS86ZI78SUcoM9C2FCtz00ZMS87WFbWyMHSk/6KK1vPfkdo65SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHDJk6KS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHDJk6KS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761199264; x=1792735264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DMPKegijgS1/weUjhEVmtku1eOyYcC4rdU3BJe32arg=;
  b=XHDJk6KS+yCKaarNGYvpM0lFNGwWALWyoSBa1aiK/id5wBdtc/Yzjj/O
   dIdb7VZVXZyVKgMZ/0pyjetPT9kEwl3CHPHMQ/TmLrQtlsX33OiAXpKHY
   O3tABzHuEcLNEV6Zhe/Inb5XCgKDUCuDIJ6owX7sbDf9TWdpfiexV7vkj
   0v+ANMKQFQjLmaRQy6Gbbx32YdjI4YB/zT69WfP5/smdnmK5ebQ4hgbdC
   0D2Wv9MGKtQBGxuBMp0wsqZ4ysfKT4TqzU/i4mmI8NgcnulzP7z7R0mcO
   kZk29xn5v51pmBz/3WurzaFY46SrgB+5BXCG49pVb9eZDcqHkaR1IfSoK
   A==;
X-CSE-ConnectionGUID: +0TWXZK4Ty+neEw7F/wr9g==
X-CSE-MsgGUID: cz/0SalsTk+77LUHNTs9CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74704633"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="74704633"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 23:01:04 -0700
X-CSE-ConnectionGUID: FnYC/a8SR+m17uBLRQHmBg==
X-CSE-MsgGUID: vnGfY8u4Tam8OYPyrTc7dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183768562"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Oct 2025 23:01:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBoNg-000D5F-12;
	Thu, 23 Oct 2025 06:01:00 +0000
Date: Thu, 23 Oct 2025 14:00:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpio/gpiolib-acpi-core.c:379:8-15: WARNING: Consider using
 %pe to print PTR_ERR()
Message-ID: <202510231350.calxvXIm-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>

Hi Andy,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   43e9ad0c55a369ecc84a4788d06a8a6bfa634f1c
commit: 92dc572852ddcae687590cb159189004d58e382e gpiolib: acpi: Move quirks to a separate file
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-104-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231350.calxvXIm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510231350.calxvXIm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpio/gpiolib-acpi-core.c:379:8-15: WARNING: Consider using %pe to print PTR_ERR()

vim +379 drivers/gpio/gpiolib-acpi-core.c

2ccb21f5516afe drivers/gpio/gpiolib-acpi.c Hans de Goede      2020-03-02  334  
d4fc46f1739d2e drivers/gpio/gpiolib-acpi.c Hans de Goede      2019-11-14  335  /* Always returns AE_OK so that we keep looping over the resources */
e59f5e08ece106 drivers/gpio/gpiolib-acpi.c Hans de Goede      2018-11-28  336  static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  337  					     void *context)
0d1c28a449c6c2 drivers/gpio/gpiolib-acpi.c Mathias Nyman      2013-01-28  338  {
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  339  	struct acpi_gpio_chip *acpi_gpio = context;
aa92b6f689acf1 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  340  	struct gpio_chip *chip = acpi_gpio->chip;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  341  	struct acpi_resource_gpio *agpio;
7fc7acb9a0b0ff drivers/gpio/gpiolib-acpi.c Rafael J. Wysocki  2013-04-09  342  	acpi_handle handle, evt_handle;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  343  	struct acpi_gpio_event *event;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  344  	irq_handler_t handler = NULL;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  345  	struct gpio_desc *desc;
0c2cae09a765b1 drivers/gpio/gpiolib-acpi.c Andy Shevchenko    2022-03-17  346  	unsigned int pin;
0c2cae09a765b1 drivers/gpio/gpiolib-acpi.c Andy Shevchenko    2022-03-17  347  	int ret, irq;
0d1c28a449c6c2 drivers/gpio/gpiolib-acpi.c Mathias Nyman      2013-01-28  348  
25e3ef894eef41 drivers/gpio/gpiolib-acpi.c Andy Shevchenko    2017-05-23  349  	if (!acpi_gpio_get_irq_resource(ares, &agpio))
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  350  		return AE_OK;
0d1c28a449c6c2 drivers/gpio/gpiolib-acpi.c Mathias Nyman      2013-01-28  351  
58383c78425e4e drivers/gpio/gpiolib-acpi.c Linus Walleij      2015-11-04  352  	handle = ACPI_HANDLE(chip->parent);
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  353  	pin = agpio->pin_table[0];
0d1c28a449c6c2 drivers/gpio/gpiolib-acpi.c Mathias Nyman      2013-01-28  354  
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  355  	if (pin <= 255) {
213d266ebfb162 drivers/gpio/gpiolib-acpi.c Linus Torvalds     2022-03-19  356  		char ev_name[8];
213d266ebfb162 drivers/gpio/gpiolib-acpi.c Linus Torvalds     2022-03-19  357  		sprintf(ev_name, "_%c%02X",
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  358  			agpio->triggering == ACPI_EDGE_SENSITIVE ? 'E' : 'L',
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  359  			pin);
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  360  		if (ACPI_SUCCESS(acpi_get_handle(handle, ev_name, &evt_handle)))
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  361  			handler = acpi_gpio_irq_handler;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  362  	}
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  363  	if (!handler) {
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  364  		if (ACPI_SUCCESS(acpi_get_handle(handle, "_EVT", &evt_handle)))
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  365  			handler = acpi_gpio_irq_handler_evt;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  366  	}
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  367  	if (!handler)
c06632ea054c49 drivers/gpio/gpiolib-acpi.c Hans de Goede      2017-06-23  368  		return AE_OK;
0d1c28a449c6c2 drivers/gpio/gpiolib-acpi.c Mathias Nyman      2013-01-28  369  
b24fd5bc8e6d6b drivers/gpio/gpiolib-acpi.c Andy Shevchenko    2025-05-13  370  	if (acpi_gpio_in_ignore_list(ACPI_GPIO_IGNORE_INTERRUPT, dev_name(chip->parent), pin)) {
5fb36a8c87d9e9 drivers/gpio/gpiolib-acpi.c Hans de Goede      2023-09-09  371  		dev_info(chip->parent, "Ignoring interrupt on pin %u\n", pin);
5fb36a8c87d9e9 drivers/gpio/gpiolib-acpi.c Hans de Goede      2023-09-09  372  		return AE_OK;
5fb36a8c87d9e9 drivers/gpio/gpiolib-acpi.c Hans de Goede      2023-09-09  373  	}
5fb36a8c87d9e9 drivers/gpio/gpiolib-acpi.c Hans de Goede      2023-09-09  374  
2e2b496cebefb9 drivers/gpio/gpiolib-acpi.c Andy Shevchenko    2020-11-11  375  	desc = acpi_request_own_gpiod(chip, agpio, 0, "ACPI:Event");
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  376  	if (IS_ERR(desc)) {
3f86a7e090d1df drivers/gpio/gpiolib-acpi.c Hans de Goede      2019-11-14  377  		dev_err(chip->parent,
3f86a7e090d1df drivers/gpio/gpiolib-acpi.c Hans de Goede      2019-11-14  378  			"Failed to request GPIO for pin 0x%04X, err %ld\n",
3f86a7e090d1df drivers/gpio/gpiolib-acpi.c Hans de Goede      2019-11-14 @379  			pin, PTR_ERR(desc));
d4fc46f1739d2e drivers/gpio/gpiolib-acpi.c Hans de Goede      2019-11-14  380  		return AE_OK;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  381  	}
0d1c28a449c6c2 drivers/gpio/gpiolib-acpi.c Mathias Nyman      2013-01-28  382  
e3a2e87893125b drivers/gpio/gpiolib-acpi.c Alexandre Courbot  2014-10-23  383  	ret = gpiochip_lock_as_irq(chip, pin);
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  384  	if (ret) {
3f86a7e090d1df drivers/gpio/gpiolib-acpi.c Hans de Goede      2019-11-14  385  		dev_err(chip->parent,
3f86a7e090d1df drivers/gpio/gpiolib-acpi.c Hans de Goede      2019-11-14  386  			"Failed to lock GPIO pin 0x%04X as interrupt, err %d\n",
3f86a7e090d1df drivers/gpio/gpiolib-acpi.c Hans de Goede      2019-11-14  387  			pin, ret);
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  388  		goto fail_free_desc;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  389  	}
7fc7acb9a0b0ff drivers/gpio/gpiolib-acpi.c Rafael J. Wysocki  2013-04-09  390  
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  391  	irq = gpiod_to_irq(desc);
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  392  	if (irq < 0) {
3f86a7e090d1df drivers/gpio/gpiolib-acpi.c Hans de Goede      2019-11-14  393  		dev_err(chip->parent,
3f86a7e090d1df drivers/gpio/gpiolib-acpi.c Hans de Goede      2019-11-14  394  			"Failed to translate GPIO pin 0x%04X to IRQ, err %d\n",
3f86a7e090d1df drivers/gpio/gpiolib-acpi.c Hans de Goede      2019-11-14  395  			pin, irq);
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  396  		goto fail_unlock_irq;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  397  	}
7fc7acb9a0b0ff drivers/gpio/gpiolib-acpi.c Rafael J. Wysocki  2013-04-09  398  
e59f5e08ece106 drivers/gpio/gpiolib-acpi.c Hans de Goede      2018-11-28  399  	event = kzalloc(sizeof(*event), GFP_KERNEL);
e59f5e08ece106 drivers/gpio/gpiolib-acpi.c Hans de Goede      2018-11-28  400  	if (!event)
e59f5e08ece106 drivers/gpio/gpiolib-acpi.c Hans de Goede      2018-11-28  401  		goto fail_unlock_irq;
e59f5e08ece106 drivers/gpio/gpiolib-acpi.c Hans de Goede      2018-11-28  402  
e59f5e08ece106 drivers/gpio/gpiolib-acpi.c Hans de Goede      2018-11-28  403  	event->irqflags = IRQF_ONESHOT;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  404  	if (agpio->triggering == ACPI_LEVEL_SENSITIVE) {
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  405  		if (agpio->polarity == ACPI_ACTIVE_HIGH)
e59f5e08ece106 drivers/gpio/gpiolib-acpi.c Hans de Goede      2018-11-28  406  			event->irqflags |= IRQF_TRIGGER_HIGH;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  407  		else
e59f5e08ece106 drivers/gpio/gpiolib-acpi.c Hans de Goede      2018-11-28  408  			event->irqflags |= IRQF_TRIGGER_LOW;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  409  	} else {
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  410  		switch (agpio->polarity) {
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  411  		case ACPI_ACTIVE_HIGH:
e59f5e08ece106 drivers/gpio/gpiolib-acpi.c Hans de Goede      2018-11-28  412  			event->irqflags |= IRQF_TRIGGER_RISING;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  413  			break;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  414  		case ACPI_ACTIVE_LOW:
e59f5e08ece106 drivers/gpio/gpiolib-acpi.c Hans de Goede      2018-11-28  415  			event->irqflags |= IRQF_TRIGGER_FALLING;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  416  			break;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  417  		default:
e59f5e08ece106 drivers/gpio/gpiolib-acpi.c Hans de Goede      2018-11-28  418  			event->irqflags |= IRQF_TRIGGER_RISING |
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  419  					   IRQF_TRIGGER_FALLING;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  420  			break;
7fc7acb9a0b0ff drivers/gpio/gpiolib-acpi.c Rafael J. Wysocki  2013-04-09  421  		}
7fc7acb9a0b0ff drivers/gpio/gpiolib-acpi.c Rafael J. Wysocki  2013-04-09  422  	}
aa92b6f689acf1 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  423  
4b01a14bac7335 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  424  	event->handle = evt_handle;
e59f5e08ece106 drivers/gpio/gpiolib-acpi.c Hans de Goede      2018-11-28  425  	event->handler = handler;
4b01a14bac7335 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  426  	event->irq = irq;
2ccb21f5516afe drivers/gpio/gpiolib-acpi.c Hans de Goede      2020-03-02  427  	event->irq_is_wake = acpi_gpio_irq_is_wake(chip->parent, agpio);
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  428  	event->pin = pin;
e46cf32ced90d0 drivers/gpio/gpiolib-acpi.c Alexandre Courbot  2014-08-19  429  	event->desc = desc;
0d1c28a449c6c2 drivers/gpio/gpiolib-acpi.c Mathias Nyman      2013-01-28  430  
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  431  	list_add_tail(&event->node, &acpi_gpio->events);
ca876c7483b697 drivers/gpio/gpiolib-acpi.c Benjamin Tissoires 2018-07-12  432  
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  433  	return AE_OK;
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  434  
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  435  fail_unlock_irq:
e3a2e87893125b drivers/gpio/gpiolib-acpi.c Alexandre Courbot  2014-10-23  436  	gpiochip_unlock_as_irq(chip, pin);
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  437  fail_free_desc:
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  438  	gpiochip_free_own_desc(desc);
6072b9dcf97870 drivers/gpio/gpiolib-acpi.c Mika Westerberg    2014-03-10  439  
d4fc46f1739d2e drivers/gpio/gpiolib-acpi.c Hans de Goede      2019-11-14  440  	return AE_OK;
0d1c28a449c6c2 drivers/gpio/gpiolib-acpi.c Mathias Nyman      2013-01-28  441  }
7fc7acb9a0b0ff drivers/gpio/gpiolib-acpi.c Rafael J. Wysocki  2013-04-09  442  

:::::: The code at line 379 was first introduced by commit
:::::: 3f86a7e090d1dfb974a9dc9d44049f9bff01e6a5 gpiolib: acpi: Print pin number on acpi_gpiochip_alloc_event errors

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
