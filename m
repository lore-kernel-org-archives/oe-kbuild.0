Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA55201037
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Nov 2024 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731423743; cv=none; b=t2L6GPBWNdqHkcTQXJDkfvwrYcgqooNA53f+4XmsRnG/PpbHTexHUFRDVmUSbuwU6WdOjffv4Sk1fOQAZitWlLnZUTa8QV/vlD/zO5XRqn8dLYnMtfVAP47Q8uQZVOitKU/uGtoX3qMW299zl4Uf/5n67fJFA2dRe8fXT3wciPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731423743; c=relaxed/simple;
	bh=kwZ2a2tH1vx5JJ/n7pIbTSwv/x5JHLz3mIdC4/0er+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HSRerSi1IHrxCGi4Q1eldKnOp4kfZyG9qwwlp0ERP2xYPvRRqphtJuhfUSqJ14uyivQfVK3uw4idvrHlfRQ0BFeOgkwUoIrHYrjzF5togk6n7iTTRur4AhZaT3zsJGLrxA/isR0UpeZq7qcsRsrvWxREnp885KM31BJXncW5Ug8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+tR5nX3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+tR5nX3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731423742; x=1762959742;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kwZ2a2tH1vx5JJ/n7pIbTSwv/x5JHLz3mIdC4/0er+0=;
  b=D+tR5nX31sA0E7xY11pN8loeGp7irs3lo3eG8z2xAo73yc6DNA5M6+N2
   T8CtaToj2v1eFY5I2/Rp+469DA81Bc7GA2O05DwdRZH5zHsid10bJeqrN
   bjHavE9Rxa8qsOMWVPbNJYDlE89Fonvd3iB07NYHv3jnDEysxGtqGAVI/
   5kwCuB6U0Q97uSRufixqIE/mudE71X8NXy/kCkjr3eoTYuu18ex69soyU
   L4zWlcqFdsEToGVD9+vt2Q6fKyJ0YaOEgertjlxglU1Iv47syClj3/F/+
   BohrX4wCUeN2b80KsMGW7dapJbuksdeaBdClTsipiMZoFcHbwp4HegR+D
   A==;
X-CSE-ConnectionGUID: tfyXiii2RQKkLKAfkSguxw==
X-CSE-MsgGUID: puHyhHg9Qoeia3uNHkzm2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31115767"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31115767"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 07:02:20 -0800
X-CSE-ConnectionGUID: +/vOfRA2TTy/6XrR+ZlVRA==
X-CSE-MsgGUID: AZ00LC20Ssuak1RqwcvhyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="87623474"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Nov 2024 07:02:18 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAsPI-0001Rp-29;
	Tue, 12 Nov 2024 15:02:16 +0000
Date: Tue, 12 Nov 2024 23:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 2/2] pwm: add support for NXPs high-side switch
 MC33XS2410
Message-ID: <202411122253.03yKXFpX-lkp@intel.com>
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
In-Reply-To: <20241109174135.26292-3-dima.fedrau@gmail.com>
References: <20241109174135.26292-3-dima.fedrau@gmail.com>
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
[also build test WARNING on linus/master v6.12-rc7 next-20241112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dimitri-Fedrau/dt-bindings-pwm-add-support-for-MC33XS2410/20241110-014336
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241109174135.26292-3-dima.fedrau%40gmail.com
patch subject: [PATCH v7 2/2] pwm: add support for NXPs high-side switch MC33XS2410
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: s390-randconfig-r073-20241112 (https://download.01.org/0day-ci/archive/20241112/202411122253.03yKXFpX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411122253.03yKXFpX-lkp@intel.com/

smatch warnings:
drivers/pwm/pwm-mc33xs2410.c:184 mc33xs2410_pwm_get_freq() error: uninitialized symbol 'step'.

vim +/step +184 drivers/pwm/pwm-mc33xs2410.c

23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  152  
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  153  static u8 mc33xs2410_pwm_get_freq(u64 period)
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  154  {
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  155  	u8 step, count;
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  156  
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  157  	/*
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  158  	 * Check which step is appropriate for the given period, starting with
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  159  	 * the highest frequency(lowest period). Higher frequencies are
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  160  	 * represented with better resolution by the device. Therefore favor
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  161  	 * frequency range with the better resolution to minimize error
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  162  	 * introduced by the frequency steps.
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  163  	 */
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  164  
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  165  	switch (period) {
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  166  	case MC33XS2410_PWM_MIN_PERIOD ... MC33XS2410_PWM_MAX_PERIOD(3):
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  167  		step = 3;
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  168  		break;
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  169  	case MC33XS2410_PWM_MAX_PERIOD(3) + 1 ... MC33XS2410_PWM_MAX_PERIOD(2):
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  170  		step = 2;
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  171  		break;
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  172  	case MC33XS2410_PWM_MAX_PERIOD(2) + 1 ... MC33XS2410_PWM_MAX_PERIOD(1):
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  173  		step = 1;
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  174  		break;
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  175  	case MC33XS2410_PWM_MAX_PERIOD(1) + 1 ... MC33XS2410_PWM_MAX_PERIOD(0):
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  176  		step = 0;
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  177  		break;
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  178  	}
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  179  
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  180  	/*
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  181  	 * Round up here because a higher count results in a higher frequency
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  182  	 * and so a smaller period.
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  183  	 */
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09 @184  	count = DIV_ROUND_UP((u32)MC33XS2410_PWM_MAX_PERIOD(step), (u32)period);
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  185  	return FIELD_PREP(MC33XS2410_PWM_FREQ_STEP, step) |
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  186  	       FIELD_PREP(MC33XS2410_PWM_FREQ_COUNT, count - 1);
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  187  }
23a0a66c9fc5eb0 Dimitri Fedrau 2024-11-09  188  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
