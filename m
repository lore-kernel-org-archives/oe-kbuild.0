Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82247B665
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Sep 2024 01:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727574014; cv=none; b=fWbkNuSZ0TM4nCex4IMY3r5UQmzPPax+nABwpTYfiC7htRHQcfhb3E+BlcGdnRGElg2OYiiDR4kt/loi8xTTfra9e8w2S2IxBcw3S38QfgFuN5HSdXzch/ZFhd6/KCqR8J00d82wUuY53Q4r0KkPKjDbd7Nnj5pXI9F4UW0wDYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727574014; c=relaxed/simple;
	bh=quypAl2mjMvUNcgMzfUT5u3ZY+d95HkzxeA/i/peJsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rmOcGRfOg22kUgxnSeTI0euUCWI8cKbculldniNWMJt+PYKJMg9cfqhymoRLm98Fi7XZdcYfGQ11R4mzz/yoIPuqiCIhyW/63JdfZQQPE6r0BqWEfPbkeslaHQGuPwT73EvVdABVd6GxalO/O6MbBnca+TS5B2ZzNPX+h3yRBmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSsRL4vF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSsRL4vF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727574012; x=1759110012;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=quypAl2mjMvUNcgMzfUT5u3ZY+d95HkzxeA/i/peJsg=;
  b=XSsRL4vFqOp9qp1iIK1wmYUjByPfqnhzrvrLVjcfNhuc8uGC2VO9sKX/
   3kGllWmi1qUtHIp9ioa9LLWPBxoRcc/wN2M0eyerbbT4KEEeX4Q+jQ7aE
   +tna06p3ur/VVvkys14M/W0mnHwHQ1TSz/c+lqBkONiU2l1FaUNuhcvQb
   kYU+xRxf6KLM42nSsbZusIBWsvKfkMLsNYiRWNDWm4aQx5M2XpubyAN/o
   jsppGzDxBx0ERT61yE9NiR276xtJ6sRXRI5/71baou1fGFxTVVOJJnbEi
   rRVTrxCp5+Pql+s/sZj7bgtf3+lxVNcw+kVt3viOBC0QDxABOOYzawiZF
   Q==;
X-CSE-ConnectionGUID: Qg8GNjD7QdWbf2I+I4ADCQ==
X-CSE-MsgGUID: EMkpQergQOSjQGVHTuuQYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="52101091"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="52101091"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 18:40:09 -0700
X-CSE-ConnectionGUID: 6kMFrNUVT5CJcEHo17djKw==
X-CSE-MsgGUID: gviQ4q+oS4+QUPb6yje2fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="77439501"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2024 18:40:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suius-000Nop-0X;
	Sun, 29 Sep 2024 01:40:06 +0000
Date: Sun, 29 Sep 2024 09:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 2/2] pwm: add support for NXPs high-side switch
 MC33XS2410
