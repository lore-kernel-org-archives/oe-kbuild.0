Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C048155A4E
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717954; cv=none; b=ATl3xMiI6MdLo9rL1QhC5cQCDF3FKotlhFpJe9x0Ln4i2zQPsFtXQ0NSlFttXxvk5/wtxe+n/ylRZ7ss8i1vcTbfynNS5EaPMxHblI008wz4QnmbtmkdoEcUVvbtikvfiHwSLSPo5mROFSzqQBZMVUw2qELKdXL5fDB2W0vKveM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717954; c=relaxed/simple;
	bh=D/mU219xBjRbaLk6fC1mS6b0k4HLsfDwrclOkQkbWNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RUJHcJH/9TeATVqIBvmvSjgf1oRUEp3AbADL3V6TtzK41m5bw7WjE8hzEaEntcQHFBfkQJ2REG3BJuh6Lf2ff5u5hzFLZf59dfTIlDVF68O72i53fUFpneSkhkRjwlCG9HMGri7en7uSKUbnn6VqRyh/0v9fc/ATtXCFDMFpE5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8H4MaQm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8H4MaQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717952; x=1765253952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D/mU219xBjRbaLk6fC1mS6b0k4HLsfDwrclOkQkbWNE=;
  b=R8H4MaQmdNL/TpIJEfIqUsFWv71NhI+TTwTteoA20JrqEkmqEF+v47pm
   0ZbTzfRNPLYQ+1PLYLcWEolkn+61zc6ydkTl9NRfIGRZtjxOTTGxjUayL
   z6Y1md8CsEKYXwGramgxbjx9gYzgYU8EtBX2RjksqRy3bdZn241cgBKqf
   vSZRfuXzO8ufe2hwIfHzH/Lz/7Xg6nXFtewHJe+Nnk302sYda7XQN1Q0H
   6gi3fcEK/d0sI8dN+TWzGueYqG/DIFf9ZoyJ9AiNGWMnkuh2JdAb4NtT5
   dy61PKO6F6g8q61tPWyIMVt6YQzWlEV9aUVwzVZfRSLuxa3pIb/EDmsas
   Q==;
X-CSE-ConnectionGUID: 03lE1gvdSl6k9wdiyhP1mg==
X-CSE-MsgGUID: 15sbpa/DQDmzPUtBG/9FgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="44682903"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="44682903"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:19:10 -0800
X-CSE-ConnectionGUID: 3EpIwGx1TSyO/eUVTY/e0A==
X-CSE-MsgGUID: HzW7skZUQ8O+/B4L2/BMdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99776701"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Dec 2024 20:19:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVEg-0003pV-2F;
	Mon, 09 Dec 2024 04:19:06 +0000
Date: Mon, 9 Dec 2024 12:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pinctrl/spacemit/pinctrl-k1.c:577
 spacemit_pinconf_generate_config() error: uninitialized symbol
 'drv_strength'.
Message-ID: <202412071948.Cd419rPp-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Yixun Lan <dlan@gentoo.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: a83c29e1d145cca5240952100acd1cd60f25fb5f pinctrl: spacemit: add support for SpacemiT K1 SoC
date:   7 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 weeks ago
config: openrisc-randconfig-r071-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071948.Cd419rPp-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412071948.Cd419rPp-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/spacemit/pinctrl-k1.c:577 spacemit_pinconf_generate_config() error: uninitialized symbol 'drv_strength'.
drivers/pinctrl/spacemit/pinctrl-k1.c:587 spacemit_pinconf_generate_config() error: uninitialized symbol 'slew_rate'.

Old smatch warnings:
drivers/pinctrl/spacemit/pinctrl-k1.c:593 spacemit_pinconf_generate_config() error: uninitialized symbol 'slew_rate'.

vim +/drv_strength +577 drivers/pinctrl/spacemit/pinctrl-k1.c

