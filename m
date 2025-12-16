Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ED9310784
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 04:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765858887; cv=none; b=oVetcwmLYlXueVa29EC8+M3BsPhTzh2ajqD6De3Fm/uBcMwDUIOJsGfQKwqV2mxyLq8jsmU118R37q+vVMWftaDKxnayzVjLhS/9oNJVaPQgRB3EeLYdyKgcFz7Np51CQmxVvW2u8ez32c2V/TXz/UxNAvmG3xn7QgQePp45DNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765858887; c=relaxed/simple;
	bh=g9Kl9Jj8JzaZVhDb3J8zwJ9HnhPflHVtb6cHVbplRKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hc0dJVMomD4pZ6ocTgc/kQ1IZAUmslP7xHafS6o4NqvHK0ycjWe/tPeziZMkCAQwwse60dfemlB0fSxu2aUsRoESDC4wRTrsf16mlLmyhuKbpUPYrIdouXodbye31tffZTcwNRhBlMNAzke31zzsHhPUd2SDr82mzeV2D4Oiwhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpoRP9Ot; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpoRP9Ot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765858873; x=1797394873;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=g9Kl9Jj8JzaZVhDb3J8zwJ9HnhPflHVtb6cHVbplRKI=;
  b=fpoRP9OtWYim/78xqDmgupKZPiBsn3wxBZVd9kdiYzpya/tVOeVlQhb+
   TxLBZwxUnLHY0509f5fLHLNFUJ67gyUL8JLCibRKGbaCXstzV4RZaOGMq
   GSZyvw2njyLQFEb/TAD57xqAywt/MgNr0wZyMw0LqHHyToVWueNtndiV4
   ivA4e66BIOORLIULPoHJaKIibRusMQW/ilaEZIVgD/56+8Uutt2KZ7oqS
   qe/NuCjr38OG0x4xEpjHWr3RvuXZuqcEPTk4sFTOvIp5OrcWdPUaLKU6B
   nGrVk9E9U29ps6dCJ6QmOUgdHWlqYgUxn9ta9DyoxLMlSNr0mZ/CJCoiV
   w==;
X-CSE-ConnectionGUID: M5xEHaNrQUuBNP8TVxi3ZQ==
X-CSE-MsgGUID: 5HiICggGSRS+ZoNg76S/6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="70350006"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="70350006"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 20:21:07 -0800
X-CSE-ConnectionGUID: V2T3/GYHShydBNZB4LdsKw==
X-CSE-MsgGUID: rG1O50HQQAa0Q2d7NePYRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197957952"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 15 Dec 2025 20:21:05 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVMYZ-0000000019N-1JhJ;
	Tue, 16 Dec 2025 04:21:03 +0000
Date: Tue, 16 Dec 2025 12:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:335
 __cvdso_clock_gettime_common() warn: right shifting more than type allows 32
 vs 40
Message-ID: <202512161205.Wk05qozB-lkp@intel.com>
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
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: cd3557a7618bf5c1935e9f66b58a329f1f1f4b27 vdso/gettimeofday: Add support for auxiliary clocks
date:   5 months ago
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251216/202512161205.Wk05qozB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512161205.Wk05qozB-lkp@intel.com/

smatch warnings:
arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:335 __cvdso_clock_gettime_common() warn: right shifting more than type allows 32 vs 40
arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:335 __cvdso_clock_gettime_common() warn: bitwise AND condition is false here
arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:481 __cvdso_clock_getres_common() warn: right shifting more than type allows 32 vs 40
arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:481 __cvdso_clock_getres_common() warn: bitwise AND condition is false here

vim +335 arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c

