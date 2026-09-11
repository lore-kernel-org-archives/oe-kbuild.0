Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AB2346E5E
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116798; cv=none; b=FtyhTfo/ilO/6B8U4Mv9f/n+C8USG+KWaM6KyUnIPBQTW5W5s+vJ6Lcw/C6mWWau/Tgydly5wH9+drxB3pySGQb47MeRazvJCHoP84DEOPKi0LjP8WYJ3nskHD1DHq7EL+091fd28XstCsQUO4UrUIeKbVryIsLX1jGfbPARYTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116798; c=relaxed/simple;
	bh=UUaiEAuRpsYjIWw77KhybvMvWh2Q+7Nl9oL2iSy4clA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KMh3UXYn4T/gpJepstlKTVualB9cFOJc5XzLcUGNsL3RiCtgyTrsamTumEqtXoYn4DkKb5Mw7diC4N/PMJzRvVZgqdUddxE/P1DUMTfy6bxlwfGGQl9SJjJiL49ZoTk16mKHHt9hmGaUnBc95ph6hM8A6Cw7tEq+pL5AM6wF/aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkUO1EZ7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkUO1EZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789116797; x=1820652797;
  h=date:from:to:cc:subject:message-id;
  bh=UUaiEAuRpsYjIWw77KhybvMvWh2Q+7Nl9oL2iSy4clA=;
  b=jkUO1EZ7iXsx85NjMT0F29xFcRvAPPmamDJZNPwqxas+PWmw9uSyXN/X
   rFRYakIlYZSWEuuzigei6ILXrqc8HqM0TV4cFVMBlIM+0/xTtyuUl2tua
   aKhBzOTYS0CxFk71DOegZsugsTTK4sO16Y8aY6MacmuAijt9qWhhGRxrf
   IwCo4p/BZ96UIdKo3In/Z1jmiBNp6p1bDowpbmmMxJ7EUbAo32hKPDS1O
   le1HuNL6e8xFERzClmdPLVn6IhZ0D/Y2iv2gZ/rKOVQa3CcwliHTRRMqf
   4rgNxWKxdXBC+qY/57MSBFUqh7MuTMXCV6+1yIkmh9QFYW3CUOP/jLxUl
   g==;
X-CSE-ConnectionGUID: CxF2/JoOTkGH8uo9iKQeSQ==
X-CSE-MsgGUID: g5yZIaCSRGagW6xlIt1NfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89707874"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89707874"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 01:53:14 -0700
X-CSE-ConnectionGUID: 33njAFpYSEmXCXkyj+Y64g==
X-CSE-MsgGUID: iE0yPS1xSgCn6w2Oe/k5eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268183152"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 11 Sep 2026 01:53:13 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4x0R-000000000kv-1h7q;
	Fri, 11 Sep 2026 08:53:11 +0000
Date: Fri, 11 Sep 2026 10:52:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [soc:board-remove-7.3 182/295] drivers/hwmon/ads7828.c:121
 ads7828_probe() warn: if statement not indented
