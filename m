Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD10A3B
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Sep 2023 00:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695082519; x=1726618519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EG9MouyXcXbWWF2Vk8YRU8Ir7i2QTMf6x8JMnMD/Pp0=;
  b=RMwCOTuLJiLNMfHKVa5k0ory9rD6Ea9pw15sjq3fQ3NaHARKUZvQgHD+
   IQRQSkO/rWGU7RwU6zJpG4EajJYcpwJP6U47r9ZwvDbUWlTpKwj12FUPV
   Hr5scLU+oXTNF7pfNtn1ZAQgfUw453swPlhyaFwl6Ry5yPyk1Mz5grEFO
   Dz04kAxnDsZ94jWLTE9WvdcRYZ8J9q3w3u8y6KKtuv0ImSwDozSSaKbcf
   1xu7KrE9vmSs0YTwpnjQtP4H/3iO2x2rOBAw7k890xT8VtGcS3HhJDZeb
   EWI1+IG1sND3oiFfvzDniGSKr13M30YJuM3tqkdtVgLmqHkHON3v1vimU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="378710790"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="378710790"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 17:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="869766740"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="869766740"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Sep 2023 17:15:14 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiOOW-0006fM-0y;
	Tue, 19 Sep 2023 00:15:12 +0000
Date: Tue, 19 Sep 2023 08:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sre-power-supply:for-next 27/68] drivers/power/supply/mm8013.c:236
 mm8013_probe() warn: passing zero to 'dev_err_probe'
Message-ID: <202309190838.eu8WS6sz-lkp@intel.com>
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
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
head:   a6c6a5fe2a08172c2e045588531f0e05a6c296cf
commit: c75f4bf6800bde67df22ac95139279ec8764118a [27/68] power: supply: Introduce MM8013 fuel gauge driver
:::::: branch date: 87 minutes ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20230918 (https://download.01.org/0day-ci/archive/20230919/202309190838.eu8WS6sz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230919/202309190838.eu8WS6sz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309190838.eu8WS6sz-lkp@intel.com/

smatch warnings:
drivers/power/supply/mm8013.c:236 mm8013_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +236 drivers/power/supply/mm8013.c

c75f4bf6800bde Konrad Dybcio 2023-09-15  215  
c75f4bf6800bde Konrad Dybcio 2023-09-15  216  static int mm8013_probe(struct i2c_client *client)
c75f4bf6800bde Konrad Dybcio 2023-09-15  217  {
c75f4bf6800bde Konrad Dybcio 2023-09-15  218  	struct power_supply_config psy_cfg = {};
c75f4bf6800bde Konrad Dybcio 2023-09-15  219  	struct device *dev = &client->dev;
c75f4bf6800bde Konrad Dybcio 2023-09-15  220  	struct power_supply *psy;
c75f4bf6800bde Konrad Dybcio 2023-09-15  221  	struct mm8013_chip *chip;
c75f4bf6800bde Konrad Dybcio 2023-09-15  222  	int ret = 0;
c75f4bf6800bde Konrad Dybcio 2023-09-15  223  
c75f4bf6800bde Konrad Dybcio 2023-09-15  224  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_WORD_DATA))
c75f4bf6800bde Konrad Dybcio 2023-09-15  225  		return dev_err_probe(dev, -EIO,
c75f4bf6800bde Konrad Dybcio 2023-09-15  226  				     "I2C_FUNC_SMBUS_WORD_DATA not supported\n");
c75f4bf6800bde Konrad Dybcio 2023-09-15  227  
c75f4bf6800bde Konrad Dybcio 2023-09-15  228  	chip = devm_kzalloc(dev, sizeof(struct mm8013_chip), GFP_KERNEL);
c75f4bf6800bde Konrad Dybcio 2023-09-15  229  	if (!chip)
c75f4bf6800bde Konrad Dybcio 2023-09-15  230  		return -ENOMEM;
c75f4bf6800bde Konrad Dybcio 2023-09-15  231  
c75f4bf6800bde Konrad Dybcio 2023-09-15  232  	chip->client = client;
c75f4bf6800bde Konrad Dybcio 2023-09-15  233  
c75f4bf6800bde Konrad Dybcio 2023-09-15  234  	chip->regmap = devm_regmap_init_i2c(client, &mm8013_regmap_config);
c75f4bf6800bde Konrad Dybcio 2023-09-15  235  	if (IS_ERR(chip->regmap))
c75f4bf6800bde Konrad Dybcio 2023-09-15 @236  		return dev_err_probe(dev, ret, "Couldn't initialize regmap\n");
c75f4bf6800bde Konrad Dybcio 2023-09-15  237  
c75f4bf6800bde Konrad Dybcio 2023-09-15  238  	ret = mm8013_checkdevice(chip);
c75f4bf6800bde Konrad Dybcio 2023-09-15  239  	if (ret)
c75f4bf6800bde Konrad Dybcio 2023-09-15  240  		return dev_err_probe(dev, ret, "MM8013 not found\n");
c75f4bf6800bde Konrad Dybcio 2023-09-15  241  
c75f4bf6800bde Konrad Dybcio 2023-09-15  242  	psy_cfg.drv_data = chip;
c75f4bf6800bde Konrad Dybcio 2023-09-15  243  	psy_cfg.of_node = dev->of_node;
c75f4bf6800bde Konrad Dybcio 2023-09-15  244  
c75f4bf6800bde Konrad Dybcio 2023-09-15  245  	psy = devm_power_supply_register(dev, &mm8013_desc, &psy_cfg);
c75f4bf6800bde Konrad Dybcio 2023-09-15  246  	if (IS_ERR(psy))
c75f4bf6800bde Konrad Dybcio 2023-09-15  247  		return PTR_ERR(psy);
c75f4bf6800bde Konrad Dybcio 2023-09-15  248  
c75f4bf6800bde Konrad Dybcio 2023-09-15  249  	return 0;
c75f4bf6800bde Konrad Dybcio 2023-09-15  250  }
c75f4bf6800bde Konrad Dybcio 2023-09-15  251  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
