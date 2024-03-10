Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6B7200A6
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Mar 2024 04:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710044576; cv=none; b=Tr6DpJaGgSDcvRkWHgtDc1JTEc+qi3AqNhHf3i5m2CIOkUmHwDdSq/fSQwOLqX7/Dgzo/km9kqNzn5E7cW/i6rgE824PYzo2wC7C6e58r4nP/1ZlI6GqDxvPea/5+0DMEJMj34ME0k3D5M9+vavTzPYM0U/uGiGWx8iUY2RrESQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710044576; c=relaxed/simple;
	bh=TkgSddahhOmfROHV1FtKu/Lpr10mRxRy73Hq0U8EwPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qwyog288SoYww1yi5OphkvEQHOX8eOWKXSb1vg67lh0mFY3XSi2gMGfA4CXaUjB7fLeECqLtpPZygjejYJ9qGvAX/ennrnPWINwhO1BrJkqE5KHFLyvtGcYgCVm91bUO3l3JiYGGf4fW/KBvlvJJf40OITY0Kh0ouMnn6rOm4Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMi+iPBf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMi+iPBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710044574; x=1741580574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TkgSddahhOmfROHV1FtKu/Lpr10mRxRy73Hq0U8EwPM=;
  b=aMi+iPBfKmG2P7noV/4SZl9Q56D0ka0551/qLtsXOrnpjjhUOYDFPjqu
   M6kR2/mI66lhlxD0PT633IHvr7nbieSVsKMFkD29GEleFG7ULMsW3H9lz
   OXkBpzHPXGkFluml6WooXK1hWV6zmsSXYDnZAPW9WoCNjOUi1dj1xCPl+
   NK5DVMRMgD7AdkqPykDmIK1/eKGK+jxGtpd4HlPeP8d4JWhNh263mytUn
   kkNDZPzHv7/uF4sYeK9cKzFW3mFbm6zTfEuOD3RHWHFF/9LBikuprilRa
   jAIkDXXLvQQZb5QeOBNp46Uz7++efC4znQs/psjr+0A58oRWw+0kf+jq+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4870263"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="4870263"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 20:22:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="15410783"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Mar 2024 20:22:52 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjAi1-0007uR-2U;
	Sun, 10 Mar 2024 04:22:49 +0000
Date: Sun, 10 Mar 2024 12:22:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linusw-pinctrl:for-next 27/34] drivers/pinctrl/pinctrl-aw9523.c:374
 aw9523_pconf_set() error: uninitialized symbol 'rc'.
