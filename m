Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2FC199920
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Jul 2025 17:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752342311; cv=none; b=NTW15RGMngGBRX8dcslQES6Mf7q2pXh5vya8rIbDCWS6wuK4ng/5EMCM71xwBp6dUeKCg/8Qu3z5HiUydMBpLx5dyKSN22g6ptEfgqrv6XSrAO78Lh4iis8btG+/Pnm301MsFVzBDQ0SO6JOCTqn4eA6iJNn1naTTGZtrvSs7n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752342311; c=relaxed/simple;
	bh=/FRmMHMxNYYuydmOwCadIZMT08Cqko/NaeS6lbBv5Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g2ouegd9zhUKqMGDXwb5k5I5mOTnI0QPTTvF8Ua/XLp8XW7oPyUlInFuIObiXxKf4wBKyRerqgz6YYe0z/lAZPrZ9yrjeHMYVXU9/5dvliApkT0Uv1eOmNgr9hdr142DWy6sz6zwFgucIEmyU8ij7bwjp8dzpmj2VBKlFHM4i8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOnymaqA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOnymaqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752342308; x=1783878308;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/FRmMHMxNYYuydmOwCadIZMT08Cqko/NaeS6lbBv5Hs=;
  b=QOnymaqAiJr9cYwYDTFtD5xB8l+nSwiHzKHMDwZvN+JuoxrY1HH5O8lc
   4blWDtISJ8EYTcLjARuhrdEd+VsNHlnXWMsbHvsg/LXcK9rGPpMmp+Y5K
   HqWKhzsos2gokhjGLVLfCVHpAFOhUdfZ3mjgTQa5kdhv3Rs/huhBN0Xl5
   PKs+D9RSSKAHWoCRAqJoIqeJ3F+FZHEKhMnV6TC0+WZ3tdfPrAUa3sBXJ
   kvSuTugUy8bHWrO5yW0B5J0Uhox7y673dxaYurW0KSKJCRzrKfOgYjNma
   Ae2VfEvmrHQ9uM28Go2jnyxFILArSIlkbbR2r1iEzG+kOPPyOBAsqD2Xr
   w==;
X-CSE-ConnectionGUID: R/bWcoDSQyiBkADDh6KK3g==
X-CSE-MsgGUID: BfSsOt0eSFWEQq0Fi42yqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54570248"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="54570248"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 10:45:07 -0700
X-CSE-ConnectionGUID: QZogp/yIRDCYv7bT4vdLmw==
X-CSE-MsgGUID: QX/pWY+ZT8q0QZ/WvERcYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="160937334"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jul 2025 10:45:07 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaeHY-0007Yu-0d;
	Sat, 12 Jul 2025 17:45:04 +0000
Date: Sun, 13 Jul 2025 01:44:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 5/8] iio: imu: inv_icm45600: add I2C driver for
 inv_icm45600 driver
Message-ID: <202507130115.7g0XWB2E-lkp@intel.com>
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
In-Reply-To: <20250710-add_newport_driver-v2-5-bf76d8142ef2@tdk.com>
References: <20250710-add_newport_driver-v2-5-bf76d8142ef2@tdk.com>
TO: Remi Buisson via B4 Relay <devnull+remi.buisson.tdk.com@kernel.org>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Remi Buisson <remi.buisson@tdk.com>

Hi Remi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f8f559752d573a051a984adda8d2d1464f92f954]

