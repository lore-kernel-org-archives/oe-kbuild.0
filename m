Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED03E36AEC
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Mar 2024 03:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709956756; cv=none; b=RiutjZ1CBqpHZByFV3UCqyRY/kw34mNXV6q8fTIC5mHkeXVqBoRUHJ+Xf84nVkqDd9hGEXTnarUeDS3fXEI+MWrsWqZxiu/eiXdS1Zx4UaDPqSBzHs7HBeA3/6qEgX8OqtAnJGkOrr6H82uACnNvBoxhhrgv1PojunY64YQGTE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709956756; c=relaxed/simple;
	bh=M6MHJd79UDo+MiLVaM//GxkhGv87DPZc+KApVhswJBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=So4wetxWzV5CFZzlZPWVDY7ceFI0N09kMZvCnEjGnTr8GaHdBljdh60O4oNEjtXaKmEQBKTx8pdHpXIUbNoUrWl8Lt6SEe4Tr2gJAljrJZ7oKmzUnxMQg0HSqBQjFN6/uRRWJxbU2OfKeFGbTx2iANwMRh/8mQJ27i746ZE6mf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1s2PFMf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1s2PFMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709956754; x=1741492754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M6MHJd79UDo+MiLVaM//GxkhGv87DPZc+KApVhswJBM=;
  b=I1s2PFMfYlcP2JBW/VPrS/3pK3sPxFOMVpcGUgtyFtdzZgObxTqLaebo
   c0wvjpqnxhnZHCT61n7KYVjdkvyEdt58MWf82z9s135+GOaj+694YpaPu
   Q/pnKMNezaBQ3a/ZBxRUHa2W0TOhRWTnJtXzGam1W4S/ajeiR0gDuX4yk
   dY7GuF5T/ugksS+WQTYPn/kbssnqHu7HPjKiTlAwpDYiST832f/gw/bYV
   ACH8/dUzv9jpl5XpiWej7613OOaP9/8K0JaSu7Ic3h/XrIv5lNnJ3lrso
   fuCCL/nkNwihaO3YXh1J/vnyScMItux+Z5TidGjyCGCOz+89PYvNdjDgz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4809535"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="4809535"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 19:59:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="15251235"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Mar 2024 19:59:11 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rinrZ-0006x3-2E;
	Sat, 09 Mar 2024 03:59:09 +0000
Date: Sat, 9 Mar 2024 11:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11963/12944] drivers/pinctrl/pinctrl-aw9523.c:374
 aw9523_pconf_set() error: uninitialized symbol 'rc'.
Message-ID: <202403091106.rUySSEnL-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: David Bauer <mail@david-bauer.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
commit: 576623d706613feec2392ef16b84e23a46200552 [11963/12944] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
:::::: branch date: 24 hours ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-r071-20240308 (https://download.01.org/0day-ci/archive/20240309/202403091106.rUySSEnL-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403091106.rUySSEnL-lkp@intel.com/

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
