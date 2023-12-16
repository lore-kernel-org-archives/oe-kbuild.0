Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859FF36B1C
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Dec 2023 23:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJ2hAwX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702768807; x=1734304807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f5HurEXm5DTHdkYb1S5DSy/+5sSJRMCHfvKJHj4T/1k=;
  b=KJ2hAwX7Xt3gSHxTJdksyjG17xOs0GKT9K8rqMY1uo2OsIqr2SJQTEs/
   SyuqiqmIgMHIXM7faK1a1cFhZ81aPMC64VYCwi46fucdHGdp70vt9MYAU
   Fj++pP97OcRq23aMBM1mPf9lxoWYHeaiYO8P6SZ7l6Qpd71IwbYkFCPPX
   lwGqS4cRt7naHPHhjBz5JynqytCHJZZSslKvFDRj9LWeHXiemtwDzCczR
   zeel8Ry52YbFh3X8fPoPEgWhapMwgRbqUr5OrY82lRhIoCWscBLPqMuw7
   SjwJMxc4c3rKq3FgnPcKohehuFeu01LjDWXjqQDj1hgu3oAn98FyGVOw3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="16949201"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="16949201"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 15:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="893342486"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="893342486"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Dec 2023 15:20:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEdwv-0002KY-1S;
	Sat, 16 Dec 2023 23:20:01 +0000
Date: Sun, 17 Dec 2023 07:19:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/regulator/slg51000-regulator.c:492:8-33: WARNING: Threaded
 IRQ with no primary handler requested without IRQF_ONESHOT (unless it is
 nested IRQ)
