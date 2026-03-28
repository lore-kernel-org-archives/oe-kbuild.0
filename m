Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9814A20C029
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 05:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774675974; cv=none; b=Q89jl5ftnB/FJRZD8aLtiaoPO9deqswm46nzHTl8/1cQQqtV4zfPi/9yaF6uMNOkPX8BvyFzNN5b26+bkqPR/xomwdJRfLDFCess91nJA3jmdmgTaXLGknP6eSyfjGbLr1wJZeuKNfAJ3kEMLfsrVZuwkWnoYScNcWUg5eSNvJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774675974; c=relaxed/simple;
	bh=7B1vFecjq3VFgex9cCbvyvBtigg33uKiXsxrFepFe4Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ab4ytqTBQIb6dROIKXtRyXZLa3OUPGDklxwKxeosVH7yl7tAjqEtl9I9oQITD9zRT/dxCKc9mWKeB0Gu5plTMdtYR0hcMjyWT9dJEf2waAkUjwicc47k1HLyRCAmYH1UEZ4FtVDPZyOKdMVgQan4DyCTQQ7vqUWydtvwnfesgNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIMiBGdb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIMiBGdb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774675973; x=1806211973;
  h=date:from:to:cc:subject:message-id;
  bh=7B1vFecjq3VFgex9cCbvyvBtigg33uKiXsxrFepFe4Y=;
  b=VIMiBGdbUF0brrgHLBsLeBp8sgk/nBgvYqv2TAmiLNSFvKENr8VI4wCW
   o3GikTS2uNr4LZNzwKzlrQ1ZtQxv64VgdyunVGno69pa+rAdiab4ZhpSk
   fdXBHhNnqzugbCLAxO4TtvoZOI6dAGxAo4Qc48fHZ8JHDnBD497Xz3M2K
   cIP2IRj/sWavQSfCsaiw0o7iAK48usnVLznhkHJnBAnGe5/1+7CBRE4T6
   Iy8znbY/P7Ta6nuR8jXQVuiZM56le+h286JJWIsLwX1aPkTRtV2IQgAjy
   AIoKxc+s+cmqh2qECTdqH/MpQaxPwlJhCu9r1q/faikVat2uiJSQDGmFu
   w==;
X-CSE-ConnectionGUID: BZwOnnz5QKudrZ3buo4hyA==
X-CSE-MsgGUID: c0P1UnGzTfuLJq6iZJmhGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79651428"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="79651428"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 22:32:52 -0700
X-CSE-ConnectionGUID: 7/C4JrkqSeGGAGgbbstIQQ==
X-CSE-MsgGUID: X7lwlgn1TmKgtVKH9eVp+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="230291459"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2026 22:32:51 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6MHw-00000000B5p-2Q34;
	Sat, 28 Mar 2026 05:32:48 +0000
Date: Sat, 28 Mar 2026 13:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9060/10350]
 drivers/pinctrl/renesas/pinctrl-rzt2h.c:518 rzt2h_pinctrl_pinconf_get() warn:
 subtract is higher precedence than shift
