Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A937E1411DE
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 02:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761705034; cv=none; b=g/DmX+rxymXmHl8wYdK363wcQUd5JHg2WZBsWQE7DTKYvILj+IZyraxHahrKh9EZ2hem7LnSAr1LTrBbV1YNEbgxvAbIGWlOA3kPgD/RZiswTGDa4cxZhxTuJ6tNJz0OEuIni3Bc+8C9fKrwcYajCTAyq0uftjGDvw+mtN5l0eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761705034; c=relaxed/simple;
	bh=1SlUmIY5Dg1IT9GBgNivMEwHMZrzoaxFqDY+aR1UWeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=agK43JBPjTDe8mTyAU+8M3nfj/OAFRDsTdEyJyFChdPojjM5avBPckhboMdI9kJFMyZKiqOJ+/zQZv/uSrYPpXCUIstx+FI6DYT67palti9G/NNwE78VCVlzc6e8V+9eFzG27bJBTK9W2alctqAIjX0WlOB+8jrbk8WGppA8U6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hv4eqrn7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hv4eqrn7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761705030; x=1793241030;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1SlUmIY5Dg1IT9GBgNivMEwHMZrzoaxFqDY+aR1UWeo=;
  b=hv4eqrn7BsJS8eU0GfX2/04twytWbOn4h4Qybm7JVI81wiKufaxg3lx2
   5sPkdm7Ro0DaN+pVT2MvCkF5p/ThgCmhwj6xgrtg/W1F0chDc5h0AbtY8
   YPKbnoelDtbSfvvg2rm0YW7CTjo6iE+5lH+TEd72Fzm6Qb0RyvXaOddKX
   gH76Lpm6qx1zLqjI5qIzPPRSP3yhqtBolvZsAnxM5m7kFAGIolKa0FJN2
   /V43eU2hDacd9w4jSo6lI6mtac1McozhDXMGr4aSekzP9SLd84QmlfIqJ
   2Mdt8r+nuIZbLASbn2AfI4fnfWPTq6jQ5gdk6EbFA2TEr68ayoaFmV8yK
   Q==;
X-CSE-ConnectionGUID: VAotdarQRI+FWiWUfWHcUg==
X-CSE-MsgGUID: nzF3pID2T5Oa09ZrG652/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67459812"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="67459812"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 19:30:30 -0700
X-CSE-ConnectionGUID: Ocxzppg4SYuIYPaPUMciiw==
X-CSE-MsgGUID: noMPAxCfSPaxsWlc0IO7FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="222740977"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Oct 2025 19:30:29 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDvxC-000K3t-1M;
	Wed, 29 Oct 2025 02:30:26 +0000
