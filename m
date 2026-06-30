Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5013F224AF9
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jun 2026 02:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782785262; cv=none; b=gkkKyj4Q1IUQbwOzgtFB4RxvNYMuxm3CsZ8vyG0Yy1M5tYFev30QI4c4kIGZSgWYJjO1aOtwwAsSxVlnq6XiRGD0q6euDx/zhxR+6aTMQ30jBD+sXZ7IpVIGtvTCvIycr8DlqNEANmdQPaeCSPTJ1o0kOtAo0S/b3tyYnLQsrQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782785262; c=relaxed/simple;
	bh=NvC+4XYkogKGk4n4tL/Crum9bbd0li97KxyEzNVWoe8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZpeRES807CcaoLklAKe7SvdnJbYnFtZ5Um7F7x+/DGte0Emo5OI7ojT+pf5lmwoB4k3FHpu0MAjt3TOyDR3RkXmdQJGjoT+WA2vjFIjohzSAvsKtdrh3qcqHF1LMq65oDpLigqqqYlXoxjIYwr4Z9eAHNH+NAnpcan6+B8WV5Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jPPsa5yA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jPPsa5yA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782785261; x=1814321261;
  h=date:from:to:cc:subject:message-id;
  bh=NvC+4XYkogKGk4n4tL/Crum9bbd0li97KxyEzNVWoe8=;
  b=jPPsa5yA+xVRPshp564J08rkl8+dWdm3YBWIOEGoj433cyaEjjpaN5Tc
   Be9hXhw+xNoc/V2NR513oCVyeROdRk363zFAq/2qDuRBVU8Yxs8uoLpNx
   PpBgY0iTZyxB2mH/IwjmzRDfMK0JYtCwNlrx9OgSYLspJNhTH/iLtG7uq
   fAIpzv68HCU0IXVydAvqcFIN9NTD1IGhQYzrytF/umBOLUuR0HfNzQ0+2
   ok00TF6RZIprIgjbKlc+Jobb+BfTOo6ZdjS3sp388Tfk8urDrDwsJ0q0J
   LdJa+12Ej76KmTVdDCi1A8Hyl43utJGHxIFush4j3nRdDehSCD+kjnBe/
   A==;
X-CSE-ConnectionGUID: 90htkkeISCmC5J+PZlENRg==
X-CSE-MsgGUID: i6kBtUpYS+mSrhcBOFwOPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83688322"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83688322"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 19:07:40 -0700
X-CSE-ConnectionGUID: gGsE0IN8SXeXggDVG1r0Yg==
X-CSE-MsgGUID: S3ZAj7r1QkGFwoYCYS1XwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="276389547"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jun 2026 19:07:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weNsu-000000007x5-0Oig;
	Tue, 30 Jun 2026 02:07:36 +0000
Date: Tue, 30 Jun 2026 10:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 330/1356] drivers/spi/spi.c:1932
 __spi_pump_messages() error: calling 'spin_unlock_irqrestore()' with bogus
 flags
