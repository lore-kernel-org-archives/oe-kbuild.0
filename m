Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA912151987
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Feb 2025 12:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759359; cv=none; b=oFXl/pup/0H/ItFQ9V2dpipA4g8ElCBnBPGbcWkeiH4za/rPKAdXHsWOxIQSe5G65HJ9agJUGgoev/Io9LbNHurWq3kf7rtWL2IP3mXd5lsU7VTh/TA1b455VIN4cUAOCsxrWgb8YTcbIRP/NgEjcHqol20uyYhBaV2FvBaEKY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759359; c=relaxed/simple;
	bh=tnmqPfRyzyBUwUPtxLL4j+KnoITz46ugEtwOm0Mt1qE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VrE7w5TaKWbuYVv6bZzN9T81SCuDatlTnqKZonTHN5y2vh+6WI5bngqOdNiTnBUqGSgkD52DrzisGAVe1Tui72f6lkUTh3f3WJ5zTq9hxdFp+8o4WhTKF5/GJfyBrmnd8IalYSwPtUBonTriyEoNGJnEVN8aFpKZEpdQonBs0Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AR+4pHqh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AR+4pHqh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738759358; x=1770295358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tnmqPfRyzyBUwUPtxLL4j+KnoITz46ugEtwOm0Mt1qE=;
  b=AR+4pHqh5+qvwJrBx8tHrktR2NiuTJLn+nZxXwBzX04Bu/WMq2F0lUlb
   YDJpApFBkJhv1zOyhLpVf0/0AtusXvI8Phu+TqddN0OFjzILpSLNMRe9+
   4nqR5mit/Q2nM+gN+pzSDq+CSYsVlbdSxOWYG/XmHaxcfJbVPb1QlGP9F
   62kvROZnL3uaRqs5hK8jTrqbPjaLWCvWsZXkl9G0UZK0xwOAUAulJlfc/
   9Sl7lxxee4wxjUoTGkpqWqzyljVbJ9FSQATCMFswqyAqZTtdwPuYNsDDx
   mJYK/rIgvzSpmPj+idUS8RO+8AN9qOuB8R2jcogeGw9QpTIxBj7FM/VNl
   Q==;
X-CSE-ConnectionGUID: 2NDP8R6IR4GZlUbZulHdcw==
X-CSE-MsgGUID: HNG9v1zPTzadJ/YU1Rl/UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39433117"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39433117"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 04:42:37 -0800
X-CSE-ConnectionGUID: 4G+qphrTS9CHOSvHzuEOuA==
X-CSE-MsgGUID: j7j4EKz5SFGuqlqE1WpmCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="111423945"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Feb 2025 04:42:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfejh-000tt0-1p;
	Wed, 05 Feb 2025 12:42:33 +0000
Date: Wed, 5 Feb 2025 20:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:thread-safety 32/32] drivers/gpio/gpio-max732x.c:369:1:
 warning: mutex 'chip->irq_lock' is still held at the end of function
Message-ID: <202502052043.JbV6WRP9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux thread-safety
head:   def466914192276f0fbab279e4f8fb88457c5311
commit: def466914192276f0fbab279e4f8fb88457c5311 [32/32] scripts/Makefile.clang: Unconditionally enable thread-safety checking
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-buildonly-randconfig-005-20250205 (https://download.01.org/0day-ci/archive/20250205/202502052043.JbV6WRP9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502052043.JbV6WRP9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502052043.JbV6WRP9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-max732x.c:369:1: warning: mutex 'chip->irq_lock' is still held at the end of function [-Wthread-safety-analysis]
     369 | }
         | ^
   drivers/gpio/gpio-max732x.c:367:2: note: mutex acquired here
     367 |         mutex_lock(&chip->irq_lock);
         |         ^
>> drivers/gpio/gpio-max732x.c:387:2: warning: releasing mutex 'chip->irq_lock' that was not held [-Wthread-safety-analysis]
     387 |         mutex_unlock(&chip->irq_lock);
         |         ^
   2 warnings generated.
--
>> fs/jffs2/nodemgmt.c:625:2: warning: mutex 'c->erase_free_sem' is not held on every path through here [-Wthread-safety-analysis]
     625 |         spin_lock(&c->erase_completion_lock);
         |         ^
   fs/jffs2/nodemgmt.c:622:3: note: mutex acquired here
     622 |                 mutex_lock(&c->erase_free_sem);
         |                 ^
>> fs/jffs2/nodemgmt.c:843:2: warning: releasing mutex 'c->erase_free_sem' that was not held [-Wthread-safety-analysis]
     843 |         mutex_unlock(&c->erase_free_sem);
         |         ^
   2 warnings generated.
