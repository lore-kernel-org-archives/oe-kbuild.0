Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7317A36B
	for <oe-kbuild@lists.linux.dev>; Tue,  2 May 2023 04:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683003374; x=1714539374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mOG/ThVEDvXx3EoydpG6XTopQpEKF51GBdssKQBe558=;
  b=Vhiuurbrz9RXlx6WZf8f6Mt0niAT8e3e8T2KHJfHEN7QbHY2ZfG344wb
   SJIG0WMZatbw/TysgH34ijWcALTCjSrmXYFIPpfKQKMFBoOZ0K2Ldmi6D
   r0NdXiDn3QO0Y8iBfP3hIfh2t20VLqUZ4z8JPKmya8ussRMLGmPZNxEUD
   GD5dKjFPnTD3skkHchpHqhbntxWtNtb1tid/0WORhDu10CHBYqbbZZgwZ
   5qdmGfQ2eSfznz2f5tFPCmz+pGvG0qHmhXCsTCaV6WDBuxTxQ1AMVHBed
   8g6fAE+JVlkzWz8QZZXEW4Q7SbnoubOutLYVv2Zy0XPc8FFfVpWjIsnr2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="376366467"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="376366467"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 21:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="942304474"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="942304474"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 May 2023 21:56:12 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pti3g-0000qQ-0B;
	Tue, 02 May 2023 04:56:12 +0000
Date: Tue, 2 May 2023 12:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/adc/axp20x_adc.c:572:26: sparse: sparse: dubious: x & !y
Message-ID: <202305021214.Ljg7QiRH-lkp@intel.com>
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
head:   865fdb08197e657c59e74a35fa32362b12397f58
commit: 8957e5344353e9cd3f6b1e3004942e35449fa0e8 iio: adc: axp20x_adc: Minor code cleanups
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
config: powerpc-randconfig-s042-20230501 (https://download.01.org/0day-ci/archive/20230502/202305021214.Ljg7QiRH-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8957e5344353e9cd3f6b1e3004942e35449fa0e8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8957e5344353e9cd3f6b1e3004942e35449fa0e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/iio/adc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305021214.Ljg7QiRH-lkp@intel.com/

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
https://github.com/intel/lkp-tests
