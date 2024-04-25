Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F053C3C
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Apr 2024 02:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714012245; cv=none; b=o2/9bWrUVLaPH2HSb+ozrFw58MH/ohG9qMtON44dZ/UBSqHKv1dVf6SjACABWb6NkvMWyFO17dp1p9gFJXhceQPlfEn6fNAHU4XoybT3du7Qk3w+kNgiPIHX5k9RaK5aAYZaZ7UAu9Ek6pZDFIJbTzYzKQ+Rj1SBM7UPQcZ/0eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714012245; c=relaxed/simple;
	bh=ioVW2JQsYxUpMzapxrfkVcdEwt6Cj9og72K5LcR6ZuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A4mg/afX/KpE0Yhng0CLohPe7ljfgdO4eM98gqLuS0CA70+aOeqC06ZjQhFwvAHNSgjPa6P8sU/zPYEC4Acb+L8CzX+zL4aXRei3xfAfSR4gXe6zXhugJY2vYjvMPn87jgUIz8jnYpi+dV5LQ/XbnalawqZMAguQVibn8Zzs0UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3IThz+L; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3IThz+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714012242; x=1745548242;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ioVW2JQsYxUpMzapxrfkVcdEwt6Cj9og72K5LcR6ZuA=;
  b=P3IThz+LYj942zPRy7eZbBOQZj9G11Osdd7GPggDfymU6VrlHuoOkxbd
   VRMvuFWpSzTW8kavB/nZGKHaKpQ2i5epqPke99tMQ8cyhlQK7iYvpDNTa
   LhUv6vjpzB38L1WOoiRHpTGAH5qrSgvCDuMK0q6U/Mrr98wpn06/s52/t
   zgkAwQLBBzYlmrxcccvohRMi+u3wsXPoUeVIVZ18pP2KK6XyILtAo7vyQ
   N5W4XB3yqePcwWAbcnd5wMm/QV/1rJdHx9ijLXcd/Ze4Ur8EU31JsR5TT
   ABn5qSKoF7TxrVbp4XPVLr5YuQss07GiUcRqPSVIepA9jgcXfL/QWs1PB
   Q==;
X-CSE-ConnectionGUID: DB1+Mr77QNeseFmhnGKBZQ==
X-CSE-MsgGUID: hYcjKkA3TE2ZqvzLGafsXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="27191006"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="27191006"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 19:30:40 -0700
X-CSE-ConnectionGUID: K2/IA2zCQHGXbvoyaCOipQ==
X-CSE-MsgGUID: ZHJvjlIkTgubcROH51cFjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="25001833"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Apr 2024 19:30:39 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzosf-0001rw-0Z;
	Thu, 25 Apr 2024 02:30:37 +0000
Date: Thu, 25 Apr 2024 10:30:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/6] iio: light: stk3310: Implement vdd supply and
 power it off during suspend
Message-ID: <202404251021.4OPER3OS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240423223309.1468198-4-aren@peacevolution.org>
References: <20240423223309.1468198-4-aren@peacevolution.org>
TO: Aren Moynihan <aren@peacevolution.org>
TO: Jonathan Cameron <jic23@kernel.org>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
CC: Aren Moynihan <aren@peacevolution.org>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Ondrej Jirman <megi@xff.cz>
CC: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
CC: linux-iio@vger.kernel.org
CC: phone-devel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: Willow Barraco <contact@willowbarraco.fr>

