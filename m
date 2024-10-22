Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E0B26281
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 03:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729566132; cv=none; b=qNAjZ/BiU0v4yL8Lod7OSfK/sy5FSK/hSKl8CxsKFi4d5siRElRaTcaTvvlJv4CNFWS9zFSQnlDqohsFPUfSHvlJpTXUdJhsZO3FVdTyNG3LLZ6SGXvAZJif37yv6f+CebLbk5lad6k7Fqpvh83F7sfKooejQdkC6YBtwp/F2wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729566132; c=relaxed/simple;
	bh=1tg76k9yu+xjiEI5dFXvVf8ij/XVyEoMb4b/zMs6Lww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fVINHruZtcf5JhFokaRFckA+b4SsMzXQHYit0SLGyRZBFaVXh/HMjNfM70apM0O3+EkI1hu6HhQccE+zJ7RWnHfK3uKwQqRIznNvtUKp8N4cEBW0csdxMi3OAvFvRxp9CGF/wv1PYHGwMAk1dny31BhqwydNOl/sbCpBmy2Qiyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifW9pko7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifW9pko7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729566130; x=1761102130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1tg76k9yu+xjiEI5dFXvVf8ij/XVyEoMb4b/zMs6Lww=;
  b=ifW9pko79dvRPvGVeUa3dI51lKp25FcoIMZiIf0rLeyYuzr6qMv5mjq1
   AebVkf8ZzkqSABID525F9daKsiylrOFucfVi3W0MT5XKJImE1vx1FN2Wb
   N+PAyLcTejI+MTU9uCG+E9mhAOX56e8Xc6jYqCIzJf46XcYKaFAF/M46p
   5cbJ7tmPzrO6MgaAwJBU3kvOCVDTXGwA4R+V6wlBb0M7LQ7csucTSS6YX
   ZVrBmWVkEYzWq1ULfEPsMhBQxK4jOk7MOR+8Ty8fYVqZfZE5Pj5p9EvKg
   1EheGGvs141dk9UJW41294PaPG4XcNS7AywZrbbij1X1zpaHu32ugE6wf
   Q==;
X-CSE-ConnectionGUID: 2kmsfN9GSD+0PM2MpjBAxw==
X-CSE-MsgGUID: QHtoFdbMRN+oO+9tpkw6oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="32885582"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="32885582"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 20:02:09 -0700
X-CSE-ConnectionGUID: 8xM526FBSGOUG6kCcns4Bg==
X-CSE-MsgGUID: 60fHvdAEQkGEWCgThFgsWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="79799441"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2024 20:02:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t359p-000SyF-3A;
	Tue, 22 Oct 2024 03:02:05 +0000
Date: Tue, 22 Oct 2024 11:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5970/6324]
 drivers/pinctrl/spacemit/pinctrl-k1.c:577 spacemit_pinconf_generate_config()
 error: uninitialized symbol 'drv_strength'.
Message-ID: <202410221148.OT1sWsE1-lkp@intel.com>
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
TO: Yixun Lan <dlan@gentoo.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   63b3ff03d91ae8f875fe8747c781a521f78cde17
commit: a83c29e1d145cca5240952100acd1cd60f25fb5f [5970/6324] pinctrl: spacemit: add support for SpacemiT K1 SoC
:::::: branch date: 21 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-r072-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221148.OT1sWsE1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410221148.OT1sWsE1-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/spacemit/pinctrl-k1.c:577 spacemit_pinconf_generate_config() error: uninitialized symbol 'drv_strength'.
drivers/pinctrl/spacemit/pinctrl-k1.c:587 spacemit_pinconf_generate_config() error: uninitialized symbol 'slew_rate'.

Old smatch warnings:
drivers/pinctrl/spacemit/pinctrl-k1.c:593 spacemit_pinconf_generate_config() error: uninitialized symbol 'slew_rate'.

vim +/drv_strength +577 drivers/pinctrl/spacemit/pinctrl-k1.c

