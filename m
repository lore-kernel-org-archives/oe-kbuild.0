Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E0E366DB5
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774685336; cv=none; b=YEjD4nZtuTBIHeUVAAABTFBqNDuXa6KVSdyPr+TnhgvYUNZbXqTphARf3/YOiPOyTXWXY2pRGgdiAfZZL/f+nXVPpUtfSI0t/0i91Ib74PEI7fuObXWAg4JzRk4SCIwvH7QtXMxnqgz531J54zRE1wfrst09WvjQX1IAqZeOxc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774685336; c=relaxed/simple;
	bh=npMZwbAMAl/i0P4Nm3ZSZOdSrzcpa4RpUpMt7pR5WGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QEj5Jr6dmsH2pdOpk45tlCAjW/QS6Dblu66tgOZjF1x8qB4z4HWJ8+IqaoVxfrJVI+kMHssicdNMFVeiL6c2gAgabzDZONIGNwM6tqi4DhjdKJGxigqySm/bwCi2qTje0tDgHhmquwVsO8KCSPsS3IvSH1xfZNwvv1uv/sptwvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXPG3KmV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXPG3KmV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-482f454be5bso36061535e9.0
        for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 01:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774685333; x=1775290133; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IYtH4vInPi9cClgPJvN4EemSaGDns1ZER/0zgyBhAKI=;
        b=gXPG3KmVvkQ0D+shC8kyvuQOPfoCNggxtIpmAt4smholq5lfbyi2BCrvS13ZiqBtnz
         daRJYHFf+ycP772uZ7rCEMZusOL/WDzWCO3TcKlWPQuXwaGAsKbWfh7ElM4ZOSPxaM6p
         QIo7PtCPdVTQSIcEqGrjfH0VT8N3vNYISkHBz/N1LpbxzsEtXArA19ebS//dIyJune0o
         h7FbwtASqCQSjLa8GJDIIm91XwKco4RTRSH7S9IavxASsH4pem/X1uvJAfVBoce1nrVy
         Uv/3l7Kxq/yMregjqoVr5It8yRC5nEVveJaWdtMK9f4VytrsYXTYYT/Ia6Mv4fPRC5/Q
         XFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774685333; x=1775290133;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYtH4vInPi9cClgPJvN4EemSaGDns1ZER/0zgyBhAKI=;
        b=TOGpeMbGdkpFpWW+ktYvzaf7zq5WuT9cwigB/vyLaQ9s5QGUHt3FIZU1t4eEkMouhw
         f79oDK7QWQWFmkYiQBUQmlWn5/FoWTL2O9XVm1y3quo0Mm9eeP0v7YOBfjTkwC90jEA7
         BDErdehwOf/2zxKG3erCCGRF1hwul8JixeCxKdSprKe/QqaBoXLMNVmqWiJR2QIbp88e
         VwzTU1S+ur23YqRMPrYS37tfvcY//T7AeomlJAM6GKfIRYzMfMAvQ1UDL+YRI4ytWZqY
         Svq5K//24+qY3GmVp92qMtO5theWZZlFvAYe5/C3TVExkFAnn6oWdFPnvNRirGe5sLoy
         jByw==
X-Gm-Message-State: AOJu0Yzhd4ub3h0PCmmW4xSb66qOQsqIZ0I7byUt5foUCOgB6W8LnIHd
	t7BgCX3GfANRDqGCqfH9/e2K9kfIJRrP/aBBOd3EP+7Zwx+6iuyFCOvRkkl0MA==
X-Gm-Gg: ATEYQzwIb+X+h2lK8TbBwilBOlH81m6p8cNCT5F3XLu4YO/xxe53H0hlIKxUqAHYubj
	pruJ28kc4FIXI22xNe9iJ1Qbe/tbvn/TCRJRoqAVMb6xztvFEreOCvViwn6CzH57e3YC7mbhkLr
	DUHwMBNXVfM9s+MkuRHD9Nw77dBB0/iXCutgt8qphWJ/Pr/0gvpNOvuSrgnyIi+T/r5oDU/uU1W
	4JjxSLrYO9Rk7G89ctsla2kg8MapiR3mIdT8vrSYTfdSIzl5GTq7Hv56CElBvqQQJUZdBuap7n+
	eSUIUeKCvlckinoAYuTES7lrt6Vpb9HovS/PbDvcuf7guF3qakYWDzxZv9LMXZ0FRsUbWnJD1+r
	d61ekxwIl/Rrp1N61z/Pxaj6JtN7FOtjZGBUHgHcFGvPQ/wrbUKWaoSpl4FUWrxVhNfy6fhqxv1
	t4481P68DWlYH8qtyPP1s=
X-Received: by 2002:a05:600c:6487:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-487290d098dmr71060835e9.7.1774685332786;
        Sat, 28 Mar 2026 01:08:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm31506925e9.11.2026.03.28.01.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 01:08:52 -0700 (PDT)
Date: Sat, 28 Mar 2026 11:08:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Sanjay Chitroda <sanjayembeddedse@gmail.com>,
	jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, kees@kernel.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	sanjayembeddedse@gmail.com
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
In-Reply-To: <20260326081815.925373-5-sanjayembedded@gmail.com>
Message-ID: <20260328080848.BZIEO9uLWNYr0u4IVWaSBiTi6zh88qmNGar8s-bbXDc@z>

Hi Sanjay,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sanjay-Chitroda/iio-ssp_sensors-cleanup-codestyle-warning/20260327-131514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260326081815.925373-5-sanjayembedded%40gmail.com
patch subject: [PATCH v4 4/4] iio: ssp_sensors: reuse preallocated RX buffer for SPI transfers
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

Need to goto destroy_comm_lock before returning.

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

Add a destroy_comm_lock: label here.

50dd64d57eee8ae Karol Wrona         2015-01-28  581  	mutex_destroy(&data->comm_lock);
21553258b94861a Christophe JAILLET  2025-10-10  582  err_setup_spi:
21553258b94861a Christophe JAILLET  2025-10-10  583  	mfd_remove_devices(&spi->dev);
50dd64d57eee8ae Karol Wrona         2015-01-28  584  
50dd64d57eee8ae Karol Wrona         2015-01-28  585  	dev_err(&spi->dev, "Probe failed!\n");
50dd64d57eee8ae Karol Wrona         2015-01-28  586  
50dd64d57eee8ae Karol Wrona         2015-01-28  587  	return ret;
50dd64d57eee8ae Karol Wrona         2015-01-28  588  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

