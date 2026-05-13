Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1743BB105
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 07:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778655769; cv=none; b=Ny3F+yno+dWuQmuav7LiNf+co4o+joQvqCDzbG6sYTEB5HAUoQBDFWvpn7yT0rSMx6cko0s5fLlbHkhsmJ/R88JMpuFk6qvpcEoksE8aB1If4CSafnSP9hiI3cWvE3GXtz2ybEM3XOXhHG2IpKd9862eFE7M8UcTiKJP6+0T4wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778655769; c=relaxed/simple;
	bh=mpUKT8TUWOu+NvHjj4khiUsbazgnG3/DSa9HDdzmuIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Am4nBooeQ7AazYhRzpk6OTBTOgeadpzbIC3xf7wt9V8JAucYXp8YBYdbIZ3kLD5MIR2mb8530u2bHlcqTWkJEgoUmWNarI+PFA/4Zs6/I6iCzFCsjfWJ4p3l3FZvuRSY+96rC50vDHqzX+3hqayoxAPDE9gDC2HFPO30Gp4I/JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyCQKVRE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyCQKVRE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ad135063so51117725e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 00:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778655766; x=1779260566; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biEAIKt2WrI79RD7D4WpxXDh5BCllZmpXOMRLRH//Fg=;
        b=dyCQKVRENJPSQc73o6/z9SOCtGYyQxgjDcQ/ZUZgPtaa1+CzPQ8HYh3KM1MMd46qAh
         JD7l4eNPgnlfE9o/Nu/K/Ng+buZ8szxx4/FpbaItRInfeqOHGQcUnV5WUlGTiVWlc3Ec
         oxURvvu2xlmwHg6D0D96flpOq36Go7jNGfaoE+xQCwGpybGtW5nP2oPl6MH6AcTqi8T+
         Qg/e5ki1ZTh3Vc249K5KqnQnZEeONY1gy4mpjdgKnSU+JEl+pKKo7jxVkDK6gVo1JyFU
         c5h5Ghc59t8aa5TdB3TTnGS79FYXn7OSLp0xC/oLLAFCuZq6MKl0ye72zfdrzQ3kVP5F
         8v4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778655766; x=1779260566;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=biEAIKt2WrI79RD7D4WpxXDh5BCllZmpXOMRLRH//Fg=;
        b=VTLqxyFUit+PX4pUhui/V0nCLTB1KRhxKQ70dZcvJGW+USWYmBGNRTpmvRU2a5B9oF
         C8KE0WmSu8ZMhdTvscZlLiIS4KObw9IDV7mXjnRPJB4EyfQK4bhPS09AoZgMQvRAkmmL
         9Aqz8KzkbyZ0n15eb9KwES0obztxEk/CPNJ5Mk/letz+2rraB/FEYGcuoYZ9yHtdRB5B
         3CuBOwp/V6Id1DGZ6Luk/IreOcjx5dwHmbXR2ThkGO8EYsuHuBsI+hWI8eqUDc/vvR0b
         Ch0Hd0vXXadBWX+kuRCpzWpk4P8N9F2kB1R2BvSLye5DNhinJa1pn6LlEZb6OJRKwTRA
         Nx4g==
X-Gm-Message-State: AOJu0YwmARFw6zlPGgl3Qk3RnygoDDRuyziekcGSZn+fG++quHpZlawX
	zYj6bAnb42o69dypwdzrBoGHkaySAHziTrMR/7qVyCp3OJY3a3kGk07a16LnJn1Y
X-Gm-Gg: Acq92OGit6MVYa3rbm29/mhrgJkt3t3MgyJjd22BlW7slQJiik3kW4gkDmmAiUgaEZX
	T3Mz+4am9/I7nNerQkZ5V+CWdzndbU1T5/xjj7Tojxe/f5cXZtcsuRd+j4/Znf+2SO0t5sdLaHV
	EJPxVB9PRVc1kbXaZB8SyycnNSHGqGi/j2UxYqtdPsYOY3dTdDQx3ET/m9Rwdpn8AMhe7Udhsz8
	6Z63enBUeX5h8SlJqkkspCcFFVZfAuLOZVmw3q3KrKSlwHKC0RVwXOlE622ftjvbs8S4FwjC5ef
	qObRz63jS6S16mBUmT6ac2xOAXQTNOwYdOtO8nY55m3SyfqUBhhW5B0cyynuUQ1w6NZ6LiNjnaL
	EIbglsfYEUrjb7/YQCIVln/Y05833+F4fWRs4H6xmV8J++jHaZ1mbTIEjm2hL95dgjyVrWlmXdW
	wiS4CNyO6eC3Wupp2ImxM=
X-Received: by 2002:a05:600c:1547:b0:48e:8499:4bd7 with SMTP id 5b1f17b1804b1-48fce9eb099mr19219965e9.17.1778655765222;
        Wed, 13 May 2026 00:02:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce066eeasm24734955e9.7.2026.05.13.00.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:02:44 -0700 (PDT)
