Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6023C19F11E
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 02:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750213548; cv=none; b=lry/j2l73pzsaaZl+xEfghYpXUPOOmPAx3nOIoXTV5P/MUHKG7dUb2KBjG8gfAxrXpp2uGNFWMa55OiMf5Q6UvcOhX9DldwWkUZBqB4xuRbmTJUf7nHHvXsLTVZUkKgy+oIGT0VGcCn5YPL59VLxIy6uRf1iqwtkiFQOVTa4pi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750213548; c=relaxed/simple;
	bh=p844wZf0W5U2YHKHxtQtrRez18Qgo6SeMX4xOD9mfJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M4dIMI6iBtNwEJde6RkupngG1X6RCQ7G9Vz7+P2uifQ/6ahflzAzTU6c9HOCmgeFKw0rbCnUV8yRqqi4Reni7gnma74lNjk+cTGzQCLb3zomYkdEJ6skFv3kbt3qaGNSwblDhLoMfVAAaEuOkSGkbun6UJF3OT7ajHG8yHyErgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DIdaLW6x; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIdaLW6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750213547; x=1781749547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p844wZf0W5U2YHKHxtQtrRez18Qgo6SeMX4xOD9mfJc=;
  b=DIdaLW6xlHVbht+UMLwPT6E1UfIAXo7hQJ5oZQKA7aeuAg0qUnaMp1eD
   e1nX0oxoc0emA+LUe2AaQnUgL24vhi5PjWQrDDhAfneAuCRfogbUGP9Pf
   gra5VnG5iPm6a1iYrolXjcxsED3ZUi83mrkpS9ta9iIEbZ00A52YSfbI/
   59PYnjfJbRkMXsIHvu2bjNQroo/XAJnifQyALDA3ZQuqXRwj05Qmj3HKE
   dM5eG9rRhyJ2v4txjfbXISB46BCRWZwpCTFE6jrU1WM6J0dsu0qw5OkIc
   sBYFTyCoxcDphlJxEc90/bEda7+KQttZN8S0ouZCR2MD4revyLEdK8EDj
   Q==;
X-CSE-ConnectionGUID: xFB4SlKyTqyI1FSlRQ0QQg==
X-CSE-MsgGUID: +I/0Af8jT9+4pbWJa+RB+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52278926"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52278926"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 19:25:46 -0700
X-CSE-ConnectionGUID: 5nrPjx2sQ9+5Bc3tmut+Dw==
X-CSE-MsgGUID: 5fy2FfjlR+qzJHzupmulhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="153785872"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jun 2025 19:25:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRiUf-000JJm-2h;
	Wed, 18 Jun 2025 02:25:41 +0000
Date: Wed, 18 Jun 2025 10:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2816/3035] drivers/hwmon/emc2305.c:591:4-15:
 ERROR: probable double put.
Message-ID: <202506181045.W3TDhAnE-lkp@intel.com>
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
TO: Florin Leotescu <florin.leotescu@nxp.com>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4325743c7e209ae7845293679a4de94b969f2bef
commit: ab9753e393eea5e2de98d5704f0bad4be9a73f28 [2816/3035] hwmon: emc2305: Enable PWM polarity and output configuration
:::::: branch date: 20 hours ago
:::::: commit date: 28 hours ago
config: hexagon-randconfig-r051-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181045.W3TDhAnE-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506181045.W3TDhAnE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hwmon/emc2305.c:591:4-15: ERROR: probable double put.
--
>> drivers/hwmon/emc2305.c:680:3-25: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 683.

vim +591 drivers/hwmon/emc2305.c