Message-ID: <202312170721.dac4cHmI-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Eric Jeong <eric.jeong.opensource@diasemi.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b8a9b2e6809d281890dd0a1102dc14d2cd11caf
commit: a867bde3dd037ea5e9f1c5268d22d4bc4fa399b9 regulator: slg51000: add slg51000 regulator driver
date:   4 years, 7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 years, 7 months ago
config: i386-randconfig-053-20231216 (https://download.01.org/0day-ci/archive/20231217/202312170721.dac4cHmI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312170721.dac4cHmI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/regulator/slg51000-regulator.c:492:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +492 drivers/regulator/slg51000-regulator.c

a867bde3dd037e Eric Jeong 2019-04-18  449  
a867bde3dd037e Eric Jeong 2019-04-18  450  static int slg51000_i2c_probe(struct i2c_client *client,
a867bde3dd037e Eric Jeong 2019-04-18  451  			      const struct i2c_device_id *id)
a867bde3dd037e Eric Jeong 2019-04-18  452  {
a867bde3dd037e Eric Jeong 2019-04-18  453  	struct device *dev = &client->dev;
a867bde3dd037e Eric Jeong 2019-04-18  454  	struct slg51000 *chip;
a867bde3dd037e Eric Jeong 2019-04-18  455  	struct gpio_desc *cs_gpiod = NULL;
a867bde3dd037e Eric Jeong 2019-04-18  456  	int error, ret;
a867bde3dd037e Eric Jeong 2019-04-18  457  
a867bde3dd037e Eric Jeong 2019-04-18  458  	chip = devm_kzalloc(dev, sizeof(struct slg51000), GFP_KERNEL);
a867bde3dd037e Eric Jeong 2019-04-18  459  	if (!chip)
a867bde3dd037e Eric Jeong 2019-04-18  460  		return -ENOMEM;
a867bde3dd037e Eric Jeong 2019-04-18  461  
a867bde3dd037e Eric Jeong 2019-04-18  462  	cs_gpiod = devm_gpiod_get_from_of_node(dev, dev->of_node,
a867bde3dd037e Eric Jeong 2019-04-18  463  					       "dlg,cs-gpios", 0,
a867bde3dd037e Eric Jeong 2019-04-18  464  					       GPIOD_OUT_HIGH
a867bde3dd037e Eric Jeong 2019-04-18  465  					       | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
a867bde3dd037e Eric Jeong 2019-04-18  466  					       "slg51000-cs");
a867bde3dd037e Eric Jeong 2019-04-18  467  	if (cs_gpiod) {
a867bde3dd037e Eric Jeong 2019-04-18  468  		dev_info(dev, "Found chip selector property\n");
a867bde3dd037e Eric Jeong 2019-04-18  469  		chip->cs_gpiod = cs_gpiod;
a867bde3dd037e Eric Jeong 2019-04-18  470  	}
a867bde3dd037e Eric Jeong 2019-04-18  471  
a867bde3dd037e Eric Jeong 2019-04-18  472  	i2c_set_clientdata(client, chip);
a867bde3dd037e Eric Jeong 2019-04-18  473  	chip->chip_irq = client->irq;
a867bde3dd037e Eric Jeong 2019-04-18  474  	chip->dev = dev;
a867bde3dd037e Eric Jeong 2019-04-18  475  	chip->regmap = devm_regmap_init_i2c(client, &slg51000_regmap_config);
a867bde3dd037e Eric Jeong 2019-04-18  476  	if (IS_ERR(chip->regmap)) {
a867bde3dd037e Eric Jeong 2019-04-18  477  		error = PTR_ERR(chip->regmap);
a867bde3dd037e Eric Jeong 2019-04-18  478  		dev_err(dev, "Failed to allocate register map: %d\n",
a867bde3dd037e Eric Jeong 2019-04-18  479  			error);
a867bde3dd037e Eric Jeong 2019-04-18  480  		return error;
a867bde3dd037e Eric Jeong 2019-04-18  481  	}
a867bde3dd037e Eric Jeong 2019-04-18  482  
a867bde3dd037e Eric Jeong 2019-04-18  483  	ret = slg51000_regulator_init(chip);
a867bde3dd037e Eric Jeong 2019-04-18  484  	if (ret < 0) {
a867bde3dd037e Eric Jeong 2019-04-18  485  		dev_err(chip->dev, "Failed to init regulator(%d)\n", ret);
a867bde3dd037e Eric Jeong 2019-04-18  486  		return ret;
a867bde3dd037e Eric Jeong 2019-04-18  487  	}
a867bde3dd037e Eric Jeong 2019-04-18  488  
a867bde3dd037e Eric Jeong 2019-04-18  489  	slg51000_clear_fault_log(chip);
a867bde3dd037e Eric Jeong 2019-04-18  490  
a867bde3dd037e Eric Jeong 2019-04-18  491  	if (chip->chip_irq) {
a867bde3dd037e Eric Jeong 2019-04-18 @492  		ret = devm_request_threaded_irq(dev, chip->chip_irq, NULL,
a867bde3dd037e Eric Jeong 2019-04-18  493  						slg51000_irq_handler,
a867bde3dd037e Eric Jeong 2019-04-18  494  						(IRQF_TRIGGER_HIGH |
a867bde3dd037e Eric Jeong 2019-04-18  495  						IRQF_ONESHOT),
a867bde3dd037e Eric Jeong 2019-04-18  496  						"slg51000-irq", chip);
a867bde3dd037e Eric Jeong 2019-04-18  497  		if (ret != 0) {
a867bde3dd037e Eric Jeong 2019-04-18  498  			dev_err(dev, "Failed to request IRQ: %d\n",
a867bde3dd037e Eric Jeong 2019-04-18  499  				chip->chip_irq);
a867bde3dd037e Eric Jeong 2019-04-18  500  			return ret;
a867bde3dd037e Eric Jeong 2019-04-18  501  		}
a867bde3dd037e Eric Jeong 2019-04-18  502  	} else {
a867bde3dd037e Eric Jeong 2019-04-18  503  		dev_info(dev, "No IRQ configured\n");
a867bde3dd037e Eric Jeong 2019-04-18  504  	}
a867bde3dd037e Eric Jeong 2019-04-18  505  
a867bde3dd037e Eric Jeong 2019-04-18  506  	return ret;
a867bde3dd037e Eric Jeong 2019-04-18  507  }
a867bde3dd037e Eric Jeong 2019-04-18  508  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