Message-ID: <202606301010.XjYqHlBr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
commit: e07d10ed0f238d3f4a8276932a36fe1f74775621 [330/1356] lib/Kconfig.debug: enable CONFIG_PREEMPT_RT for syzbot kernels.
:::::: branch date: 11 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-r072-20260630 (https://download.01.org/0day-ci/archive/20260630/202606301010.XjYqHlBr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606301010.XjYqHlBr-lkp@intel.com/

smatch warnings:
drivers/spi/spi.c:1932 __spi_pump_messages() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/spi/spi.c:4658 spi_async() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/spi/spi.c:4758 __spi_sync() error: calling 'spin_unlock_irqrestore()' with bogus flags

vim +1932 drivers/spi/spi.c

ae7d2346dc89ae David Jander       2022-06-21  1837  
ffbbdd21329f3e Linus Walleij      2012-02-22  1838  /**
702ca0269ed56e Andy Shevchenko    2023-07-10  1839   * __spi_pump_messages - function which processes SPI message queue
8caab75fd2c2a9 Geert Uytterhoeven 2017-06-13  1840   * @ctlr: controller to process queue for
fc9e0f71f2d7ea Mark Brown         2014-12-10  1841   * @in_kthread: true if we are in the context of the message pump thread
ffbbdd21329f3e Linus Walleij      2012-02-22  1842   *
702ca0269ed56e Andy Shevchenko    2023-07-10  1843   * This function checks if there is any SPI message in the queue that
ffbbdd21329f3e Linus Walleij      2012-02-22  1844   * needs processing and if so call out to the driver to initialize hardware
ffbbdd21329f3e Linus Walleij      2012-02-22  1845   * and transfer each message.
ffbbdd21329f3e Linus Walleij      2012-02-22  1846   *
0461a4149836c7 Mark Brown         2014-12-09  1847   * Note that it is called both from the kthread itself and also from
0461a4149836c7 Mark Brown         2014-12-09  1848   * inside spi_sync(); the queue extraction handling at the top of the
0461a4149836c7 Mark Brown         2014-12-09  1849   * function should deal with this safely.
ffbbdd21329f3e Linus Walleij      2012-02-22  1850   */
8caab75fd2c2a9 Geert Uytterhoeven 2017-06-13  1851  static void __spi_pump_messages(struct spi_controller *ctlr, bool in_kthread)
ffbbdd21329f3e Linus Walleij      2012-02-22  1852  {
d1c44c9342c17e Vladimir Oltean    2019-09-05  1853  	struct spi_message *msg;
ffbbdd21329f3e Linus Walleij      2012-02-22  1854  	bool was_busy = false;
d1c44c9342c17e Vladimir Oltean    2019-09-05  1855  	unsigned long flags;
ffbbdd21329f3e Linus Walleij      2012-02-22  1856  	int ret;
ffbbdd21329f3e Linus Walleij      2012-02-22  1857  
702ca0269ed56e Andy Shevchenko    2023-07-10  1858  	/* Take the I/O mutex */
c1038165fbbf83 David Jander       2022-06-21  1859  	mutex_lock(&ctlr->io_mutex);
c1038165fbbf83 David Jander       2022-06-21  1860  
983aee5d7090cf Mark Brown         2014-12-09  1861  	/* Lock queue */
8caab75fd2c2a9 Geert Uytterhoeven 2017-06-13  1862  	spin_lock_irqsave(&ctlr->queue_lock, flags);
983aee5d7090cf Mark Brown         2014-12-09  1863  
983aee5d7090cf Mark Brown         2014-12-09  1864  	/* Make sure we are not already running a message */
8711a2ab51dd47 David Jander       2022-06-21  1865  	if (ctlr->cur_msg)
c1038165fbbf83 David Jander       2022-06-21  1866  		goto out_unlock;
983aee5d7090cf Mark Brown         2014-12-09  1867  
983aee5d7090cf Mark Brown         2014-12-09  1868  	/* Check if the queue is idle */
8caab75fd2c2a9 Geert Uytterhoeven 2017-06-13  1869  	if (list_empty(&ctlr->queue) || !ctlr->running) {
8711a2ab51dd47 David Jander       2022-06-21  1870  		if (!ctlr->busy)
c1038165fbbf83 David Jander       2022-06-21  1871  			goto out_unlock;
fc9e0f71f2d7ea Mark Brown         2014-12-10  1872  
e126859729ed4a Mark Brown         2020-07-15  1873  		/* Defer any non-atomic teardown to the thread */
f0125f1a559be1 Mark Brown         2019-01-23  1874  		if (!in_kthread) {
e126859729ed4a Mark Brown         2020-07-15  1875  			if (!ctlr->dummy_rx && !ctlr->dummy_tx &&
e126859729ed4a Mark Brown         2020-07-15  1876  			    !ctlr->unprepare_transfer_hardware) {
e126859729ed4a Mark Brown         2020-07-15  1877  				spi_idle_runtime_pm(ctlr);
e126859729ed4a Mark Brown         2020-07-15  1878  				ctlr->busy = false;
ae7d2346dc89ae David Jander       2022-06-21  1879  				ctlr->queue_empty = true;
e126859729ed4a Mark Brown         2020-07-15  1880  				trace_spi_controller_idle(ctlr);
e126859729ed4a Mark Brown         2020-07-15  1881  			} else {
60a883d119ab9e Marek Szyprowski   2020-07-09  1882  				kthread_queue_work(ctlr->kworker,
f0125f1a559be1 Mark Brown         2019-01-23  1883  						   &ctlr->pump_messages);
e126859729ed4a Mark Brown         2020-07-15  1884  			}
c1038165fbbf83 David Jander       2022-06-21  1885  			goto out_unlock;
f0125f1a559be1 Mark Brown         2019-01-23  1886  		}
f0125f1a559be1 Mark Brown         2019-01-23  1887  
f0125f1a559be1 Mark Brown         2019-01-23  1888  		ctlr->busy = false;
f0125f1a559be1 Mark Brown         2019-01-23  1889  		spin_unlock_irqrestore(&ctlr->queue_lock, flags);
f0125f1a559be1 Mark Brown         2019-01-23  1890  
f0125f1a559be1 Mark Brown         2019-01-23  1891  		kfree(ctlr->dummy_rx);
f0125f1a559be1 Mark Brown         2019-01-23  1892  		ctlr->dummy_rx = NULL;
f0125f1a559be1 Mark Brown         2019-01-23  1893  		kfree(ctlr->dummy_tx);
f0125f1a559be1 Mark Brown         2019-01-23  1894  		ctlr->dummy_tx = NULL;
f0125f1a559be1 Mark Brown         2019-01-23  1895  		if (ctlr->unprepare_transfer_hardware &&
f0125f1a559be1 Mark Brown         2019-01-23  1896  		    ctlr->unprepare_transfer_hardware(ctlr))
f0125f1a559be1 Mark Brown         2019-01-23  1897  			dev_err(&ctlr->dev,
f0125f1a559be1 Mark Brown         2019-01-23  1898  				"failed to unprepare transfer hardware\n");
e126859729ed4a Mark Brown         2020-07-15  1899  		spi_idle_runtime_pm(ctlr);
f0125f1a559be1 Mark Brown         2019-01-23  1900  		trace_spi_controller_idle(ctlr);
f0125f1a559be1 Mark Brown         2019-01-23  1901  
f0125f1a559be1 Mark Brown         2019-01-23  1902  		spin_lock_irqsave(&ctlr->queue_lock, flags);
ae7d2346dc89ae David Jander       2022-06-21  1903  		ctlr->queue_empty = true;
c1038165fbbf83 David Jander       2022-06-21  1904  		goto out_unlock;
ffbbdd21329f3e Linus Walleij      2012-02-22  1905  	}
ffbbdd21329f3e Linus Walleij      2012-02-22  1906  
ffbbdd21329f3e Linus Walleij      2012-02-22  1907  	/* Extract head of queue */
d1c44c9342c17e Vladimir Oltean    2019-09-05  1908  	msg = list_first_entry(&ctlr->queue, struct spi_message, queue);
d1c44c9342c17e Vladimir Oltean    2019-09-05  1909  	ctlr->cur_msg = msg;
ffbbdd21329f3e Linus Walleij      2012-02-22  1910  
d1c44c9342c17e Vladimir Oltean    2019-09-05  1911  	list_del_init(&msg->queue);
8caab75fd2c2a9 Geert Uytterhoeven 2017-06-13  1912  	if (ctlr->busy)
ffbbdd21329f3e Linus Walleij      2012-02-22  1913  		was_busy = true;
ffbbdd21329f3e Linus Walleij      2012-02-22  1914  	else
8caab75fd2c2a9 Geert Uytterhoeven 2017-06-13  1915  		ctlr->busy = true;
8caab75fd2c2a9 Geert Uytterhoeven 2017-06-13  1916  	spin_unlock_irqrestore(&ctlr->queue_lock, flags);
ffbbdd21329f3e Linus Walleij      2012-02-22  1917  
ae7d2346dc89ae David Jander       2022-06-21  1918  	ret = __spi_pump_transfer_message(ctlr, msg, was_busy);
69fa95905d4084 David Jander       2022-06-21  1919  	kthread_queue_work(ctlr->kworker, &ctlr->pump_messages);
c191543e99fc03 David Jander       2022-06-29  1920  
69fa95905d4084 David Jander       2022-06-21  1921  	ctlr->cur_msg = NULL;
69fa95905d4084 David Jander       2022-06-21  1922  	ctlr->fallback = false;
69fa95905d4084 David Jander       2022-06-21  1923  
8caab75fd2c2a9 Geert Uytterhoeven 2017-06-13  1924  	mutex_unlock(&ctlr->io_mutex);
628269704f19fc Mark Brown         2016-02-15  1925  
628269704f19fc Mark Brown         2016-02-15  1926  	/* Prod the scheduler in case transfer_one() was busy waiting */
49023d2e4ead0f Jon Hunter         2016-03-08  1927  	if (!ret)
628269704f19fc Mark Brown         2016-02-15  1928  		cond_resched();
c1038165fbbf83 David Jander       2022-06-21  1929  	return;
c1038165fbbf83 David Jander       2022-06-21  1930  
c1038165fbbf83 David Jander       2022-06-21  1931  out_unlock:
8711a2ab51dd47 David Jander       2022-06-21 @1932  	spin_unlock_irqrestore(&ctlr->queue_lock, flags);
c1038165fbbf83 David Jander       2022-06-21  1933  	mutex_unlock(&ctlr->io_mutex);
ffbbdd21329f3e Linus Walleij      2012-02-22  1934  }
ffbbdd21329f3e Linus Walleij      2012-02-22  1935  

:::::: The code at line 1932 was first introduced by commit
:::::: 8711a2ab51dd47b2bcb3880403add25dd7fc7c13 spi: __spi_pump_messages: Consolidate spin_unlocks to goto target

:::::: TO: David Jander <david@protonic.nl>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
