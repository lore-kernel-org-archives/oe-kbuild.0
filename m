Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A6630566E
	for <oe-kbuild@lists.linux.dev>; Tue, 19 May 2026 02:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156804; cv=none; b=SOtXCbc85YgJbSt2cYE3AyqcZOxDDEXMQTQ9kpYL0IExE/c5vyfzu80ZyTpEaP820XnKHf4YXGYoKBL+DULcSzN/+W5ounNk+B7UPTV5dHfp8qiIOGTFcUXKJ7iZAIGjhJW79rBEDSxnTSSVLEMcx4hdCSz+FiZBVh3AzZnzY4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156804; c=relaxed/simple;
	bh=jZHiCHb4QwzFIBbPEOeArb4t/C7VFaKI7N0+sxwZVeU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qdszEOjMvHxEkkU4SDjCY2bl5taUDUTByFwJrdVpF4wSTppN4Zo9K16pXp5uZyW58z7dMRx26gltvWHo9USoIz56mOlIxgdqdctlHqnXuW8dp52Zs+1BlIjhkuQO4winOZ+L/ORsJxRoExJcoZdgO4KbX1VbGtpe66AZSVFxDPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgPhnOeG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgPhnOeG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779156803; x=1810692803;
  h=date:from:to:cc:subject:message-id;
  bh=jZHiCHb4QwzFIBbPEOeArb4t/C7VFaKI7N0+sxwZVeU=;
  b=cgPhnOeGvgB3Y+J0rCf4+P9ITzOfB6FcvW7jgd+yExXPh6RdGzqRwmgQ
   rDI0IXIPKI+bk8UQMkCNBk6z+CnE+9pNHbOUjE3b+4ZH/Rh2Jbp/HwVqA
   r0zCOxw3Y0gwIUVUesLw+00eIQgFSOvXlho0xbAwz8NrJHYfBximclSRq
   ZADKgOH+3uVpQ35X40pVGP5y6DMMbA2PXBNCBJr2W3dLbsLjFHni76cx5
   KA0vpnMgjYMTAMzn6Pfnf5cVijRSWoprTQbTD0690FY8rMxucE3j2D0Uj
   n6CjgWnv44Xw0hbXhhM2W4T9asq7572R+gF4NqQAwIsm7sz7kXTwQ4quS
   w==;
X-CSE-ConnectionGUID: JVlzLHG9S4uR0M1eyDx09A==
X-CSE-MsgGUID: PsJSAo+pTJ2ffTkudppftQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="83881119"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="83881119"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:13:20 -0700
X-CSE-ConnectionGUID: EVGIb+p5TPGl7Z6nbxzUqw==
X-CSE-MsgGUID: LVH2JurARZue8oFb9vEA8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="241449555"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 May 2026 19:13:20 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP9xN-000000000By-2iLb;
	Tue, 19 May 2026 02:13:17 +0000
Date: Tue, 19 May 2026 06:42:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/adc/ltc2378.c:223:2: error: cannot jump from
 switch statement to this case label
Message-ID: <202605190541.kPloFBhI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Marcelo-Schmitt/dt-bindings-iio-adc-Add-ltc2378/20260518-233524, commit: 3266f00501fdd976a17d613c69b8f0b1864193ef"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Marcelo Schmitt <marcelo.schmitt@analog.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Marcelo-Schmitt/dt-bindings-iio-adc-Add-ltc2378/20260518-233524
head:   20a75e38a709a82b7ee172859fe1eadab6b55595
commit: 3266f00501fdd976a17d613c69b8f0b1864193ef iio: adc: Add support for LTC2378-20 and similar ADCs
date:   6 hours ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260519/202605190541.kPloFBhI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190541.kPloFBhI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605190541.kPloFBhI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/adc/ltc2378.c:223:2: error: cannot jump from switch statement to this case label
     223 |         default:
         |         ^
   drivers/iio/adc/ltc2378.c:198:42: note: jump bypasses initialization of variable with __attribute__((cleanup))
     198 |                 IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
         |                                                        ^
   drivers/iio/adc/ltc2378.c:208:2: error: cannot jump from switch statement to this case label
     208 |         case IIO_CHAN_INFO_SCALE:
         |         ^
   drivers/iio/adc/ltc2378.c:198:42: note: jump bypasses initialization of variable with __attribute__((cleanup))
     198 |                 IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
         |                                                        ^
   2 errors generated.


