Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00300218AAB
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 00:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765241394; cv=none; b=CsH2YY7mHMN7jS0FtB6HWj+s7wJXRXwMT20U7QxAe51iTBBy9E3hcqXlVX/gg3zPqQX/X84rqlhw0lqT0vsSZG2s7A5J62gzzpu6XI2QdUf0sVsE5DN56h57Dw9QoCHRXkfZ+ma0iy4gusw4EFBROddi8CCEAPTRy3+KSCCX7L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765241394; c=relaxed/simple;
	bh=2O9jovKOcwdP8nX5BXeYJlWMHYeHTA7fGFQrIvr8AEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q5oHC1fHS2JoU9GAbM6E60vD69wVYhFBC3+40NB0wOn4FinEC3WuUvLlgI2HjxC7IF/NQKvUAa023SAh7zcBD2hsYZjpjEp0N+CCWuCCJbh+SO4evXn3aK4OHthhijmwiZPTFmwpFiLHJXJeJLLxaaE8wL7FS8Kcv5s6xlM5B4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/gRei5h; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/gRei5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765241393; x=1796777393;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2O9jovKOcwdP8nX5BXeYJlWMHYeHTA7fGFQrIvr8AEo=;
  b=F/gRei5hzafZRpHmV97m4jUNK+U9Fic1YJwOuUIJkb2cpd6GyvJRXZYJ
   iBeYAvP2H+zC3m9lIqsdHLOM0apGSZUsWUWvS2RejURZN7gotdK4op16t
   p0YWXtLYFkISLAKqXtzabdOcRwGYahlXd+Z32652f7C6oPux5KzJDatkx
   e51jFa1pSioSTqqcbTz1IjBqtm34gW+UUKlfvRPplFFYGYWMcBZTF6FaU
   DVM19cIkH3l4EPSB6p4EocanMYlP40OxIPn4I3o8iMkzytK26WLqLLxwe
   oBmLr2m7pm0qlqev67D7GqyT0FYvx3pGbqR60/pW5jZ9lyfPGSTsUh6yH
   w==;
X-CSE-ConnectionGUID: dNZr3gIIRRy+e7Zc1/S/4g==
X-CSE-MsgGUID: TJSPNYGDQFiQ2JUJ7LJySg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="54736588"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="54736588"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 16:49:50 -0800
X-CSE-ConnectionGUID: fNhnWt21RK2VBGsULzSn4A==
X-CSE-MsgGUID: I6reK6Q4R4mQog8cotuTXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="200261577"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Dec 2025 16:49:49 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSlvG-0000000015S-0Tui;
	Tue, 09 Dec 2025 00:49:46 +0000
Date: Tue, 9 Dec 2025 08:49:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pwm/pwm-stm32.c:818:14-15: WARNING opportunity for min()
Message-ID: <202512090822.CIs63625-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
CC: "Uwe Kleine-König" <ukleinek@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a110f942672c8995dc1cacb5a44c6730856743aa
commit: fd0b06972a8f92d57358e62267f5925721c73c6e pwm: stm32: add support for stm32mp25
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: hexagon-randconfig-r061-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090822.CIs63625-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 000e46219ba1ee53fc42d35e00c314c2807e8b14)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512090822.CIs63625-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pwm/pwm-stm32.c:818:14-15: WARNING opportunity for min()

vim +818 drivers/pwm/pwm-stm32.c

7edf7369205baa Benjamin Gaignard 2017-01-20  795  
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  796  static unsigned int stm32_pwm_detect_channels(struct stm32_timers *ddata,
19f1016ea9600e Philipp Zabel     2023-10-19  797  					      unsigned int *num_enabled)
7edf7369205baa Benjamin Gaignard 2017-01-20  798  {
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  799  	struct regmap *regmap = ddata->regmap;
19f1016ea9600e Philipp Zabel     2023-10-19  800  	u32 ccer, ccer_backup;
7edf7369205baa Benjamin Gaignard 2017-01-20  801  
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  802  	regmap_read(regmap, TIM_CCER, &ccer_backup);
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  803  	*num_enabled = hweight32(ccer_backup & TIM_CCER_CCXE);
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  804  
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  805  	if (ddata->ipidr) {
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  806  		u32 hwcfgr;
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  807  		unsigned int npwm;
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  808  
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  809  		/* Deduce from HWCFGR the number of outputs (MP25). */
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  810  		regmap_read(regmap, TIM_HWCFGR1, &hwcfgr);
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  811  
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  812  		/*
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  813  		 * Timers may have more capture/compare channels than the
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  814  		 * actual number of PWM channel outputs (e.g. TIM_CH[1..4]).
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  815  		 */
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  816  		npwm = FIELD_GET(TIM_HWCFGR1_NB_OF_CC, hwcfgr);
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  817  
fd0b06972a8f92 Fabrice Gasnier   2025-01-10 @818  		return npwm < STM32_MAX_PWM_OUTPUT ? npwm : STM32_MAX_PWM_OUTPUT;
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  819  	}
fd0b06972a8f92 Fabrice Gasnier   2025-01-10  820  
7edf7369205baa Benjamin Gaignard 2017-01-20  821  	/*
7edf7369205baa Benjamin Gaignard 2017-01-20  822  	 * If channels enable bits don't exist writing 1 will have no
7edf7369205baa Benjamin Gaignard 2017-01-20  823  	 * effect so we can detect and count them.
7edf7369205baa Benjamin Gaignard 2017-01-20  824  	 */
e315bf700b404c Uwe Kleine-König  2024-02-14  825  	regmap_set_bits(regmap, TIM_CCER, TIM_CCER_CCXE);
e315bf700b404c Uwe Kleine-König  2024-02-14  826  	regmap_read(regmap, TIM_CCER, &ccer);
e315bf700b404c Uwe Kleine-König  2024-02-14  827  	regmap_write(regmap, TIM_CCER, ccer_backup);
19f1016ea9600e Philipp Zabel     2023-10-19  828  
41fa8f57c0d269 Philipp Zabel     2023-10-19  829  	return hweight32(ccer & TIM_CCER_CCXE);
7edf7369205baa Benjamin Gaignard 2017-01-20  830  }
7edf7369205baa Benjamin Gaignard 2017-01-20  831  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
