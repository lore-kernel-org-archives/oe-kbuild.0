Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61585D738
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Apr 2025 10:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744539203; cv=none; b=MZMfIJc1e+DIe/yfXWAy9X0f1f+eY5TTe6z4r6apD3DtkW2uuoD0B0/MjW8rsf/lL6DRcs6Rgdzqcsj2jMOX6MBB6nfW2swOCN+xXL6zsZdS4ZrDoUGHjDZVDuKLrbYrBpUPV6HOVrvj3f5Yss3WF7sa/IhEBGEwU+U9L1x/+fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744539203; c=relaxed/simple;
	bh=CaVbGnJgAywP9n0WZD2lR7MdDJvnjQw8NnOjsO86v7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M+Xkz8y3rXG0qwWTnXJI0BhcywzLodQHmfUlj8fLT0KT69tKG1CP9tcCavk2KfZS3sweQVEjs5xO5qYPTce/1u97mlZGz6nMKa/aUmHYD2CMEm29hmOYl43K1VChHqwYGjs+EoC2kOQ7u1JJ6rjD4QnZYOhDOA+xXYAnBfEFb2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwnSYyvU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwnSYyvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744539201; x=1776075201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CaVbGnJgAywP9n0WZD2lR7MdDJvnjQw8NnOjsO86v7U=;
  b=lwnSYyvUIQlTz8/ZZqqz+tXPdJLIAj8G9A/9Z+QmHmOoomGPwJN02c3R
   LKrbXpbeUDlfv/BpwoLLRBz3W6ZuTdHxOBq9RqVG2XRHZh4vpheSf9vv9
   BFMEhvxJESHCRGjW9p09dJBi2NVbUuz5QtBPmFt7NizDgDYNeIPx+hk4j
   wUpv+pNHH/Lrean6+x921fOKWaUmo/Nwa144J4WMfKSGPdg3QN2licsd4
   YEigT/04XYwtYhKTdr2SLyWpHaOpnGqEnw92RllttEMF1zwAfhmTarFrb
   B8BtdIuJuQNFtPkA2wmDZhv2IupKZ7F8pjU2hDmTck7t868yQF2ko2IjO
   w==;
X-CSE-ConnectionGUID: 8wSX1dvaR96lSHfFsshq+g==
X-CSE-MsgGUID: RaeruhFHSb6OaEnP0fpaTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="33640962"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="33640962"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 03:13:20 -0700
X-CSE-ConnectionGUID: aLDuFETCTTCE27nygddAOg==
X-CSE-MsgGUID: Gn2H1YjdSy2R84nkDCgBmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="134657840"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Apr 2025 03:13:18 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3uKy-000CYw-2M;
	Sun, 13 Apr 2025 10:13:16 +0000
