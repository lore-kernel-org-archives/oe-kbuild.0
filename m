Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B331C07DC
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Jan 2025 19:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736881267; cv=none; b=hDSoHoEXIbnm/T8uYWb94eeRG+7Z2tLW6tvb89BSMJPA+MBNrrqx0DD5jSfGnR4Dkrv3ZU6Mi2OTVKOhvooe2ArrygHFm/BwtWGfekpL0RhYL7+fjsvof7T+xBttuWLKwhPf/m7I7OskQ7U98sLxGY2AySKDptWi/YRTrvHEETM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736881267; c=relaxed/simple;
	bh=M7IwQD7LGxgRmyWGYZVMQNvAGfmudY2DcmeV1xvJAXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KH0um6cOh4fEFXcM0mtiC3IptvFQs/g5hDpi+48uXKlT9AHxkjWCzQGYBeZJJitI4v2Zch0IKzf7FlOKWLflNplRBp+xGP+bC1Y8JxMRgSEMlMqIaAKg+pZcDLUmGzvpOeRVJSKETxCaZpANba2dDRKO3zwCYN9JWf49O2Ggkcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWUdtCdq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWUdtCdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736881265; x=1768417265;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=M7IwQD7LGxgRmyWGYZVMQNvAGfmudY2DcmeV1xvJAXs=;
  b=QWUdtCdq+lf5Jf/m0zrEtVeQvLfIgfOSD1Jdmk2zcddqmG3DPyrV9Tjs
   y5f1iHGgf+guR4VL6ubGMwO8Obo3SF5EhQVcCDsAt5xjnPWPapgTE8YGa
   DnrOw48L3DP3IU5THD/nDZ7WBTJLdjyGR8aj8sFwhRHoLiGodlKlfTg30
   +zotYDBwa6hlY+yE6S6dGnu7zi3hkxMT9RWzkn9SCyEyFLovFbTWWp8jW
   04nl7t4z64Ak0ZmVD+R48V/PPcf3VnYtIJ3HvX4xIR0vruik4n1hGeUTy
   3Y5tmpNa2LPvRRXK4v7DIuEwMtSjzIO1+0Ezv411h/5thK+lb8MrQV+43
   w==;
X-CSE-ConnectionGUID: xU3cAiwPR9aNY+CAtRFGwQ==
X-CSE-MsgGUID: W0nH49P5S4qoWdC+MnPKzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37354971"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="37354971"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 11:00:29 -0800
X-CSE-ConnectionGUID: ECc1ye7RRq6WJK4KS/7d5g==
X-CSE-MsgGUID: uCdLud/HS926Nf1Fu6oAXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="104965090"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Jan 2025 11:00:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXm9K-000OuJ-0V;
	Tue, 14 Jan 2025 19:00:26 +0000
Date: Wed, 15 Jan 2025 03:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v8 2/2] pwm: add support for NXPs high-side switch
 MC33XS2410
Message-ID: <202501150253.UcGu2EKe-lkp@intel.com>
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
In-Reply-To: <20250110073755.29541-3-dima.fedrau@gmail.com>
References: <20250110073755.29541-3-dima.fedrau@gmail.com>
TO: Dimitri Fedrau <dima.fedrau@gmail.com>
CC: Dimitri Fedrau <dima.fedrau@gmail.com>
CC: "Uwe Kleine-König" <ukleinek@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-pwm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Dimitri,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.13-rc7 next-20250114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dimitri-Fedrau/dt-bindings-pwm-add-support-for-MC33XS2410/20250110-154036
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250110073755.29541-3-dima.fedrau%40gmail.com
patch subject: [PATCH v8 2/2] pwm: add support for NXPs high-side switch MC33XS2410
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: sparc64-randconfig-r071-20250114 (https://download.01.org/0day-ci/archive/20250115/202501150253.UcGu2EKe-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501150253.UcGu2EKe-lkp@intel.com/

smatch warnings:
drivers/pwm/pwm-mc33xs2410.c:174 mc33xs2410_pwm_get_freq() error: uninitialized symbol 'step'.

vim +/step +174 drivers/pwm/pwm-mc33xs2410.c

5e9dc126a0b599 Dimitri Fedrau 2025-01-10  142  
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  143  static u8 mc33xs2410_pwm_get_freq(u64 period)
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  144  {
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  145  	u8 step, count;
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  146  
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  147  	/*
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  148  	 * Check which step is appropriate for the given period, starting with
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  149  	 * the highest frequency(lowest period). Higher frequencies are
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  150  	 * represented with better resolution by the device. Therefore favor
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  151  	 * frequency range with the better resolution to minimize error
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  152  	 * introduced by the frequency steps.
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  153  	 */
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  154  
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  155  	switch (period) {
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  156  	case MC33XS2410_PWM_MIN_PERIOD ... MC33XS2410_PWM_MAX_PERIOD(3):
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  157  		step = 3;
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  158  		break;
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  159  	case MC33XS2410_PWM_MAX_PERIOD(3) + 1 ... MC33XS2410_PWM_MAX_PERIOD(2):
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  160  		step = 2;
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  161  		break;
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  162  	case MC33XS2410_PWM_MAX_PERIOD(2) + 1 ... MC33XS2410_PWM_MAX_PERIOD(1):
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  163  		step = 1;
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  164  		break;
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  165  	case MC33XS2410_PWM_MAX_PERIOD(1) + 1 ... MC33XS2410_PWM_MAX_PERIOD(0):
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  166  		step = 0;
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  167  		break;
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  168  	}
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  169  
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  170  	/*
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  171  	 * Round up here because a higher count results in a higher frequency
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  172  	 * and so a smaller period.
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  173  	 */
5e9dc126a0b599 Dimitri Fedrau 2025-01-10 @174  	count = DIV_ROUND_UP((u32)MC33XS2410_PWM_MAX_PERIOD(step), (u32)period);
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  175  	return FIELD_PREP(MC33XS2410_PWM_FREQ_STEP, step) |
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  176  	       FIELD_PREP(MC33XS2410_PWM_FREQ_COUNT, count - 1);
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  177  }
5e9dc126a0b599 Dimitri Fedrau 2025-01-10  178  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
