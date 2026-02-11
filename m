Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956A5353EEE
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770808229; cv=none; b=D/n3GlbJ9T6yCA6Ed7YMMlrteNEzfX79ermUKo10g4z8C2JwFeVBjG2PU1HVjyWDg+02bI5bsr0D6wXXFCJfnS0uF2pid1YvOMADZnOiA0fGm+G7Wap13HVSsbP1ziJSlHf90ji7dvsIAjXPyKdc5UKBD5Rlc7+EyQQ+VQHdebw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770808229; c=relaxed/simple;
	bh=jUpPTCu/zCyQTeLM4bGAK0CVJvaB7IaGeBPW518FqS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=C6OLa4vLeW2bA9HwXfAXxkadF6/NypBvdWKK+a7LzdWCkB1dZ+4SPmbLOCvOBzOsu9Be/cZPifktCtJlDniL4YfDV3Ub/JqkMOY19tQiuKU+5XZ8x0ha2rqQ69cISfQ31BdPDp+aVHQr2NfTsVLZc+4QISw2xV38vtH/WseEKoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kONmI9qH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kONmI9qH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770808228; x=1802344228;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jUpPTCu/zCyQTeLM4bGAK0CVJvaB7IaGeBPW518FqS0=;
  b=kONmI9qH8AWKc1LZowmVNJbqeiuWPENTIHulV2iWr2tB1REEMB5qlK/w
   x/K7WJFjSDLEAI7rj3hNnX86YsJrQxDw3shi4STvAxbyz0CmfjuGCeNFH
   r6zFGjxyKgopbQTWG8ak51rjXbwlKMF9XlbdY31PZUMJZImiYB48isFev
   aQVHfMenFpcn+bg+Wk9VIrqu5aHvc7/+0nYR2lkDHp4vtZEuk2Z9W9gBO
   EDzyh0vO2OSK1TYFoaLUcDkIDvnThxyWC+3LtLkI/o4ueWiNtiSX1Ahet
   2ubQ7ZdD6fFVmu3LEeWY1ULUTSLphpPrNt4sVeTy2pi+4O5hWMWxJVuhL
   w==;
X-CSE-ConnectionGUID: iiXygh0jQge6+6Jc1uPHpg==
X-CSE-MsgGUID: LNS/dMXeS2WFRD0o77/ttg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71995964"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71995964"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 03:10:27 -0800
X-CSE-ConnectionGUID: SZ2I7vtTSayQ/TDjxotp0g==
X-CSE-MsgGUID: ugjbL8f2TrWVoAasU4GeKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216725719"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2026 03:10:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq86x-00000000pvc-1UXt;
	Wed, 11 Feb 2026 11:10:23 +0000
Date: Wed, 11 Feb 2026 19:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: 
 arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:308
 __cvdso_clock_gettime_common() warn: right shifting more than type allows 32
 vs 40
