Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E19D39FEB
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 22:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706741377; cv=none; b=CLvq6Q9Ys6atXWvLjI4iPnL1y9+0xkJB91Nx749USmV99BhIOKTBqa0t0PUKbVlCljp/cj3+/PXh36M4TXGVyJ7YJ6lauNBCxtuaEs281JBOHv7q+nv5XWAK2/Bxg37uQb+WXedpNkAR94fRIguANZeLCrBwVAqMPt0jyKEbyok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706741377; c=relaxed/simple;
	bh=Do6PhPGFDGuOh9F6rlKnvuKbQ6moCOAQcnmVXYTW9UI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KPMQJ87LRLbZUSNMnuFp0UTibfIszNI04qlRuMTEok1ewgQp9Kmu8wOH3K2X+/npUYiv1Ybi1xOcOU1GIl+GjnXI7ptS6XaXWgS9qWqj1DiORKD+F32icdAGKlbi6NBk871tY8RlNo6yO0y0t9IOczwcmTy1wdgl3dRo3PfzSGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5BlmxAh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5BlmxAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706741375; x=1738277375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Do6PhPGFDGuOh9F6rlKnvuKbQ6moCOAQcnmVXYTW9UI=;
  b=n5BlmxAhMmh2S+XedaFi0MN8QhTWMKOrMiGFdycL0zm0q7XXePW0Alnb
   l5uxcpROHsdFQamMxnipYtoG9/3u4AUdjBysEe5HuFQyhW2tjP68Q4xMC
   r0MUW8PQLuHLB0UEhBN1c8/2f1lw3RgaLNiIS3Mm/LYgBVwFUa2ZFpXvd
   S6hEniefTOd0/xnUEHqFJ7Yi5yDT67aby+mhJ5Pv/Df9v2Q/h+s3BoaoE
   aKOYswriLQdwzAJ5LJ3PIc3Kkn5V3oAr78H/FFkvwwCm8YovTASZNjx9R
   irERCroYfZ+X8VwooDAoyP02QvpGu44C7D2nsBSiKhIZvxeHE6YpaeelW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2685304"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="2685304"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 14:49:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="961733136"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="961733136"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 31 Jan 2024 14:49:32 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVJOc-00027C-1i;
	Wed, 31 Jan 2024 22:49:30 +0000
Date: Thu, 1 Feb 2024 06:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 20/22] gpio: protect the pointer to gpio_chip in
 gpio_device with SRCU
