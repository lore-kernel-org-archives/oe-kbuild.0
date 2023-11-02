Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC35111BD
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Nov 2023 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRPCuHCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698916832; x=1730452832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=neniY8kbVnaCEV2q9GU6v3dc6JjY0HfYb4EXFX9zkr4=;
  b=ZRPCuHCObP5+6MDGYDJC/Q7dA2PcxdGwoJRxi4/JXCMUh+4jZgMVg5eZ
   Th3AJn6JH917zeA7l7hhr24b4MWj1Xa/Iaprr0GWg0hmdwB0y2XIgAKtS
   WqSpgazviztAjiPaWw7P1a7cIgoZNEfSapl+4dXDN4mIJTURHdzJg6pfW
   u52Rdxmjh7K1+923e89phWum2M/K4B5eQ+Iu9DDMpQh286idWvqnpA5by
   AqH7LmPWOKCych4oR+1ha5KiMbOrRGRzYqOFUS/AjWK5U5e5nH68wWbVI
   VKV+1tviAO1clgSDlso3Gd9gVd4zl6ALg96PWan21KKOWEw0X7DiRFeQg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1584531"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1584531"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 02:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1092660343"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1092660343"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Nov 2023 02:20:26 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyTsF-0001JX-2r;
	Thu, 02 Nov 2023 09:20:23 +0000
Date: Thu, 2 Nov 2023 17:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/addac/ad74115.c:828 _ad74115_get_adc_code() error:
 uninitialized symbol 'rate'.
