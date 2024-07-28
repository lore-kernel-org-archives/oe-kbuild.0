Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED1D3B1AC
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Jul 2024 18:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722189800; cv=none; b=u0+FxrY7DW6ouExnHi7+fIXZuO+P9RWeJFbvILiQNlxATVzLnQViGPKjBt4u+dTcuINg5cqtMxwQC42IQNdsnWoJznTM57c6dKqWDRgZ/HwgYi61l33Up9lPqFdeqrvx8NK3+m280RPGOiNWlSxDMWWXm7n/dl1UwSuS/OlZQWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722189800; c=relaxed/simple;
	bh=vCgb3FftwfysmNVhqQxxKab6duMAa2SQuNIIp7bF7vU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IN2lriDMVlHZNHKMfQWIYV49VO3QCuwkr7KPt8+4xrE5dDl8I1ZP9Tt3aY1MqV0Sa0+upmhLfK8LCpB/w0n/tNieneVM9wQ8Zxq00DLvVI79ivQuZb1dxNTPOOIjcf/Vnzzmzmn8m7LzA5g0HvYt3oLonBTarjmZsxfM9u58rls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PM2cdO+j; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PM2cdO+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722189799; x=1753725799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vCgb3FftwfysmNVhqQxxKab6duMAa2SQuNIIp7bF7vU=;
  b=PM2cdO+j9CwEeYYuQH44SLnE6Kvj6UG0/H0nmI2XK0K86Io0oY+k1g4n
   /NNbo9t/Q9RZfrKjaoB8mWDMHD2YEdYcn7R5SInRw0vNqFkFzRjv8sUEi
   bVWEaH27jdzo+vIvthRMHPyfq3hJPCVwqky/En5dNR3XsDiIEzYA1oCC9
   wqWawfOyBMLclwBg0/tLSBx9i1BpDS3VLd7Dt1lzcqXHmCDK6QtQL+hha
   1b08CMD5FDBhP5srmzVzMV9+rRnyd9i568hSRSKgv9Iu4gvAS2rE1q603
   2/eGJ3foWe7wIj56pjmu04ObVN/RzZTo8k0bakLBiPMcrgCzIGpqjRmXF
   Q==;
X-CSE-ConnectionGUID: 1OCcMm3ZR1iyVIE1iXuKoQ==
X-CSE-MsgGUID: ACX9smTOTlaN5w/fvHTvEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="20066246"
X-IronPort-AV: E=Sophos;i="6.09,244,1716274800"; 
   d="scan'208";a="20066246"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 11:03:18 -0700
X-CSE-ConnectionGUID: 2Ay/A3h1Rvql9ZCFr4jtXg==
X-CSE-MsgGUID: qSmJM6r9T9OKsDRzMarSJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,244,1716274800"; 
   d="scan'208";a="58579594"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Jul 2024 11:03:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sY8Ej-000r22-2q;
	Sun, 28 Jul 2024 18:03:13 +0000
