Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E751DE3B7
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454165; cv=none; b=tu5lq8BqdZTUykayAgI/xIIaUKFaiGZo7fRQ5TQ99fUooJ9flozi6fGxOfrNNjB+YZLV4AN6gKUD3GsT55URAuxa0lugKIXdxyazYSl6s9BLxPIgKWuUvWpj2RptkDhOwZhMXWpE5nctGoCkvTfJJAhKwiUa9cyfTva9lTwC7To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454165; c=relaxed/simple;
	bh=6Rc3w25XcneMfU84iFCkvowufnTMIp99LEwnHCb0Ws4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jrm/m/FqBQnBgjBxQwo2nEs1FDrX34dbd3FOBddMX7IhTH6+uMMDWVqUiS9Lug85SMOJ8yrlSY5IvVNj5f1DLn73QaLcQMN3w7GK1xuXj8XCXWg1ljFEncQD8MdnV5gCeXlAJ31ApomCsHDr+qYnGWAZT1vvQzxGHSazh0FPqs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEd52Huh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEd52Huh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774454163; x=1805990163;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6Rc3w25XcneMfU84iFCkvowufnTMIp99LEwnHCb0Ws4=;
  b=KEd52Huhm1rg/BDqXaFMTWK8vSwKfKNYnKQleRrtVfYLcWonRIvI3VcV
   o0JGAlE35SXks10gKEMZKCd/G0rujhaQhb16vHazDV08VxjIan8JQfm9u
   AsOd2ofm3YXbHaHj6jqCcFDFl3HdQvR4bowZ7A3NOuZjHJueh/vNJzOID
   16lrUu2GERvb3b68439AoIi/ROHhVZLWIxZPKZmMo/HI5AYVWE2xdjZXN
   Bi3eof4cdBHwRdOQqEBzml1d2iFNBZEvtSq77COvzzAWE9ZjcjC5Y1bHM
   Duc22e9r9VoBa9CgbV+8NE7ZVyG5XpgrZsOL8CQhcP9o9wW2xrNOxmaSJ
   Q==;
X-CSE-ConnectionGUID: 8c+INGlYS76HfcaZVSoriQ==
X-CSE-MsgGUID: og2pmLg4T/yYLujx7QMIog==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75382841"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75382841"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 08:56:02 -0700
X-CSE-ConnectionGUID: wqtOlmjZRcSJf1b2nlegPQ==
X-CSE-MsgGUID: 45AtPZK1TEioLeeTQpFEJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="229655552"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Mar 2026 08:56:01 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5QaM-000000007B9-40Fv;
	Wed, 25 Mar 2026 15:55:58 +0000
Date: Wed, 25 Mar 2026 23:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/4] iio: adc: ad4691: add initial driver for AD4691
 family
Message-ID: <202603252324.oRI6hslc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260313-ad4692-multichannel-sar-adc-driver-v3-2-b4d14d81a181@analog.com>
References: <20260313-ad4692-multichannel-sar-adc-driver-v3-2-b4d14d81a181@analog.com>
TO: Radu Sabau via B4 Relay <devnull+radu.sabau.analog.com@kernel.org>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Michael Hennerich <Michael.Hennerich@analog.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Uwe Kleine-König" <ukleinek@kernel.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Linus Walleij <linusw@kernel.org>
TO: Bartosz Golaszewski <brgl@kernel.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-pwm@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: Radu Sabau <radu.sabau@analog.com>

Hi Radu,

kernel test robot noticed the following build errors:

[auto build test ERROR on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/Radu-Sabau-via-B4-Relay/dt-bindings-iio-adc-add-bindings-for-AD4691-family/20260314-040740
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260313-ad4692-multichannel-sar-adc-driver-v3-2-b4d14d81a181%40analog.com
patch subject: [PATCH v3 2/4] iio: adc: ad4691: add initial driver for AD4691 family
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260325/202603252324.oRI6hslc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603252324.oRI6hslc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603252324.oRI6hslc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/adc/ad4691.c:419:9: error: call to '__compiletime_assert_476' declared with 'error' attribute: clamp(freq, 1, st->chip->max_rate) signedness error
     419 |         freq = clamp(freq, 1, st->chip->max_rate);
         |                ^
   include/linux/minmax.h:206:28: note: expanded from macro 'clamp'
     206 | #define clamp(val, lo, hi) __careful_clamp(auto, val, lo, hi)
         |                            ^
   include/linux/minmax.h:195:2: note: expanded from macro '__careful_clamp'
     195 |         __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
         |         ^
   include/linux/minmax.h:190:2: note: expanded from macro '__clamp_once'
     190 |         BUILD_BUG_ON_MSG(!__types_ok3(uval, ulo, uhi),                          \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:694:2: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:687:4: note: expanded from macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:234:1: note: expanded from here
     234 | __compiletime_assert_476
         | ^
>> drivers/iio/adc/ad4691.c:419:9: error: call to '__compiletime_assert_476' declared with 'error' attribute: clamp(freq, 1, st->chip->max_rate) signedness error
   include/linux/minmax.h:206:28: note: expanded from macro 'clamp'
     206 | #define clamp(val, lo, hi) __careful_clamp(auto, val, lo, hi)
         |                            ^
   include/linux/minmax.h:195:2: note: expanded from macro '__careful_clamp'
     195 |         __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
         |         ^
   include/linux/minmax.h:190:2: note: expanded from macro '__clamp_once'
     190 |         BUILD_BUG_ON_MSG(!__types_ok3(uval, ulo, uhi),                          \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:694:2: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:687:4: note: expanded from macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:234:1: note: expanded from here
     234 | __compiletime_assert_476
         | ^
   2 errors generated.


vim +419 drivers/iio/adc/ad4691.c

f6641d8e9f8523c Radu Sabau 2026-03-13  411  
f6641d8e9f8523c Radu Sabau 2026-03-13  412  static int __ad4691_set_sampling_freq(struct ad4691_state *st, int freq)
f6641d8e9f8523c Radu Sabau 2026-03-13  413  {
f6641d8e9f8523c Radu Sabau 2026-03-13  414  	unsigned long long target, ref_clk_period_ns;
f6641d8e9f8523c Radu Sabau 2026-03-13  415  	struct pwm_state cnv_state;
f6641d8e9f8523c Radu Sabau 2026-03-13  416  
f6641d8e9f8523c Radu Sabau 2026-03-13  417  	pwm_init_state(st->conv_trigger, &cnv_state);
f6641d8e9f8523c Radu Sabau 2026-03-13  418  
f6641d8e9f8523c Radu Sabau 2026-03-13 @419  	freq = clamp(freq, 1, st->chip->max_rate);
f6641d8e9f8523c Radu Sabau 2026-03-13  420  	target = DIV_ROUND_CLOSEST_ULL(st->ref_clk_rate, freq);
f6641d8e9f8523c Radu Sabau 2026-03-13  421  	ref_clk_period_ns = DIV_ROUND_CLOSEST_ULL(NANO, st->ref_clk_rate);
f6641d8e9f8523c Radu Sabau 2026-03-13  422  	st->cnv_period = ref_clk_period_ns * target;
f6641d8e9f8523c Radu Sabau 2026-03-13  423  	cnv_state.period = ref_clk_period_ns * target;
f6641d8e9f8523c Radu Sabau 2026-03-13  424  	cnv_state.duty_cycle = AD4691_CNV_DUTY_CYCLE_NS;
f6641d8e9f8523c Radu Sabau 2026-03-13  425  	cnv_state.enabled = false;
f6641d8e9f8523c Radu Sabau 2026-03-13  426  
f6641d8e9f8523c Radu Sabau 2026-03-13  427  	return pwm_apply_might_sleep(st->conv_trigger, &cnv_state);
f6641d8e9f8523c Radu Sabau 2026-03-13  428  }
f6641d8e9f8523c Radu Sabau 2026-03-13  429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