a83c29e1d145cca Yixun Lan 2024-10-16  499  
a83c29e1d145cca Yixun Lan 2024-10-16  500  #define ENABLE_DRV_STRENGTH	BIT(1)
a83c29e1d145cca Yixun Lan 2024-10-16  501  #define ENABLE_SLEW_RATE	BIT(2)
a83c29e1d145cca Yixun Lan 2024-10-16  502  static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
a83c29e1d145cca Yixun Lan 2024-10-16  503  					    unsigned long *configs,
a83c29e1d145cca Yixun Lan 2024-10-16  504  					    unsigned int num_configs,
a83c29e1d145cca Yixun Lan 2024-10-16  505  					    u32 *value)
a83c29e1d145cca Yixun Lan 2024-10-16  506  {
a83c29e1d145cca Yixun Lan 2024-10-16  507  	enum spacemit_pin_io_type type;
a83c29e1d145cca Yixun Lan 2024-10-16  508  	int i, param;
a83c29e1d145cca Yixun Lan 2024-10-16  509  	u32 v = 0, voltage = 0, arg, val;
a83c29e1d145cca Yixun Lan 2024-10-16  510  	u32 flag = 0, drv_strength, slew_rate;
a83c29e1d145cca Yixun Lan 2024-10-16  511  
a83c29e1d145cca Yixun Lan 2024-10-16  512  	if (!spin)
a83c29e1d145cca Yixun Lan 2024-10-16  513  		return -EINVAL;
a83c29e1d145cca Yixun Lan 2024-10-16  514  
a83c29e1d145cca Yixun Lan 2024-10-16  515  	for (i = 0; i < num_configs; i++) {
a83c29e1d145cca Yixun Lan 2024-10-16  516  		param = pinconf_to_config_param(configs[i]);
a83c29e1d145cca Yixun Lan 2024-10-16  517  		arg = pinconf_to_config_argument(configs[i]);
a83c29e1d145cca Yixun Lan 2024-10-16  518  
a83c29e1d145cca Yixun Lan 2024-10-16  519  		switch (param) {
a83c29e1d145cca Yixun Lan 2024-10-16  520  		case PIN_CONFIG_BIAS_DISABLE:
a83c29e1d145cca Yixun Lan 2024-10-16  521  			v &= ~(PAD_PULL_EN | PAD_PULLDOWN | PAD_PULLUP);
a83c29e1d145cca Yixun Lan 2024-10-16  522  			v &= ~PAD_STRONG_PULL;
a83c29e1d145cca Yixun Lan 2024-10-16  523  			break;
a83c29e1d145cca Yixun Lan 2024-10-16  524  		case PIN_CONFIG_BIAS_PULL_DOWN:
a83c29e1d145cca Yixun Lan 2024-10-16  525  			v &= ~(PAD_PULLUP | PAD_STRONG_PULL);
a83c29e1d145cca Yixun Lan 2024-10-16  526  			v |= (PAD_PULL_EN | PAD_PULLDOWN);
a83c29e1d145cca Yixun Lan 2024-10-16  527  			break;
a83c29e1d145cca Yixun Lan 2024-10-16  528  		case PIN_CONFIG_BIAS_PULL_UP:
a83c29e1d145cca Yixun Lan 2024-10-16  529  			v &= ~PAD_PULLDOWN;
a83c29e1d145cca Yixun Lan 2024-10-16  530  			v |= (PAD_PULL_EN | PAD_PULLUP);
a83c29e1d145cca Yixun Lan 2024-10-16  531  
a83c29e1d145cca Yixun Lan 2024-10-16  532  			if (arg == 1)
a83c29e1d145cca Yixun Lan 2024-10-16  533  				v |= PAD_STRONG_PULL;
a83c29e1d145cca Yixun Lan 2024-10-16  534  			break;
a83c29e1d145cca Yixun Lan 2024-10-16  535  		case PIN_CONFIG_DRIVE_STRENGTH:
a83c29e1d145cca Yixun Lan 2024-10-16  536  			flag |= ENABLE_DRV_STRENGTH;
a83c29e1d145cca Yixun Lan 2024-10-16  537  			drv_strength = arg;
a83c29e1d145cca Yixun Lan 2024-10-16  538  			break;
a83c29e1d145cca Yixun Lan 2024-10-16  539  		case PIN_CONFIG_INPUT_SCHMITT:
a83c29e1d145cca Yixun Lan 2024-10-16  540  			v &= ~PAD_SCHMITT;
a83c29e1d145cca Yixun Lan 2024-10-16  541  			v |= FIELD_PREP(PAD_SCHMITT, arg);
a83c29e1d145cca Yixun Lan 2024-10-16  542  			break;
a83c29e1d145cca Yixun Lan 2024-10-16  543  		case PIN_CONFIG_POWER_SOURCE:
a83c29e1d145cca Yixun Lan 2024-10-16  544  			voltage = arg;
a83c29e1d145cca Yixun Lan 2024-10-16  545  			break;
a83c29e1d145cca Yixun Lan 2024-10-16  546  		case PIN_CONFIG_SLEW_RATE:
a83c29e1d145cca Yixun Lan 2024-10-16  547  			if (arg) {
a83c29e1d145cca Yixun Lan 2024-10-16  548  				flag |= ENABLE_SLEW_RATE;
a83c29e1d145cca Yixun Lan 2024-10-16  549  				v |= PAD_SLEW_RATE_EN;
a83c29e1d145cca Yixun Lan 2024-10-16  550  				slew_rate = arg;
a83c29e1d145cca Yixun Lan 2024-10-16  551  			} else {
a83c29e1d145cca Yixun Lan 2024-10-16  552  				v &= ~PAD_SLEW_RATE_EN;
a83c29e1d145cca Yixun Lan 2024-10-16  553  			}
a83c29e1d145cca Yixun Lan 2024-10-16  554  			break;
a83c29e1d145cca Yixun Lan 2024-10-16  555  		default:
a83c29e1d145cca Yixun Lan 2024-10-16  556  			return -EINVAL;
a83c29e1d145cca Yixun Lan 2024-10-16  557  		}
a83c29e1d145cca Yixun Lan 2024-10-16  558  	}
a83c29e1d145cca Yixun Lan 2024-10-16  559  
a83c29e1d145cca Yixun Lan 2024-10-16  560  	if (flag & ENABLE_DRV_STRENGTH) {
a83c29e1d145cca Yixun Lan 2024-10-16  561  		type = spacemit_to_pin_io_type(spin);
a83c29e1d145cca Yixun Lan 2024-10-16  562  
a83c29e1d145cca Yixun Lan 2024-10-16  563  		/* fix external io type */
a83c29e1d145cca Yixun Lan 2024-10-16  564  		if (type == IO_TYPE_EXTERNAL) {
a83c29e1d145cca Yixun Lan 2024-10-16  565  			switch (voltage) {
a83c29e1d145cca Yixun Lan 2024-10-16  566  			case 1800:
a83c29e1d145cca Yixun Lan 2024-10-16  567  				type = IO_TYPE_1V8;
a83c29e1d145cca Yixun Lan 2024-10-16  568  				break;
a83c29e1d145cca Yixun Lan 2024-10-16  569  			case 3300:
a83c29e1d145cca Yixun Lan 2024-10-16  570  				type = IO_TYPE_3V3;
a83c29e1d145cca Yixun Lan 2024-10-16  571  				break;
a83c29e1d145cca Yixun Lan 2024-10-16  572  			default:
a83c29e1d145cca Yixun Lan 2024-10-16  573  				return -EINVAL;
a83c29e1d145cca Yixun Lan 2024-10-16  574  			}
a83c29e1d145cca Yixun Lan 2024-10-16  575  		}
a83c29e1d145cca Yixun Lan 2024-10-16  576  
a83c29e1d145cca Yixun Lan 2024-10-16 @577  		val = spacemit_get_driver_strength(type, drv_strength);
a83c29e1d145cca Yixun Lan 2024-10-16  578  
a83c29e1d145cca Yixun Lan 2024-10-16  579  		v &= ~PAD_DRIVE;
a83c29e1d145cca Yixun Lan 2024-10-16  580  		v |= FIELD_PREP(PAD_DRIVE, val);
a83c29e1d145cca Yixun Lan 2024-10-16  581  	}
a83c29e1d145cca Yixun Lan 2024-10-16  582  
a83c29e1d145cca Yixun Lan 2024-10-16  583  	if (flag & ENABLE_SLEW_RATE) {
a83c29e1d145cca Yixun Lan 2024-10-16  584  		/* check, driver strength & slew rate */
a83c29e1d145cca Yixun Lan 2024-10-16  585  		if (flag & ENABLE_DRV_STRENGTH) {
a83c29e1d145cca Yixun Lan 2024-10-16  586  			val = FIELD_GET(PAD_SLEW_RATE, v) + 2;
a83c29e1d145cca Yixun Lan 2024-10-16 @587  			if (slew_rate > 1 && slew_rate != val) {
a83c29e1d145cca Yixun Lan 2024-10-16  588  				pr_err("slew rate conflict with drive strength\n");
a83c29e1d145cca Yixun Lan 2024-10-16  589  				return -EINVAL;
a83c29e1d145cca Yixun Lan 2024-10-16  590  			}
a83c29e1d145cca Yixun Lan 2024-10-16  591  		} else {
a83c29e1d145cca Yixun Lan 2024-10-16  592  			v &= ~PAD_SLEW_RATE;
a83c29e1d145cca Yixun Lan 2024-10-16  593  			slew_rate = slew_rate > 1 ? (slew_rate - 2) : 0;
a83c29e1d145cca Yixun Lan 2024-10-16  594  			v |= FIELD_PREP(PAD_SLEW_RATE, slew_rate);
a83c29e1d145cca Yixun Lan 2024-10-16  595  		}
a83c29e1d145cca Yixun Lan 2024-10-16  596  	}
a83c29e1d145cca Yixun Lan 2024-10-16  597  
a83c29e1d145cca Yixun Lan 2024-10-16  598  	*value = v;
a83c29e1d145cca Yixun Lan 2024-10-16  599  
a83c29e1d145cca Yixun Lan 2024-10-16  600  	return 0;
a83c29e1d145cca Yixun Lan 2024-10-16  601  }
a83c29e1d145cca Yixun Lan 2024-10-16  602  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