Hi Aren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on sunxi/sunxi/for-next robh/for-next linus/master v6.9-rc5 next-20240424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aren-Moynihan/dt-bindings-iio-light-stk33xx-add-vdd-and-leda-regulators/20240424-064250
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240423223309.1468198-4-aren%40peacevolution.org
patch subject: [PATCH v2 2/6] iio: light: stk3310: Implement vdd supply and power it off during suspend
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-141-20240424 (https://download.01.org/0day-ci/archive/20240425/202404251021.4OPER3OS-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404251021.4OPER3OS-lkp@intel.com/

smatch warnings:
drivers/iio/light/stk3310.c:615 stk3310_probe() error: uninitialized symbol 'ret'.

vim +/ret +615 drivers/iio/light/stk3310.c

3dd477acbdd1f1 Tiberiu Breana   2015-04-27  591  
9046d80dce04c6 Uwe Kleine-König 2022-11-18  592  static int stk3310_probe(struct i2c_client *client)
be9e6229d67696 Tiberiu Breana   2015-04-27  593  {
be9e6229d67696 Tiberiu Breana   2015-04-27  594  	int ret;
be9e6229d67696 Tiberiu Breana   2015-04-27  595  	struct iio_dev *indio_dev;
be9e6229d67696 Tiberiu Breana   2015-04-27  596  	struct stk3310_data *data;
be9e6229d67696 Tiberiu Breana   2015-04-27  597  
be9e6229d67696 Tiberiu Breana   2015-04-27  598  	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
be9e6229d67696 Tiberiu Breana   2015-04-27  599  	if (!indio_dev) {
be9e6229d67696 Tiberiu Breana   2015-04-27  600  		dev_err(&client->dev, "iio allocation failed!\n");
be9e6229d67696 Tiberiu Breana   2015-04-27  601  		return -ENOMEM;
be9e6229d67696 Tiberiu Breana   2015-04-27  602  	}
be9e6229d67696 Tiberiu Breana   2015-04-27  603  
be9e6229d67696 Tiberiu Breana   2015-04-27  604  	data = iio_priv(indio_dev);
be9e6229d67696 Tiberiu Breana   2015-04-27  605  	data->client = client;
be9e6229d67696 Tiberiu Breana   2015-04-27  606  	i2c_set_clientdata(client, indio_dev);
d6ecb01583d4e0 Arnaud Ferraris  2022-04-20  607  
d6ecb01583d4e0 Arnaud Ferraris  2022-04-20  608  	device_property_read_u32(&client->dev, "proximity-near-level",
d6ecb01583d4e0 Arnaud Ferraris  2022-04-20  609  				 &data->ps_near_level);
d6ecb01583d4e0 Arnaud Ferraris  2022-04-20  610  
be9e6229d67696 Tiberiu Breana   2015-04-27  611  	mutex_init(&data->lock);
be9e6229d67696 Tiberiu Breana   2015-04-27  612  
dd231c1d219f6b Ondrej Jirman    2024-04-23  613  	data->vdd_reg = devm_regulator_get(&client->dev, "vdd");
dd231c1d219f6b Ondrej Jirman    2024-04-23  614  	if (IS_ERR(data->vdd_reg))
dd231c1d219f6b Ondrej Jirman    2024-04-23 @615  		return dev_err_probe(&client->dev, ret, "get regulator vdd failed\n");
dd231c1d219f6b Ondrej Jirman    2024-04-23  616  
be9e6229d67696 Tiberiu Breana   2015-04-27  617  	ret = stk3310_regmap_init(data);
be9e6229d67696 Tiberiu Breana   2015-04-27  618  	if (ret < 0)
be9e6229d67696 Tiberiu Breana   2015-04-27  619  		return ret;
be9e6229d67696 Tiberiu Breana   2015-04-27  620  
be9e6229d67696 Tiberiu Breana   2015-04-27  621  	indio_dev->info = &stk3310_info;
be9e6229d67696 Tiberiu Breana   2015-04-27  622  	indio_dev->name = STK3310_DRIVER_NAME;
be9e6229d67696 Tiberiu Breana   2015-04-27  623  	indio_dev->modes = INDIO_DIRECT_MODE;
be9e6229d67696 Tiberiu Breana   2015-04-27  624  	indio_dev->channels = stk3310_channels;
be9e6229d67696 Tiberiu Breana   2015-04-27  625  	indio_dev->num_channels = ARRAY_SIZE(stk3310_channels);
be9e6229d67696 Tiberiu Breana   2015-04-27  626  
dd231c1d219f6b Ondrej Jirman    2024-04-23  627  	ret = regulator_enable(data->vdd_reg);
dd231c1d219f6b Ondrej Jirman    2024-04-23  628  	if (ret)
dd231c1d219f6b Ondrej Jirman    2024-04-23  629  		return dev_err_probe(&client->dev, ret,
dd231c1d219f6b Ondrej Jirman    2024-04-23  630  				     "regulator vdd enable failed\n");
dd231c1d219f6b Ondrej Jirman    2024-04-23  631  
dd231c1d219f6b Ondrej Jirman    2024-04-23  632  	/* we need a short delay to allow the chip time to power on */
dd231c1d219f6b Ondrej Jirman    2024-04-23  633  	fsleep(1000);
dd231c1d219f6b Ondrej Jirman    2024-04-23  634  
be9e6229d67696 Tiberiu Breana   2015-04-27  635  	ret = stk3310_init(indio_dev);
be9e6229d67696 Tiberiu Breana   2015-04-27  636  	if (ret < 0)
dd231c1d219f6b Ondrej Jirman    2024-04-23  637  		goto err_vdd_disable;
be9e6229d67696 Tiberiu Breana   2015-04-27  638  
6839c1b0700a79 Octavian Purdila 2015-09-23  639  	if (client->irq > 0) {
3dd477acbdd1f1 Tiberiu Breana   2015-04-27  640  		ret = devm_request_threaded_irq(&client->dev, client->irq,
3dd477acbdd1f1 Tiberiu Breana   2015-04-27  641  						stk3310_irq_handler,
3dd477acbdd1f1 Tiberiu Breana   2015-04-27  642  						stk3310_irq_event_handler,
3dd477acbdd1f1 Tiberiu Breana   2015-04-27  643  						IRQF_TRIGGER_FALLING |
3dd477acbdd1f1 Tiberiu Breana   2015-04-27  644  						IRQF_ONESHOT,
3dd477acbdd1f1 Tiberiu Breana   2015-04-27  645  						STK3310_EVENT, indio_dev);
7c7a9eeaa335df Hartmut Knaack   2015-07-09  646  		if (ret < 0) {
3dd477acbdd1f1 Tiberiu Breana   2015-04-27  647  			dev_err(&client->dev, "request irq %d failed\n",
3dd477acbdd1f1 Tiberiu Breana   2015-04-27  648  				client->irq);
7c7a9eeaa335df Hartmut Knaack   2015-07-09  649  			goto err_standby;
7c7a9eeaa335df Hartmut Knaack   2015-07-09  650  		}
3dd477acbdd1f1 Tiberiu Breana   2015-04-27  651  	}
3dd477acbdd1f1 Tiberiu Breana   2015-04-27  652  
037e966f2d6389 Hartmut Knaack   2015-07-09  653  	ret = iio_device_register(indio_dev);
037e966f2d6389 Hartmut Knaack   2015-07-09  654  	if (ret < 0) {
037e966f2d6389 Hartmut Knaack   2015-07-09  655  		dev_err(&client->dev, "device_register failed\n");
7c7a9eeaa335df Hartmut Knaack   2015-07-09  656  		goto err_standby;
037e966f2d6389 Hartmut Knaack   2015-07-09  657  	}
037e966f2d6389 Hartmut Knaack   2015-07-09  658  
7c7a9eeaa335df Hartmut Knaack   2015-07-09  659  	return 0;
7c7a9eeaa335df Hartmut Knaack   2015-07-09  660  
7c7a9eeaa335df Hartmut Knaack   2015-07-09  661  err_standby:
7c7a9eeaa335df Hartmut Knaack   2015-07-09  662  	stk3310_set_state(data, STK3310_STATE_STANDBY);
dd231c1d219f6b Ondrej Jirman    2024-04-23  663  err_vdd_disable:
dd231c1d219f6b Ondrej Jirman    2024-04-23  664  	regulator_disable(data->vdd_reg);
be9e6229d67696 Tiberiu Breana   2015-04-27  665  	return ret;
be9e6229d67696 Tiberiu Breana   2015-04-27  666  }
be9e6229d67696 Tiberiu Breana   2015-04-27  667  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
