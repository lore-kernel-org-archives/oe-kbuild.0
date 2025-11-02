Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D329534D3A0
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Nov 2025 13:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762090361; cv=none; b=ac8y86EVZePjgz8UerKnaO0YrzIYCkqOrtCHJgeMALtEwwUghq4LeFcqyFD4tf6EX4UTxejufZhCOmXe1oX6U99JLRynx3xv242k2kK0Vkm78axT35PAdnJ2S6t3FrW3uX1xlSgEYMAnIu8I4zDIQEh3ur3dhorVDFCPvO6Fjkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762090361; c=relaxed/simple;
	bh=F9wa/iI9qOZHZPpCBkFlb6v6tXEvsRqS+EB7RYCJy+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S+fH6HYCUxHrrnMuAxAbqS7UzfFOkm5qHBtOq+6d6A3jL7rEfyByK5f7Jh0MGkwK/pT/JbgSUXrWK+aSQp0yjAUmyZ7joXNwIVv05+n4KXql/a8sKs2JF5375y9LuOWWSwF4ntPNMeIZoBLdVTC55qY/4MTWf6wCrjqvda2KDrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFEOxmbc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFEOxmbc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762090360; x=1793626360;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=F9wa/iI9qOZHZPpCBkFlb6v6tXEvsRqS+EB7RYCJy+k=;
  b=CFEOxmbc3n9NJSXmzWf8OZO1XhjdnTu7sL3HJeYdDDIebHx8p1VksvRd
   TCR5OLUVntz1zIOeH4u9NDKGdqgNN12b4H6M2x8fbsKuyxre8M27fA5q6
   Z7L8R+ip0Jl6brsaqEjoXhctJh+7RV0OUeHu5HiglmwTBxS4ZPMaefzHu
   4k1gFKlm+8JdkKpbZkkTfKxRZbc4wAx10x1gdps8a6alvj+zWEcWYmMdY
   fqkDxhOPitqpA1Ela/u54U1bCJziJnjiMmIfgTh/temyAvwNWnxvqtiXn
   i5Flm+97LATv5FhGAXPG0Pj1giadvgsKYwfIRGH8G2otiVPWcK71J5Myu
   A==;
X-CSE-ConnectionGUID: W6SuN/rpTSK/YXTHlKC0/g==
X-CSE-MsgGUID: aTkgQ+/cRXyJWG4gS91v+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68025550"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68025550"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 05:32:39 -0800
X-CSE-ConnectionGUID: qa5hDvd4RTmOciSi3WCUrw==
X-CSE-MsgGUID: AuNYTQQITaOsb5rmTGL8dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="186798255"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Nov 2025 05:32:38 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFYC3-000PFK-1y;
	Sun, 02 Nov 2025 13:32:29 +0000
Date: Sun, 2 Nov 2025 21:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:timers/vdso 31/35]
 arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:325
 __cvdso_clock_gettime_common() warn: right shifting more than type allows 32
 vs 40
Message-ID: <202511022122.g0gsYxyW-lkp@intel.com>
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
CC: x86@kernel.org
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Andreas Larsson <andreas@gaisler.com>

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
head:   4c6736970fbf35aa65512ce7f82abd970f133c8e
commit: 4148173832b63f939080b00b3793045b4a7f2a50 [31/35] sparc64: vdso: Switch to the generic vDSO library
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: sparc64-randconfig-r072-20251102 (https://download.01.org/0day-ci/archive/20251102/202511022122.g0gsYxyW-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511022122.g0gsYxyW-lkp@intel.com/

smatch warnings:
arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:325 __cvdso_clock_gettime_common() warn: right shifting more than type allows 32 vs 40
arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:325 __cvdso_clock_gettime_common() warn: bitwise AND condition is false here

vim +325 arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c

cd3557a7618bf5 Thomas Weiﬂschuh   2025-07-01  303  
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  304  static __always_inline bool
ac1a42f4e4e296 Thomas Weiﬂschuh   2025-02-04  305  __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  306  			     struct __kernel_timespec *ts)
00b26474c2f161 Vincenzo Frascino  2019-06-21  307  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  308  	const struct vdso_clock *vc = vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  309  	u32 msk;
00b26474c2f161 Vincenzo Frascino  2019-06-21  310  
1a1cd5fe881fdf Thomas Weiﬂschuh   2025-07-01  311  	if (!vdso_clockid_valid(clock))
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  312  		return false;
00b26474c2f161 Vincenzo Frascino  2019-06-21  313  
00b26474c2f161 Vincenzo Frascino  2019-06-21  314  	/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  315  	 * Convert the clockid to a bitmask and use it to check which
00b26474c2f161 Vincenzo Frascino  2019-06-21  316  	 * clocks are handled in the VDSO directly.
00b26474c2f161 Vincenzo Frascino  2019-06-21  317  	 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  318  	msk = 1U << clock;
8463cf80529d0f Christophe Leroy   2019-12-23  319  	if (likely(msk & VDSO_HRES))
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  320  		vc = &vc[CS_HRES_COARSE];
8463cf80529d0f Christophe Leroy   2019-12-23  321  	else if (msk & VDSO_COARSE)
70067ae181f302 Anna-Maria Behnsen 2025-03-03  322  		return do_coarse(vd, &vc[CS_HRES_COARSE], clock, ts);
8463cf80529d0f Christophe Leroy   2019-12-23  323  	else if (msk & VDSO_RAW)
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  324  		vc = &vc[CS_RAW];
cd3557a7618bf5 Thomas Weiﬂschuh   2025-07-01 @325  	else if (msk & VDSO_AUX)
cd3557a7618bf5 Thomas Weiﬂschuh   2025-07-01  326  		return do_aux(vd, clock, ts);
c966533f8c6c45 Andrei Vagin       2019-11-12  327  	else
fb61bdb27fd730 Thomas Weiﬂschuh   2025-07-01  328  		return false;
c966533f8c6c45 Andrei Vagin       2019-11-12  329  
64c3613ce31a1a Anna-Maria Behnsen 2025-03-03  330  	return do_hres(vd, vc, clock, ts);
502a590a170b3b Thomas Gleixner    2019-07-28  331  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  332  

:::::: The code at line 325 was first introduced by commit
:::::: cd3557a7618bf5c1935e9f66b58a329f1f1f4b27 vdso/gettimeofday: Add support for auxiliary clocks

:::::: TO: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
