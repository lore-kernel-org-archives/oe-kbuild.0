Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8847E1078F
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Feb 2025 02:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739586951; cv=none; b=uaDY4gcpX7dMudbKNq1WitER2CtcI+lIo/M1uWb6n6STP8rGfydrHMNJI0pT9xO7BQ9Xiq0qjqzRpW/XUhYjxV2vsWGIicl6ka+OvzZvX9Ep6nY1Nduv9DxqyCswfkT9fInECz4GGnBjPBqKOtB24lDdUFt/v6OpHAkG33wTzT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739586951; c=relaxed/simple;
	bh=iqiUaKJl4lxtBGPV2DoUy1ZvAuyICVFVFLE63ei0yn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B3ORAAEkQm8GX+NNaDMYCjHjIcXdAmZdmLjpkAC4nCQhFAjK9V8trMki9Sr6oaof+HtYeQppvBw52eIKdwFgNxhFisRv5rcEG4qhpm7/MDX5fuGOXXOdcZV7GmvQoKKgORApQ1l0v/Mh2gjGLLM2IdHPoLDhNQx/vDD0/o9fI4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7QhIurk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7QhIurk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739586950; x=1771122950;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iqiUaKJl4lxtBGPV2DoUy1ZvAuyICVFVFLE63ei0yn0=;
  b=G7QhIurk/e6hkvuyeGlV8jh2d0NehOPfzkQkxOdLVGIHjGVUlirSsX+K
   RIJN9XEg1TAp9wN7ldEd6hXu8qxb1GpA0Ox0ClrCWnxuGFnPvWUXRVd5R
   UiV16U9IbsqWXHQUbVUK7INmEJCK7wuyVGEfuFwkZ7kDAxtjgtcX25NX2
   hfu7q/s5FsZbHoHzhne6aKrYLr6iYZNS/3KexfxbUXM/kxtm0MBp5zEs5
   X1Sj76em2g3RT6FAGmdJKvw2qAUhqnbyLzsfK4i3KgMWnQcpfWHVJCBRv
   I+FFXSftDyaBgIdrq5+/Ox3e/uOn44lydnYqozH/lobjXhUHu9wlULvIG
   g==;
X-CSE-ConnectionGUID: iPlSs5OCSgSfB38e8FoHyw==
X-CSE-MsgGUID: giu3gvX/RaCMgw+EeXYgAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40474180"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="40474180"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 18:35:49 -0800
X-CSE-ConnectionGUID: yj2sDAZqTbGNPrJp2SA3iA==
X-CSE-MsgGUID: uFjxtn2IQTy7CtYoV1Vvbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150775777"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Feb 2025 18:35:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj81w-001AQp-19;
	Sat, 15 Feb 2025 02:35:44 +0000
Date: Sat, 15 Feb 2025 10:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 1/2] hwmon: add GPD devices sensor driver
Message-ID: <202502151049.7BS9yEVk-lkp@intel.com>
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
In-Reply-To: <20250211-gpd_fan-v5-1-608f4255f0e1@gmail.com>
References: <20250211-gpd_fan-v5-1-608f4255f0e1@gmail.com>
TO: Cryolitia PukNgae via B4 Relay <devnull+Cryolitia.gmail.com@kernel.org>
TO: Jean Delvare <jdelvare@suse.com>
TO: Guenter Roeck <linux@roeck-us.net>
TO: Cryolitia PukNgae <Cryolitia@gmail.com>
TO: Jonathan Corbet <corbet@lwn.net>
CC: linux-kernel@vger.kernel.org
CC: linux-hwmon@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: Celeste Liu <CoelacanthusHex@gmail.com>
CC: Yao Zi <ziyao@disroot.org>
CC: Derek John Clark <derekjohn.clark@gmail.com>
CC: "Marcin Strągowski" <marcin@stragowski.com>
CC: someone5678 <someone5678.dev@gmail.com>
CC: Justin Weiss <justin@justinweiss.com>

