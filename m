Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D504B1E50E
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 06:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758868355; cv=none; b=ahNUEKoEZdwvmywaksB8YIw8yTSMLj8Lk/WNmk9T5lwXTUGlBEdDOyrGU3fmtQo36mDiOqnLREhKyFXB+zeFXlSjBlW3jfMOS8bcFiQPTuK0mA/NL8veww0dnAYLzD17TCRULtCwOMdUhCd+QWij9unSuFn5esnoYKm03AM9e/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758868355; c=relaxed/simple;
	bh=MW7rX5xSyUe44f/KPLcEJ44zBG1XYq9U+PrUOn1h7mc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jiGV4imxB58npi+3Q/p+gKo21g4qh2QGsTz+wBRGMMAQKumJqZTF4s1BXXQvRVhynQz4vQivr+k5DetWZg1SyTD4paP+1PMF5AelQK46kLfYYtea6ll6blILEzUboXgBqCJ3IV2j3HDizLNlLr62j6MlSjMy6Qyrvdoc7rIKSDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtLAyEwQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtLAyEwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758868352; x=1790404352;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MW7rX5xSyUe44f/KPLcEJ44zBG1XYq9U+PrUOn1h7mc=;
  b=YtLAyEwQJzndC4bRp4o5mX6g7JztIx8Qd8MUzOz3PMDf/MHbGCh+rSep
   E5X3xydb2OqlQ2OBDJQY/T1xiLsHHhF++JXFMmSqFx9zluGKnbr5f8baB
   m/1bMAHDh6gPfEPNgG9XhpjW7o9TJ9yzts0Otc9HcjtdkXqUImdYbtptB
   fuQqwDGPqjZCwVBqNaPDLyCafFpKUkgR/VOodAlkK4hr4LRW6Xsn5/5Rn
   a14Jn6QA1KDveV7taOXlbrEE1nGdX8KMMt+BcAHGO+utTiP1YBB+XiodO
   C3vRiYg9S7DMht7Ydpz0e+yBIjcYBl12+C6ZL9T0bFPafB5FEixIIcHQd
   g==;
X-CSE-ConnectionGUID: 7mcTihWBSlerrgeG7iKRGA==
X-CSE-MsgGUID: 27f+LvVWT06FWIoTzVw9FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="60896317"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="60896317"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 23:32:32 -0700
X-CSE-ConnectionGUID: o1oieMFSTu+kWGI1ol0nHw==
X-CSE-MsgGUID: XcetM4VcQHiVzmiY8WiWuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="181919220"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2025 23:32:31 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v220K-0005yH-23;
	Fri, 26 Sep 2025 06:32:28 +0000
Date: Fri, 26 Sep 2025 14:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11909/12395] drivers/hwmon/pmbus/mp2925.c:159
 mp2925_write_word_data() error: uninitialized symbol 'ret'.
Message-ID: <202509261419.gEaY1lha-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Wensheng Wang <wenswang@yeah.net>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
commit: b3a4efc88601cb5fc97b4ae23c478700a60302da [11909/12395] hwmon: add MP2925 and MP2929 driver
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r073-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261419.gEaY1lha-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509261419.gEaY1lha-lkp@intel.com/

smatch warnings:
drivers/hwmon/pmbus/mp2925.c:159 mp2925_write_word_data() error: uninitialized symbol 'ret'.

vim +/ret +159 drivers/hwmon/pmbus/mp2925.c

