Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9522163A9
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Mar 2025 19:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741549017; cv=none; b=OzNmYh9vAWcpJe2XHyG9R93ISUCMtEpk1iHCg7JEe4LIWRPt1kaRMaiY9gbMTxSmtWm27aOGrd9r8ACM2v/WqrHmgDaRpIcuAPD9oEzswcn2bcAqhfoO5om4WuUOFL7DuSUCsxIC1uGBHzL+V5ZXGRc7hoxvEwJXigFhzHweSwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741549017; c=relaxed/simple;
	bh=FikoyTcJAkTnv8H6Z91fG1a/SxBgfm32a0xUS7u5r6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HhnxbZvOC3vGueEV/aoKtnqmgmgfy8KetjfUGjwmEqxR+DU3/WfWiJtoOzMAr5WEqlbuxX+OFfjKQ+Dmk9icJKJDecpLupr1pvzCKf6p9MP+zkIRhPQ1fDM6o01D37McvgjcBU4w8xDUeS5rg4u2cCuYdAvrCS/PROW/ZCzn828=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/K8dk/2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/K8dk/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741549015; x=1773085015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FikoyTcJAkTnv8H6Z91fG1a/SxBgfm32a0xUS7u5r6s=;
  b=f/K8dk/2kCRPd/5LHDCx2hzk2fasNHHLcyUMjmP7FfGBzfz55ttuovex
   9ZgIqlPbmkLBcEdEa0RhtE5uh1balvpJ1zHBId5XBYiATSJ1eDvufMcBo
   Uw2wQWithGIzwafEOsbuIbiRhC5bjHCkImhM3rW8fNRDiXmwjDXyZB4Tg
   VOJbFU7ndlWAiwICZc2yfBx3kufnfWHZ2zUmCmCfEmG100zy8ZA56UnK4
   27y9mvzYyyjatt8BSPzVzDu18X7JdJ7HVmfw/tIGqs+ML64oWw8/3ILfu
   7RnqcDOgWZP9/Zs6KRaF0RQNMBvdgn86d3qNoCH8DsCPdXrEwB04aCzuF
   g==;
X-CSE-ConnectionGUID: IHEe0hyAQUmY8oXEbSigpg==
X-CSE-MsgGUID: CRPtKnvqTRS63/Y+O21F1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="46322337"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="46322337"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 12:36:54 -0700
X-CSE-ConnectionGUID: UxQ4wg+KSZyRQlXJ4SllvQ==
X-CSE-MsgGUID: zjHPhpj3S22XMQC3EOAFuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120328171"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 09 Mar 2025 12:36:53 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trMSA-0003PM-0N;
	Sun, 09 Mar 2025 19:36:50 +0000
Date: Mon, 10 Mar 2025 03:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/4] iio: adc: add support for ad4052
Message-ID: <202503100340.6esULReX-lkp@intel.com>
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
In-Reply-To: <20250306-iio-driver-ad4052-v1-4-2badad30116c@analog.com>
References: <20250306-iio-driver-ad4052-v1-4-2badad30116c@analog.com>
TO: Jorge Marques <jorge.marques@analog.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Michael Hennerich <Michael.Hennerich@analog.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Jonathan Corbet <corbet@lwn.net>
TO: David Lechner <dlechner@baylibre.com>
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: Jorge Marques <jorge.marques@analog.com>

Hi Jorge,

kernel test robot noticed the following build warnings:

[auto build test WARNING on aac287ec80d71a7ab7e44c936a434625417c3e30]