Message-ID: <202311021717.RaGglKUm-lkp@intel.com>
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
TO: Cosmin Tanislav <demonsingur@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21e80f3841c01aeaf32d7aee7bbc87b3db1aa0c6
commit: 48ea75598db2b38e4a4b5738d65f226be717bd59 iio: addac: add AD74115 driver
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20231102 (https://download.01.org/0day-ci/archive/20231102/202311021717.RaGglKUm-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231102/202311021717.RaGglKUm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311021717.RaGglKUm-lkp@intel.com/

smatch warnings:
drivers/iio/addac/ad74115.c:828 _ad74115_get_adc_code() error: uninitialized symbol 'rate'.

vim +/rate +828 drivers/iio/addac/ad74115.c

48ea75598db2b3 Cosmin Tanislav 2022-11-17  798  
48ea75598db2b3 Cosmin Tanislav 2022-11-17  799  static int _ad74115_get_adc_code(struct ad74115_state *st,
48ea75598db2b3 Cosmin Tanislav 2022-11-17  800  				 enum ad74115_adc_ch channel, int *val)
48ea75598db2b3 Cosmin Tanislav 2022-11-17  801  {
48ea75598db2b3 Cosmin Tanislav 2022-11-17  802  	unsigned int uval;
48ea75598db2b3 Cosmin Tanislav 2022-11-17  803  	int ret;
48ea75598db2b3 Cosmin Tanislav 2022-11-17  804  
48ea75598db2b3 Cosmin Tanislav 2022-11-17  805  	reinit_completion(&st->adc_data_completion);
48ea75598db2b3 Cosmin Tanislav 2022-11-17  806  
48ea75598db2b3 Cosmin Tanislav 2022-11-17  807  	ret = ad74115_set_adc_ch_en(st, channel, true);
48ea75598db2b3 Cosmin Tanislav 2022-11-17  808  	if (ret)
48ea75598db2b3 Cosmin Tanislav 2022-11-17  809  		return ret;
48ea75598db2b3 Cosmin Tanislav 2022-11-17  810  
48ea75598db2b3 Cosmin Tanislav 2022-11-17  811  	ret = ad74115_set_adc_conv_seq(st, AD74115_ADC_CONV_SEQ_SINGLE);
48ea75598db2b3 Cosmin Tanislav 2022-11-17  812  	if (ret)
48ea75598db2b3 Cosmin Tanislav 2022-11-17  813  		return ret;
48ea75598db2b3 Cosmin Tanislav 2022-11-17  814  
48ea75598db2b3 Cosmin Tanislav 2022-11-17  815  	if (st->irq) {
48ea75598db2b3 Cosmin Tanislav 2022-11-17  816  		ret = wait_for_completion_timeout(&st->adc_data_completion,
48ea75598db2b3 Cosmin Tanislav 2022-11-17  817  						  msecs_to_jiffies(1000));
48ea75598db2b3 Cosmin Tanislav 2022-11-17  818  		if (!ret)
48ea75598db2b3 Cosmin Tanislav 2022-11-17  819  			return -ETIMEDOUT;
48ea75598db2b3 Cosmin Tanislav 2022-11-17  820  	} else {
48ea75598db2b3 Cosmin Tanislav 2022-11-17  821  		unsigned int regval, wait_time;
48ea75598db2b3 Cosmin Tanislav 2022-11-17  822  		int rate;
48ea75598db2b3 Cosmin Tanislav 2022-11-17  823  
48ea75598db2b3 Cosmin Tanislav 2022-11-17  824  		ret = ad74115_get_adc_rate(st, channel, &rate);
48ea75598db2b3 Cosmin Tanislav 2022-11-17  825  		if (ret < 0)
48ea75598db2b3 Cosmin Tanislav 2022-11-17  826  			return ret;
48ea75598db2b3 Cosmin Tanislav 2022-11-17  827  
48ea75598db2b3 Cosmin Tanislav 2022-11-17 @828  		wait_time = DIV_ROUND_CLOSEST(AD74115_CONV_TIME_US, rate);
48ea75598db2b3 Cosmin Tanislav 2022-11-17  829  
48ea75598db2b3 Cosmin Tanislav 2022-11-17  830  		ret = regmap_read_poll_timeout(st->regmap, AD74115_LIVE_STATUS_REG,
48ea75598db2b3 Cosmin Tanislav 2022-11-17  831  					       regval, regval & AD74115_ADC_DATA_RDY_MASK,
48ea75598db2b3 Cosmin Tanislav 2022-11-17  832  					       wait_time, 5 * wait_time);
48ea75598db2b3 Cosmin Tanislav 2022-11-17  833  		if (ret)
48ea75598db2b3 Cosmin Tanislav 2022-11-17  834  			return ret;
48ea75598db2b3 Cosmin Tanislav 2022-11-17  835  
48ea75598db2b3 Cosmin Tanislav 2022-11-17  836  		/*
48ea75598db2b3 Cosmin Tanislav 2022-11-17  837  		 * The ADC_DATA_RDY bit is W1C.
48ea75598db2b3 Cosmin Tanislav 2022-11-17  838  		 * See datasheet page 98, Table 62. Bit Descriptions for
48ea75598db2b3 Cosmin Tanislav 2022-11-17  839  		 * LIVE_STATUS.
48ea75598db2b3 Cosmin Tanislav 2022-11-17  840  		 * Although the datasheet mentions that the bit will auto-clear
48ea75598db2b3 Cosmin Tanislav 2022-11-17  841  		 * when writing to the ADC_CONV_CTRL register, this does not
48ea75598db2b3 Cosmin Tanislav 2022-11-17  842  		 * seem to happen.
48ea75598db2b3 Cosmin Tanislav 2022-11-17  843  		 */
48ea75598db2b3 Cosmin Tanislav 2022-11-17  844  		ret = regmap_write_bits(st->regmap, AD74115_LIVE_STATUS_REG,
48ea75598db2b3 Cosmin Tanislav 2022-11-17  845  					AD74115_ADC_DATA_RDY_MASK,
48ea75598db2b3 Cosmin Tanislav 2022-11-17  846  					FIELD_PREP(AD74115_ADC_DATA_RDY_MASK, 1));
48ea75598db2b3 Cosmin Tanislav 2022-11-17  847  		if (ret)
48ea75598db2b3 Cosmin Tanislav 2022-11-17  848  			return ret;
48ea75598db2b3 Cosmin Tanislav 2022-11-17  849  	}
48ea75598db2b3 Cosmin Tanislav 2022-11-17  850  
48ea75598db2b3 Cosmin Tanislav 2022-11-17  851  	ret = regmap_read(st->regmap, ad74115_adc_ch_data_regs_tbl[channel], &uval);
48ea75598db2b3 Cosmin Tanislav 2022-11-17  852  	if (ret)
48ea75598db2b3 Cosmin Tanislav 2022-11-17  853  		return ret;
48ea75598db2b3 Cosmin Tanislav 2022-11-17  854  
48ea75598db2b3 Cosmin Tanislav 2022-11-17  855  	ret = ad74115_set_adc_conv_seq(st, AD74115_ADC_CONV_SEQ_STANDBY);
48ea75598db2b3 Cosmin Tanislav 2022-11-17  856  	if (ret)
48ea75598db2b3 Cosmin Tanislav 2022-11-17  857  		return ret;
48ea75598db2b3 Cosmin Tanislav 2022-11-17  858  
48ea75598db2b3 Cosmin Tanislav 2022-11-17  859  	ret = ad74115_set_adc_ch_en(st, channel, false);
48ea75598db2b3 Cosmin Tanislav 2022-11-17  860  	if (ret)
48ea75598db2b3 Cosmin Tanislav 2022-11-17  861  		return ret;
48ea75598db2b3 Cosmin Tanislav 2022-11-17  862  
48ea75598db2b3 Cosmin Tanislav 2022-11-17  863  	*val = uval;
48ea75598db2b3 Cosmin Tanislav 2022-11-17  864  
48ea75598db2b3 Cosmin Tanislav 2022-11-17  865  	return IIO_VAL_INT;
48ea75598db2b3 Cosmin Tanislav 2022-11-17  866  }
48ea75598db2b3 Cosmin Tanislav 2022-11-17  867  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
