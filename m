Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357D5168D5
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 22:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXQwvhaV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699225130; x=1730761130;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iq1dFZo6JG8zw1UhQPl9JYP23pD8SK7KapY2A6E8A9o=;
  b=RXQwvhaVfkDuUEYaDJx15n+JGp2U9BHf+/y0FlSljYy2txPqo3C8gh/v
   iDkdiSSGUTuRIcHBtFNlCXdayoLkxdxSDhB3CCWHoujXOig8l38hwDLHU
   BucN0dz+mkZvt3vku31qEmmLHGdaATAxpPdJjkGykmaGt2/1iFlc6JIcN
   MaghyCpSIlSjLWiDWZx1gfqwFTy6G+2wSHtWKY/3xsZLjGTe3ZfCFKD5Z
   woZj5y0ElgRuOlWGmbgQxW4QgFk80M+70DjDfuRzdLNXcqyY+GurgXcoG
   Zi5oG3whXuC1vOmGhULQfr5JbQAI7nJZGnuKln0bKBvdDzdJq5kIl4Eal
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="388064920"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="388064920"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 14:58:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="1093600487"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="1093600487"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Nov 2023 14:58:48 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzm4s-0005rb-23;
	Sun, 05 Nov 2023 22:58:46 +0000
Date: Mon, 6 Nov 2023 06:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [alobakin:pfcp 5/20] drivers/iio/imu/adis16475.c:363
 adis16475_set_freq() warn: set_bit() takes a bit number
Message-ID: <202311060647.i9XyO4ej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: Przemek Kitszel <przemyslaw.kitszel@intel.com>

tree:   https://github.com/alobakin/linux pfcp
head:   89565e300e3d4033b8bb568774804fdc09d4f3cc
commit: 945a0d6e86d97bf60f2fae88ee557ed3eae18b94 [5/20] bitops: let the compiler optimize {__,}assign_bit()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231106/202311060647.i9XyO4ej-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311060647.i9XyO4ej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311060647.i9XyO4ej-lkp@intel.com/

smatch warnings:
drivers/iio/imu/adis16475.c:363 adis16475_set_freq() warn: set_bit() takes a bit number
drivers/iio/imu/adis16475.c:363 adis16475_set_freq() warn: clear_bit() takes a bit number
drivers/iio/imu/adis16475.c:416 adis16475_set_filter() warn: set_bit() takes a bit number
drivers/iio/imu/adis16475.c:416 adis16475_set_filter() warn: clear_bit() takes a bit number

vim +363 drivers/iio/imu/adis16475.c

