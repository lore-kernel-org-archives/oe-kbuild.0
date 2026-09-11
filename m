Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552FF1A3160
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137203; cv=none; b=YcfEUliQ3G4oxM7IvUxUXUKfkbG5yjieGj5h1HnmtGtq4/I0ApUUYpwupQyLR3Leh4uShDiUDHmqkgFQuU0O4Vl4q8xiQ9t4wo4WZ96VhZm7lw8uX5qKpI4XIyHo+jqkBxe2lYCnVIOE2p94mPhnZEeHkyg1ovf9lZJoXtvFEpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137203; c=relaxed/simple;
	bh=udZxGN1x2JGdyDpEHQaRYlN0lkYhd5XXGhH9IoeJv/w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ti+Imezdox13jsKHi6Em9roLw8uVtuoH4+EQBf2nJ849OgonL6Jv7Vey4rNdd1UMslH2ioC7uBndVvAmQm6KeNWiswpGfBDKDW5BwhBHFbfbftKgWdyMoaVfztxdEgWVUyh05tZDQLHoJ5HYD8px+a3JxZO+1uyvcEA7GTfbH3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ablL1X2T; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ablL1X2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789137201; x=1820673201;
  h=date:from:to:cc:subject:message-id;
  bh=udZxGN1x2JGdyDpEHQaRYlN0lkYhd5XXGhH9IoeJv/w=;
  b=ablL1X2TouOsPduq77GTdPeSQ5Hxo6Ybai3BWUsFvncBD+ISJhdoaMA0
   PZPcfhbHB4HdKLpgwZNl3cjHc/vIk+Wy1mXCKKQ78bI+vCBTJ9q+Bxwut
   0nubIK6Qh9WtKPau0ML936Yrhm4JxnKnBeLV/iZ7NUpBNcgBun3+itXsl
   yGN3BmZ59+HR0ibj4fB4pIyHXi1SLFAhOr+ZLxZ97+fegiSJCp4my33wa
   +iJyrCEhvKKC4v2On10tCgROYVPPuWgRt19WUYWy96b3vgFIObZgr76sz
   iZUxQY9SVK2zUpJirSXuVFiNU1ZcfRrqA5GjjgmFoSZAu28TIhY6gmig9
   Q==;
X-CSE-ConnectionGUID: U/tt6BQ9R4+81E0n4K5LMQ==
X-CSE-MsgGUID: dxwqstzpQk6LrjdO95jZcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="112372107"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="112372107"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 07:33:20 -0700
X-CSE-ConnectionGUID: AxYKCfU7SNuLxe8ZBxQc5w==
X-CSE-MsgGUID: VU382r87QvSwNONyEH5aUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="270175096"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 11 Sep 2026 07:33:20 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x52JZ-000000000oh-30i3;
	Fri, 11 Sep 2026 14:33:17 +0000
Date: Fri, 11 Sep 2026 16:33:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [soc:board-remove-7.3 182/295] drivers/hwmon/ads7828.c:121
 ads7828_probe() warn: if statement not indented