Message-ID: <202602111941.PIhubgrb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "H. Peter Anvin" <hpa@zytor.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   192c0159402e6bfbe13de6f8379546943297783d
commit: 693c819fedcdcabfda7488e2d5e355a84c2fd1b0 x86/entry/vdso: Refactor t=
he vdso build
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20260210 (https://download.01.org/0day-ci/arc=
hive/20260211/202602111941.PIhubgrb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602111941.PIhubgrb-lkp@intel.com/

smatch warnings:
arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:308 __cvdso_clock=
_gettime_common() warn: right shifting more than type allows 32 vs 40
arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:308 __cvdso_clock=
_gettime_common() warn: bitwise AND condition is false here
arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:454 __cvdso_clock=
_getres_common() warn: right shifting more than type allows 32 vs 40
arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:454 __cvdso_clock=
_getres_common() warn: bitwise AND condition is false here

vim +308 arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c

cd3557a7618bf5 Thomas Wei=C3=9Fschuh   2025-07-01  286 =20
fb61bdb27fd730 Thomas Wei=C3=9Fschuh   2025-07-01  287  static __always_inl=
ine bool
ac1a42f4e4e296 Thomas Wei=C3=9Fschuh   2025-02-04  288  __cvdso_clock_getti=
me_common(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  289  			     struct __kernel_=
timespec *ts)
00b26474c2f161 Vincenzo Frascino  2019-06-21  290  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  291  	const struct vdso_clock=
 *vc =3D vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  292  	u32 msk;
00b26474c2f161 Vincenzo Frascino  2019-06-21  293 =20
1a1cd5fe881fdf Thomas Wei=C3=9Fschuh   2025-07-01  294  	if (!vdso_clockid_=
valid(clock))
fb61bdb27fd730 Thomas Wei=C3=9Fschuh   2025-07-01  295  		return false;
00b26474c2f161 Vincenzo Frascino  2019-06-21  296 =20
00b26474c2f161 Vincenzo Frascino  2019-06-21  297  	/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  298  	 * Convert the clockid =
to a bitmask and use it to check which
00b26474c2f161 Vincenzo Frascino  2019-06-21  299  	 * clocks are handled i=
n the VDSO directly.
00b26474c2f161 Vincenzo Frascino  2019-06-21  300  	 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  301  	msk =3D 1U << clock;
8463cf80529d0f Christophe Leroy   2019-12-23  302  	if (likely(msk & VDSO_H=
RES))
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  303  		vc =3D &vc[CS_HRES_COA=
RSE];
8463cf80529d0f Christophe Leroy   2019-12-23  304  	else if (msk & VDSO_COA=
RSE)
70067ae181f302 Anna-Maria Behnsen 2025-03-03  305  		return do_coarse(vd, &=
vc[CS_HRES_COARSE], clock, ts);
8463cf80529d0f Christophe Leroy   2019-12-23  306  	else if (msk & VDSO_RAW)
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  307  		vc =3D &vc[CS_RAW];
cd3557a7618bf5 Thomas Wei=C3=9Fschuh   2025-07-01 @308  	else if (msk & VDS=
O_AUX)
cd3557a7618bf5 Thomas Wei=C3=9Fschuh   2025-07-01  309  		return do_aux(vd,=
 clock, ts);
c966533f8c6c45 Andrei Vagin       2019-11-12  310  	else
fb61bdb27fd730 Thomas Wei=C3=9Fschuh   2025-07-01  311  		return false;
c966533f8c6c45 Andrei Vagin       2019-11-12  312 =20
64c3613ce31a1a Anna-Maria Behnsen 2025-03-03  313  	return do_hres(vd, vc, =
clock, ts);
502a590a170b3b Thomas Gleixner    2019-07-28  314  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  315 =20
502a590a170b3b Thomas Gleixner    2019-07-28  316  static __maybe_unused int
ac1a42f4e4e296 Thomas Wei=C3=9Fschuh   2025-02-04  317  __cvdso_clock_getti=
me_data(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  318  			   struct __kernel_ti=
mespec *ts)
502a590a170b3b Thomas Gleixner    2019-07-28  319  {
fb61bdb27fd730 Thomas Wei=C3=9Fschuh   2025-07-01  320  	bool ok;
502a590a170b3b Thomas Gleixner    2019-07-28  321 =20
fb61bdb27fd730 Thomas Wei=C3=9Fschuh   2025-07-01  322  	ok =3D __cvdso_clo=
ck_gettime_common(vd, clock, ts);
fb61bdb27fd730 Thomas Wei=C3=9Fschuh   2025-07-01  323 =20
fb61bdb27fd730 Thomas Wei=C3=9Fschuh   2025-07-01  324  	if (unlikely(!ok))
00b26474c2f161 Vincenzo Frascino  2019-06-21  325  		return clock_gettime_f=
allback(clock, ts);
502a590a170b3b Thomas Gleixner    2019-07-28  326  	return 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  327  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  328 =20
e876f0b69dc993 Christophe Leroy   2020-02-07  329  static __maybe_unused int
e876f0b69dc993 Christophe Leroy   2020-02-07  330  __cvdso_clock_gettime(cl=
ockid_t clock, struct __kernel_timespec *ts)
e876f0b69dc993 Christophe Leroy   2020-02-07  331  {
df7fcbefa71090 Thomas Wei=C3=9Fschuh   2025-02-04  332  	return __cvdso_clo=
ck_gettime_data(__arch_get_vdso_u_time_data(), clock, ts);
e876f0b69dc993 Christophe Leroy   2020-02-07  333  }
e876f0b69dc993 Christophe Leroy   2020-02-07  334 =20
bf279849ad5953 Vincenzo Frascino  2019-08-30  335  #ifdef BUILD_VDSO32
00b26474c2f161 Vincenzo Frascino  2019-06-21  336  static __maybe_unused int
ac1a42f4e4e296 Thomas Wei=C3=9Fschuh   2025-02-04  337  __cvdso_clock_getti=
me32_data(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  338  			     struct old_times=
pec32 *res)
00b26474c2f161 Vincenzo Frascino  2019-06-21  339  {
00b26474c2f161 Vincenzo Frascino  2019-06-21  340  	struct __kernel_timespe=
c ts;
fb61bdb27fd730 Thomas Wei=C3=9Fschuh   2025-07-01  341  	bool ok;
00b26474c2f161 Vincenzo Frascino  2019-06-21  342 =20
fb61bdb27fd730 Thomas Wei=C3=9Fschuh   2025-07-01  343  	ok =3D __cvdso_clo=
ck_gettime_common(vd, clock, &ts);
00b26474c2f161 Vincenzo Frascino  2019-06-21  344 =20
fb61bdb27fd730 Thomas Wei=C3=9Fschuh   2025-07-01  345  	if (unlikely(!ok))
c60a32ea4f459f Thomas Gleixner    2019-07-30  346  		return clock_gettime32=
_fallback(clock, res);
502a590a170b3b Thomas Gleixner    2019-07-28  347 =20
fb61bdb27fd730 Thomas Wei=C3=9Fschuh   2025-07-01  348  	/* For ok =3D=3D t=
rue */
00b26474c2f161 Vincenzo Frascino  2019-06-21  349  	res->tv_sec =3D ts.tv_s=
ec;
00b26474c2f161 Vincenzo Frascino  2019-06-21  350  	res->tv_nsec =3D ts.tv_=
nsec;
a279235ddbe975 Vincenzo Frascino  2019-08-30  351 =20
fb61bdb27fd730 Thomas Wei=C3=9Fschuh   2025-07-01  352  	return 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  353  }
e876f0b69dc993 Christophe Leroy   2020-02-07  354 =20
e876f0b69dc993 Christophe Leroy   2020-02-07  355  static __maybe_unused int
e876f0b69dc993 Christophe Leroy   2020-02-07  356  __cvdso_clock_gettime32(=
clockid_t clock, struct old_timespec32 *res)
e876f0b69dc993 Christophe Leroy   2020-02-07  357  {
df7fcbefa71090 Thomas Wei=C3=9Fschuh   2025-02-04  358  	return __cvdso_clo=
ck_gettime32_data(__arch_get_vdso_u_time_data(), clock, res);
e876f0b69dc993 Christophe Leroy   2020-02-07  359  }
bf279849ad5953 Vincenzo Frascino  2019-08-30  360  #endif /* BUILD_VDSO32 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  361 =20
00b26474c2f161 Vincenzo Frascino  2019-06-21  362  static __maybe_unused int
ac1a42f4e4e296 Thomas Wei=C3=9Fschuh   2025-02-04  363  __cvdso_gettimeofda=
y_data(const struct vdso_time_data *vd,
e876f0b69dc993 Christophe Leroy   2020-02-07  364  			  struct __kernel_old=
_timeval *tv, struct timezone *tz)
00b26474c2f161 Vincenzo Frascino  2019-06-21  365  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  366  	const struct vdso_clock=
 *vc =3D vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  367 =20
00b26474c2f161 Vincenzo Frascino  2019-06-21  368  	if (likely(tv !=3D NULL=
)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  369  		struct __kernel_timesp=
ec ts;
00b26474c2f161 Vincenzo Frascino  2019-06-21  370 =20
fb61bdb27fd730 Thomas Wei=C3=9Fschuh   2025-07-01  371  		if (!do_hres(vd, =
&vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
00b26474c2f161 Vincenzo Frascino  2019-06-21  372  			return gettimeofday_f=
allback(tv, tz);
00b26474c2f161 Vincenzo Frascino  2019-06-21  373 =20
00b26474c2f161 Vincenzo Frascino  2019-06-21  374  		tv->tv_sec =3D ts.tv_s=
ec;
00b26474c2f161 Vincenzo Frascino  2019-06-21  375  		tv->tv_usec =3D (u32)t=
s.tv_nsec / NSEC_PER_USEC;
00b26474c2f161 Vincenzo Frascino  2019-06-21  376  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  377 =20
00b26474c2f161 Vincenzo Frascino  2019-06-21  378  	if (unlikely(tz !=3D NU=
LL)) {
660fd04f931717 Thomas Gleixner    2019-11-12  379  		if (IS_ENABLED(CONFIG_=
TIME_NS) &&
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  380  		    vc->clock_mode =3D=
=3D VDSO_CLOCKMODE_TIMENS)
ac1a42f4e4e296 Thomas Wei=C3=9Fschuh   2025-02-04  381  			vd =3D __arch_ge=
t_vdso_u_timens_data(vd);
660fd04f931717 Thomas Gleixner    2019-11-12  382 =20
00b26474c2f161 Vincenzo Frascino  2019-06-21  383  		tz->tz_minuteswest =3D =
vd[CS_HRES_COARSE].tz_minuteswest;
00b26474c2f161 Vincenzo Frascino  2019-06-21  384  		tz->tz_dsttime =3D vd[=
CS_HRES_COARSE].tz_dsttime;
00b26474c2f161 Vincenzo Frascino  2019-06-21  385  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  386 =20
00b26474c2f161 Vincenzo Frascino  2019-06-21  387  	return 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  388  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  389 =20
e876f0b69dc993 Christophe Leroy   2020-02-07  390  static __maybe_unused int
e876f0b69dc993 Christophe Leroy   2020-02-07  391  __cvdso_gettimeofday(str=
uct __kernel_old_timeval *tv, struct timezone *tz)
e876f0b69dc993 Christophe Leroy   2020-02-07  392  {
df7fcbefa71090 Thomas Wei=C3=9Fschuh   2025-02-04  393  	return __cvdso_get=
timeofday_data(__arch_get_vdso_u_time_data(), tv, tz);
e876f0b69dc993 Christophe Leroy   2020-02-07  394  }
e876f0b69dc993 Christophe Leroy   2020-02-07  395 =20
00b26474c2f161 Vincenzo Frascino  2019-06-21  396  #ifdef VDSO_HAS_TIME
e876f0b69dc993 Christophe Leroy   2020-02-07  397  static __maybe_unused __=
kernel_old_time_t
ac1a42f4e4e296 Thomas Wei=C3=9Fschuh   2025-02-04  398  __cvdso_time_data(c=
onst struct vdso_time_data *vd, __kernel_old_time_t *time)
00b26474c2f161 Vincenzo Frascino  2019-06-21  399  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  400  	const struct vdso_clock=
 *vc =3D vd->clock_data;
660fd04f931717 Thomas Gleixner    2019-11-12  401  	__kernel_old_time_t t;
660fd04f931717 Thomas Gleixner    2019-11-12  402 =20
2d6b01bd88ccab Thomas Gleixner    2020-02-07  403  	if (IS_ENABLED(CONFIG_T=
IME_NS) &&
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  404  	    vc->clock_mode =3D=
=3D VDSO_CLOCKMODE_TIMENS) {
ac1a42f4e4e296 Thomas Wei=C3=9Fschuh   2025-02-04  405  		vd =3D __arch_get=
_vdso_u_timens_data(vd);
886653e3663917 Anna-Maria Behnsen 2025-03-03  406  		vc =3D vd->clock_data;
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  407  	}
660fd04f931717 Thomas Gleixner    2019-11-12  408 =20
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  409  	t =3D READ_ONCE(vc[CS_H=
RES_COARSE].basetime[CLOCK_REALTIME].sec);
00b26474c2f161 Vincenzo Frascino  2019-06-21  410 =20
00b26474c2f161 Vincenzo Frascino  2019-06-21  411  	if (time)
00b26474c2f161 Vincenzo Frascino  2019-06-21  412  		*time =3D t;
00b26474c2f161 Vincenzo Frascino  2019-06-21  413 =20
00b26474c2f161 Vincenzo Frascino  2019-06-21  414  	return t;
00b26474c2f161 Vincenzo Frascino  2019-06-21  415  }
e876f0b69dc993 Christophe Leroy   2020-02-07  416 =20
e876f0b69dc993 Christophe Leroy   2020-02-07  417  static __maybe_unused __=
kernel_old_time_t __cvdso_time(__kernel_old_time_t *time)
e876f0b69dc993 Christophe Leroy   2020-02-07  418  {
df7fcbefa71090 Thomas Wei=C3=9Fschuh   2025-02-04  419  	return __cvdso_tim=
e_data(__arch_get_vdso_u_time_data(), time);
e876f0b69dc993 Christophe Leroy   2020-02-07  420  }
00b26474c2f161 Vincenzo Frascino  2019-06-21  421  #endif /* VDSO_HAS_TIME =
*/
00b26474c2f161 Vincenzo Frascino  2019-06-21  422 =20
00b26474c2f161 Vincenzo Frascino  2019-06-21  423  #ifdef VDSO_HAS_CLOCK_GE=
TRES
00b26474c2f161 Vincenzo Frascino  2019-06-21  424  static __maybe_unused
34f888e3405ace Thomas Wei=C3=9Fschuh   2025-07-01  425  bool __cvdso_clock_=
getres_common(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy   2020-02-07  426  				 struct __kernel_tim=
espec *res)
00b26474c2f161 Vincenzo Frascino  2019-06-21  427  {
886653e3663917 Anna-Maria Behnsen 2025-03-03  428  	const struct vdso_clock=
 *vc =3D vd->clock_data;
00b26474c2f161 Vincenzo Frascino  2019-06-21  429  	u32 msk;
502a590a170b3b Thomas Gleixner    2019-07-28  430  	u64 ns;
00b26474c2f161 Vincenzo Frascino  2019-06-21  431 =20
1a1cd5fe881fdf Thomas Wei=C3=9Fschuh   2025-07-01  432  	if (!vdso_clockid_=
valid(clock))
34f888e3405ace Thomas Wei=C3=9Fschuh   2025-07-01  433  		return false;
00b26474c2f161 Vincenzo Frascino  2019-06-21  434 =20
2d6b01bd88ccab Thomas Gleixner    2020-02-07  435  	if (IS_ENABLED(CONFIG_T=
IME_NS) &&
cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  436  	    vc->clock_mode =3D=
=3D VDSO_CLOCKMODE_TIMENS)
ac1a42f4e4e296 Thomas Wei=C3=9Fschuh   2025-02-04  437  		vd =3D __arch_get=
_vdso_u_timens_data(vd);
660fd04f931717 Thomas Gleixner    2019-11-12  438 =20
00b26474c2f161 Vincenzo Frascino  2019-06-21  439  	/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  440  	 * Convert the clockid =
to a bitmask and use it to check which
00b26474c2f161 Vincenzo Frascino  2019-06-21  441  	 * clocks are handled i=
n the VDSO directly.
00b26474c2f161 Vincenzo Frascino  2019-06-21  442  	 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  443  	msk =3D 1U << clock;
cdb7c5a9c897ab Christophe Leroy   2019-12-23  444  	if (msk & (VDSO_HRES | =
VDSO_RAW)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  445  		/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  446  		 * Preserves the behav=
iour of posix_get_hrtimer_res().
00b26474c2f161 Vincenzo Frascino  2019-06-21  447  		 */
886653e3663917 Anna-Maria Behnsen 2025-03-03  448  		ns =3D READ_ONCE(vd->h=
rtimer_res);
00b26474c2f161 Vincenzo Frascino  2019-06-21  449  	} else if (msk & VDSO_C=
OARSE) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  450  		/*
00b26474c2f161 Vincenzo Frascino  2019-06-21  451  		 * Preserves the behav=
iour of posix_get_coarse_res().
00b26474c2f161 Vincenzo Frascino  2019-06-21  452  		 */
00b26474c2f161 Vincenzo Frascino  2019-06-21  453  		ns =3D LOW_RES_NSEC;
cd3557a7618bf5 Thomas Wei=C3=9Fschuh   2025-07-01 @454  	} else if (msk & V=
DSO_AUX) {
cd3557a7618bf5 Thomas Wei=C3=9Fschuh   2025-07-01  455  		ns =3D aux_clock_=
resolution_ns();
00b26474c2f161 Vincenzo Frascino  2019-06-21  456  	} else {
34f888e3405ace Thomas Wei=C3=9Fschuh   2025-07-01  457  		return false;
00b26474c2f161 Vincenzo Frascino  2019-06-21  458  	}
00b26474c2f161 Vincenzo Frascino  2019-06-21  459 =20
1638b8f096ca16 Thomas Gleixner    2019-10-21  460  	if (likely(res)) {
00b26474c2f161 Vincenzo Frascino  2019-06-21  461  		res->tv_sec =3D 0;
00b26474c2f161 Vincenzo Frascino  2019-06-21  462  		res->tv_nsec =3D ns;
1638b8f096ca16 Thomas Gleixner    2019-10-21  463  	}
34f888e3405ace Thomas Wei=C3=9Fschuh   2025-07-01  464  	return true;
502a590a170b3b Thomas Gleixner    2019-07-28  465  }
502a590a170b3b Thomas Gleixner    2019-07-28  466 =20

:::::: The code at line 308 was first introduced by commit
:::::: cd3557a7618bf5c1935e9f66b58a329f1f1f4b27 vdso/gettimeofday: Add supp=
ort for auxiliary clocks

:::::: TO: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
