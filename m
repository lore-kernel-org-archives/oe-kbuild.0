Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3541F51CF5A
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Sep 2026 18:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755594; cv=none; b=cPz6fn3tEHEOsTTfoEcfIMJHhotx9pOZIs5VOWL8fv8MXRQDKx6taPsBIXQ1yQjRGpWXzorgy4kzivlT9SY9rt56hSat/wVss62dklyuJqMK15Av9s+cfw9YTqjOeclWMCd5YqxUf3aBwT9nblIqxuI92E0bsruxTuBxBcm65X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755594; c=relaxed/simple;
	bh=sHL63nNedruiZZPa9wZQPsE0UwyGT+lNFwLgD0K3eCI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pSgdbRr7JWQVhIZ8D/yvw63GsA/sozTjC9SKqyam1VJtuV6sGlB/cPhwhJ1b8ntMKL+L58VmukGZziUrbpVv1m/Rry3Ef8W5dYc0E8kOMR1v9EHPYu4OFkeX4kLbpq9BvJAIdw7ggAYRbko2++0rmjGn2ZVtlPFswU60Qijqt4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXYxtIp6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXYxtIp6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755591; x=1821291591;
  h=date:from:to:cc:subject:message-id;
  bh=sHL63nNedruiZZPa9wZQPsE0UwyGT+lNFwLgD0K3eCI=;
  b=GXYxtIp6RYj3M9halXAMVuXqLpynDn2fRzuH2lBFvqC/RE7mt4h1r0zy
   Uw8TF8Z8YdyhptRWM37owoSVfQs097ni3kJG2jrkh+N2CI4QL5JaJJNTf
   UPU9AES+kqRHjwvXbDpiqyfz1HqtPUsrWrcz+Dx6uMKYoY7AEQVP2fYcP
   T4TJ5AF7Tw7dPsVH4mY+WUMADmfmR0qiLUukhDR5GIvo5wJj7jTqiODPA
   bQQjEHpMABWB/ph8NURG+v4/1qGgOrWkTLS2l8Kk+n/kQ23Z+zGjqLxiT
   cqk8SoVv+FvHEsQO9rH2KEHF85tCLxrSA3pWQ82IUgWUJymHpSkGN3sLq
   w==;
X-CSE-ConnectionGUID: THgNzOqGRN+voEynM2Nexg==
X-CSE-MsgGUID: wKHP2ixJSW+Z/f9NVu3Gyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90296961"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90296961"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:19:51 -0700
X-CSE-ConnectionGUID: U0rnTYeNSCmXBnUm8flLRw==
X-CSE-MsgGUID: ZpsTjiEATS6820tD0qB6dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="271190849"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 11:19:49 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7dBX-000000001A3-1EbJ;
	Fri, 18 Sep 2026 18:19:43 +0000
Date: Fri, 18 Sep 2026 20:19:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/signal.c:196 __restore_cfiss_state() warn:
 maybe return -EFAULT instead of the bytes remaining?
Message-ID: <202609182005.wS9nDDeW-lkp@intel.com>
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
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: 66c9c713de597f9b40a319ebda4d3466ce2cdff0 riscv/signal: save and restore the shadow stack on a signal
date:   8 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 months ago
config: riscv-randconfig-r2201-20260918 (https://download.01.org/0day-ci/archive/20260918/202609182005.wS9nDDeW-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 66c9c713de59 ("riscv/signal: save and restore the shadow stack on a signal")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609182005.wS9nDDeW-lkp@intel.com/

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