Hi Cryolitia,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Cryolitia-PukNgae-via-B4-Relay/hwmon-add-GPD-devices-sensor-driver/20250211-150418
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250211-gpd_fan-v5-1-608f4255f0e1%40gmail.com
patch subject: [PATCH v5 1/2] hwmon: add GPD devices sensor driver
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-r073-20250215 (https://download.01.org/0day-ci/archive/20250215/202502151049.7BS9yEVk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502151049.7BS9yEVk-lkp@intel.com/

smatch warnings:
drivers/hwmon/gpd-fan.c:361 gpd_win_mini_set_pwm_enable() warn: statement has no effect 3
drivers/hwmon/gpd-fan.c:452 gpd_fan_hwmon_read() warn: statement has no effect 3
drivers/hwmon/gpd-fan.c:478 gpd_fan_hwmon_write() warn: statement has no effect 3
drivers/hwmon/gpd-fan.c:482 gpd_fan_hwmon_write() warn: inconsistent indenting
drivers/hwmon/gpd-fan.c:534 gpd_fan_probe() warn: passing zero to 'PTR_ERR'

vim +361 drivers/hwmon/gpd-fan.c

143d683070d6ce Cryolitia PukNgae 2025-02-11  352  
143d683070d6ce Cryolitia PukNgae 2025-02-11  353  static int gpd_win_mini_set_pwm_enable(enum FAN_PWM_ENABLE pwm_enable)
143d683070d6ce Cryolitia PukNgae 2025-02-11  354  {
143d683070d6ce Cryolitia PukNgae 2025-02-11  355  	switch (pwm_enable) {
143d683070d6ce Cryolitia PukNgae 2025-02-11  356  	case DISABLE:
143d683070d6ce Cryolitia PukNgae 2025-02-11  357  		return gpd_generic_write_pwm(255);
143d683070d6ce Cryolitia PukNgae 2025-02-11  358  	case MANUAL:
143d683070d6ce Cryolitia PukNgae 2025-02-11  359  		return gpd_generic_write_pwm(gpd_driver_priv.pwm_value);
143d683070d6ce Cryolitia PukNgae 2025-02-11  360  	case AUTOMATIC:
143d683070d6ce Cryolitia PukNgae 2025-02-11 @361  		const struct gpd_board_drvdata *drvdata = gpd_driver_priv.drvdata;
143d683070d6ce Cryolitia PukNgae 2025-02-11  362  
143d683070d6ce Cryolitia PukNgae 2025-02-11  363  		return gpd_ecram_write(drvdata, drvdata->pwm_write, 0);
143d683070d6ce Cryolitia PukNgae 2025-02-11  364  	}
143d683070d6ce Cryolitia PukNgae 2025-02-11  365  	return 0;
143d683070d6ce Cryolitia PukNgae 2025-02-11  366  }
143d683070d6ce Cryolitia PukNgae 2025-02-11  367  
143d683070d6ce Cryolitia PukNgae 2025-02-11  368  static int gpd_wm2_set_pwm_enable(enum FAN_PWM_ENABLE enable)
143d683070d6ce Cryolitia PukNgae 2025-02-11  369  {
143d683070d6ce Cryolitia PukNgae 2025-02-11  370  	const struct gpd_board_drvdata *const drvdata = gpd_driver_priv.drvdata;
143d683070d6ce Cryolitia PukNgae 2025-02-11  371  	int ret;
143d683070d6ce Cryolitia PukNgae 2025-02-11  372  
143d683070d6ce Cryolitia PukNgae 2025-02-11  373  	switch (enable) {
143d683070d6ce Cryolitia PukNgae 2025-02-11  374  	case DISABLE: {
143d683070d6ce Cryolitia PukNgae 2025-02-11  375  		ret = gpd_generic_write_pwm(255);
143d683070d6ce Cryolitia PukNgae 2025-02-11  376  
143d683070d6ce Cryolitia PukNgae 2025-02-11  377  		if (ret)
143d683070d6ce Cryolitia PukNgae 2025-02-11  378  			return ret;
143d683070d6ce Cryolitia PukNgae 2025-02-11  379  
143d683070d6ce Cryolitia PukNgae 2025-02-11  380  		return gpd_ecram_write(drvdata, drvdata->manual_control_enable, 1);
143d683070d6ce Cryolitia PukNgae 2025-02-11  381  	}
143d683070d6ce Cryolitia PukNgae 2025-02-11  382  	case MANUAL: {
143d683070d6ce Cryolitia PukNgae 2025-02-11  383  		ret = gpd_generic_write_pwm(gpd_driver_priv.pwm_value);
143d683070d6ce Cryolitia PukNgae 2025-02-11  384  
143d683070d6ce Cryolitia PukNgae 2025-02-11  385  		if (ret)
143d683070d6ce Cryolitia PukNgae 2025-02-11  386  			return ret;
143d683070d6ce Cryolitia PukNgae 2025-02-11  387  
143d683070d6ce Cryolitia PukNgae 2025-02-11  388  		return gpd_ecram_write(drvdata, drvdata->manual_control_enable, 1);
143d683070d6ce Cryolitia PukNgae 2025-02-11  389  	}
143d683070d6ce Cryolitia PukNgae 2025-02-11  390  	case AUTOMATIC: {
143d683070d6ce Cryolitia PukNgae 2025-02-11  391  		ret = gpd_ecram_write(drvdata, drvdata->manual_control_enable, 0);
143d683070d6ce Cryolitia PukNgae 2025-02-11  392  
143d683070d6ce Cryolitia PukNgae 2025-02-11  393  		return ret;
143d683070d6ce Cryolitia PukNgae 2025-02-11  394  	}
143d683070d6ce Cryolitia PukNgae 2025-02-11  395  	}
143d683070d6ce Cryolitia PukNgae 2025-02-11  396  	return 0;
143d683070d6ce Cryolitia PukNgae 2025-02-11  397  }
143d683070d6ce Cryolitia PukNgae 2025-02-11  398  
143d683070d6ce Cryolitia PukNgae 2025-02-11  399  // Write value for pwm1_enable
143d683070d6ce Cryolitia PukNgae 2025-02-11  400  static int gpd_set_pwm_enable(enum FAN_PWM_ENABLE enable)
143d683070d6ce Cryolitia PukNgae 2025-02-11  401  {
143d683070d6ce Cryolitia PukNgae 2025-02-11  402  	switch (gpd_driver_priv.drvdata->board) {
143d683070d6ce Cryolitia PukNgae 2025-02-11  403  	case win_mini:
143d683070d6ce Cryolitia PukNgae 2025-02-11  404  	case win4_6800u:
143d683070d6ce Cryolitia PukNgae 2025-02-11  405  		return gpd_win_mini_set_pwm_enable(enable);
143d683070d6ce Cryolitia PukNgae 2025-02-11  406  	case win_max_2:
143d683070d6ce Cryolitia PukNgae 2025-02-11  407  		return gpd_wm2_set_pwm_enable(enable);
143d683070d6ce Cryolitia PukNgae 2025-02-11  408  	}
143d683070d6ce Cryolitia PukNgae 2025-02-11  409  	return 0;
143d683070d6ce Cryolitia PukNgae 2025-02-11  410  }
143d683070d6ce Cryolitia PukNgae 2025-02-11  411  
143d683070d6ce Cryolitia PukNgae 2025-02-11  412  static umode_t gpd_fan_hwmon_is_visible(__always_unused const void *drvdata,
143d683070d6ce Cryolitia PukNgae 2025-02-11  413  					enum hwmon_sensor_types type, u32 attr,
143d683070d6ce Cryolitia PukNgae 2025-02-11  414  					__always_unused int channel)
143d683070d6ce Cryolitia PukNgae 2025-02-11  415  {
143d683070d6ce Cryolitia PukNgae 2025-02-11  416  	if (type == hwmon_fan && attr == hwmon_fan_input) {
143d683070d6ce Cryolitia PukNgae 2025-02-11  417  		return 0444;
143d683070d6ce Cryolitia PukNgae 2025-02-11  418  	} else if (type == hwmon_pwm) {
143d683070d6ce Cryolitia PukNgae 2025-02-11  419  		switch (attr) {
143d683070d6ce Cryolitia PukNgae 2025-02-11  420  		case hwmon_pwm_enable:
143d683070d6ce Cryolitia PukNgae 2025-02-11  421  		case hwmon_pwm_input:
143d683070d6ce Cryolitia PukNgae 2025-02-11  422  			return 0644;
143d683070d6ce Cryolitia PukNgae 2025-02-11  423  		default:
143d683070d6ce Cryolitia PukNgae 2025-02-11  424  			return 0;
143d683070d6ce Cryolitia PukNgae 2025-02-11  425  		}
143d683070d6ce Cryolitia PukNgae 2025-02-11  426  	}
143d683070d6ce Cryolitia PukNgae 2025-02-11  427  	return 0;
143d683070d6ce Cryolitia PukNgae 2025-02-11  428  }
143d683070d6ce Cryolitia PukNgae 2025-02-11  429  
143d683070d6ce Cryolitia PukNgae 2025-02-11  430  static int gpd_fan_hwmon_read(__always_unused struct device *dev,
143d683070d6ce Cryolitia PukNgae 2025-02-11  431  			      enum hwmon_sensor_types type, u32 attr,
143d683070d6ce Cryolitia PukNgae 2025-02-11  432  			      __always_unused int channel, long *val)
143d683070d6ce Cryolitia PukNgae 2025-02-11  433  {
143d683070d6ce Cryolitia PukNgae 2025-02-11  434  	if (type == hwmon_fan) {
143d683070d6ce Cryolitia PukNgae 2025-02-11  435  		if (attr == hwmon_fan_input) {
143d683070d6ce Cryolitia PukNgae 2025-02-11  436  			int ret = gpd_read_rpm();
143d683070d6ce Cryolitia PukNgae 2025-02-11  437  
143d683070d6ce Cryolitia PukNgae 2025-02-11  438  			if (ret < 0)
143d683070d6ce Cryolitia PukNgae 2025-02-11  439  				return ret;
143d683070d6ce Cryolitia PukNgae 2025-02-11  440  
143d683070d6ce Cryolitia PukNgae 2025-02-11  441  			*val = ret;
143d683070d6ce Cryolitia PukNgae 2025-02-11  442  			return 0;
143d683070d6ce Cryolitia PukNgae 2025-02-11  443  		}
143d683070d6ce Cryolitia PukNgae 2025-02-11  444  		return -EOPNOTSUPP;
143d683070d6ce Cryolitia PukNgae 2025-02-11  445  	}
143d683070d6ce Cryolitia PukNgae 2025-02-11  446  	if (type == hwmon_pwm) {
143d683070d6ce Cryolitia PukNgae 2025-02-11  447  		switch (attr) {
143d683070d6ce Cryolitia PukNgae 2025-02-11  448  		case hwmon_pwm_enable:
143d683070d6ce Cryolitia PukNgae 2025-02-11  449  			*val = gpd_driver_priv.pwm_enable;
143d683070d6ce Cryolitia PukNgae 2025-02-11  450  			return 0;
143d683070d6ce Cryolitia PukNgae 2025-02-11  451  		case hwmon_pwm_input:
143d683070d6ce Cryolitia PukNgae 2025-02-11 @452  			int ret = gpd_read_pwm();
143d683070d6ce Cryolitia PukNgae 2025-02-11  453  
143d683070d6ce Cryolitia PukNgae 2025-02-11  454  			if (ret < 0)
143d683070d6ce Cryolitia PukNgae 2025-02-11  455  				return ret;
143d683070d6ce Cryolitia PukNgae 2025-02-11  456  
143d683070d6ce Cryolitia PukNgae 2025-02-11  457  			*val = ret;
143d683070d6ce Cryolitia PukNgae 2025-02-11  458  			return 0;
143d683070d6ce Cryolitia PukNgae 2025-02-11  459  		default:
143d683070d6ce Cryolitia PukNgae 2025-02-11  460  			return -EOPNOTSUPP;
143d683070d6ce Cryolitia PukNgae 2025-02-11  461  		}
143d683070d6ce Cryolitia PukNgae 2025-02-11  462  	}
143d683070d6ce Cryolitia PukNgae 2025-02-11  463  	return -EOPNOTSUPP;
143d683070d6ce Cryolitia PukNgae 2025-02-11  464  }
143d683070d6ce Cryolitia PukNgae 2025-02-11  465  
143d683070d6ce Cryolitia PukNgae 2025-02-11  466  static int gpd_fan_hwmon_write(__always_unused struct device *dev,
143d683070d6ce Cryolitia PukNgae 2025-02-11  467  			       enum hwmon_sensor_types type, u32 attr,
143d683070d6ce Cryolitia PukNgae 2025-02-11  468  			       __always_unused int channel, long val)
143d683070d6ce Cryolitia PukNgae 2025-02-11  469  {
143d683070d6ce Cryolitia PukNgae 2025-02-11  470  	if (type == hwmon_pwm) {
143d683070d6ce Cryolitia PukNgae 2025-02-11  471  		switch (attr) {
143d683070d6ce Cryolitia PukNgae 2025-02-11  472  		case hwmon_pwm_enable:
143d683070d6ce Cryolitia PukNgae 2025-02-11  473  			if (!in_range(val, 0, 3))
143d683070d6ce Cryolitia PukNgae 2025-02-11  474  				return -EINVAL;
143d683070d6ce Cryolitia PukNgae 2025-02-11  475  			gpd_driver_priv.pwm_enable = val;
143d683070d6ce Cryolitia PukNgae 2025-02-11  476  			return gpd_set_pwm_enable(gpd_driver_priv.pwm_enable);
143d683070d6ce Cryolitia PukNgae 2025-02-11  477  		case hwmon_pwm_input:
143d683070d6ce Cryolitia PukNgae 2025-02-11 @478  			u8 var = clamp_val(val, 0, 255);
143d683070d6ce Cryolitia PukNgae 2025-02-11  479  
143d683070d6ce Cryolitia PukNgae 2025-02-11  480  			gpd_driver_priv.pwm_value = var;
143d683070d6ce Cryolitia PukNgae 2025-02-11  481  			return gpd_write_pwm(var);
143d683070d6ce Cryolitia PukNgae 2025-02-11 @482  		default:
143d683070d6ce Cryolitia PukNgae 2025-02-11  483  			return -EOPNOTSUPP;
143d683070d6ce Cryolitia PukNgae 2025-02-11  484  		}
143d683070d6ce Cryolitia PukNgae 2025-02-11  485  	}
143d683070d6ce Cryolitia PukNgae 2025-02-11  486  	return -EOPNOTSUPP;
143d683070d6ce Cryolitia PukNgae 2025-02-11  487  }
143d683070d6ce Cryolitia PukNgae 2025-02-11  488  
143d683070d6ce Cryolitia PukNgae 2025-02-11  489  static const struct hwmon_ops gpd_fan_ops = {
143d683070d6ce Cryolitia PukNgae 2025-02-11  490  	.is_visible = gpd_fan_hwmon_is_visible,
143d683070d6ce Cryolitia PukNgae 2025-02-11  491  	.read = gpd_fan_hwmon_read,
143d683070d6ce Cryolitia PukNgae 2025-02-11  492  	.write = gpd_fan_hwmon_write,
143d683070d6ce Cryolitia PukNgae 2025-02-11  493  };
143d683070d6ce Cryolitia PukNgae 2025-02-11  494  
143d683070d6ce Cryolitia PukNgae 2025-02-11  495  static const struct hwmon_channel_info *gpd_fan_hwmon_channel_info[] = {
143d683070d6ce Cryolitia PukNgae 2025-02-11  496  	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
143d683070d6ce Cryolitia PukNgae 2025-02-11  497  	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE), NULL
143d683070d6ce Cryolitia PukNgae 2025-02-11  498  };
143d683070d6ce Cryolitia PukNgae 2025-02-11  499  
143d683070d6ce Cryolitia PukNgae 2025-02-11  500  static struct hwmon_chip_info gpd_fan_chip_info = {
143d683070d6ce Cryolitia PukNgae 2025-02-11  501  	.ops = &gpd_fan_ops,
143d683070d6ce Cryolitia PukNgae 2025-02-11  502  	.info = gpd_fan_hwmon_channel_info
143d683070d6ce Cryolitia PukNgae 2025-02-11  503  };
143d683070d6ce Cryolitia PukNgae 2025-02-11  504  
143d683070d6ce Cryolitia PukNgae 2025-02-11  505  static int gpd_fan_probe(struct platform_device *pdev)
143d683070d6ce Cryolitia PukNgae 2025-02-11  506  {
143d683070d6ce Cryolitia PukNgae 2025-02-11  507  	struct device *dev = &pdev->dev;
143d683070d6ce Cryolitia PukNgae 2025-02-11  508  	struct gpd_driver_priv *data;
143d683070d6ce Cryolitia PukNgae 2025-02-11  509  	const struct resource *plat_res;
143d683070d6ce Cryolitia PukNgae 2025-02-11  510  	const struct device *dev_reg;
143d683070d6ce Cryolitia PukNgae 2025-02-11  511  	const struct resource *region_res;
143d683070d6ce Cryolitia PukNgae 2025-02-11  512  
143d683070d6ce Cryolitia PukNgae 2025-02-11  513  	data = dev_get_platdata(&pdev->dev);
143d683070d6ce Cryolitia PukNgae 2025-02-11  514  	if (IS_ERR(data))
143d683070d6ce Cryolitia PukNgae 2025-02-11  515  		return -ENODEV;
143d683070d6ce Cryolitia PukNgae 2025-02-11  516  
143d683070d6ce Cryolitia PukNgae 2025-02-11  517  	plat_res = platform_get_resource(pdev, IORESOURCE_IO, 0);
143d683070d6ce Cryolitia PukNgae 2025-02-11  518  	if (IS_ERR(plat_res))
143d683070d6ce Cryolitia PukNgae 2025-02-11  519  		return dev_err_probe(dev, PTR_ERR(plat_res),
143d683070d6ce Cryolitia PukNgae 2025-02-11  520  				     "Failed to get platform resource\n");
143d683070d6ce Cryolitia PukNgae 2025-02-11  521  
143d683070d6ce Cryolitia PukNgae 2025-02-11  522  	region_res = devm_request_region(dev, plat_res->start,
143d683070d6ce Cryolitia PukNgae 2025-02-11  523  					 resource_size(plat_res), DRIVER_NAME);
143d683070d6ce Cryolitia PukNgae 2025-02-11  524  	if (IS_ERR(region_res))
143d683070d6ce Cryolitia PukNgae 2025-02-11  525  		return dev_err_probe(dev, PTR_ERR(region_res),
143d683070d6ce Cryolitia PukNgae 2025-02-11  526  				     "Failed to request region\n");
143d683070d6ce Cryolitia PukNgae 2025-02-11  527  
143d683070d6ce Cryolitia PukNgae 2025-02-11  528  	dev_reg = devm_hwmon_device_register_with_info(dev,
143d683070d6ce Cryolitia PukNgae 2025-02-11  529  						       DRIVER_NAME,
143d683070d6ce Cryolitia PukNgae 2025-02-11  530  						       data,
143d683070d6ce Cryolitia PukNgae 2025-02-11  531  						       &gpd_fan_chip_info,
143d683070d6ce Cryolitia PukNgae 2025-02-11  532  						       NULL);
143d683070d6ce Cryolitia PukNgae 2025-02-11  533  	if (IS_ERR(dev_reg))
143d683070d6ce Cryolitia PukNgae 2025-02-11 @534  		return dev_err_probe(dev, PTR_ERR(region_res),
143d683070d6ce Cryolitia PukNgae 2025-02-11  535  				     "Failed to register hwmon device\n");
143d683070d6ce Cryolitia PukNgae 2025-02-11  536  
143d683070d6ce Cryolitia PukNgae 2025-02-11  537  	return 0;
143d683070d6ce Cryolitia PukNgae 2025-02-11  538  }
143d683070d6ce Cryolitia PukNgae 2025-02-11  539  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
