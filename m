Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D5F385D62
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Aug 2026 10:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788084869; cv=none; b=AlL4G0qyg5wpoO9DOKBfwCjQPlE9jnLSvnCbAzSGHPI5L9sEpn96OyhiLynXZcyRwvhMtoIN99fedh2CGTm3iJw2EP244Bmvc9/xo6HhwpAXI0sWj3GPVZwRUcKpHhlYiaaUnGfBQYrMxn8jbW2DKtWbYGP8Ubeb80dmm7sBrDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788084869; c=relaxed/simple;
	bh=B+NsvxYTFM58eW+VWHUtvQQqua0O01NGtyaBFnyX8Ik=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oPcc72Z0nKey5dasTxcmo9ZTW7Nod4gO+H899JlSfVhXw8XeCL0hZY/D1k8u1sbRztrpHJu6P0025mm5yuWpG6pv2nmwViiSx/aZ+jYQzUGSFZT/d11LNVXwez9fBqu1uBYseejX4XAUQxoye43b5JKo4XoBkMtnaxUxPm2K+wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5cJM0c4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5cJM0c4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788084867; x=1819620867;
  h=date:from:to:cc:subject:message-id;
  bh=B+NsvxYTFM58eW+VWHUtvQQqua0O01NGtyaBFnyX8Ik=;
  b=g5cJM0c4ZlY2fLZUpGkmQol/VDjcKGh2nsZjQm91ZrvS7OZ8P7o8plI+
   mY8BppxrgfzfkUg/dZGC9OzVzWbRtIYUlfru2oJVDbWAGl9vDWFI3gQuq
   vsff0gDaTD6LrZ5Y5Tz9iBhHqcxwGm4xVTMscMpqyE0oRZjNq2wzpf9Lf
   bwoWFhu6SQEh4D1KFslrQte67vwZxfClowDE4svkrLgS2HDtRsJLVUkHC
   roXsN94uKCPM9g6+vXj4FifTCV6ro6HjNDBtDqE7AhtCWhYGUt4QMv+XS
   3FvJyHwFMmkQLmsdOjYK/CcA/9gHWx+lnxYc7yHV2mZmKCdbdu5PXkZCk
   Q==;
X-CSE-ConnectionGUID: 3TidoVuWSc+A9YNZ49MaZg==
X-CSE-MsgGUID: jH5t0It1SBWMlNsQtJ+XDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="92331753"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="92331753"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 03:14:27 -0700
X-CSE-ConnectionGUID: 3DS03RXvRkmLBo33uF0QEw==
X-CSE-MsgGUID: zwKEltGxT8uBFD0NBEOs3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="306786243"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Aug 2026 03:14:26 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0cYR-00000000DmO-2wcC;
	Sun, 30 Aug 2026 10:14:23 +0000
Date: Sun, 30 Aug 2026 18:14:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tglx-devel:irqflags 13/20] drivers/gpio/gpio-mpsse.c:468
 gpio_mpsse_poll() warn: mixing irqsave and irq