url:    https://github.com/intel-lab-lkp/linux/commits/Jorge-Marques/iio-code-mark-iio_dev-as-const-in-iio_buffer_enabled/20250306-220719
base:   aac287ec80d71a7ab7e44c936a434625417c3e30
patch link:    https://lore.kernel.org/r/20250306-iio-driver-ad4052-v1-4-2badad30116c%40analog.com
patch subject: [PATCH 4/4] iio: adc: add support for ad4052
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: um-randconfig-r072-20250310 (https://download.01.org/0day-ci/archive/20250310/202503100340.6esULReX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503100340.6esULReX-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad4052.c:402 ad4052_update_xfer_raw() error: 'scan_type' dereferencing possible ERR_PTR()
drivers/iio/adc/ad4052.c:416 ad4052_update_xfer_offload() error: 'scan_type' dereferencing possible ERR_PTR()
drivers/iio/adc/ad4052.c:581 ad4052_set_non_defaults() error: 'scan_type' dereferencing possible ERR_PTR()

vim +/scan_type +402 drivers/iio/adc/ad4052.c

0c91bac1cb6b56b Jorge Marques 2025-03-06  392  
0c91bac1cb6b56b Jorge Marques 2025-03-06  393  static void ad4052_update_xfer_raw(struct iio_dev *indio_dev,
0c91bac1cb6b56b Jorge Marques 2025-03-06  394  				   struct iio_chan_spec const *chan)
0c91bac1cb6b56b Jorge Marques 2025-03-06  395  {
0c91bac1cb6b56b Jorge Marques 2025-03-06  396  	struct ad4052_state *st = iio_priv(indio_dev);
0c91bac1cb6b56b Jorge Marques 2025-03-06  397  	const struct iio_scan_type *scan_type;
0c91bac1cb6b56b Jorge Marques 2025-03-06  398  	struct spi_transfer *xfer = &st->xfer;
0c91bac1cb6b56b Jorge Marques 2025-03-06  399  
0c91bac1cb6b56b Jorge Marques 2025-03-06  400  	scan_type = iio_get_current_scan_type(indio_dev, chan);
0c91bac1cb6b56b Jorge Marques 2025-03-06  401  
0c91bac1cb6b56b Jorge Marques 2025-03-06 @402  	xfer->bits_per_word = scan_type->realbits;
0c91bac1cb6b56b Jorge Marques 2025-03-06  403  	xfer->len = BITS_TO_BYTES(scan_type->storagebits);
0c91bac1cb6b56b Jorge Marques 2025-03-06  404  }
0c91bac1cb6b56b Jorge Marques 2025-03-06  405  
0c91bac1cb6b56b Jorge Marques 2025-03-06  406  static int ad4052_update_xfer_offload(struct iio_dev *indio_dev,
0c91bac1cb6b56b Jorge Marques 2025-03-06  407  				      struct iio_chan_spec const *chan)
0c91bac1cb6b56b Jorge Marques 2025-03-06  408  {
0c91bac1cb6b56b Jorge Marques 2025-03-06  409  	struct ad4052_state *st = iio_priv(indio_dev);
0c91bac1cb6b56b Jorge Marques 2025-03-06  410  	const struct iio_scan_type *scan_type;
0c91bac1cb6b56b Jorge Marques 2025-03-06  411  	struct spi_transfer *xfer = &st->xfer;
0c91bac1cb6b56b Jorge Marques 2025-03-06  412  
0c91bac1cb6b56b Jorge Marques 2025-03-06  413  	scan_type = iio_get_current_scan_type(indio_dev, chan);
0c91bac1cb6b56b Jorge Marques 2025-03-06  414  
0c91bac1cb6b56b Jorge Marques 2025-03-06  415  	xfer = &st->offload_xfer;
0c91bac1cb6b56b Jorge Marques 2025-03-06 @416  	xfer->bits_per_word = scan_type->realbits;
0c91bac1cb6b56b Jorge Marques 2025-03-06  417  	xfer->len = BITS_TO_BYTES(scan_type->storagebits);
0c91bac1cb6b56b Jorge Marques 2025-03-06  418  
0c91bac1cb6b56b Jorge Marques 2025-03-06  419  	spi_message_init_with_transfers(&st->offload_msg, &st->offload_xfer, 1);
0c91bac1cb6b56b Jorge Marques 2025-03-06  420  	st->offload_msg.offload = st->offload;
0c91bac1cb6b56b Jorge Marques 2025-03-06  421  
0c91bac1cb6b56b Jorge Marques 2025-03-06  422  	return spi_optimize_message(st->spi, &st->offload_msg);
0c91bac1cb6b56b Jorge Marques 2025-03-06  423  }
0c91bac1cb6b56b Jorge Marques 2025-03-06  424  
0c91bac1cb6b56b Jorge Marques 2025-03-06  425  static int ad4052_set_oversampling_ratio(struct iio_dev *indio_dev,
0c91bac1cb6b56b Jorge Marques 2025-03-06  426  					 const struct iio_chan_spec *chan,
0c91bac1cb6b56b Jorge Marques 2025-03-06  427  					 unsigned int val)
0c91bac1cb6b56b Jorge Marques 2025-03-06  428  {
0c91bac1cb6b56b Jorge Marques 2025-03-06  429  	struct ad4052_state *st = iio_priv(indio_dev);
0c91bac1cb6b56b Jorge Marques 2025-03-06  430  	int ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  431  
0c91bac1cb6b56b Jorge Marques 2025-03-06  432  	if (AD4052_CHECK_OVERSAMPLING(st->chip->max_avg, val))
0c91bac1cb6b56b Jorge Marques 2025-03-06  433  		return -EINVAL;
0c91bac1cb6b56b Jorge Marques 2025-03-06  434  
0c91bac1cb6b56b Jorge Marques 2025-03-06  435  	/* 0 or 1 disables oversampling */
0c91bac1cb6b56b Jorge Marques 2025-03-06  436  	if (val == 0 || val == 1) {
0c91bac1cb6b56b Jorge Marques 2025-03-06  437  		st->mode = AD4052_SAMPLE_MODE;
0c91bac1cb6b56b Jorge Marques 2025-03-06  438  	} else {
0c91bac1cb6b56b Jorge Marques 2025-03-06  439  		val = ilog2(val);
0c91bac1cb6b56b Jorge Marques 2025-03-06  440  		st->mode = AD4052_BURST_AVERAGING_MODE;
0c91bac1cb6b56b Jorge Marques 2025-03-06  441  		ret = regmap_write(st->regmap, AD4052_REG_AVG_CONFIG, val - 1);
0c91bac1cb6b56b Jorge Marques 2025-03-06  442  		if (ret)
0c91bac1cb6b56b Jorge Marques 2025-03-06  443  			return ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  444  	}
0c91bac1cb6b56b Jorge Marques 2025-03-06  445  
0c91bac1cb6b56b Jorge Marques 2025-03-06  446  	ad4052_update_xfer_raw(indio_dev, chan);
0c91bac1cb6b56b Jorge Marques 2025-03-06  447  
0c91bac1cb6b56b Jorge Marques 2025-03-06  448  	return 0;
0c91bac1cb6b56b Jorge Marques 2025-03-06  449  }
0c91bac1cb6b56b Jorge Marques 2025-03-06  450  
0c91bac1cb6b56b Jorge Marques 2025-03-06  451  static int ad4052_get_oversampling_ratio(struct ad4052_state *st,
0c91bac1cb6b56b Jorge Marques 2025-03-06  452  					 unsigned int *val)
0c91bac1cb6b56b Jorge Marques 2025-03-06  453  {
0c91bac1cb6b56b Jorge Marques 2025-03-06  454  	int ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  455  
0c91bac1cb6b56b Jorge Marques 2025-03-06  456  	if (st->mode == AD4052_SAMPLE_MODE) {
0c91bac1cb6b56b Jorge Marques 2025-03-06  457  		*val = 0;
0c91bac1cb6b56b Jorge Marques 2025-03-06  458  		return 0;
0c91bac1cb6b56b Jorge Marques 2025-03-06  459  	}
0c91bac1cb6b56b Jorge Marques 2025-03-06  460  
0c91bac1cb6b56b Jorge Marques 2025-03-06  461  	ret = regmap_read(st->regmap, AD4052_REG_AVG_CONFIG, val);
0c91bac1cb6b56b Jorge Marques 2025-03-06  462  	if (ret)
0c91bac1cb6b56b Jorge Marques 2025-03-06  463  		return ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  464  
0c91bac1cb6b56b Jorge Marques 2025-03-06  465  	*val = BIT(*val + 1);
0c91bac1cb6b56b Jorge Marques 2025-03-06  466  
0c91bac1cb6b56b Jorge Marques 2025-03-06  467  	return 0;
0c91bac1cb6b56b Jorge Marques 2025-03-06  468  }
0c91bac1cb6b56b Jorge Marques 2025-03-06  469  
0c91bac1cb6b56b Jorge Marques 2025-03-06  470  static int ad4052_assert(struct ad4052_state *st)
0c91bac1cb6b56b Jorge Marques 2025-03-06  471  {
0c91bac1cb6b56b Jorge Marques 2025-03-06  472  	int ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  473  	u16 val;
0c91bac1cb6b56b Jorge Marques 2025-03-06  474  
0c91bac1cb6b56b Jorge Marques 2025-03-06  475  	ret = regmap_bulk_read(st->regmap, AD4052_REG_PROD_ID_1, &st->d16, 2);
0c91bac1cb6b56b Jorge Marques 2025-03-06  476  	if (ret)
0c91bac1cb6b56b Jorge Marques 2025-03-06  477  		return ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  478  
0c91bac1cb6b56b Jorge Marques 2025-03-06  479  	val = be16_to_cpu(st->d16);
0c91bac1cb6b56b Jorge Marques 2025-03-06  480  	if (val != st->chip->prod_id)
0c91bac1cb6b56b Jorge Marques 2025-03-06  481  		return -ENODEV;
0c91bac1cb6b56b Jorge Marques 2025-03-06  482  
0c91bac1cb6b56b Jorge Marques 2025-03-06  483  	ret = regmap_bulk_read(st->regmap, AD4052_REG_VENDOR_H, &st->d16, 2);
0c91bac1cb6b56b Jorge Marques 2025-03-06  484  	if (ret)
0c91bac1cb6b56b Jorge Marques 2025-03-06  485  		return ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  486  
0c91bac1cb6b56b Jorge Marques 2025-03-06  487  	val = be16_to_cpu(st->d16);
0c91bac1cb6b56b Jorge Marques 2025-03-06  488  	if (val != AD4052_SPI_VENDOR)
0c91bac1cb6b56b Jorge Marques 2025-03-06  489  		return -ENODEV;
0c91bac1cb6b56b Jorge Marques 2025-03-06  490  
0c91bac1cb6b56b Jorge Marques 2025-03-06  491  	return 0;
0c91bac1cb6b56b Jorge Marques 2025-03-06  492  }
0c91bac1cb6b56b Jorge Marques 2025-03-06  493  
0c91bac1cb6b56b Jorge Marques 2025-03-06  494  static int ad4052_exit_command(struct ad4052_state *st)
0c91bac1cb6b56b Jorge Marques 2025-03-06  495  {
0c91bac1cb6b56b Jorge Marques 2025-03-06  496  	struct spi_device *spi = st->spi;
0c91bac1cb6b56b Jorge Marques 2025-03-06  497  	const u8 val = 0xA8;
0c91bac1cb6b56b Jorge Marques 2025-03-06  498  
0c91bac1cb6b56b Jorge Marques 2025-03-06  499  	return spi_write(spi, &val, 1);
0c91bac1cb6b56b Jorge Marques 2025-03-06  500  }
0c91bac1cb6b56b Jorge Marques 2025-03-06  501  
0c91bac1cb6b56b Jorge Marques 2025-03-06  502  static int ad4052_set_operation_mode(struct ad4052_state *st, enum ad4052_operation_mode mode)
0c91bac1cb6b56b Jorge Marques 2025-03-06  503  {
0c91bac1cb6b56b Jorge Marques 2025-03-06  504  	u8 val = st->data_format | mode;
0c91bac1cb6b56b Jorge Marques 2025-03-06  505  	int ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  506  
0c91bac1cb6b56b Jorge Marques 2025-03-06  507  	ret = regmap_write(st->regmap, AD4052_REG_ADC_MODES, val);
0c91bac1cb6b56b Jorge Marques 2025-03-06  508  	if (ret)
0c91bac1cb6b56b Jorge Marques 2025-03-06  509  		return ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  510  
0c91bac1cb6b56b Jorge Marques 2025-03-06  511  	val = BIT(0);
0c91bac1cb6b56b Jorge Marques 2025-03-06  512  	return regmap_write(st->regmap, AD4052_REG_MODE_SET, val);
0c91bac1cb6b56b Jorge Marques 2025-03-06  513  }
0c91bac1cb6b56b Jorge Marques 2025-03-06  514  
0c91bac1cb6b56b Jorge Marques 2025-03-06  515  static int __ad4052_set_sampling_freq(struct ad4052_state *st, unsigned int freq)
0c91bac1cb6b56b Jorge Marques 2025-03-06  516  {
0c91bac1cb6b56b Jorge Marques 2025-03-06  517  	struct spi_offload_trigger_config config = {
0c91bac1cb6b56b Jorge Marques 2025-03-06  518  		.type = SPI_OFFLOAD_TRIGGER_PERIODIC,
0c91bac1cb6b56b Jorge Marques 2025-03-06  519  		.periodic = {
0c91bac1cb6b56b Jorge Marques 2025-03-06  520  			.frequency_hz = freq,
0c91bac1cb6b56b Jorge Marques 2025-03-06  521  		},
0c91bac1cb6b56b Jorge Marques 2025-03-06  522  	};
0c91bac1cb6b56b Jorge Marques 2025-03-06  523  	int ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  524  
0c91bac1cb6b56b Jorge Marques 2025-03-06  525  	ret = spi_offload_trigger_validate(st->offload_trigger, &config);
0c91bac1cb6b56b Jorge Marques 2025-03-06  526  	if (ret)
0c91bac1cb6b56b Jorge Marques 2025-03-06  527  		return ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  528  
0c91bac1cb6b56b Jorge Marques 2025-03-06  529  	st->offload_trigger_hz = config.periodic.frequency_hz;
0c91bac1cb6b56b Jorge Marques 2025-03-06  530  
0c91bac1cb6b56b Jorge Marques 2025-03-06  531  	return 0;
0c91bac1cb6b56b Jorge Marques 2025-03-06  532  }
0c91bac1cb6b56b Jorge Marques 2025-03-06  533  
0c91bac1cb6b56b Jorge Marques 2025-03-06  534  static int ad4052_soft_reset(struct ad4052_state *st)
0c91bac1cb6b56b Jorge Marques 2025-03-06  535  {
0c91bac1cb6b56b Jorge Marques 2025-03-06  536  	int ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  537  
0c91bac1cb6b56b Jorge Marques 2025-03-06  538  	memset(st->buf_reset_pattern, 0xFF, sizeof(st->buf_reset_pattern));
0c91bac1cb6b56b Jorge Marques 2025-03-06  539  	for (int i = 0; i < 3; i++)
0c91bac1cb6b56b Jorge Marques 2025-03-06  540  		st->buf_reset_pattern[6 * (i + 1) - 1] = 0xFE;
0c91bac1cb6b56b Jorge Marques 2025-03-06  541  
0c91bac1cb6b56b Jorge Marques 2025-03-06  542  	ret = spi_write(st->spi, st->buf_reset_pattern,
0c91bac1cb6b56b Jorge Marques 2025-03-06  543  			sizeof(st->buf_reset_pattern));
0c91bac1cb6b56b Jorge Marques 2025-03-06  544  	if (ret)
0c91bac1cb6b56b Jorge Marques 2025-03-06  545  		return ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  546  
0c91bac1cb6b56b Jorge Marques 2025-03-06  547  	/* Wait AD4052 reset delay */
0c91bac1cb6b56b Jorge Marques 2025-03-06  548  	fsleep(5000);
0c91bac1cb6b56b Jorge Marques 2025-03-06  549  
0c91bac1cb6b56b Jorge Marques 2025-03-06  550  	return 0;
0c91bac1cb6b56b Jorge Marques 2025-03-06  551  }
0c91bac1cb6b56b Jorge Marques 2025-03-06  552  
0c91bac1cb6b56b Jorge Marques 2025-03-06  553  static int ad4052_set_non_defaults(struct iio_dev *indio_dev,
0c91bac1cb6b56b Jorge Marques 2025-03-06  554  				   struct iio_chan_spec const *chan)
0c91bac1cb6b56b Jorge Marques 2025-03-06  555  {
0c91bac1cb6b56b Jorge Marques 2025-03-06  556  	struct ad4052_state *st = iio_priv(indio_dev);
0c91bac1cb6b56b Jorge Marques 2025-03-06  557  	const struct iio_scan_type *scan_type;
0c91bac1cb6b56b Jorge Marques 2025-03-06  558  
0c91bac1cb6b56b Jorge Marques 2025-03-06  559  	scan_type = iio_get_current_scan_type(indio_dev, chan);
0c91bac1cb6b56b Jorge Marques 2025-03-06  560  
0c91bac1cb6b56b Jorge Marques 2025-03-06  561  	u8 val = FIELD_PREP(AD4052_GP_MODE_MSK(0), AD4052_GP_INTR) |
0c91bac1cb6b56b Jorge Marques 2025-03-06  562  		 FIELD_PREP(AD4052_GP_MODE_MSK(1), AD4052_GP_DRDY);
0c91bac1cb6b56b Jorge Marques 2025-03-06  563  	int ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  564  
0c91bac1cb6b56b Jorge Marques 2025-03-06  565  	ret = regmap_update_bits(st->regmap, AD4052_REG_GP_CONFIG,
0c91bac1cb6b56b Jorge Marques 2025-03-06  566  				 AD4052_GP_MODE_MSK(1) | AD4052_GP_MODE_MSK(0),
0c91bac1cb6b56b Jorge Marques 2025-03-06  567  				 val);
0c91bac1cb6b56b Jorge Marques 2025-03-06  568  	if (ret)
0c91bac1cb6b56b Jorge Marques 2025-03-06  569  		return ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  570  
0c91bac1cb6b56b Jorge Marques 2025-03-06  571  	val = FIELD_PREP(AD4052_INTR_EN_MSK(0), (AD4052_INTR_EN_EITHER)) |
0c91bac1cb6b56b Jorge Marques 2025-03-06  572  	      FIELD_PREP(AD4052_INTR_EN_MSK(1), (AD4052_INTR_EN_NEITHER));
0c91bac1cb6b56b Jorge Marques 2025-03-06  573  
0c91bac1cb6b56b Jorge Marques 2025-03-06  574  	ret = regmap_update_bits(st->regmap, AD4052_REG_INTR_CONFIG,
0c91bac1cb6b56b Jorge Marques 2025-03-06  575  				 AD4052_INTR_EN_MSK(0) | AD4052_INTR_EN_MSK(1),
0c91bac1cb6b56b Jorge Marques 2025-03-06  576  				 val);
0c91bac1cb6b56b Jorge Marques 2025-03-06  577  	if (ret)
0c91bac1cb6b56b Jorge Marques 2025-03-06  578  		return ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  579  
0c91bac1cb6b56b Jorge Marques 2025-03-06  580  	val = 0;
0c91bac1cb6b56b Jorge Marques 2025-03-06 @581  	if (scan_type->sign == 's')
0c91bac1cb6b56b Jorge Marques 2025-03-06  582  		val |= AD4052_DATA_FORMAT;
0c91bac1cb6b56b Jorge Marques 2025-03-06  583  
0c91bac1cb6b56b Jorge Marques 2025-03-06  584  	st->data_format = val;
0c91bac1cb6b56b Jorge Marques 2025-03-06  585  
0c91bac1cb6b56b Jorge Marques 2025-03-06  586  	if (st->chip->grade == AD4052_500KSPS) {
0c91bac1cb6b56b Jorge Marques 2025-03-06  587  		ret = regmap_write(st->regmap, AD4052_REG_TIMER_CONFIG,
0c91bac1cb6b56b Jorge Marques 2025-03-06  588  				   FIELD_PREP(AD4052_FS_MASK, AD4052_300KSPS));
0c91bac1cb6b56b Jorge Marques 2025-03-06  589  		if (ret)
0c91bac1cb6b56b Jorge Marques 2025-03-06  590  			return ret;
0c91bac1cb6b56b Jorge Marques 2025-03-06  591  	}
0c91bac1cb6b56b Jorge Marques 2025-03-06  592  
0c91bac1cb6b56b Jorge Marques 2025-03-06  593  	return regmap_write(st->regmap, AD4052_REG_ADC_MODES, val);
0c91bac1cb6b56b Jorge Marques 2025-03-06  594  }
0c91bac1cb6b56b Jorge Marques 2025-03-06  595  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
