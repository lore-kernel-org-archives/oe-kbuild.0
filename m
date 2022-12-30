Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827301110
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Dec 2022 01:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672362109; x=1703898109;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=d+zihHhTjkTHbzsweorPZ0gVbCIKE7WgKEqkZWOyfX8=;
  b=Qs3SIsPbfE3S5VK0ToHnzT7SNLyK23kBF6TmnjS0HBUumGPQ5TLbnHaK
   zUm/H+HLsYlqFtDIGE1q3I4mEi36eUAIVrzFCiIx1z/kIfdSPJDp5PlyJ
   YWBPqscELDxB2anfjEk22C36hZRBO7EMrJ2cEfb9iA5Fyu0nvyjcv7Cjm
   Se6HKZDUC/E4gdWXJpM5djNmcW0Zvnl6QebitQF5utEJAP2INXYxesChL
   LZqXhwvE7tncODks9VOMnSwHnZ2X3bLJRpRg64DUeYbhEg9qBolpVrBtx
   tpN8v/F/TCiYvPv9yi5bTFtOyvDAtGtCk3P5U5Rwed2r4r5aznnkECIh+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="304638066"
X-IronPort-AV: E=Sophos;i="5.96,285,1665471600"; 
   d="scan'208";a="304638066"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2022 17:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="796101635"
X-IronPort-AV: E=Sophos;i="5.96,285,1665471600"; 
   d="scan'208";a="796101635"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Dec 2022 17:01:47 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pB3mN-000HHJ-08;
	Fri, 30 Dec 2022 01:01:47 +0000
Date: Fri, 30 Dec 2022 09:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/cdc/ad7746.c:288:24: warning: The statement 'if
 (chip->capdac_set!=chan->channel) chip->capdac_set=chan->channel' is
 logically equivalent to 'chip->capdac_set=chan->channel'.
 [duplicateConditionalAssign]
Message-ID: <202212300959.ghzpOGjH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/cdc/ad7746.c:288:24: warning: The statement 'if (chip->capdac_set!=chan->channel) chip->capdac_set=chan->channel' is logically equivalent to 'chip->capdac_set=chan->channel'. [duplicateConditionalAssign]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2258c2dc850b8605cb66b3383e50b9dddd1c6580
commit: 40b5c4d5b5a67e79eef86a653cdc8b10b4d73f11 iio: cdc: ad7746: Move driver out of staging.
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 40b5c4d5b5a67e79eef86a653cdc8b10b4d73f11
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iio/cdc/ad7746.c:288:24: warning: The statement 'if (chip->capdac_set!=chan->channel) chip->capdac_set=chan->channel' is logically equivalent to 'chip->capdac_set=chan->channel'. [duplicateConditionalAssign]
     if (chip->capdac_set != chan->channel)
                          ^
   drivers/iio/cdc/ad7746.c:289:21: note: Assignment 'chip->capdac_set=chan->channel'
      chip->capdac_set = chan->channel;
                       ^
   drivers/iio/cdc/ad7746.c:288:24: note: Condition 'chip->capdac_set!=chan->channel' is redundant
     if (chip->capdac_set != chan->channel)
                          ^

vim +288 drivers/iio/cdc/ad7746.c

