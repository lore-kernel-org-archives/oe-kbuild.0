Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149031804E
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 22:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loncYc4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700087308; x=1731623308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LnWmQL6vs6TyHjNLi9ZQSv48uVWCJAIyEEOHfxX/BLI=;
  b=loncYc4rQQnqGudQofX/zRIZ8EdZkWpMtP2ISyvPG0CK1s4R3WGdRInd
   3hgBY76FDQdQccenKYvbYzrNGukERPy3LXk7KdUD8BQxeWAcOWReDEjvy
   M+NEUcAxF63i8ByR5xLdOZGQyhbGXqoFfUGoCzwVm0B8OG7EmkhKaegO6
   LfSjnZ4EfWNQEMyEI9VgbGT54iyNJiWx8z/2woNlH4DglOVZxX83US9gx
   74etGr8rraocy6P6Nygn7pHECuEAEkuUQ1gz4fuINCrOxmCgN4ahCpTac
   oj1CdthvjgI1UQ2hXPUm0VDhxRsBvSWBsblyAVFPmR5FP4Kox2QGhIIix
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="393819471"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="393819471"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 14:28:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="799990457"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="799990457"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Nov 2023 14:28:26 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3OMx-0000uR-2b;
	Wed, 15 Nov 2023 22:28:23 +0000
Date: Thu, 16 Nov 2023 06:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/adc/axp20x_adc.c:572:26: sparse: sparse: dubious: x & !y
Message-ID: <202311160621.VPrVjwB9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/adc/axp20x_adc.c:572:26: sparse: sparse: dubious: x & !y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: "Chen-Yu Tsai" <wens@csie.org>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 8957e5344353e9cd3f6b1e3004942e35449fa0e8 iio: adc: axp20x_adc: Minor code cleanups
date:   8 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-x001-20230717 (https://download.01.org/0day-ci/archive/20231116/202311160621.VPrVjwB9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160621.VPrVjwB9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160621.VPrVjwB9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/axp20x_adc.c:572:26: sparse: sparse: dubious: x & !y
   drivers/iio/adc/axp20x_adc.c:577:26: sparse: sparse: dubious: x & !y

vim +572 drivers/iio/adc/axp20x_adc.c

1a3f6755649dd4 Quentin Schulz  2018-01-15  551  
0e34d5de961d5a Quentin Schulz  2017-04-04  552  static int axp20x_write_raw(struct iio_dev *indio_dev,
0e34d5de961d5a Quentin Schulz  2017-04-04  553  			    struct iio_chan_spec const *chan, int val, int val2,
0e34d5de961d5a Quentin Schulz  2017-04-04  554  			    long mask)
0e34d5de961d5a Quentin Schulz  2017-04-04  555  {
0e34d5de961d5a Quentin Schulz  2017-04-04  556  	struct axp20x_adc_iio *info = iio_priv(indio_dev);
8957e5344353e9 Aidan MacDonald 2023-02-17  557  	unsigned int regmask, regval;
0e34d5de961d5a Quentin Schulz  2017-04-04  558  
0e34d5de961d5a Quentin Schulz  2017-04-04  559  	/*
0e34d5de961d5a Quentin Schulz  2017-04-04  560  	 * The AXP20X PMIC allows the user to choose between 0V and 0.7V offsets
0e34d5de961d5a Quentin Schulz  2017-04-04  561  	 * for (independently) GPIO0 and GPIO1 when in ADC mode.
0e34d5de961d5a Quentin Schulz  2017-04-04  562  	 */
0e34d5de961d5a Quentin Schulz  2017-04-04  563  	if (mask != IIO_CHAN_INFO_OFFSET)
0e34d5de961d5a Quentin Schulz  2017-04-04  564  		return -EINVAL;
0e34d5de961d5a Quentin Schulz  2017-04-04  565  
0e34d5de961d5a Quentin Schulz  2017-04-04  566  	if (val != 0 && val != 700000)
0e34d5de961d5a Quentin Schulz  2017-04-04  567  		return -EINVAL;
0e34d5de961d5a Quentin Schulz  2017-04-04  568  
0e34d5de961d5a Quentin Schulz  2017-04-04  569  	switch (chan->channel) {
0e34d5de961d5a Quentin Schulz  2017-04-04  570  	case AXP20X_GPIO0_V:
8957e5344353e9 Aidan MacDonald 2023-02-17  571  		regmask = AXP20X_GPIO10_IN_RANGE_GPIO0;
8957e5344353e9 Aidan MacDonald 2023-02-17 @572  		regval = FIELD_PREP(AXP20X_GPIO10_IN_RANGE_GPIO0, !!val);
0e34d5de961d5a Quentin Schulz  2017-04-04  573  		break;
0e34d5de961d5a Quentin Schulz  2017-04-04  574  
0e34d5de961d5a Quentin Schulz  2017-04-04  575  	case AXP20X_GPIO1_V:
8957e5344353e9 Aidan MacDonald 2023-02-17  576  		regmask = AXP20X_GPIO10_IN_RANGE_GPIO1;
8957e5344353e9 Aidan MacDonald 2023-02-17  577  		regval = FIELD_PREP(AXP20X_GPIO10_IN_RANGE_GPIO1, !!val);
0e34d5de961d5a Quentin Schulz  2017-04-04  578  		break;
0e34d5de961d5a Quentin Schulz  2017-04-04  579  
0e34d5de961d5a Quentin Schulz  2017-04-04  580  	default:
0e34d5de961d5a Quentin Schulz  2017-04-04  581  		return -EINVAL;
0e34d5de961d5a Quentin Schulz  2017-04-04  582  	}
0e34d5de961d5a Quentin Schulz  2017-04-04  583  
8957e5344353e9 Aidan MacDonald 2023-02-17  584  	return regmap_update_bits(info->regmap, AXP20X_GPIO10_IN_RANGE, regmask, regval);
0e34d5de961d5a Quentin Schulz  2017-04-04  585  }
0e34d5de961d5a Quentin Schulz  2017-04-04  586  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
