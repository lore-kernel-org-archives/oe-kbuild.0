Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D740A233943
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Oct 2026 00:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791936843; cv=none; b=f2QeXWkrMjFliCcKVrXl6km7uTTdzbu+6KkQagq+7WVGYpVQoApyeUaG4X3uvhzDogKmYfCWy1219jmFdeVXkZHJuoGrzhvDtD69CVeNa3ELtO3e4s2SvlJMNpeAnlKbjYYPTG/+fOiQCElMFCSz3cL7noXGhuHviMbPzykqUIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791936843; c=relaxed/simple;
	bh=hSemBwxsDMXSnYrtCS6UjqLHkts0JkYbhOinQkvBC/o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LJucOrGcfBg6qKrlcxN3TXk/wiDHBOciiJfGQZsPtOovwMl21rQQddJVAFQ06S6MW/jeUJ4uKmH+Iajab9dAAI4/qugKb/+W0E8Q8+jtKoQtayvINu9plUnUCo81MpC9VOm0yf1Ru6fHJBl9UjR+h4+5V1IXJXscdUgCZJIDIg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXol/Wyb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXol/Wyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791936837; x=1823472837;
  h=date:from:to:cc:subject:message-id;
  bh=hSemBwxsDMXSnYrtCS6UjqLHkts0JkYbhOinQkvBC/o=;
  b=UXol/WybDJj0Rm1DletZhcrevEv9j0Gf0lUTn3k+ueyTBFfcYOUAJbhR
   7tQEPid34Mrjgr9XqCrwLx8Eo1uLlKl+0QGwpWjTHU6JffpDfC+iGWETw
   N2KeBm36au73F5ciHvAGlgpWW8+rU55OvrfXs2h2F0oFN6Y0XOa4RvC6O
   7aCzZwMmFUuyW7mE/DvB7LuIx74ABOqQDXsZWZHjw2g1x58M9jWHrGWMI
   R4znAGGQuXYKR9LmU4hyaIK1SShtb4d+sUm7W+XVQjUgPJ1hrfQG9378h
   tA2b0cMU/1E1miRs7Isak3f+DOvN4bOp6gzhV0W26oN8Lk7H9yyoUxFLq
   A==;
X-CSE-ConnectionGUID: 77oR5GbyS2ugkm4w2ntLmw==
X-CSE-MsgGUID: Kd5beI0XTd2+R2kuq1XsaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="683273"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="683273"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 17:13:56 -0700
X-CSE-ConnectionGUID: 4pVN6K4EQi23e4mwIGGrnA==
X-CSE-MsgGUID: ViJfDwvIRPC5t6osMfDxgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1389195"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2026 17:13:55 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGmcy-00000000AlL-30hI;
	Wed, 14 Oct 2026 00:13:52 +0000
Date: Wed, 14 Oct 2026 02:13:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12792/16498]
 drivers/media/i2c/maxim-serdes/max96717.c:607:9: error: call to
 '__compiletime_assert_551' declared with 'error' attribute: field_prep: value
 too large for the field
