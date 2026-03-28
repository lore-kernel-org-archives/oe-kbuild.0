Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4972D46C0
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 00:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774659528; cv=none; b=D7/TBF5ecc2GnMbYMJrxGAIS8ht15SYRTPvyJyC9bHxeAcFyhcqV/w0CJ5QHBYctYeLQrNDnwIolmjYH5gVOVaXGvGtiOPFrCGWANvvpbszBzfaEv4jn4s0Od3Dfyagw9aSMNHFEwCNiczduniQdy77iprm8IJuSowY6yCKih3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774659528; c=relaxed/simple;
	bh=R7KRjHQFOXtned5bz4OYEfPXI3bhewoFp/9KqdFS+1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bYTT3CwjM/XCa/0hnNCTAEwaBSpTxdRBANjqhHhp6z0kzy1sqBzqe+y8Tq56LLxJ/nRiW26BSH+AquH9tSb2QzsLUJ5t1tdpqQeI0mCXz/ZElZdnk3HFPSRuv/CwArcJpwFH3Wc9oKgAFZJ6PBAiy0C+KRZvmNFb3h63hSfJogE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hs2rmRFr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hs2rmRFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774659524; x=1806195524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R7KRjHQFOXtned5bz4OYEfPXI3bhewoFp/9KqdFS+1w=;
  b=Hs2rmRFrkhaElYsL7bjjbEOXv6+TerE/xR7puUAIbx9IffzQ48NHqaKJ
   E/ZrDdRdw2n/fZJCpmTnPOxCZ8/EwLVtwJcTNRTYOTcnot4K1VtgPGeI+
   T/xVv9JE32YIVuqOQNh5f+UM8PA1FVZ+nJL2zVcmq14HareIQNruyGcx+
   XEbuyBLGEzAKyJRwUtXp5UijD1qaGaOCoaJPkaL4TLFPmNKBmcL0Fm+0N
   GuqkOL5iXGc2ZV4F1lp1Pi2OsiyXdOtM3BjxTGV11sgGSDdWfrSSF/XCy
   ZuuPbTwg8LgDmOvKLMVA6CMk7I5RrXtzCdfd0EKgngpJhU0LKvsk7tGvk
   A==;
X-CSE-ConnectionGUID: kJV6DAd9SHSl+Iw1V8aE3A==
X-CSE-MsgGUID: WlW8h64JR0ienPO/p79NXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="93319035"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="93319035"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 17:58:43 -0700
X-CSE-ConnectionGUID: jPEIGN91RDCRt+CNa7gFsQ==
X-CSE-MsgGUID: igKfTad9QBmPwlTuM1HyuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="225719976"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Mar 2026 17:58:41 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6I0d-00000000Axx-0E7Q;
	Sat, 28 Mar 2026 00:58:39 +0000
Date: Sat, 28 Mar 2026 08:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 4/4] iio: ssp_sensors: reuse preallocated RX buffer
 for SPI transfers
Message-ID: <202603281105.UIsb0ZYk-lkp@intel.com>
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
In-Reply-To: <20260326081815.925373-5-sanjayembedded@gmail.com>
References: <20260326081815.925373-5-sanjayembedded@gmail.com>
TO: Sanjay Chitroda <sanjayembeddedse@gmail.com>
TO: jic23@kernel.org
TO: dlechner@baylibre.com
TO: nuno.sa@analog.com
TO: andy@kernel.org
CC: kees@kernel.org
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: sanjayembeddedse@gmail.com