b2d387a4ef1300 Florin Leotescu 2025-06-03  577  
b2d387a4ef1300 Florin Leotescu 2025-06-03  578  static int emc2305_probe_childs_from_dt(struct device *dev)
b2d387a4ef1300 Florin Leotescu 2025-06-03  579  {
b2d387a4ef1300 Florin Leotescu 2025-06-03  580  	struct emc2305_data *data = dev_get_drvdata(dev);
b2d387a4ef1300 Florin Leotescu 2025-06-03  581  	struct device_node *child;
b2d387a4ef1300 Florin Leotescu 2025-06-03  582  	int ret, count = 0;
b2d387a4ef1300 Florin Leotescu 2025-06-03  583  
b2d387a4ef1300 Florin Leotescu 2025-06-03  584  	data->pwm_output_mask = 0x0;
b2d387a4ef1300 Florin Leotescu 2025-06-03  585  	data->pwm_polarity_mask = 0x0;
b2d387a4ef1300 Florin Leotescu 2025-06-03  586  
b2d387a4ef1300 Florin Leotescu 2025-06-03  587  	for_each_child_of_node(dev->of_node, child) {
b2d387a4ef1300 Florin Leotescu 2025-06-03  588  		if (of_property_present(child, "reg")) {
b2d387a4ef1300 Florin Leotescu 2025-06-03  589  			ret = emc2305_of_parse_pwm_child(dev, child, data);
b2d387a4ef1300 Florin Leotescu 2025-06-03  590  			if (ret) {
b2d387a4ef1300 Florin Leotescu 2025-06-03 @591  				of_node_put(child);
b2d387a4ef1300 Florin Leotescu 2025-06-03  592  				continue;
b2d387a4ef1300 Florin Leotescu 2025-06-03  593  			}
b2d387a4ef1300 Florin Leotescu 2025-06-03  594  			count++;
b2d387a4ef1300 Florin Leotescu 2025-06-03  595  		}
b2d387a4ef1300 Florin Leotescu 2025-06-03  596  	}
b2d387a4ef1300 Florin Leotescu 2025-06-03  597  	return count;
b2d387a4ef1300 Florin Leotescu 2025-06-03  598  }
b2d387a4ef1300 Florin Leotescu 2025-06-03  599  
deeab9ea40dbaa Stephen Kitt    2022-10-11  600  static int emc2305_probe(struct i2c_client *client)
0d8400c5a2ce15 Michael Shych   2022-08-10  601  {
0d8400c5a2ce15 Michael Shych   2022-08-10  602  	struct i2c_adapter *adapter = client->adapter;
0d8400c5a2ce15 Michael Shych   2022-08-10  603  	struct device *dev = &client->dev;
b2d387a4ef1300 Florin Leotescu 2025-06-03  604  	struct device_node *child;
0d8400c5a2ce15 Michael Shych   2022-08-10  605  	struct emc2305_data *data;
0d8400c5a2ce15 Michael Shych   2022-08-10  606  	struct emc2305_platform_data *pdata;
4d50591ebf60cc Xingjiang Qiao  2022-12-06  607  	int vendor;
0d8400c5a2ce15 Michael Shych   2022-08-10  608  	int ret;
0d8400c5a2ce15 Michael Shych   2022-08-10  609  	int i;
b2d387a4ef1300 Florin Leotescu 2025-06-03  610  	int pwm_childs;
0d8400c5a2ce15 Michael Shych   2022-08-10  611  
0d8400c5a2ce15 Michael Shych   2022-08-10  612  	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
0d8400c5a2ce15 Michael Shych   2022-08-10  613  		return -ENODEV;
0d8400c5a2ce15 Michael Shych   2022-08-10  614  
0d8400c5a2ce15 Michael Shych   2022-08-10  615  	vendor = i2c_smbus_read_byte_data(client, EMC2305_REG_VENDOR);
0d8400c5a2ce15 Michael Shych   2022-08-10  616  	if (vendor != EMC2305_VENDOR)
0d8400c5a2ce15 Michael Shych   2022-08-10  617  		return -ENODEV;
0d8400c5a2ce15 Michael Shych   2022-08-10  618  
0d8400c5a2ce15 Michael Shych   2022-08-10  619  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
0d8400c5a2ce15 Michael Shych   2022-08-10  620  	if (!data)
0d8400c5a2ce15 Michael Shych   2022-08-10  621  		return -ENOMEM;
0d8400c5a2ce15 Michael Shych   2022-08-10  622  
0d8400c5a2ce15 Michael Shych   2022-08-10  623  	i2c_set_clientdata(client, data);
0d8400c5a2ce15 Michael Shych   2022-08-10  624  	data->client = client;
0d8400c5a2ce15 Michael Shych   2022-08-10  625  
0d8400c5a2ce15 Michael Shych   2022-08-10  626  	ret = emc2305_identify(dev);
0d8400c5a2ce15 Michael Shych   2022-08-10  627  	if (ret)
0d8400c5a2ce15 Michael Shych   2022-08-10  628  		return ret;
0d8400c5a2ce15 Michael Shych   2022-08-10  629  
b2d387a4ef1300 Florin Leotescu 2025-06-03  630  	pwm_childs = emc2305_probe_childs_from_dt(dev);
b2d387a4ef1300 Florin Leotescu 2025-06-03  631  
0d8400c5a2ce15 Michael Shych   2022-08-10  632  	pdata = dev_get_platdata(&client->dev);
b2d387a4ef1300 Florin Leotescu 2025-06-03  633  
b2d387a4ef1300 Florin Leotescu 2025-06-03  634  	if (!pwm_childs) {
0d8400c5a2ce15 Michael Shych   2022-08-10  635  		if (pdata) {
0d8400c5a2ce15 Michael Shych   2022-08-10  636  			if (!pdata->max_state || pdata->max_state > EMC2305_FAN_MAX_STATE)
0d8400c5a2ce15 Michael Shych   2022-08-10  637  				return -EINVAL;
0d8400c5a2ce15 Michael Shych   2022-08-10  638  			data->max_state = pdata->max_state;
0d8400c5a2ce15 Michael Shych   2022-08-10  639  			/*
0d8400c5a2ce15 Michael Shych   2022-08-10  640  			 * Validate a number of active PWM channels. Note that
0d8400c5a2ce15 Michael Shych   2022-08-10  641  			 * configured number can be less than the actual maximum
0d8400c5a2ce15 Michael Shych   2022-08-10  642  			 * supported by the device.
0d8400c5a2ce15 Michael Shych   2022-08-10  643  			 */
0d8400c5a2ce15 Michael Shych   2022-08-10  644  			if (!pdata->pwm_num || pdata->pwm_num > EMC2305_PWM_MAX)
0d8400c5a2ce15 Michael Shych   2022-08-10  645  				return -EINVAL;
0d8400c5a2ce15 Michael Shych   2022-08-10  646  			data->pwm_num = pdata->pwm_num;
b2d387a4ef1300 Florin Leotescu 2025-06-03  647  			data->pwm_output_mask = pdata->pwm_output_mask;
b2d387a4ef1300 Florin Leotescu 2025-06-03  648  			data->pwm_polarity_mask = pdata->pwm_polarity_mask;
0d8400c5a2ce15 Michael Shych   2022-08-10  649  			data->pwm_separate = pdata->pwm_separate;
b2d387a4ef1300 Florin Leotescu 2025-06-03  650  			for (i = 0; i < EMC2305_PWM_MAX; i++) {
0d8400c5a2ce15 Michael Shych   2022-08-10  651  				data->pwm_min[i] = pdata->pwm_min[i];
b2d387a4ef1300 Florin Leotescu 2025-06-03  652  				data->pwm_freq[i] = pdata->pwm_freq[i];
b2d387a4ef1300 Florin Leotescu 2025-06-03  653  			}
b2d387a4ef1300 Florin Leotescu 2025-06-03  654  		} else {
b2d387a4ef1300 Florin Leotescu 2025-06-03  655  			data->max_state = EMC2305_FAN_MAX_STATE;
b2d387a4ef1300 Florin Leotescu 2025-06-03  656  			data->pwm_separate = false;
b2d387a4ef1300 Florin Leotescu 2025-06-03  657  			data->pwm_output_mask = EMC2305_DEFAULT_OUTPUT;
b2d387a4ef1300 Florin Leotescu 2025-06-03  658  			data->pwm_polarity_mask = EMC2305_DEFAULT_POLARITY;
b2d387a4ef1300 Florin Leotescu 2025-06-03  659  			for (i = 0; i < EMC2305_PWM_MAX; i++) {
b2d387a4ef1300 Florin Leotescu 2025-06-03  660  				data->pwm_min[i] = EMC2305_FAN_MIN;
b2d387a4ef1300 Florin Leotescu 2025-06-03  661  				data->pwm_freq[i] = base_freq_table[3];
b2d387a4ef1300 Florin Leotescu 2025-06-03  662  			}
b2d387a4ef1300 Florin Leotescu 2025-06-03  663  		}
0d8400c5a2ce15 Michael Shych   2022-08-10  664  	} else {
0d8400c5a2ce15 Michael Shych   2022-08-10  665  		data->max_state = EMC2305_FAN_MAX_STATE;
0d8400c5a2ce15 Michael Shych   2022-08-10  666  		data->pwm_separate = false;
0d8400c5a2ce15 Michael Shych   2022-08-10  667  		for (i = 0; i < EMC2305_PWM_MAX; i++)
0d8400c5a2ce15 Michael Shych   2022-08-10  668  			data->pwm_min[i] = EMC2305_FAN_MIN;
0d8400c5a2ce15 Michael Shych   2022-08-10  669  	}
0d8400c5a2ce15 Michael Shych   2022-08-10  670  
0d8400c5a2ce15 Michael Shych   2022-08-10  671  	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, "emc2305", data,
0d8400c5a2ce15 Michael Shych   2022-08-10  672  							       &emc2305_chip_info, NULL);
0d8400c5a2ce15 Michael Shych   2022-08-10  673  	if (IS_ERR(data->hwmon_dev))
0d8400c5a2ce15 Michael Shych   2022-08-10  674  		return PTR_ERR(data->hwmon_dev);
0d8400c5a2ce15 Michael Shych   2022-08-10  675  
0d8400c5a2ce15 Michael Shych   2022-08-10  676  	if (IS_REACHABLE(CONFIG_THERMAL)) {
b2d387a4ef1300 Florin Leotescu 2025-06-03  677  		/* Parse and check for the available PWM child nodes */
b2d387a4ef1300 Florin Leotescu 2025-06-03  678  		if (pwm_childs > 0) {
b2d387a4ef1300 Florin Leotescu 2025-06-03  679  			i = 0;
b2d387a4ef1300 Florin Leotescu 2025-06-03 @680  			for_each_child_of_node(dev->of_node, child) {
b2d387a4ef1300 Florin Leotescu 2025-06-03  681  				ret = emc2305_set_single_tz(dev, child, i);
b2d387a4ef1300 Florin Leotescu 2025-06-03  682  				if (ret != 0)
b2d387a4ef1300 Florin Leotescu 2025-06-03 @683  					return ret;
b2d387a4ef1300 Florin Leotescu 2025-06-03  684  				i++;
b2d387a4ef1300 Florin Leotescu 2025-06-03  685  			}
b2d387a4ef1300 Florin Leotescu 2025-06-03  686  		} else {
0d8400c5a2ce15 Michael Shych   2022-08-10  687  			ret = emc2305_set_tz(dev);
0d8400c5a2ce15 Michael Shych   2022-08-10  688  			if (ret != 0)
0d8400c5a2ce15 Michael Shych   2022-08-10  689  				return ret;
0d8400c5a2ce15 Michael Shych   2022-08-10  690  		}
b2d387a4ef1300 Florin Leotescu 2025-06-03  691  	}
0d8400c5a2ce15 Michael Shych   2022-08-10  692  
ab9753e393eea5 Florin Leotescu 2025-06-03  693  	ret = i2c_smbus_write_byte_data(client, EMC2305_REG_DRIVE_PWM_OUT,
ab9753e393eea5 Florin Leotescu 2025-06-03  694  					data->pwm_output_mask);
ab9753e393eea5 Florin Leotescu 2025-06-03  695  	if (ret < 0)
ab9753e393eea5 Florin Leotescu 2025-06-03  696  		dev_err(dev, "Failed to configure pwm output, using default\n");
ab9753e393eea5 Florin Leotescu 2025-06-03  697  
ab9753e393eea5 Florin Leotescu 2025-06-03  698  	ret = i2c_smbus_write_byte_data(client, EMC2305_REG_POLARITY,
ab9753e393eea5 Florin Leotescu 2025-06-03  699  					data->pwm_polarity_mask);
ab9753e393eea5 Florin Leotescu 2025-06-03  700  	if (ret < 0)
ab9753e393eea5 Florin Leotescu 2025-06-03  701  		dev_err(dev, "Failed to configure pwm polarity, using default\n");
ab9753e393eea5 Florin Leotescu 2025-06-03  702  
0d8400c5a2ce15 Michael Shych   2022-08-10  703  	for (i = 0; i < data->pwm_num; i++) {
0d8400c5a2ce15 Michael Shych   2022-08-10  704  		ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_MIN_DRIVE(i),
0d8400c5a2ce15 Michael Shych   2022-08-10  705  						data->pwm_min[i]);
0d8400c5a2ce15 Michael Shych   2022-08-10  706  		if (ret < 0)
0d8400c5a2ce15 Michael Shych   2022-08-10  707  			return ret;
0d8400c5a2ce15 Michael Shych   2022-08-10  708  	}
0d8400c5a2ce15 Michael Shych   2022-08-10  709  
0d8400c5a2ce15 Michael Shych   2022-08-10  710  	return 0;
0d8400c5a2ce15 Michael Shych   2022-08-10  711  }
0d8400c5a2ce15 Michael Shych   2022-08-10  712  

:::::: The code at line 591 was first introduced by commit
:::::: b2d387a4ef130067faa396e6090baa3dfe113228 hwmon: emc2305: Configure PWM channels based on DT properties

:::::: TO: Florin Leotescu <florin.leotescu@nxp.com>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
