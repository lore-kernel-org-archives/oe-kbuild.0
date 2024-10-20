Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9E61E87B
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 14:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729435431; cv=none; b=Q0TLQy1fAmQmE+QZ7pMYC9GjhWTk07PTK8xMxBbg1JqKdoWceDo5N9lW8GogrO+1qOTLoJ+UCg6JPrvGB/3RNvEvWlFRwU1iXhK1tXAHBQuPVbvAHxCHC6yIvF9UPkF8Eaj3enzP3udGF8j1K0/XLpoWSN11Hpmo8IqUVCpO6og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729435431; c=relaxed/simple;
	bh=QgZMthPz/lFcNXBt9gKMGhNrC+NVac0yh96I4p9x/xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ukDcoEhxEvJXZxi+ivguiFpWTqbR3I7xY1Xs2z7RG4a+VGzFwEzQGJA+LGaZmFs3rDDZnIgf7I87G7cFRnSCP6QCeLlEvqZr3rjCL6X/ka+nxXiflioz+ZjG4DMaX9dFfMQUDlyQBGlnMJS/fCyYRodQXmEnkHtErHYBlD2UI3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dv9z0z3O; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dv9z0z3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729435429; x=1760971429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QgZMthPz/lFcNXBt9gKMGhNrC+NVac0yh96I4p9x/xw=;
  b=Dv9z0z3OSFQIIhjbZlAYKhAdM3VHokaxx6/ABtpL18e2xKnbvRmeqga+
   lfDqxTjo9BmSqw9FJ0qTUgHkUCw6YIHRoLd61Dhmpzt3EslKQpOtXpnQ8
   7Zsd29Fx/01Q/lGGkpLH7bLC2plZYHI9D/3bB68X0LiFYVUCQsJlwR1cz
   yK5xHwS6/aO+1kxxh+IvgQuosGP677Lh5JMtb/XOsQiALt+V+JUrhFY8y
   2w1o4+OSR9qm28J7RwYrqwNJeCAxGFUqePrjFpZs2xeX15VHYkE7K/P8s
   EKEQpSeXnHtWj6686JxCLJXp3q/VwTcFVMVIdm233TuVahlOs3BM+Mk8M
   w==;
X-CSE-ConnectionGUID: GpB0Hd+ySKGC6A2gjIkLUg==
X-CSE-MsgGUID: Ln6Qd5+zTcGYLbGDxDOK8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="32719954"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="32719954"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 07:43:48 -0700
X-CSE-ConnectionGUID: BYgKV+V1TQqEA0dJGWPblw==
X-CSE-MsgGUID: Zs45heDkT8+qZ4GxHF+cZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="79631919"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Oct 2024 07:43:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2X9k-000QNd-2I;
	Sun, 20 Oct 2024 14:43:44 +0000
Date: Sun, 20 Oct 2024 22:42:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mmc/host/atmel-mci.c:2552 atmci_probe() warn: passing zero
 to 'dev_err_probe'
