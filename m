Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8414503B
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Sep 2025 01:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759108634; cv=none; b=NkXHp1hankJXFLWS62ARH8MjtXmyNATR96Hr7TJExhqQrpl7RJoj6ZLDIYIPycvYuiBT7tztoU3v59KfEDYoZmDaG54DsMHdLcmcbepie7HMovkWjonnx4yeBaEwsN1aqIy4YxWbPILGKTRgmYt7GsCw8o0aKLav9XmvKNswris=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759108634; c=relaxed/simple;
	bh=P7HEEViFKenB8QqEhQZHEKtrLlYTZz+rJSEsYognnYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bQ46oUFQosTV2d4A2HVN3AnV8NiPu7rfJUyqhpmAuj6HIHjpj19cY2aZ0ziPXaUlAEbRglAdBkuHlEbHTbKZZJIpO0LpYV67LYwEFoIgrGpttxogol2pmlOvAkGY+DSRML56o+CvC/8RsqOWg7vrnbsfcfjJXBK0Tv3qLOBr/GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVWaTuQF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVWaTuQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759108633; x=1790644633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P7HEEViFKenB8QqEhQZHEKtrLlYTZz+rJSEsYognnYo=;
  b=WVWaTuQFhmbbcylZHzJFiCIiua7e+lRp0j9aDGdwCPWZBMXkK4CNSxPZ
   Ye2/EnCRRZunEXNkTXli7WzB5COdkUkwpZN1itVeyRgDLrt2j8pPC6tTe
   3dx++BnmVJ+BgOi6avSSVFSKJzeF91i4DuOSw02sBnGEv4OtQ67nTnrsM
   mhR+bzNZdN/HQiXgToAO/H5QqQdYofbSzQiGMCQf4oMonQK8hhlTmDdnm
   M58qxjWy9cLQCVEFn6hctDe7U6EHKqH+ouDip/5jf6uDxsGxCAhDCHjdG
   4Fv0xE2p7tak1+jQpFpkZOoaoWP3tORwbUt+DQo2iNyDgst+k1i5j4MfU
   Q==;
X-CSE-ConnectionGUID: xAPwv73CQKScZGIikF6osQ==
X-CSE-MsgGUID: 7JdKOB99RLC565YQv89wjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61518300"
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="61518300"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 18:17:10 -0700
X-CSE-ConnectionGUID: OtBXN4M8RqGFKSlTO+ym6g==
X-CSE-MsgGUID: RVrNuqiiRwKwbsTMALf9jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="182086844"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Sep 2025 18:17:09 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v32Vm-000875-1A;
	Mon, 29 Sep 2025 01:17:06 +0000
Date: Mon, 29 Sep 2025 09:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
Message-ID: <202509290823.hreUi6Tp-lkp@intel.com>
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
In-Reply-To: <20250923133304.273529-2-mstrodl@csh.rit.edu>
References: <20250923133304.273529-2-mstrodl@csh.rit.edu>
TO: Mary Strodl <mstrodl@csh.rit.edu>
TO: linux-kernel@vger.kernel.org
CC: linus.walleij@linaro.org
CC: brgl@bgdev.pl
CC: linux-gpio@vger.kernel.org
CC: Mary Strodl <mstrodl@csh.rit.edu>