Date: Mon, 29 Jul 2024 02:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 3/3] drivers: iio: adc: add support for ad777x family
Message-ID: <202407290151.pCUNfKeG-lkp@intel.com>
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
In-Reply-To: <20240724155517.12470-5-ramona.nechita@analog.com>
References: <20240724155517.12470-5-ramona.nechita@analog.com>
TO: Ramona Alexandra Nechita <ramona.nechita@analog.com>
TO: linux-iio@vger.kernel.org
CC: Ramona Alexandra Nechita <ramona.nechita@analog.com>
CC: Jonathan Cameron <jic23@kernel.org>
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Cosmin Tanislav <cosmin.tanislav@analog.com>
CC: Michael Hennerich <Michael.Hennerich@analog.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Nuno Sa <nuno.sa@analog.com>
CC: Marcelo Schmitt <marcelo.schmitt@analog.com>
CC: Marius Cristea <marius.cristea@microchip.com>
CC: Ivan Mikhaylov <fr0st61te@gmail.com>
CC: Mike Looijmans <mike.looijmans@topic.nl>
CC: Marcus Folkesson <marcus.folkesson@gmail.com>
CC: Liam Beguin <liambeguin@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Ramona,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.10 next-20240726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ramona-Alexandra-Nechita/dt-bindings-iio-adc-add-a7779-doc/20240725-000001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240724155517.12470-5-ramona.nechita%40analog.com
patch subject: [PATCH v4 3/3] drivers: iio: adc: add support for ad777x family
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: hexagon-randconfig-r081-20240728 (https://download.01.org/0day-ci/archive/20240729/202407290151.pCUNfKeG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407290151.pCUNfKeG-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7779.c:779 ad7779_probe() error: uninitialized symbol 'ret'.

vim +/ret +779 drivers/iio/adc/ad7779.c

ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  760  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  761  static int ad7779_probe(struct spi_device *spi)
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  762  {
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  763  	struct iio_dev *indio_dev;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  764  	struct ad7779_state *st;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  765  	struct gpio_desc *reset_gpio, *start_gpio;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  766  	int ret;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  767  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  768  	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  769  	if (!indio_dev)
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  770  		return -ENOMEM;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  771  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  772  	st = iio_priv(indio_dev);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  773  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  774  	st->mclk = devm_clk_get_enabled(&spi->dev, "mclk");
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  775  	if (IS_ERR(st->mclk))
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  776  		return PTR_ERR(st->mclk);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  777  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  778  	if (!spi->irq)
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24 @779  		return dev_err_probe(&spi->dev, ret,
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  780  				     "DRDY irq not present\n"); 
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  781  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  782  	reset_gpio = devm_gpiod_get_optional(&spi->dev, "reset", GPIOD_OUT_LOW);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  783  	if (IS_ERR(reset_gpio))
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  784  		return PTR_ERR(reset_gpio);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  785  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  786  	start_gpio = devm_gpiod_get(&spi->dev, "start", GPIOD_OUT_HIGH);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  787  	if (IS_ERR(start_gpio))
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  788  		return PTR_ERR(start_gpio);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  789  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  790  	crc8_populate_msb(ad7779_crc8_table, AD7779_CRC8_POLY);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  791  	st->spi = spi;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  792  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  793  	st->chip_info = spi_get_device_match_data(spi);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  794  	if (!st->chip_info)
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  795  		return -ENODEV;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  796  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  797  	ret = ad7779_reset(indio_dev, start_gpio);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  798  	if (ret)
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  799  		return ret;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  800  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  801  	ad7779_powerup(st, start_gpio);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  802  	if (ret)
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  803  		return ret;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  804  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  805  	indio_dev->name = st->chip_info->name;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  806  	indio_dev->info = &ad7779_info;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  807  	indio_dev->modes = INDIO_DIRECT_MODE;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  808  	indio_dev->channels = st->chip_info->channels;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  809  	indio_dev->num_channels = ARRAY_SIZE(ad7779_channels);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  810  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  811  	st->trig = devm_iio_trigger_alloc(&spi->dev, "%s-dev%d",
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  812  					  		indio_dev->name, iio_device_id(indio_dev));
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  813  	if (!st->trig)
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  814  		return -ENOMEM;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  815  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  816  	st->trig->ops= &ad7779_trigger_ops;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  817  	st->trig->dev.parent = &spi->dev;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  818  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  819  	iio_trigger_set_drvdata(st->trig, st);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  820  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  821  	ret = devm_request_irq(&spi->dev, spi->irq,
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  822  						   iio_trigger_generic_data_rdy_poll,
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  823  						   IRQF_ONESHOT | IRQF_NO_AUTOEN,
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  824  						   indio_dev->name, st->trig);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  825  	if (ret)
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  826  		return dev_err_probe(&spi->dev, ret, "request irq %d failed\n",
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  827  				     st->spi->irq);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  828  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  829  	ret = devm_iio_trigger_register(&spi->dev, st->trig);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  830  	if (ret)
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  831  		return ret;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  832  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  833  	indio_dev->trig = iio_trigger_get(st->trig);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  834  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  835  	init_completion(&st->completion);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  836  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  837  	ret = devm_iio_triggered_buffer_setup(&spi->dev, indio_dev,
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  838  										  &iio_pollfunc_store_time,
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  839  										  &ad7779_trigger_handler,
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  840  										  &ad7779_buffer_setup_ops);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  841  	if (ret)
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  842  		return ret;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  843  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  844  	ret = ad7779_spi_write_mask(st, AD7779_REG_DOUT_FORMAT,
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  845  				    AD7779_DCLK_CLK_DIV_MSK,
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  846  				    FIELD_PREP(AD7779_DCLK_CLK_DIV_MSK, 7));
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  847  	if (ret)
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  848  		return ret;
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  849  
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  850  	return devm_iio_device_register(&spi->dev, indio_dev);
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  851  }
ed8e3886f0d748 Ramona Alexandra Nechita 2024-07-24  852  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