Date: Wed, 13 May 2026 10:02:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Salah Triki <salah.triki@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <jic23@kernel.org>
Subject: [jic23-iio:fixes-togreg 31/32]
 drivers/iio/potentiostat/lmp91000.c:353 lmp91000_probe() warn: missing
 unwind goto?
Message-ID: <202605130437.SgMZ43gQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260513070240.hdar0VOKGpF-v_V9RgNR6vkuAqeQC0FfAc4g9ZMU0kw@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git fixes-togreg
head:   2ec11ebb4d0dea4aa9604f8336cd1e1c390d5dcb
commit: 82764dcb3643c70649f14fe8e92e667955574a8c [31/32] iio: potentiostat: lmp91000: fix probe order and cleanup paths
config: i386-randconfig-141-20260512 (https://download.01.org/0day-ci/archive/20260513/202605130437.SgMZ43gQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605130437.SgMZ43gQ-lkp@intel.com/

smatch warnings:
drivers/iio/potentiostat/lmp91000.c:353 lmp91000_probe() warn: missing unwind goto?

vim +353 drivers/iio/potentiostat/lmp91000.c

7d8b3e100abeeff Uwe Kleine-König 2022-11-18  295  static int lmp91000_probe(struct i2c_client *client)
67e17300dc1d760 Matt Ranostay    2016-09-24  296  {
67e17300dc1d760 Matt Ranostay    2016-09-24  297  	struct device *dev = &client->dev;
67e17300dc1d760 Matt Ranostay    2016-09-24  298  	struct lmp91000_data *data;
67e17300dc1d760 Matt Ranostay    2016-09-24  299  	struct iio_dev *indio_dev;
67e17300dc1d760 Matt Ranostay    2016-09-24  300  	int ret;
67e17300dc1d760 Matt Ranostay    2016-09-24  301  
67e17300dc1d760 Matt Ranostay    2016-09-24  302  	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
67e17300dc1d760 Matt Ranostay    2016-09-24  303  	if (!indio_dev)
67e17300dc1d760 Matt Ranostay    2016-09-24  304  		return -ENOMEM;
67e17300dc1d760 Matt Ranostay    2016-09-24  305  
67e17300dc1d760 Matt Ranostay    2016-09-24  306  	indio_dev->info = &lmp91000_info;
67e17300dc1d760 Matt Ranostay    2016-09-24  307  	indio_dev->channels = lmp91000_channels;
67e17300dc1d760 Matt Ranostay    2016-09-24  308  	indio_dev->num_channels = ARRAY_SIZE(lmp91000_channels);
67e17300dc1d760 Matt Ranostay    2016-09-24  309  	indio_dev->name = LMP91000_DRV_NAME;
67e17300dc1d760 Matt Ranostay    2016-09-24  310  	indio_dev->modes = INDIO_DIRECT_MODE;
67e17300dc1d760 Matt Ranostay    2016-09-24  311  	i2c_set_clientdata(client, indio_dev);
67e17300dc1d760 Matt Ranostay    2016-09-24  312  
67e17300dc1d760 Matt Ranostay    2016-09-24  313  	data = iio_priv(indio_dev);
67e17300dc1d760 Matt Ranostay    2016-09-24  314  	data->dev = dev;
67e17300dc1d760 Matt Ranostay    2016-09-24  315  	data->regmap = devm_regmap_init_i2c(client, &lmp91000_regmap_config);
67e17300dc1d760 Matt Ranostay    2016-09-24  316  	if (IS_ERR(data->regmap)) {
67e17300dc1d760 Matt Ranostay    2016-09-24  317  		dev_err(dev, "regmap initialization failed.\n");
67e17300dc1d760 Matt Ranostay    2016-09-24  318  		return PTR_ERR(data->regmap);
67e17300dc1d760 Matt Ranostay    2016-09-24  319  	}
67e17300dc1d760 Matt Ranostay    2016-09-24  320  
4d031666560da23 Gwendal Grignou  2021-03-09  321  	data->trig = devm_iio_trigger_alloc(dev, "%s-mux%d",
15ea2878bfb2550 Jonathan Cameron 2021-04-26  322  					    indio_dev->name,
15ea2878bfb2550 Jonathan Cameron 2021-04-26  323  					    iio_device_id(indio_dev));
368e8718875f17a Dixit Parmar     2025-08-22  324  	if (!data->trig)
67e17300dc1d760 Matt Ranostay    2016-09-24  325  		return -ENOMEM;
67e17300dc1d760 Matt Ranostay    2016-09-24  326  
67e17300dc1d760 Matt Ranostay    2016-09-24  327  	init_completion(&data->completion);
67e17300dc1d760 Matt Ranostay    2016-09-24  328  
67e17300dc1d760 Matt Ranostay    2016-09-24  329  	ret = lmp91000_read_config(data);
67e17300dc1d760 Matt Ranostay    2016-09-24  330  	if (ret)
67e17300dc1d760 Matt Ranostay    2016-09-24  331  		return ret;
67e17300dc1d760 Matt Ranostay    2016-09-24  332  
82764dcb3643c70 Salah Triki      2026-05-07  333  	data->cb_buffer = iio_channel_get_all_cb(dev, &lmp91000_buffer_cb, indio_dev);
82764dcb3643c70 Salah Triki      2026-05-07  334  	if (IS_ERR(data->cb_buffer)) {
82764dcb3643c70 Salah Triki      2026-05-07  335  		if (PTR_ERR(data->cb_buffer) == -ENODEV)
82764dcb3643c70 Salah Triki      2026-05-07  336  			ret = -EPROBE_DEFER;
82764dcb3643c70 Salah Triki      2026-05-07  337  		else
82764dcb3643c70 Salah Triki      2026-05-07  338  			ret = PTR_ERR(data->cb_buffer);
82764dcb3643c70 Salah Triki      2026-05-07  339  
82764dcb3643c70 Salah Triki      2026-05-07  340  		goto error_unreg_buffer;
82764dcb3643c70 Salah Triki      2026-05-07  341  	}
82764dcb3643c70 Salah Triki      2026-05-07  342  
67e17300dc1d760 Matt Ranostay    2016-09-24  343  	ret = iio_trigger_set_immutable(iio_channel_cb_get_iio_dev(data->cb_buffer),
67e17300dc1d760 Matt Ranostay    2016-09-24  344  					data->trig);
67e17300dc1d760 Matt Ranostay    2016-09-24  345  	if (ret) {
67e17300dc1d760 Matt Ranostay    2016-09-24  346  		dev_err(dev, "cannot set immutable trigger.\n");
67e17300dc1d760 Matt Ranostay    2016-09-24  347  		return ret;

Need to goto cleanup before returning

67e17300dc1d760 Matt Ranostay    2016-09-24  348  	}
67e17300dc1d760 Matt Ranostay    2016-09-24  349  
67e17300dc1d760 Matt Ranostay    2016-09-24  350  	ret = iio_trigger_register(data->trig);
67e17300dc1d760 Matt Ranostay    2016-09-24  351  	if (ret) {
67e17300dc1d760 Matt Ranostay    2016-09-24  352  		dev_err(dev, "cannot register iio trigger.\n");
67e17300dc1d760 Matt Ranostay    2016-09-24 @353  		return ret;

Same.

67e17300dc1d760 Matt Ranostay    2016-09-24  354  	}
67e17300dc1d760 Matt Ranostay    2016-09-24  355  
67e17300dc1d760 Matt Ranostay    2016-09-24  356  	ret = iio_triggered_buffer_setup(indio_dev, NULL,
67e17300dc1d760 Matt Ranostay    2016-09-24  357  					 &lmp91000_buffer_handler,
67e17300dc1d760 Matt Ranostay    2016-09-24  358  					 &lmp91000_buffer_setup_ops);
67e17300dc1d760 Matt Ranostay    2016-09-24  359  	if (ret)
67e17300dc1d760 Matt Ranostay    2016-09-24  360  		goto error_unreg_trigger;
67e17300dc1d760 Matt Ranostay    2016-09-24  361  
67e17300dc1d760 Matt Ranostay    2016-09-24  362  	data->adc_chan = iio_channel_cb_get_channels(data->cb_buffer);
67e17300dc1d760 Matt Ranostay    2016-09-24  363  
67e17300dc1d760 Matt Ranostay    2016-09-24  364  	ret = iio_device_register(indio_dev);
67e17300dc1d760 Matt Ranostay    2016-09-24  365  	if (ret)
67e17300dc1d760 Matt Ranostay    2016-09-24  366  		goto error_unreg_cb_buffer;
67e17300dc1d760 Matt Ranostay    2016-09-24  367  
67e17300dc1d760 Matt Ranostay    2016-09-24  368  	return 0;
67e17300dc1d760 Matt Ranostay    2016-09-24  369  
67e17300dc1d760 Matt Ranostay    2016-09-24  370  error_unreg_cb_buffer:
67e17300dc1d760 Matt Ranostay    2016-09-24  371  	iio_channel_release_all_cb(data->cb_buffer);
67e17300dc1d760 Matt Ranostay    2016-09-24  372  
67e17300dc1d760 Matt Ranostay    2016-09-24  373  error_unreg_trigger:
67e17300dc1d760 Matt Ranostay    2016-09-24  374  	iio_trigger_unregister(data->trig);
67e17300dc1d760 Matt Ranostay    2016-09-24  375  
82764dcb3643c70 Salah Triki      2026-05-07  376  error_unreg_buffer:
82764dcb3643c70 Salah Triki      2026-05-07  377  	iio_triggered_buffer_cleanup(indio_dev);
82764dcb3643c70 Salah Triki      2026-05-07  378  
67e17300dc1d760 Matt Ranostay    2016-09-24  379  	return ret;
67e17300dc1d760 Matt Ranostay    2016-09-24  380  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

