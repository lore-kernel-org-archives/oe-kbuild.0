Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794734087;
	b=1X2z/CdmNp6rUC0YzYao7BF1ViCjtHkDMsejPYme4hHJW3K2i47/v5+jOVjOPOc0RVi8
	 O9DTfA59qHgmtb3IB1GvU0DhoTz29nNToottSKZXCkzxmjeARSYWBH8sN24givXH4A0uY
	 cWEE047LimDuR2EQp6M5BZJvlk71ufkpdN28c3fi/z1Kd8C9X1LFCnKGmmp7osTny9nV4
	 0Cw8D12IcOrLZXEKByhbVyJkm1DgJ3mrtfN7okxWskJrGl90VXE9jdAV8TZPdPedP21Ce
	 IgtCInC7r5hSTpqtLAooy7evr51NTIqwNQSSWDkai9+mX1o+yutVmd7VXHLf5v+44yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794734087;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AOLzvpJasJqHsI6EYiTITTwkstVkpvGYqCa6avcGo+0=;
	b=Yghnm1plt4Lgiu35WbOHyvWWTCnGhc5o8bF89D7JlymzAXV/PKPNHh2ypvdgV7Vh8BM/
	 SCikL/0B1601jhvSKCNZopxuNommUbk529nld+Zglb2oOKKZoXrDWEJG4LaDWcs7gfCWw
	 kDE1KEPtLTOuJart4DNOfPJuAoiouzMGWI71GVG/y3zWLWCIrL/pjEa69uE/rxhp0qbhW
	 U8jmo2NuatUJDsnUA6WW2NJvDwdEKqrLlXigDzhJgIsp3sbylajuM5NfH1+7SyhG7b8ZG
	 vMfuQjs3k+IuyQPjX+eYY2uWVU8ajNsRHKFhTCU4qTLHX58uZsLKFWiA+MP10jSnUhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D5lbVrQH;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1276606A31D
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 09:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1276606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D5lbVrQH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794734087; x=1826270087;
  h=date:from:to:cc:subject:message-id;
  bh=iBJZXxy/FawibWNSvppaBlWrZoEHZOdXUxZRcbBs22Q=;
  b=D5lbVrQHvFYzuDwrPiCLbhboBTTsNDePS1QRcEP+PxKd2EGSj+lTACYd
   rquU+165ORdwWIL3pMblIUmtncvvnj2LYaGp4IbuKjjHdHenhEzLYHfFe
   HrXkbMokQLg794zOGQCR5CBHaZzN6HGNz8yjbKwQuUPShCREs6EblJD4p
   wm7iTlnsqXUH4+PabGodBxk86pwWi/p7f43mJafl1BAKVREoIIpc05I9A
   SdIEhJMbSC5KL4EkZW0tP7E4vNfIxGmrXYm3zT5zmEtdCcl96iBNhx9F5
   MNRdkVgbK4HX+kdh9hrvWNq5STZmPUyXAx4nmj3qH6mqbwNjfToaaSB7l
   A==;
X-CSE-ConnectionGUID: jdc7psxXSLSPI904EKH0ag==
X-CSE-MsgGUID: Ek9eP7VaQOyblThxoCh1lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3487521"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3487521"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 01:14:47 -0800
X-CSE-ConnectionGUID: KerWeXiUQgO8xFNnKBNrvA==
X-CSE-MsgGUID: xtimTzPxSXmrzSlyEZhr8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9545965"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Nov 2026 01:14:45 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSWJv-0000000027y-1Dfj;
	Sun, 15 Nov 2026 09:14:43 +0000
Date: Sun, 15 Nov 2026 10:14:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/i2c/maxim-serdes/max96717.c:607:9: error: call
 to '__compiletime_assert_498' declared with 'error' attribute: field_prep:
 value too large for the field
Message-ID: <202611151041.O1qSF09B-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Cosmin Tanislav <demonsingur@gmail.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

Hi Cosmin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: ea15bcd94f0f916b46bb1ba200ca84d2bd67ec5e media: i2c: maxim-serdes: add MAX96717 driver
date:   6 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 weeks ago
config: s390-randconfig-2001-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151041.O1qSF09B-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151041.O1qSF09B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ea15bcd94f0f ("media: i2c: maxim-serdes: add MAX96717 driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151041.O1qSF09B-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/maxim-serdes/max96717.c:607:9: error: call to '__compiletime_assert_498' declared with 'error' attribute: field_prep: value too large for the field
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
   <scratch space>:144:1: note: expanded from here
     144 | __compiletime_assert_498
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