fff7352bf7a3ce Nuno Sá 2020-04-13  288  
fff7352bf7a3ce Nuno Sá 2020-04-13  289  static int adis16475_set_freq(struct adis16475 *st, const u32 freq)
fff7352bf7a3ce Nuno Sá 2020-04-13  290  {
fff7352bf7a3ce Nuno Sá 2020-04-13  291  	u16 dec;
fff7352bf7a3ce Nuno Sá 2020-04-13  292  	int ret;
39c024b51b5607 Nuno Sa 2021-02-18  293  	u32 sample_rate = st->clk_freq;
fff7352bf7a3ce Nuno Sá 2020-04-13  294  
fff7352bf7a3ce Nuno Sá 2020-04-13  295  	if (!freq)
fff7352bf7a3ce Nuno Sá 2020-04-13  296  		return -EINVAL;
fff7352bf7a3ce Nuno Sá 2020-04-13  297  
15aacc980dcb32 Nuno Sa 2021-02-18  298  	adis_dev_lock(&st->adis);
39c024b51b5607 Nuno Sa 2021-02-18  299  	/*
39c024b51b5607 Nuno Sa 2021-02-18  300  	 * When using sync scaled mode, the input clock needs to be scaled so that we have
39c024b51b5607 Nuno Sa 2021-02-18  301  	 * an IMU sample rate between (optimally) 1900 and 2100. After this, we can use the
39c024b51b5607 Nuno Sa 2021-02-18  302  	 * decimation filter to lower the sampling rate in order to get what the user wants.
39c024b51b5607 Nuno Sa 2021-02-18  303  	 * Optimally, the user sample rate is a multiple of both the IMU sample rate and
39c024b51b5607 Nuno Sa 2021-02-18  304  	 * the input clock. Hence, calculating the sync_scale dynamically gives us better
39c024b51b5607 Nuno Sa 2021-02-18  305  	 * chances of achieving a perfect/integer value for DEC_RATE. The math here is:
39c024b51b5607 Nuno Sa 2021-02-18  306  	 *	1. lcm of the input clock and the desired output rate.
39c024b51b5607 Nuno Sa 2021-02-18  307  	 *	2. get the highest multiple of the previous result lower than the adis max rate.
39c024b51b5607 Nuno Sa 2021-02-18  308  	 *	3. The last result becomes the IMU sample rate. Use that to calculate SYNC_SCALE
39c024b51b5607 Nuno Sa 2021-02-18  309  	 *	   and DEC_RATE (to get the user output rate)
39c024b51b5607 Nuno Sa 2021-02-18  310  	 */
39c024b51b5607 Nuno Sa 2021-02-18  311  	if (st->sync_mode == ADIS16475_SYNC_SCALED) {
39c024b51b5607 Nuno Sa 2021-02-18  312  		unsigned long scaled_rate = lcm(st->clk_freq, freq);
39c024b51b5607 Nuno Sa 2021-02-18  313  		int sync_scale;
39c024b51b5607 Nuno Sa 2021-02-18  314  
39c024b51b5607 Nuno Sa 2021-02-18  315  		/*
39c024b51b5607 Nuno Sa 2021-02-18  316  		 * If lcm is bigger than the IMU maximum sampling rate there's no perfect
39c024b51b5607 Nuno Sa 2021-02-18  317  		 * solution. In this case, we get the highest multiple of the input clock
39c024b51b5607 Nuno Sa 2021-02-18  318  		 * lower than the IMU max sample rate.
39c024b51b5607 Nuno Sa 2021-02-18  319  		 */
39c024b51b5607 Nuno Sa 2021-02-18  320  		if (scaled_rate > 2100000)
39c024b51b5607 Nuno Sa 2021-02-18  321  			scaled_rate = 2100000 / st->clk_freq * st->clk_freq;
39c024b51b5607 Nuno Sa 2021-02-18  322  		else
39c024b51b5607 Nuno Sa 2021-02-18  323  			scaled_rate = 2100000 / scaled_rate * scaled_rate;
39c024b51b5607 Nuno Sa 2021-02-18  324  
39c024b51b5607 Nuno Sa 2021-02-18  325  		/*
39c024b51b5607 Nuno Sa 2021-02-18  326  		 * This is not an hard requirement but it's not advised to run the IMU
e2b39db176d9d6 Nuno Sá 2023-02-13  327  		 * with a sample rate lower than 1900Hz due to possible undersampling
39c024b51b5607 Nuno Sa 2021-02-18  328  		 * issues. However, there are users that might really want to take the risk.
39c024b51b5607 Nuno Sa 2021-02-18  329  		 * Hence, we provide a module parameter for them. If set, we allow sample
e2b39db176d9d6 Nuno Sá 2023-02-13  330  		 * rates lower than 1.9KHz. By default, we won't allow this and we just roundup
e2b39db176d9d6 Nuno Sá 2023-02-13  331  		 * the rate to the next multiple of the input clock bigger than 1.9KHz. This
39c024b51b5607 Nuno Sa 2021-02-18  332  		 * is done like this as in some cases (when DEC_RATE is 0) might give
39c024b51b5607 Nuno Sa 2021-02-18  333  		 * us the closest value to the one desired by the user...
39c024b51b5607 Nuno Sa 2021-02-18  334  		 */
39c024b51b5607 Nuno Sa 2021-02-18  335  		if (scaled_rate < 1900000 && !low_rate_allow)
39c024b51b5607 Nuno Sa 2021-02-18  336  			scaled_rate = roundup(1900000, st->clk_freq);
39c024b51b5607 Nuno Sa 2021-02-18  337  
39c024b51b5607 Nuno Sa 2021-02-18  338  		sync_scale = scaled_rate / st->clk_freq;
39c024b51b5607 Nuno Sa 2021-02-18  339  		ret = __adis_write_reg_16(&st->adis, ADIS16475_REG_UP_SCALE, sync_scale);
39c024b51b5607 Nuno Sa 2021-02-18  340  		if (ret)
39c024b51b5607 Nuno Sa 2021-02-18  341  			goto error;
39c024b51b5607 Nuno Sa 2021-02-18  342  
39c024b51b5607 Nuno Sa 2021-02-18  343  		sample_rate = scaled_rate;
39c024b51b5607 Nuno Sa 2021-02-18  344  	}
39c024b51b5607 Nuno Sa 2021-02-18  345  
39c024b51b5607 Nuno Sa 2021-02-18  346  	dec = DIV_ROUND_CLOSEST(sample_rate, freq);
fff7352bf7a3ce Nuno Sá 2020-04-13  347  
fff7352bf7a3ce Nuno Sá 2020-04-13  348  	if (dec)
fff7352bf7a3ce Nuno Sá 2020-04-13  349  		dec--;
fff7352bf7a3ce Nuno Sá 2020-04-13  350  
fff7352bf7a3ce Nuno Sá 2020-04-13  351  	if (dec > st->info->max_dec)
fff7352bf7a3ce Nuno Sá 2020-04-13  352  		dec = st->info->max_dec;
fff7352bf7a3ce Nuno Sá 2020-04-13  353  
9da1b86865ab43 Nuno Sá 2021-09-20  354  	ret = __adis_write_reg_16(&st->adis, ADIS16475_REG_DEC_RATE, dec);
fff7352bf7a3ce Nuno Sá 2020-04-13  355  	if (ret)
39c024b51b5607 Nuno Sa 2021-02-18  356  		goto error;
fff7352bf7a3ce Nuno Sá 2020-04-13  357  
9da1b86865ab43 Nuno Sá 2021-09-20  358  	adis_dev_unlock(&st->adis);
fff7352bf7a3ce Nuno Sá 2020-04-13  359  	/*
fff7352bf7a3ce Nuno Sá 2020-04-13  360  	 * If decimation is used, then gyro and accel data will have meaningful
fff7352bf7a3ce Nuno Sá 2020-04-13  361  	 * bits on the LSB registers. This info is used on the trigger handler.
fff7352bf7a3ce Nuno Sá 2020-04-13  362  	 */
fff7352bf7a3ce Nuno Sá 2020-04-13 @363  	assign_bit(ADIS16475_LSB_DEC_MASK, &st->lsb_flag, dec);
fff7352bf7a3ce Nuno Sá 2020-04-13  364  
fff7352bf7a3ce Nuno Sá 2020-04-13  365  	return 0;
39c024b51b5607 Nuno Sa 2021-02-18  366  error:
15aacc980dcb32 Nuno Sa 2021-02-18  367  	adis_dev_unlock(&st->adis);
39c024b51b5607 Nuno Sa 2021-02-18  368  	return ret;
fff7352bf7a3ce Nuno Sá 2020-04-13  369  }
fff7352bf7a3ce Nuno Sá 2020-04-13  370  
fff7352bf7a3ce Nuno Sá 2020-04-13  371  /* The values are approximated. */
fff7352bf7a3ce Nuno Sá 2020-04-13  372  static const u32 adis16475_3db_freqs[] = {
fff7352bf7a3ce Nuno Sá 2020-04-13  373  	[0] = 720, /* Filter disabled, full BW (~720Hz) */
fff7352bf7a3ce Nuno Sá 2020-04-13  374  	[1] = 360,
fff7352bf7a3ce Nuno Sá 2020-04-13  375  	[2] = 164,
fff7352bf7a3ce Nuno Sá 2020-04-13  376  	[3] = 80,
fff7352bf7a3ce Nuno Sá 2020-04-13  377  	[4] = 40,
fff7352bf7a3ce Nuno Sá 2020-04-13  378  	[5] = 20,
fff7352bf7a3ce Nuno Sá 2020-04-13  379  	[6] = 10,
fff7352bf7a3ce Nuno Sá 2020-04-13  380  };
fff7352bf7a3ce Nuno Sá 2020-04-13  381  
fff7352bf7a3ce Nuno Sá 2020-04-13  382  static int adis16475_get_filter(struct adis16475 *st, u32 *filter)
fff7352bf7a3ce Nuno Sá 2020-04-13  383  {
fff7352bf7a3ce Nuno Sá 2020-04-13  384  	u16 filter_sz;
fff7352bf7a3ce Nuno Sá 2020-04-13  385  	int ret;
fff7352bf7a3ce Nuno Sá 2020-04-13  386  	const int mask = ADIS16475_FILT_CTRL_MASK;
fff7352bf7a3ce Nuno Sá 2020-04-13  387  
fff7352bf7a3ce Nuno Sá 2020-04-13  388  	ret = adis_read_reg_16(&st->adis, ADIS16475_REG_FILT_CTRL, &filter_sz);
fff7352bf7a3ce Nuno Sá 2020-04-13  389  	if (ret)
fff7352bf7a3ce Nuno Sá 2020-04-13  390  		return ret;
fff7352bf7a3ce Nuno Sá 2020-04-13  391  
fff7352bf7a3ce Nuno Sá 2020-04-13  392  	*filter = adis16475_3db_freqs[filter_sz & mask];
fff7352bf7a3ce Nuno Sá 2020-04-13  393  
fff7352bf7a3ce Nuno Sá 2020-04-13  394  	return 0;
fff7352bf7a3ce Nuno Sá 2020-04-13  395  }
fff7352bf7a3ce Nuno Sá 2020-04-13  396  
fff7352bf7a3ce Nuno Sá 2020-04-13  397  static int adis16475_set_filter(struct adis16475 *st, const u32 filter)
fff7352bf7a3ce Nuno Sá 2020-04-13  398  {
fff7352bf7a3ce Nuno Sá 2020-04-13  399  	int i = ARRAY_SIZE(adis16475_3db_freqs);
fff7352bf7a3ce Nuno Sá 2020-04-13  400  	int ret;
fff7352bf7a3ce Nuno Sá 2020-04-13  401  
fff7352bf7a3ce Nuno Sá 2020-04-13  402  	while (--i) {
fff7352bf7a3ce Nuno Sá 2020-04-13  403  		if (adis16475_3db_freqs[i] >= filter)
fff7352bf7a3ce Nuno Sá 2020-04-13  404  			break;
fff7352bf7a3ce Nuno Sá 2020-04-13  405  	}
fff7352bf7a3ce Nuno Sá 2020-04-13  406  
fff7352bf7a3ce Nuno Sá 2020-04-13  407  	ret = adis_write_reg_16(&st->adis, ADIS16475_REG_FILT_CTRL,
fff7352bf7a3ce Nuno Sá 2020-04-13  408  				ADIS16475_FILT_CTRL(i));
fff7352bf7a3ce Nuno Sá 2020-04-13  409  	if (ret)
fff7352bf7a3ce Nuno Sá 2020-04-13  410  		return ret;
fff7352bf7a3ce Nuno Sá 2020-04-13  411  
fff7352bf7a3ce Nuno Sá 2020-04-13  412  	/*
fff7352bf7a3ce Nuno Sá 2020-04-13  413  	 * If FIR is used, then gyro and accel data will have meaningful
fff7352bf7a3ce Nuno Sá 2020-04-13  414  	 * bits on the LSB registers. This info is used on the trigger handler.
fff7352bf7a3ce Nuno Sá 2020-04-13  415  	 */
fff7352bf7a3ce Nuno Sá 2020-04-13 @416  	assign_bit(ADIS16475_LSB_FIR_MASK, &st->lsb_flag, i);
fff7352bf7a3ce Nuno Sá 2020-04-13  417  
fff7352bf7a3ce Nuno Sá 2020-04-13  418  	return 0;
fff7352bf7a3ce Nuno Sá 2020-04-13  419  }
fff7352bf7a3ce Nuno Sá 2020-04-13  420  

:::::: The code at line 363 was first introduced by commit
:::::: fff7352bf7a3ceb2bda2479a4b212101b065209d iio: imu: Add support for adis16475

:::::: TO: Nuno Sá <nuno.sa@analog.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
