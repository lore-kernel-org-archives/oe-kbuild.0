Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD9734DCEB
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 23:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780184589; cv=none; b=j2Wovtf906Vsn89ncukszOxFrqkR6HsLUPCqyYvXQmCshB5ADRfE17XawV2BSbmxBlZfyIAFxMpW/e0J0t2+Oc3tUFY4Bl6yeLCM75UA2rTh+Gp2xanf9fjvQBQ3Wr0MYCHGvppPjynRwpyT0jbROK9XXFuPhtW4dugKkbJJ9b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780184589; c=relaxed/simple;
	bh=tLPAfFHCSqNJxRbbwNqxl5tDxedZ2kYVMA9diaIWzlM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kVfelCrLBVF5A8dksqCPxGxEEcygo4sdkfoKX9eLh5tzzXApyhszGYInFWP+mSXg0kouJkCrhyYoiHWaBZUWdDYxAqi0vGPnqtQRkU+cRyz7aFpZHjRq3idc4aCO+ImiAoW3rYmWDr1NkFTQg+7H7yxf25/RE04UfPP6tYNv7mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AkucyIGY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AkucyIGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780184588; x=1811720588;
  h=date:from:to:cc:subject:message-id;
  bh=tLPAfFHCSqNJxRbbwNqxl5tDxedZ2kYVMA9diaIWzlM=;
  b=AkucyIGY9e0pCOntkSsugeIXq6vti0Wc6LwVGFQeulFDI87ZeI2wTWQ7
   UlQREMmfzPQuQWtKRsVSE+AFu2UcEs98IV8Vw1qfEVDioEUr8/T+jNEW4
   BLJt/dWg68BINzB23cl9dOFju6+PJj+8G+GV+ssaorNTide8pfSQGYNDE
   YRyqk8TeXG2HXISV7s5cK4Ew2PIOFG0MrhGwadKcDQR47tDcSzIVmrCjS
   DaOmX4qpHN1B2jZFzi0EceQC6ng+JT3rNM8VY76G+npkOy2mEHoAlKv1w
   J9Be2AGChxkHo05qeOYlnkAMMXdYLJUHuCvIryCAcanmMf+bqvvgDfcVF
   g==;
X-CSE-ConnectionGUID: 45gZIEKvRHe0S0jUPVpLeA==
X-CSE-MsgGUID: q46UE8hvQKObYgSXAl14gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="81048895"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="81048895"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 16:43:07 -0700
X-CSE-ConnectionGUID: ztz7bl/jRN24RicmRIbBvw==
X-CSE-MsgGUID: GHu5SZzCSKqpNuUNBa3vOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="243314007"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 May 2026 16:43:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTTKZ-000000008y0-2fXA;
	Sat, 30 May 2026 23:43:03 +0000
Date: Sun, 31 May 2026 07:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.15-2025-09 0/4]
 sound/soc/soc-ops.c:324:19: sparse: sparse: unsigned value that used to be
 signed checked against zero?
