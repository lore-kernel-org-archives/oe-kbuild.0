Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5623B23770C
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Mar 2025 23:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741043876; cv=none; b=r1mlVhXI/juvHAQkfhscYNmeTrBFX+LJ8WdcGUsHZC1j973BTrxHrAlvb7mKuXvhQeKkx0jzdjdvzGBBqWzpuZ3onCWPKsml1NMM8k27gGcB3BqcYgsnru+BWCV72EnVjGMGfgQy1dPWq1Y6yprw3gQ3R6Ig1UtMrIrD2nC4+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741043876; c=relaxed/simple;
	bh=5xczOuYabcmJJ+CKbEQ+AwZiBPRPMg21UWY0v0NM4YE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n1JRPP23IJk6rs6A0HjqC4kqmuNJEgfWYnxnMpXOr47xF+dQk/ijNPjhO6NjeGwaPNhfeg0qLV5w+SLxw4MorrkcUIYto3/79gaY/ccTrlFDtLHxaWP0899PoS0MH58Arl0q2gUtLIBxsaBn1K7vlLgbqWZ7Wo25EY+XU/px9vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcP5azho; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcP5azho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741043874; x=1772579874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5xczOuYabcmJJ+CKbEQ+AwZiBPRPMg21UWY0v0NM4YE=;
  b=gcP5azhoSR2dXpdTSHFKNRddv4VTUgeLtBSzPeF+y3x8+7MVO4Wt6P9s
   L4HMH0QA5PSMhp3dIcuDf6YsXf1FltzGWvf8t0sOeGTLPBEEcVKVL8X7n
   WQrP8f4kwJT1GKsvrjl9OftPOywbcJk22zgKtro6hMSsgTFrHxF4fzXMv
   PmEdx12BAnzJipZbhKpGGZhf7RXKV+CECUs1r2SqebT7ZjW+4ULW1SadE
   KW88J3r9QoKHwl72F3HSCREcygMe9hOdFs0exci2kuPVKiijRdsQ60HHw
   ULb1wxDo7ZFtv+e3sOCvU0fR1vV8pCdcuE42UCEsa3tTsat7Mwje8IJlb
   Q==;
X-CSE-ConnectionGUID: LtqJxQa1TuqKVvJBEXIUBw==
X-CSE-MsgGUID: oimH8gg1ShOJp2OYxTdpcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41834456"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="41834456"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 15:17:53 -0800
X-CSE-ConnectionGUID: USyG253sR3a/uXbToH/kxw==
X-CSE-MsgGUID: xRLa+7DvQs6P/KmeYjwHBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="122809424"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 03 Mar 2025 15:17:52 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpF2k-000J1m-1p;
	Mon, 03 Mar 2025 23:17:50 +0000
Date: Tue, 4 Mar 2025 07:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] iio: imu: inv_icm42600: add WoM support
Message-ID: <202503040712.Hluwg7FK-lkp@intel.com>
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
In-Reply-To: <20250220-losd-3-inv-icm42600-add-wom-support-v1-1-9b937f986954@tdk.com>
References: <20250220-losd-3-inv-icm42600-add-wom-support-v1-1-9b937f986954@tdk.com>
TO: "Jean-Baptiste Maneyrol via B4 Relay" <devnull+jean-baptiste.maneyrol.tdk.com@kernel.org>
TO: Jonathan Cameron <jic23@kernel.org>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "Jean-Baptiste Maneyrol" <jean-baptiste.maneyrol@tdk.com>

Hi Jean-Baptiste,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c0f115a8d97599623294c8e9ec28530e19c1e85b]

url:    https://github.com/intel-lab-lkp/linux/commits/Jean-Baptiste-Maneyrol-via-B4-Relay/iio-imu-inv_icm42600-add-WoM-support/20250221-045400
base:   c0f115a8d97599623294c8e9ec28530e19c1e85b
patch link:    https://lore.kernel.org/r/20250220-losd-3-inv-icm42600-add-wom-support-v1-1-9b937f986954%40tdk.com
patch subject: [PATCH 1/2] iio: imu: inv_icm42600: add WoM support
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: sparc64-randconfig-r071-20250303 (https://download.01.org/0day-ci/archive/20250304/202503040712.Hluwg7FK-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503040712.Hluwg7FK-lkp@intel.com/

smatch warnings:
drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c:437 inv_icm42600_accel_enable_wom() warn: inconsistent returns '&st->lock'.

vim +437 drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c

bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  380  
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  381  static int inv_icm42600_accel_enable_wom(struct iio_dev *indio_dev, bool enable)
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  382  {
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  383  	struct inv_icm42600_state *st = iio_device_get_drvdata(indio_dev);
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  384  	struct inv_icm42600_sensor_state *accel_st = iio_priv(indio_dev);
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  385  	struct device *pdev = regmap_get_device(st->map);
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  386  	struct inv_icm42600_sensor_conf conf = INV_ICM42600_SENSOR_CONF_INIT;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  387  	unsigned int sleep_ms = 0;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  388  	int ret;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  389  
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  390  	if (enable) {
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  391  		ret = pm_runtime_resume_and_get(pdev);
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  392  		if (ret)
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  393  			return ret;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  394  		scoped_guard(mutex, &st->lock) {
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  395  			/* turn on accel sensor */
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  396  			conf.mode = accel_st->power_mode;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  397  			conf.filter = accel_st->filter;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  398  			ret = inv_icm42600_set_accel_conf(st, &conf, &sleep_ms);
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  399  			if (ret)
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  400  				goto error_suspend;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  401  		}
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  402  		if (sleep_ms)
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  403  			msleep(sleep_ms);
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  404  		scoped_guard(mutex, &st->lock) {
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  405  			ret = inv_icm42600_set_wom(st, true);
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  406  			if (ret)
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  407  				goto error_suspend;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  408  			st->apex.on++;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  409  			st->apex.wom.enable = true;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  410  		}
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  411  	} else {
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  412  		scoped_guard(mutex, &st->lock) {
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  413  			st->apex.wom.enable = false;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  414  			st->apex.on--;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  415  			ret = inv_icm42600_set_wom(st, false);
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  416  			if (ret)
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  417  				goto error_suspend;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  418  			/* turn off accel sensor if not used */
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  419  			if (!st->apex.on && !iio_buffer_enabled(indio_dev)) {
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  420  				conf.mode = INV_ICM42600_SENSOR_MODE_OFF;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  421  				ret = inv_icm42600_set_accel_conf(st, &conf, &sleep_ms);
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  422  				if (ret)
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  423  					goto error_suspend;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  424  			}
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  425  		}
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  426  		if (sleep_ms)
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  427  			msleep(sleep_ms);
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  428  		pm_runtime_mark_last_busy(pdev);
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  429  		pm_runtime_put_autosuspend(pdev);
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  430  	}
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  431  
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  432  	return 0;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  433  
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  434  error_suspend:
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  435  	pm_runtime_mark_last_busy(pdev);
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  436  	pm_runtime_put_autosuspend(pdev);
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20 @437  	return ret;
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  438  }
bf747588eb604e Jean-Baptiste Maneyrol 2025-02-20  439  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