Message-ID: <202609111655.f1cmAYar-lkp@intel.com>
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
:::::: branch date: 20 hours ago
:::::: commit date: 21 hours ago
config: arm-randconfig-r071-20260911 (https://download.01.org/0day-ci/archive/20260911/202609111655.f1cmAYar-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609111655.f1cmAYar-lkp@intel.com/

smatch warnings:
drivers/hwmon/ads7828.c:121 ads7828_probe() warn: if statement not indented

vim +121 drivers/hwmon/ads7828.c

bea0bab0fcf5a0b Guenter Roeck            2015-01-16  100  
673afe466166cda Stephen Kitt             2020-08-21  101  static int ads7828_probe(struct i2c_client *client)
7347cb388e5aecf Jean Delvare             2008-07-16  102  {
f82b2c344994f23 Axel Lin                 2014-06-17  103  	struct device *dev = &client->dev;
7347cb388e5aecf Jean Delvare             2008-07-16  104  	struct ads7828_data *data;
f82b2c344994f23 Axel Lin                 2014-06-17  105  	struct device *hwmon_dev;
7f444bf0a28c030 Guenter Roeck            2015-01-16  106  	unsigned int vref_mv = ADS7828_INT_VREF_MV;
fddb5ceaf901b05 Qingshuang Fu            2026-08-05  107  	int vref_uv;
7f444bf0a28c030 Guenter Roeck            2015-01-16  108  	bool diff_input = false;
7f444bf0a28c030 Guenter Roeck            2015-01-16  109  	bool ext_vref = false;
7a18afe8097731b Akshay Bhat              2016-04-18  110  	unsigned int regval;
2d688f1413aba35 Javier Martinez Canillas 2017-02-24  111  	enum ads7828_chips chip;
5812f9283e62137 Steve Hardy              2008-01-22  112  
f82b2c344994f23 Axel Lin                 2014-06-17  113  	data = devm_kzalloc(dev, sizeof(struct ads7828_data), GFP_KERNEL);
34e3f7f5a283c55 Guenter Roeck            2012-06-02  114  	if (!data)
34e3f7f5a283c55 Guenter Roeck            2012-06-02  115  		return -ENOMEM;
5812f9283e62137 Steve Hardy              2008-01-22  116  
a8ddfea09566c37 Sam Povilus              2017-03-29  117  	diff_input = of_property_read_bool(dev->of_node,
a8ddfea09566c37 Sam Povilus              2017-03-29  118  					   "ti,differential-input");
fddb5ceaf901b05 Qingshuang Fu            2026-08-05  119  	vref_uv = devm_regulator_get_enable_read_voltage(dev, "vref");
fddb5ceaf901b05 Qingshuang Fu            2026-08-05  120  	if (vref_uv < 0) {
fddb5ceaf901b05 Qingshuang Fu            2026-08-05 @121  		if (vref_uv != -ENODEV)
fddb5ceaf901b05 Qingshuang Fu            2026-08-05  122  		return vref_uv;
fddb5ceaf901b05 Qingshuang Fu            2026-08-05  123  	} else {
a8ddfea09566c37 Sam Povilus              2017-03-29  124  		vref_mv = DIV_ROUND_CLOSEST(vref_uv, 1000);
a8ddfea09566c37 Sam Povilus              2017-03-29  125  		if (vref_mv < ADS7828_EXT_VREF_MV_MIN ||
a8ddfea09566c37 Sam Povilus              2017-03-29  126  		    vref_mv > ADS7828_EXT_VREF_MV_MAX)
a8ddfea09566c37 Sam Povilus              2017-03-29  127  			return -EINVAL;
a8ddfea09566c37 Sam Povilus              2017-03-29  128  		ext_vref = true;
a8ddfea09566c37 Sam Povilus              2017-03-29  129  	}
46d784629202c5d Vivien Didelot           2012-10-03  130  
ec6755630773bbf Andrew Davis             2024-04-03  131  	chip = (uintptr_t)i2c_get_match_data(client);
2d688f1413aba35 Javier Martinez Canillas 2017-02-24  132  
7f444bf0a28c030 Guenter Roeck            2015-01-16  133  	/* Bound Vref with min/max values */
7f444bf0a28c030 Guenter Roeck            2015-01-16  134  	vref_mv = clamp_val(vref_mv, ADS7828_EXT_VREF_MV_MIN,
46d784629202c5d Vivien Didelot           2012-10-03  135  			    ADS7828_EXT_VREF_MV_MAX);
46d784629202c5d Vivien Didelot           2012-10-03  136  
0962e0f1a5634b6 Guillaume Roguez         2012-10-03  137  	/* ADS7828 uses 12-bit samples, while ADS7830 is 8-bit */
2d688f1413aba35 Javier Martinez Canillas 2017-02-24  138  	if (chip == ads7828) {
7f444bf0a28c030 Guenter Roeck            2015-01-16  139  		data->lsb_resol = DIV_ROUND_CLOSEST(vref_mv * 1000, 4096);
bea0bab0fcf5a0b Guenter Roeck            2015-01-16  140  		data->regmap = devm_regmap_init_i2c(client,
bea0bab0fcf5a0b Guenter Roeck            2015-01-16  141  						    &ads2828_regmap_config);
0962e0f1a5634b6 Guillaume Roguez         2012-10-03  142  	} else {
7f444bf0a28c030 Guenter Roeck            2015-01-16  143  		data->lsb_resol = DIV_ROUND_CLOSEST(vref_mv * 1000, 256);
bea0bab0fcf5a0b Guenter Roeck            2015-01-16  144  		data->regmap = devm_regmap_init_i2c(client,
bea0bab0fcf5a0b Guenter Roeck            2015-01-16  145  						    &ads2830_regmap_config);
0962e0f1a5634b6 Guillaume Roguez         2012-10-03  146  	}
46d784629202c5d Vivien Didelot           2012-10-03  147  
d9ef72cd1c15c2f Axel Lin                 2015-02-10  148  	if (IS_ERR(data->regmap))
d9ef72cd1c15c2f Axel Lin                 2015-02-10  149  		return PTR_ERR(data->regmap);
d9ef72cd1c15c2f Axel Lin                 2015-02-10  150  
7f444bf0a28c030 Guenter Roeck            2015-01-16  151  	data->cmd_byte = ext_vref ? ADS7828_CMD_PD1 : ADS7828_CMD_PD3;
7f444bf0a28c030 Guenter Roeck            2015-01-16  152  	if (!diff_input)
46d784629202c5d Vivien Didelot           2012-10-03  153  		data->cmd_byte |= ADS7828_CMD_SD_SE;
46d784629202c5d Vivien Didelot           2012-10-03  154  
7a18afe8097731b Akshay Bhat              2016-04-18  155  	/*
7a18afe8097731b Akshay Bhat              2016-04-18  156  	 * Datasheet specifies internal reference voltage is disabled by
7a18afe8097731b Akshay Bhat              2016-04-18  157  	 * default. The internal reference voltage needs to be enabled and
7a18afe8097731b Akshay Bhat              2016-04-18  158  	 * voltage needs to settle before getting valid ADC data. So perform a
7a18afe8097731b Akshay Bhat              2016-04-18  159  	 * dummy read to enable the internal reference voltage.
7a18afe8097731b Akshay Bhat              2016-04-18  160  	 */
7a18afe8097731b Akshay Bhat              2016-04-18  161  	if (!ext_vref)
7a18afe8097731b Akshay Bhat              2016-04-18  162  		regmap_read(data->regmap, data->cmd_byte, &regval);
7a18afe8097731b Akshay Bhat              2016-04-18  163  
f82b2c344994f23 Axel Lin                 2014-06-17  164  	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
f82b2c344994f23 Axel Lin                 2014-06-17  165  							   data,
f82b2c344994f23 Axel Lin                 2014-06-17  166  							   ads7828_groups);
f82b2c344994f23 Axel Lin                 2014-06-17  167  	return PTR_ERR_OR_ZERO(hwmon_dev);
5812f9283e62137 Steve Hardy              2008-01-22  168  }
5812f9283e62137 Steve Hardy              2008-01-22  169  

:::::: The code at line 121 was first introduced by commit
:::::: fddb5ceaf901b050ed2a1a7deeecbf97e003435a hwmon: (ads7828) Fix external VREF regulator handling

:::::: TO: Qingshuang Fu <fuqingshuang@kylinos.cn>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
