Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C11A42050
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Feb 2026 23:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771199832; cv=none; b=DbR1NjrYcEadRN+n8efu/8ZL7DpJnBgTD5nFnY/DSejNVGhImR99f1fzaV6kZ5FwuhFRPUSAL+UekpwPoAuLw64BJB67eFbKiCe2msEnVTO9Gmn0MUFsZBwOf42jabWBcJ86L0lAtm11r9qqmGxKcsMOhcz1DwppdS7r5hcFsTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771199832; c=relaxed/simple;
	bh=Q3tMzrfNfGRKH4V3Ddgz7BuHBBi9ri7L3rog9ow/UIg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FI7vheB7izSX+74OpWXIENZ0uc7mmK4bgHui2olQTHt4TMt4pObFJFOfiMWTJS2sNlR9pSJwpFdAL+czhwNdF5dopmyjnFhMKm8XGnQBFXVpWxBqxFS5m5RA0zoApq1prwhedjcbjfxFiXzikjEjnHlN/znAvDW7jL4BVrCETfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GbXXTBBg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GbXXTBBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771199831; x=1802735831;
  h=date:from:to:cc:subject:message-id;
  bh=Q3tMzrfNfGRKH4V3Ddgz7BuHBBi9ri7L3rog9ow/UIg=;
  b=GbXXTBBg7CgHdZuLrHTfUwWpELzzEuN2ieDxA9pqJlK1dMl/GsZ9wOpJ
   08InzJZBvuyMPlHX0aONwdloQbfBgRQnjrZ/qczqUbkLgQ8IdflddJW9x
   ZMbrj7yHFwqJHXgIoEm1NX5MrxmfvHLm9cFaei+QRZ0txpoX/OZkgBYJ+
   NNsZLxe7pxljcePP4rTkG9kFtLEG0s5z3zgU9reXvfPnUZ8dPFMdbdhOb
   lLQwjzCxbDNNJA+HAyVDiO/p4U8Ko82IQ2MuzlVF4vFuJSZEhWUnwo0K1
   DMXSpk3djAZhjhVSJnvGco3YTWaCTi0tZ07K26dihrIXBDcNVo791ItNw
   g==;
X-CSE-ConnectionGUID: SLQzzKJRTcm1A6dwo/V1XQ==
X-CSE-MsgGUID: rXDba6R4Tz+tG2lEPuRjaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71487368"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="71487368"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 15:57:11 -0800
X-CSE-ConnectionGUID: o5rgqnyqQiaOWIoLGyo6Fw==
X-CSE-MsgGUID: f/VIEnRKR5mWS0xhRiUwbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="212490071"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Feb 2026 15:57:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrlz9-00000000zG2-3FRg;
	Sun, 15 Feb 2026 23:57:07 +0000
Date: Mon, 16 Feb 2026 07:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/signal.c:196 __restore_cfiss_state() warn:
 maybe return -EFAULT instead of the bytes remaining?
Message-ID: <202602160730.QsdCT9Zp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Deepak Gupta <debug@rivosinc.com>
CC: Paul Walmsley <pjw@kernel.org>
CC: Andy Chiu <andy.chiu@sifive.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
commit: 66c9c713de597f9b40a319ebda4d3466ce2cdff0 riscv/signal: save and restore the shadow stack on a signal
date:   3 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-r073-20260216 (https://download.01.org/0day-ci/archive/20260216/202602160730.QsdCT9Zp-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602160730.QsdCT9Zp-lkp@intel.com/

New smatch warnings:
arch/riscv/kernel/signal.c:196 __restore_cfiss_state() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
arch/riscv/kernel/signal.c:52 restore_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:66 save_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:132 __restore_v_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:142 __restore_v_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:228 restore_sigcontext() warn: maybe return -EFAULT instead of the bytes remaining?

vim +196 arch/riscv/kernel/signal.c

66c9c713de597f Deepak Gupta 2026-01-25  173  
66c9c713de597f Deepak Gupta 2026-01-25  174  static long __restore_cfiss_state(struct pt_regs *regs, void __user *sc_cfi)
66c9c713de597f Deepak Gupta 2026-01-25  175  {
66c9c713de597f Deepak Gupta 2026-01-25  176  	struct __sc_riscv_cfi_state __user *state = sc_cfi;
66c9c713de597f Deepak Gupta 2026-01-25  177  	unsigned long ss_ptr = 0;
66c9c713de597f Deepak Gupta 2026-01-25  178  	long err;
66c9c713de597f Deepak Gupta 2026-01-25  179  
66c9c713de597f Deepak Gupta 2026-01-25  180  	/*
66c9c713de597f Deepak Gupta 2026-01-25  181  	 * Restore shadow stack as a form of token stored on the shadow stack itself as a safe
66c9c713de597f Deepak Gupta 2026-01-25  182  	 * way to restore.
66c9c713de597f Deepak Gupta 2026-01-25  183  	 * A token on the shadow stack gives the following properties:
66c9c713de597f Deepak Gupta 2026-01-25  184  	 * - Safe save and restore for shadow stack switching. Any save of shadow stack
66c9c713de597f Deepak Gupta 2026-01-25  185  	 *   must have saved a token on shadow stack. Similarly any restore of shadow
66c9c713de597f Deepak Gupta 2026-01-25  186  	 *   stack must check the token before restore. Since writing to a shadow stack with
66c9c713de597f Deepak Gupta 2026-01-25  187  	 *   the address of shadow stack itself is not easily allowed, a restore without a save
66c9c713de597f Deepak Gupta 2026-01-25  188  	 *   is quite difficult for an attacker to perform.
66c9c713de597f Deepak Gupta 2026-01-25  189  	 * - A natural break. A token in the shadow stack provides a natural break in shadow stack
66c9c713de597f Deepak Gupta 2026-01-25  190  	 *   So a single linear range can be bucketed into different shadow stack segments.
66c9c713de597f Deepak Gupta 2026-01-25  191  	 *   sspopchk will detect the condition and fault to kernel as a sw check exception.
66c9c713de597f Deepak Gupta 2026-01-25  192  	 */
66c9c713de597f Deepak Gupta 2026-01-25  193  	err = __copy_from_user(&ss_ptr, &state->ss_ptr, sizeof(unsigned long));
66c9c713de597f Deepak Gupta 2026-01-25  194  
66c9c713de597f Deepak Gupta 2026-01-25  195  	if (unlikely(err))
66c9c713de597f Deepak Gupta 2026-01-25 @196  		return err;
66c9c713de597f Deepak Gupta 2026-01-25  197  
66c9c713de597f Deepak Gupta 2026-01-25  198  	return restore_user_shstk(current, ss_ptr);
66c9c713de597f Deepak Gupta 2026-01-25  199  }
66c9c713de597f Deepak Gupta 2026-01-25  200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