Message-ID: <202402010641.idtEaO24-lkp@intel.com>
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
In-Reply-To: <20240130124828.14678-21-brgl@bgdev.pl>
References: <20240130124828.14678-21-brgl@bgdev.pl>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Kent Gibson <warthog618@gmail.com>
TO: Alex Elder <elder@linaro.org>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: "Paul E . McKenney" <paulmck@kernel.org>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.8-rc2 next-20240131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-protect-the-list-of-GPIO-devices-with-SRCU/20240130-205537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240130124828.14678-21-brgl%40bgdev.pl
patch subject: [PATCH 20/22] gpio: protect the pointer to gpio_chip in gpio_device with SRCU
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: i386-randconfig-141-20240131 (https://download.01.org/0day-ci/archive/20240201/202402010641.idtEaO24-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402010641.idtEaO24-lkp@intel.com/

New smatch warnings:
drivers/gpio/gpiolib.c:4776 gpiolib_dbg_show() error: we previously assumed 'gc' could be null (see line 4773)

Old smatch warnings:
drivers/gpio/gpiolib.c:4222 gpiod_find_and_request() error: uninitialized symbol 'ret'.
drivers/gpio/gpiolib.c:4236 gpiod_find_and_request() error: uninitialized symbol 'desc'.
drivers/gpio/gpiolib.c:4239 gpiod_find_and_request() error: uninitialized symbol 'desc'.

vim +/gc +4776 drivers/gpio/gpiolib.c

d2876d08d86f22 David Brownell      2008-02-04  4761  
fdeb8e1547cb9d Linus Walleij       2016-02-10  4762  static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
d2876d08d86f22 David Brownell      2008-02-04  4763  {
0338f6a6fb659f Bartosz Golaszewski 2023-12-21  4764  	bool active_low, is_irq, is_out;
0338f6a6fb659f Bartosz Golaszewski 2023-12-21  4765  	unsigned int gpio = gdev->base;
3de69ae1c407da Andy Shevchenko     2022-04-08  4766  	struct gpio_desc *desc;
2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  4767  	struct gpio_chip *gc;
3de69ae1c407da Andy Shevchenko     2022-04-08  4768  	int value;
d2876d08d86f22 David Brownell      2008-02-04  4769  
2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  4770  	guard(srcu)(&gdev->srcu);
2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  4771  
2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  4772  	gc = rcu_dereference(gdev->chip);
2796d5332f8ac8 Bartosz Golaszewski 2024-01-30 @4773  	if (!gc)
2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  4774  		seq_puts(s, "Underlying GPIO chip is gone\n");
2796d5332f8ac8 Bartosz Golaszewski 2024-01-30  4775  
3de69ae1c407da Andy Shevchenko     2022-04-08 @4776  	for_each_gpio_desc(gc, desc) {
bedc56b1695b27 Bartosz Golaszewski 2024-01-30  4777  		guard(srcu)(&desc->srcu);
3de69ae1c407da Andy Shevchenko     2022-04-08  4778  		if (test_bit(FLAG_REQUESTED, &desc->flags)) {
3de69ae1c407da Andy Shevchenko     2022-04-08  4779  			gpiod_get_direction(desc);
3de69ae1c407da Andy Shevchenko     2022-04-08  4780  			is_out = test_bit(FLAG_IS_OUT, &desc->flags);
234c52097ce416 Andy Shevchenko     2022-04-08  4781  			value = gpio_chip_get_value(gc, desc);
3de69ae1c407da Andy Shevchenko     2022-04-08  4782  			is_irq = test_bit(FLAG_USED_AS_IRQ, &desc->flags);
3de69ae1c407da Andy Shevchenko     2022-04-08  4783  			active_low = test_bit(FLAG_ACTIVE_LOW, &desc->flags);
3de69ae1c407da Andy Shevchenko     2022-04-08  4784  			seq_printf(s, " gpio-%-3d (%-20.20s|%-20.20s) %s %s %s%s\n",
32648f473c7f46 Bartosz Golaszewski 2024-01-30  4785  				   gpio, desc->name ?: "", gpiod_get_label(desc),
d2876d08d86f22 David Brownell      2008-02-04  4786  				   is_out ? "out" : "in ",
3de69ae1c407da Andy Shevchenko     2022-04-08  4787  				   value >= 0 ? (value ? "hi" : "lo") : "?  ",
90fd227029a25b Linus Walleij       2018-10-01  4788  				   is_irq ? "IRQ " : "",
90fd227029a25b Linus Walleij       2018-10-01  4789  				   active_low ? "ACTIVE LOW" : "");
3de69ae1c407da Andy Shevchenko     2022-04-08  4790  		} else if (desc->name) {
3de69ae1c407da Andy Shevchenko     2022-04-08  4791  			seq_printf(s, " gpio-%-3d (%-20.20s)\n", gpio, desc->name);
3de69ae1c407da Andy Shevchenko     2022-04-08  4792  		}
3de69ae1c407da Andy Shevchenko     2022-04-08  4793  
3de69ae1c407da Andy Shevchenko     2022-04-08  4794  		gpio++;
d2876d08d86f22 David Brownell      2008-02-04  4795  	}
d2876d08d86f22 David Brownell      2008-02-04  4796  }
d2876d08d86f22 David Brownell      2008-02-04  4797  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