Message-ID: <202605310743.Hm25nSKF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: sound/soc/soc-ops.c:324:19: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15-2025-09
head:   2b9ef977609620044b8dcf8873b725902be98ff8
commit: 9e8895f1b3d4433f6d78aa6578e9db61ca6e6830 [0/4] ASoC: ops: Reject out of bounds values in snd_soc_put_volsw()
:::::: branch date: 4 days ago
:::::: commit date: 4 years, 4 months ago
config: i386-randconfig-061-20260530 (https://download.01.org/0day-ci/archive/20260531/202605310743.Hm25nSKF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605310743.Hm25nSKF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605310743.Hm25nSKF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/soc-ops.c:645:33: sparse: sparse: invalid assignment: &=
   sound/soc/soc-ops.c:645:33: sparse:    left side has type unsigned short
   sound/soc/soc-ops.c:645:33: sparse:    right side has type restricted __be16
   sound/soc/soc-ops.c:649:33: sparse: sparse: invalid assignment: &=
   sound/soc/soc-ops.c:649:33: sparse:    left side has type unsigned int
   sound/soc/soc-ops.c:649:33: sparse:    right side has type restricted __be32
>> sound/soc/soc-ops.c:324:19: sparse: sparse: unsigned value that used to be signed checked against zero?
   sound/soc/soc-ops.c:319:15: sparse: signed value source
   sound/soc/soc-ops.c:337:28: sparse: sparse: unsigned value that used to be signed checked against zero?
   sound/soc/soc-ops.c:332:24: sparse: signed value source

vim +324 sound/soc/soc-ops.c

7077148fb50a12 Mark Brown 2014-10-28  285  
7077148fb50a12 Mark Brown 2014-10-28  286  /**
7077148fb50a12 Mark Brown 2014-10-28  287   * snd_soc_put_volsw - single mixer put callback
7077148fb50a12 Mark Brown 2014-10-28  288   * @kcontrol: mixer control
7077148fb50a12 Mark Brown 2014-10-28  289   * @ucontrol: control element information
7077148fb50a12 Mark Brown 2014-10-28  290   *
7077148fb50a12 Mark Brown 2014-10-28  291   * Callback to set the value of a single mixer control, or a double mixer
7077148fb50a12 Mark Brown 2014-10-28  292   * control that spans 2 registers.
7077148fb50a12 Mark Brown 2014-10-28  293   *
7077148fb50a12 Mark Brown 2014-10-28  294   * Returns 0 for success.
7077148fb50a12 Mark Brown 2014-10-28  295   */
7077148fb50a12 Mark Brown 2014-10-28  296  int snd_soc_put_volsw(struct snd_kcontrol *kcontrol,
7077148fb50a12 Mark Brown 2014-10-28  297  	struct snd_ctl_elem_value *ucontrol)
7077148fb50a12 Mark Brown 2014-10-28  298  {
7077148fb50a12 Mark Brown 2014-10-28  299  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
7077148fb50a12 Mark Brown 2014-10-28  300  	struct soc_mixer_control *mc =
7077148fb50a12 Mark Brown 2014-10-28  301  		(struct soc_mixer_control *)kcontrol->private_value;
7077148fb50a12 Mark Brown 2014-10-28  302  	unsigned int reg = mc->reg;
7077148fb50a12 Mark Brown 2014-10-28  303  	unsigned int reg2 = mc->rreg;
7077148fb50a12 Mark Brown 2014-10-28  304  	unsigned int shift = mc->shift;
7077148fb50a12 Mark Brown 2014-10-28  305  	unsigned int rshift = mc->rshift;
7077148fb50a12 Mark Brown 2014-10-28  306  	int max = mc->max;
7077148fb50a12 Mark Brown 2014-10-28  307  	int min = mc->min;
7077148fb50a12 Mark Brown 2014-10-28  308  	unsigned int sign_bit = mc->sign_bit;
7077148fb50a12 Mark Brown 2014-10-28  309  	unsigned int mask = (1 << fls(max)) - 1;
7077148fb50a12 Mark Brown 2014-10-28  310  	unsigned int invert = mc->invert;
7077148fb50a12 Mark Brown 2014-10-28  311  	int err;
7077148fb50a12 Mark Brown 2014-10-28  312  	bool type_2r = false;
7077148fb50a12 Mark Brown 2014-10-28  313  	unsigned int val2 = 0;
7077148fb50a12 Mark Brown 2014-10-28  314  	unsigned int val, val_mask;
7077148fb50a12 Mark Brown 2014-10-28  315  
7077148fb50a12 Mark Brown 2014-10-28  316  	if (sign_bit)
7077148fb50a12 Mark Brown 2014-10-28  317  		mask = BIT(sign_bit + 1) - 1;
7077148fb50a12 Mark Brown 2014-10-28  318  
9e8895f1b3d443 Mark Brown 2022-01-24  319  	val = ucontrol->value.integer.value[0];
9e8895f1b3d443 Mark Brown 2022-01-24  320  	if (mc->platform_max && val > mc->platform_max)
9e8895f1b3d443 Mark Brown 2022-01-24  321  		return -EINVAL;
9e8895f1b3d443 Mark Brown 2022-01-24  322  	if (val > max - min)
9e8895f1b3d443 Mark Brown 2022-01-24  323  		return -EINVAL;
9e8895f1b3d443 Mark Brown 2022-01-24 @324  	if (val < 0)
9e8895f1b3d443 Mark Brown 2022-01-24  325  		return -EINVAL;
9e8895f1b3d443 Mark Brown 2022-01-24  326  	val = (val + min) & mask;
7077148fb50a12 Mark Brown 2014-10-28  327  	if (invert)
7077148fb50a12 Mark Brown 2014-10-28  328  		val = max - val;
7077148fb50a12 Mark Brown 2014-10-28  329  	val_mask = mask << shift;
7077148fb50a12 Mark Brown 2014-10-28  330  	val = val << shift;
7077148fb50a12 Mark Brown 2014-10-28  331  	if (snd_soc_volsw_is_stereo(mc)) {
9e8895f1b3d443 Mark Brown 2022-01-24  332  		val2 = ucontrol->value.integer.value[1];
9e8895f1b3d443 Mark Brown 2022-01-24  333  		if (mc->platform_max && val2 > mc->platform_max)
9e8895f1b3d443 Mark Brown 2022-01-24  334  			return -EINVAL;
9e8895f1b3d443 Mark Brown 2022-01-24  335  		if (val2 > max - min)
9e8895f1b3d443 Mark Brown 2022-01-24  336  			return -EINVAL;
9e8895f1b3d443 Mark Brown 2022-01-24  337  		if (val2 < 0)
9e8895f1b3d443 Mark Brown 2022-01-24  338  			return -EINVAL;
9e8895f1b3d443 Mark Brown 2022-01-24  339  		val2 = (val2 + min) & mask;
7077148fb50a12 Mark Brown 2014-10-28  340  		if (invert)
7077148fb50a12 Mark Brown 2014-10-28  341  			val2 = max - val2;
7077148fb50a12 Mark Brown 2014-10-28  342  		if (reg == reg2) {
7077148fb50a12 Mark Brown 2014-10-28  343  			val_mask |= mask << rshift;
7077148fb50a12 Mark Brown 2014-10-28  344  			val |= val2 << rshift;
7077148fb50a12 Mark Brown 2014-10-28  345  		} else {
7077148fb50a12 Mark Brown 2014-10-28  346  			val2 = val2 << shift;
7077148fb50a12 Mark Brown 2014-10-28  347  			type_2r = true;
7077148fb50a12 Mark Brown 2014-10-28  348  		}
7077148fb50a12 Mark Brown 2014-10-28  349  	}
7077148fb50a12 Mark Brown 2014-10-28  350  	err = snd_soc_component_update_bits(component, reg, val_mask, val);
7077148fb50a12 Mark Brown 2014-10-28  351  	if (err < 0)
7077148fb50a12 Mark Brown 2014-10-28  352  		return err;
7077148fb50a12 Mark Brown 2014-10-28  353  
7077148fb50a12 Mark Brown 2014-10-28  354  	if (type_2r)
7077148fb50a12 Mark Brown 2014-10-28  355  		err = snd_soc_component_update_bits(component, reg2, val_mask,
7077148fb50a12 Mark Brown 2014-10-28  356  			val2);
7077148fb50a12 Mark Brown 2014-10-28  357  
7077148fb50a12 Mark Brown 2014-10-28  358  	return err;
7077148fb50a12 Mark Brown 2014-10-28  359  }
7077148fb50a12 Mark Brown 2014-10-28  360  EXPORT_SYMBOL_GPL(snd_soc_put_volsw);
7077148fb50a12 Mark Brown 2014-10-28  361  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
