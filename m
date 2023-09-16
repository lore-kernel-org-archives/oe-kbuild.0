Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526DC1BDF1
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Sep 2023 19:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694894001; x=1726430001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ymZRznD7Jpe8jzA2SPKPTpj+LHN+bhYYxj9TWuPPGSY=;
  b=m+8d4uaQobrkIa2NYwsQ2AWX263hWbZxnOqRBJ3ziF1VUrl3nPAa3gba
   h498hd1j+zI+h5MYBFwEnlGqIZMH029j5io9liVDUjWTg6ngW5QceYEJl
   2SbHciICJJxZ9cCjmPr6eGYcd4viiZxA284LIGcRU/2Y4fU6XCe3/eMlq
   awoJV7RX0vjxdN+FCkZPNkKv+gGB7VorW/tvd11Fq2djylapOdoj/ECeT
   vOaI9BLGzfx3ZGt+LlzU/V5fa1uVlu+kht1GjPzx8AFWqDEPYuwG5gxfw
   UZjTo3Sb8eJ0xaImBQ/TEcWQfG1ljGa7rkihBCSqOUDYhJotAVzwbn4HA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="410404740"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="410404740"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 12:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="738706185"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="738706185"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Sep 2023 12:53:18 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhbLw-0004bK-0k;
	Sat, 16 Sep 2023 19:53:16 +0000
Date: Sun, 17 Sep 2023 03:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/addac/ad74115.c:828 _ad74115_get_adc_code() error:
 uninitialized symbol 'rate'.
Message-ID: <202309170343.bfb0EKrz-lkp@intel.com>
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
head:   57d88e8a5974644039fbc47806bac7bb12025636
commit: 48ea75598db2b38e4a4b5738d65f226be717bd59 iio: addac: add AD74115 driver
date:   10 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20230916 (https://download.01.org/0day-ci/archive/20230917/202309170343.bfb0EKrz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309170343.bfb0EKrz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309170343.bfb0EKrz-lkp@intel.com/

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