Hi Sanjay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v7.0-rc5 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sanjay-Chitroda/iio-ssp_sensors-cleanup-codestyle-warning/20260327-131514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260326081815.925373-5-sanjayembedded%40gmail.com
patch subject: [PATCH v4 4/4] iio: ssp_sensors: reuse preallocated RX buffer for SPI transfers
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-161-20260328 (https://download.01.org/0day-ci/archive/20260328/202603281105.UIsb0ZYk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603281105.UIsb0ZYk-lkp@intel.com/

smatch warnings:
drivers/iio/common/ssp_sensors/ssp_dev.c:523 ssp_probe() warn: missing unwind goto?

vim +523 drivers/iio/common/ssp_sensors/ssp_dev.c

50dd64d57eee8ae Karol Wrona         2015-01-28  482  
50dd64d57eee8ae Karol Wrona         2015-01-28  483  static int ssp_probe(struct spi_device *spi)
50dd64d57eee8ae Karol Wrona         2015-01-28  484  {
50dd64d57eee8ae Karol Wrona         2015-01-28  485  	int ret, i;
50dd64d57eee8ae Karol Wrona         2015-01-28  486  	struct ssp_data *data;
50dd64d57eee8ae Karol Wrona         2015-01-28  487  
50dd64d57eee8ae Karol Wrona         2015-01-28  488  	data = ssp_parse_dt(&spi->dev);
50dd64d57eee8ae Karol Wrona         2015-01-28  489  	if (!data) {
50dd64d57eee8ae Karol Wrona         2015-01-28  490  		dev_err(&spi->dev, "Failed to find platform data\n");
50dd64d57eee8ae Karol Wrona         2015-01-28  491  		return -ENODEV;
50dd64d57eee8ae Karol Wrona         2015-01-28  492  	}
50dd64d57eee8ae Karol Wrona         2015-01-28  493  
4c6e3dbc6b4877c Krzysztof Kozlowski 2020-09-21  494  	ret = mfd_add_devices(&spi->dev, PLATFORM_DEVID_NONE,
4c6e3dbc6b4877c Krzysztof Kozlowski 2020-09-21  495  			      sensorhub_sensor_devs,
50dd64d57eee8ae Karol Wrona         2015-01-28  496  			      ARRAY_SIZE(sensorhub_sensor_devs), NULL, 0, NULL);
50dd64d57eee8ae Karol Wrona         2015-01-28  497  	if (ret < 0) {
50dd64d57eee8ae Karol Wrona         2015-01-28  498  		dev_err(&spi->dev, "mfd add devices fail\n");
50dd64d57eee8ae Karol Wrona         2015-01-28  499  		return ret;
50dd64d57eee8ae Karol Wrona         2015-01-28  500  	}
50dd64d57eee8ae Karol Wrona         2015-01-28  501  
50dd64d57eee8ae Karol Wrona         2015-01-28  502  	spi->mode = SPI_MODE_1;
50dd64d57eee8ae Karol Wrona         2015-01-28  503  	ret = spi_setup(spi);
50dd64d57eee8ae Karol Wrona         2015-01-28  504  	if (ret < 0) {
50dd64d57eee8ae Karol Wrona         2015-01-28  505  		dev_err(&spi->dev, "Failed to setup spi\n");
21553258b94861a Christophe JAILLET  2025-10-10  506  		goto err_setup_spi;
50dd64d57eee8ae Karol Wrona         2015-01-28  507  	}
50dd64d57eee8ae Karol Wrona         2015-01-28  508  
50dd64d57eee8ae Karol Wrona         2015-01-28  509  	data->fw_dl_state = SSP_FW_DL_STATE_NONE;
50dd64d57eee8ae Karol Wrona         2015-01-28  510  	data->spi = spi;
50dd64d57eee8ae Karol Wrona         2015-01-28  511  	spi_set_drvdata(spi, data);
50dd64d57eee8ae Karol Wrona         2015-01-28  512  
50dd64d57eee8ae Karol Wrona         2015-01-28  513  	mutex_init(&data->comm_lock);
50dd64d57eee8ae Karol Wrona         2015-01-28  514  
5981e993e348918 Sanjay Chitroda     2026-03-26  515  	data->rx_buf_size = SSP_DATA_PACKET_SIZE;
5981e993e348918 Sanjay Chitroda     2026-03-26  516  	data->rx_buf = devm_kzalloc(&spi->dev,
5981e993e348918 Sanjay Chitroda     2026-03-26  517  				    data->rx_buf_size,
5981e993e348918 Sanjay Chitroda     2026-03-26  518  				    GFP_KERNEL | GFP_DMA);
5981e993e348918 Sanjay Chitroda     2026-03-26  519  
5981e993e348918 Sanjay Chitroda     2026-03-26  520  	if (!data->rx_buf) {
5981e993e348918 Sanjay Chitroda     2026-03-26  521  		dev_err(&spi->dev,
5981e993e348918 Sanjay Chitroda     2026-03-26  522  			"Failed to allocate memory for rx_buf\n");
5981e993e348918 Sanjay Chitroda     2026-03-26 @523  		return -ENOMEM;
5981e993e348918 Sanjay Chitroda     2026-03-26  524  	}
5981e993e348918 Sanjay Chitroda     2026-03-26  525  
50dd64d57eee8ae Karol Wrona         2015-01-28  526  	for (i = 0; i < SSP_SENSOR_MAX; ++i) {
50dd64d57eee8ae Karol Wrona         2015-01-28  527  		data->delay_buf[i] = SSP_DEFAULT_POLLING_DELAY;
50dd64d57eee8ae Karol Wrona         2015-01-28  528  		data->batch_latency_buf[i] = 0;
50dd64d57eee8ae Karol Wrona         2015-01-28  529  		data->batch_opt_buf[i] = 0;
50dd64d57eee8ae Karol Wrona         2015-01-28  530  		data->check_status[i] = SSP_INITIALIZATION_STATE;
50dd64d57eee8ae Karol Wrona         2015-01-28  531  	}
50dd64d57eee8ae Karol Wrona         2015-01-28  532  
50dd64d57eee8ae Karol Wrona         2015-01-28  533  	data->delay_buf[SSP_BIO_HRM_LIB] = 100;
50dd64d57eee8ae Karol Wrona         2015-01-28  534  
50dd64d57eee8ae Karol Wrona         2015-01-28  535  	data->time_syncing = true;
50dd64d57eee8ae Karol Wrona         2015-01-28  536  
50dd64d57eee8ae Karol Wrona         2015-01-28  537  	mutex_init(&data->pending_lock);
50dd64d57eee8ae Karol Wrona         2015-01-28  538  	INIT_LIST_HEAD(&data->pending_list);
50dd64d57eee8ae Karol Wrona         2015-01-28  539  
50dd64d57eee8ae Karol Wrona         2015-01-28  540  	atomic_set(&data->enable_refcount, 0);
50dd64d57eee8ae Karol Wrona         2015-01-28  541  
50dd64d57eee8ae Karol Wrona         2015-01-28  542  	INIT_WORK(&data->work_wdt, ssp_wdt_work_func);
50dd64d57eee8ae Karol Wrona         2015-01-28  543  	INIT_DELAYED_WORK(&data->work_refresh, ssp_refresh_task);
50dd64d57eee8ae Karol Wrona         2015-01-28  544  
e99e88a9d2b0674 Kees Cook           2017-10-16  545  	timer_setup(&data->wdt_timer, ssp_wdt_timer_func, 0);
50dd64d57eee8ae Karol Wrona         2015-01-28  546  
50dd64d57eee8ae Karol Wrona         2015-01-28  547  	ret = request_threaded_irq(data->spi->irq, NULL,
50dd64d57eee8ae Karol Wrona         2015-01-28  548  				   ssp_irq_thread_fn,
50dd64d57eee8ae Karol Wrona         2015-01-28  549  				   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
50dd64d57eee8ae Karol Wrona         2015-01-28  550  				   "SSP_Int", data);
50dd64d57eee8ae Karol Wrona         2015-01-28  551  	if (ret < 0) {
50dd64d57eee8ae Karol Wrona         2015-01-28  552  		dev_err(&spi->dev, "Irq request fail\n");
50dd64d57eee8ae Karol Wrona         2015-01-28  553  		goto err_setup_irq;
50dd64d57eee8ae Karol Wrona         2015-01-28  554  	}
50dd64d57eee8ae Karol Wrona         2015-01-28  555  
50dd64d57eee8ae Karol Wrona         2015-01-28  556  	/* Let's start with enabled one so irq balance could be ok */
50dd64d57eee8ae Karol Wrona         2015-01-28  557  	data->shut_down = false;
50dd64d57eee8ae Karol Wrona         2015-01-28  558  
50dd64d57eee8ae Karol Wrona         2015-01-28  559  	/* just to avoid unbalanced irq set wake up */
50dd64d57eee8ae Karol Wrona         2015-01-28  560  	enable_irq_wake(data->spi->irq);
50dd64d57eee8ae Karol Wrona         2015-01-28  561  
50dd64d57eee8ae Karol Wrona         2015-01-28  562  	data->fw_dl_state = ssp_check_fwbl(data);
50dd64d57eee8ae Karol Wrona         2015-01-28  563  	if (data->fw_dl_state == SSP_FW_DL_STATE_NONE) {
50dd64d57eee8ae Karol Wrona         2015-01-28  564  		ret = ssp_initialize_mcu(data);
50dd64d57eee8ae Karol Wrona         2015-01-28  565  		if (ret < 0) {
50dd64d57eee8ae Karol Wrona         2015-01-28  566  			dev_err(&spi->dev, "Initialize_mcu failed\n");
50dd64d57eee8ae Karol Wrona         2015-01-28  567  			goto err_read_reg;
50dd64d57eee8ae Karol Wrona         2015-01-28  568  		}
50dd64d57eee8ae Karol Wrona         2015-01-28  569  	} else {
50dd64d57eee8ae Karol Wrona         2015-01-28  570  		dev_err(&spi->dev, "Firmware version not supported\n");
50dd64d57eee8ae Karol Wrona         2015-01-28  571  		ret = -EPERM;
50dd64d57eee8ae Karol Wrona         2015-01-28  572  		goto err_read_reg;
50dd64d57eee8ae Karol Wrona         2015-01-28  573  	}
50dd64d57eee8ae Karol Wrona         2015-01-28  574  
50dd64d57eee8ae Karol Wrona         2015-01-28  575  	return 0;
50dd64d57eee8ae Karol Wrona         2015-01-28  576  
50dd64d57eee8ae Karol Wrona         2015-01-28  577  err_read_reg:
50dd64d57eee8ae Karol Wrona         2015-01-28  578  	free_irq(data->spi->irq, data);
50dd64d57eee8ae Karol Wrona         2015-01-28  579  err_setup_irq:
50dd64d57eee8ae Karol Wrona         2015-01-28  580  	mutex_destroy(&data->pending_lock);
50dd64d57eee8ae Karol Wrona         2015-01-28  581  	mutex_destroy(&data->comm_lock);
21553258b94861a Christophe JAILLET  2025-10-10  582  err_setup_spi:
21553258b94861a Christophe JAILLET  2025-10-10  583  	mfd_remove_devices(&spi->dev);
50dd64d57eee8ae Karol Wrona         2015-01-28  584  
50dd64d57eee8ae Karol Wrona         2015-01-28  585  	dev_err(&spi->dev, "Probe failed!\n");
50dd64d57eee8ae Karol Wrona         2015-01-28  586  
50dd64d57eee8ae Karol Wrona         2015-01-28  587  	return ret;
50dd64d57eee8ae Karol Wrona         2015-01-28  588  }
50dd64d57eee8ae Karol Wrona         2015-01-28  589  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