Date: Wed, 29 Oct 2025 10:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/6] x86/entry/vdso: refactor the vdso build
Message-ID: <202510291031.ql4Glo7a-lkp@intel.com>
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
In-Reply-To: <20251026221208.1938173-3-hpa@zytor.com>
References: <20251026221208.1938173-3-hpa@zytor.com>
TO: "H. Peter Anvin" <hpa@zytor.com>
TO: "H. Peter Anvin" <hpa@zytor.com>
TO: "Jason A. Donenfeld" <Jason@zx2c4.com>
TO: "Peter Zijlstra (Intel)" <peterz@infradead.org>
TO: "Theodore Ts'o" <tytso@mit.edu>
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>
TO: Xin Li <xin@zytor.com>
TO: Andrew Cooper <andrew.cooper3@citrix.com>
TO: Andy Lutomirski <luto@kernel.org>
TO: Ard Biesheuvel <ardb@kernel.org>
TO: Borislav Petkov <bp@alien8.de>
TO: Brian Gerst <brgerst@gmail.com>
TO: Dave Hansen <dave.hansen@linux.intel.com>
TO: Ingo Molnar <mingo@redhat.com>
TO: James Morse <james.morse@arm.com>
TO: Jarkko Sakkinen <jarkko@kernel.org>
TO: Josh Poimboeuf <jpoimboe@kernel.org>
TO: Kees Cook <kees@kernel.org>
TO: Nam Cao <namcao@linutronix.de>
TO: Oleg Nesterov <oleg@redhat.com>
TO: Perry Yuan <perry.yuan@amd.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Thomas Huth <thuth@redhat.com>
TO: Uros Bizjak <ubizjak@gmail.com>
TO: linux-kernel@vger.kernel.org
TO: linux-mm@kvack.org
TO: linux-sgx@vger.kernel.org
TO: x86@kernel.org

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on linus/master v6.18-rc3 next-20251028]
[cannot apply to tip/x86/vdso crng-random/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/H-Peter-Anvin/x86-entry-vdso-rename-vdso_image_-to-vdso-_image/20251027-061505
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20251026221208.1938173-3-hpa%40zytor.com
patch subject: [PATCH 2/6] x86/entry/vdso: refactor the vdso build
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20251027 (https://download.01.org/0day-ci/archive/20251029/202510291031.ql4Glo7a-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510291031.ql4Glo7a-lkp@intel.com/

smatch warnings:
arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:308 __cvdso_clock_gettime_common() warn: right shifting more than type allows 32 vs 40
arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:308 __cvdso_clock_gettime_common() warn: bitwise AND condition is false here
arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:454 __cvdso_clock_getres_common() warn: right shifting more than type allows 32 vs 40
arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:454 __cvdso_clock_getres_common() warn: bitwise AND condition is false here

vim +308 arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c

cd3557a7618bf5 Thomas Weiﬂschuh   2025-07-01  286  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  287  static __always_inline bool
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  288  __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  289  			     struct __kernel_timespec *ts)
00b26474c2f161 Vincenzo Frascino  2019-06-21  290  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  291  	const struct vdso_clock *vc = vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  292  	u32 msk;
00b26474c2f161 Vincenzo Frascino  2019-06-21  293  
1a1cd5fe881fdf Thomas Weiﬂschuh   2025-07-01  294  	if (!vdso_clockid_valid(clock))
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  295  		return false;
00b26474c2f161 Vincenzo Frascino  2019-06-21  296  
00b26474c2f161 Vincenzo Frascino  2019-06-21  297  	/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  298  	 * Convert the clockid to a bitmask and use it to check which
00b26474c2f161 Vincenzo Frascino  2019-06-21  299  	 * clocks are handled in the VDSO directly.
00b26474c2f161 Vincenzo Frascino  2019-06-21  300  	 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  301  	msk = 1U << clock;
8463cf80529d0f Christophe Leroy   2019-12-23  302  	if (likely(msk & VDSO_HRES))
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  303  		vc = &vc[CS_HRES_COARSE];
8463cf80529d0f Christophe Leroy   2019-12-23  304  	else if (msk & VDSO_COARSE)
70067ae181f302 Anna-Maria Behnsen 2025-03-03  305  		return do_coarse(vd, &vc[CS_HRES_COARSE], clock, ts);
8463cf80529d0f Christophe Leroy   2019-12-23  306  	else if (msk & VDSO_RAW)
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  307  		vc = &vc[CS_RAW];
cd3557a7618bf5 Thomas Weiﬂschuh   2025-07-01 @308  	else if (msk & VDSO_AUX)
cd3557a7618bf5 Thomas Weiﬂschuh   2025-07-01  309  		return do_aux(vd, clock, ts);
c966533f8c6c45 Andrei Vagin       2019-11-12  310  	else
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  311  		return false;
c966533f8c6c45 Andrei Vagin       2019-11-12  312  
64c3613ce31a1a Anna-Maria Behnsen 2025-03-03  313  	return do_hres(vd, vc, clock, ts);
502a590a170b3b Thomas Gleixner    2019-07-28  314  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  315  
502a590a170b3b Thomas Gleixner    2019-07-28  316  static __maybe_unused int
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  317  __cvdso_clock_gettime_data(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  318  			   struct __kernel_timespec *ts)
502a590a170b3b Thomas Gleixner    2019-07-28  319  {
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  320  	bool ok;
502a590a170b3b Thomas Gleixner    2019-07-28  321  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  322  	ok = __cvdso_clock_gettime_common(vd, clock, ts);
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  323  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  324  	if (unlikely(!ok))
00b26474c2f161 Vincenzo Frascino  2019-06-21  325  		return clock_gettime_fallback(clock, ts);
502a590a170b3b Thomas Gleixner    2019-07-28  326  	return 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  327  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  328  
e876f0b69dc993 Christophe Leroy   2020-02-07  329  static __maybe_unused int
e876f0b69dc993 Christophe Leroy   2020-02-07  330  __cvdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
e876f0b69dc993 Christophe Leroy   2020-02-07  331  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  332  	return __cvdso_clock_gettime_data(__arch_get_vdso_u_time_data(), clock, ts);
e876f0b69dc993 Christophe Leroy   2020-02-07  333  }
e876f0b69dc993 Christophe Leroy   2020-02-07  334  
bf279849ad5953 Vincenzo Frascino  2019-08-30  335  #ifdef BUILD_VDSO32
00b26474c2f161 Vincenzo Frascino  2019-06-21  336  static __maybe_unused int
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  337  __cvdso_clock_gettime32_data(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  338  			     struct old_timespec32 *res)
00b26474c2f161 Vincenzo Frascino  2019-06-21  339  {
00b26474c2f161 Vincenzo Frascino  2019-06-21  340  	struct __kernel_timespec ts;
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  341  	bool ok;
00b26474c2f161 Vincenzo Frascino  2019-06-21  342  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  343  	ok = __cvdso_clock_gettime_common(vd, clock, &ts);
00b26474c2f161 Vincenzo Frascino  2019-06-21  344  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  345  	if (unlikely(!ok))
c60a32ea4f459f Thomas Gleixner    2019-07-30  346  		return clock_gettime32_fallback(clock, res);
502a590a170b3b Thomas Gleixner    2019-07-28  347  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  348  	/* For ok == true */
00b26474c2f161 Vincenzo Frascino  2019-06-21  349  	res->tv_sec = ts.tv_sec;
00b26474c2f161 Vincenzo Frascino  2019-06-21  350  	res->tv_nsec = ts.tv_nsec;
a279235ddbe975 Vincenzo Frascino  2019-08-30  351  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  352  	return 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  353  }
e876f0b69dc993 Christophe Leroy   2020-02-07  354  
e876f0b69dc993 Christophe Leroy   2020-02-07  355  static __maybe_unused int
e876f0b69dc993 Christophe Leroy   2020-02-07  356  __cvdso_clock_gettime32(clockid_t clock, struct old_timespec32 *res)
e876f0b69dc993 Christophe Leroy   2020-02-07  357  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  358  	return __cvdso_clock_gettime32_data(__arch_get_vdso_u_time_data(), clock, res);
e876f0b69dc993 Christophe Leroy   2020-02-07  359  }
bf279849ad5953 Vincenzo Frascino  2019-08-30  360  #endif /* BUILD_VDSO32 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  361  
00b26474c2f161 Vincenzo Frascino  2019-06-21  362  static __maybe_unused int
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  363  __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
e876f0b69dc993 Christophe Leroy   2020-02-07  364  			  struct __kernel_old_timeval *tv, struct timezone *tz)
00b26474c2f161 Vincenzo Frascino  2019-06-21  365  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  366  	const struct vdso_clock *vc = vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  367  
00b26474c2f161 Vincenzo Frascino  2019-06-21  368  	if (likely(tv != NULL)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  369  		struct __kernel_timespec ts;
00b26474c2f161 Vincenzo Frascino  2019-06-21  370  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  371  		if (!do_hres(vd, &vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
00b26474c2f161 Vincenzo Frascino  2019-06-21  372  			return gettimeofday_fallback(tv, tz);
00b26474c2f161 Vincenzo Frascino  2019-06-21  373  
00b26474c2f161 Vincenzo Frascino  2019-06-21  374  		tv->tv_sec = ts.tv_sec;
00b26474c2f161 Vincenzo Frascino  2019-06-21  375  		tv->tv_usec = (u32)ts.tv_nsec / NSEC_PER_USEC;
00b26474c2f161 Vincenzo Frascino  2019-06-21  376  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  377  
00b26474c2f161 Vincenzo Frascino  2019-06-21  378  	if (unlikely(tz != NULL)) {
660fd04f931717 Thomas Gleixner    2019-11-12  379  		if (IS_ENABLED(CONFIG_TIME_NS) &&
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  380  		    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  381  			vd = __arch_get_vdso_u_timens_data(vd);
660fd04f931717 Thomas Gleixner    2019-11-12  382  
00b26474c2f161 Vincenzo Frascino  2019-06-21  383  		tz->tz_minuteswest = vd[CS_HRES_COARSE].tz_minuteswest;
00b26474c2f161 Vincenzo Frascino  2019-06-21  384  		tz->tz_dsttime = vd[CS_HRES_COARSE].tz_dsttime;
00b26474c2f161 Vincenzo Frascino  2019-06-21  385  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  386  
00b26474c2f161 Vincenzo Frascino  2019-06-21  387  	return 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  388  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  389  
e876f0b69dc993 Christophe Leroy   2020-02-07  390  static __maybe_unused int
e876f0b69dc993 Christophe Leroy   2020-02-07  391  __cvdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
e876f0b69dc993 Christophe Leroy   2020-02-07  392  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  393  	return __cvdso_gettimeofday_data(__arch_get_vdso_u_time_data(), tv, tz);
e876f0b69dc993 Christophe Leroy   2020-02-07  394  }
e876f0b69dc993 Christophe Leroy   2020-02-07  395  
00b26474c2f161 Vincenzo Frascino  2019-06-21  396  #ifdef VDSO_HAS_TIME
e876f0b69dc993 Christophe Leroy   2020-02-07  397  static __maybe_unused __kernel_old_time_t
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  398  __cvdso_time_data(const struct vdso_time_data *vd, __kernel_old_time_t *time)
00b26474c2f161 Vincenzo Frascino  2019-06-21  399  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  400  	const struct vdso_clock *vc = vd->clock_data;
660fd04f931717 Thomas Gleixner    2019-11-12  401  	__kernel_old_time_t t;
660fd04f931717 Thomas Gleixner    2019-11-12  402  
2d6b01bd88ccab Thomas Gleixner    2020-02-07  403  	if (IS_ENABLED(CONFIG_TIME_NS) &&
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  404  	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS) {
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  405  		vd = __arch_get_vdso_u_timens_data(vd);
886653e3663917 Anna-Maria Behnsen 2025-03-03  406  		vc = vd->clock_data;
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  407  	}
660fd04f931717 Thomas Gleixner    2019-11-12  408  
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  409  	t = READ_ONCE(vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
00b26474c2f161 Vincenzo Frascino  2019-06-21  410  
00b26474c2f161 Vincenzo Frascino  2019-06-21  411  	if (time)
00b26474c2f161 Vincenzo Frascino  2019-06-21  412  		*time = t;
00b26474c2f161 Vincenzo Frascino  2019-06-21  413  
00b26474c2f161 Vincenzo Frascino  2019-06-21  414  	return t;
00b26474c2f161 Vincenzo Frascino  2019-06-21  415  }
e876f0b69dc993 Christophe Leroy   2020-02-07  416  
e876f0b69dc993 Christophe Leroy   2020-02-07  417  static __maybe_unused __kernel_old_time_t __cvdso_time(__kernel_old_time_t *time)
e876f0b69dc993 Christophe Leroy   2020-02-07  418  {
df7fcbefa71090 Thomas Weiﬂschuh   2025-02-04  419  	return __cvdso_time_data(__arch_get_vdso_u_time_data(), time);
e876f0b69dc993 Christophe Leroy   2020-02-07  420  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  421  #endif /* VDSO_HAS_TIME */
00b26474c2f161 Vincenzo Frascino  2019-06-21  422  
00b26474c2f161 Vincenzo Frascino  2019-06-21  423  #ifdef VDSO_HAS_CLOCK_GETRES
00b26474c2f161 Vincenzo Frascino  2019-06-21  424  static __maybe_unused
34f888e3405ace Thomas Weiﬂschuh   2025-07-01  425  bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  426  				 struct __kernel_timespec *res)
00b26474c2f161 Vincenzo Frascino  2019-06-21  427  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  428  	const struct vdso_clock *vc = vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  429  	u32 msk;
502a590a170b3b Thomas Gleixner    2019-07-28  430  	u64 ns;
00b26474c2f161 Vincenzo Frascino  2019-06-21  431  
1a1cd5fe881fdf Thomas Weiﬂschuh   2025-07-01  432  	if (!vdso_clockid_valid(clock))
34f888e3405ace Thomas Weiﬂschuh   2025-07-01  433  		return false;
00b26474c2f161 Vincenzo Frascino  2019-06-21  434  
2d6b01bd88ccab Thomas Gleixner    2020-02-07  435  	if (IS_ENABLED(CONFIG_TIME_NS) &&
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  436  	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  437  		vd = __arch_get_vdso_u_timens_data(vd);
660fd04f931717 Thomas Gleixner    2019-11-12  438  
00b26474c2f161 Vincenzo Frascino  2019-06-21  439  	/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  440  	 * Convert the clockid to a bitmask and use it to check which
00b26474c2f161 Vincenzo Frascino  2019-06-21  441  	 * clocks are handled in the VDSO directly.
00b26474c2f161 Vincenzo Frascino  2019-06-21  442  	 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  443  	msk = 1U << clock;
cdb7c5a9c897ab Christophe Leroy   2019-12-23  444  	if (msk & (VDSO_HRES | VDSO_RAW)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  445  		/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  446  		 * Preserves the behaviour of posix_get_hrtimer_res().
00b26474c2f161 Vincenzo Frascino  2019-06-21  447  		 */
886653e3663917 Anna-Maria Behnsen 2025-03-03  448  		ns = READ_ONCE(vd->hrtimer_res);
00b26474c2f161 Vincenzo Frascino  2019-06-21  449  	} else if (msk & VDSO_COARSE) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  450  		/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  451  		 * Preserves the behaviour of posix_get_coarse_res().
00b26474c2f161 Vincenzo Frascino  2019-06-21  452  		 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  453  		ns = LOW_RES_NSEC;
cd3557a7618bf5 Thomas Weiﬂschuh   2025-07-01 @454  	} else if (msk & VDSO_AUX) {
cd3557a7618bf5 Thomas Weiﬂschuh   2025-07-01  455  		ns = aux_clock_resolution_ns();
00b26474c2f161 Vincenzo Frascino  2019-06-21  456  	} else {
34f888e3405ace Thomas Weiﬂschuh   2025-07-01  457  		return false;
00b26474c2f161 Vincenzo Frascino  2019-06-21  458  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  459  
1638b8f096ca16 Thomas Gleixner    2019-10-21  460  	if (likely(res)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  461  		res->tv_sec = 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  462  		res->tv_nsec = ns;
1638b8f096ca16 Thomas Gleixner    2019-10-21  463  	}
34f888e3405ace Thomas Weiﬂschuh   2025-07-01  464  	return true;
502a590a170b3b Thomas Gleixner    2019-07-28  465  }
502a590a170b3b Thomas Gleixner    2019-07-28  466  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
