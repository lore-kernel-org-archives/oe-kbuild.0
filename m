Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB3F15A8
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Mar 2023 02:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680228742; x=1711764742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SwcKXkU28Qtb3chX+KoTK4SPGTzydsjdA6t3PbCjusY=;
  b=KkWlG9riefI9Y0JtyKbcbO3wwOipSoL2WDkXm273GQg1xY7f/OPm/MyT
   aU4L1NVWrNRcDkoZEqOTVZHHcGhgowQx+W724/oQAt2cYj0yzn6tR7ZS1
   UuaV6CILBIRGF8vhSZWX8SdUr7v1fhCAqH7egPME3uITjWcf6gsGd0PQw
   wUORGX/wmnwOrOOR30SQxc30+DBmFk7wWubSeUnFM8EzRTSApHtmY65xr
   j2/Pg98rQ92jvUD/S8eostwP2ThJzsoUvcMDgvokalyaPjA6BSshsMRTk
   EfeCUmlG1ePMeSxaz0ITvCiwy4b8qPgWd+KY0BgUPDNhGtB80TbqGm6uh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="325291773"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="325291773"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 19:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="930968032"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="930968032"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2023 19:12:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi4FX-000LQ0-1b;
	Fri, 31 Mar 2023 02:12:19 +0000
Date: Fri, 31 Mar 2023 10:11:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2084/7844] drivers/iio/adc/ti-ads1100.c:347
 ads1100_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <202303311053.RB8KIUTR-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mike Looijmans <mike.looijmans@topic.nl>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6d9e3034536ba4b68ac34490c02267e6eec9c05
