Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F3E1D416B
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Dec 2024 11:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735212611; cv=none; b=FVgHqd3OT1w6rB/Lg1JyDnbu1VDm/Yalk1ODDE9HNu0EitibY6c3G0qeF7Fd2oJJV/Ek/rDGXEIKnVIGi7NdG0Y6oG35T7K2XlkO0bHmLU+LazULQtNzwd0ZeHdQV6cVynqfY2mapau6cCSqoHAtg/S0pgYmIW3d6X6aiB378p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735212611; c=relaxed/simple;
	bh=7J/t94IqnXn8dhrKd3u4034edTwuT50sDK2AOW2LUjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D1rsHopP85ElEx1ahA6C7SSha8pOPAEbLuEXRLsqjS/PjJPyMTgGH1/mCrspQV5n3I6h3oPG7CCth0gv07TzjZZ13n2lvymME4N008d4tQ3IDqreJu1WWkNN5A2JqCqtLQs6v46MG4cWIhQSbQLKMpBjXQ+EYxfkiOYrqreqcBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJei3fb6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJei3fb6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735212608; x=1766748608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7J/t94IqnXn8dhrKd3u4034edTwuT50sDK2AOW2LUjw=;
  b=eJei3fb6fMiZS4GnmQO7kAstEuv/OTyTZgHoz3pF6evULnCuIibc25DU
   Yk098/+OhbSZYFcLXT9TBfJ+qI2iwiO3seoCN2Mcf8cZ5V0cNUm4orr4X
   8x4NA1keDQV4OhetX9X7EGcZw+ohJK+NGmNGrhKy9+r9DziGyetjxpBm3
   8NXtU7jk8qibAN179rYv0njg0yYwuIbTGK98cARYpsA4yY1CGQLGIgZgl
   9vKQcgrjLWHnYzdxF96OKhsntVfpbvUxbeip9ZReErqXD890uXG97tSoK
   gcAcdAxFYB+WhteOKUaTbX0wxvDSfmxQaVoV1KJPlorS6ZOj85TEX1dzP
   g==;
X-CSE-ConnectionGUID: k+X/2m+PQwmtayBdBeTwXQ==
X-CSE-MsgGUID: zefX/HaRQcCxMZcU3xD9Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="39568076"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="39568076"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 03:30:08 -0800
X-CSE-ConnectionGUID: QY9VN2G6RayAY6TfX52F4w==
X-CSE-MsgGUID: qXJnUrRcSnitLDeCVfO16A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="104990853"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Dec 2024 03:30:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQm44-0002Xm-1A;
	Thu, 26 Dec 2024 11:30:04 +0000
Date: Thu, 26 Dec 2024 19:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/signal.c:126 __restore_v_state() warn: maybe
 return -EFAULT instead of the bytes remaining?
Message-ID: <202412261919.8WV3iSqf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Andy Chiu <andybnac@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe
commit: 3aff0c459e77ac0fb1c4d6884433467f797f7357 RISC-V: Drop invalid test from CONFIG_AS_HAS_OPTION_ARCH
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: riscv-randconfig-r073-20241225 (https://download.01.org/0day-ci/archive/20241226/202412261919.8WV3iSqf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412261919.8WV3iSqf-lkp@intel.com/

New smatch warnings:
arch/riscv/kernel/signal.c:126 __restore_v_state() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
arch/riscv/kernel/signal.c:50 restore_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:64 save_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:138 __restore_v_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:158 restore_sigcontext() warn: maybe return -EFAULT instead of the bytes remaining?

vim +126 arch/riscv/kernel/signal.c

8ee0b41898fa26f Greentime Hu 2023-06-05  110  
8ee0b41898fa26f Greentime Hu 2023-06-05  111  /*
8ee0b41898fa26f Greentime Hu 2023-06-05  112   * Restore Vector extension context from the user's signal frame. This function
8ee0b41898fa26f Greentime Hu 2023-06-05  113   * assumes a valid extension header. So magic and size checking must be done by
8ee0b41898fa26f Greentime Hu 2023-06-05  114   * the caller.
8ee0b41898fa26f Greentime Hu 2023-06-05  115   */
8ee0b41898fa26f Greentime Hu 2023-06-05  116  static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
8ee0b41898fa26f Greentime Hu 2023-06-05  117  {
8ee0b41898fa26f Greentime Hu 2023-06-05  118  	long err;
8ee0b41898fa26f Greentime Hu 2023-06-05  119  	struct __sc_riscv_v_state __user *state = sc_vec;
8ee0b41898fa26f Greentime Hu 2023-06-05  120  	void __user *datap;
8ee0b41898fa26f Greentime Hu 2023-06-05  121  
8ee0b41898fa26f Greentime Hu 2023-06-05  122  	/* Copy everything of __sc_riscv_v_state except datap. */
8ee0b41898fa26f Greentime Hu 2023-06-05  123  	err = __copy_from_user(&current->thread.vstate, &state->v_state,
8ee0b41898fa26f Greentime Hu 2023-06-05  124  			       offsetof(struct __riscv_v_ext_state, datap));
8ee0b41898fa26f Greentime Hu 2023-06-05  125  	if (unlikely(err))
8ee0b41898fa26f Greentime Hu 2023-06-05 @126  		return err;
8ee0b41898fa26f Greentime Hu 2023-06-05  127  
8ee0b41898fa26f Greentime Hu 2023-06-05  128  	/* Copy the pointer datap itself. */
8ee0b41898fa26f Greentime Hu 2023-06-05  129  	err = __get_user(datap, &state->v_state.datap);
8ee0b41898fa26f Greentime Hu 2023-06-05  130  	if (unlikely(err))
8ee0b41898fa26f Greentime Hu 2023-06-05  131  		return err;
8ee0b41898fa26f Greentime Hu 2023-06-05  132  	/*
8ee0b41898fa26f Greentime Hu 2023-06-05  133  	 * Copy the whole vector content from user space datap. Use
8ee0b41898fa26f Greentime Hu 2023-06-05  134  	 * copy_from_user to prevent information leak.
8ee0b41898fa26f Greentime Hu 2023-06-05  135  	 */
8ee0b41898fa26f Greentime Hu 2023-06-05  136  	err = copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
8ee0b41898fa26f Greentime Hu 2023-06-05  137  	if (unlikely(err))
8ee0b41898fa26f Greentime Hu 2023-06-05  138  		return err;
8ee0b41898fa26f Greentime Hu 2023-06-05  139  
7df56cbc27e4239 Andy Chiu    2024-01-15  140  	riscv_v_vstate_set_restore(current, regs);
8ee0b41898fa26f Greentime Hu 2023-06-05  141  
8ee0b41898fa26f Greentime Hu 2023-06-05  142  	return err;
8ee0b41898fa26f Greentime Hu 2023-06-05  143  }
8ee0b41898fa26f Greentime Hu 2023-06-05  144  #else
8ee0b41898fa26f Greentime Hu 2023-06-05  145  #define save_v_state(task, regs) (0)
8ee0b41898fa26f Greentime Hu 2023-06-05  146  #define __restore_v_state(task, regs) (0)
8ee0b41898fa26f Greentime Hu 2023-06-05  147  #endif
8ee0b41898fa26f Greentime Hu 2023-06-05  148  

:::::: The code at line 126 was first introduced by commit
:::::: 8ee0b41898fa26f66e32237f179b6989c65600d6 riscv: signal: Add sigcontext save/restore for vector

:::::: TO: Greentime Hu <greentime.hu@sifive.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
