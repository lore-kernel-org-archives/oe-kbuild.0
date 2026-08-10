Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F48B31DDBB
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Aug 2026 11:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362481; cv=none; b=P7jCpKaQtrA0oZRPmhcxoK26WeS60oejumETJkngn++nV5DkpGdY+fzC+R5lN6MVgjux4/23aqV/8i5T3BmwSolGIDbfKt5NJzHdyyfuRb3WSRkgEpzTWF0Hoxlq01gA+u20VAGI+VLdfZnZfDSBM1gukllUvGMGEYY4z8mv2x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362481; c=relaxed/simple;
	bh=anrssFtSiTSmngOLY2a200fxJI9aA10UOpHn3cLmtfM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YrUkbMsDtJkXxIqWPm7mSZWvzR9zTNAqobIgbFd6FWzUTbFntg+kAFApnWoFWJgpvgEsHzYvC6R12RhqHouGIQdJatVxyC4qV8g+vOLPa/53N4A0rO29RPdF5QjbeBW9WGp01uDRl4VDpaXyhP/1+RktEWJcuQRx8ATqpOsT848=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ix/YMgW+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ix/YMgW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786362479; x=1817898479;
  h=date:from:to:cc:subject:message-id;
  bh=anrssFtSiTSmngOLY2a200fxJI9aA10UOpHn3cLmtfM=;
  b=Ix/YMgW+PosQpzPkUl1+qR8+2rq4frwXvid2wEFm/Erd6D5CowZ+nLQ3
   1cBoL413/Gq9+gL2cXhtXo1CVQmVeauBlgIklsmswql58W4/SQlT4XYpx
   hdAO4XdAzilFqEcK/JpVKUcpR6succ4Wyk5d95mEv2EhIyE39IbHMoEAP
   pJmOD+ySOron8o4k4nlQBRfm8CHYLWQTQO1J8iISb8rcsdkfmWSLKgFtq
   cdnTi8sTZBAK1c2P/OqEzw6Y3WBNLhm5SflZzJ2g/qKJm36Uwp8A1gwEp
   rZ/znQkfXPHU/gvSHUdVA5vnQ4+MUAcq1BgBqeoKDm/AwmroHEpj4utzs
   Q==;
X-CSE-ConnectionGUID: csv2XtGNTSGxe+ld8BLTIA==
X-CSE-MsgGUID: qrYdqhZUSyyUSZcNaUV4xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86950150"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="86950150"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 04:47:58 -0700
X-CSE-ConnectionGUID: h6JQesTfQXuHx5mCjpxzyw==
X-CSE-MsgGUID: Zi/Xtq5oQGKQFxSpRvfZ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="265003469"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Aug 2026 04:47:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtOTy-00000000NBm-0Ko0;
	Mon, 10 Aug 2026 11:47:54 +0000
Date: Mon, 10 Aug 2026 19:47:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1397/13846]
 drivers/iio/magnetometer/qmc5883l.c:377:8: error: call to
 '__compiletime_assert_536' declared with 'error' attribute: FIELD_PREP: value
 too large for the field
Message-ID: <202608101921.ty6xxVvq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Siratul Islam <siratul.islam@linux.dev>
CC: Jonathan Cameron <jic23@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6b8c8af514d739d0335f5579b585e02babe8a727
commit: e8349f9473423fdd357da33eec628d5ea9c555f5 [1397/13846] iio: magnetometer: add driver for QST QMC5883L Sensor
:::::: branch date: 3 days ago
:::::: commit date: 6 weeks ago
config: s390-randconfig-r051-20260810 (https://download.01.org/0day-ci/archive/20260810/202608101921.ty6xxVvq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608101921.ty6xxVvq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608101921.ty6xxVvq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/magnetometer/qmc5883l.c:377:8: error: call to '__compiletime_assert_536' declared with 'error' attribute: FIELD_PREP: value too large for the field
     377 |                             FIELD_PREP(QMC5883L_OSR_MASK, data->osr));
         |                             ^
   include/linux/bitfield.h:138:3: note: expanded from macro 'FIELD_PREP'
     138 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                 ^
   include/linux/bitfield.h:91:3: note: expanded from macro '__FIELD_PREP'
      91 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
         |                 ^
   include/linux/bitfield.h:70:3: note: expanded from macro '__BF_FIELD_CHECK_MASK'
      70 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:18:1: note: expanded from here
      18 | __compiletime_assert_536
         | ^
   1 error generated.


