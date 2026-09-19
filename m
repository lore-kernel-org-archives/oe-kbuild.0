Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C054375AAB
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Sep 2026 21:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853336; cv=none; b=Dyxr8jrtn1aOG6wS0dPdYH+hwOmX1hT2Xd7HmAG3rGca+bh5rk/cAwwwwpMDiz/sy+/+YSLvZtPL6QMSZoPYHwnbcMVtWl0loFE3JEeyRCGD9ba+IdNpWpoTu6VZUT9YY5KOfDUHIWyqKOkgi9NmGSrfmbvztTGOGM02/Chwc6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853336; c=relaxed/simple;
	bh=kIUpSxlWBtwUl8HGWe7i81QghGnn+nzZ9W2AbO256+g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lMvygdc9834jFjv83caMLUSBkmAYVAml2ReihNfl4GWI0S2JjUuu5ahWbsxXZ/v9psMFhGflIcr+xCqPXqEQ7Q7u1WaUlqhqrPHG948NUBvRlWSpy9DRcYgacH35aVRXQ/5P9D5+/Q793HuEWAar1Ox0CBnoA/oHMrwkVJB2zvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtOOiJEu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtOOiJEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789853331; x=1821389331;
  h=date:from:to:cc:subject:message-id;
  bh=kIUpSxlWBtwUl8HGWe7i81QghGnn+nzZ9W2AbO256+g=;
  b=mtOOiJEucRMiQAbJdxX7eNZxOyhzPFLSglSbpYJoKnq6VMoT77srWBlP
   e0YhCg9XYPVJcEBCbCa3PC3rg5KBv2AsBfc/0z8OVN3MjK8Di/C05N6LH
   OKbj+KYmEzDAhw3Lgyj7S2D4dAl4oPI6un/KZjpfkVIcL8T2D32GNF6sq
   VBkeWMlGVuCsXoPX6Uygzc+bMb3MVz1rlsduVeUCjT3zcV4vp9rjqnrmg
   XIHpSop1+ZXOArbqn06WKymC2l9YKpOUxbbAvZxo+IxbaYprjbYEy9In1
   pKXoMOawt2oW2sjgwI0ecW6oLTFD4QXpxbmKrVo+TpM/UClmi9vzV7zkH
   g==;
X-CSE-ConnectionGUID: /UVmGvNrRcydaYyyCY+bEQ==
X-CSE-MsgGUID: Fyb0hOFRSgm5MfJ1pAZCpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="101035604"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="101035604"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 14:28:51 -0700
X-CSE-ConnectionGUID: FqgiuFLoSDiEN5xY8sIGdQ==
X-CSE-MsgGUID: QlYcRIBUSUqX+LxJAP4e1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="280115146"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Sep 2026 14:28:49 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x82bz-00000000BOg-42vF;
	Sat, 19 Sep 2026 21:28:43 +0000
Date: Sun, 20 Sep 2026 05:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/magnetometer/qmc5883l.c:377:8: error: call to
 '__compiletime_assert_550' declared with 'error' attribute: FIELD_PREP: value
 too large for the field
Message-ID: <202609200507.P4xzgH2G-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Siratul Islam <siratul.islam@linux.dev>
CC: Jonathan Cameron <jic23@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>

Hi Siratul,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: e8349f9473423fdd357da33eec628d5ea9c555f5 iio: magnetometer: add driver for QST QMC5883L Sensor
date:   3 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 3 months ago
config: s390-randconfig-r1300-20260920 (https://download.01.org/0day-ci/archive/20260920/202609200507.P4xzgH2G-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 05d706e9a816dbf9eff31f47869f53d6fe796089)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609200507.P4xzgH2G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e8349f947342 ("iio: magnetometer: add driver for QST QMC5883L Sensor")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609200507.P4xzgH2G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/magnetometer/qmc5883l.c:377:8: error: call to '__compiletime_assert_550' declared with 'error' attribute: FIELD_PREP: value too large for the field
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
   <scratch space>:22:1: note: expanded from here
      22 | __compiletime_assert_550
         | ^
   drivers/iio/magnetometer/qmc5883l.c:377:8: note: called by function 'qmc5883l_init'
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
   <scratch space>:22:1: note: expanded from here
      22 | __compiletime_assert_550
         | ^
   drivers/iio/magnetometer/qmc5883l.c:377:8: note: inlined by function 'qmc5883l_probe'
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
   <scratch space>:22:1: note: expanded from here
      22 | __compiletime_assert_550
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
