Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790D523D2A9
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jun 2025 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334573; cv=none; b=ZBsO2lKPu/SI60z67EVED41NPzGKt/teIK268oz3tHNX/tPcL3LqLWoeebDWX56/Yksxv+bA3WWUv8q8mopKoV5yZXUzGg35LmMlH/bRODrjNncCmEzGBfZhHx45dVBnMG4rQoB6kkskxjScUy4CfcgebzhqmNRhvIiX7fn6ARY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334573; c=relaxed/simple;
	bh=Z7z4RDXEGfeEllM2reZaPv216ZZx/xxsK3s2F/3eQds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uCT/+GYM+xtVLd4uq6wtP6HJ7m4WXXNbVEz1Wmmi/ZucKBhzVPmCuNnvr1KbJFLUj+L3HxHcpjgNLcrQlZPGPNxSzUySPMZRRJe/YeEXuQucb/cRBGbl2loMnlq/o4hWYRQBGrpBryMwyaeZo8M8r1dPyYIIAPnXmzQhz2ILo2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miKJOFOt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miKJOFOt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334572; x=1781870572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z7z4RDXEGfeEllM2reZaPv216ZZx/xxsK3s2F/3eQds=;
  b=miKJOFOtfcgXDn81xWkOnW0h4IyleRjM5Ao6FgfK/9LEFBTOWXE8l48w
   kZC55muy3FWBoV8HhDbzeADhb4rtF43GSTZshpHGoRnJ0pIqg/i3NLWdr
   O+laiS3eQMwiLN2A3eEv0TUF7t3I2FmRcFNPKoYxfJYDYwJDSyX98d7+J
   wAGFD4T0NIA+0eGRIR9lton1odyv4J1TgZ7YrM4b6nV+PlVIwokobdRJm
   v7OWuXYP1bWcJ5RTMFraXRqYm1mnZObkqfiAvMbfxWhmHWMk0N2v4pfOA
   FgCTdNkf1rVCGIIACNGmZlRlc7T4KoJiuZrTshkskoohGJRCnE/ksEfw0
   A==;
X-CSE-ConnectionGUID: CXnSELLMTl+Hm4VTGOZssw==
X-CSE-MsgGUID: hOitqW7OQI+D6kNDpKd4zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56268656"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56268656"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 05:02:51 -0700
X-CSE-ConnectionGUID: TNL9MHyTRKKh1ipKcr9Y1A==
X-CSE-MsgGUID: BXvY3W24RjmULPS5Tc5tIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150222289"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Jun 2025 05:02:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSDyh-000KiU-2K;
	Thu, 19 Jun 2025 12:02:47 +0000
Date: Thu, 19 Jun 2025 20:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linusw-pinctrl:devel 42/53] drivers/pinctrl/pinctrl-aw9523.c:658
 aw9523_gpio_set_multiple() warn: inconsistent returns '&awi->i2c_lock'.
Message-ID: <202506191952.A03cvn22-lkp@intel.com>
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
CC: linux-gpio@vger.kernel.org
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   62be3d6e481122f02364993fee8322a681072918
commit: dffe286e2428a32bf5a70648d22a678b83080414 [42/53] pinctrl: aw9523: use new GPIO line value setter callbacks
:::::: branch date: 5 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-161-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191952.A03cvn22-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506191952.A03cvn22-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/pinctrl-aw9523.c:658 aw9523_gpio_set_multiple() warn: inconsistent returns '&awi->i2c_lock'.

Old smatch warnings:
drivers/pinctrl/pinctrl-aw9523.c:354 aw9523_pconf_set() error: uninitialized symbol 'rc'.
drivers/pinctrl/pinctrl-aw9523.c:625 aw9523_gpio_get_multiple() error: uninitialized symbol 'ret'.

vim +658 drivers/pinctrl/pinctrl-aw9523.c

576623d706613f AngeloGioacchino Del Regno 2024-03-01  627  
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  628  static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
576623d706613f AngeloGioacchino Del Regno 2024-03-01  629  				    unsigned long *mask,
576623d706613f AngeloGioacchino Del Regno 2024-03-01  630  				    unsigned long *bits)
576623d706613f AngeloGioacchino Del Regno 2024-03-01  631  {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  632  	struct aw9523 *awi = gpiochip_get_data(chip);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  633  	u8 mask_lo, mask_hi, bits_lo, bits_hi;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  634  	unsigned int reg;
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  635  	int ret = 0;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  636  
4210ef801a2482 Andy Shevchenko            2024-03-29  637  	mask_lo = *mask;
4210ef801a2482 Andy Shevchenko            2024-03-29  638  	mask_hi = *mask >> 8;
4210ef801a2482 Andy Shevchenko            2024-03-29  639  	bits_lo = *bits;
4210ef801a2482 Andy Shevchenko            2024-03-29  640  	bits_hi = *bits >> 8;
4210ef801a2482 Andy Shevchenko            2024-03-29  641  
576623d706613f AngeloGioacchino Del Regno 2024-03-01  642  	mutex_lock(&awi->i2c_lock);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  643  	if (mask_hi) {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  644  		reg = AW9523_REG_OUT_STATE(AW9523_PINS_PER_PORT);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  645  		ret = regmap_write_bits(awi->regmap, reg, mask_hi, bits_hi);
091655b9285d83 Andy Shevchenko            2024-03-29  646  		if (ret)
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  647  			goto out;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  648  	}
576623d706613f AngeloGioacchino Del Regno 2024-03-01  649  	if (mask_lo) {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  650  		reg = AW9523_REG_OUT_STATE(0);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  651  		ret = regmap_write_bits(awi->regmap, reg, mask_lo, bits_lo);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  652  		if (ret)
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  653  			goto out;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  654  	}
576623d706613f AngeloGioacchino Del Regno 2024-03-01  655  	mutex_unlock(&awi->i2c_lock);
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  656  
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  657  out:
dffe286e2428a3 Bartosz Golaszewski        2025-06-12 @658  	return ret;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  659  }
576623d706613f AngeloGioacchino Del Regno 2024-03-01  660  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
