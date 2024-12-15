Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F00C14263
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Dec 2024 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734258702; cv=none; b=c7r4nsFA1c+LoNP+7s5ohp+QUWFAx/nK9SubQGaG3r+OvsXDZDMZ9e64QJ5W8IYzxACvmFXRWrigozk1EFwsi19mL4V0Nla4rQSMpU0MUwLGH41Ss4xEYCIhpyDxPxXrWm2hNWoGTflKygs7ZiQkXNcHYN72GVO/42p+7JXv2us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734258702; c=relaxed/simple;
	bh=G7+cDcJyCBvYU/luGOaB6ksii0qG1OKasP8Em+yr4jY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qnS/gEF1LL7EZ4gqaZsA18PjanZK1hozKhnrLEXhPAL9wFYyq8DrYcBiwUxCuJYPxL23MjVfNAvkMXzugaUicUWEnvJnPByHfJCpmtbhxBi2a10sR7RgIKvoVqeXV4MaLuEtHTNshwiBrE9200OcC8Ndwo+azt3r+yFeA7WgkMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbmNw757; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbmNw757"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734258701; x=1765794701;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G7+cDcJyCBvYU/luGOaB6ksii0qG1OKasP8Em+yr4jY=;
  b=FbmNw757JXXYV/gym2YmiWjTw61cSxF5HFJZ0XYtkys+NhLBgkwkNTP6
   AfPsa467tYqph9ivlZPVTpMPnJVRhTZT7ROK0l/KUSAuT/p+p2uIBFkSx
   MLriiUuSprTRCjyGHKpEpm8BjVQLPgPGVeXptnh5mWvh+2+aUWeEMAhH+
   DIMwTdlY3IFCckAjwGAC3/jMVdqnKVkGZ8V4ojI3Fdjkx8cHuafbt9fp4
   mRr1t4EETzH1DveBk2VbH8pkm1CXtFbueTffCkRIwjF3eB0yKDJ7dGJRq
   HzmwRs45yXnKLtriZB9XVQXLECe3+ILZBQSl0RTrWLpKCPzW3EpdDWztY
   g==;
X-CSE-ConnectionGUID: WZiNtlkrRuCbzRMDqvb2qw==
X-CSE-MsgGUID: 1JJUHzhyQO+ZgmSLt+Djxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="45348090"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="45348090"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 02:31:40 -0800
X-CSE-ConnectionGUID: sHHxYkjiTnaEefGsFVL0JQ==
X-CSE-MsgGUID: GbATAY/zQ2mbcrnTFB6qcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97364122"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Dec 2024 02:31:27 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMluG-000DYk-18;
	Sun, 15 Dec 2024 10:31:24 +0000
Date: Sun, 15 Dec 2024 18:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:testing 70/86] drivers/iio/adc/ad7124.c:954
 ad7124_parse_channel_config() warn: potentially one past the end of array
 'chan[num_channels]'
