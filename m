Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540051C860C
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758898943; cv=none; b=IrwqA7HF6lA6f+DNjcWlVScwDwGdBzyN9qfXvdlfaR26E/kPzOdRSyEnIpZsKKdSdEfK6G3MrjkP0s6KdeA2QoF087z7wBQyMG4N/Js+cKPUc9vEs+Ds0m59iGKnYXh6FfR0ReLpxwf611HUdEdoi/9o/T57xNQc1++2IWjiMkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758898943; c=relaxed/simple;
	bh=oo01rUPnprY0CrM9lpS6G5nYPtRZQb8ZUIkDJIxRkuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LpGcuftjFCJ1KQ072LnhuBXq485Cnr1t1zeJJSPSZfjep/PeMqOPf+Y3xX/WzPJUV+Kmu0Bkh4L8sAhXRIovgwHTYsrqjAq9Q7DRCMVmR+S6Xt+DJGLeVwKD86kQhbid9QfM42mbY8eyOnCajPASC7Ca2SY07MmNJ30MdCZQJSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xot3Zo88; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xot3Zo88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758898941; x=1790434941;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oo01rUPnprY0CrM9lpS6G5nYPtRZQb8ZUIkDJIxRkuc=;
  b=Xot3Zo886C/TuPBRaQWLkY9LcQJTv6SDsU5w7F8X3ClwXfZWZsjKedGv
   L0fh2zxK7/iBsPscR42cHImbI/+VnVthXu9CGtXj+ibHcFQSP6kMQU+4P
   XhgS63g/xV0Dv85x7mGL9qzy2mW3vxgxestWsq6137XW/XccuS/zlYpaI
   Bo0ee+lcki/GZ4QvQs64JV3mDM+GU7vyNxWZymnaUIMcuuSVNTz+62Wa5
   XKuVLv6WPWSDiGPTPGsd34PiNCYszVo+bVSAtzWTPJJ1g/KVyHX9Vi/0X
   K9q+esBRI88qQGfh/Jnm3VxqSNUVV7mBB1j287+/P2iqS/PMtHVm9AQqS
   g==;
X-CSE-ConnectionGUID: lVsCksnRQb60ZZTjjcmCmQ==
X-CSE-MsgGUID: cKpfVTAYTt2ZUXutK4m7gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="60933678"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="60933678"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 08:02:21 -0700
X-CSE-ConnectionGUID: pE58qtvmSMufblTl+pX4cQ==
X-CSE-MsgGUID: fuyX03zBRNyjZJAg1MBowA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="177563966"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Sep 2025 08:02:19 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v29xW-0006Kv-24;
	Fri, 26 Sep 2025 15:02:09 +0000
Date: Fri, 26 Sep 2025 23:01:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] iio: dac: adding support for Microchip MCP47FEB02
Message-ID: <202509262228.MYSY2WkV-lkp@intel.com>
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
In-Reply-To: <20250922-mcp47feb02-v1-2-06cb4acaa347@microchip.com>
References: <20250922-mcp47feb02-v1-2-06cb4acaa347@microchip.com>
TO: Ariana Lazar <ariana.lazar@microchip.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Ariana Lazar <ariana.lazar@microchip.com>

