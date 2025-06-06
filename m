Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01303126C17
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jun 2025 23:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749252221; cv=none; b=n/vXtfUvaNh6DTbeeBU1PEkNPwsIlkGtUK8X5Qfhs6PiyOLBghAoYYtiYPdanRXAXtgPTBveQjHKzSkYun83WtLBEx5POZ36PiZsUwZ6aAe2m0xeCuGI4XtDT/aqQMMRx/D/EDZO73H+CfiiRwUGB/r9x0C1p493if63T5bTCrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749252221; c=relaxed/simple;
	bh=zLrVQBbIQJcKIgc0tRJfNdnlPhId/G13fSTABR8qPO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VoQQSyyX6Y4RytBhXbxI74lmr96nPzXTWQriQP4uiwBkaJP2O0cKZvuTUuyQ1LTrVo/Pc5WifxsfOzTpYYkzWPjA6z0onm4BvrOARD6G7tCOcy3diuO2WYLPUSCrq+GJoNV1jVgKq8LsviPv0IuNWQW+Sig1AMWiTZW0noqhYP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSZ6x2/6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSZ6x2/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749252219; x=1780788219;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zLrVQBbIQJcKIgc0tRJfNdnlPhId/G13fSTABR8qPO8=;
  b=bSZ6x2/6YQDN+btaeIUDYInV1MwOe0wtmD2DmIcNo6cw8FcfTIMeT7F4
   YIEF57N5W+4lyAbYY0cC49o3sivMBUcKwMAPlwv14dmhNr2TKgXVAXzxl
   BlqWXouw1IisLyAt1g7xsGQeo9WlBHcUnyXZn4uw+o+7z7SggxmaTwR7e
   Pljr1bAFC0JDBCrcpRMb30jBr+e6PaHeOWJV09LzfUa7AfjaRLIQAn6n+
   tIFhv0Cv8hxJvV+bMwW1zXdw66ELK4eZv/H3PXhkIDHWbEvB50aIZrgn1
   9o+2u4HN6Ht10E7qfxWOjRAg4hzPsQwHQyGc2DJ/I27yH7og0sVdlWeEh
   Q==;
X-CSE-ConnectionGUID: 0ZKVhqc0SMuQHWfXuf8+gA==
X-CSE-MsgGUID: sYszbYUSTtqbDigXylt8HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="62809849"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="62809849"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 16:23:38 -0700
X-CSE-ConnectionGUID: WzylfaNaS7O0svWIvDlhYg==
X-CSE-MsgGUID: UKDnU51VTsibyDwM2Bcbew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="145878076"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Jun 2025 16:23:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNgPO-0005Kv-2x;
	Fri, 06 Jun 2025 23:23:34 +0000
Date: Sat, 7 Jun 2025 07:23:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [thomas-weissschuh:b4/vdso-ptp 40/41]
 arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:335
 __cvdso_clock_gettime_common() warn: right shifting more than type allows 32
 vs 40
