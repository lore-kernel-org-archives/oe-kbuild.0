Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571ED13AC1
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Sep 2023 22:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694124336; x=1725660336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bXN8o6okW7ALxbRGs1fWYT+LOreBqIW59bjeKCcGNMk=;
  b=hz2c8L3Muc9Vw4ZEdi57Q7tmZu24+LAvTByNTHQku1SvoL6jNBjtlUrN
   etvJn9M+DOcQP4n7PjnTaeXFK7KFQmYVqA2QZWR2W0ylmKlJgvEc0UOVw
   X9C2QBnxlm+7cxbhfuSagX+7YVxWEwIu2ooje1zwI5hSdpheAW7DQroFH
   Eut+A8oLYHk9ZwAxgCoZ6+kXjgyZyPxGz1J2kI6Mr2hTW8rxsMbCV4o5u
   OGqEcKkWZMqcq+oEGiyQU1F6Ok4xpo3Z7wNAWw0GlgjGUPsdb4wf7uTHr
   wuLmXp3PhqryQD8yI2O4p+Vj9txalqDpiFh+YSx40rxwHS3Bg+cgtnPoq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="441508596"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="441508596"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 15:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="915890424"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="915890424"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Sep 2023 15:05:34 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeN7z-0001ch-2O;
	Thu, 07 Sep 2023 22:05:31 +0000
Date: Fri, 8 Sep 2023 06:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:testing 50/62] drivers/iio/adc/ltc2309.c:208
 ltc2309_probe() warn: ignoring unreachable code.