Hi Ariana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Ariana-Lazar/dt-bindings-iio-dac-adding-support-for-Microchip-MCP47FEB02/20250922-193559
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250922-mcp47feb02-v1-2-06cb4acaa347%40microchip.com
patch subject: [PATCH 2/2] iio: dac: adding support for Microchip MCP47FEB02
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-r073-20250926 (https://download.01.org/0day-ci/archive/20250926/202509262228.MYSY2WkV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509262228.MYSY2WkV-lkp@intel.com/

smatch warnings:
drivers/iio/dac/mcp47feb02.c:1258 mcp47feb02_probe() error: uninitialized symbol 'vref_mv'.
drivers/iio/dac/mcp47feb02.c:1258 mcp47feb02_probe() error: uninitialized symbol 'vref1_mv'.

vim +/vref_mv +1258 drivers/iio/dac/mcp47feb02.c

2e305393740054 Ariana Lazar 2025-09-22  1107  
2e305393740054 Ariana Lazar 2025-09-22  1108  static int mcp47feb02_probe(struct i2c_client *client)
2e305393740054 Ariana Lazar 2025-09-22  1109  {
2e305393740054 Ariana Lazar 2025-09-22  1110  	int err, ret, vdd_mv, vref_mv, vref1_mv, i, tmp_vref, vref_ch, gain_ch;
2e305393740054 Ariana Lazar 2025-09-22  1111  	const struct i2c_device_id *id = i2c_client_get_device_id(client);
2e305393740054 Ariana Lazar 2025-09-22  1112  	const struct mcp47feb02_features *info;
2e305393740054 Ariana Lazar 2025-09-22  1113  	enum vref_mode ref_mode, ref_mode1;
2e305393740054 Ariana Lazar 2025-09-22  1114  	struct device *dev = &client->dev;
2e305393740054 Ariana Lazar 2025-09-22  1115  	struct mcp47feb02_data *data;
2e305393740054 Ariana Lazar 2025-09-22  1116  	struct iio_dev *indio_dev;
2e305393740054 Ariana Lazar 2025-09-22  1117  
2e305393740054 Ariana Lazar 2025-09-22  1118  	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
2e305393740054 Ariana Lazar 2025-09-22  1119  	if (!indio_dev)
2e305393740054 Ariana Lazar 2025-09-22  1120  		return -ENOMEM;
2e305393740054 Ariana Lazar 2025-09-22  1121  
2e305393740054 Ariana Lazar 2025-09-22  1122  	data = iio_priv(indio_dev);
2e305393740054 Ariana Lazar 2025-09-22  1123  	i2c_set_clientdata(client, indio_dev);
2e305393740054 Ariana Lazar 2025-09-22  1124  	data->client = client;
2e305393740054 Ariana Lazar 2025-09-22  1125  	info = i2c_get_match_data(client);
2e305393740054 Ariana Lazar 2025-09-22  1126  
2e305393740054 Ariana Lazar 2025-09-22  1127  	if (info->have_eeprom) {
2e305393740054 Ariana Lazar 2025-09-22  1128  		data->regmap = devm_regmap_init_i2c(client, &mcp47feb02_regmap_config);
2e305393740054 Ariana Lazar 2025-09-22  1129  		data->have_eeprom = true;
2e305393740054 Ariana Lazar 2025-09-22  1130  	} else {
2e305393740054 Ariana Lazar 2025-09-22  1131  		data->regmap = devm_regmap_init_i2c(client, &mcp47fvb02_regmap_config);
2e305393740054 Ariana Lazar 2025-09-22  1132  		data->have_eeprom = false;
2e305393740054 Ariana Lazar 2025-09-22  1133  	}
2e305393740054 Ariana Lazar 2025-09-22  1134  
2e305393740054 Ariana Lazar 2025-09-22  1135  	if (IS_ERR(data->regmap))
2e305393740054 Ariana Lazar 2025-09-22  1136  		dev_err_probe(dev, PTR_ERR(data->regmap), "Error initializing i2c regmap\n");
2e305393740054 Ariana Lazar 2025-09-22  1137  
2e305393740054 Ariana Lazar 2025-09-22  1138  	err = mcp47feb02_parse_fw(indio_dev, info);
2e305393740054 Ariana Lazar 2025-09-22  1139  	if (err)
2e305393740054 Ariana Lazar 2025-09-22  1140  		return dev_err_probe(dev, err, "Error parsing devicetree data\n");
2e305393740054 Ariana Lazar 2025-09-22  1141  
2e305393740054 Ariana Lazar 2025-09-22  1142  	if (!info->have_ext_vref2 && data->use_vref1)
2e305393740054 Ariana Lazar 2025-09-22  1143  		return dev_err_probe(dev, -EINVAL,
2e305393740054 Ariana Lazar 2025-09-22  1144  				     "Second External reference is unavailable on %s\n",
2e305393740054 Ariana Lazar 2025-09-22  1145  				     info->name);
2e305393740054 Ariana Lazar 2025-09-22  1146  
2e305393740054 Ariana Lazar 2025-09-22  1147  	ret = regmap_read(data->regmap, CMD_FORMAT(MCP47FEB02_VREF_REG_ADDR, READ_CMD), &vref_ch);
2e305393740054 Ariana Lazar 2025-09-22  1148  	if (ret)
2e305393740054 Ariana Lazar 2025-09-22  1149  		return ret;
2e305393740054 Ariana Lazar 2025-09-22  1150  
2e305393740054 Ariana Lazar 2025-09-22  1151  	ret = regmap_read(data->regmap, CMD_FORMAT(MCP47FEB02_GAIN_STATUS_REG_ADDR, READ_CMD),
2e305393740054 Ariana Lazar 2025-09-22  1152  			  &gain_ch);
2e305393740054 Ariana Lazar 2025-09-22  1153  	if (ret)
2e305393740054 Ariana Lazar 2025-09-22  1154  		return ret;
2e305393740054 Ariana Lazar 2025-09-22  1155  
2e305393740054 Ariana Lazar 2025-09-22  1156  	gain_ch = gain_ch >> 8;
2e305393740054 Ariana Lazar 2025-09-22  1157  
2e305393740054 Ariana Lazar 2025-09-22  1158  	/*
2e305393740054 Ariana Lazar 2025-09-22  1159  	 * Values stored in the nonvolatile memory will be transferred to the volatile registers
2e305393740054 Ariana Lazar 2025-09-22  1160  	 * at startup. For safety reasons, the user receives a warning if startup values
2e305393740054 Ariana Lazar 2025-09-22  1161  	 * do not match the ones from current devicetree configuration.
2e305393740054 Ariana Lazar 2025-09-22  1162  	 * Nonvolatile memory can be written at any time
2e305393740054 Ariana Lazar 2025-09-22  1163  	 */
2e305393740054 Ariana Lazar 2025-09-22  1164  	for_each_set_bit(i, &data->active_channels_mask, data->phys_channels) {
2e305393740054 Ariana Lazar 2025-09-22  1165  		/* VDD can be set as Vref only with Gain x1 */
2e305393740054 Ariana Lazar 2025-09-22  1166  		if ((vref_ch & 0x03) == MCP47FEB02_VREF_VDD &&
2e305393740054 Ariana Lazar 2025-09-22  1167  		    (gain_ch & 0x01) == MCP47FEB02_GAIN_X2) {
2e305393740054 Ariana Lazar 2025-09-22  1168  			dev_info(dev, "vdd can be used only with gain x1\n");
2e305393740054 Ariana Lazar 2025-09-22  1169  			ret = mcp47feb02_write_to_register(data->regmap,
2e305393740054 Ariana Lazar 2025-09-22  1170  							   MCP47FEB02_GAIN_STATUS_REG_ADDR,
2e305393740054 Ariana Lazar 2025-09-22  1171  							   i, MCP47FEB02_GAIN_X1);
2e305393740054 Ariana Lazar 2025-09-22  1172  			if (ret)
2e305393740054 Ariana Lazar 2025-09-22  1173  				return ret;
2e305393740054 Ariana Lazar 2025-09-22  1174  
2e305393740054 Ariana Lazar 2025-09-22  1175  			data->chdata[i].use_2x_gain = MCP47FEB02_GAIN_X1;
2e305393740054 Ariana Lazar 2025-09-22  1176  		}
2e305393740054 Ariana Lazar 2025-09-22  1177  
2e305393740054 Ariana Lazar 2025-09-22  1178  		if (data->phys_channels >= 4 && (i % 2)) {
2e305393740054 Ariana Lazar 2025-09-22  1179  			if ((vref_ch & 0x03) == MCP47FEB02_EXTERNAL_VREF_BUFFERED &&
2e305393740054 Ariana Lazar 2025-09-22  1180  			    data->use_vref1 && !data->vref1_buffered)
2e305393740054 Ariana Lazar 2025-09-22  1181  				dev_info(dev, "vref1 is unbuffered\n");
2e305393740054 Ariana Lazar 2025-09-22  1182  			else if ((vref_ch & 0x03) == MCP47FEB02_EXTERNAL_VREF_UNBUFFERED &&
2e305393740054 Ariana Lazar 2025-09-22  1183  				 data->use_vref1 && data->vref1_buffered)
2e305393740054 Ariana Lazar 2025-09-22  1184  				dev_info(dev, "vref1 is buffered\n");
2e305393740054 Ariana Lazar 2025-09-22  1185  		} else {
2e305393740054 Ariana Lazar 2025-09-22  1186  			if ((vref_ch & 0x03) == MCP47FEB02_EXTERNAL_VREF_BUFFERED &&
2e305393740054 Ariana Lazar 2025-09-22  1187  			    data->use_vref && !data->vref_buffered)
2e305393740054 Ariana Lazar 2025-09-22  1188  				dev_info(dev, "vref is unbuffered\n");
2e305393740054 Ariana Lazar 2025-09-22  1189  			else if ((vref_ch & 0x03) == MCP47FEB02_EXTERNAL_VREF_UNBUFFERED &&
2e305393740054 Ariana Lazar 2025-09-22  1190  				 data->use_vref && data->vref_buffered)
2e305393740054 Ariana Lazar 2025-09-22  1191  				dev_info(dev, "vref is buffered\n");
2e305393740054 Ariana Lazar 2025-09-22  1192  		}
2e305393740054 Ariana Lazar 2025-09-22  1193  
2e305393740054 Ariana Lazar 2025-09-22  1194  		vref_ch = vref_ch >> 2;
2e305393740054 Ariana Lazar 2025-09-22  1195  		gain_ch = gain_ch >> 1;
2e305393740054 Ariana Lazar 2025-09-22  1196  	}
2e305393740054 Ariana Lazar 2025-09-22  1197  
2e305393740054 Ariana Lazar 2025-09-22  1198  	if (data->use_vref)
2e305393740054 Ariana Lazar 2025-09-22  1199  		ref_mode = data->vref_buffered ?
2e305393740054 Ariana Lazar 2025-09-22  1200  			MCP47FEB02_EXTERNAL_VREF_BUFFERED : MCP47FEB02_EXTERNAL_VREF_UNBUFFERED;
2e305393740054 Ariana Lazar 2025-09-22  1201  	else
2e305393740054 Ariana Lazar 2025-09-22  1202  		ref_mode = MCP47FEB02_INTERNAL_BAND_GAP;
2e305393740054 Ariana Lazar 2025-09-22  1203  
2e305393740054 Ariana Lazar 2025-09-22  1204  	if (data->use_vref1)
2e305393740054 Ariana Lazar 2025-09-22  1205  		ref_mode1 = data->vref1_buffered ?
2e305393740054 Ariana Lazar 2025-09-22  1206  			MCP47FEB02_EXTERNAL_VREF_BUFFERED : MCP47FEB02_EXTERNAL_VREF_UNBUFFERED;
2e305393740054 Ariana Lazar 2025-09-22  1207  
2e305393740054 Ariana Lazar 2025-09-22  1208  	else
2e305393740054 Ariana Lazar 2025-09-22  1209  		ref_mode1 =  MCP47FEB02_INTERNAL_BAND_GAP;
2e305393740054 Ariana Lazar 2025-09-22  1210  
2e305393740054 Ariana Lazar 2025-09-22  1211  	for_each_set_bit(i, &data->active_channels_mask, data->phys_channels) {
2e305393740054 Ariana Lazar 2025-09-22  1212  		if (data->phys_channels >= 4 && (i % 2))
2e305393740054 Ariana Lazar 2025-09-22  1213  			tmp_vref = ref_mode1;
2e305393740054 Ariana Lazar 2025-09-22  1214  		else
2e305393740054 Ariana Lazar 2025-09-22  1215  			tmp_vref = ref_mode;
2e305393740054 Ariana Lazar 2025-09-22  1216  
2e305393740054 Ariana Lazar 2025-09-22  1217  		ret = mcp47feb02_write_to_register(data->regmap, MCP47FEB02_VREF_REG_ADDR,
2e305393740054 Ariana Lazar 2025-09-22  1218  						   i, tmp_vref);
2e305393740054 Ariana Lazar 2025-09-22  1219  		if (ret)
2e305393740054 Ariana Lazar 2025-09-22  1220  			return ret;
2e305393740054 Ariana Lazar 2025-09-22  1221  
2e305393740054 Ariana Lazar 2025-09-22  1222  		data->chdata[i].ref_mode = tmp_vref;
2e305393740054 Ariana Lazar 2025-09-22  1223  	}
2e305393740054 Ariana Lazar 2025-09-22  1224  
2e305393740054 Ariana Lazar 2025-09-22  1225  	indio_dev->name = id->name;
2e305393740054 Ariana Lazar 2025-09-22  1226  	if (info->have_eeprom)
2e305393740054 Ariana Lazar 2025-09-22  1227  		indio_dev->info = &mcp47feb02_info;
2e305393740054 Ariana Lazar 2025-09-22  1228  	else
2e305393740054 Ariana Lazar 2025-09-22  1229  		indio_dev->info = &mcp47fvb02_info;
2e305393740054 Ariana Lazar 2025-09-22  1230  
2e305393740054 Ariana Lazar 2025-09-22  1231  	ret = devm_mutex_init(dev, &data->lock);
2e305393740054 Ariana Lazar 2025-09-22  1232  	if (ret < 0)
2e305393740054 Ariana Lazar 2025-09-22  1233  		return ret;
2e305393740054 Ariana Lazar 2025-09-22  1234  
2e305393740054 Ariana Lazar 2025-09-22  1235  	ret = devm_regulator_get_enable_read_voltage(dev, "vdd");
2e305393740054 Ariana Lazar 2025-09-22  1236  	if (ret < 0)
2e305393740054 Ariana Lazar 2025-09-22  1237  		return ret;
2e305393740054 Ariana Lazar 2025-09-22  1238  
2e305393740054 Ariana Lazar 2025-09-22  1239  	vdd_mv = ret / 1000;
2e305393740054 Ariana Lazar 2025-09-22  1240  
2e305393740054 Ariana Lazar 2025-09-22  1241  	if (data->use_vref) {
2e305393740054 Ariana Lazar 2025-09-22  1242  		ret = devm_regulator_get_enable_read_voltage(dev, "vref");
2e305393740054 Ariana Lazar 2025-09-22  1243  		if (ret < 0)
2e305393740054 Ariana Lazar 2025-09-22  1244  			return ret;
2e305393740054 Ariana Lazar 2025-09-22  1245  
2e305393740054 Ariana Lazar 2025-09-22  1246  		vref_mv = ret / 1000;
2e305393740054 Ariana Lazar 2025-09-22  1247  	}
2e305393740054 Ariana Lazar 2025-09-22  1248  
2e305393740054 Ariana Lazar 2025-09-22  1249  	if (data->use_vref1) {
2e305393740054 Ariana Lazar 2025-09-22  1250  		ret = devm_regulator_get_enable_read_voltage(dev, "vref1");
2e305393740054 Ariana Lazar 2025-09-22  1251  		if (ret < 0)
2e305393740054 Ariana Lazar 2025-09-22  1252  			return ret;
2e305393740054 Ariana Lazar 2025-09-22  1253  
2e305393740054 Ariana Lazar 2025-09-22  1254  		vref1_mv = ret / 1000;
2e305393740054 Ariana Lazar 2025-09-22  1255  	}
2e305393740054 Ariana Lazar 2025-09-22  1256  
2e305393740054 Ariana Lazar 2025-09-22  1257  	for_each_set_bit(i, &data->active_channels_mask, data->phys_channels) {
2e305393740054 Ariana Lazar 2025-09-22 @1258  		ret = mcp47feb02_init_scales_avail(info, data, vdd_mv, vref_mv, vref1_mv);
2e305393740054 Ariana Lazar 2025-09-22  1259  		if (ret)
2e305393740054 Ariana Lazar 2025-09-22  1260  			dev_err_probe(dev, ret, "failed to init scales for ch i %d\n", i);
2e305393740054 Ariana Lazar 2025-09-22  1261  	}
2e305393740054 Ariana Lazar 2025-09-22  1262  
2e305393740054 Ariana Lazar 2025-09-22  1263  	err = iio_device_register(indio_dev);
2e305393740054 Ariana Lazar 2025-09-22  1264  
2e305393740054 Ariana Lazar 2025-09-22  1265  	return err;
2e305393740054 Ariana Lazar 2025-09-22  1266  }
2e305393740054 Ariana Lazar 2025-09-22  1267  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