vim +223 drivers/iio/adc/ltc2378.c

3266f00501fdd9 Marcelo Schmitt 2026-05-18  188  
3266f00501fdd9 Marcelo Schmitt 2026-05-18  189  static int ltc2378_read_raw(struct iio_dev *indio_dev,
3266f00501fdd9 Marcelo Schmitt 2026-05-18  190  			    const struct iio_chan_spec *chan,
3266f00501fdd9 Marcelo Schmitt 2026-05-18  191  			int *val, int *val2, long info)
3266f00501fdd9 Marcelo Schmitt 2026-05-18  192  {
3266f00501fdd9 Marcelo Schmitt 2026-05-18  193  	struct ltc2378_state *st = iio_priv(indio_dev);
3266f00501fdd9 Marcelo Schmitt 2026-05-18  194  	int ret;
3266f00501fdd9 Marcelo Schmitt 2026-05-18  195  
3266f00501fdd9 Marcelo Schmitt 2026-05-18  196  	switch (info) {
3266f00501fdd9 Marcelo Schmitt 2026-05-18  197  	case IIO_CHAN_INFO_RAW:
3266f00501fdd9 Marcelo Schmitt 2026-05-18  198  		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
3266f00501fdd9 Marcelo Schmitt 2026-05-18  199  		if (IIO_DEV_ACQUIRE_FAILED(claim))
3266f00501fdd9 Marcelo Schmitt 2026-05-18  200  			return -EBUSY;
3266f00501fdd9 Marcelo Schmitt 2026-05-18  201  
3266f00501fdd9 Marcelo Schmitt 2026-05-18  202  		ret = ltc2378_channel_single_read(chan, st, val);
3266f00501fdd9 Marcelo Schmitt 2026-05-18  203  		if (ret)
3266f00501fdd9 Marcelo Schmitt 2026-05-18  204  			return ret;
3266f00501fdd9 Marcelo Schmitt 2026-05-18  205  
3266f00501fdd9 Marcelo Schmitt 2026-05-18  206  		return IIO_VAL_INT;
3266f00501fdd9 Marcelo Schmitt 2026-05-18  207  
3266f00501fdd9 Marcelo Schmitt 2026-05-18  208  	case IIO_CHAN_INFO_SCALE:
3266f00501fdd9 Marcelo Schmitt 2026-05-18  209  		*val = st->ref_uV / MILLI;
3266f00501fdd9 Marcelo Schmitt 2026-05-18  210  		/*
3266f00501fdd9 Marcelo Schmitt 2026-05-18  211  		 * For all LTC2378-like devices, the amount of bits that express
3266f00501fdd9 Marcelo Schmitt 2026-05-18  212  		 * voltage magnitude depend on the output code format:
3266f00501fdd9 Marcelo Schmitt 2026-05-18  213  		 * - straight binary: All precision/resolution bits are used.
3266f00501fdd9 Marcelo Schmitt 2026-05-18  214  		 * - 2's complement: One of the precision bits is used for sign.
3266f00501fdd9 Marcelo Schmitt 2026-05-18  215  		 */
3266f00501fdd9 Marcelo Schmitt 2026-05-18  216  		if (st->info->out_format == IIO_SCAN_FORMAT_SIGNED_INT)
3266f00501fdd9 Marcelo Schmitt 2026-05-18  217  			*val2 = st->info->resolution - 1;
3266f00501fdd9 Marcelo Schmitt 2026-05-18  218  		else
3266f00501fdd9 Marcelo Schmitt 2026-05-18  219  			*val2 = st->info->resolution;
3266f00501fdd9 Marcelo Schmitt 2026-05-18  220  
3266f00501fdd9 Marcelo Schmitt 2026-05-18  221  		return IIO_VAL_FRACTIONAL_LOG2;
3266f00501fdd9 Marcelo Schmitt 2026-05-18  222  
3266f00501fdd9 Marcelo Schmitt 2026-05-18 @223  	default:
3266f00501fdd9 Marcelo Schmitt 2026-05-18  224  		return -EINVAL;
3266f00501fdd9 Marcelo Schmitt 2026-05-18  225  	}
3266f00501fdd9 Marcelo Schmitt 2026-05-18  226  }
3266f00501fdd9 Marcelo Schmitt 2026-05-18  227  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