Message-ID: <202610140236.zbp5W3yo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Cosmin Tanislav <demonsingur@gmail.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1fffefb00cc0b0da1f2ae24e3d33364530ea6515
commit: ea15bcd94f0f916b46bb1ba200ca84d2bd67ec5e [12792/16498] media: i2c: maxim-serdes: add MAX96717 driver
:::::: branch date: 6 hours ago
:::::: commit date: 9 days ago
config: s390-randconfig-r2109-20261013 (https://download.01.org/0day-ci/archive/20261014/202610140236.zbp5W3yo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610140236.zbp5W3yo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610140236.zbp5W3yo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/maxim-serdes/max96717.c:607:9: error: call to '__compiletime_assert_551' declared with 'error' attribute: field_prep: value too large for the field
     607 |                 val = field_prep(mask, arg ? en_val : ~en_val);
         |                       ^
   include/linux/bitfield.h:296:32: note: expanded from macro 'field_prep'
     296 |         (__builtin_constant_p(mask) ? __FIELD_PREP(mask, val, "field_prep: ") \
         |                                       ^
   include/linux/bitfield.h:91:3: note: expanded from macro '__FIELD_PREP'
      91 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
         |                 ^
   include/linux/bitfield.h:70:3: note: expanded from macro '__BF_FIELD_CHECK_MASK'
      70 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:68:1: note: expanded from here
      68 | __compiletime_assert_551
         | ^
   1 error generated.


vim +607 drivers/media/i2c/maxim-serdes/max96717.c

ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  576  
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  577  static int max96717_conf_pin_config_set_one(struct max96717_priv *priv,
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  578  					    unsigned int offset,
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  579  					    unsigned long config)
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  580  {
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  581  	u32 param = pinconf_to_config_param(config);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  582  	u32 arg = pinconf_to_config_argument(config);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  583  	unsigned int reg, mask, val, en_val;
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  584  	int ret;
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  585  
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  586  	ret = max96717_get_pin_config_reg(offset, param, &reg, &mask, &en_val);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  587  	if (ret)
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  588  		return ret;
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  589  
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  590  	switch (param) {
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  591  	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  592  	case PIN_CONFIG_DRIVE_PUSH_PULL:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  593  	case PIN_CONFIG_BIAS_DISABLE:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  594  	case PIN_CONFIG_BIAS_PULL_DOWN:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  595  	case PIN_CONFIG_BIAS_PULL_UP:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  596  		val = field_prep(mask, en_val);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  597  
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  598  		ret = regmap_update_bits(priv->regmap, reg, mask, val);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  599  		break;
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  600  	case MAX96717_PINCTRL_JITTER_COMPENSATION_EN:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  601  	case MAX96717_PINCTRL_PULL_STRENGTH_HIGH:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  602  	case MAX96717_PINCTRL_TX_EN:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  603  	case MAX96717_PINCTRL_RX_EN:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  604  	case PIN_CONFIG_OUTPUT_ENABLE:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  605  	case PIN_CONFIG_INPUT_ENABLE:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  606  	case PIN_CONFIG_LEVEL:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30 @607  		val = field_prep(mask, arg ? en_val : ~en_val);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  608  
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  609  		ret = regmap_update_bits(priv->regmap, reg, mask, val);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  610  		break;
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  611  	case MAX96717_PINCTRL_TX_ID:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  612  	case MAX96717_PINCTRL_RX_ID:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  613  	case PIN_CONFIG_SLEW_RATE:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  614  		val = field_prep(mask, arg);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  615  
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  616  		ret = regmap_update_bits(priv->regmap, reg, mask, val);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  617  		break;
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  618  	default:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  619  		return -ENOTSUPP;
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  620  	}
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  621  
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  622  	if (ret)
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  623  		return ret;
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  624  
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  625  	switch (param) {
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  626  	case PIN_CONFIG_BIAS_PULL_DOWN:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  627  	case PIN_CONFIG_BIAS_PULL_UP:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  628  		arg = arg >= MAX96717_BIAS_PULL_STRENGTH_1000000_OHM;
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  629  		config = pinconf_to_config_packed(MAX96717_PINCTRL_PULL_STRENGTH_HIGH, arg);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  630  		return max96717_conf_pin_config_set_one(priv, offset, config);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  631  	case PIN_CONFIG_LEVEL:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  632  		config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 1);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  633  		return max96717_conf_pin_config_set_one(priv, offset, config);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  634  	case PIN_CONFIG_OUTPUT_ENABLE:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  635  		config = pinconf_to_config_packed(MAX96717_PINCTRL_RX_EN, 0);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  636  		return max96717_conf_pin_config_set_one(priv, offset, config);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  637  	case MAX96717_PINCTRL_TX_ID:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  638  		config = pinconf_to_config_packed(MAX96717_PINCTRL_TX_EN, 1);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  639  		return max96717_conf_pin_config_set_one(priv, offset, config);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  640  	case MAX96717_PINCTRL_RX_ID:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  641  		config = pinconf_to_config_packed(MAX96717_PINCTRL_RX_EN, 1);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  642  		return max96717_conf_pin_config_set_one(priv, offset, config);
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  643  	default:
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  644  		break;
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  645  	}
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  646  
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  647  	return 0;
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  648  }
ea15bcd94f0f91 Cosmin Tanislav 2026-09-30  649  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