commit: 541880542f2baa7c485b40c1ecad1855315418f6 [2084/7844] iio: adc: Add TI ADS1100 and ADS1000
:::::: branch date: 22 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-m031-20230329 (https://download.01.org/0day-ci/archive/20230331/202303311053.RB8KIUTR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303311053.RB8KIUTR-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ti-ads1100.c:347 ads1100_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +347 drivers/iio/adc/ti-ads1100.c

541880542f2baa Mike Looijmans 2023-03-07  317  
541880542f2baa Mike Looijmans 2023-03-07  318  static int ads1100_probe(struct i2c_client *client)
541880542f2baa Mike Looijmans 2023-03-07  319  {
541880542f2baa Mike Looijmans 2023-03-07  320  	struct iio_dev *indio_dev;
541880542f2baa Mike Looijmans 2023-03-07  321  	struct ads1100_data *data;
541880542f2baa Mike Looijmans 2023-03-07  322  	struct device *dev = &client->dev;
541880542f2baa Mike Looijmans 2023-03-07  323  	int ret;
541880542f2baa Mike Looijmans 2023-03-07  324  
541880542f2baa Mike Looijmans 2023-03-07  325  	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
541880542f2baa Mike Looijmans 2023-03-07  326  	if (!indio_dev)
541880542f2baa Mike Looijmans 2023-03-07  327  		return -ENOMEM;
541880542f2baa Mike Looijmans 2023-03-07  328  
541880542f2baa Mike Looijmans 2023-03-07  329  	data = iio_priv(indio_dev);
541880542f2baa Mike Looijmans 2023-03-07  330  	dev_set_drvdata(dev, data);
541880542f2baa Mike Looijmans 2023-03-07  331  	data->client = client;
541880542f2baa Mike Looijmans 2023-03-07  332  	mutex_init(&data->lock);
541880542f2baa Mike Looijmans 2023-03-07  333  
541880542f2baa Mike Looijmans 2023-03-07  334  	indio_dev->name = "ads1100";
541880542f2baa Mike Looijmans 2023-03-07  335  	indio_dev->modes = INDIO_DIRECT_MODE;
541880542f2baa Mike Looijmans 2023-03-07  336  	indio_dev->channels = &ads1100_channel;
541880542f2baa Mike Looijmans 2023-03-07  337  	indio_dev->num_channels = 1;
541880542f2baa Mike Looijmans 2023-03-07  338  	indio_dev->info = &ads1100_info;
541880542f2baa Mike Looijmans 2023-03-07  339  
541880542f2baa Mike Looijmans 2023-03-07  340  	data->reg_vdd = devm_regulator_get(dev, "vdd");
541880542f2baa Mike Looijmans 2023-03-07  341  	if (IS_ERR(data->reg_vdd))
541880542f2baa Mike Looijmans 2023-03-07  342  		return dev_err_probe(dev, PTR_ERR(data->reg_vdd),
541880542f2baa Mike Looijmans 2023-03-07  343  				     "Failed to get vdd regulator\n");
541880542f2baa Mike Looijmans 2023-03-07  344  
541880542f2baa Mike Looijmans 2023-03-07  345  	ret = regulator_enable(data->reg_vdd);
541880542f2baa Mike Looijmans 2023-03-07  346  	if (ret < 0)
541880542f2baa Mike Looijmans 2023-03-07 @347  		return dev_err_probe(dev, PTR_ERR(data->reg_vdd),
541880542f2baa Mike Looijmans 2023-03-07  348  				     "Failed to enable vdd regulator\n");
541880542f2baa Mike Looijmans 2023-03-07  349  
541880542f2baa Mike Looijmans 2023-03-07  350  	ret = devm_add_action_or_reset(dev, ads1100_reg_disable, data->reg_vdd);
541880542f2baa Mike Looijmans 2023-03-07  351  	if (ret)
541880542f2baa Mike Looijmans 2023-03-07  352  		return ret;
541880542f2baa Mike Looijmans 2023-03-07  353  
541880542f2baa Mike Looijmans 2023-03-07  354  	ret = ads1100_setup(data);
541880542f2baa Mike Looijmans 2023-03-07  355  	if (ret)
541880542f2baa Mike Looijmans 2023-03-07  356  		return dev_err_probe(dev, ret,
541880542f2baa Mike Looijmans 2023-03-07  357  				     "Failed to communicate with device\n");
541880542f2baa Mike Looijmans 2023-03-07  358  
541880542f2baa Mike Looijmans 2023-03-07  359  	ret = devm_add_action_or_reset(dev, ads1100_disable_continuous, data);
541880542f2baa Mike Looijmans 2023-03-07  360  	if (ret)
541880542f2baa Mike Looijmans 2023-03-07  361  		return ret;
541880542f2baa Mike Looijmans 2023-03-07  362  
541880542f2baa Mike Looijmans 2023-03-07  363  	ads1100_calc_scale_avail(data);
541880542f2baa Mike Looijmans 2023-03-07  364  
541880542f2baa Mike Looijmans 2023-03-07  365  	pm_runtime_set_autosuspend_delay(dev, ADS1100_SLEEP_DELAY_MS);
541880542f2baa Mike Looijmans 2023-03-07  366  	pm_runtime_use_autosuspend(dev);
541880542f2baa Mike Looijmans 2023-03-07  367  	pm_runtime_set_active(dev);
541880542f2baa Mike Looijmans 2023-03-07  368  	ret = devm_pm_runtime_enable(dev);
541880542f2baa Mike Looijmans 2023-03-07  369  	if (ret)
541880542f2baa Mike Looijmans 2023-03-07  370  		return dev_err_probe(dev, ret, "Failed to enable pm_runtime\n");
541880542f2baa Mike Looijmans 2023-03-07  371  
541880542f2baa Mike Looijmans 2023-03-07  372  	ret = devm_iio_device_register(dev, indio_dev);
541880542f2baa Mike Looijmans 2023-03-07  373  	if (ret)
541880542f2baa Mike Looijmans 2023-03-07  374  		return dev_err_probe(dev, ret,
541880542f2baa Mike Looijmans 2023-03-07  375  				     "Failed to register IIO device\n");
541880542f2baa Mike Looijmans 2023-03-07  376  
541880542f2baa Mike Looijmans 2023-03-07  377  	return 0;
541880542f2baa Mike Looijmans 2023-03-07  378  }
541880542f2baa Mike Looijmans 2023-03-07  379  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
