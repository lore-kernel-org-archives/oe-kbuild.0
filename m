Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F3A3770B
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jul 2026 01:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783734824; cv=none; b=pOKNr57W+1A7/38oJESVIzX3LTOisebdmTQo7umFlvXYTRtbOCR1a/Xjo5Jd8aGKra6inS0krn+pOmXlMZAdN9JCz3J6FfG6AOyNQjT0XNYQz4z0/jnGBsw39sRPN/KHGFKRVvH+p1sZsQ+O74wmOUMUK37ym4s82xJdMqC2krU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783734824; c=relaxed/simple;
	bh=/QHCz/kYZ24QUe+ox7bzE+dMfmniFdV+1MIZSj5EKg4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DVPBkmr9brFx1oZQV5IfjWC0j+BzjcLxjCQ1VG2LfjdTzl9qAguFKEUt+BPntqf4j20/rL90TFjdPdudJ95NjJJppO2/4EYTHwEbVIeWDH2nXZOLegeKagPIt12scj7ksa/beP+o/6jiH/1eiw2RmyXPzVl6nEHE3pFwgAPbJm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=leTJxeVv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="leTJxeVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783734821; x=1815270821;
  h=date:from:to:cc:subject:message-id;
  bh=/QHCz/kYZ24QUe+ox7bzE+dMfmniFdV+1MIZSj5EKg4=;
  b=leTJxeVvmas/JDU+5fINaHcAL7bEnvgNN+UAtqLFkggiazcGS0XnEZtk
   uqMJynJJHcebk0CvFD/OJPdn+FY7cT/coNM6YqIBjp4SZIo5Qaw7zuiXf
   rGfr9VW/et/LAeXFak+7+VSgcxbsdsSpeSkggZSqAWBoZ0s3YNTkTOLvB
   0rtjsE5cdj/KHF7Ql9JtduazCg43Pqf9XD/JbNMWA1xJVr2k2KR9XKkHw
   FRCByaazhYyojY+p/3KbLGO1ogCB8i9vzdVFaAMaEWz56KI9oVWQJ+8Iq
   oI1aqQ/lByLtnOj06vskvuJ/wDy4L+Z9E0s5a/ZjxU0UGQ02ARripU8Di
   A==;
X-CSE-ConnectionGUID: OUXV9gKjQjmnE5ddvEMNlg==
X-CSE-MsgGUID: gAGJCyytS7a19vP0ZcBUxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71956488"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71956488"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 18:53:40 -0700
X-CSE-ConnectionGUID: FVUNl+qYT4Cbz64J72gqag==
X-CSE-MsgGUID: Em+XdnwhS2C467FC5toNNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259929399"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jul 2026 18:53:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiMuO-00000000JcM-2BFC;
	Sat, 11 Jul 2026 01:53:36 +0000
Date: Sat, 11 Jul 2026 09:52:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pinctrl/renesas/pinctrl-rzt2h.c:518
 rzt2h_pinctrl_pinconf_get() warn: subtract is higher precedence than shift
Message-ID: <202607110953.dvEW4hSi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a635d6748234582ea287c5ffeae28b9b23f91c7e
commit: 494feecd60e876a4310cdda279d918e91f930091 pinctrl: renesas: rzt2h: Add pin configuration support
date:   4 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r072-20260711 (https://download.01.org/0day-ci/archive/20260711/202607110953.dvEW4hSi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 494feecd60e8 ("pinctrl: renesas: rzt2h: Add pin configuration support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607110953.dvEW4hSi-lkp@intel.com/

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
