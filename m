Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459DF30F55B
	for <oe-kbuild@lists.linux.dev>; Tue, 19 May 2026 02:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156803; cv=none; b=rE/SaexW2p/wGnL6vAyTW+41fVFckbK15ixGLu+ETSjAH8l8mT9Zqkg1tAZhsvHlFEzFqeXY8lZGZw/Op9d3q5o+QX4s7DwczSljYdCAHyAqoOHVN3R/DRF9BM5TbDi9asE+HdQu/kpHZnwwv1QeCyIn4X3cKb50ZwaXAXnUs/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156803; c=relaxed/simple;
	bh=cpa5LYMDCRmfDdi6uVfiyCFJvOr6ruXEwGgcAfvujCY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZD/aj2heEX4LEyQfTTqI5+90IfDXKHSRm8lT1FroybZH6oHFr/AA8o98UmAx0dwTO9pKfRqrpj0WnAcCmv4ouIpJvlHbRWuuu7m1DjO6GtXpxsdnLzgLmi7kN8ybrAC0edMS1R+cw9unF1MBYuCBm8liskPyinlL3Rs1YrAQEmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzRjzSPs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzRjzSPs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779156801; x=1810692801;
  h=date:from:to:cc:subject:message-id;
  bh=cpa5LYMDCRmfDdi6uVfiyCFJvOr6ruXEwGgcAfvujCY=;
  b=dzRjzSPsAHXwuDkDOSq8SLroqPFQwo4AAoTmhfKIRDsz7cFbCXEgD+VS
   rBuM0yBRBDRrnR/VEsAVTSLqRVYWfe6GvY0HF/++sY5C83+UwYMuburU2
   7KgQHgBI0ZOEKp+3J2blugtECSjYmtI0n/RrnT0vJYEwErZerc984ql0u
   9oy9A/O/qQSoevZf7WvH4LNWBiFhG2/cnkLP+QcQcnBi2lYDHGqLaMPlR
   LQovTEudL8fXDKH8t0TFmjX9BFfbhZBVq1BGPdFpPKh1YF6JqADCYfoCN
   a+IO9UKyU7m850AmLFgQQ7u+k9/eY1IMbL/lBk2WPkUoVpg81nMYjcLXr
   A==;
X-CSE-ConnectionGUID: 8B2oZmWvRbmsWsf4Bv3NNQ==
X-CSE-MsgGUID: nwlgy/Z7TYiAEI2vkdQ7Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="83881118"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="83881118"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:13:20 -0700
X-CSE-ConnectionGUID: kiouhb/ZRr6liVkzohj8Xw==
X-CSE-MsgGUID: Q8jUD2ZKRYu+/ycxE5fqHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="241449551"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 May 2026 19:13:19 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP9xN-000000000Bv-2UuN;
	Tue, 19 May 2026 02:13:17 +0000
Date: Tue, 19 May 2026 07:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/adc/ltc2378.c:198:3: warning: label followed by
 a declaration is a C23 extension
Message-ID: <202605190604.ytfmymUX-lkp@intel.com>
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
date:   7 hours ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260519/202605190604.ytfmymUX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190604.ytfmymUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605190604.ytfmymUX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/ltc2378.c:198:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     198 |                 IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
         |                 ^
   include/linux/iio/iio.h:810:2: note: expanded from macro 'IIO_DEV_ACQUIRE_DIRECT_MODE'
     810 |         ACQUIRE(__priv__iio_dev_mode_lock_try_direct, claim)(dev)
         |         ^
   include/linux/cleanup.h:428:34: note: expanded from macro 'ACQUIRE'
     428 | #define ACQUIRE(_name, _var)     CLASS(_name, _var)
         |                                  ^
   include/linux/cleanup.h:302:2: note: expanded from macro 'CLASS'
     302 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:117:1: note: expanded from here
     117 | class___priv__iio_dev_mode_lock_try_direct_t
         | ^
   drivers/iio/adc/ltc2378.c:223:2: error: cannot jump from switch statement to this case label
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
   1 warning and 2 errors generated.


vim +198 drivers/iio/adc/ltc2378.c

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
3266f00501fdd9 Marcelo Schmitt 2026-05-18 @198  		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
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
3266f00501fdd9 Marcelo Schmitt 2026-05-18  223  	default:
3266f00501fdd9 Marcelo Schmitt 2026-05-18  224  		return -EINVAL;
3266f00501fdd9 Marcelo Schmitt 2026-05-18  225  	}
3266f00501fdd9 Marcelo Schmitt 2026-05-18  226  }
3266f00501fdd9 Marcelo Schmitt 2026-05-18  227  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