Message-ID: <202412151835.yrscxYRq-lkp@intel.com>
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
TO: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   a3fb9f5202c3de0ca84848a475f59a0e0584d9fc
commit: 9e6c3da8f5179704c55eca13432b0e8df9696a9f [70/86] iio: adc: ad7124: Implement temperature measurement
:::::: branch date: 22 hours ago
:::::: commit date: 7 days ago
config: nios2-randconfig-r073-20241215 (https://download.01.org/0day-ci/archive/20241215/202412151835.yrscxYRq-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412151835.yrscxYRq-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7124.c:954 ad7124_parse_channel_config() warn: potentially one past the end of array 'chan[num_channels]'
drivers/iio/adc/ad7124.c:954 ad7124_parse_channel_config() warn: potentially one past the end of array 'chan[num_channels]'

vim +954 drivers/iio/adc/ad7124.c

e74ea4ee3263098 Uwe Kleine-König  2024-12-06  857  
a6eaf02b82744b4 Jonathan Cameron  2024-02-18  858  static int ad7124_parse_channel_config(struct iio_dev *indio_dev,
a6eaf02b82744b4 Jonathan Cameron  2024-02-18  859  				       struct device *dev)
b3af341bbd9662c Stefan Popa       2018-11-13  860  {
b3af341bbd9662c Stefan Popa       2018-11-13  861  	struct ad7124_state *st = iio_priv(indio_dev);
7b8d045e497a04d Alexandru Tachici 2021-03-11  862  	struct ad7124_channel_config *cfg;
7b8d045e497a04d Alexandru Tachici 2021-03-11  863  	struct ad7124_channel *channels;
b3af341bbd9662c Stefan Popa       2018-11-13  864  	struct iio_chan_spec *chan;
b3af341bbd9662c Stefan Popa       2018-11-13  865  	unsigned int ain[2], channel = 0, tmp;
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  866  	unsigned int num_channels;
b3af341bbd9662c Stefan Popa       2018-11-13  867  	int ret;
b3af341bbd9662c Stefan Popa       2018-11-13  868  
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  869  	num_channels = device_get_child_node_count(dev);
b3af341bbd9662c Stefan Popa       2018-11-13  870  
44e7588f961ce43 Uwe Kleine-König  2024-12-06  871  	/*
44e7588f961ce43 Uwe Kleine-König  2024-12-06  872  	 * The driver assigns each logical channel defined in the device tree
44e7588f961ce43 Uwe Kleine-König  2024-12-06  873  	 * statically one channel register. So only accept 16 such logical
44e7588f961ce43 Uwe Kleine-König  2024-12-06  874  	 * channels to not treat CONFIG_0 (i.e. the register following
44e7588f961ce43 Uwe Kleine-König  2024-12-06  875  	 * CHANNEL_15) as an additional channel register. The driver could be
44e7588f961ce43 Uwe Kleine-König  2024-12-06  876  	 * improved to lift this limitation.
44e7588f961ce43 Uwe Kleine-König  2024-12-06  877  	 */
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  878  	if (num_channels > AD7124_MAX_CHANNELS)
44e7588f961ce43 Uwe Kleine-König  2024-12-06  879  		return dev_err_probe(dev, -EINVAL, "Too many channels defined\n");
44e7588f961ce43 Uwe Kleine-König  2024-12-06  880  
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  881  	/* Add one for temperature */
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  882  	st->num_channels = min(num_channels + 1, AD7124_MAX_CHANNELS);
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  883  
b3af341bbd9662c Stefan Popa       2018-11-13  884  	chan = devm_kcalloc(indio_dev->dev.parent, st->num_channels,
b3af341bbd9662c Stefan Popa       2018-11-13  885  			    sizeof(*chan), GFP_KERNEL);
b3af341bbd9662c Stefan Popa       2018-11-13  886  	if (!chan)
b3af341bbd9662c Stefan Popa       2018-11-13  887  		return -ENOMEM;
b3af341bbd9662c Stefan Popa       2018-11-13  888  
7b8d045e497a04d Alexandru Tachici 2021-03-11  889  	channels = devm_kcalloc(indio_dev->dev.parent, st->num_channels, sizeof(*channels),
7b8d045e497a04d Alexandru Tachici 2021-03-11  890  				GFP_KERNEL);
7b8d045e497a04d Alexandru Tachici 2021-03-11  891  	if (!channels)
1478a388f4baaa6 Mircea Caprioru   2019-06-25  892  		return -ENOMEM;
1478a388f4baaa6 Mircea Caprioru   2019-06-25  893  
b3af341bbd9662c Stefan Popa       2018-11-13  894  	indio_dev->channels = chan;
b3af341bbd9662c Stefan Popa       2018-11-13  895  	indio_dev->num_channels = st->num_channels;
7b8d045e497a04d Alexandru Tachici 2021-03-11  896  	st->channels = channels;
b3af341bbd9662c Stefan Popa       2018-11-13  897  
a6eaf02b82744b4 Jonathan Cameron  2024-02-18  898  	device_for_each_child_node_scoped(dev, child) {
a6eaf02b82744b4 Jonathan Cameron  2024-02-18  899  		ret = fwnode_property_read_u32(child, "reg", &channel);
b3af341bbd9662c Stefan Popa       2018-11-13  900  		if (ret)
1970f4104c3431e Uwe Kleine-König  2024-12-06  901  			return dev_err_probe(dev, ret,
1970f4104c3431e Uwe Kleine-König  2024-12-06  902  					     "Failed to parse reg property of %pfwP\n", child);
b3af341bbd9662c Stefan Popa       2018-11-13  903  
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  904  		if (channel >= num_channels)
a6eaf02b82744b4 Jonathan Cameron  2024-02-18  905  			return dev_err_probe(dev, -EINVAL,
1970f4104c3431e Uwe Kleine-König  2024-12-06  906  					     "Channel index >= number of channels in %pfwP\n", child);
f2a772c51206b0c Jonathan Cameron  2021-05-13  907  
a6eaf02b82744b4 Jonathan Cameron  2024-02-18  908  		ret = fwnode_property_read_u32_array(child, "diff-channels",
b3af341bbd9662c Stefan Popa       2018-11-13  909  						     ain, 2);
b3af341bbd9662c Stefan Popa       2018-11-13  910  		if (ret)
1970f4104c3431e Uwe Kleine-König  2024-12-06  911  			return dev_err_probe(dev, ret,
1970f4104c3431e Uwe Kleine-König  2024-12-06  912  					     "Failed to parse diff-channels property of %pfwP\n", child);
b3af341bbd9662c Stefan Popa       2018-11-13  913  
e74ea4ee3263098 Uwe Kleine-König  2024-12-06  914  		if (!ad7124_valid_input_select(ain[0], st->chip_info) ||
e74ea4ee3263098 Uwe Kleine-König  2024-12-06  915  		    !ad7124_valid_input_select(ain[1], st->chip_info))
e74ea4ee3263098 Uwe Kleine-König  2024-12-06  916  			return dev_err_probe(dev, -EINVAL,
e74ea4ee3263098 Uwe Kleine-König  2024-12-06  917  					     "diff-channels property of %pfwP contains invalid data\n", child);
e74ea4ee3263098 Uwe Kleine-König  2024-12-06  918  
7b8d045e497a04d Alexandru Tachici 2021-03-11  919  		st->channels[channel].nr = channel;
7b8d045e497a04d Alexandru Tachici 2021-03-11  920  		st->channels[channel].ain = AD7124_CHANNEL_AINP(ain[0]) |
b3af341bbd9662c Stefan Popa       2018-11-13  921  						  AD7124_CHANNEL_AINM(ain[1]);
7b8d045e497a04d Alexandru Tachici 2021-03-11  922  
61cbfb5368dd50e Dumitru Ceclan    2024-08-06  923  		cfg = &st->channels[channel].cfg;
a6eaf02b82744b4 Jonathan Cameron  2024-02-18  924  		cfg->bipolar = fwnode_property_read_bool(child, "bipolar");
b3af341bbd9662c Stefan Popa       2018-11-13  925  
a6eaf02b82744b4 Jonathan Cameron  2024-02-18  926  		ret = fwnode_property_read_u32(child, "adi,reference-select", &tmp);
b3af341bbd9662c Stefan Popa       2018-11-13  927  		if (ret)
7b8d045e497a04d Alexandru Tachici 2021-03-11  928  			cfg->refsel = AD7124_INT_REF;
b3af341bbd9662c Stefan Popa       2018-11-13  929  		else
7b8d045e497a04d Alexandru Tachici 2021-03-11  930  			cfg->refsel = tmp;
b3af341bbd9662c Stefan Popa       2018-11-13  931  
a6eaf02b82744b4 Jonathan Cameron  2024-02-18  932  		cfg->buf_positive =
a6eaf02b82744b4 Jonathan Cameron  2024-02-18  933  			fwnode_property_read_bool(child, "adi,buffered-positive");
a6eaf02b82744b4 Jonathan Cameron  2024-02-18  934  		cfg->buf_negative =
a6eaf02b82744b4 Jonathan Cameron  2024-02-18  935  			fwnode_property_read_bool(child, "adi,buffered-negative");
0eaecea6e4878ab Mircea Caprioru   2019-06-25  936  
d7857e4ee1ba697 Alexandru Tachici 2019-12-20  937  		chan[channel] = ad7124_channel_template;
d7857e4ee1ba697 Alexandru Tachici 2019-12-20  938  		chan[channel].address = channel;
d7857e4ee1ba697 Alexandru Tachici 2019-12-20  939  		chan[channel].scan_index = channel;
d7857e4ee1ba697 Alexandru Tachici 2019-12-20  940  		chan[channel].channel = ain[0];
d7857e4ee1ba697 Alexandru Tachici 2019-12-20  941  		chan[channel].channel2 = ain[1];
b3af341bbd9662c Stefan Popa       2018-11-13  942  	}
b3af341bbd9662c Stefan Popa       2018-11-13  943  
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  944  	if (num_channels < AD7124_MAX_CHANNELS) {
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  945  		st->channels[num_channels] = (struct ad7124_channel) {
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  946  			.nr = num_channels,
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  947  			.ain = AD7124_CHANNEL_AINP(AD7124_INPUT_TEMPSENSOR) |
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  948  				AD7124_CHANNEL_AINM(AD7124_INPUT_AVSS),
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  949  			.cfg = {
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  950  				.bipolar = true,
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  951  			},
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  952  		};
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  953  
9e6c3da8f517970 Uwe Kleine-König  2024-12-06 @954  		chan[num_channels] = (struct iio_chan_spec) {
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  955  			.type = IIO_TEMP,
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  956  			.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  957  				BIT(IIO_CHAN_INFO_SCALE) | BIT(IIO_CHAN_INFO_OFFSET) |
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  958  				BIT(IIO_CHAN_INFO_SAMP_FREQ),
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  959  			.scan_type = {
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  960  				/*
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  961  				 * You might find it strange that a bipolar
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  962  				 * measurement yields an unsigned value, but
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  963  				 * this matches the device's manual.
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  964  				 */
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  965  				.sign = 'u',
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  966  				.realbits = 24,
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  967  				.storagebits = 32,
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  968  				.endianness = IIO_BE,
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  969  			},
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  970  			.address = num_channels,
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  971  			.scan_index = num_channels,
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  972  		};
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  973  	};
9e6c3da8f517970 Uwe Kleine-König  2024-12-06  974  
b3af341bbd9662c Stefan Popa       2018-11-13  975  	return 0;
b3af341bbd9662c Stefan Popa       2018-11-13  976  }
b3af341bbd9662c Stefan Popa       2018-11-13  977  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
