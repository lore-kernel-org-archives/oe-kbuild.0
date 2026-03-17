Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74AC3C1404
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Mar 2026 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750299; cv=none; b=s4h8EsCpPe8FvNMj9Y5N3gtuTDflhUKEX2Y8ohjXYW55UNOV0GKuypJ2GctqNsp/WUVmU2/r5EjAgF+pxGDi8UdQDnwlVi5stKuJs/9aonOMy37vncyDYZ583Xu6qQjVBaB/tMcrscsIeZjwJ4+BiCx4OMziCwcTd4dHnursg60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750299; c=relaxed/simple;
	bh=pBbX8ihhy2RzMN68UmotufDY1iKR/R5FJjUblRqyL6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PY83N2yTcEVsUAy9COt/C6NheoYDB9s5zgLQIIzB2xxDow6dI3W65JfdRwQRgb4Aoe+Dx0nM0FvP+xXTueg/3XIh5W8OdKn78gcdbIbcw2vikMV1jzb13DJIskdLnINIrZPcWEibLHJwb6AR6+32BcoB67VywqXNX/qExKH6Tyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhiNaIIw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhiNaIIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773750298; x=1805286298;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pBbX8ihhy2RzMN68UmotufDY1iKR/R5FJjUblRqyL6U=;
  b=XhiNaIIwQgSOQxwSSnKwyEiYlxTYZUCPlj7asWxotTxCou3HGosOPyLT
   97I+m+Ck7r32Wa1+ByyI0wA+F8wsla7+hkPPnovTt14NHKmZoRjBR1ML+
   +0Cq63jemD8ybvzb9vKsWESF/NdRTZt3mb21LEZLe/3QbAH0j5ZdpXUl0
   P3qFgoFJWw6p3GBKwkZWYCmDVTRCKwNSJs4OvH9FzYlrAHeAFGYY2NLtC
   jL463CTW/rmsgSEVJUXq4ydZrB+INA6XHRIl+2SESLo5DrXbpk8HaVsqE
   kNoXkXrNmrbfUeU+zVnu1Oxvh+kJkoqxkSsezRZC01Tl1fYAN59Vh46w0
   w==;
X-CSE-ConnectionGUID: eL1nUlIqSu+OoSU6gb+pXQ==
X-CSE-MsgGUID: VJc9ZD0NRSGAzmkm312nSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="86253195"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="86253195"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 05:24:58 -0700
X-CSE-ConnectionGUID: hCQYLsivQgemX9XvG7xYUw==
X-CSE-MsgGUID: hMjWttFNQTKRwhisCjjQsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="218400769"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Mar 2026 05:24:55 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2TTh-000000000Nd-2vgC;
	Tue, 17 Mar 2026 12:24:53 +0000
Date: Tue, 17 Mar 2026 20:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [thomas-weissschuh:b4/vdso-sparc64-generic-2 14/18]
 arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:308
 __cvdso_clock_gettime_common() warn: right shifting more than type allows 32
 vs 40
Message-ID: <202603172022.jq46QPxs-lkp@intel.com>
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
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
CC: Andreas Larsson <andreas@gaisler.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-sparc64-generic-2
head:   7788f7db2b88493f82543de3af21b5d3d223e0be
commit: d4213968af488196812955000970232d27badf00 [14/18] sparc64: vdso: Swi=
tch to the generic vDSO library
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: sparc-randconfig-r071-20260317 (https://download.01.org/0day-ci/arc=
hive/20260317/202603172022.jq46QPxs-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603172022.jq46QPxs-lkp@intel.com/

smatch warnings:
arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:308 __cvdso_clo=
ck_gettime_common() warn: right shifting more than type allows 32 vs 40
arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:308 __cvdso_clo=
ck_gettime_common() warn: bitwise AND condition is false here

vim +308 arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c

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

:::::: The code at line 308 was first introduced by commit
:::::: cd3557a7618bf5c1935e9f66b58a329f1f1f4b27 vdso/gettimeofday: Add supp=
ort for auxiliary clocks

:::::: TO: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