Message-ID: <202603281332.dmdyeUJT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3b058d1aeeeff27a7289529c4944291613b364e9
commit: 494feecd60e876a4310cdda279d918e91f930091 [9060/10350] pinctrl: renesas: rzt2h: Add pin configuration support
:::::: branch date: 7 hours ago
:::::: commit date: 34 hours ago
config: arm64-randconfig-r073-20260328 (https://download.01.org/0day-ci/archive/20260328/202603281332.dmdyeUJT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603281332.dmdyeUJT-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/renesas/pinctrl-rzt2h.c:518 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:518 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:518 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:518 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift

Old smatch warnings:
drivers/pinctrl/renesas/pinctrl-rzt2h.c:551 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:551 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:551 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift
drivers/pinctrl/renesas/pinctrl-rzt2h.c:551 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift

vim +518 drivers/pinctrl/renesas/pinctrl-rzt2h.c

34d4d093077a5c Thierry Bultel 2025-08-08  489  
494feecd60e876 Lad Prabhakar  2026-03-19  490  static int rzt2h_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
494feecd60e876 Lad Prabhakar  2026-03-19  491  				     unsigned int pin,
494feecd60e876 Lad Prabhakar  2026-03-19  492  				     unsigned long *config)
494feecd60e876 Lad Prabhakar  2026-03-19  493  {
494feecd60e876 Lad Prabhakar  2026-03-19  494  	struct rzt2h_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
494feecd60e876 Lad Prabhakar  2026-03-19  495  	u32 port, param = pinconf_to_config_param(*config);
494feecd60e876 Lad Prabhakar  2026-03-19  496  	unsigned int arg;
494feecd60e876 Lad Prabhakar  2026-03-19  497  	u8 port_pin;
494feecd60e876 Lad Prabhakar  2026-03-19  498  	u64 drctl;
494feecd60e876 Lad Prabhakar  2026-03-19  499  	int ret;
494feecd60e876 Lad Prabhakar  2026-03-19  500  
494feecd60e876 Lad Prabhakar  2026-03-19  501  	ret = rzt2h_validate_pin(pctrl, pin);
494feecd60e876 Lad Prabhakar  2026-03-19  502  	if (ret)
494feecd60e876 Lad Prabhakar  2026-03-19  503  		return ret;
494feecd60e876 Lad Prabhakar  2026-03-19  504  
494feecd60e876 Lad Prabhakar  2026-03-19  505  	port = RZT2H_PIN_ID_TO_PORT(pin);
494feecd60e876 Lad Prabhakar  2026-03-19  506  	port_pin = RZT2H_PIN_ID_TO_PIN(pin);
494feecd60e876 Lad Prabhakar  2026-03-19  507  
494feecd60e876 Lad Prabhakar  2026-03-19  508  	switch (param) {
494feecd60e876 Lad Prabhakar  2026-03-19  509  	case PIN_CONFIG_SLEW_RATE:
494feecd60e876 Lad Prabhakar  2026-03-19  510  		drctl = rzt2h_pinctrl_readq(pctrl, port, DRCTL(port));
494feecd60e876 Lad Prabhakar  2026-03-19  511  		arg = field_get(DRCTL_SR_PIN_MASK(port_pin), drctl);
494feecd60e876 Lad Prabhakar  2026-03-19  512  		break;
494feecd60e876 Lad Prabhakar  2026-03-19  513  
494feecd60e876 Lad Prabhakar  2026-03-19  514  	case PIN_CONFIG_BIAS_DISABLE:
494feecd60e876 Lad Prabhakar  2026-03-19  515  	case PIN_CONFIG_BIAS_PULL_UP:
494feecd60e876 Lad Prabhakar  2026-03-19  516  	case PIN_CONFIG_BIAS_PULL_DOWN:
494feecd60e876 Lad Prabhakar  2026-03-19  517  		drctl = rzt2h_pinctrl_readq(pctrl, port, DRCTL(port));
494feecd60e876 Lad Prabhakar  2026-03-19 @518  		arg = field_get(DRCTL_PUD_PIN_MASK(port_pin), drctl);
494feecd60e876 Lad Prabhakar  2026-03-19  519  		/* for PIN_CONFIG_BIAS_PULL_UP/DOWN when enabled we just return 1 */
494feecd60e876 Lad Prabhakar  2026-03-19  520  		switch (arg) {
494feecd60e876 Lad Prabhakar  2026-03-19  521  		case DRCTL_PUD_NONE:
494feecd60e876 Lad Prabhakar  2026-03-19  522  			if (param != PIN_CONFIG_BIAS_DISABLE)
494feecd60e876 Lad Prabhakar  2026-03-19  523  				return -EINVAL;
494feecd60e876 Lad Prabhakar  2026-03-19  524  			break;
494feecd60e876 Lad Prabhakar  2026-03-19  525  		case DRCTL_PUD_PULL_UP:
494feecd60e876 Lad Prabhakar  2026-03-19  526  			if (param != PIN_CONFIG_BIAS_PULL_UP)
494feecd60e876 Lad Prabhakar  2026-03-19  527  				return -EINVAL;
494feecd60e876 Lad Prabhakar  2026-03-19  528  			arg = 1;
494feecd60e876 Lad Prabhakar  2026-03-19  529  			break;
494feecd60e876 Lad Prabhakar  2026-03-19  530  		case DRCTL_PUD_PULL_DOWN:
494feecd60e876 Lad Prabhakar  2026-03-19  531  			if (param != PIN_CONFIG_BIAS_PULL_DOWN)
494feecd60e876 Lad Prabhakar  2026-03-19  532  				return -EINVAL;
494feecd60e876 Lad Prabhakar  2026-03-19  533  			arg = 1;
494feecd60e876 Lad Prabhakar  2026-03-19  534  			break;
494feecd60e876 Lad Prabhakar  2026-03-19  535  		default:
494feecd60e876 Lad Prabhakar  2026-03-19  536  			return -EINVAL;
494feecd60e876 Lad Prabhakar  2026-03-19  537  		}
494feecd60e876 Lad Prabhakar  2026-03-19  538  		break;
494feecd60e876 Lad Prabhakar  2026-03-19  539  
494feecd60e876 Lad Prabhakar  2026-03-19  540  	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
494feecd60e876 Lad Prabhakar  2026-03-19  541  		drctl = rzt2h_pinctrl_readq(pctrl, port, DRCTL(port));
494feecd60e876 Lad Prabhakar  2026-03-19  542  		arg = field_get(DRCTL_SMT_PIN_MASK(port_pin), drctl);
494feecd60e876 Lad Prabhakar  2026-03-19  543  		if (!arg)
494feecd60e876 Lad Prabhakar  2026-03-19  544  			return -EINVAL;
494feecd60e876 Lad Prabhakar  2026-03-19  545  		break;
494feecd60e876 Lad Prabhakar  2026-03-19  546  
494feecd60e876 Lad Prabhakar  2026-03-19  547  	case PIN_CONFIG_DRIVE_STRENGTH_UA: {
494feecd60e876 Lad Prabhakar  2026-03-19  548  		int idx_drv;
494feecd60e876 Lad Prabhakar  2026-03-19  549  
494feecd60e876 Lad Prabhakar  2026-03-19  550  		drctl = rzt2h_pinctrl_readq(pctrl, port, DRCTL(port));
494feecd60e876 Lad Prabhakar  2026-03-19  551  		arg = field_get(DRCTL_DRV_PIN_MASK(port_pin), drctl);
494feecd60e876 Lad Prabhakar  2026-03-19  552  		idx_drv = rzt2h_drive_strength_idx_to_ua(arg);
494feecd60e876 Lad Prabhakar  2026-03-19  553  		if (idx_drv < 0)
494feecd60e876 Lad Prabhakar  2026-03-19  554  			return idx_drv;
494feecd60e876 Lad Prabhakar  2026-03-19  555  		arg = idx_drv;
494feecd60e876 Lad Prabhakar  2026-03-19  556  		break;
494feecd60e876 Lad Prabhakar  2026-03-19  557  	}
494feecd60e876 Lad Prabhakar  2026-03-19  558  
494feecd60e876 Lad Prabhakar  2026-03-19  559  	default:
494feecd60e876 Lad Prabhakar  2026-03-19  560  		return -ENOTSUPP;
494feecd60e876 Lad Prabhakar  2026-03-19  561  	}
494feecd60e876 Lad Prabhakar  2026-03-19  562  
494feecd60e876 Lad Prabhakar  2026-03-19  563  	*config = pinconf_to_config_packed(param, arg);
494feecd60e876 Lad Prabhakar  2026-03-19  564  	return 0;
494feecd60e876 Lad Prabhakar  2026-03-19  565  }
494feecd60e876 Lad Prabhakar  2026-03-19  566  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