a83c29e1d145cc Yixun Lan 2024-10-16  499  
a83c29e1d145cc Yixun Lan 2024-10-16  500  #define ENABLE_DRV_STRENGTH	BIT(1)
a83c29e1d145cc Yixun Lan 2024-10-16  501  #define ENABLE_SLEW_RATE	BIT(2)
a83c29e1d145cc Yixun Lan 2024-10-16  502  static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
a83c29e1d145cc Yixun Lan 2024-10-16  503  					    unsigned long *configs,
a83c29e1d145cc Yixun Lan 2024-10-16  504  					    unsigned int num_configs,
a83c29e1d145cc Yixun Lan 2024-10-16  505  					    u32 *value)
a83c29e1d145cc Yixun Lan 2024-10-16  506  {
a83c29e1d145cc Yixun Lan 2024-10-16  507  	enum spacemit_pin_io_type type;
a83c29e1d145cc Yixun Lan 2024-10-16  508  	int i, param;
a83c29e1d145cc Yixun Lan 2024-10-16  509  	u32 v = 0, voltage = 0, arg, val;
a83c29e1d145cc Yixun Lan 2024-10-16  510  	u32 flag = 0, drv_strength, slew_rate;
a83c29e1d145cc Yixun Lan 2024-10-16  511  
a83c29e1d145cc Yixun Lan 2024-10-16  512  	if (!spin)
a83c29e1d145cc Yixun Lan 2024-10-16  513  		return -EINVAL;
a83c29e1d145cc Yixun Lan 2024-10-16  514  
a83c29e1d145cc Yixun Lan 2024-10-16  515  	for (i = 0; i < num_configs; i++) {
a83c29e1d145cc Yixun Lan 2024-10-16  516  		param = pinconf_to_config_param(configs[i]);
a83c29e1d145cc Yixun Lan 2024-10-16  517  		arg = pinconf_to_config_argument(configs[i]);
a83c29e1d145cc Yixun Lan 2024-10-16  518  
a83c29e1d145cc Yixun Lan 2024-10-16  519  		switch (param) {
a83c29e1d145cc Yixun Lan 2024-10-16  520  		case PIN_CONFIG_BIAS_DISABLE:
a83c29e1d145cc Yixun Lan 2024-10-16  521  			v &= ~(PAD_PULL_EN | PAD_PULLDOWN | PAD_PULLUP);
a83c29e1d145cc Yixun Lan 2024-10-16  522  			v &= ~PAD_STRONG_PULL;
a83c29e1d145cc Yixun Lan 2024-10-16  523  			break;
a83c29e1d145cc Yixun Lan 2024-10-16  524  		case PIN_CONFIG_BIAS_PULL_DOWN:
a83c29e1d145cc Yixun Lan 2024-10-16  525  			v &= ~(PAD_PULLUP | PAD_STRONG_PULL);
a83c29e1d145cc Yixun Lan 2024-10-16  526  			v |= (PAD_PULL_EN | PAD_PULLDOWN);
a83c29e1d145cc Yixun Lan 2024-10-16  527  			break;
a83c29e1d145cc Yixun Lan 2024-10-16  528  		case PIN_CONFIG_BIAS_PULL_UP:
a83c29e1d145cc Yixun Lan 2024-10-16  529  			v &= ~PAD_PULLDOWN;
a83c29e1d145cc Yixun Lan 2024-10-16  530  			v |= (PAD_PULL_EN | PAD_PULLUP);
a83c29e1d145cc Yixun Lan 2024-10-16  531  
a83c29e1d145cc Yixun Lan 2024-10-16  532  			if (arg == 1)
a83c29e1d145cc Yixun Lan 2024-10-16  533  				v |= PAD_STRONG_PULL;
a83c29e1d145cc Yixun Lan 2024-10-16  534  			break;
a83c29e1d145cc Yixun Lan 2024-10-16  535  		case PIN_CONFIG_DRIVE_STRENGTH:
a83c29e1d145cc Yixun Lan 2024-10-16  536  			flag |= ENABLE_DRV_STRENGTH;
a83c29e1d145cc Yixun Lan 2024-10-16  537  			drv_strength = arg;
a83c29e1d145cc Yixun Lan 2024-10-16  538  			break;
a83c29e1d145cc Yixun Lan 2024-10-16  539  		case PIN_CONFIG_INPUT_SCHMITT:
a83c29e1d145cc Yixun Lan 2024-10-16  540  			v &= ~PAD_SCHMITT;
a83c29e1d145cc Yixun Lan 2024-10-16  541  			v |= FIELD_PREP(PAD_SCHMITT, arg);
a83c29e1d145cc Yixun Lan 2024-10-16  542  			break;
a83c29e1d145cc Yixun Lan 2024-10-16  543  		case PIN_CONFIG_POWER_SOURCE:
a83c29e1d145cc Yixun Lan 2024-10-16  544  			voltage = arg;
a83c29e1d145cc Yixun Lan 2024-10-16  545  			break;
a83c29e1d145cc Yixun Lan 2024-10-16  546  		case PIN_CONFIG_SLEW_RATE:
a83c29e1d145cc Yixun Lan 2024-10-16  547  			if (arg) {
a83c29e1d145cc Yixun Lan 2024-10-16  548  				flag |= ENABLE_SLEW_RATE;
a83c29e1d145cc Yixun Lan 2024-10-16  549  				v |= PAD_SLEW_RATE_EN;
a83c29e1d145cc Yixun Lan 2024-10-16  550  				slew_rate = arg;
a83c29e1d145cc Yixun Lan 2024-10-16  551  			} else {
a83c29e1d145cc Yixun Lan 2024-10-16  552  				v &= ~PAD_SLEW_RATE_EN;
a83c29e1d145cc Yixun Lan 2024-10-16  553  			}
a83c29e1d145cc Yixun Lan 2024-10-16  554  			break;
a83c29e1d145cc Yixun Lan 2024-10-16  555  		default:
a83c29e1d145cc Yixun Lan 2024-10-16  556  			return -EINVAL;
a83c29e1d145cc Yixun Lan 2024-10-16  557  		}
a83c29e1d145cc Yixun Lan 2024-10-16  558  	}
a83c29e1d145cc Yixun Lan 2024-10-16  559  
a83c29e1d145cc Yixun Lan 2024-10-16  560  	if (flag & ENABLE_DRV_STRENGTH) {
a83c29e1d145cc Yixun Lan 2024-10-16  561  		type = spacemit_to_pin_io_type(spin);
a83c29e1d145cc Yixun Lan 2024-10-16  562  
a83c29e1d145cc Yixun Lan 2024-10-16  563  		/* fix external io type */
a83c29e1d145cc Yixun Lan 2024-10-16  564  		if (type == IO_TYPE_EXTERNAL) {
a83c29e1d145cc Yixun Lan 2024-10-16  565  			switch (voltage) {
a83c29e1d145cc Yixun Lan 2024-10-16  566  			case 1800:
a83c29e1d145cc Yixun Lan 2024-10-16  567  				type = IO_TYPE_1V8;
a83c29e1d145cc Yixun Lan 2024-10-16  568  				break;
a83c29e1d145cc Yixun Lan 2024-10-16  569  			case 3300:
a83c29e1d145cc Yixun Lan 2024-10-16  570  				type = IO_TYPE_3V3;
a83c29e1d145cc Yixun Lan 2024-10-16  571  				break;
a83c29e1d145cc Yixun Lan 2024-10-16  572  			default:
a83c29e1d145cc Yixun Lan 2024-10-16  573  				return -EINVAL;
a83c29e1d145cc Yixun Lan 2024-10-16  574  			}
a83c29e1d145cc Yixun Lan 2024-10-16  575  		}
a83c29e1d145cc Yixun Lan 2024-10-16  576  
a83c29e1d145cc Yixun Lan 2024-10-16 @577  		val = spacemit_get_driver_strength(type, drv_strength);
a83c29e1d145cc Yixun Lan 2024-10-16  578  
a83c29e1d145cc Yixun Lan 2024-10-16  579  		v &= ~PAD_DRIVE;
a83c29e1d145cc Yixun Lan 2024-10-16  580  		v |= FIELD_PREP(PAD_DRIVE, val);
a83c29e1d145cc Yixun Lan 2024-10-16  581  	}
a83c29e1d145cc Yixun Lan 2024-10-16  582  
a83c29e1d145cc Yixun Lan 2024-10-16  583  	if (flag & ENABLE_SLEW_RATE) {
a83c29e1d145cc Yixun Lan 2024-10-16  584  		/* check, driver strength & slew rate */
a83c29e1d145cc Yixun Lan 2024-10-16  585  		if (flag & ENABLE_DRV_STRENGTH) {
a83c29e1d145cc Yixun Lan 2024-10-16  586  			val = FIELD_GET(PAD_SLEW_RATE, v) + 2;
a83c29e1d145cc Yixun Lan 2024-10-16 @587  			if (slew_rate > 1 && slew_rate != val) {
a83c29e1d145cc Yixun Lan 2024-10-16  588  				pr_err("slew rate conflict with drive strength\n");
a83c29e1d145cc Yixun Lan 2024-10-16  589  				return -EINVAL;
a83c29e1d145cc Yixun Lan 2024-10-16  590  			}
a83c29e1d145cc Yixun Lan 2024-10-16  591  		} else {
a83c29e1d145cc Yixun Lan 2024-10-16  592  			v &= ~PAD_SLEW_RATE;
a83c29e1d145cc Yixun Lan 2024-10-16  593  			slew_rate = slew_rate > 1 ? (slew_rate - 2) : 0;
a83c29e1d145cc Yixun Lan 2024-10-16  594  			v |= FIELD_PREP(PAD_SLEW_RATE, slew_rate);
a83c29e1d145cc Yixun Lan 2024-10-16  595  		}
a83c29e1d145cc Yixun Lan 2024-10-16  596  	}
a83c29e1d145cc Yixun Lan 2024-10-16  597  
a83c29e1d145cc Yixun Lan 2024-10-16  598  	*value = v;
a83c29e1d145cc Yixun Lan 2024-10-16  599  
a83c29e1d145cc Yixun Lan 2024-10-16  600  	return 0;
a83c29e1d145cc Yixun Lan 2024-10-16  601  }
a83c29e1d145cc Yixun Lan 2024-10-16  602  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