url:    https://github.com/intel-lab-lkp/linux/commits/Remi-Buisson-via-B4-Relay/dt-bindings-iio-imu-Add-inv_icm45600/20250710-170143
base:   f8f559752d573a051a984adda8d2d1464f92f954
patch link:    https://lore.kernel.org/r/20250710-add_newport_driver-v2-5-bf76d8142ef2%40tdk.com
patch subject: [PATCH v2 5/8] iio: imu: inv_icm45600: add I2C driver for inv_icm45600 driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-randconfig-r073-20250712 (https://download.01.org/0day-ci/archive/20250713/202507130115.7g0XWB2E-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507130115.7g0XWB2E-lkp@intel.com/

smatch warnings:
drivers/iio/imu/inv_icm45600/inv_icm45600_gyro.c:121 inv_icm45600_gyro_update_scan_mode() error: uninitialized symbol 'sleep'.
drivers/iio/imu/inv_icm45600/inv_icm45600_accel.c:123 inv_icm45600_accel_update_scan_mode() error: uninitialized symbol 'sleep'.

vim +/sleep +121 drivers/iio/imu/inv_icm45600/inv_icm45600_gyro.c

1fb5c2bf7348d0 Remi Buisson 2025-07-10   91  
1fb5c2bf7348d0 Remi Buisson 2025-07-10   92  /* enable gyroscope sensor and FIFO write */
1fb5c2bf7348d0 Remi Buisson 2025-07-10   93  static int inv_icm45600_gyro_update_scan_mode(struct iio_dev *indio_dev,
1fb5c2bf7348d0 Remi Buisson 2025-07-10   94  					      const unsigned long *scan_mask)
1fb5c2bf7348d0 Remi Buisson 2025-07-10   95  {
1fb5c2bf7348d0 Remi Buisson 2025-07-10   96  	struct inv_icm45600_state *st = iio_device_get_drvdata(indio_dev);
1fb5c2bf7348d0 Remi Buisson 2025-07-10   97  	struct inv_icm45600_sensor_state *gyro_st = iio_priv(indio_dev);
1fb5c2bf7348d0 Remi Buisson 2025-07-10   98  	struct inv_icm45600_sensor_conf conf = INV_ICM45600_SENSOR_CONF_INIT;
1fb5c2bf7348d0 Remi Buisson 2025-07-10   99  	unsigned int fifo_en = 0;
1fb5c2bf7348d0 Remi Buisson 2025-07-10  100  	unsigned int sleep;
1fb5c2bf7348d0 Remi Buisson 2025-07-10  101  	int ret;
1fb5c2bf7348d0 Remi Buisson 2025-07-10  102  
1fb5c2bf7348d0 Remi Buisson 2025-07-10  103  	scoped_guard(mutex, &st->lock) {
1fb5c2bf7348d0 Remi Buisson 2025-07-10  104  		if (*scan_mask & BIT(INV_ICM45600_GYRO_SCAN_TEMP))
1fb5c2bf7348d0 Remi Buisson 2025-07-10  105  			fifo_en |= INV_ICM45600_SENSOR_TEMP;
1fb5c2bf7348d0 Remi Buisson 2025-07-10  106  
1fb5c2bf7348d0 Remi Buisson 2025-07-10  107  		if (*scan_mask & (BIT(INV_ICM45600_GYRO_SCAN_X) |
1fb5c2bf7348d0 Remi Buisson 2025-07-10  108  				 BIT(INV_ICM45600_GYRO_SCAN_Y) |
1fb5c2bf7348d0 Remi Buisson 2025-07-10  109  				 BIT(INV_ICM45600_GYRO_SCAN_Z))) {
1fb5c2bf7348d0 Remi Buisson 2025-07-10  110  			/* enable gyro sensor */
1fb5c2bf7348d0 Remi Buisson 2025-07-10  111  			conf.mode = gyro_st->power_mode;
1fb5c2bf7348d0 Remi Buisson 2025-07-10  112  			ret = inv_icm45600_set_gyro_conf(st, &conf, &sleep);
1fb5c2bf7348d0 Remi Buisson 2025-07-10  113  			if (ret)
1fb5c2bf7348d0 Remi Buisson 2025-07-10  114  				return ret;
1fb5c2bf7348d0 Remi Buisson 2025-07-10  115  			fifo_en |= INV_ICM45600_SENSOR_GYRO;
1fb5c2bf7348d0 Remi Buisson 2025-07-10  116  		}
1fb5c2bf7348d0 Remi Buisson 2025-07-10  117  		/* update data FIFO write */
1fb5c2bf7348d0 Remi Buisson 2025-07-10  118  		ret = inv_icm45600_buffer_set_fifo_en(st, fifo_en | st->fifo.en);
1fb5c2bf7348d0 Remi Buisson 2025-07-10  119  	}
1fb5c2bf7348d0 Remi Buisson 2025-07-10  120  	/* sleep required time */
1fb5c2bf7348d0 Remi Buisson 2025-07-10 @121  	if (sleep)
1fb5c2bf7348d0 Remi Buisson 2025-07-10  122  		msleep(sleep);
1fb5c2bf7348d0 Remi Buisson 2025-07-10  123  
1fb5c2bf7348d0 Remi Buisson 2025-07-10  124  	return ret;
1fb5c2bf7348d0 Remi Buisson 2025-07-10  125  }
1fb5c2bf7348d0 Remi Buisson 2025-07-10  126  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