b3a4efc88601cb Wensheng Wang 2025-09-18  133  
b3a4efc88601cb Wensheng Wang 2025-09-18  134  static int mp2925_write_word_data(struct i2c_client *client, int page, int reg,
b3a4efc88601cb Wensheng Wang 2025-09-18  135  				  u16 word)
b3a4efc88601cb Wensheng Wang 2025-09-18  136  {
b3a4efc88601cb Wensheng Wang 2025-09-18  137  	int ret;
b3a4efc88601cb Wensheng Wang 2025-09-18  138  
b3a4efc88601cb Wensheng Wang 2025-09-18  139  	switch (reg) {
b3a4efc88601cb Wensheng Wang 2025-09-18  140  	case PMBUS_VIN_OV_FAULT_LIMIT:
b3a4efc88601cb Wensheng Wang 2025-09-18  141  	case PMBUS_VIN_OV_WARN_LIMIT:
b3a4efc88601cb Wensheng Wang 2025-09-18  142  	case PMBUS_VIN_UV_WARN_LIMIT:
b3a4efc88601cb Wensheng Wang 2025-09-18  143  	case PMBUS_VIN_UV_FAULT_LIMIT:
b3a4efc88601cb Wensheng Wang 2025-09-18  144  		/*
b3a4efc88601cb Wensheng Wang 2025-09-18  145  		 * The PMBUS_VIN_OV_FAULT_LIMIT, PMBUS_VIN_OV_WARN_LIMIT,
b3a4efc88601cb Wensheng Wang 2025-09-18  146  		 * PMBUS_VIN_UV_WARN_LIMIT and PMBUS_VIN_UV_FAULT_LIMIT
b3a4efc88601cb Wensheng Wang 2025-09-18  147  		 * of MP2925 is linear11 format, and the exponent is a
b3a4efc88601cb Wensheng Wang 2025-09-18  148  		 * constant value(5'b11100)， so the exponent of word
b3a4efc88601cb Wensheng Wang 2025-09-18  149  		 * parameter should be converted to 5'b11100(0x1C).
b3a4efc88601cb Wensheng Wang 2025-09-18  150  		 */
b3a4efc88601cb Wensheng Wang 2025-09-18  151  		ret = pmbus_write_word_data(client, page, reg,
b3a4efc88601cb Wensheng Wang 2025-09-18  152  					    mp2925_linear_exp_transfer(word, 0x1C));
b3a4efc88601cb Wensheng Wang 2025-09-18  153  		if (ret < 0)
b3a4efc88601cb Wensheng Wang 2025-09-18  154  			return ret;
b3a4efc88601cb Wensheng Wang 2025-09-18  155  		break;
b3a4efc88601cb Wensheng Wang 2025-09-18  156  	case PMBUS_VOUT_OV_FAULT_LIMIT:
b3a4efc88601cb Wensheng Wang 2025-09-18  157  	case PMBUS_VOUT_UV_FAULT_LIMIT:
b3a4efc88601cb Wensheng Wang 2025-09-18  158  		ret = pmbus_write_word_data(client, page, reg,
b3a4efc88601cb Wensheng Wang 2025-09-18 @159  					    (ret & ~GENMASK(11, 0)) |
b3a4efc88601cb Wensheng Wang 2025-09-18  160  				FIELD_PREP(GENMASK(11, 0),
b3a4efc88601cb Wensheng Wang 2025-09-18  161  					   DIV_ROUND_CLOSEST(word * MP2925_VOUT_OVUV_DIV,
b3a4efc88601cb Wensheng Wang 2025-09-18  162  							     MP2925_VOUT_OVUV_UINT)));
b3a4efc88601cb Wensheng Wang 2025-09-18  163  		break;
b3a4efc88601cb Wensheng Wang 2025-09-18  164  	case PMBUS_OT_FAULT_LIMIT:
b3a4efc88601cb Wensheng Wang 2025-09-18  165  	case PMBUS_OT_WARN_LIMIT:
b3a4efc88601cb Wensheng Wang 2025-09-18  166  		/*
b3a4efc88601cb Wensheng Wang 2025-09-18  167  		 * The PMBUS_OT_FAULT_LIMIT and PMBUS_OT_WARN_LIMIT of
b3a4efc88601cb Wensheng Wang 2025-09-18  168  		 * MP2925 is linear11 format, and the exponent is a
b3a4efc88601cb Wensheng Wang 2025-09-18  169  		 * constant value(5'b00000), so the exponent of word
b3a4efc88601cb Wensheng Wang 2025-09-18  170  		 * parameter should be converted to 5'b00000.
b3a4efc88601cb Wensheng Wang 2025-09-18  171  		 */
b3a4efc88601cb Wensheng Wang 2025-09-18  172  		ret = pmbus_write_word_data(client, page, reg,
b3a4efc88601cb Wensheng Wang 2025-09-18  173  					    mp2925_linear_exp_transfer(word, 0x00));
b3a4efc88601cb Wensheng Wang 2025-09-18  174  		if (ret < 0)
b3a4efc88601cb Wensheng Wang 2025-09-18  175  			return ret;
b3a4efc88601cb Wensheng Wang 2025-09-18  176  		break;
b3a4efc88601cb Wensheng Wang 2025-09-18  177  	case PMBUS_IOUT_OC_FAULT_LIMIT:
b3a4efc88601cb Wensheng Wang 2025-09-18  178  	case PMBUS_IOUT_OC_WARN_LIMIT:
b3a4efc88601cb Wensheng Wang 2025-09-18  179  		/*
b3a4efc88601cb Wensheng Wang 2025-09-18  180  		 * The PMBUS_IOUT_OC_FAULT_LIMIT and PMBUS_IOUT_OC_WARN_LIMIT
b3a4efc88601cb Wensheng Wang 2025-09-18  181  		 * of MP2925 is linear11 format, and the exponent is a
b3a4efc88601cb Wensheng Wang 2025-09-18  182  		 * can not be changed.
b3a4efc88601cb Wensheng Wang 2025-09-18  183  		 */
b3a4efc88601cb Wensheng Wang 2025-09-18  184  		ret = pmbus_read_word_data(client, page, 0xff, reg);
b3a4efc88601cb Wensheng Wang 2025-09-18  185  		if (ret < 0)
b3a4efc88601cb Wensheng Wang 2025-09-18  186  			return ret;
b3a4efc88601cb Wensheng Wang 2025-09-18  187  
b3a4efc88601cb Wensheng Wang 2025-09-18  188  		ret = pmbus_write_word_data(client, page, reg,
b3a4efc88601cb Wensheng Wang 2025-09-18  189  					    mp2925_linear_exp_transfer(word,
b3a4efc88601cb Wensheng Wang 2025-09-18  190  								       FIELD_GET(GENMASK(15, 11),
b3a4efc88601cb Wensheng Wang 2025-09-18  191  										 ret)));
b3a4efc88601cb Wensheng Wang 2025-09-18  192  		break;
b3a4efc88601cb Wensheng Wang 2025-09-18  193  	default:
b3a4efc88601cb Wensheng Wang 2025-09-18  194  		ret = -EINVAL;
b3a4efc88601cb Wensheng Wang 2025-09-18  195  		break;
b3a4efc88601cb Wensheng Wang 2025-09-18  196  	}
b3a4efc88601cb Wensheng Wang 2025-09-18  197  
b3a4efc88601cb Wensheng Wang 2025-09-18  198  	return ret;
b3a4efc88601cb Wensheng Wang 2025-09-18  199  }
b3a4efc88601cb Wensheng Wang 2025-09-18  200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