vim +377 drivers/iio/magnetometer/qmc5883l.c

e8349f9473423f Siratul Islam 2026-06-19  337  
e8349f9473423f Siratul Islam 2026-06-19  338  static int qmc5883l_init(struct qmc5883l_data *data)
e8349f9473423f Siratul Islam 2026-06-19  339  {
e8349f9473423f Siratul Islam 2026-06-19  340  	struct regmap *map = data->regmap;
e8349f9473423f Siratul Islam 2026-06-19  341  	unsigned int reg;
e8349f9473423f Siratul Islam 2026-06-19  342  	int ret;
e8349f9473423f Siratul Islam 2026-06-19  343  
e8349f9473423f Siratul Islam 2026-06-19  344  	ret = regmap_read(map, QMC5883L_REG_ID, &reg);
e8349f9473423f Siratul Islam 2026-06-19  345  	if (ret)
e8349f9473423f Siratul Islam 2026-06-19  346  		return ret;
e8349f9473423f Siratul Islam 2026-06-19  347  
e8349f9473423f Siratul Islam 2026-06-19  348  	/* Not failing because rev 1.0 had this register reserved */
e8349f9473423f Siratul Islam 2026-06-19  349  	if (reg != QMC5883L_CHIP_ID)
e8349f9473423f Siratul Islam 2026-06-19  350  		dev_warn(regmap_get_device(map),
e8349f9473423f Siratul Islam 2026-06-19  351  			 "Unknown chip id: 0x%02x, continuing\n", reg);
e8349f9473423f Siratul Islam 2026-06-19  352  
e8349f9473423f Siratul Islam 2026-06-19  353  	ret = regmap_write(map, QMC5883L_REG_CTRL2, QMC5883L_SOFT_RESET);
e8349f9473423f Siratul Islam 2026-06-19  354  	if (ret)
e8349f9473423f Siratul Islam 2026-06-19  355  		return ret;
e8349f9473423f Siratul Islam 2026-06-19  356  
e8349f9473423f Siratul Islam 2026-06-19  357  	/* Use POR completion time as a conservative bound */
e8349f9473423f Siratul Islam 2026-06-19  358  	fsleep(QMC5883L_PORT_US);
e8349f9473423f Siratul Islam 2026-06-19  359  
e8349f9473423f Siratul Islam 2026-06-19  360  	/* DRDY pin not used in this version of the driver */
e8349f9473423f Siratul Islam 2026-06-19  361  	ret = regmap_write(map, QMC5883L_REG_CTRL2, QMC5883L_INT_DISABLE);
e8349f9473423f Siratul Islam 2026-06-19  362  	if (ret)
e8349f9473423f Siratul Islam 2026-06-19  363  		return ret;
e8349f9473423f Siratul Islam 2026-06-19  364  
e8349f9473423f Siratul Islam 2026-06-19  365  	ret = regmap_write(map, QMC5883L_REG_SET_RESET, QMC5883L_SET_RESET_VAL);
e8349f9473423f Siratul Islam 2026-06-19  366  	if (ret)
e8349f9473423f Siratul Islam 2026-06-19  367  		return ret;
e8349f9473423f Siratul Islam 2026-06-19  368  
e8349f9473423f Siratul Islam 2026-06-19  369  	data->odr = QMC5883L_ODR_50HZ;
e8349f9473423f Siratul Islam 2026-06-19  370  	data->range = QMC5883L_RNG_2G;
e8349f9473423f Siratul Islam 2026-06-19  371  	data->osr = QMC5883L_OSR_64;
e8349f9473423f Siratul Islam 2026-06-19  372  
e8349f9473423f Siratul Islam 2026-06-19  373  	return regmap_write(map, QMC5883L_REG_CTRL1,
e8349f9473423f Siratul Islam 2026-06-19  374  			    FIELD_PREP(QMC5883L_MODE_MASK, QMC5883L_MODE_CONT) |
e8349f9473423f Siratul Islam 2026-06-19  375  			    FIELD_PREP(QMC5883L_ODR_MASK, data->odr) |
e8349f9473423f Siratul Islam 2026-06-19  376  			    FIELD_PREP(QMC5883L_RNG_MASK, data->range) |
e8349f9473423f Siratul Islam 2026-06-19 @377  			    FIELD_PREP(QMC5883L_OSR_MASK, data->osr));
e8349f9473423f Siratul Islam 2026-06-19  378  }
e8349f9473423f Siratul Islam 2026-06-19  379  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