Message-ID: <202506070701.TgxbA5AU-lkp@intel.com>
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
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-ptp
head:   72077b3c44e381076449b817f73dd764c4eef196
commit: 14518473f21d795a7cbac78518660eaae3663011 [40/41] vdso/gettimeofday: Add support for auxiliary clocks
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-161-20250607 (https://download.01.org/0day-ci/archive/20250607/202506070701.TgxbA5AU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506070701.TgxbA5AU-lkp@intel.com/

smatch warnings:
arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:335 __cvdso_clock_gettime_common() warn: right shifting more than type allows 32 vs 40
arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:335 __cvdso_clock_gettime_common() warn: bitwise AND condition is false here
arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:479 __cvdso_clock_getres_common() warn: right shifting more than type allows 32 vs 40
arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:479 __cvdso_clock_getres_common() warn: bitwise AND condition is false here

vim +335 arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c

14518473f21d79 Thomas Weiﬂschuh   2025-06-05  313  
edeb59c3ee3a14 Thomas Weiﬂschuh   2025-06-05  314  static __always_inline bool
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  315  __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  316  			     struct __kernel_timespec *ts)
00b26474c2f161 Vincenzo Frascino  2019-06-21  317  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  318  	const struct vdso_clock *vc = vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  319  	u32 msk;
00b26474c2f161 Vincenzo Frascino  2019-06-21  320  
9847f8b00d26ad Thomas Weiﬂschuh   2025-01-16  321  	if (!vdso_clockid_valid(clock))
edeb59c3ee3a14 Thomas Weiﬂschuh   2025-06-05  322  		return false;
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
14518473f21d79 Thomas Weiﬂschuh   2025-06-05 @335  	else if (msk & VDSO_AUX)
14518473f21d79 Thomas Weiﬂschuh   2025-06-05  336  		return do_aux(vd, clock, ts);
c966533f8c6c45 Andrei Vagin       2019-11-12  337  	else
edeb59c3ee3a14 Thomas Weiﬂschuh   2025-06-05  338  		return false;
c966533f8c6c45 Andrei Vagin       2019-11-12  339  
64c3613ce31a1a Anna-Maria Behnsen 2025-03-03  340  	return do_hres(vd, vc, clock, ts);
502a590a170b3b Thomas Gleixner    2019-07-28  341  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  342  
502a590a170b3b Thomas Gleixner    2019-07-28  343  static __maybe_unused int
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  344  __cvdso_clock_gettime_data(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  345  			   struct __kernel_timespec *ts)
502a590a170b3b Thomas Gleixner    2019-07-28  346  {
edeb59c3ee3a14 Thomas Weiﬂschuh   2025-06-05  347  	bool ret = __cvdso_clock_gettime_common(vd, clock, ts);
502a590a170b3b Thomas Gleixner    2019-07-28  348  
edeb59c3ee3a14 Thomas Weiﬂschuh   2025-06-05  349  	if (unlikely(!ret))
00b26474c2f161 Vincenzo Frascino  2019-06-21  350  		return clock_gettime_fallback(clock, ts);
502a590a170b3b Thomas Gleixner    2019-07-28  351  	return 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  352  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  353  
e876f0b69dc993 Christophe Leroy   2020-02-07  354  static __maybe_unused int
e876f0b69dc993 Christophe Leroy   2020-02-07  355  __cvdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
e876f0b69dc993 Christophe Leroy   2020-02-07  356  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  357  	return __cvdso_clock_gettime_data(__arch_get_vdso_u_time_data(), clock, ts);
e876f0b69dc993 Christophe Leroy   2020-02-07  358  }
e876f0b69dc993 Christophe Leroy   2020-02-07  359  
bf279849ad5953 Vincenzo Frascino  2019-08-30  360  #ifdef BUILD_VDSO32
00b26474c2f161 Vincenzo Frascino  2019-06-21  361  static __maybe_unused int
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  362  __cvdso_clock_gettime32_data(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  363  			     struct old_timespec32 *res)
00b26474c2f161 Vincenzo Frascino  2019-06-21  364  {
00b26474c2f161 Vincenzo Frascino  2019-06-21  365  	struct __kernel_timespec ts;
00b26474c2f161 Vincenzo Frascino  2019-06-21  366  	int ret;
00b26474c2f161 Vincenzo Frascino  2019-06-21  367  
e876f0b69dc993 Christophe Leroy   2020-02-07  368  	ret = __cvdso_clock_gettime_common(vd, clock, &ts);
00b26474c2f161 Vincenzo Frascino  2019-06-21  369  
c60a32ea4f459f Thomas Gleixner    2019-07-30  370  	if (unlikely(ret))
c60a32ea4f459f Thomas Gleixner    2019-07-30  371  		return clock_gettime32_fallback(clock, res);
502a590a170b3b Thomas Gleixner    2019-07-28  372  
a279235ddbe975 Vincenzo Frascino  2019-08-30  373  	/* For ret == 0 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  374  	res->tv_sec = ts.tv_sec;
00b26474c2f161 Vincenzo Frascino  2019-06-21  375  	res->tv_nsec = ts.tv_nsec;
a279235ddbe975 Vincenzo Frascino  2019-08-30  376  
00b26474c2f161 Vincenzo Frascino  2019-06-21  377  	return ret;
00b26474c2f161 Vincenzo Frascino  2019-06-21  378  }
e876f0b69dc993 Christophe Leroy   2020-02-07  379  
e876f0b69dc993 Christophe Leroy   2020-02-07  380  static __maybe_unused int
e876f0b69dc993 Christophe Leroy   2020-02-07  381  __cvdso_clock_gettime32(clockid_t clock, struct old_timespec32 *res)
e876f0b69dc993 Christophe Leroy   2020-02-07  382  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  383  	return __cvdso_clock_gettime32_data(__arch_get_vdso_u_time_data(), clock, res);
e876f0b69dc993 Christophe Leroy   2020-02-07  384  }
bf279849ad5953 Vincenzo Frascino  2019-08-30  385  #endif /* BUILD_VDSO32 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  386  
00b26474c2f161 Vincenzo Frascino  2019-06-21  387  static __maybe_unused int
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  388  __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
e876f0b69dc993 Christophe Leroy   2020-02-07  389  			  struct __kernel_old_timeval *tv, struct timezone *tz)
00b26474c2f161 Vincenzo Frascino  2019-06-21  390  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  391  	const struct vdso_clock *vc = vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  392  
00b26474c2f161 Vincenzo Frascino  2019-06-21  393  	if (likely(tv != NULL)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  394  		struct __kernel_timespec ts;
00b26474c2f161 Vincenzo Frascino  2019-06-21  395  
64c3613ce31a1a Anna-Maria Behnsen 2025-03-03  396  		if (do_hres(vd, &vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
00b26474c2f161 Vincenzo Frascino  2019-06-21  397  			return gettimeofday_fallback(tv, tz);
00b26474c2f161 Vincenzo Frascino  2019-06-21  398  
00b26474c2f161 Vincenzo Frascino  2019-06-21  399  		tv->tv_sec = ts.tv_sec;
00b26474c2f161 Vincenzo Frascino  2019-06-21  400  		tv->tv_usec = (u32)ts.tv_nsec / NSEC_PER_USEC;
00b26474c2f161 Vincenzo Frascino  2019-06-21  401  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  402  
00b26474c2f161 Vincenzo Frascino  2019-06-21  403  	if (unlikely(tz != NULL)) {
660fd04f931717 Thomas Gleixner    2019-11-12  404  		if (IS_ENABLED(CONFIG_TIME_NS) &&
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  405  		    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  406  			vd = __arch_get_vdso_u_timens_data(vd);
660fd04f931717 Thomas Gleixner    2019-11-12  407  
00b26474c2f161 Vincenzo Frascino  2019-06-21  408  		tz->tz_minuteswest = vd[CS_HRES_COARSE].tz_minuteswest;
00b26474c2f161 Vincenzo Frascino  2019-06-21  409  		tz->tz_dsttime = vd[CS_HRES_COARSE].tz_dsttime;
00b26474c2f161 Vincenzo Frascino  2019-06-21  410  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  411  
00b26474c2f161 Vincenzo Frascino  2019-06-21  412  	return 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  413  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  414  
e876f0b69dc993 Christophe Leroy   2020-02-07  415  static __maybe_unused int
e876f0b69dc993 Christophe Leroy   2020-02-07  416  __cvdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
e876f0b69dc993 Christophe Leroy   2020-02-07  417  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  418  	return __cvdso_gettimeofday_data(__arch_get_vdso_u_time_data(), tv, tz);
e876f0b69dc993 Christophe Leroy   2020-02-07  419  }
e876f0b69dc993 Christophe Leroy   2020-02-07  420  
00b26474c2f161 Vincenzo Frascino  2019-06-21  421  #ifdef VDSO_HAS_TIME
e876f0b69dc993 Christophe Leroy   2020-02-07  422  static __maybe_unused __kernel_old_time_t
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  423  __cvdso_time_data(const struct vdso_time_data *vd, __kernel_old_time_t *time)
00b26474c2f161 Vincenzo Frascino  2019-06-21  424  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  425  	const struct vdso_clock *vc = vd->clock_data;
660fd04f931717 Thomas Gleixner    2019-11-12  426  	__kernel_old_time_t t;
660fd04f931717 Thomas Gleixner    2019-11-12  427  
2d6b01bd88ccab Thomas Gleixner    2020-02-07  428  	if (IS_ENABLED(CONFIG_TIME_NS) &&
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  429  	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS) {
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  430  		vd = __arch_get_vdso_u_timens_data(vd);
886653e3663917 Anna-Maria Behnsen 2025-03-03  431  		vc = vd->clock_data;
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  432  	}
660fd04f931717 Thomas Gleixner    2019-11-12  433  
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  434  	t = READ_ONCE(vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
00b26474c2f161 Vincenzo Frascino  2019-06-21  435  
00b26474c2f161 Vincenzo Frascino  2019-06-21  436  	if (time)
00b26474c2f161 Vincenzo Frascino  2019-06-21  437  		*time = t;
00b26474c2f161 Vincenzo Frascino  2019-06-21  438  
00b26474c2f161 Vincenzo Frascino  2019-06-21  439  	return t;
00b26474c2f161 Vincenzo Frascino  2019-06-21  440  }
e876f0b69dc993 Christophe Leroy   2020-02-07  441  
e876f0b69dc993 Christophe Leroy   2020-02-07  442  static __maybe_unused __kernel_old_time_t __cvdso_time(__kernel_old_time_t *time)
e876f0b69dc993 Christophe Leroy   2020-02-07  443  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  444  	return __cvdso_time_data(__arch_get_vdso_u_time_data(), time);
e876f0b69dc993 Christophe Leroy   2020-02-07  445  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  446  #endif /* VDSO_HAS_TIME */
00b26474c2f161 Vincenzo Frascino  2019-06-21  447  
00b26474c2f161 Vincenzo Frascino  2019-06-21  448  #ifdef VDSO_HAS_CLOCK_GETRES
00b26474c2f161 Vincenzo Frascino  2019-06-21  449  static __maybe_unused
97686a778e9acf Thomas Weiﬂschuh   2025-06-05  450  bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  451  				 struct __kernel_timespec *res)
00b26474c2f161 Vincenzo Frascino  2019-06-21  452  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  453  	const struct vdso_clock *vc = vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  454  	u32 msk;
502a590a170b3b Thomas Gleixner    2019-07-28  455  	u64 ns;
00b26474c2f161 Vincenzo Frascino  2019-06-21  456  
9847f8b00d26ad Thomas Weiﬂschuh   2025-01-16  457  	if (!vdso_clockid_valid(clock))
97686a778e9acf Thomas Weiﬂschuh   2025-06-05  458  		return false;
00b26474c2f161 Vincenzo Frascino  2019-06-21  459  
2d6b01bd88ccab Thomas Gleixner    2020-02-07  460  	if (IS_ENABLED(CONFIG_TIME_NS) &&
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  461  	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  462  		vd = __arch_get_vdso_u_timens_data(vd);
660fd04f931717 Thomas Gleixner    2019-11-12  463  
00b26474c2f161 Vincenzo Frascino  2019-06-21  464  	/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  465  	 * Convert the clockid to a bitmask and use it to check which
00b26474c2f161 Vincenzo Frascino  2019-06-21  466  	 * clocks are handled in the VDSO directly.
00b26474c2f161 Vincenzo Frascino  2019-06-21  467  	 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  468  	msk = 1U << clock;
cdb7c5a9c897ab Christophe Leroy   2019-12-23  469  	if (msk & (VDSO_HRES | VDSO_RAW)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  470  		/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  471  		 * Preserves the behaviour of posix_get_hrtimer_res().
00b26474c2f161 Vincenzo Frascino  2019-06-21  472  		 */
886653e3663917 Anna-Maria Behnsen 2025-03-03  473  		ns = READ_ONCE(vd->hrtimer_res);
00b26474c2f161 Vincenzo Frascino  2019-06-21  474  	} else if (msk & VDSO_COARSE) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  475  		/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  476  		 * Preserves the behaviour of posix_get_coarse_res().
00b26474c2f161 Vincenzo Frascino  2019-06-21  477  		 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  478  		ns = LOW_RES_NSEC;
14518473f21d79 Thomas Weiﬂschuh   2025-06-05 @479  	} else if (msk & VDSO_AUX) {
14518473f21d79 Thomas Weiﬂschuh   2025-06-05  480  		ns = aux_clock_resolution_ns();
00b26474c2f161 Vincenzo Frascino  2019-06-21  481  	} else {
97686a778e9acf Thomas Weiﬂschuh   2025-06-05  482  		return false;
00b26474c2f161 Vincenzo Frascino  2019-06-21  483  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  484  
1638b8f096ca16 Thomas Gleixner    2019-10-21  485  	if (likely(res)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  486  		res->tv_sec = 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  487  		res->tv_nsec = ns;
1638b8f096ca16 Thomas Gleixner    2019-10-21  488  	}
97686a778e9acf Thomas Weiﬂschuh   2025-06-05  489  	return true;
502a590a170b3b Thomas Gleixner    2019-07-28  490  }
502a590a170b3b Thomas Gleixner    2019-07-28  491  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