Message-ID: <202410210023.6s07Bozp-lkp@intel.com>
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
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   715ca9dd687f89ddaac8ec8ccb3b5e5a30311a99
commit: e38063b94324bc1409a29d699c73938c3d008126 mmc: atmel-mci: Switch to use dev_err_probe()
date:   6 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-r072-20241016 (https://download.01.org/0day-ci/archive/20241021/202410210023.6s07Bozp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410210023.6s07Bozp-lkp@intel.com/

New smatch warnings:
drivers/mmc/host/atmel-mci.c:2552 atmci_probe() warn: passing zero to 'dev_err_probe'

Old smatch warnings:
drivers/mmc/host/atmel-mci.c:1338 atmci_start_request() error: we previously assumed 'data' could be null (see line 1329)
drivers/mmc/host/atmel-mci.c:2590 atmci_probe() warn: 'host->mck' from clk_prepare_enable() not released on lines: 2590.

vim +/dev_err_probe +2552 drivers/mmc/host/atmel-mci.c

74465b4ff9ac1d Dan Williams                2009-01-06  2443  
ab050b9269aa54 ludovic.desroches@atmel.com 2014-12-01  2444  static int atmci_probe(struct platform_device *pdev)
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2445  {
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2446  	struct device			*dev = &pdev->dev;
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2447  	struct atmel_mci		*host;
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2448  	struct resource			*regs;
965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2449  	unsigned int			nr_slots;
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2450  	int				irq;
528bc7808f4e36 Pramod Gurav                2014-09-23  2451  	int				ret, i;
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2452  
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2453  	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2454  	if (!regs)
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2455  		return -ENXIO;
ba7916180ea233 Andy Shevchenko             2024-04-17  2456  
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2457  	irq = platform_get_irq(pdev, 0);
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2458  	if (irq < 0)
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2459  		return irq;
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2460  
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2461  	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2462  	if (!host)
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2463  		return -ENOMEM;
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2464  
d07ebeaa651a9e Andy Shevchenko             2024-04-17  2465  	host->dev = dev;
965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2466  	spin_lock_init(&host->lock);
965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2467  	INIT_LIST_HEAD(&host->queue);
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2468  
0a454e95230886 Andy Shevchenko             2024-04-25  2469  	ret = atmci_of_init(host);
0a454e95230886 Andy Shevchenko             2024-04-25  2470  	if (ret)
0a454e95230886 Andy Shevchenko             2024-04-25  2471  		return dev_err_probe(dev, ret, "Slot information not available\n");
0a454e95230886 Andy Shevchenko             2024-04-25  2472  
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2473  	host->mck = devm_clk_get(dev, "mci_clk");
7bca646e0fc34b Pramod Gurav                2014-09-23  2474  	if (IS_ERR(host->mck))
7bca646e0fc34b Pramod Gurav                2014-09-23  2475  		return PTR_ERR(host->mck);
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2476  
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2477  	host->regs = devm_ioremap(dev, regs->start, resource_size(regs));
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2478  	if (!host->regs)
7bca646e0fc34b Pramod Gurav                2014-09-23  2479  		return -ENOMEM;
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2480  
b3894f267d9614 Boris Brezillon             2013-07-18  2481  	ret = clk_prepare_enable(host->mck);
b3894f267d9614 Boris Brezillon             2013-07-18  2482  	if (ret)
7bca646e0fc34b Pramod Gurav                2014-09-23  2483  		return ret;
7bca646e0fc34b Pramod Gurav                2014-09-23  2484  
03fc9a7f0c48a0 Ludovic Desroches           2011-08-11  2485  	atmci_writel(host, ATMCI_CR, ATMCI_CR_SWRST);
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2486  	host->bus_hz = clk_get_rate(host->mck);
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2487  
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2488  	host->mapbase = regs->start;
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2489  
82a5d372ed0180 Emil Renner Berthing        2021-02-04  2490  	tasklet_setup(&host->tasklet, atmci_tasklet_func);
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2491  
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2492  	ret = request_irq(irq, atmci_interrupt, 0, dev_name(dev), host);
ae552ab02cd556 Wenyou Yang                 2014-10-30  2493  	if (ret) {
ae552ab02cd556 Wenyou Yang                 2014-10-30  2494  		clk_disable_unprepare(host->mck);
7bca646e0fc34b Pramod Gurav                2014-09-23  2495  		return ret;
ae552ab02cd556 Wenyou Yang                 2014-10-30  2496  	}
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2497  
796211b7953bd1 Ludovic Desroches           2011-08-11  2498  	/* Get MCI capabilities and set operations according to it */
796211b7953bd1 Ludovic Desroches           2011-08-11  2499  	atmci_get_cap(host);
467e081d23e67f ludovic.desroches@atmel.com 2014-12-01  2500  	ret = atmci_configure_dma(host);
467e081d23e67f ludovic.desroches@atmel.com 2014-12-01  2501  	if (ret == -EPROBE_DEFER)
467e081d23e67f ludovic.desroches@atmel.com 2014-12-01  2502  		goto err_dma_probe_defer;
467e081d23e67f ludovic.desroches@atmel.com 2014-12-01  2503  	if (ret == 0) {
796211b7953bd1 Ludovic Desroches           2011-08-11  2504  		host->prepare_data = &atmci_prepare_data_dma;
796211b7953bd1 Ludovic Desroches           2011-08-11  2505  		host->submit_data = &atmci_submit_data_dma;
796211b7953bd1 Ludovic Desroches           2011-08-11  2506  		host->stop_transfer = &atmci_stop_transfer_dma;
796211b7953bd1 Ludovic Desroches           2011-08-11  2507  	} else if (host->caps.has_pdc) {
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2508  		dev_info(dev, "using PDC\n");
796211b7953bd1 Ludovic Desroches           2011-08-11  2509  		host->prepare_data = &atmci_prepare_data_pdc;
796211b7953bd1 Ludovic Desroches           2011-08-11  2510  		host->submit_data = &atmci_submit_data_pdc;
796211b7953bd1 Ludovic Desroches           2011-08-11  2511  		host->stop_transfer = &atmci_stop_transfer_pdc;
796211b7953bd1 Ludovic Desroches           2011-08-11  2512  	} else {
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2513  		dev_info(dev, "using PIO\n");
796211b7953bd1 Ludovic Desroches           2011-08-11  2514  		host->prepare_data = &atmci_prepare_data;
796211b7953bd1 Ludovic Desroches           2011-08-11  2515  		host->submit_data = &atmci_submit_data;
796211b7953bd1 Ludovic Desroches           2011-08-11  2516  		host->stop_transfer = &atmci_stop_transfer;
796211b7953bd1 Ludovic Desroches           2011-08-11  2517  	}
796211b7953bd1 Ludovic Desroches           2011-08-11  2518  
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2519  	platform_set_drvdata(pdev, host);
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2520  
2ee4f6200597bd Kees Cook                   2017-10-24  2521  	timer_setup(&host->timer, atmci_timeout_timer, 0);
b87cc1b5d3a96e Ludovic Desroches           2012-05-23  2522  
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2523  	pm_runtime_get_noresume(dev);
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2524  	pm_runtime_set_active(dev);
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2525  	pm_runtime_set_autosuspend_delay(dev, AUTOSUSPEND_DELAY);
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2526  	pm_runtime_use_autosuspend(dev);
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2527  	pm_runtime_enable(dev);
ae552ab02cd556 Wenyou Yang                 2014-10-30  2528  
965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2529  	/* We need at least one slot to succeed */
965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2530  	nr_slots = 0;
965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2531  	ret = -ENODEV;
0a454e95230886 Andy Shevchenko             2024-04-25  2532  	if (host->pdata[0].bus_width) {
0a454e95230886 Andy Shevchenko             2024-04-25  2533  		ret = atmci_init_slot(host, &host->pdata[0],
2c96a293bbd6b3 Ludovic Desroches           2011-08-11  2534  				0, ATMCI_SDCSEL_SLOT_A, ATMCI_SDIOIRQA);
7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2535  		if (!ret) {
965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2536  			nr_slots++;
7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2537  			host->buf_size = host->slot[0]->mmc->max_req_size;
7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2538  		}
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2539  	}
0a454e95230886 Andy Shevchenko             2024-04-25  2540  	if (host->pdata[1].bus_width) {
0a454e95230886 Andy Shevchenko             2024-04-25  2541  		ret = atmci_init_slot(host, &host->pdata[1],
2c96a293bbd6b3 Ludovic Desroches           2011-08-11  2542  				1, ATMCI_SDCSEL_SLOT_B, ATMCI_SDIOIRQB);
7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2543  		if (!ret) {
965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2544  			nr_slots++;
7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2545  			if (host->slot[1]->mmc->max_req_size > host->buf_size)
7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2546  				host->buf_size =
7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2547  					host->slot[1]->mmc->max_req_size;
7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2548  		}
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2549  	}
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2550  
04d699c3643fbf Rob Emanuele                2009-09-22  2551  	if (!nr_slots) {
e38063b94324bc Andy Shevchenko             2024-04-25 @2552  		dev_err_probe(dev, ret, "init failed: no slot defined\n");
965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2553  		goto err_init_slot;
04d699c3643fbf Rob Emanuele                2009-09-22  2554  	}
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2555  
7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2556  	if (!host->caps.has_rwproof) {
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2557  		host->buffer = dma_alloc_coherent(dev, host->buf_size,
7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2558  		                                  &host->buf_phys_addr,
7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2559  						  GFP_KERNEL);
7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2560  		if (!host->buffer) {
e38063b94324bc Andy Shevchenko             2024-04-25  2561  			ret = dev_err_probe(dev, -ENOMEM, "buffer allocation failed\n");
528bc7808f4e36 Pramod Gurav                2014-09-23  2562  			goto err_dma_alloc;
7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2563  		}
7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2564  	}
7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2565  
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2566  	dev_info(dev, "Atmel MCI controller at 0x%08lx irq %d, %u slots\n",
965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2567  		 host->mapbase, irq, nr_slots);
deec9ae31e6079 Haavard Skinnemoen          2008-07-24  2568  
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2569  	pm_runtime_mark_last_busy(dev);
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2570  	pm_runtime_put_autosuspend(dev);
ae552ab02cd556 Wenyou Yang                 2014-10-30  2571  
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2572  	return 0;
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2573  
528bc7808f4e36 Pramod Gurav                2014-09-23  2574  err_dma_alloc:
528bc7808f4e36 Pramod Gurav                2014-09-23  2575  	for (i = 0; i < ATMCI_MAX_NR_SLOTS; i++) {
528bc7808f4e36 Pramod Gurav                2014-09-23  2576  		if (host->slot[i])
528bc7808f4e36 Pramod Gurav                2014-09-23  2577  			atmci_cleanup_slot(host->slot[i], i);
528bc7808f4e36 Pramod Gurav                2014-09-23  2578  	}
965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2579  err_init_slot:
ae552ab02cd556 Wenyou Yang                 2014-10-30  2580  	clk_disable_unprepare(host->mck);
ae552ab02cd556 Wenyou Yang                 2014-10-30  2581  
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2582  	pm_runtime_disable(dev);
5c30bd24a89dc3 Andy Shevchenko             2024-04-17  2583  	pm_runtime_put_noidle(dev);
ae552ab02cd556 Wenyou Yang                 2014-10-30  2584  
528bc7808f4e36 Pramod Gurav                2014-09-23  2585  	del_timer_sync(&host->timer);
467e081d23e67f ludovic.desroches@atmel.com 2014-12-01  2586  	if (!IS_ERR(host->dma.chan))
74465b4ff9ac1d Dan Williams                2009-01-06  2587  		dma_release_channel(host->dma.chan);
467e081d23e67f ludovic.desroches@atmel.com 2014-12-01  2588  err_dma_probe_defer:
965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2589  	free_irq(irq, host);
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2590  	return ret;
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2591  }
7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2592  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
