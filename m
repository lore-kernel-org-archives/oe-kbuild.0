Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B8018037
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 01:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731116308; cv=none; b=tSBG+DsEvQR8LwsXk6oGiPMnkoPm15Jo9SqjGPQUUFLog1WkBdd+MwIv+obX1+gQrjakBGNIEa9dGBTrENoN2ZDUrVucVkHkRpQ1wAhgtzqkTc8xeNBJuOXaunRdICijIOh3grrmKTFpJ0NpX/X52bUMxnasRj8PfZvBYClqQLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731116308; c=relaxed/simple;
	bh=eF9uhxozP8zLUci/CGSjvX3ymZ05xcbqbvNxvzMzBXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j88PhOG5V1eaJFDSdeYjn+oCRnMb+xuDoCze2lNmRzqR9oJS8hMloEe0/YjjOBMW/Z9XHbrJkb3p4JSUEYtEJ0o2QcCIVnraPeYMnv2BWX69c2EWGp3XRRxigaIA/Hqz9x4Ci1Bclpsx9lTuAW2uCkIiEYkMcuojC46XXv9ZR80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4jgduDW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4jgduDW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731116307; x=1762652307;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eF9uhxozP8zLUci/CGSjvX3ymZ05xcbqbvNxvzMzBXw=;
  b=e4jgduDWYVUdwkERv4kDP6Q/x7s/H4Lw0l2eoreTvNmaWdjkmIL4MMwO
   gLnSYRpchfItPbxFSOSNb2Tm9jKn5ro3nS5OiM3IM3zokTSTJbmmoyL4p
   /5crdJK/gg/2IiIAmTTSx6i7Fsu/jSWOIqrZRMWNJtXO861FWMRRxkDnm
   AIWCRZjOqhTMRuZb40gxetY3rP5xVW96tEk7zLMDCdIS+OxGinIVUNY/v
   +9bCZqvioKQ59RAobb0dsM2+yO9KbmDsxbdGPsQYRZ0TTaeOFRX99AIMK
   x5AEHD1q1AbJIvDFKLDsVITDFoSsUkCBZ3jrn5NdHncuqDC84Pez5D1/Y
   Q==;
X-CSE-ConnectionGUID: iqabTs/0SLyQu1k6swgJjQ==
X-CSE-MsgGUID: WHfD8bE8Rdau6Em7SHOneQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="18637632"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="18637632"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 17:38:26 -0800
X-CSE-ConnectionGUID: cSnSRjDtQeW1C167RZXXJA==
X-CSE-MsgGUID: tH95IhVZTa6K98HwZxY3gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="123340605"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Nov 2024 17:38:25 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9aQh-000rx8-0M;
	Sat, 09 Nov 2024 01:38:23 +0000
Date: Sat, 9 Nov 2024 09:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] iio: adc: ad7124: Refuse invalid input specifiers
Message-ID: <202411090908.Ynrg4eS0-lkp@intel.com>
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
In-Reply-To: <20241108181813.272593-6-u.kleine-koenig@baylibre.com>
References: <20241108181813.272593-6-u.kleine-koenig@baylibre.com>
TO: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Michael Hennerich <Michael.Hennerich@analog.com>
TO: Jonathan Cameron <jic23@kernel.org>
CC: Mircea Caprioru <mircea.caprioru@analog.com>
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "Uwe Kleine-König" <u.kleine-koenig@baylibe.com>

