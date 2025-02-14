Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCEA1DA2E5
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739513231; cv=none; b=dehVlY8Pu5+br0rq8zP8YeKmjKx5boy0amB790Nab/AyLrbFcgRwfiQGskBOyiDqhnA101/4kh03H3PguzeRxmWKRMPgWMW6TrQz7iuaMGbQ++QsQfbBFEllL73nmFnA4pXzyq9xdu1OTVblrqN+7/JoyiWqmbKzR2ENIqPExbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739513231; c=relaxed/simple;
	bh=wHTJ5585NqWDjsscvCc/glh3+pOwN5cWOImGkC0Q9cU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r6i1PLHr5nK8fp14OL75At/h+UBFnfgHNEK3SoQAGBzCruApAymLSskB6CuH80unahyntSxw+UmrpPHgn4JtrLNlCt89esJVg9Ash6mAdtpmSEAy1H2PKsNq+uzts4aRRtG+gOuf2IaBQliqzDtqa/qUoLJ2q4VZgowHCMpPkFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbQ+nb4a; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbQ+nb4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739513229; x=1771049229;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wHTJ5585NqWDjsscvCc/glh3+pOwN5cWOImGkC0Q9cU=;
  b=TbQ+nb4aFht+YGQ54Am43rFXEm/UZLAbjLGj3U9YfGo4M327ij/x2kNa
   Qu0hWaPWueTkhHFhXuC+XpZsQJp9LrLSixJySMLYtUqaaFwPQQTAR8PLk
   5UCKCwyytrakknqpUTE/Un2fEzlLBUZwP1NZ8Gz47WtCwn5aCjMfbwYDe
   YUZDNGfmVjHh42J9HhNn+rKXF5MV+biaRwoVt8rqTm5lZPIeJuWohVYnn
   CFynTIZGYFg1ZNl4gBx651ys6le2Xp0VSYC2qfY1UOm17n0qkz7v4QKcy
   WaD8Py5PrsvZxDs3eS7qNoc7yBcYbKoC7FmMR/xLCbqipRlSj3gmpvEzt
   w==;
X-CSE-ConnectionGUID: 0NU33CA/RM+1FF2vch87IQ==
X-CSE-MsgGUID: rAzQTBxhRxq05HUv7tpUfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40370321"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40370321"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 22:06:26 -0800
X-CSE-ConnectionGUID: 5QSfrEbqRje/cNRYG2gmrg==
X-CSE-MsgGUID: rPo0MUp9SB2J/UT58Giubg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="144227279"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Feb 2025 22:06:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tioqE-00198N-0J;
	Fri, 14 Feb 2025 06:06:22 +0000
Date: Fri, 14 Feb 2025 14:05:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 1/2] hwmon: add GPD devices sensor driver
Message-ID: <202502141340.gv6WPQPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hwmon/gpd-fan.c:482:17: sparse: sparse: not in switch scope"
:::::: 

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
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-r111-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141340.gv6WPQPq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141340.gv6WPQPq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502141340.gv6WPQPq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hwmon/gpd-fan.c:361:17: sparse: sparse: typename in expression
   drivers/hwmon/gpd-fan.c:361:23: sparse: sparse: Expected ; at end of statement
   drivers/hwmon/gpd-fan.c:361:23: sparse: sparse: got struct
   drivers/hwmon/gpd-fan.c:452:25: sparse: sparse: typename in expression
   drivers/hwmon/gpd-fan.c:452:29: sparse: sparse: Expected ; at end of statement
   drivers/hwmon/gpd-fan.c:452:29: sparse: sparse: got ret
   drivers/hwmon/gpd-fan.c:478:25: sparse: sparse: typename in expression
   drivers/hwmon/gpd-fan.c:478:28: sparse: sparse: Expected ; at end of statement
   drivers/hwmon/gpd-fan.c:478:28: sparse: sparse: got var
   drivers/hwmon/gpd-fan.c:478:34: sparse: sparse: Expected ; at end of statement
   drivers/hwmon/gpd-fan.c:478:34: sparse: sparse: got )
>> drivers/hwmon/gpd-fan.c:482:17: sparse: sparse: not in switch scope
>> drivers/hwmon/gpd-fan.c:486:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/hwmon/gpd-fan.c:486:16: sparse: sparse: Expected ; at end of declaration
   drivers/hwmon/gpd-fan.c:486:16: sparse: sparse: got -
   drivers/hwmon/gpd-fan.c:487:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/hwmon/gpd-fan.c:487:1: sparse: sparse: got }
   drivers/hwmon/gpd-fan.c:361:17: sparse: sparse: undefined identifier 'const'
   drivers/hwmon/gpd-fan.c:363:40: sparse: sparse: undefined identifier 'drvdata'
   drivers/hwmon/gpd-fan.c:452:25: sparse: sparse: undefined identifier 'int'
   drivers/hwmon/gpd-fan.c:454:29: sparse: sparse: undefined identifier 'ret'
   drivers/hwmon/gpd-fan.c:455:40: sparse: sparse: undefined identifier 'ret'
   drivers/hwmon/gpd-fan.c:457:32: sparse: sparse: undefined identifier 'ret'
   drivers/hwmon/gpd-fan.c:478:25: sparse: sparse: undefined identifier 'u8'
   drivers/hwmon/gpd-fan.c:478:34: sparse: sparse: undefined identifier '__UNIQUE_ID_v_346'
   drivers/hwmon/gpd-fan.c:478:34: sparse: sparse: undefined identifier '__UNIQUE_ID_v_346'
>> drivers/hwmon/gpd-fan.c:478:34: sparse: sparse: incompatible types for operation (<):
   drivers/hwmon/gpd-fan.c:478:34: sparse:    bad type
   drivers/hwmon/gpd-fan.c:478:34: sparse:    bad type
   drivers/hwmon/gpd-fan.c:478:34: sparse: sparse: undefined identifier '__UNIQUE_ID_v_346'
   drivers/hwmon/gpd-fan.c:480:53: sparse: sparse: undefined identifier 'var'
   drivers/hwmon/gpd-fan.c:481:46: sparse: sparse: undefined identifier 'var'
   drivers/hwmon/gpd-fan.c:501:17: sparse: sparse: undefined identifier 'gpd_fan_ops'

vim +482 drivers/hwmon/gpd-fan.c

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
143d683070d6ce Cryolitia PukNgae 2025-02-11 @486  	return -EOPNOTSUPP;
143d683070d6ce Cryolitia PukNgae 2025-02-11  487  }
143d683070d6ce Cryolitia PukNgae 2025-02-11  488  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