Message-ID: <202309080619.pVarITpN-lkp@intel.com>
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
TO: Liam Beguin <liambeguin@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   184d37294d1b4f21a2a625be10133aafb270d591
commit: ca4c617015ff7803b72a2afc1bd45c9c5b570492 [50/62] iio: adc: add ltc2309 support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20230907 (https://download.01.org/0day-ci/archive/20230908/202309080619.pVarITpN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230908/202309080619.pVarITpN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309080619.pVarITpN-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ltc2309.c:208 ltc2309_probe() warn: ignoring unreachable code.

vim +208 drivers/iio/adc/ltc2309.c

ca4c617015ff78 Liam Beguin 2023-08-28  164  
ca4c617015ff78 Liam Beguin 2023-08-28  165  static int ltc2309_probe(struct i2c_client *client)
ca4c617015ff78 Liam Beguin 2023-08-28  166  {
ca4c617015ff78 Liam Beguin 2023-08-28  167  	struct iio_dev *indio_dev;
ca4c617015ff78 Liam Beguin 2023-08-28  168  	struct ltc2309 *ltc2309;
ca4c617015ff78 Liam Beguin 2023-08-28  169  	int ret;
ca4c617015ff78 Liam Beguin 2023-08-28  170  
ca4c617015ff78 Liam Beguin 2023-08-28  171  	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*ltc2309));
ca4c617015ff78 Liam Beguin 2023-08-28  172  	if (!indio_dev)
ca4c617015ff78 Liam Beguin 2023-08-28  173  		return -ENOMEM;
ca4c617015ff78 Liam Beguin 2023-08-28  174  
ca4c617015ff78 Liam Beguin 2023-08-28  175  	ltc2309 = iio_priv(indio_dev);
ca4c617015ff78 Liam Beguin 2023-08-28  176  	ltc2309->dev = &indio_dev->dev;
ca4c617015ff78 Liam Beguin 2023-08-28  177  	ltc2309->client = client;
ca4c617015ff78 Liam Beguin 2023-08-28  178  	ltc2309->vref_mv = 4096; /* Default to the internal ref */
ca4c617015ff78 Liam Beguin 2023-08-28  179  
ca4c617015ff78 Liam Beguin 2023-08-28  180  	indio_dev->name = "ltc2309";
ca4c617015ff78 Liam Beguin 2023-08-28  181  	indio_dev->modes = INDIO_DIRECT_MODE;
ca4c617015ff78 Liam Beguin 2023-08-28  182  	indio_dev->channels = ltc2309_channels;
ca4c617015ff78 Liam Beguin 2023-08-28  183  	indio_dev->num_channels = ARRAY_SIZE(ltc2309_channels);
ca4c617015ff78 Liam Beguin 2023-08-28  184  	indio_dev->info = &ltc2309_info;
ca4c617015ff78 Liam Beguin 2023-08-28  185  
ca4c617015ff78 Liam Beguin 2023-08-28  186  	ltc2309->vref = devm_regulator_get_optional(&client->dev, "vref");
ca4c617015ff78 Liam Beguin 2023-08-28  187  	if (IS_ERR(ltc2309->vref)) {
ca4c617015ff78 Liam Beguin 2023-08-28  188  		ret = PTR_ERR(ltc2309->vref);
ca4c617015ff78 Liam Beguin 2023-08-28  189  		if (ret == -ENODEV)
ca4c617015ff78 Liam Beguin 2023-08-28  190  			ltc2309->vref = NULL;
ca4c617015ff78 Liam Beguin 2023-08-28  191  		else
ca4c617015ff78 Liam Beguin 2023-08-28  192  			return ret;
ca4c617015ff78 Liam Beguin 2023-08-28  193  	}
ca4c617015ff78 Liam Beguin 2023-08-28  194  
ca4c617015ff78 Liam Beguin 2023-08-28  195  	if (ltc2309->vref) {
ca4c617015ff78 Liam Beguin 2023-08-28  196  		ret = regulator_enable(ltc2309->vref);
ca4c617015ff78 Liam Beguin 2023-08-28  197  		if (ret)
ca4c617015ff78 Liam Beguin 2023-08-28  198  			return dev_err_probe(ltc2309->dev, ret,
ca4c617015ff78 Liam Beguin 2023-08-28  199  					     "failed to enable vref\n");
ca4c617015ff78 Liam Beguin 2023-08-28  200  
ca4c617015ff78 Liam Beguin 2023-08-28  201  		ret = devm_add_action_or_reset(ltc2309->dev,
ca4c617015ff78 Liam Beguin 2023-08-28  202  					       ltc2309_regulator_disable,
ca4c617015ff78 Liam Beguin 2023-08-28  203  					       ltc2309->vref);
ca4c617015ff78 Liam Beguin 2023-08-28  204  		if (ret) {
ca4c617015ff78 Liam Beguin 2023-08-28  205  			return dev_err_probe(ltc2309->dev, ret,
ca4c617015ff78 Liam Beguin 2023-08-28  206  					     "failed to add regulator_disable action: %d\n",
ca4c617015ff78 Liam Beguin 2023-08-28  207  					     ret);
ca4c617015ff78 Liam Beguin 2023-08-28 @208  			return ret;
ca4c617015ff78 Liam Beguin 2023-08-28  209  		}
ca4c617015ff78 Liam Beguin 2023-08-28  210  
ca4c617015ff78 Liam Beguin 2023-08-28  211  		ret = regulator_get_voltage(ltc2309->vref);
ca4c617015ff78 Liam Beguin 2023-08-28  212  		if (ret < 0)
ca4c617015ff78 Liam Beguin 2023-08-28  213  			return ret;
ca4c617015ff78 Liam Beguin 2023-08-28  214  
ca4c617015ff78 Liam Beguin 2023-08-28  215  		ltc2309->vref_mv = ret / 1000;
ca4c617015ff78 Liam Beguin 2023-08-28  216  	}
ca4c617015ff78 Liam Beguin 2023-08-28  217  
ca4c617015ff78 Liam Beguin 2023-08-28  218  	mutex_init(&ltc2309->lock);
ca4c617015ff78 Liam Beguin 2023-08-28  219  
ca4c617015ff78 Liam Beguin 2023-08-28  220  	return devm_iio_device_register(&client->dev, indio_dev);
ca4c617015ff78 Liam Beguin 2023-08-28  221  }
ca4c617015ff78 Liam Beguin 2023-08-28  222  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