6a7e4b04df3f4f drivers/staging/iio/cdc/ad7746.c Lucas Stankus     2021-05-23  265  
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  266  static int ad7746_select_channel(struct iio_dev *indio_dev,
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  267  				 struct iio_chan_spec const *chan)
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  268  {
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  269  	struct ad7746_chip_info *chip = iio_priv(indio_dev);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  270  	u8 vt_setup, cap_setup;
afcd0b22e35e0b drivers/staging/iio/cdc/ad7746.c Hernán Gonzalez   2018-04-13  271  	int ret, delay, idx;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  272  
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  273  	switch (chan->type) {
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  274  	case IIO_CAPACITANCE:
9eee2fc4a670d7 drivers/staging/iio/cdc/ad7746.c Jonathan Cameron  2022-06-26  275  		cap_setup = FIELD_PREP(AD7746_CAPSETUP_CIN2,
9eee2fc4a670d7 drivers/staging/iio/cdc/ad7746.c Jonathan Cameron  2022-06-26  276  				       ad7746_chan_info[chan->address].cin2) |
9eee2fc4a670d7 drivers/staging/iio/cdc/ad7746.c Jonathan Cameron  2022-06-26  277  			FIELD_PREP(AD7746_CAPSETUP_CAPDIFF,
9eee2fc4a670d7 drivers/staging/iio/cdc/ad7746.c Jonathan Cameron  2022-06-26  278  				   ad7746_chan_info[chan->address].capdiff) |
9eee2fc4a670d7 drivers/staging/iio/cdc/ad7746.c Jonathan Cameron  2022-06-26  279  			FIELD_PREP(AD7746_CAPSETUP_CAPEN, 1);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  280  		vt_setup = chip->vt_setup & ~AD7746_VTSETUP_VTEN;
9eee2fc4a670d7 drivers/staging/iio/cdc/ad7746.c Jonathan Cameron  2022-06-26  281  		idx = FIELD_GET(AD7746_CONF_CAPFS_MASK, chip->config);
579d542534c96c drivers/staging/iio/cdc/ad7746.c Eva Rachel Retuya 2016-10-28  282  		delay = ad7746_cap_filter_rate_table[idx][1];
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  283  
6a7e4b04df3f4f drivers/staging/iio/cdc/ad7746.c Lucas Stankus     2021-05-23  284  		ret = ad7746_set_capdac(chip, chan->channel);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  285  		if (ret < 0)
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  286  			return ret;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  287  
050098500ae4f7 drivers/staging/iio/cdc/ad7746.c Alexander Vorwerk 2021-08-21 @288  		if (chip->capdac_set != chan->channel)
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  289  			chip->capdac_set = chan->channel;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  290  		break;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  291  	case IIO_VOLTAGE:
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  292  	case IIO_TEMP:
9eee2fc4a670d7 drivers/staging/iio/cdc/ad7746.c Jonathan Cameron  2022-06-26  293  		vt_setup = FIELD_PREP(AD7746_VTSETUP_VTMD_MASK,
9eee2fc4a670d7 drivers/staging/iio/cdc/ad7746.c Jonathan Cameron  2022-06-26  294  				      ad7746_chan_info[chan->address].vtmd) |
9eee2fc4a670d7 drivers/staging/iio/cdc/ad7746.c Jonathan Cameron  2022-06-26  295  			FIELD_PREP(AD7746_VTSETUP_VTEN, 1);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  296  		cap_setup = chip->cap_setup & ~AD7746_CAPSETUP_CAPEN;
9eee2fc4a670d7 drivers/staging/iio/cdc/ad7746.c Jonathan Cameron  2022-06-26  297  		idx = FIELD_GET(AD7746_CONF_VTFS_MASK, chip->config);
579d542534c96c drivers/staging/iio/cdc/ad7746.c Eva Rachel Retuya 2016-10-28  298  		delay = ad7746_cap_filter_rate_table[idx][1];
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  299  		break;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  300  	default:
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  301  		return -EINVAL;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  302  	}
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  303  
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  304  	if (chip->cap_setup != cap_setup) {
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  305  		ret = i2c_smbus_write_byte_data(chip->client,
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  306  						AD7746_REG_CAP_SETUP,
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  307  						cap_setup);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  308  		if (ret < 0)
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  309  			return ret;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  310  
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  311  		chip->cap_setup = cap_setup;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  312  	}
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  313  
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  314  	if (chip->vt_setup != vt_setup) {
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  315  		ret = i2c_smbus_write_byte_data(chip->client,
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  316  						AD7746_REG_VT_SETUP,
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  317  						vt_setup);
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  318  		if (ret < 0)
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  319  			return ret;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  320  
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  321  		chip->vt_setup = vt_setup;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  322  	}
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  323  
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  324  	return delay;
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  325  }
83e416f458d532 drivers/staging/iio/adc/ad7746.c Michael Hennerich 2011-09-21  326  

:::::: The code at line 288 was first introduced by commit
:::::: 050098500ae4f73f76a775b26fdf6ee5ee5bef40 staging: iio: cdc: remove braces from single line if blocks

:::::: TO: Alexander Vorwerk <alec@vc-celle.de>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
