Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85D231578B;
	Wed, 11 Feb 2026 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770812949; cv=none; b=bKdkEQLfHlzU8P/7ZyJ7CX0+OfA9ViMg5EX+Iv8MvnJHVvOdqwu9IBGy5701rwd3IEQjAxSKwmgZe9py+FDAYC3Ya5B8fHHjL06Vq9s14q5sSvhHB5fF6pLfWSTS6xmq2D6ftXd8WWJ2iZBGTPSwWkU6QHr7vH7zPn6kVFDadNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770812949; c=relaxed/simple;
	bh=G9xtJUjfAmAX5OA0nxs5ezcv9Y+NPB6FNsxNmgDqCtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIWk4aTRf2t6GINa6m0pzYgggbQjSiWkr3+jiYNCUy0ewpeg43fDsO7G7sn1lF1Oj5QTh4Px1b03JyO9vDZNHWcBzlui9dFke8c03LZsQqkiHksvJjo+XtyG6AeoCbc3pFN7CczbLgHbWPwvrdAxYD/6qp42JrukywiLesnYwcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EULENZpZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+YQYed+P; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EULENZpZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+YQYed+P"
Date: Wed, 11 Feb 2026 13:29:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770812946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aDAkxtoSZsIDCBfmD5kx/lbms/p5QrZ0qzUxOUkwiMs=;
	b=EULENZpZo+RmXujrHH820kuxPMRLfKSLem1jC91M08G3J0RyRxzPtIGT6jbabPLRmBhJsW
	lRqMlgewkcQM2TSfGTUXyxtlnzbvzUb5pE9gkTP7lhKdlnQbsIGSB+nlt3wdECoEkQDJuw
	3S8n/e/VnXyyKvvVBy785TvULHmb6ZHmpE2ks352k09EdTDDSXBljT0BLKJqUwEb5ZZtYx
	hs+B/Cdey6pFyrSFcRWHupL5C2edhKo3f4vZZtFZJuyeu871oF0fQjLhv1M1zZlGt9zNvo
	ckTkvF47W0CfS6cqeicjYGi/4BlRFdKkdfPDVDUdmB5juPjvmNEFQtSfTAV95w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770812946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aDAkxtoSZsIDCBfmD5kx/lbms/p5QrZ0qzUxOUkwiMs=;
	b=+YQYed+P9I9ui/FU9+9w0nBvpte55RZXUoPxuT9KGuGe3EqrkvZ0dd81/iEjeJuGRx6ND7
	4PczbVsN9CP23yDQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, "H. Peter Anvin" <hpa@zytor.com>, 
	lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:308
 __cvdso_clock_gettime_common() warn: right shifting more than type allows 32
 vs 40
Message-ID: <20260211132457-1519ef21-1087-45df-905f-e58575bf43e5@linutronix.de>
References: <202602111941.PIhubgrb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202602111941.PIhubgrb-lkp@intel.com>

On Wed, Feb 11, 2026 at 03:13:34PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   192c0159402e6bfbe13de6f8379546943297783d
> commit: 693c819fedcdcabfda7488e2d5e355a84c2fd1b0 x86/entry/vdso: Refactor the vdso build
> config: x86_64-randconfig-161-20260210 (https://download.01.org/0day-ci/archive/20260211/202602111941.PIhubgrb-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> smatch version: v0.5.0-8994-gd50c5a4c
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202602111941.PIhubgrb-lkp@intel.com/
> 
> smatch warnings:
> arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:308 __cvdso_clock_gettime_common() warn: right shifting more than type allows 32 vs 40
> arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:308 __cvdso_clock_gettime_common() warn: bitwise AND condition is false here
> arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:454 __cvdso_clock_getres_common() warn: right shifting more than type allows 32 vs 40
> arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:454 __cvdso_clock_getres_common() warn: bitwise AND condition is false here

Thanks for the report!

> vim +308 arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c
> 
> fb61bdb27fd730 Thomas Weißschuh   2025-07-01  287  static __always_inline bool
> ac1a42f4e4e296 Thomas Weißschuh   2025-02-04  288  __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
> e876f0b69dc993 Christophe Leroy   2020-02-07  289  			     struct __kernel_timespec *ts)
> 00b26474c2f161 Vincenzo Frascino  2019-06-21  290  {
> 886653e3663917 Anna-Maria Behnsen 2025-03-03  291  	const struct vdso_clock *vc = vd->clock_data;
> 00b26474c2f161 Vincenzo Frascino  2019-06-21  292  	u32 msk;
> 00b26474c2f161 Vincenzo Frascino  2019-06-21  293  
> 1a1cd5fe881fdf Thomas Weißschuh   2025-07-01  294  	if (!vdso_clockid_valid(clock))
> fb61bdb27fd730 Thomas Weißschuh   2025-07-01  295  		return false;
> 00b26474c2f161 Vincenzo Frascino  2019-06-21  296  
> 00b26474c2f161 Vincenzo Frascino  2019-06-21  297  	/*
> 00b26474c2f161 Vincenzo Frascino  2019-06-21  298  	 * Convert the clockid to a bitmask and use it to check which
> 00b26474c2f161 Vincenzo Frascino  2019-06-21  299  	 * clocks are handled in the VDSO directly.
> 00b26474c2f161 Vincenzo Frascino  2019-06-21  300  	 */
> 00b26474c2f161 Vincenzo Frascino  2019-06-21  301  	msk = 1U << clock;
> 8463cf80529d0f Christophe Leroy   2019-12-23  302  	if (likely(msk & VDSO_HRES))
> cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  303  		vc = &vc[CS_HRES_COARSE];
> 8463cf80529d0f Christophe Leroy   2019-12-23  304  	else if (msk & VDSO_COARSE)
> 70067ae181f302 Anna-Maria Behnsen 2025-03-03  305  		return do_coarse(vd, &vc[CS_HRES_COARSE], clock, ts);
> 8463cf80529d0f Christophe Leroy   2019-12-23  306  	else if (msk & VDSO_RAW)
> cddb82d1c4de56 Anna-Maria Behnsen 2025-03-03  307  		vc = &vc[CS_RAW];
> cd3557a7618bf5 Thomas Weißschuh   2025-07-01 @308  	else if (msk & VDSO_AUX)
> 
> This code is built with -m32 when we build
> arch/x86/entry/vdso/vdso32/vclock_gettime.c so VDSO_AUX is zero
> and we never call do_aux().  Presumably that's intentional.  I
> don't know this code at all.

This is a false positive due to a mismatch between compiler and $(CHECK) flags.
We are working on a fix, see:
 * https://lore.kernel.org/lkml/20260116-vdso-compat-checkflags-v1-2-4a83b4fbb0d3@linutronix.de/
 * https://lore.kernel.org/lkml/20260117215542.342638347@kernel.org/

> cd3557a7618bf5 Thomas Weißschuh   2025-07-01  309  		return do_aux(vd, clock, ts);
> c966533f8c6c45 Andrei Vagin       2019-11-12  310  	else
> fb61bdb27fd730 Thomas Weißschuh   2025-07-01  311  		return false;
> c966533f8c6c45 Andrei Vagin       2019-11-12  312  
> 64c3613ce31a1a Anna-Maria Behnsen 2025-03-03  313  	return do_hres(vd, vc, clock, ts);
> 502a590a170b3b Thomas Gleixner    2019-07-28  314  }
> 
