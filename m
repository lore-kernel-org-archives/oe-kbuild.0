Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14637711B
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Jun 2024 22:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718837522; cv=none; b=GTju2GKl1nDfUQAx+E0/x1w4hR3fX7aYFI4gRUh89bkdD0JxMNOmryuagpCGo+zSusP6jynYwly9WyI9tuYWztOmHWIDYBm4PAKg0NAzQvzDArYh2dJG8IzCbiCCVH4xiU6zztcPMl5qmttcwLEn+eququrHp50y8bFIVw8SN74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718837522; c=relaxed/simple;
	bh=mmgQ5Nv/t08y5I76xCETat/4qwPlSCqd+iW34FIiVI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o+Pl2Y6u1qr+qz5YktuqYZdqFTnrAwPWnot1LKvm/4Qqz6o+NQwhypdmkCmPjzHyScO75JlHqjBMTqRfyci1HDAh0xEEvaf7JaLUCclxbd+zKyOAcU/FxdxEQjgpS/QOz2lSA4hNq+21FgYLiQepGedxUMM1kH054Tf7talKy5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=koFY0VgQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="koFY0VgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718837519; x=1750373519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mmgQ5Nv/t08y5I76xCETat/4qwPlSCqd+iW34FIiVI0=;
  b=koFY0VgQWm1HCEPii6dyNMJlDRI+irixlSWimPWGn3p+Vi9YIx0fJ38n
   V5zwkGbIHcJG6ABWmbhRjKlXnYAUgIOr2VUk7fpyfjX+iYyApNWVeRawf
   CbSJwkRGGIMtuyfMFuEy+mipZjzc4ZrnejDxtaXUcRBhoLwBmcvzjKnB7
   qFI+oIXCFu/KBzHtsRcIlWqB/Dpu+pcqr+S4481R8/LOUuQB/7Y7HMVmt
   EvTdSY+mD7aDi/1bgHD5LxzdMqYFS50x/S4K6hP5h4ZOqglGHb4xeXCO5
   Iu/2Z5T5VcE+vQWwZITbVpMiJGSMAQ9FhWEpAg9vxO3Nez6/2TUHRWS3C
   A==;
X-CSE-ConnectionGUID: fyEuMmRER9u+wgYHCj06Cw==
X-CSE-MsgGUID: 9420Xp9sQLqoInFXYqXUSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="27201111"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="27201111"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 15:51:59 -0700
X-CSE-ConnectionGUID: Qtb9zw8wQXeSPbwzUDQ5Jw==
X-CSE-MsgGUID: rrqRWtbiQoC7IQIewf50fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="41899362"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Jun 2024 15:51:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK49j-00074e-3B;
	Wed, 19 Jun 2024 22:51:55 +0000
Date: Thu, 20 Jun 2024 06:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2024.06.06a 27/34]
 kernel/time/clocksource.c:1167:36: error: use of undeclared identifier
 'CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US'