--
>> fs/jffs2/write.c:668:1: warning: mutex 'c->alloc_sem' is still held at the end of function [-Wthread-safety-analysis]
     668 | }
         | ^
   fs/jffs2/write.c:608:3: note: mutex acquired here
     608 |                 mutex_lock(&c->alloc_sem);
         |                 ^
   1 warning generated.


vim +369 drivers/gpio/gpio-max732x.c

a80a0bbee49872 drivers/gpio/max732x.c      Marc Zyngier      2010-05-26  361  
fbc4667ab08a1c drivers/gpio/max732x.c      Lennert Buytenhek 2011-01-12  362  static void max732x_irq_bus_lock(struct irq_data *d)
a80a0bbee49872 drivers/gpio/max732x.c      Marc Zyngier      2010-05-26  363  {
984f66432e3577 drivers/gpio/gpio-max732x.c Linus Walleij     2015-01-30  364  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
0788b6448067f5 drivers/gpio/gpio-max732x.c Linus Walleij     2015-12-07  365  	struct max732x_chip *chip = gpiochip_get_data(gc);
a80a0bbee49872 drivers/gpio/max732x.c      Marc Zyngier      2010-05-26  366  
a80a0bbee49872 drivers/gpio/max732x.c      Marc Zyngier      2010-05-26  367  	mutex_lock(&chip->irq_lock);
a80a0bbee49872 drivers/gpio/max732x.c      Marc Zyngier      2010-05-26  368  	chip->irq_mask_cur = chip->irq_mask;
a80a0bbee49872 drivers/gpio/max732x.c      Marc Zyngier      2010-05-26 @369  }
a80a0bbee49872 drivers/gpio/max732x.c      Marc Zyngier      2010-05-26  370  
fbc4667ab08a1c drivers/gpio/max732x.c      Lennert Buytenhek 2011-01-12  371  static void max732x_irq_bus_sync_unlock(struct irq_data *d)
a80a0bbee49872 drivers/gpio/max732x.c      Marc Zyngier      2010-05-26  372  {
984f66432e3577 drivers/gpio/gpio-max732x.c Linus Walleij     2015-01-30  373  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
0788b6448067f5 drivers/gpio/gpio-max732x.c Linus Walleij     2015-12-07  374  	struct max732x_chip *chip = gpiochip_get_data(gc);
09afa276d52ea5 drivers/gpio/gpio-max732x.c Semen Protsenko   2015-01-13  375  	uint16_t new_irqs;
09afa276d52ea5 drivers/gpio/gpio-max732x.c Semen Protsenko   2015-01-13  376  	uint16_t level;
a80a0bbee49872 drivers/gpio/max732x.c      Marc Zyngier      2010-05-26  377  
a80a0bbee49872 drivers/gpio/max732x.c      Marc Zyngier      2010-05-26  378  	max732x_irq_update_mask(chip);
09afa276d52ea5 drivers/gpio/gpio-max732x.c Semen Protsenko   2015-01-13  379  
09afa276d52ea5 drivers/gpio/gpio-max732x.c Semen Protsenko   2015-01-13  380  	new_irqs = chip->irq_trig_fall | chip->irq_trig_raise;
09afa276d52ea5 drivers/gpio/gpio-max732x.c Semen Protsenko   2015-01-13  381  	while (new_irqs) {
09afa276d52ea5 drivers/gpio/gpio-max732x.c Semen Protsenko   2015-01-13  382  		level = __ffs(new_irqs);
09afa276d52ea5 drivers/gpio/gpio-max732x.c Semen Protsenko   2015-01-13  383  		max732x_gpio_direction_input(&chip->gpio_chip, level);
09afa276d52ea5 drivers/gpio/gpio-max732x.c Semen Protsenko   2015-01-13  384  		new_irqs &= ~(1 << level);
09afa276d52ea5 drivers/gpio/gpio-max732x.c Semen Protsenko   2015-01-13  385  	}
09afa276d52ea5 drivers/gpio/gpio-max732x.c Semen Protsenko   2015-01-13  386  
a80a0bbee49872 drivers/gpio/max732x.c      Marc Zyngier      2010-05-26 @387  	mutex_unlock(&chip->irq_lock);
a80a0bbee49872 drivers/gpio/max732x.c      Marc Zyngier      2010-05-26  388  }
a80a0bbee49872 drivers/gpio/max732x.c      Marc Zyngier      2010-05-26  389  

:::::: The code at line 369 was first introduced by commit
:::::: a80a0bbee49872c296c9ed9d6af0f510fcd825a7 gpio: add interrupt handling capability to max732x

:::::: TO: Marc Zyngier <maz@misterjones.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