Hi Uwe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/iio-adc-ad7124-Don-t-create-more-channels-than-the-hardware-is-capable-of/20241109-022036
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241108181813.272593-6-u.kleine-koenig%40baylibre.com
patch subject: [PATCH 2/2] iio: adc: ad7124: Refuse invalid input specifiers
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-141-20241109 (https://download.01.org/0day-ci/archive/20241109/202411090908.Ynrg4eS0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411090908.Ynrg4eS0-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7124.c:874 ad7124_parse_channel_config() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +874 drivers/iio/adc/ad7124.c

4112b30ba58b5c Uwe Kleine-König  2024-11-08  823  
a6eaf02b82744b Jonathan Cameron  2024-02-18  824  static int ad7124_parse_channel_config(struct iio_dev *indio_dev,
a6eaf02b82744b Jonathan Cameron  2024-02-18  825  				       struct device *dev)
b3af341bbd9662 Stefan Popa       2018-11-13  826  {
b3af341bbd9662 Stefan Popa       2018-11-13  827  	struct ad7124_state *st = iio_priv(indio_dev);
7b8d045e497a04 Alexandru Tachici 2021-03-11  828  	struct ad7124_channel_config *cfg;
7b8d045e497a04 Alexandru Tachici 2021-03-11  829  	struct ad7124_channel *channels;
b3af341bbd9662 Stefan Popa       2018-11-13  830  	struct iio_chan_spec *chan;
b3af341bbd9662 Stefan Popa       2018-11-13  831  	unsigned int ain[2], channel = 0, tmp;
b3af341bbd9662 Stefan Popa       2018-11-13  832  	int ret;
b3af341bbd9662 Stefan Popa       2018-11-13  833  
a6eaf02b82744b Jonathan Cameron  2024-02-18  834  	st->num_channels = device_get_child_node_count(dev);
a6eaf02b82744b Jonathan Cameron  2024-02-18  835  	if (!st->num_channels)
a6eaf02b82744b Jonathan Cameron  2024-02-18  836  		return dev_err_probe(dev, -ENODEV, "no channel children\n");
b3af341bbd9662 Stefan Popa       2018-11-13  837  
b478bd5e22404e Uwe Kleine-König  2024-11-08  838  	if (st->num_channels > AD7124_MAX_CHANNELS) {
b478bd5e22404e Uwe Kleine-König  2024-11-08  839  		dev_warn(dev, "Limit number of channels to " __stringify(AD7124_MAX_CHANNELS) "\n");
b478bd5e22404e Uwe Kleine-König  2024-11-08  840  		st->num_channels = AD7124_MAX_CHANNELS;
b478bd5e22404e Uwe Kleine-König  2024-11-08  841  	}
b478bd5e22404e Uwe Kleine-König  2024-11-08  842  
b3af341bbd9662 Stefan Popa       2018-11-13  843  	chan = devm_kcalloc(indio_dev->dev.parent, st->num_channels,
b3af341bbd9662 Stefan Popa       2018-11-13  844  			    sizeof(*chan), GFP_KERNEL);
b3af341bbd9662 Stefan Popa       2018-11-13  845  	if (!chan)
b3af341bbd9662 Stefan Popa       2018-11-13  846  		return -ENOMEM;
b3af341bbd9662 Stefan Popa       2018-11-13  847  
7b8d045e497a04 Alexandru Tachici 2021-03-11  848  	channels = devm_kcalloc(indio_dev->dev.parent, st->num_channels, sizeof(*channels),
7b8d045e497a04 Alexandru Tachici 2021-03-11  849  				GFP_KERNEL);
7b8d045e497a04 Alexandru Tachici 2021-03-11  850  	if (!channels)
1478a388f4baaa Mircea Caprioru   2019-06-25  851  		return -ENOMEM;
1478a388f4baaa Mircea Caprioru   2019-06-25  852  
b3af341bbd9662 Stefan Popa       2018-11-13  853  	indio_dev->channels = chan;
b3af341bbd9662 Stefan Popa       2018-11-13  854  	indio_dev->num_channels = st->num_channels;
7b8d045e497a04 Alexandru Tachici 2021-03-11  855  	st->channels = channels;
b3af341bbd9662 Stefan Popa       2018-11-13  856  
a6eaf02b82744b Jonathan Cameron  2024-02-18  857  	device_for_each_child_node_scoped(dev, child) {
a6eaf02b82744b Jonathan Cameron  2024-02-18  858  		ret = fwnode_property_read_u32(child, "reg", &channel);
b3af341bbd9662 Stefan Popa       2018-11-13  859  		if (ret)
a6eaf02b82744b Jonathan Cameron  2024-02-18  860  			return ret;
b3af341bbd9662 Stefan Popa       2018-11-13  861  
a6eaf02b82744b Jonathan Cameron  2024-02-18  862  		if (channel >= indio_dev->num_channels)
a6eaf02b82744b Jonathan Cameron  2024-02-18  863  			return dev_err_probe(dev, -EINVAL,
f2a772c51206b0 Jonathan Cameron  2021-05-13  864  				"Channel index >= number of channels\n");
f2a772c51206b0 Jonathan Cameron  2021-05-13  865  
a6eaf02b82744b Jonathan Cameron  2024-02-18  866  		ret = fwnode_property_read_u32_array(child, "diff-channels",
b3af341bbd9662 Stefan Popa       2018-11-13  867  						     ain, 2);
b3af341bbd9662 Stefan Popa       2018-11-13  868  		if (ret)
a6eaf02b82744b Jonathan Cameron  2024-02-18  869  			return ret;
b3af341bbd9662 Stefan Popa       2018-11-13  870  
4112b30ba58b5c Uwe Kleine-König  2024-11-08  871  		if (!ad7124_valid_input_select(ain[0], st->chip_info) ||
4112b30ba58b5c Uwe Kleine-König  2024-11-08  872  		    !ad7124_valid_input_select(ain[1], st->chip_info))
4112b30ba58b5c Uwe Kleine-König  2024-11-08  873  			return dev_err_probe(dev, ret,
4112b30ba58b5c Uwe Kleine-König  2024-11-08 @874  					     "diff-channels property of %pfwP contains invalid data\n", child);
4112b30ba58b5c Uwe Kleine-König  2024-11-08  875  
7b8d045e497a04 Alexandru Tachici 2021-03-11  876  		st->channels[channel].nr = channel;
7b8d045e497a04 Alexandru Tachici 2021-03-11  877  		st->channels[channel].ain = AD7124_CHANNEL_AINP(ain[0]) |
b3af341bbd9662 Stefan Popa       2018-11-13  878  						  AD7124_CHANNEL_AINM(ain[1]);
7b8d045e497a04 Alexandru Tachici 2021-03-11  879  
61cbfb5368dd50 Dumitru Ceclan    2024-08-06  880  		cfg = &st->channels[channel].cfg;
a6eaf02b82744b Jonathan Cameron  2024-02-18  881  		cfg->bipolar = fwnode_property_read_bool(child, "bipolar");
b3af341bbd9662 Stefan Popa       2018-11-13  882  
a6eaf02b82744b Jonathan Cameron  2024-02-18  883  		ret = fwnode_property_read_u32(child, "adi,reference-select", &tmp);
b3af341bbd9662 Stefan Popa       2018-11-13  884  		if (ret)
7b8d045e497a04 Alexandru Tachici 2021-03-11  885  			cfg->refsel = AD7124_INT_REF;
b3af341bbd9662 Stefan Popa       2018-11-13  886  		else
7b8d045e497a04 Alexandru Tachici 2021-03-11  887  			cfg->refsel = tmp;
b3af341bbd9662 Stefan Popa       2018-11-13  888  
a6eaf02b82744b Jonathan Cameron  2024-02-18  889  		cfg->buf_positive =
a6eaf02b82744b Jonathan Cameron  2024-02-18  890  			fwnode_property_read_bool(child, "adi,buffered-positive");
a6eaf02b82744b Jonathan Cameron  2024-02-18  891  		cfg->buf_negative =
a6eaf02b82744b Jonathan Cameron  2024-02-18  892  			fwnode_property_read_bool(child, "adi,buffered-negative");
0eaecea6e4878a Mircea Caprioru   2019-06-25  893  
d7857e4ee1ba69 Alexandru Tachici 2019-12-20  894  		chan[channel] = ad7124_channel_template;
d7857e4ee1ba69 Alexandru Tachici 2019-12-20  895  		chan[channel].address = channel;
d7857e4ee1ba69 Alexandru Tachici 2019-12-20  896  		chan[channel].scan_index = channel;
d7857e4ee1ba69 Alexandru Tachici 2019-12-20  897  		chan[channel].channel = ain[0];
d7857e4ee1ba69 Alexandru Tachici 2019-12-20  898  		chan[channel].channel2 = ain[1];
b3af341bbd9662 Stefan Popa       2018-11-13  899  	}
b3af341bbd9662 Stefan Popa       2018-11-13  900  
b3af341bbd9662 Stefan Popa       2018-11-13  901  	return 0;
b3af341bbd9662 Stefan Popa       2018-11-13  902  }
b3af341bbd9662 Stefan Popa       2018-11-13  903  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
