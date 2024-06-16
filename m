Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24504171AA
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Jun 2024 16:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718556694; cv=none; b=brPc36aBBM+YuE1Pj7dU9vwB/Wj49UK2D7mODb8/dMzlxiEvmq8Cs42KxtyWejv6h1D035OIm9loXKU0rj4hYnFIh58hybJZq4xUMDLIFM1QZ62a8T6JtYvWkYUua9ioxuDFaXJYBBCADSsBl/oAcfP7XDlx2coUpWJNANOszmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718556694; c=relaxed/simple;
	bh=lcMXlZIkmH0R2iGmLM4avGRtQ5LKxXVpeWDsI2mczRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z/jDvXN7lQznhf/1dOECgYfsWG3t7ntltS6/atRpxxO4vTnssNmk31USR/h2uUTxtaFyotfXPTiNLlDPjlKXzQP8CAa7OsElErBhAayAEBa2MXOLtF67AMCcJn593asECgty3mxW5zfr550gou7I/xWQccxuwmDTI3mFPwcQSBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKdQRy3q; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKdQRy3q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718556692; x=1750092692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lcMXlZIkmH0R2iGmLM4avGRtQ5LKxXVpeWDsI2mczRE=;
  b=JKdQRy3quVuzrWmD1SG3Qi/IgOT40HVVSkVh83kGAoYADUklqnVNAmeA
   cTttbStjhF0/e99rAFdOTT0gqn2kyiyySRkFDhs0cLFvcIXjsmfQL0pmu
   z0+s6NqJAaNjFdHQe3z2PYAOIiHVNdlMyF0fCKxdLkSdp7MgGBTiesvCN
   SJm4Txp64fFc0JyGTD5ktCDhIRMRvnwybA9P+3X0/olS8aLUOUbSbiQI3
   nSLEw4j3OHjxPeW64fbyNqN/shaYClPZQAQh4CJAkP44o6fh8L5MPDzn5
   IG6kyrETe7bXBvyx3oyOWp6PW99T/hblvcs6znXSrqnNl3hV1i+Stwe6C
   g==;
X-CSE-ConnectionGUID: Nwr/RT51TnmBzurQOEndjg==
X-CSE-MsgGUID: iHOO29VfSR24vCaRPb5UUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="32931819"
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="32931819"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 09:51:29 -0700
X-CSE-ConnectionGUID: y3VZ74rXQmW2pXRsxoHeew==
X-CSE-MsgGUID: ethodnoGRQegqoXDSdpz2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="40868025"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jun 2024 09:51:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIt6D-00034w-2j;
	Sun, 16 Jun 2024 16:51:25 +0000
Date: Mon, 17 Jun 2024 00:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 2/2] power: supply: add support for MAX1720x
 standalone fuel gauge
Message-ID: <202406170040.gxB0dYxg-lkp@intel.com>
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
In-Reply-To: <20240615203352.164234-3-dima.fedrau@gmail.com>
References: <20240615203352.164234-3-dima.fedrau@gmail.com>
TO: Dimitri Fedrau <dima.fedrau@gmail.com>
CC: Dimitri Fedrau <dima.fedrau@gmail.com>
CC: Sebastian Reichel <sre@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org

