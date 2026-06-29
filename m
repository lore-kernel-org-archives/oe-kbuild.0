Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DBA34F247
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jun 2026 11:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732761; cv=none; b=ls2g/yh37ctslG/jA0zNQuSoLfXpKUAyNU072lbktryp23rL8/z0n4fEMT5rr5j8RmF/g7Dmjt8M4OQ8KTb3marQyxhvbRuIw9kcZvK9jJGDbTSXB7Cr8QsxA9tbjjjLcxkDhRe13w6CM4nW7nIaO4Txf794frKr7BaxBhymB1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732761; c=relaxed/simple;
	bh=j0RvCDZ5TWOqH3Bppt4xzI7c2Pw4GPi4I/xXj2B7JSM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MjdbaexoA+6+hw021EzhYKOQNUvzAk5XgCEFif9xgyC0Rv9fydNKZpQCEqzri4sBIaeLJF+fL9eNVlofqEaFVkqknZwYrAFwxfKGlObEuZvc4SOMHXO289KavoI5IYJsrShnjHa6SCWtEzsOlYPnBSAv+KyMe9ovlAfjJM9Yqh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmdK3W95; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmdK3W95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782732760; x=1814268760;
  h=date:from:to:cc:subject:message-id;
  bh=j0RvCDZ5TWOqH3Bppt4xzI7c2Pw4GPi4I/xXj2B7JSM=;
  b=lmdK3W955CbiTF2C37YXTxQ0d5WqQ3DbCZmLNk6g5TeX6Lumnyz1IbNi
   HfFvsheKeCS4Mv7pG0xZlqY52PDm0/9IHoSiHGawkx4138LYaS2uwjMRn
   kAqF0/N3d72qhidZ6noN45A02dkalj3/P6Mct/TVk20fBjJbJ8hAzkrjB
   0zc8i0y97ZjZCmqGrzyKHDg1frmaYf6GV6bp2v8ctnajhtCSxHf4QoNTu
   NY/2d55x0I50TtZykDwiCwhz/whQtfU5nTdMz2CrxYl6m27S+9kaj0SOc
   VlABdYl3Ui5ue4FdcEdfo9xkpONpqKFGlJgjfO77n+6MxU3aff1P0vNeC
   w==;
X-CSE-ConnectionGUID: A3TRTHbaROiv9kXq1MXZNA==
X-CSE-MsgGUID: iGYwt5liSSWe4czR7wjiaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94906934"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="94906934"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:32:40 -0700
X-CSE-ConnectionGUID: o+EY6GDlQc69OuhWWkO3bQ==
X-CSE-MsgGUID: fQp1QSHHQD6t1zCqjwxJfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="282015236"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Jun 2026 04:32:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weAE8-000000007Ll-11TR;
	Mon, 29 Jun 2026 11:32:36 +0000
Date: Mon, 29 Jun 2026 19:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jic23-iio:testing 61/62]
 drivers/iio/magnetometer/qmc5883l.c:377:8: error: call to
 '__compiletime_assert_418' declared with 'error' attribute: FIELD_PREP: value
 too large for the field