Date: Sun, 13 Apr 2025 18:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:testing 145/170] drivers/iio/adc/ad7606_spi.c:321
 ad7606_spi_offload_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <202504131808.qk2lrRY4-lkp@intel.com>
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
TO: Angelo Dureghello <adureghello@baylibre.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: David Lechner <dlechner@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   251fedd7b6dc495c433b959e31c29a867c079872
commit: b9c731a0e9a582b17128cb335a816163ac21734d [145/170] iio: adc: ad7606: add SPI offload support
:::::: branch date: 16 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20250413 (https://download.01.org/0day-ci/archive/20250413/202504131808.qk2lrRY4-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504131808.qk2lrRY4-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7606_spi.c:321 ad7606_spi_offload_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +321 drivers/iio/adc/ad7606_spi.c

b9c731a0e9a582 Angelo Dureghello 2025-04-03  271  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  272  static int ad7606_spi_offload_probe(struct device *dev,
b9c731a0e9a582 Angelo Dureghello 2025-04-03  273  				    struct iio_dev *indio_dev)
b9c731a0e9a582 Angelo Dureghello 2025-04-03  274  {
b9c731a0e9a582 Angelo Dureghello 2025-04-03  275  	struct ad7606_state *st = iio_priv(indio_dev);
b9c731a0e9a582 Angelo Dureghello 2025-04-03  276  	struct spi_device *spi = to_spi_device(dev);
b9c731a0e9a582 Angelo Dureghello 2025-04-03  277  	struct spi_bus_data *bus_data;
b9c731a0e9a582 Angelo Dureghello 2025-04-03  278  	struct dma_chan *rx_dma;
b9c731a0e9a582 Angelo Dureghello 2025-04-03  279  	struct spi_offload_trigger_info trigger_info = {
b9c731a0e9a582 Angelo Dureghello 2025-04-03  280  		.fwnode = dev_fwnode(dev),
b9c731a0e9a582 Angelo Dureghello 2025-04-03  281  		.ops = &ad7606_offload_trigger_ops,
b9c731a0e9a582 Angelo Dureghello 2025-04-03  282  		.priv = st,
b9c731a0e9a582 Angelo Dureghello 2025-04-03  283  	};
b9c731a0e9a582 Angelo Dureghello 2025-04-03  284  	int ret;
b9c731a0e9a582 Angelo Dureghello 2025-04-03  285  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  286  	bus_data = devm_kzalloc(dev, sizeof(*bus_data), GFP_KERNEL);
b9c731a0e9a582 Angelo Dureghello 2025-04-03  287  	if (!bus_data)
b9c731a0e9a582 Angelo Dureghello 2025-04-03  288  		return -ENOMEM;
b9c731a0e9a582 Angelo Dureghello 2025-04-03  289  	st->bus_data = bus_data;
b9c731a0e9a582 Angelo Dureghello 2025-04-03  290  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  291  	bus_data->offload = devm_spi_offload_get(dev, spi,
b9c731a0e9a582 Angelo Dureghello 2025-04-03  292  						 &ad7606_spi_offload_config);
b9c731a0e9a582 Angelo Dureghello 2025-04-03  293  	ret = PTR_ERR_OR_ZERO(bus_data->offload);
b9c731a0e9a582 Angelo Dureghello 2025-04-03  294  	if (ret && ret != -ENODEV)
b9c731a0e9a582 Angelo Dureghello 2025-04-03  295  		return dev_err_probe(dev, ret, "failed to get SPI offload\n");
b9c731a0e9a582 Angelo Dureghello 2025-04-03  296  	/* Allow main ad7606_probe function to continue. */
b9c731a0e9a582 Angelo Dureghello 2025-04-03  297  	if (ret == -ENODEV)
b9c731a0e9a582 Angelo Dureghello 2025-04-03  298  		return 0;
b9c731a0e9a582 Angelo Dureghello 2025-04-03  299  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  300  	ret = devm_spi_offload_trigger_register(dev, &trigger_info);
b9c731a0e9a582 Angelo Dureghello 2025-04-03  301  	if (ret)
b9c731a0e9a582 Angelo Dureghello 2025-04-03  302  		return dev_err_probe(dev, ret,
b9c731a0e9a582 Angelo Dureghello 2025-04-03  303  				     "failed to register offload trigger\n");
b9c731a0e9a582 Angelo Dureghello 2025-04-03  304  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  305  	bus_data->offload_trigger = devm_spi_offload_trigger_get(dev,
b9c731a0e9a582 Angelo Dureghello 2025-04-03  306  		bus_data->offload, SPI_OFFLOAD_TRIGGER_DATA_READY);
b9c731a0e9a582 Angelo Dureghello 2025-04-03  307  	if (IS_ERR(bus_data->offload_trigger))
b9c731a0e9a582 Angelo Dureghello 2025-04-03  308  		return dev_err_probe(dev, PTR_ERR(bus_data->offload_trigger),
b9c731a0e9a582 Angelo Dureghello 2025-04-03  309  				     "failed to get offload trigger\n");
b9c731a0e9a582 Angelo Dureghello 2025-04-03  310  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  311  	/* TODO: PWM setup should be ok, done for the backend. PWM mutex ? */
b9c731a0e9a582 Angelo Dureghello 2025-04-03  312  	rx_dma = devm_spi_offload_rx_stream_request_dma_chan(dev,
b9c731a0e9a582 Angelo Dureghello 2025-04-03  313  							     bus_data->offload);
b9c731a0e9a582 Angelo Dureghello 2025-04-03  314  	if (IS_ERR(rx_dma))
b9c731a0e9a582 Angelo Dureghello 2025-04-03  315  		return dev_err_probe(dev, PTR_ERR(rx_dma),
b9c731a0e9a582 Angelo Dureghello 2025-04-03  316  				     "failed to get offload RX DMA\n");
b9c731a0e9a582 Angelo Dureghello 2025-04-03  317  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  318  	ret = devm_iio_dmaengine_buffer_setup_with_handle(dev, indio_dev,
b9c731a0e9a582 Angelo Dureghello 2025-04-03  319  		rx_dma, IIO_BUFFER_DIRECTION_IN);
b9c731a0e9a582 Angelo Dureghello 2025-04-03  320  	if (ret)
b9c731a0e9a582 Angelo Dureghello 2025-04-03 @321  		return dev_err_probe(dev, PTR_ERR(rx_dma),
b9c731a0e9a582 Angelo Dureghello 2025-04-03  322  				     "failed to setup offload RX DMA\n");
b9c731a0e9a582 Angelo Dureghello 2025-04-03  323  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  324  	/* Use offload ops. */
b9c731a0e9a582 Angelo Dureghello 2025-04-03  325  	indio_dev->setup_ops = &ad7606_offload_buffer_setup_ops;
b9c731a0e9a582 Angelo Dureghello 2025-04-03  326  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  327  	st->offload_en = true;
b9c731a0e9a582 Angelo Dureghello 2025-04-03  328  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  329  	return 0;
b9c731a0e9a582 Angelo Dureghello 2025-04-03  330  }
b9c731a0e9a582 Angelo Dureghello 2025-04-03  331  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