Hi Dimitri,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sre-power-supply/for-next]
[also build test WARNING on linus/master v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dimitri-Fedrau/dt-bindings-power-supply-add-support-for-MAX17201-MAX17205-fuel-gauge/20240616-043602
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/20240615203352.164234-3-dima.fedrau%40gmail.com
patch subject: [PATCH v3 2/2] power: supply: add support for MAX1720x standalone fuel gauge
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: nios2-randconfig-r081-20240616 (https://download.01.org/0day-ci/archive/20240617/202406170040.gxB0dYxg-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406170040.gxB0dYxg-lkp@intel.com/

smatch warnings:
drivers/power/supply/max1720x_battery.c:285 max1720x_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +285 drivers/power/supply/max1720x_battery.c

134a669e205435 Dimitri Fedrau 2024-06-15  250  
134a669e205435 Dimitri Fedrau 2024-06-15  251  static int max1720x_probe(struct i2c_client *client)
134a669e205435 Dimitri Fedrau 2024-06-15  252  {
134a669e205435 Dimitri Fedrau 2024-06-15  253  	struct power_supply_config psy_cfg = {};
134a669e205435 Dimitri Fedrau 2024-06-15  254  	struct device *dev = &client->dev;
134a669e205435 Dimitri Fedrau 2024-06-15  255  	struct max1720x_device_info *info;
134a669e205435 Dimitri Fedrau 2024-06-15  256  	int ret;
134a669e205435 Dimitri Fedrau 2024-06-15  257  
134a669e205435 Dimitri Fedrau 2024-06-15  258  	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
134a669e205435 Dimitri Fedrau 2024-06-15  259  	if (!info)
134a669e205435 Dimitri Fedrau 2024-06-15  260  		return -ENOMEM;
134a669e205435 Dimitri Fedrau 2024-06-15  261  
134a669e205435 Dimitri Fedrau 2024-06-15  262  	i2c_set_clientdata(client, info);
134a669e205435 Dimitri Fedrau 2024-06-15  263  	info->bat_desc.name = "max1720x";
134a669e205435 Dimitri Fedrau 2024-06-15  264  	info->bat_desc.no_thermal = true;
134a669e205435 Dimitri Fedrau 2024-06-15  265  	info->bat_desc.type = POWER_SUPPLY_TYPE_BATTERY;
134a669e205435 Dimitri Fedrau 2024-06-15  266  	info->bat_desc.properties = max1720x_battery_props;
134a669e205435 Dimitri Fedrau 2024-06-15  267  	info->bat_desc.num_properties = ARRAY_SIZE(max1720x_battery_props);
134a669e205435 Dimitri Fedrau 2024-06-15  268  	info->bat_desc.get_property = max1720x_battery_get_property;
134a669e205435 Dimitri Fedrau 2024-06-15  269  	psy_cfg.drv_data = info;
134a669e205435 Dimitri Fedrau 2024-06-15  270  
134a669e205435 Dimitri Fedrau 2024-06-15  271  	info->regmap = devm_regmap_init_i2c(client, &max1720x_regmap_cfg);
134a669e205435 Dimitri Fedrau 2024-06-15  272  	if (IS_ERR(info->regmap))
134a669e205435 Dimitri Fedrau 2024-06-15  273  		return dev_err_probe(dev, PTR_ERR(info->regmap),
134a669e205435 Dimitri Fedrau 2024-06-15  274  				     "regmap initialization failed\n");
134a669e205435 Dimitri Fedrau 2024-06-15  275  
134a669e205435 Dimitri Fedrau 2024-06-15  276  	info->ancillary = i2c_new_ancillary_device(client, "nvmem", 0xb);
134a669e205435 Dimitri Fedrau 2024-06-15  277  	if (IS_ERR(info->ancillary))
134a669e205435 Dimitri Fedrau 2024-06-15  278  		return dev_err_probe(dev, PTR_ERR(info->ancillary),
134a669e205435 Dimitri Fedrau 2024-06-15  279  				     "Failed to initialize ancillary i2c device\n");
134a669e205435 Dimitri Fedrau 2024-06-15  280  
134a669e205435 Dimitri Fedrau 2024-06-15  281  	i2c_set_clientdata(info->ancillary, info);
134a669e205435 Dimitri Fedrau 2024-06-15  282  	ret = max1720x_probe_sense_resistor(info);
134a669e205435 Dimitri Fedrau 2024-06-15  283  	if (ret) {
134a669e205435 Dimitri Fedrau 2024-06-15  284  		i2c_unregister_device(info->ancillary);
134a669e205435 Dimitri Fedrau 2024-06-15 @285  		return dev_err_probe(dev, PTR_ERR(info->bat),
134a669e205435 Dimitri Fedrau 2024-06-15  286  				     "Failed to read sense resistor value\n");
134a669e205435 Dimitri Fedrau 2024-06-15  287  	}
134a669e205435 Dimitri Fedrau 2024-06-15  288  
134a669e205435 Dimitri Fedrau 2024-06-15  289  	info->bat = devm_power_supply_register(dev, &info->bat_desc, &psy_cfg);
134a669e205435 Dimitri Fedrau 2024-06-15  290  	if (IS_ERR(info->bat)) {
134a669e205435 Dimitri Fedrau 2024-06-15  291  		i2c_unregister_device(info->ancillary);
134a669e205435 Dimitri Fedrau 2024-06-15  292  		return dev_err_probe(dev, PTR_ERR(info->bat),
134a669e205435 Dimitri Fedrau 2024-06-15  293  				     "Failed to register power supply\n");
134a669e205435 Dimitri Fedrau 2024-06-15  294  	}
134a669e205435 Dimitri Fedrau 2024-06-15  295  
134a669e205435 Dimitri Fedrau 2024-06-15  296  	return 0;
134a669e205435 Dimitri Fedrau 2024-06-15  297  }
134a669e205435 Dimitri Fedrau 2024-06-15  298  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
