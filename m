Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBBB289824
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 17:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765646653; cv=none; b=TtGC+ZAaN+vvueXGm1zhIbaClWmOGbXzFLRgpaAZA4XMKz/CjTaCJ+QEaOdSER4nAHvynWc2SUoKsWRMKpQL0O4P33D+pHgtX8/j8GSMXWM+SnPlJSfUwZupWLs89L48g3twt00BC8SHRv9WTmgrMrc8031cZTPPWlEqlrBzTWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765646653; c=relaxed/simple;
	bh=ktF7UH+JafeEaGanE5j/C0g2swWfhvlxXxL8vqFOhaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ns9HfK7mjYm41JHmLfLRKPWAWpRDaNaGohvCuiH2qAZxwzpgCGN9hagCpnrE4r/IH6+z9E8oLnz02Yceu4Il5NwK64BhyhzsX/36MsZ2Te+kqFGBotmXrBDtsZ2XiTvPcH0kvLFM9jQDQt875GgRni0plpolqq5VcjYTbgS036s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQRjhgsU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQRjhgsU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765646651; x=1797182651;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ktF7UH+JafeEaGanE5j/C0g2swWfhvlxXxL8vqFOhaw=;
  b=DQRjhgsUDrvei5TpdKE+5dQxn3TVXJ4sR9dQUigGKrZaxb3f6wg13a1G
   1YNXtCzrBtovFcwf5Tyhw8956p/YupxKblX0UwEx2LYFnH337YDAYPL+1
   X0wTBxRfbFaJCB9Zc9sH6naD/IpE5dWAkUKVutSEese/K/CGJYeLost18
   XlkNiA/ZM6lQmJXbaRr0Si8sDtHOa/eVZel8Diom2WAlqgW7Y6GE935cM
   d9AEmaZ4DEsJ+dUkEID1AGFNwhfviRJm04++nXzheMBkFRp2bMbEff3Um
   1X5+/YxW7gOsQKSa4NLfT05rYud/5FOqZdVausByoy0s2TlThj7epHftf
   Q==;
X-CSE-ConnectionGUID: BJT+/C8uSuerRALrydyiXA==
X-CSE-MsgGUID: H59HuSATQZecY021IBmxMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85211064"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="85211064"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 09:24:09 -0800
X-CSE-ConnectionGUID: +9RrEDg4R5u5ns4Vj6Cfwg==
X-CSE-MsgGUID: xX2qiGCjTE2baMEzho7dzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197405043"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Dec 2025 09:24:07 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUTLg-000000007zB-2bNI;
	Sat, 13 Dec 2025 17:24:04 +0000
Date: Sun, 14 Dec 2025 01:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/adc/ad7124.c:954 ad7124_parse_channel_config() warn:
 potentially one past the end of array 'chan[num_channels]'
Message-ID: <202512140121.39NgsWnf-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 6eaf3f60ab45a5740ed4e1a7d41c4f0c10f6ac3c iio: adc: ad7124: Implement temperature measurement
date:   1 year ago
:::::: branch date: 8 hours ago
:::::: commit date: 1 year ago
config: arm-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140121.39NgsWnf-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140121.39NgsWnf-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7124.c:954 ad7124_parse_channel_config() warn: potentially one past the end of array 'chan[num_channels]'
drivers/iio/adc/ad7124.c:954 ad7124_parse_channel_config() warn: potentially one past the end of array 'chan[num_channels]'

vim +954 drivers/iio/adc/ad7124.c

