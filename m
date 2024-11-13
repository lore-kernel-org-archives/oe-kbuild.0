Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4918CC04
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 08:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731487069; cv=none; b=QgLE8ZAyvqaG07cYZxKMTTsGuc8ID+7NRUiJ+HHmXw6kYo63cR9CWntXBnUkLLiBZeh+Nm7AVnNq6LKjFxE9NFMyb7Pfwr1dFqoK9utlBW6G6tgwL8x/m0mlZVzw/zRb3ZTmAX2lPxJIXuz9g1vdI6ULNKxmAMSiRT6TcjCbt5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731487069; c=relaxed/simple;
	bh=tTsvmrVNtHmKvLcl2ubsfmBik7BxmDKOGfNhtn3clhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Glv+xAy5nV5YvYqs08o8rtKeqPPigr6yk5HvlsfTMluNbnoJzZM60wUVXiYp9zSn5lPH4yD+jYWicmf6cv0NghYDEzIspulGDN9K5BUcUh7xGE0eVR4pF7cdotSlIvTEJ3nnUOT1cjORS76YjFUUQDa060brjwunx70lNzWO24U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zg5RdbhT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zg5RdbhT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731487067; x=1763023067;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tTsvmrVNtHmKvLcl2ubsfmBik7BxmDKOGfNhtn3clhs=;
  b=Zg5RdbhTlCK/5303BE1uvekeDYCqWkk9fPBNe+0e+PSvnq5u26+U1VRq
   8D1mZ9+7O9pN48ilyXtXTCVC/pDq2DzZVEgHfcS28C4sroqFZw65E6+Lo
   8AEDZ8tELwe+rJqGsXFF7FZ27FXnqZfC9UDx8c5UcmyFFmvkOU/f4oTMf
   /OtGOzAtFyfCosIRta9sHL9VqUjiqz4ScfRPdx1JM9Wqy4OGZeU/xx8wH
   rMEhsp7smOaNS2ej9U7GfVwYUY+T7dNVdic4SNNzcSSNLnq+mmWDeCQs/
   oiqQZ7iqlC6ekAQkU8gemA72DWnbUcDWD/nN07ZyoSV05DbPT3pp1bd4P
   g==;
X-CSE-ConnectionGUID: wh0JJl3MQeepcVftBl1D6A==
X-CSE-MsgGUID: QQYSw3XSRxKiNF47OyT0hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53916850"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53916850"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 00:37:45 -0800
X-CSE-ConnectionGUID: 7D8PKKc8QjyEGOwgMlHZhQ==
X-CSE-MsgGUID: 0qOxpr8HQh6FwNciuSf/6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="92883348"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Nov 2024 00:37:42 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB8sd-00009J-1j;
	Wed, 13 Nov 2024 08:37:39 +0000
Date: Wed, 13 Nov 2024 16:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 2/2] pwm: add support for NXPs high-side switch
 MC33XS2410
Message-ID: <202411131646.RTVxOlpg-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: s390-randconfig-r073-20241112 (https://download.01.org/0day-ci/archive/20241113/202411131646.RTVxOlpg-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411131646.RTVxOlpg-lkp@intel.com/

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