Message-ID: <202409290919.pUfiD9oX-lkp@intel.com>
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
In-Reply-To: <20240927125745.38367-3-dima.fedrau@gmail.com>
References: <20240927125745.38367-3-dima.fedrau@gmail.com>
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
[also build test WARNING on linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dimitri-Fedrau/dt-bindings-pwm-add-support-for-MC33XS2410/20240927-205846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240927125745.38367-3-dima.fedrau%40gmail.com
patch subject: [PATCH v6 2/2] pwm: add support for NXPs high-side switch MC33XS2410
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: m68k-randconfig-r071-20240929 (https://download.01.org/0day-ci/archive/20240929/202409290919.pUfiD9oX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409290919.pUfiD9oX-lkp@intel.com/

smatch warnings:
drivers/pwm/pwm-mc33xs2410.c:206 mc33xs2410_pwm_get_freq() error: uninitialized symbol 'step'.

vim +/step +206 drivers/pwm/pwm-mc33xs2410.c

b05050b29080d6 Dimitri Fedrau 2024-09-27  174  
b05050b29080d6 Dimitri Fedrau 2024-09-27  175  static u8 mc33xs2410_pwm_get_freq(u64 period)
b05050b29080d6 Dimitri Fedrau 2024-09-27  176  {
b05050b29080d6 Dimitri Fedrau 2024-09-27  177  	u8 step, count;
b05050b29080d6 Dimitri Fedrau 2024-09-27  178  
b05050b29080d6 Dimitri Fedrau 2024-09-27  179  	/*
b05050b29080d6 Dimitri Fedrau 2024-09-27  180  	 * Check which step is appropriate for the given period, starting with
b05050b29080d6 Dimitri Fedrau 2024-09-27  181  	 * the highest frequency(lowest period). Higher frequencies are
b05050b29080d6 Dimitri Fedrau 2024-09-27  182  	 * represented with better resolution by the device. Therefore favor
b05050b29080d6 Dimitri Fedrau 2024-09-27  183  	 * frequency range with the better resolution to minimize error
b05050b29080d6 Dimitri Fedrau 2024-09-27  184  	 * introduced by the frequency steps.
b05050b29080d6 Dimitri Fedrau 2024-09-27  185  	 */
b05050b29080d6 Dimitri Fedrau 2024-09-27  186  
b05050b29080d6 Dimitri Fedrau 2024-09-27  187  	switch (period) {
b05050b29080d6 Dimitri Fedrau 2024-09-27  188  	case MC33XS2410_MIN_PERIOD ... MC33XS2410_MAX_PERIOD_STEP(3):
b05050b29080d6 Dimitri Fedrau 2024-09-27  189  		step = 3;
b05050b29080d6 Dimitri Fedrau 2024-09-27  190  		break;
b05050b29080d6 Dimitri Fedrau 2024-09-27  191  	case MC33XS2410_MAX_PERIOD_STEP(3) + 1 ... MC33XS2410_MAX_PERIOD_STEP(2):
b05050b29080d6 Dimitri Fedrau 2024-09-27  192  		step = 2;
b05050b29080d6 Dimitri Fedrau 2024-09-27  193  		break;
b05050b29080d6 Dimitri Fedrau 2024-09-27  194  	case MC33XS2410_MAX_PERIOD_STEP(2) + 1 ... MC33XS2410_MAX_PERIOD_STEP(1):
b05050b29080d6 Dimitri Fedrau 2024-09-27  195  		step = 1;
b05050b29080d6 Dimitri Fedrau 2024-09-27  196  		break;
b05050b29080d6 Dimitri Fedrau 2024-09-27  197  	case MC33XS2410_MAX_PERIOD_STEP(1) + 1 ... MC33XS2410_MAX_PERIOD_STEP(0):
b05050b29080d6 Dimitri Fedrau 2024-09-27  198  		step = 0;
b05050b29080d6 Dimitri Fedrau 2024-09-27  199  		break;
b05050b29080d6 Dimitri Fedrau 2024-09-27  200  	}
b05050b29080d6 Dimitri Fedrau 2024-09-27  201  
b05050b29080d6 Dimitri Fedrau 2024-09-27  202  	/*
b05050b29080d6 Dimitri Fedrau 2024-09-27  203  	 * Round up here because a higher count results in a higher frequency
b05050b29080d6 Dimitri Fedrau 2024-09-27  204  	 * and so a smaller period.
b05050b29080d6 Dimitri Fedrau 2024-09-27  205  	 */
b05050b29080d6 Dimitri Fedrau 2024-09-27 @206  	count = DIV_ROUND_UP((u32)MC33XS2410_MAX_PERIOD_STEP(step), (u32)period);
b05050b29080d6 Dimitri Fedrau 2024-09-27  207  	return FIELD_PREP(MC33XS2410_PWM_FREQ_STEP_MASK, step) |
b05050b29080d6 Dimitri Fedrau 2024-09-27  208  	       FIELD_PREP(MC33XS2410_PWM_FREQ_COUNT_MASK, count - 1);
b05050b29080d6 Dimitri Fedrau 2024-09-27  209  }
b05050b29080d6 Dimitri Fedrau 2024-09-27  210  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