9ecad7f404b57d Uwe Kleine-König  2024-12-06  857  
a6eaf02b82744b Jonathan Cameron  2024-02-18  858  static int ad7124_parse_channel_config(struct iio_dev *indio_dev,
a6eaf02b82744b Jonathan Cameron  2024-02-18  859  				       struct device *dev)
b3af341bbd9662 Stefan Popa       2018-11-13  860  {
b3af341bbd9662 Stefan Popa       2018-11-13  861  	struct ad7124_state *st = iio_priv(indio_dev);
7b8d045e497a04 Alexandru Tachici 2021-03-11  862  	struct ad7124_channel_config *cfg;
7b8d045e497a04 Alexandru Tachici 2021-03-11  863  	struct ad7124_channel *channels;
b3af341bbd9662 Stefan Popa       2018-11-13  864  	struct iio_chan_spec *chan;
b3af341bbd9662 Stefan Popa       2018-11-13  865  	unsigned int ain[2], channel = 0, tmp;
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  866  	unsigned int num_channels;
b3af341bbd9662 Stefan Popa       2018-11-13  867  	int ret;
b3af341bbd9662 Stefan Popa       2018-11-13  868  
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  869  	num_channels = device_get_child_node_count(dev);
b3af341bbd9662 Stefan Popa       2018-11-13  870  
cc597af18092d0 Uwe Kleine-König  2024-12-06  871  	/*
cc597af18092d0 Uwe Kleine-König  2024-12-06  872  	 * The driver assigns each logical channel defined in the device tree
cc597af18092d0 Uwe Kleine-König  2024-12-06  873  	 * statically one channel register. So only accept 16 such logical
cc597af18092d0 Uwe Kleine-König  2024-12-06  874  	 * channels to not treat CONFIG_0 (i.e. the register following
cc597af18092d0 Uwe Kleine-König  2024-12-06  875  	 * CHANNEL_15) as an additional channel register. The driver could be
cc597af18092d0 Uwe Kleine-König  2024-12-06  876  	 * improved to lift this limitation.
cc597af18092d0 Uwe Kleine-König  2024-12-06  877  	 */
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  878  	if (num_channels > AD7124_MAX_CHANNELS)
cc597af18092d0 Uwe Kleine-König  2024-12-06  879  		return dev_err_probe(dev, -EINVAL, "Too many channels defined\n");
cc597af18092d0 Uwe Kleine-König  2024-12-06  880  
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  881  	/* Add one for temperature */
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  882  	st->num_channels = min(num_channels + 1, AD7124_MAX_CHANNELS);
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  883  
b3af341bbd9662 Stefan Popa       2018-11-13  884  	chan = devm_kcalloc(indio_dev->dev.parent, st->num_channels,
b3af341bbd9662 Stefan Popa       2018-11-13  885  			    sizeof(*chan), GFP_KERNEL);
b3af341bbd9662 Stefan Popa       2018-11-13  886  	if (!chan)
b3af341bbd9662 Stefan Popa       2018-11-13  887  		return -ENOMEM;
b3af341bbd9662 Stefan Popa       2018-11-13  888  
7b8d045e497a04 Alexandru Tachici 2021-03-11  889  	channels = devm_kcalloc(indio_dev->dev.parent, st->num_channels, sizeof(*channels),
7b8d045e497a04 Alexandru Tachici 2021-03-11  890  				GFP_KERNEL);
7b8d045e497a04 Alexandru Tachici 2021-03-11  891  	if (!channels)
1478a388f4baaa Mircea Caprioru   2019-06-25  892  		return -ENOMEM;
1478a388f4baaa Mircea Caprioru   2019-06-25  893  
b3af341bbd9662 Stefan Popa       2018-11-13  894  	indio_dev->channels = chan;
b3af341bbd9662 Stefan Popa       2018-11-13  895  	indio_dev->num_channels = st->num_channels;
7b8d045e497a04 Alexandru Tachici 2021-03-11  896  	st->channels = channels;
b3af341bbd9662 Stefan Popa       2018-11-13  897  
a6eaf02b82744b Jonathan Cameron  2024-02-18  898  	device_for_each_child_node_scoped(dev, child) {
a6eaf02b82744b Jonathan Cameron  2024-02-18  899  		ret = fwnode_property_read_u32(child, "reg", &channel);
b3af341bbd9662 Stefan Popa       2018-11-13  900  		if (ret)
abc61acde13cd9 Uwe Kleine-König  2024-12-06  901  			return dev_err_probe(dev, ret,
abc61acde13cd9 Uwe Kleine-König  2024-12-06  902  					     "Failed to parse reg property of %pfwP\n", child);
b3af341bbd9662 Stefan Popa       2018-11-13  903  
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  904  		if (channel >= num_channels)
a6eaf02b82744b Jonathan Cameron  2024-02-18  905  			return dev_err_probe(dev, -EINVAL,
abc61acde13cd9 Uwe Kleine-König  2024-12-06  906  					     "Channel index >= number of channels in %pfwP\n", child);
f2a772c51206b0 Jonathan Cameron  2021-05-13  907  
a6eaf02b82744b Jonathan Cameron  2024-02-18  908  		ret = fwnode_property_read_u32_array(child, "diff-channels",
b3af341bbd9662 Stefan Popa       2018-11-13  909  						     ain, 2);
b3af341bbd9662 Stefan Popa       2018-11-13  910  		if (ret)
abc61acde13cd9 Uwe Kleine-König  2024-12-06  911  			return dev_err_probe(dev, ret,
abc61acde13cd9 Uwe Kleine-König  2024-12-06  912  					     "Failed to parse diff-channels property of %pfwP\n", child);
b3af341bbd9662 Stefan Popa       2018-11-13  913  
9ecad7f404b57d Uwe Kleine-König  2024-12-06  914  		if (!ad7124_valid_input_select(ain[0], st->chip_info) ||
9ecad7f404b57d Uwe Kleine-König  2024-12-06  915  		    !ad7124_valid_input_select(ain[1], st->chip_info))
9ecad7f404b57d Uwe Kleine-König  2024-12-06  916  			return dev_err_probe(dev, -EINVAL,
9ecad7f404b57d Uwe Kleine-König  2024-12-06  917  					     "diff-channels property of %pfwP contains invalid data\n", child);
9ecad7f404b57d Uwe Kleine-König  2024-12-06  918  
7b8d045e497a04 Alexandru Tachici 2021-03-11  919  		st->channels[channel].nr = channel;
7b8d045e497a04 Alexandru Tachici 2021-03-11  920  		st->channels[channel].ain = AD7124_CHANNEL_AINP(ain[0]) |
b3af341bbd9662 Stefan Popa       2018-11-13  921  						  AD7124_CHANNEL_AINM(ain[1]);
7b8d045e497a04 Alexandru Tachici 2021-03-11  922  
61cbfb5368dd50 Dumitru Ceclan    2024-08-06  923  		cfg = &st->channels[channel].cfg;
a6eaf02b82744b Jonathan Cameron  2024-02-18  924  		cfg->bipolar = fwnode_property_read_bool(child, "bipolar");
b3af341bbd9662 Stefan Popa       2018-11-13  925  
a6eaf02b82744b Jonathan Cameron  2024-02-18  926  		ret = fwnode_property_read_u32(child, "adi,reference-select", &tmp);
b3af341bbd9662 Stefan Popa       2018-11-13  927  		if (ret)
7b8d045e497a04 Alexandru Tachici 2021-03-11  928  			cfg->refsel = AD7124_INT_REF;
b3af341bbd9662 Stefan Popa       2018-11-13  929  		else
7b8d045e497a04 Alexandru Tachici 2021-03-11  930  			cfg->refsel = tmp;
b3af341bbd9662 Stefan Popa       2018-11-13  931  
a6eaf02b82744b Jonathan Cameron  2024-02-18  932  		cfg->buf_positive =
a6eaf02b82744b Jonathan Cameron  2024-02-18  933  			fwnode_property_read_bool(child, "adi,buffered-positive");
a6eaf02b82744b Jonathan Cameron  2024-02-18  934  		cfg->buf_negative =
a6eaf02b82744b Jonathan Cameron  2024-02-18  935  			fwnode_property_read_bool(child, "adi,buffered-negative");
0eaecea6e4878a Mircea Caprioru   2019-06-25  936  
d7857e4ee1ba69 Alexandru Tachici 2019-12-20  937  		chan[channel] = ad7124_channel_template;
d7857e4ee1ba69 Alexandru Tachici 2019-12-20  938  		chan[channel].address = channel;
d7857e4ee1ba69 Alexandru Tachici 2019-12-20  939  		chan[channel].scan_index = channel;
d7857e4ee1ba69 Alexandru Tachici 2019-12-20  940  		chan[channel].channel = ain[0];
d7857e4ee1ba69 Alexandru Tachici 2019-12-20  941  		chan[channel].channel2 = ain[1];
b3af341bbd9662 Stefan Popa       2018-11-13  942  	}
b3af341bbd9662 Stefan Popa       2018-11-13  943  
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  944  	if (num_channels < AD7124_MAX_CHANNELS) {
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  945  		st->channels[num_channels] = (struct ad7124_channel) {
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  946  			.nr = num_channels,
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  947  			.ain = AD7124_CHANNEL_AINP(AD7124_INPUT_TEMPSENSOR) |
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  948  				AD7124_CHANNEL_AINM(AD7124_INPUT_AVSS),
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  949  			.cfg = {
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  950  				.bipolar = true,
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  951  			},
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  952  		};
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  953  
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06 @954  		chan[num_channels] = (struct iio_chan_spec) {
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  955  			.type = IIO_TEMP,
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  956  			.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  957  				BIT(IIO_CHAN_INFO_SCALE) | BIT(IIO_CHAN_INFO_OFFSET) |
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  958  				BIT(IIO_CHAN_INFO_SAMP_FREQ),
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  959  			.scan_type = {
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  960  				/*
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  961  				 * You might find it strange that a bipolar
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  962  				 * measurement yields an unsigned value, but
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  963  				 * this matches the device's manual.
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  964  				 */
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  965  				.sign = 'u',
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  966  				.realbits = 24,
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  967  				.storagebits = 32,
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  968  				.endianness = IIO_BE,
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  969  			},
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  970  			.address = num_channels,
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  971  			.scan_index = num_channels,
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  972  		};
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  973  	}
6eaf3f60ab45a5 Uwe Kleine-König  2024-12-06  974  
b3af341bbd9662 Stefan Popa       2018-11-13  975  	return 0;
b3af341bbd9662 Stefan Popa       2018-11-13  976  }
b3af341bbd9662 Stefan Popa       2018-11-13  977  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