Message-ID: <202406200658.MRbHnhvE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit 421469c14614591c29c312d929142dbb07e3d521 was found in branch paulmck-rcu/dev.2024.06.06a, not in new branch paulmck-rcu/dev.2024.06.18a"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2024.06.06a
head:   f29bcafffef0ecc8a5d2cdc1bbef9a6889225263
commit: 421469c14614591c29c312d929142dbb07e3d521 [27/34] Clocksource: Take advantage of always-defined CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
:::::: branch date: 27 hours ago
:::::: commit date: 6 days ago
config: arm-randconfig-002-20240620 (https://download.01.org/0day-ci/archive/20240620/202406200658.MRbHnhvE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200658.MRbHnhvE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406200658.MRbHnhvE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/clocksource.c:1167:36: error: use of undeclared identifier 'CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US'
    1167 |                 if (cs->uncertainty_margin < 2 * WATCHDOG_MAX_SKEW)
         |                                                  ^
   kernel/time/clocksource.c:137:28: note: expanded from macro 'WATCHDOG_MAX_SKEW'
     137 | #define WATCHDOG_MAX_SKEW (MAX_SKEW_USEC * NSEC_PER_USEC)
         |                            ^
   kernel/time/clocksource.c:136:23: note: expanded from macro 'MAX_SKEW_USEC'
     136 | #define MAX_SKEW_USEC   CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
         |                         ^
   kernel/time/clocksource.c:1168:33: error: use of undeclared identifier 'CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US'
    1168 |                         cs->uncertainty_margin = 2 * WATCHDOG_MAX_SKEW;
         |                                                      ^
   kernel/time/clocksource.c:137:28: note: expanded from macro 'WATCHDOG_MAX_SKEW'
     137 | #define WATCHDOG_MAX_SKEW (MAX_SKEW_USEC * NSEC_PER_USEC)
         |                            ^
   kernel/time/clocksource.c:136:23: note: expanded from macro 'MAX_SKEW_USEC'
     136 | #define MAX_SKEW_USEC   CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
         |                         ^
   kernel/time/clocksource.c:1172:44: error: use of undeclared identifier 'CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US'
    1172 |         WARN_ON_ONCE(cs->uncertainty_margin < 2 * WATCHDOG_MAX_SKEW);
         |                                                   ^
   kernel/time/clocksource.c:137:28: note: expanded from macro 'WATCHDOG_MAX_SKEW'
     137 | #define WATCHDOG_MAX_SKEW (MAX_SKEW_USEC * NSEC_PER_USEC)
         |                            ^
   kernel/time/clocksource.c:136:23: note: expanded from macro 'MAX_SKEW_USEC'
     136 | #define MAX_SKEW_USEC   CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
         |                         ^
   3 errors generated.


vim +/CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US +1167 kernel/time/clocksource.c

734efb467b31e5 John Stultz      2006-06-26  1107  
d7e81c269db899 John Stultz      2010-05-07  1108  /**
fba9e07208c0f9 John Stultz      2015-03-11  1109   * __clocksource_update_freq_scale - Used update clocksource with new freq
b1b73d095084e7 Kusanagi Kouichi 2011-12-19  1110   * @cs:		clocksource to be registered
d7e81c269db899 John Stultz      2010-05-07  1111   * @scale:	Scale factor multiplied against freq to get clocksource hz
d7e81c269db899 John Stultz      2010-05-07  1112   * @freq:	clocksource frequency (cycles per second) divided by scale
d7e81c269db899 John Stultz      2010-05-07  1113   *
852db46d55e85b John Stultz      2010-07-13  1114   * This should only be called from the clocksource->enable() method.
d7e81c269db899 John Stultz      2010-05-07  1115   *
d7e81c269db899 John Stultz      2010-05-07  1116   * This *SHOULD NOT* be called directly! Please use the
fba9e07208c0f9 John Stultz      2015-03-11  1117   * __clocksource_update_freq_hz() or __clocksource_update_freq_khz() helper
fba9e07208c0f9 John Stultz      2015-03-11  1118   * functions.
d7e81c269db899 John Stultz      2010-05-07  1119   */
fba9e07208c0f9 John Stultz      2015-03-11  1120  void __clocksource_update_freq_scale(struct clocksource *cs, u32 scale, u32 freq)
d7e81c269db899 John Stultz      2010-05-07  1121  {
c0e299b1a91cbd Thomas Gleixner  2011-05-20  1122  	u64 sec;
f8935983f11050 John Stultz      2015-03-11  1123  
f8935983f11050 John Stultz      2015-03-11  1124  	/*
f8935983f11050 John Stultz      2015-03-11  1125  	 * Default clocksources are *special* and self-define their mult/shift.
f8935983f11050 John Stultz      2015-03-11  1126  	 * But, you're not special, so you should specify a freq value.
f8935983f11050 John Stultz      2015-03-11  1127  	 */
f8935983f11050 John Stultz      2015-03-11  1128  	if (freq) {
d7e81c269db899 John Stultz      2010-05-07  1129  		/*
724ed53e8ac2c5 Thomas Gleixner  2011-05-18  1130  		 * Calc the maximum number of seconds which we can run before
f8935983f11050 John Stultz      2015-03-11  1131  		 * wrapping around. For clocksources which have a mask > 32-bit
724ed53e8ac2c5 Thomas Gleixner  2011-05-18  1132  		 * we need to limit the max sleep time to have a good
724ed53e8ac2c5 Thomas Gleixner  2011-05-18  1133  		 * conversion precision. 10 minutes is still a reasonable
724ed53e8ac2c5 Thomas Gleixner  2011-05-18  1134  		 * amount. That results in a shift value of 24 for a
f8935983f11050 John Stultz      2015-03-11  1135  		 * clocksource with mask >= 40-bit and f >= 4GHz. That maps to
362fde0410377e John Stultz      2015-03-11  1136  		 * ~ 0.06ppm granularity for NTP.
d7e81c269db899 John Stultz      2010-05-07  1137  		 */
362fde0410377e John Stultz      2015-03-11  1138  		sec = cs->mask;
724ed53e8ac2c5 Thomas Gleixner  2011-05-18  1139  		do_div(sec, freq);
724ed53e8ac2c5 Thomas Gleixner  2011-05-18  1140  		do_div(sec, scale);
724ed53e8ac2c5 Thomas Gleixner  2011-05-18  1141  		if (!sec)
724ed53e8ac2c5 Thomas Gleixner  2011-05-18  1142  			sec = 1;
724ed53e8ac2c5 Thomas Gleixner  2011-05-18  1143  		else if (sec > 600 && cs->mask > UINT_MAX)
724ed53e8ac2c5 Thomas Gleixner  2011-05-18  1144  			sec = 600;
724ed53e8ac2c5 Thomas Gleixner  2011-05-18  1145  
d7e81c269db899 John Stultz      2010-05-07  1146  		clocks_calc_mult_shift(&cs->mult, &cs->shift, freq,
724ed53e8ac2c5 Thomas Gleixner  2011-05-18  1147  				       NSEC_PER_SEC / scale, sec * scale);
f8935983f11050 John Stultz      2015-03-11  1148  	}
2e27e793e280ff Paul E. McKenney 2021-05-27  1149  
2e27e793e280ff Paul E. McKenney 2021-05-27  1150  	/*
5b1825ddca43b5 Borislav Petkov  2024-06-12  1151  	 * If the uncertainty margin is not specified, calculate it.  If
5b1825ddca43b5 Borislav Petkov  2024-06-12  1152  	 * both scale and freq are non-zero, calculate the clock period, but
5b1825ddca43b5 Borislav Petkov  2024-06-12  1153  	 * bound below at 2*WATCHDOG_MAX_SKEW, that is, 500ppm by default.
5b1825ddca43b5 Borislav Petkov  2024-06-12  1154  	 * However, if either of scale or freq is zero, be very conservative
5b1825ddca43b5 Borislav Petkov  2024-06-12  1155  	 * and take the tens-of-milliseconds WATCHDOG_THRESHOLD value
5b1825ddca43b5 Borislav Petkov  2024-06-12  1156  	 * for the uncertainty margin.  Allow stupidly small uncertainty
5b1825ddca43b5 Borislav Petkov  2024-06-12  1157  	 * margins to be specified by the caller for testing purposes,
5b1825ddca43b5 Borislav Petkov  2024-06-12  1158  	 * but warn to discourage production use of this capability.
5b1825ddca43b5 Borislav Petkov  2024-06-12  1159  	 *
5b1825ddca43b5 Borislav Petkov  2024-06-12  1160  	 * Bottom line:  The sum of the uncertainty margins of the
5b1825ddca43b5 Borislav Petkov  2024-06-12  1161  	 * watchdog clocksource and the clocksource under test will be at
5b1825ddca43b5 Borislav Petkov  2024-06-12  1162  	 * least 500ppm by default.  For more information, please see the
5b1825ddca43b5 Borislav Petkov  2024-06-12  1163  	 * comment preceding CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US above.
2e27e793e280ff Paul E. McKenney 2021-05-27  1164  	 */
2e27e793e280ff Paul E. McKenney 2021-05-27  1165  	if (scale && freq && !cs->uncertainty_margin) {
2e27e793e280ff Paul E. McKenney 2021-05-27  1166  		cs->uncertainty_margin = NSEC_PER_SEC / (scale * freq);
2e27e793e280ff Paul E. McKenney 2021-05-27 @1167  		if (cs->uncertainty_margin < 2 * WATCHDOG_MAX_SKEW)
2e27e793e280ff Paul E. McKenney 2021-05-27  1168  			cs->uncertainty_margin = 2 * WATCHDOG_MAX_SKEW;
2e27e793e280ff Paul E. McKenney 2021-05-27  1169  	} else if (!cs->uncertainty_margin) {
2e27e793e280ff Paul E. McKenney 2021-05-27  1170  		cs->uncertainty_margin = WATCHDOG_THRESHOLD;
2e27e793e280ff Paul E. McKenney 2021-05-27  1171  	}
2e27e793e280ff Paul E. McKenney 2021-05-27  1172  	WARN_ON_ONCE(cs->uncertainty_margin < 2 * WATCHDOG_MAX_SKEW);
2e27e793e280ff Paul E. McKenney 2021-05-27  1173  
d65670a78cdbfa John Stultz      2011-10-31  1174  	/*
362fde0410377e John Stultz      2015-03-11  1175  	 * Ensure clocksources that have large 'mult' values don't overflow
362fde0410377e John Stultz      2015-03-11  1176  	 * when adjusted.
d65670a78cdbfa John Stultz      2011-10-31  1177  	 */
d65670a78cdbfa John Stultz      2011-10-31  1178  	cs->maxadj = clocksource_max_adjustment(cs);
f8935983f11050 John Stultz      2015-03-11  1179  	while (freq && ((cs->mult + cs->maxadj < cs->mult)
f8935983f11050 John Stultz      2015-03-11  1180  		|| (cs->mult - cs->maxadj > cs->mult))) {
d65670a78cdbfa John Stultz      2011-10-31  1181  		cs->mult >>= 1;
d65670a78cdbfa John Stultz      2011-10-31  1182  		cs->shift--;
d65670a78cdbfa John Stultz      2011-10-31  1183  		cs->maxadj = clocksource_max_adjustment(cs);
d65670a78cdbfa John Stultz      2011-10-31  1184  	}
d65670a78cdbfa John Stultz      2011-10-31  1185  
f8935983f11050 John Stultz      2015-03-11  1186  	/*
f8935983f11050 John Stultz      2015-03-11  1187  	 * Only warn for *special* clocksources that self-define
f8935983f11050 John Stultz      2015-03-11  1188  	 * their mult/shift values and don't specify a freq.
f8935983f11050 John Stultz      2015-03-11  1189  	 */
f8935983f11050 John Stultz      2015-03-11  1190  	WARN_ONCE(cs->mult + cs->maxadj < cs->mult,
f8935983f11050 John Stultz      2015-03-11  1191  		"timekeeping: Clocksource %s might overflow on 11%% adjustment\n",
f8935983f11050 John Stultz      2015-03-11  1192  		cs->name);
f8935983f11050 John Stultz      2015-03-11  1193  
fb82fe2fe85887 John Stultz      2015-03-11  1194  	clocksource_update_max_deferment(cs);
8cc8c525ad4e7b John Stultz      2015-03-11  1195  
45bbfe64ea564a Joe Perches      2015-05-25  1196  	pr_info("%s: mask: 0x%llx max_cycles: 0x%llx, max_idle_ns: %lld ns\n",
8cc8c525ad4e7b John Stultz      2015-03-11  1197  		cs->name, cs->mask, cs->max_cycles, cs->max_idle_ns);
852db46d55e85b John Stultz      2010-07-13  1198  }
fba9e07208c0f9 John Stultz      2015-03-11  1199  EXPORT_SYMBOL_GPL(__clocksource_update_freq_scale);
852db46d55e85b John Stultz      2010-07-13  1200  

:::::: The code at line 1167 was first introduced by commit
:::::: 2e27e793e280ff12cb5c202a1214c08b0d3a0f26 clocksource: Reduce clocksource-skew threshold

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
