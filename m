Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3873B1E4BF
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Jun 2024 12:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719146159; cv=none; b=pZILJmLoVppN6DMkmvHdqT1M8vm80mHIpuV3Ub0yZ+YuetUJmhnAoeUvMTAesW71atdgugpv9szc3Ya/35nSMgiHK35hhe/vP6fq7Wv2l6TLf/+DyFONlpP1lPwtiL/7fd1pZ8c1lU6/Q/BkdWxko2tOJ7xbwW12GStlolqNj3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719146159; c=relaxed/simple;
	bh=HX7j+K7oS0TbvgKfaDJaMczOwrd3kILKtI8aWFWRt6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X/qFWd3yPg7PEeQSurv2GOyc7X7NxbCksZo1GUv0MFi93r9ySBQ+J24dx1B/CKn6v80DUkCxxzqHbomhqyXfoZ+PcDkMRlMpFQAtzTdzYIyyuyjo91JuXJ1NRRBuSbNVHThPBL+eNnCFObiIn2OR93JOzKzspR5L45tI46hlCPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fmdzffKQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fmdzffKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719146157; x=1750682157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HX7j+K7oS0TbvgKfaDJaMczOwrd3kILKtI8aWFWRt6M=;
  b=fmdzffKQ2UrCWG17BJrAx2ZqE7jyFq4KJwFHRukSGWCBfayMOOIX09pm
   cuEntLlcYa7zsLl1MXWdceabQaGXBJL1bCEOaf9O6h9lG0zwKxCVe4c3h
   SsYmb0Fpbfs+twwVZ1VHxXrxJDewFNtrhGGZ5Dh2Cgb56aeTXWkhiV4Ko
   o4mUaF6Sv6SFQKJWaVNhD4/ikJP36ONKzjnlKmh/7DwC0GO5a32xwkl/E
   SLBNkPnjXSw9SMx5vQfshC4cOz+j4dTkw2l09gk1jWfWHXZtUukXjTGuI
   9hSRRvznEct/XVFqlbfcZFdQfsXdcNU+uhwvkN/aFqxBSzTyMW0LniPSv
   A==;
X-CSE-ConnectionGUID: SA3ew9K5TzihJu0RtWK9Xg==
X-CSE-MsgGUID: FASEWZl0TwK3CHbrRW4pDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="33665315"
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="33665315"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 05:35:56 -0700
X-CSE-ConnectionGUID: CGKwg7jFTtWmPChkARzbkw==
X-CSE-MsgGUID: yeCU4hmcTXy3I+nYY8vuIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="43481916"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jun 2024 05:35:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLMRk-000AUo-2T;
	Sun, 23 Jun 2024 12:35:52 +0000
Date: Sun, 23 Jun 2024 20:35:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:testing 15/61] drivers/iio/adc/ad7173.c:1254
 ad7173_fw_parse_channel_config() error: uninitialized symbol
 'is_current_chan'.