Message-ID: <202403101200.eV0N8uRc-lkp@intel.com>
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
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: David Bauer <mail@david-bauer.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
head:   ab4ca601bad180bee2109c5d0d1210a0ce75790c
commit: 576623d706613feec2392ef16b84e23a46200552 [27/34] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
:::::: branch date: 4 hours ago
:::::: commit date: 4 days ago
config: powerpc-randconfig-r071-20240308 (https://download.01.org/0day-ci/archive/20240310/202403101200.eV0N8uRc-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403101200.eV0N8uRc-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinctrl-aw9523.c:374 aw9523_pconf_set() error: uninitialized symbol 'rc'.
drivers/pinctrl/pinctrl-aw9523.c:645 aw9523_gpio_get_multiple() error: uninitialized symbol 'ret'.

vim +/rc +374 drivers/pinctrl/pinctrl-aw9523.c

576623d706613f AngeloGioacchino Del Regno 2024-03-01  302  
576623d706613f AngeloGioacchino Del Regno 2024-03-01  303  static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
576623d706613f AngeloGioacchino Del Regno 2024-03-01  304  			    unsigned long *configs, unsigned int num_configs)
576623d706613f AngeloGioacchino Del Regno 2024-03-01  305  {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  306  	struct aw9523 *awi = pinctrl_dev_get_drvdata(pctldev);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  307  	enum pin_config_param param;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  308  	int regbit = pin % AW9523_PINS_PER_PORT;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  309  	u32 arg;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  310  	u8 reg;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  311  	unsigned int mask, val;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  312  	int i, rc;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  313  
576623d706613f AngeloGioacchino Del Regno 2024-03-01  314  	mutex_lock(&awi->i2c_lock);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  315  	for (i = 0; i < num_configs; i++) {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  316  		param = pinconf_to_config_param(configs[i]);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  317  		arg = pinconf_to_config_argument(configs[i]);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  318  
576623d706613f AngeloGioacchino Del Regno 2024-03-01  319  		rc = aw9523_pcfg_param_to_reg(param, pin, &reg);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  320  		if (rc)
576623d706613f AngeloGioacchino Del Regno 2024-03-01  321  			goto end;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  322  
576623d706613f AngeloGioacchino Del Regno 2024-03-01  323  		switch (param) {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  324  		case PIN_CONFIG_OUTPUT:
576623d706613f AngeloGioacchino Del Regno 2024-03-01  325  			/* First, enable pin output */
576623d706613f AngeloGioacchino Del Regno 2024-03-01  326  			rc = regmap_update_bits(awi->regmap,
576623d706613f AngeloGioacchino Del Regno 2024-03-01  327  						AW9523_REG_CONF_STATE(pin),
576623d706613f AngeloGioacchino Del Regno 2024-03-01  328  						BIT(regbit), 0);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  329  			if (rc)
576623d706613f AngeloGioacchino Del Regno 2024-03-01  330  				goto end;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  331  
576623d706613f AngeloGioacchino Del Regno 2024-03-01  332  			/* Then, fall through to config output level */
576623d706613f AngeloGioacchino Del Regno 2024-03-01  333  			fallthrough;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  334  		case PIN_CONFIG_OUTPUT_ENABLE:
576623d706613f AngeloGioacchino Del Regno 2024-03-01  335  			arg = !arg;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  336  			fallthrough;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  337  		case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
576623d706613f AngeloGioacchino Del Regno 2024-03-01  338  		case PIN_CONFIG_BIAS_PULL_DOWN:
576623d706613f AngeloGioacchino Del Regno 2024-03-01  339  		case PIN_CONFIG_BIAS_PULL_UP:
576623d706613f AngeloGioacchino Del Regno 2024-03-01  340  		case PIN_CONFIG_INPUT_ENABLE:
576623d706613f AngeloGioacchino Del Regno 2024-03-01  341  			mask = BIT(regbit);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  342  			val = arg ? BIT(regbit) : 0;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  343  			break;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  344  		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
576623d706613f AngeloGioacchino Del Regno 2024-03-01  345  			/* Open-Drain is supported only on port 0 */
576623d706613f AngeloGioacchino Del Regno 2024-03-01  346  			if (pin >= AW9523_PINS_PER_PORT) {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  347  				rc = -EOPNOTSUPP;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  348  				goto end;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  349  			}
576623d706613f AngeloGioacchino Del Regno 2024-03-01  350  			mask = AW9523_GCR_GPOMD_MASK;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  351  			val = 0;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  352  			break;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  353  		case PIN_CONFIG_DRIVE_PUSH_PULL:
576623d706613f AngeloGioacchino Del Regno 2024-03-01  354  			/* Port 1 is always Push-Pull */
576623d706613f AngeloGioacchino Del Regno 2024-03-01  355  			if (pin >= AW9523_PINS_PER_PORT) {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  356  				mask = 0;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  357  				val = 0;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  358  				continue;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  359  			}
576623d706613f AngeloGioacchino Del Regno 2024-03-01  360  			mask = AW9523_GCR_GPOMD_MASK;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  361  			val = AW9523_GCR_GPOMD_MASK;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  362  			break;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  363  		default:
576623d706613f AngeloGioacchino Del Regno 2024-03-01  364  			rc = -EOPNOTSUPP;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  365  			goto end;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  366  		}
576623d706613f AngeloGioacchino Del Regno 2024-03-01  367  
576623d706613f AngeloGioacchino Del Regno 2024-03-01  368  		rc = regmap_update_bits(awi->regmap, reg, mask, val);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  369  		if (rc)
576623d706613f AngeloGioacchino Del Regno 2024-03-01  370  			goto end;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  371  	}
576623d706613f AngeloGioacchino Del Regno 2024-03-01  372  end:
576623d706613f AngeloGioacchino Del Regno 2024-03-01  373  	mutex_unlock(&awi->i2c_lock);
576623d706613f AngeloGioacchino Del Regno 2024-03-01 @374  	return rc;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  375  }
576623d706613f AngeloGioacchino Del Regno 2024-03-01  376  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