Hi Mary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.17 next-20250926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mary-Strodl/gpio-mpsse-use-rcu-to-ensure-worker-is-torn-down/20250923-214710
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250923133304.273529-2-mstrodl%40csh.rit.edu
patch subject: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20250929 (https://download.01.org/0day-ci/archive/20250929/202509290823.hreUi6Tp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509290823.hreUi6Tp-lkp@intel.com/

New smatch warnings:
drivers/gpio/gpio-mpsse.c:341 gpio_mpsse_poll() error: dereferencing freed memory 'worker' (line 342)
drivers/gpio/gpio-mpsse.c:604 gpio_mpsse_disconnect() error: dereferencing freed memory 'worker' (line 605)

Old smatch warnings:
include/linux/mutex.h:229 class_mutex_try_constructor() warn: passing zero to 'ERR_PTR'

vim +/worker +341 drivers/gpio/gpio-mpsse.c

a14b0c5e3b0741 Mary Strodl 2025-09-23  303  
a14b0c5e3b0741 Mary Strodl 2025-09-23  304  static void gpio_mpsse_poll(struct work_struct *my_work)
c46a74ff05c0ac Mary Strodl 2024-10-09  305  {
c46a74ff05c0ac Mary Strodl 2024-10-09  306  	unsigned long pin_mask, pin_states, flags;
c46a74ff05c0ac Mary Strodl 2024-10-09  307  	int irq_enabled, offset, err, value, fire_irq,
c46a74ff05c0ac Mary Strodl 2024-10-09  308  		irq, old_value[16], irq_type[16];
a14b0c5e3b0741 Mary Strodl 2025-09-23  309  	struct mpsse_worker *worker;
a14b0c5e3b0741 Mary Strodl 2025-09-23  310  	struct mpsse_worker *my_worker = container_of(my_work, struct mpsse_worker, work);
a14b0c5e3b0741 Mary Strodl 2025-09-23  311  	struct mpsse_priv *priv = my_worker->priv;
a14b0c5e3b0741 Mary Strodl 2025-09-23  312  	struct list_head destructors = LIST_HEAD_INIT(destructors);
c46a74ff05c0ac Mary Strodl 2024-10-09  313  
c46a74ff05c0ac Mary Strodl 2024-10-09  314  	for (offset = 0; offset < priv->gpio.ngpio; ++offset)
c46a74ff05c0ac Mary Strodl 2024-10-09  315  		old_value[offset] = -1;
c46a74ff05c0ac Mary Strodl 2024-10-09  316  
a14b0c5e3b0741 Mary Strodl 2025-09-23  317  	/*
a14b0c5e3b0741 Mary Strodl 2025-09-23  318  	 * We only want one worker. Workers race to acquire irq_race and tear
a14b0c5e3b0741 Mary Strodl 2025-09-23  319  	 * down all other workers. This is a cond guard so that we don't deadlock
a14b0c5e3b0741 Mary Strodl 2025-09-23  320  	 * trying to cancel a worker.
a14b0c5e3b0741 Mary Strodl 2025-09-23  321  	 */
a14b0c5e3b0741 Mary Strodl 2025-09-23  322  	scoped_cond_guard(mutex_try, ;, &priv->irq_race) {
a14b0c5e3b0741 Mary Strodl 2025-09-23  323  		scoped_guard(rcu) {
a14b0c5e3b0741 Mary Strodl 2025-09-23  324  			list_for_each_entry_rcu(worker, &priv->workers, list) {
a14b0c5e3b0741 Mary Strodl 2025-09-23  325  				/* Don't stop ourselves */
a14b0c5e3b0741 Mary Strodl 2025-09-23  326  				if (worker == my_worker)
a14b0c5e3b0741 Mary Strodl 2025-09-23  327  					continue;
a14b0c5e3b0741 Mary Strodl 2025-09-23  328  
a14b0c5e3b0741 Mary Strodl 2025-09-23  329  				scoped_guard(raw_spinlock_irqsave, &priv->irq_spin)
a14b0c5e3b0741 Mary Strodl 2025-09-23  330  					list_del_rcu(&worker->list);
a14b0c5e3b0741 Mary Strodl 2025-09-23  331  
a14b0c5e3b0741 Mary Strodl 2025-09-23  332  				/* Give worker a chance to terminate itself */
a14b0c5e3b0741 Mary Strodl 2025-09-23  333  				atomic_set(&worker->cancelled, 1);
a14b0c5e3b0741 Mary Strodl 2025-09-23  334  				/* Keep track of stuff to cancel */
a14b0c5e3b0741 Mary Strodl 2025-09-23  335  				INIT_LIST_HEAD(&worker->destroy);
a14b0c5e3b0741 Mary Strodl 2025-09-23  336  				list_add(&worker->destroy, &destructors);
a14b0c5e3b0741 Mary Strodl 2025-09-23  337  			}
a14b0c5e3b0741 Mary Strodl 2025-09-23  338  		}
a14b0c5e3b0741 Mary Strodl 2025-09-23  339  		/* Make sure list consumers are finished before we tear down */
a14b0c5e3b0741 Mary Strodl 2025-09-23  340  		synchronize_rcu();
a14b0c5e3b0741 Mary Strodl 2025-09-23 @341  		list_for_each_entry(worker, &destructors, destroy)
a14b0c5e3b0741 Mary Strodl 2025-09-23 @342  			gpio_mpsse_stop(worker);
a14b0c5e3b0741 Mary Strodl 2025-09-23  343  	}
a14b0c5e3b0741 Mary Strodl 2025-09-23  344  
a14b0c5e3b0741 Mary Strodl 2025-09-23  345  	while ((irq_enabled = atomic_read(&priv->irq_enabled)) &&
a14b0c5e3b0741 Mary Strodl 2025-09-23  346  	       !atomic_read(&my_worker->cancelled)) {
c46a74ff05c0ac Mary Strodl 2024-10-09  347  		usleep_range(MPSSE_POLL_INTERVAL, MPSSE_POLL_INTERVAL + 1000);
c46a74ff05c0ac Mary Strodl 2024-10-09  348  		/* Cleanup will trigger at the end of the loop */
c46a74ff05c0ac Mary Strodl 2024-10-09  349  		guard(mutex)(&priv->irq_mutex);
c46a74ff05c0ac Mary Strodl 2024-10-09  350  
c46a74ff05c0ac Mary Strodl 2024-10-09  351  		pin_mask = 0;
c46a74ff05c0ac Mary Strodl 2024-10-09  352  		pin_states = 0;
c46a74ff05c0ac Mary Strodl 2024-10-09  353  		for (offset = 0; offset < priv->gpio.ngpio; ++offset) {
c46a74ff05c0ac Mary Strodl 2024-10-09  354  			irq_type[offset] = atomic_read(&priv->irq_type[offset]);
c46a74ff05c0ac Mary Strodl 2024-10-09  355  			if (irq_type[offset] != IRQ_TYPE_NONE &&
c46a74ff05c0ac Mary Strodl 2024-10-09  356  			    irq_enabled & BIT(offset))
c46a74ff05c0ac Mary Strodl 2024-10-09  357  				pin_mask |= BIT(offset);
c46a74ff05c0ac Mary Strodl 2024-10-09  358  			else
c46a74ff05c0ac Mary Strodl 2024-10-09  359  				old_value[offset] = -1;
c46a74ff05c0ac Mary Strodl 2024-10-09  360  		}
c46a74ff05c0ac Mary Strodl 2024-10-09  361  
c46a74ff05c0ac Mary Strodl 2024-10-09  362  		err = gpio_mpsse_get_multiple(&priv->gpio, &pin_mask,
c46a74ff05c0ac Mary Strodl 2024-10-09  363  					      &pin_states);
c46a74ff05c0ac Mary Strodl 2024-10-09  364  		if (err) {
c46a74ff05c0ac Mary Strodl 2024-10-09  365  			dev_err_ratelimited(&priv->intf->dev,
c46a74ff05c0ac Mary Strodl 2024-10-09  366  					    "Error polling!\n");
c46a74ff05c0ac Mary Strodl 2024-10-09  367  			continue;
c46a74ff05c0ac Mary Strodl 2024-10-09  368  		}
c46a74ff05c0ac Mary Strodl 2024-10-09  369  
c46a74ff05c0ac Mary Strodl 2024-10-09  370  		/* Check each value */
c46a74ff05c0ac Mary Strodl 2024-10-09  371  		for (offset = 0; offset < priv->gpio.ngpio; ++offset) {
c46a74ff05c0ac Mary Strodl 2024-10-09  372  			if (old_value[offset] == -1)
c46a74ff05c0ac Mary Strodl 2024-10-09  373  				continue;
c46a74ff05c0ac Mary Strodl 2024-10-09  374  
c46a74ff05c0ac Mary Strodl 2024-10-09  375  			fire_irq = 0;
c46a74ff05c0ac Mary Strodl 2024-10-09  376  			value = pin_states & BIT(offset);
c46a74ff05c0ac Mary Strodl 2024-10-09  377  
c46a74ff05c0ac Mary Strodl 2024-10-09  378  			switch (irq_type[offset]) {
c46a74ff05c0ac Mary Strodl 2024-10-09  379  			case IRQ_TYPE_EDGE_RISING:
c46a74ff05c0ac Mary Strodl 2024-10-09  380  				fire_irq = value > old_value[offset];
c46a74ff05c0ac Mary Strodl 2024-10-09  381  				break;
c46a74ff05c0ac Mary Strodl 2024-10-09  382  			case IRQ_TYPE_EDGE_FALLING:
c46a74ff05c0ac Mary Strodl 2024-10-09  383  				fire_irq = value < old_value[offset];
c46a74ff05c0ac Mary Strodl 2024-10-09  384  				break;
c46a74ff05c0ac Mary Strodl 2024-10-09  385  			case IRQ_TYPE_EDGE_BOTH:
c46a74ff05c0ac Mary Strodl 2024-10-09  386  				fire_irq = value != old_value[offset];
c46a74ff05c0ac Mary Strodl 2024-10-09  387  				break;
c46a74ff05c0ac Mary Strodl 2024-10-09  388  			}
c46a74ff05c0ac Mary Strodl 2024-10-09  389  			if (!fire_irq)
c46a74ff05c0ac Mary Strodl 2024-10-09  390  				continue;
c46a74ff05c0ac Mary Strodl 2024-10-09  391  
c46a74ff05c0ac Mary Strodl 2024-10-09  392  			irq = irq_find_mapping(priv->gpio.irq.domain,
c46a74ff05c0ac Mary Strodl 2024-10-09  393  					       offset);
c46a74ff05c0ac Mary Strodl 2024-10-09  394  			local_irq_save(flags);
c46a74ff05c0ac Mary Strodl 2024-10-09  395  			generic_handle_irq(irq);
c46a74ff05c0ac Mary Strodl 2024-10-09  396  			local_irq_disable();
c46a74ff05c0ac Mary Strodl 2024-10-09  397  			local_irq_restore(flags);
c46a74ff05c0ac Mary Strodl 2024-10-09  398  		}
c46a74ff05c0ac Mary Strodl 2024-10-09  399  
c46a74ff05c0ac Mary Strodl 2024-10-09  400  		/* Sync back values so we can refer to them next tick */
c46a74ff05c0ac Mary Strodl 2024-10-09  401  		for (offset = 0; offset < priv->gpio.ngpio; ++offset)
c46a74ff05c0ac Mary Strodl 2024-10-09  402  			if (irq_type[offset] != IRQ_TYPE_NONE &&
c46a74ff05c0ac Mary Strodl 2024-10-09  403  			    irq_enabled & BIT(offset))
c46a74ff05c0ac Mary Strodl 2024-10-09  404  				old_value[offset] = pin_states & BIT(offset);
c46a74ff05c0ac Mary Strodl 2024-10-09  405  	}
c46a74ff05c0ac Mary Strodl 2024-10-09  406  }
c46a74ff05c0ac Mary Strodl 2024-10-09  407  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