Message-ID: <202406232046.DKfBJq6o-lkp@intel.com>
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
TO: Dumitru Ceclan <dumitru.ceclan@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Nuno Sa <nuno.sa@analog.com>
CC: David Lechner <dlechner@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   e2afe21f9b0bfa3f188cd5a60940b07a85d65e9a
commit: cfc4c76b75ab68a95976e0db725baff385c4136d [15/61] iio: adc: ad7173: Add support for AD411x devices
:::::: branch date: 18 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-161-20240623 (https://download.01.org/0day-ci/archive/20240623/202406232046.DKfBJq6o-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406232046.DKfBJq6o-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7173.c:1254 ad7173_fw_parse_channel_config() error: uninitialized symbol 'is_current_chan'.

vim +/is_current_chan +1254 drivers/iio/adc/ad7173.c

87477bf7433028 Dumitru Ceclan   2024-06-07  1183  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1184  static int ad7173_fw_parse_channel_config(struct iio_dev *indio_dev)
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1185  {
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1186  	struct ad7173_channel *chans_st_arr, *chan_st_priv;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1187  	struct ad7173_state *st = iio_priv(indio_dev);
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1188  	struct device *dev = indio_dev->dev.parent;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1189  	struct iio_chan_spec *chan_arr, *chan;
87477bf7433028 Dumitru Ceclan   2024-06-07  1190  	unsigned int ain[AD7173_NO_AINS_PER_CHANNEL], chan_index = 0;
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1191  	int ref_sel, ret, is_current_chan, num_channels;
51d5a38b21113a Dumitru Ceclan   2024-06-07  1192  
51d5a38b21113a Dumitru Ceclan   2024-06-07  1193  	num_channels = device_get_child_node_count(dev);
51d5a38b21113a Dumitru Ceclan   2024-06-07  1194  
51d5a38b21113a Dumitru Ceclan   2024-06-07  1195  	if (st->info->has_temp)
51d5a38b21113a Dumitru Ceclan   2024-06-07  1196  		num_channels++;
51d5a38b21113a Dumitru Ceclan   2024-06-07  1197  
51d5a38b21113a Dumitru Ceclan   2024-06-07  1198  	if (num_channels == 0)
51d5a38b21113a Dumitru Ceclan   2024-06-07  1199  		return dev_err_probe(dev, -ENODATA, "No channels specified\n");
51d5a38b21113a Dumitru Ceclan   2024-06-07  1200  
51d5a38b21113a Dumitru Ceclan   2024-06-07  1201  	if (num_channels > st->info->num_channels)
51d5a38b21113a Dumitru Ceclan   2024-06-07  1202  		return dev_err_probe(dev, -EINVAL,
51d5a38b21113a Dumitru Ceclan   2024-06-07  1203  			"Too many channels specified. Maximum is %d, not including temperature channel if supported.\n",
51d5a38b21113a Dumitru Ceclan   2024-06-07  1204  			st->info->num_channels);
51d5a38b21113a Dumitru Ceclan   2024-06-07  1205  
51d5a38b21113a Dumitru Ceclan   2024-06-07  1206  	indio_dev->num_channels = num_channels;
51d5a38b21113a Dumitru Ceclan   2024-06-07  1207  	st->num_channels = num_channels;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1208  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1209  	chan_arr = devm_kcalloc(dev, sizeof(*indio_dev->channels),
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1210  				st->num_channels, GFP_KERNEL);
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1211  	if (!chan_arr)
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1212  		return -ENOMEM;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1213  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1214  	chans_st_arr = devm_kcalloc(dev, st->num_channels, sizeof(*st->channels),
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1215  				    GFP_KERNEL);
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1216  	if (!chans_st_arr)
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1217  		return -ENOMEM;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1218  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1219  	indio_dev->channels = chan_arr;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1220  	st->channels = chans_st_arr;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1221  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1222  	if (st->info->has_temp) {
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1223  		chan_arr[chan_index] = ad7173_temp_iio_channel_template;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1224  		chan_st_priv = &chans_st_arr[chan_index];
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1225  		chan_st_priv->ain =
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1226  			AD7173_CH_ADDRESS(chan_arr[chan_index].channel,
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1227  					  chan_arr[chan_index].channel2);
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1228  		chan_st_priv->cfg.bipolar = false;
ab6f0ab1781371 Dumitru Ceclan   2024-05-21  1229  		chan_st_priv->cfg.input_buf = st->info->has_input_buf;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1230  		chan_st_priv->cfg.ref_sel = AD7173_SETUP_REF_SEL_INT_REF;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1231  		st->adc_mode |= AD7173_ADC_MODE_REF_EN;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1232  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1233  		chan_index++;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1234  	}
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1235  
cf84f1e0a8fd23 Jonathan Cameron 2024-03-30  1236  	device_for_each_child_node_scoped(dev, child) {
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1237  		chan = &chan_arr[chan_index];
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1238  		*chan = ad7173_channel_template;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1239  		chan_st_priv = &chans_st_arr[chan_index];
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1240  		ret = fwnode_property_read_u32_array(child, "diff-channels",
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1241  						     ain, ARRAY_SIZE(ain));
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1242  		if (ret) {
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1243  			ret = fwnode_property_read_u32(child, "single-channel",
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1244  						       ain);
cf84f1e0a8fd23 Jonathan Cameron 2024-03-30  1245  			if (ret)
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1246  				return dev_err_probe(dev, ret,
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1247  					"Channel must define one of diff-channels or single-channel.\n");
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1248  
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1249  			is_current_chan = fwnode_property_read_bool(child, "adi,current-channel");
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1250  		} else {
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1251  			chan->differential = true;
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1252  		}
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1253  
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07 @1254  		if (is_current_chan) {
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1255  			ret = ad4111_validate_current_ain(st, ain);
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1256  			if (ret)
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1257  				return ret;
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1258  		} else {
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1259  			if (!chan->differential) {
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1260  				ret = fwnode_property_read_u32(child,
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1261  					"common-mode-channel", ain + 1);
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1262  				if (ret)
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1263  					return dev_err_probe(dev, ret,
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1264  						"common-mode-channel must be defined for single-ended channels.\n");
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1265  			}
87477bf7433028 Dumitru Ceclan   2024-06-07  1266  			ret = ad7173_validate_voltage_ain_inputs(st, ain[0], ain[1]);
87477bf7433028 Dumitru Ceclan   2024-06-07  1267  			if (ret)
87477bf7433028 Dumitru Ceclan   2024-06-07  1268  				return ret;
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1269  		}
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1270  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1271  		ret = fwnode_property_match_property_string(child,
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1272  							    "adi,reference-select",
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1273  							    ad7173_ref_sel_str,
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1274  							    ARRAY_SIZE(ad7173_ref_sel_str));
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1275  		if (ret < 0)
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1276  			ref_sel = AD7173_SETUP_REF_SEL_INT_REF;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1277  		else
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1278  			ref_sel = ret;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1279  
87477bf7433028 Dumitru Ceclan   2024-06-07  1280  		ret = ad7173_validate_reference(st, ref_sel);
87477bf7433028 Dumitru Ceclan   2024-06-07  1281  		if (ret)
87477bf7433028 Dumitru Ceclan   2024-06-07  1282  			return ret;
cf84f1e0a8fd23 Jonathan Cameron 2024-03-30  1283  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1284  		if (ref_sel == AD7173_SETUP_REF_SEL_INT_REF)
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1285  			st->adc_mode |= AD7173_ADC_MODE_REF_EN;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1286  		chan_st_priv->cfg.ref_sel = ref_sel;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1287  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1288  		chan->address = chan_index;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1289  		chan->scan_index = chan_index;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1290  		chan->channel = ain[0];
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1291  		chan_st_priv->chan_reg = chan_index;
ab6f0ab1781371 Dumitru Ceclan   2024-05-21  1292  		chan_st_priv->cfg.input_buf = st->info->has_input_buf;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1293  		chan_st_priv->cfg.odr = 0;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1294  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1295  		chan_st_priv->cfg.bipolar = fwnode_property_read_bool(child, "bipolar");
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1296  		if (chan_st_priv->cfg.bipolar)
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1297  			chan->info_mask_separate |= BIT(IIO_CHAN_INFO_OFFSET);
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1298  
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1299  		if (is_current_chan) {
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1300  			chan->type = IIO_CURRENT;
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1301  			chan->differential = false;
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1302  			chan->channel2 = 0;
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1303  			chan_st_priv->ain = ad4111_current_channel_config[ain[0]];
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1304  		} else {
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1305  			chan_st_priv->cfg.input_buf = st->info->has_input_buf;
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1306  			chan->channel2 = ain[1];
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1307  			chan_st_priv->ain = AD7173_CH_ADDRESS(ain[0], ain[1]);
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1308  		}
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1309  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1310  		chan_index++;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1311  	}
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1312  	return 0;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1313  }
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1314  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