Message-ID: <202609111050.oiut4oST-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   cf983087c51a9c74c3d4d3b353eb811ae5030823
commit: 4df92b98525f08e1eab92a25f5da2045c78403e8 [182/295] hwmon: asd7828: remove pdata based probing
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm-randconfig-r071-20260911 (https://download.01.org/0day-ci/archive/20260911/202609111050.oiut4oST-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609111050.oiut4oST-lkp@intel.com/

smatch warnings:
drivers/hwmon/ads7828.c:121 ads7828_probe() warn: if statement not indented

vim +121 drivers/hwmon/ads7828.c

bea0bab0fcf5a0 Guenter Roeck            2015-01-16  100  
673afe466166cd Stephen Kitt             2020-08-21  101  static int ads7828_probe(struct i2c_client *client)
7347cb388e5aec Jean Delvare             2008-07-16  102  {
f82b2c344994f2 Axel Lin                 2014-06-17  103  	struct device *dev = &client->dev;
7347cb388e5aec Jean Delvare             2008-07-16  104  	struct ads7828_data *data;
f82b2c344994f2 Axel Lin                 2014-06-17  105  	struct device *hwmon_dev;
7f444bf0a28c03 Guenter Roeck            2015-01-16  106  	unsigned int vref_mv = ADS7828_INT_VREF_MV;
fddb5ceaf901b0 Qingshuang Fu            2026-08-05  107  	int vref_uv;
7f444bf0a28c03 Guenter Roeck            2015-01-16  108  	bool diff_input = false;
7f444bf0a28c03 Guenter Roeck            2015-01-16  109  	bool ext_vref = false;
7a18afe8097731 Akshay Bhat              2016-04-18  110  	unsigned int regval;
2d688f1413aba3 Javier Martinez Canillas 2017-02-24  111  	enum ads7828_chips chip;
5812f9283e6213 Steve Hardy              2008-01-22  112  
f82b2c344994f2 Axel Lin                 2014-06-17  113  	data = devm_kzalloc(dev, sizeof(struct ads7828_data), GFP_KERNEL);
34e3f7f5a283c5 Guenter Roeck            2012-06-02  114  	if (!data)
34e3f7f5a283c5 Guenter Roeck            2012-06-02  115  		return -ENOMEM;
5812f9283e6213 Steve Hardy              2008-01-22  116  
a8ddfea09566c3 Sam Povilus              2017-03-29  117  	diff_input = of_property_read_bool(dev->of_node,
a8ddfea09566c3 Sam Povilus              2017-03-29  118  					   "ti,differential-input");
fddb5ceaf901b0 Qingshuang Fu            2026-08-05  119  	vref_uv = devm_regulator_get_enable_read_voltage(dev, "vref");
fddb5ceaf901b0 Qingshuang Fu            2026-08-05  120  	if (vref_uv < 0) {
fddb5ceaf901b0 Qingshuang Fu            2026-08-05 @121  		if (vref_uv != -ENODEV)
fddb5ceaf901b0 Qingshuang Fu            2026-08-05  122  		return vref_uv;
fddb5ceaf901b0 Qingshuang Fu            2026-08-05  123  	} else {
a8ddfea09566c3 Sam Povilus              2017-03-29  124  		vref_mv = DIV_ROUND_CLOSEST(vref_uv, 1000);
a8ddfea09566c3 Sam Povilus              2017-03-29  125  		if (vref_mv < ADS7828_EXT_VREF_MV_MIN ||
a8ddfea09566c3 Sam Povilus              2017-03-29  126  		    vref_mv > ADS7828_EXT_VREF_MV_MAX)
a8ddfea09566c3 Sam Povilus              2017-03-29  127  			return -EINVAL;
a8ddfea09566c3 Sam Povilus              2017-03-29  128  		ext_vref = true;
a8ddfea09566c3 Sam Povilus              2017-03-29  129  	}
46d784629202c5 Vivien Didelot           2012-10-03  130  
ec6755630773bb Andrew Davis             2024-04-03  131  	chip = (uintptr_t)i2c_get_match_data(client);
2d688f1413aba3 Javier Martinez Canillas 2017-02-24  132  
7f444bf0a28c03 Guenter Roeck            2015-01-16  133  	/* Bound Vref with min/max values */
7f444bf0a28c03 Guenter Roeck            2015-01-16  134  	vref_mv = clamp_val(vref_mv, ADS7828_EXT_VREF_MV_MIN,
46d784629202c5 Vivien Didelot           2012-10-03  135  			    ADS7828_EXT_VREF_MV_MAX);
46d784629202c5 Vivien Didelot           2012-10-03  136  
0962e0f1a5634b Guillaume Roguez         2012-10-03  137  	/* ADS7828 uses 12-bit samples, while ADS7830 is 8-bit */
2d688f1413aba3 Javier Martinez Canillas 2017-02-24  138  	if (chip == ads7828) {
7f444bf0a28c03 Guenter Roeck            2015-01-16  139  		data->lsb_resol = DIV_ROUND_CLOSEST(vref_mv * 1000, 4096);
bea0bab0fcf5a0 Guenter Roeck            2015-01-16  140  		data->regmap = devm_regmap_init_i2c(client,
bea0bab0fcf5a0 Guenter Roeck            2015-01-16  141  						    &ads2828_regmap_config);
0962e0f1a5634b Guillaume Roguez         2012-10-03  142  	} else {
7f444bf0a28c03 Guenter Roeck            2015-01-16  143  		data->lsb_resol = DIV_ROUND_CLOSEST(vref_mv * 1000, 256);
bea0bab0fcf5a0 Guenter Roeck            2015-01-16  144  		data->regmap = devm_regmap_init_i2c(client,
bea0bab0fcf5a0 Guenter Roeck            2015-01-16  145  						    &ads2830_regmap_config);
0962e0f1a5634b Guillaume Roguez         2012-10-03  146  	}
46d784629202c5 Vivien Didelot           2012-10-03  147  
d9ef72cd1c15c2 Axel Lin                 2015-02-10  148  	if (IS_ERR(data->regmap))
d9ef72cd1c15c2 Axel Lin                 2015-02-10  149  		return PTR_ERR(data->regmap);
d9ef72cd1c15c2 Axel Lin                 2015-02-10  150  
7f444bf0a28c03 Guenter Roeck            2015-01-16  151  	data->cmd_byte = ext_vref ? ADS7828_CMD_PD1 : ADS7828_CMD_PD3;
7f444bf0a28c03 Guenter Roeck            2015-01-16  152  	if (!diff_input)
46d784629202c5 Vivien Didelot           2012-10-03  153  		data->cmd_byte |= ADS7828_CMD_SD_SE;
46d784629202c5 Vivien Didelot           2012-10-03  154  
7a18afe8097731 Akshay Bhat              2016-04-18  155  	/*
7a18afe8097731 Akshay Bhat              2016-04-18  156  	 * Datasheet specifies internal reference voltage is disabled by
7a18afe8097731 Akshay Bhat              2016-04-18  157  	 * default. The internal reference voltage needs to be enabled and
7a18afe8097731 Akshay Bhat              2016-04-18  158  	 * voltage needs to settle before getting valid ADC data. So perform a
7a18afe8097731 Akshay Bhat              2016-04-18  159  	 * dummy read to enable the internal reference voltage.
7a18afe8097731 Akshay Bhat              2016-04-18  160  	 */
7a18afe8097731 Akshay Bhat              2016-04-18  161  	if (!ext_vref)
7a18afe8097731 Akshay Bhat              2016-04-18  162  		regmap_read(data->regmap, data->cmd_byte, &regval);
7a18afe8097731 Akshay Bhat              2016-04-18  163  
f82b2c344994f2 Axel Lin                 2014-06-17  164  	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
f82b2c344994f2 Axel Lin                 2014-06-17  165  							   data,
f82b2c344994f2 Axel Lin                 2014-06-17  166  							   ads7828_groups);
f82b2c344994f2 Axel Lin                 2014-06-17  167  	return PTR_ERR_OR_ZERO(hwmon_dev);
5812f9283e6213 Steve Hardy              2008-01-22  168  }
5812f9283e6213 Steve Hardy              2008-01-22  169  

:::::: The code at line 121 was first introduced by commit
:::::: fddb5ceaf901b050ed2a1a7deeecbf97e003435a hwmon: (ads7828) Fix external VREF regulator handling

:::::: TO: Qingshuang Fu <fuqingshuang@kylinos.cn>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