Message-ID: <202608301846.WnjLAtgu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   59394501f5a285ef270931207a67d2f129403151
commit: 882d92b84f9618f000a4de66daeee48df6d81357 [13/20] irqflags: Cleanup wrappers
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20260830 (https://download.01.org/0day-ci/archive/20260830/202608301846.WnjLAtgu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608301846.WnjLAtgu-lkp@intel.com/

New smatch warnings:
drivers/gpio/gpio-mpsse.c:468 gpio_mpsse_poll() warn: mixing irqsave and irq
drivers/cpufreq/speedstep-smi.c:180 speedstep_set_state() warn: mixing irqsave and irq
kernel/rcu/rcutorture.c:2302 rcutorture_one_extend() warn: mixing irq and irqsave

Old smatch warnings:
include/linux/mutex.h:254 class_mutex_try_constructor() warn: passing zero to 'ERR_PTR'

vim +468 drivers/gpio/gpio-mpsse.c

179ef1127d7a4f Mary Strodl 2025-10-14  397  
179ef1127d7a4f Mary Strodl 2025-10-14  398  static void gpio_mpsse_poll(struct work_struct *my_work)
c46a74ff05c0ac Mary Strodl 2024-10-09  399  {
c46a74ff05c0ac Mary Strodl 2024-10-09  400  	unsigned long pin_mask, pin_states, flags;
c46a74ff05c0ac Mary Strodl 2024-10-09  401  	int irq_enabled, offset, err, value, fire_irq,
c46a74ff05c0ac Mary Strodl 2024-10-09  402  		irq, old_value[16], irq_type[16];
179ef1127d7a4f Mary Strodl 2025-10-14  403  	struct mpsse_worker *my_worker = container_of(my_work, struct mpsse_worker, work);
179ef1127d7a4f Mary Strodl 2025-10-14  404  	struct mpsse_priv *priv = my_worker->priv;
c46a74ff05c0ac Mary Strodl 2024-10-09  405  
c46a74ff05c0ac Mary Strodl 2024-10-09  406  	for (offset = 0; offset < priv->gpio.ngpio; ++offset)
c46a74ff05c0ac Mary Strodl 2024-10-09  407  		old_value[offset] = -1;
c46a74ff05c0ac Mary Strodl 2024-10-09  408  
179ef1127d7a4f Mary Strodl 2025-10-14  409  	/*
179ef1127d7a4f Mary Strodl 2025-10-14  410  	 * We only want one worker. Workers race to acquire irq_race and tear
179ef1127d7a4f Mary Strodl 2025-10-14  411  	 * down all other workers. This is a cond guard so that we don't deadlock
179ef1127d7a4f Mary Strodl 2025-10-14  412  	 * trying to cancel a worker.
179ef1127d7a4f Mary Strodl 2025-10-14  413  	 */
179ef1127d7a4f Mary Strodl 2025-10-14  414  	scoped_cond_guard(mutex_try, return, &priv->irq_race)
179ef1127d7a4f Mary Strodl 2025-10-14  415  		gpio_mpsse_stop_all_except(priv, my_worker);
179ef1127d7a4f Mary Strodl 2025-10-14  416  
179ef1127d7a4f Mary Strodl 2025-10-14  417  	while ((irq_enabled = atomic_read(&priv->irq_enabled)) &&
179ef1127d7a4f Mary Strodl 2025-10-14  418  	       !atomic_read(&my_worker->cancelled)) {
c46a74ff05c0ac Mary Strodl 2024-10-09  419  		usleep_range(MPSSE_POLL_INTERVAL, MPSSE_POLL_INTERVAL + 1000);
c46a74ff05c0ac Mary Strodl 2024-10-09  420  		/* Cleanup will trigger at the end of the loop */
c46a74ff05c0ac Mary Strodl 2024-10-09  421  		guard(mutex)(&priv->irq_mutex);
c46a74ff05c0ac Mary Strodl 2024-10-09  422  
c46a74ff05c0ac Mary Strodl 2024-10-09  423  		pin_mask = 0;
c46a74ff05c0ac Mary Strodl 2024-10-09  424  		pin_states = 0;
c46a74ff05c0ac Mary Strodl 2024-10-09  425  		for (offset = 0; offset < priv->gpio.ngpio; ++offset) {
c46a74ff05c0ac Mary Strodl 2024-10-09  426  			irq_type[offset] = atomic_read(&priv->irq_type[offset]);
c46a74ff05c0ac Mary Strodl 2024-10-09  427  			if (irq_type[offset] != IRQ_TYPE_NONE &&
c46a74ff05c0ac Mary Strodl 2024-10-09  428  			    irq_enabled & BIT(offset))
c46a74ff05c0ac Mary Strodl 2024-10-09  429  				pin_mask |= BIT(offset);
c46a74ff05c0ac Mary Strodl 2024-10-09  430  			else
c46a74ff05c0ac Mary Strodl 2024-10-09  431  				old_value[offset] = -1;
c46a74ff05c0ac Mary Strodl 2024-10-09  432  		}
c46a74ff05c0ac Mary Strodl 2024-10-09  433  
c46a74ff05c0ac Mary Strodl 2024-10-09  434  		err = gpio_mpsse_get_multiple(&priv->gpio, &pin_mask,
c46a74ff05c0ac Mary Strodl 2024-10-09  435  					      &pin_states);
c46a74ff05c0ac Mary Strodl 2024-10-09  436  		if (err) {
c46a74ff05c0ac Mary Strodl 2024-10-09  437  			dev_err_ratelimited(&priv->intf->dev,
c46a74ff05c0ac Mary Strodl 2024-10-09  438  					    "Error polling!\n");
c46a74ff05c0ac Mary Strodl 2024-10-09  439  			continue;
c46a74ff05c0ac Mary Strodl 2024-10-09  440  		}
c46a74ff05c0ac Mary Strodl 2024-10-09  441  
c46a74ff05c0ac Mary Strodl 2024-10-09  442  		/* Check each value */
c46a74ff05c0ac Mary Strodl 2024-10-09  443  		for (offset = 0; offset < priv->gpio.ngpio; ++offset) {
c46a74ff05c0ac Mary Strodl 2024-10-09  444  			if (old_value[offset] == -1)
c46a74ff05c0ac Mary Strodl 2024-10-09  445  				continue;
c46a74ff05c0ac Mary Strodl 2024-10-09  446  
c46a74ff05c0ac Mary Strodl 2024-10-09  447  			fire_irq = 0;
c46a74ff05c0ac Mary Strodl 2024-10-09  448  			value = pin_states & BIT(offset);
c46a74ff05c0ac Mary Strodl 2024-10-09  449  
c46a74ff05c0ac Mary Strodl 2024-10-09  450  			switch (irq_type[offset]) {
c46a74ff05c0ac Mary Strodl 2024-10-09  451  			case IRQ_TYPE_EDGE_RISING:
c46a74ff05c0ac Mary Strodl 2024-10-09  452  				fire_irq = value > old_value[offset];
c46a74ff05c0ac Mary Strodl 2024-10-09  453  				break;
c46a74ff05c0ac Mary Strodl 2024-10-09  454  			case IRQ_TYPE_EDGE_FALLING:
c46a74ff05c0ac Mary Strodl 2024-10-09  455  				fire_irq = value < old_value[offset];
c46a74ff05c0ac Mary Strodl 2024-10-09  456  				break;
c46a74ff05c0ac Mary Strodl 2024-10-09  457  			case IRQ_TYPE_EDGE_BOTH:
c46a74ff05c0ac Mary Strodl 2024-10-09  458  				fire_irq = value != old_value[offset];
c46a74ff05c0ac Mary Strodl 2024-10-09  459  				break;
c46a74ff05c0ac Mary Strodl 2024-10-09  460  			}
c46a74ff05c0ac Mary Strodl 2024-10-09  461  			if (!fire_irq)
c46a74ff05c0ac Mary Strodl 2024-10-09  462  				continue;
c46a74ff05c0ac Mary Strodl 2024-10-09  463  
c46a74ff05c0ac Mary Strodl 2024-10-09  464  			irq = irq_find_mapping(priv->gpio.irq.domain,
c46a74ff05c0ac Mary Strodl 2024-10-09  465  					       offset);
c46a74ff05c0ac Mary Strodl 2024-10-09  466  			local_irq_save(flags);
c46a74ff05c0ac Mary Strodl 2024-10-09  467  			generic_handle_irq(irq);
c46a74ff05c0ac Mary Strodl 2024-10-09 @468  			local_irq_disable();
c46a74ff05c0ac Mary Strodl 2024-10-09  469  			local_irq_restore(flags);
c46a74ff05c0ac Mary Strodl 2024-10-09  470  		}
c46a74ff05c0ac Mary Strodl 2024-10-09  471  
c46a74ff05c0ac Mary Strodl 2024-10-09  472  		/* Sync back values so we can refer to them next tick */
c46a74ff05c0ac Mary Strodl 2024-10-09  473  		for (offset = 0; offset < priv->gpio.ngpio; ++offset)
c46a74ff05c0ac Mary Strodl 2024-10-09  474  			if (irq_type[offset] != IRQ_TYPE_NONE &&
c46a74ff05c0ac Mary Strodl 2024-10-09  475  			    irq_enabled & BIT(offset))
c46a74ff05c0ac Mary Strodl 2024-10-09  476  				old_value[offset] = pin_states & BIT(offset);
c46a74ff05c0ac Mary Strodl 2024-10-09  477  	}
c46a74ff05c0ac Mary Strodl 2024-10-09  478  }
c46a74ff05c0ac Mary Strodl 2024-10-09  479  

:::::: The code at line 468 was first introduced by commit
:::::: c46a74ff05c0ac76ba11ef21c930c3b447abf31a gpio: add support for FTDI's MPSSE as GPIO

:::::: TO: Mary Strodl <mstrodl@csh.rit.edu>
:::::: CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