Message-ID: <202606291921.3c6V4WI1-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   7667a80340e99fd45357d0c90ae05813b01bbfef
commit: f286dad7a16cc4c3dc1672f1d648156ca5f6b637 [61/62] iio: magnetometer: add driver for QST QMC5883L Sensor
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: um-randconfig-r111-20260629 (https://download.01.org/0day-ci/archive/20260629/202606291921.3c6V4WI1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291921.3c6V4WI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606291921.3c6V4WI1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/magnetometer/qmc5883l.c:377:8: error: call to '__compiletime_assert_418' declared with 'error' attribute: FIELD_PREP: value too large for the field
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
      18 | __compiletime_assert_418
         | ^
   1 error generated.


vim +377 drivers/iio/magnetometer/qmc5883l.c

f286dad7a16cc4c Siratul Islam 2026-06-19  337  
f286dad7a16cc4c Siratul Islam 2026-06-19  338  static int qmc5883l_init(struct qmc5883l_data *data)
f286dad7a16cc4c Siratul Islam 2026-06-19  339  {
f286dad7a16cc4c Siratul Islam 2026-06-19  340  	struct regmap *map = data->regmap;
f286dad7a16cc4c Siratul Islam 2026-06-19  341  	unsigned int reg;
f286dad7a16cc4c Siratul Islam 2026-06-19  342  	int ret;
f286dad7a16cc4c Siratul Islam 2026-06-19  343  
f286dad7a16cc4c Siratul Islam 2026-06-19  344  	ret = regmap_read(map, QMC5883L_REG_ID, &reg);
f286dad7a16cc4c Siratul Islam 2026-06-19  345  	if (ret)
f286dad7a16cc4c Siratul Islam 2026-06-19  346  		return ret;
f286dad7a16cc4c Siratul Islam 2026-06-19  347  
f286dad7a16cc4c Siratul Islam 2026-06-19  348  	/* Not failing because rev 1.0 had this register reserved */
f286dad7a16cc4c Siratul Islam 2026-06-19  349  	if (reg != QMC5883L_CHIP_ID)
f286dad7a16cc4c Siratul Islam 2026-06-19  350  		dev_warn(regmap_get_device(map),
f286dad7a16cc4c Siratul Islam 2026-06-19  351  			 "Unknown chip id: 0x%02x, continuing\n", reg);
f286dad7a16cc4c Siratul Islam 2026-06-19  352  
f286dad7a16cc4c Siratul Islam 2026-06-19  353  	ret = regmap_write(map, QMC5883L_REG_CTRL2, QMC5883L_SOFT_RESET);
f286dad7a16cc4c Siratul Islam 2026-06-19  354  	if (ret)
f286dad7a16cc4c Siratul Islam 2026-06-19  355  		return ret;
f286dad7a16cc4c Siratul Islam 2026-06-19  356  
f286dad7a16cc4c Siratul Islam 2026-06-19  357  	/* Use POR completion time as a conservative bound */
f286dad7a16cc4c Siratul Islam 2026-06-19  358  	fsleep(QMC5883L_PORT_US);
f286dad7a16cc4c Siratul Islam 2026-06-19  359  
f286dad7a16cc4c Siratul Islam 2026-06-19  360  	/* DRDY pin not used in this version of the driver */
f286dad7a16cc4c Siratul Islam 2026-06-19  361  	ret = regmap_write(map, QMC5883L_REG_CTRL2, QMC5883L_INT_DISABLE);
f286dad7a16cc4c Siratul Islam 2026-06-19  362  	if (ret)
f286dad7a16cc4c Siratul Islam 2026-06-19  363  		return ret;
f286dad7a16cc4c Siratul Islam 2026-06-19  364  
f286dad7a16cc4c Siratul Islam 2026-06-19  365  	ret = regmap_write(map, QMC5883L_REG_SET_RESET, QMC5883L_SET_RESET_VAL);
f286dad7a16cc4c Siratul Islam 2026-06-19  366  	if (ret)
f286dad7a16cc4c Siratul Islam 2026-06-19  367  		return ret;
f286dad7a16cc4c Siratul Islam 2026-06-19  368  
f286dad7a16cc4c Siratul Islam 2026-06-19  369  	data->odr = QMC5883L_ODR_50HZ;
f286dad7a16cc4c Siratul Islam 2026-06-19  370  	data->range = QMC5883L_RNG_2G;
f286dad7a16cc4c Siratul Islam 2026-06-19  371  	data->osr = QMC5883L_OSR_64;
f286dad7a16cc4c Siratul Islam 2026-06-19  372  
f286dad7a16cc4c Siratul Islam 2026-06-19  373  	return regmap_write(map, QMC5883L_REG_CTRL1,
f286dad7a16cc4c Siratul Islam 2026-06-19  374  			    FIELD_PREP(QMC5883L_MODE_MASK, QMC5883L_MODE_CONT) |
f286dad7a16cc4c Siratul Islam 2026-06-19  375  			    FIELD_PREP(QMC5883L_ODR_MASK, data->odr) |
f286dad7a16cc4c Siratul Islam 2026-06-19  376  			    FIELD_PREP(QMC5883L_RNG_MASK, data->range) |
f286dad7a16cc4c Siratul Islam 2026-06-19 @377  			    FIELD_PREP(QMC5883L_OSR_MASK, data->osr));
f286dad7a16cc4c Siratul Islam 2026-06-19  378  }
f286dad7a16cc4c Siratul Islam 2026-06-19  379  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