cd3557a7618bf5 Thomas Weiﬂschuh   2025-07-01  313  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  314  static __always_inline bool
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  315  __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  316  			     struct __kernel_timespec *ts)
00b26474c2f161 Vincenzo Frascino  2019-06-21  317  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  318  	const struct vdso_clock *vc = vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  319  	u32 msk;
00b26474c2f161 Vincenzo Frascino  2019-06-21  320  
1a1cd5fe881fdf Thomas Weiﬂschuh   2025-07-01  321  	if (!vdso_clockid_valid(clock))
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  322  		return false;
00b26474c2f161 Vincenzo Frascino  2019-06-21  323  
00b26474c2f161 Vincenzo Frascino  2019-06-21  324  	/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  325  	 * Convert the clockid to a bitmask and use it to check which
00b26474c2f161 Vincenzo Frascino  2019-06-21  326  	 * clocks are handled in the VDSO directly.
00b26474c2f161 Vincenzo Frascino  2019-06-21  327  	 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  328  	msk = 1U << clock;
8463cf80529d0f Christophe Leroy   2019-12-23  329  	if (likely(msk & VDSO_HRES))
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  330  		vc = &vc[CS_HRES_COARSE];
8463cf80529d0f Christophe Leroy   2019-12-23  331  	else if (msk & VDSO_COARSE)
70067ae181f302 Anna-Maria Behnsen 2025-03-03  332  		return do_coarse(vd, &vc[CS_HRES_COARSE], clock, ts);
8463cf80529d0f Christophe Leroy   2019-12-23  333  	else if (msk & VDSO_RAW)
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  334  		vc = &vc[CS_RAW];
cd3557a7618bf5 Thomas Weiﬂschuh   2025-07-01 @335  	else if (msk & VDSO_AUX)
cd3557a7618bf5 Thomas Weiﬂschuh   2025-07-01  336  		return do_aux(vd, clock, ts);
c966533f8c6c45 Andrei Vagin       2019-11-12  337  	else
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  338  		return false;
c966533f8c6c45 Andrei Vagin       2019-11-12  339  
64c3613ce31a1a Anna-Maria Behnsen 2025-03-03  340  	return do_hres(vd, vc, clock, ts);
502a590a170b3b Thomas Gleixner    2019-07-28  341  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  342  
502a590a170b3b Thomas Gleixner    2019-07-28  343  static __maybe_unused int
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  344  __cvdso_clock_gettime_data(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  345  			   struct __kernel_timespec *ts)
502a590a170b3b Thomas Gleixner    2019-07-28  346  {
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  347  	bool ok;
502a590a170b3b Thomas Gleixner    2019-07-28  348  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  349  	ok = __cvdso_clock_gettime_common(vd, clock, ts);
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  350  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  351  	if (unlikely(!ok))
00b26474c2f161 Vincenzo Frascino  2019-06-21  352  		return clock_gettime_fallback(clock, ts);
502a590a170b3b Thomas Gleixner    2019-07-28  353  	return 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  354  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  355  
e876f0b69dc993 Christophe Leroy   2020-02-07  356  static __maybe_unused int
e876f0b69dc993 Christophe Leroy   2020-02-07  357  __cvdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
e876f0b69dc993 Christophe Leroy   2020-02-07  358  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  359  	return __cvdso_clock_gettime_data(__arch_get_vdso_u_time_data(), clock, ts);
e876f0b69dc993 Christophe Leroy   2020-02-07  360  }
e876f0b69dc993 Christophe Leroy   2020-02-07  361  
bf279849ad5953 Vincenzo Frascino  2019-08-30  362  #ifdef BUILD_VDSO32
00b26474c2f161 Vincenzo Frascino  2019-06-21  363  static __maybe_unused int
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  364  __cvdso_clock_gettime32_data(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  365  			     struct old_timespec32 *res)
00b26474c2f161 Vincenzo Frascino  2019-06-21  366  {
00b26474c2f161 Vincenzo Frascino  2019-06-21  367  	struct __kernel_timespec ts;
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  368  	bool ok;
00b26474c2f161 Vincenzo Frascino  2019-06-21  369  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  370  	ok = __cvdso_clock_gettime_common(vd, clock, &ts);
00b26474c2f161 Vincenzo Frascino  2019-06-21  371  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  372  	if (unlikely(!ok))
c60a32ea4f459f Thomas Gleixner    2019-07-30  373  		return clock_gettime32_fallback(clock, res);
502a590a170b3b Thomas Gleixner    2019-07-28  374  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  375  	/* For ok == true */
00b26474c2f161 Vincenzo Frascino  2019-06-21  376  	res->tv_sec = ts.tv_sec;
00b26474c2f161 Vincenzo Frascino  2019-06-21  377  	res->tv_nsec = ts.tv_nsec;
a279235ddbe975 Vincenzo Frascino  2019-08-30  378  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  379  	return 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  380  }
e876f0b69dc993 Christophe Leroy   2020-02-07  381  
e876f0b69dc993 Christophe Leroy   2020-02-07  382  static __maybe_unused int
e876f0b69dc993 Christophe Leroy   2020-02-07  383  __cvdso_clock_gettime32(clockid_t clock, struct old_timespec32 *res)
e876f0b69dc993 Christophe Leroy   2020-02-07  384  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  385  	return __cvdso_clock_gettime32_data(__arch_get_vdso_u_time_data(), clock, res);
e876f0b69dc993 Christophe Leroy   2020-02-07  386  }
bf279849ad5953 Vincenzo Frascino  2019-08-30  387  #endif /* BUILD_VDSO32 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  388  
00b26474c2f161 Vincenzo Frascino  2019-06-21  389  static __maybe_unused int
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  390  __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
e876f0b69dc993 Christophe Leroy   2020-02-07  391  			  struct __kernel_old_timeval *tv, struct timezone *tz)
00b26474c2f161 Vincenzo Frascino  2019-06-21  392  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  393  	const struct vdso_clock *vc = vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  394  
00b26474c2f161 Vincenzo Frascino  2019-06-21  395  	if (likely(tv != NULL)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  396  		struct __kernel_timespec ts;
00b26474c2f161 Vincenzo Frascino  2019-06-21  397  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  398  		if (!do_hres(vd, &vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
00b26474c2f161 Vincenzo Frascino  2019-06-21  399  			return gettimeofday_fallback(tv, tz);
00b26474c2f161 Vincenzo Frascino  2019-06-21  400  
00b26474c2f161 Vincenzo Frascino  2019-06-21  401  		tv->tv_sec = ts.tv_sec;
00b26474c2f161 Vincenzo Frascino  2019-06-21  402  		tv->tv_usec = (u32)ts.tv_nsec / NSEC_PER_USEC;
00b26474c2f161 Vincenzo Frascino  2019-06-21  403  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  404  
00b26474c2f161 Vincenzo Frascino  2019-06-21  405  	if (unlikely(tz != NULL)) {
660fd04f931717 Thomas Gleixner    2019-11-12  406  		if (IS_ENABLED(CONFIG_TIME_NS) &&
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  407  		    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  408  			vd = __arch_get_vdso_u_timens_data(vd);
660fd04f931717 Thomas Gleixner    2019-11-12  409  
00b26474c2f161 Vincenzo Frascino  2019-06-21  410  		tz->tz_minuteswest = vd[CS_HRES_COARSE].tz_minuteswest;
00b26474c2f161 Vincenzo Frascino  2019-06-21  411  		tz->tz_dsttime = vd[CS_HRES_COARSE].tz_dsttime;
00b26474c2f161 Vincenzo Frascino  2019-06-21  412  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  413  
00b26474c2f161 Vincenzo Frascino  2019-06-21  414  	return 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  415  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  416  
e876f0b69dc993 Christophe Leroy   2020-02-07  417  static __maybe_unused int
e876f0b69dc993 Christophe Leroy   2020-02-07  418  __cvdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
e876f0b69dc993 Christophe Leroy   2020-02-07  419  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  420  	return __cvdso_gettimeofday_data(__arch_get_vdso_u_time_data(), tv, tz);
e876f0b69dc993 Christophe Leroy   2020-02-07  421  }
e876f0b69dc993 Christophe Leroy   2020-02-07  422  
00b26474c2f161 Vincenzo Frascino  2019-06-21  423  #ifdef VDSO_HAS_TIME
e876f0b69dc993 Christophe Leroy   2020-02-07  424  static __maybe_unused __kernel_old_time_t
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  425  __cvdso_time_data(const struct vdso_time_data *vd, __kernel_old_time_t *time)
00b26474c2f161 Vincenzo Frascino  2019-06-21  426  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  427  	const struct vdso_clock *vc = vd->clock_data;
660fd04f931717 Thomas Gleixner    2019-11-12  428  	__kernel_old_time_t t;
660fd04f931717 Thomas Gleixner    2019-11-12  429  
2d6b01bd88ccab Thomas Gleixner    2020-02-07  430  	if (IS_ENABLED(CONFIG_TIME_NS) &&
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  431  	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS) {
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  432  		vd = __arch_get_vdso_u_timens_data(vd);
886653e3663917 Anna-Maria Behnsen 2025-03-03  433  		vc = vd->clock_data;
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  434  	}
660fd04f931717 Thomas Gleixner    2019-11-12  435  
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  436  	t = READ_ONCE(vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
00b26474c2f161 Vincenzo Frascino  2019-06-21  437  
00b26474c2f161 Vincenzo Frascino  2019-06-21  438  	if (time)
00b26474c2f161 Vincenzo Frascino  2019-06-21  439  		*time = t;
00b26474c2f161 Vincenzo Frascino  2019-06-21  440  
00b26474c2f161 Vincenzo Frascino  2019-06-21  441  	return t;
00b26474c2f161 Vincenzo Frascino  2019-06-21  442  }
e876f0b69dc993 Christophe Leroy   2020-02-07  443  
e876f0b69dc993 Christophe Leroy   2020-02-07  444  static __maybe_unused __kernel_old_time_t __cvdso_time(__kernel_old_time_t *time)
e876f0b69dc993 Christophe Leroy   2020-02-07  445  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  446  	return __cvdso_time_data(__arch_get_vdso_u_time_data(), time);
e876f0b69dc993 Christophe Leroy   2020-02-07  447  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  448  #endif /* VDSO_HAS_TIME */
00b26474c2f161 Vincenzo Frascino  2019-06-21  449  
00b26474c2f161 Vincenzo Frascino  2019-06-21  450  #ifdef VDSO_HAS_CLOCK_GETRES
00b26474c2f161 Vincenzo Frascino  2019-06-21  451  static __maybe_unused
34f888e3405ace Thomas Weiﬂschuh   2025-07-01  452  bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  453  				 struct __kernel_timespec *res)
00b26474c2f161 Vincenzo Frascino  2019-06-21  454  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  455  	const struct vdso_clock *vc = vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  456  	u32 msk;
502a590a170b3b Thomas Gleixner    2019-07-28  457  	u64 ns;
00b26474c2f161 Vincenzo Frascino  2019-06-21  458  
1a1cd5fe881fdf Thomas Weiﬂschuh   2025-07-01  459  	if (!vdso_clockid_valid(clock))
34f888e3405ace Thomas Weiﬂschuh   2025-07-01  460  		return false;
00b26474c2f161 Vincenzo Frascino  2019-06-21  461  
2d6b01bd88ccab Thomas Gleixner    2020-02-07  462  	if (IS_ENABLED(CONFIG_TIME_NS) &&
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  463  	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  464  		vd = __arch_get_vdso_u_timens_data(vd);
660fd04f931717 Thomas Gleixner    2019-11-12  465  
00b26474c2f161 Vincenzo Frascino  2019-06-21  466  	/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  467  	 * Convert the clockid to a bitmask and use it to check which
00b26474c2f161 Vincenzo Frascino  2019-06-21  468  	 * clocks are handled in the VDSO directly.
00b26474c2f161 Vincenzo Frascino  2019-06-21  469  	 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  470  	msk = 1U << clock;
cdb7c5a9c897ab Christophe Leroy   2019-12-23  471  	if (msk & (VDSO_HRES | VDSO_RAW)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  472  		/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  473  		 * Preserves the behaviour of posix_get_hrtimer_res().
00b26474c2f161 Vincenzo Frascino  2019-06-21  474  		 */
886653e3663917 Anna-Maria Behnsen 2025-03-03  475  		ns = READ_ONCE(vd->hrtimer_res);
00b26474c2f161 Vincenzo Frascino  2019-06-21  476  	} else if (msk & VDSO_COARSE) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  477  		/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  478  		 * Preserves the behaviour of posix_get_coarse_res().
00b26474c2f161 Vincenzo Frascino  2019-06-21  479  		 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  480  		ns = LOW_RES_NSEC;
cd3557a7618bf5 Thomas Weiﬂschuh   2025-07-01 @481  	} else if (msk & VDSO_AUX) {
cd3557a7618bf5 Thomas Weiﬂschuh   2025-07-01  482  		ns = aux_clock_resolution_ns();
00b26474c2f161 Vincenzo Frascino  2019-06-21  483  	} else {
34f888e3405ace Thomas Weiﬂschuh   2025-07-01  484  		return false;
00b26474c2f161 Vincenzo Frascino  2019-06-21  485  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  486  
1638b8f096ca16 Thomas Gleixner    2019-10-21  487  	if (likely(res)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  488  		res->tv_sec = 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  489  		res->tv_nsec = ns;
1638b8f096ca16 Thomas Gleixner    2019-10-21  490  	}
34f888e3405ace Thomas Weiﬂschuh   2025-07-01  491  	return true;
502a590a170b3b Thomas Gleixner    2019-07-28  492  }
502a590a170b3b Thomas Gleixner    2019-07-28  493  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
