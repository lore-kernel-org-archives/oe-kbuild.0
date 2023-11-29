Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB95D63D6
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 10:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOt59VCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701254704; x=1732790704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lse99d8S5OyC3aFQNSu3sdtcJtL0aZGIUPfa/V61CKg=;
  b=HOt59VCfKf3dVUmL9b/61zVNbS2odgur7BehojB6FwMKTXRAwbhS/+6P
   z60oM4awxF0MipoLYPyx8ujcZJDC1+Us1dH72plLJphWw2UNmFRZwemDZ
   BGKC1k8jmsTCMFGtaxbzUTKWb8iLK+/JkZqEShf0JhxP0Xklp8iij3Su7
   Ggj7xPmpIO7qqeeSW+Wu4zAjCZ68I15FeU+9DIEA3xqL/IOn0Ri9XAxhz
   cTqA1uYpWgVWYYeEjrRmR+wb6nFT3AY1Ce9ie/ZyAey1EKFC7wqTBSLql
   DYU5Y8mcoHUWHWmIC/tSkc8wM6PkVBhpek5SOBBF0Qjs0qYGITWYNhwlk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="123879"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="123879"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 02:45:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="718714669"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="718714669"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Nov 2023 02:45:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8I3v-00006A-3C;
	Wed, 29 Nov 2023 10:44:59 +0000
Date: Wed, 29 Nov 2023 18:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/signal.c:153 setup_sigcontext() warn: ignoring
 unreachable code.
Message-ID: <202311291736.0McBUX0W-lkp@intel.com>
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
TO: Andy Chiu <andy.chiu@sifive.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18d46e76d7c2eedd8577fae67e3f1d4db25018b0
commit: a45cedaa1ac0da7b30882afb42ff9d5285e9bb44 riscv: signal: check fp-reserved words unconditionally
date:   6 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-r071-20231129 (https://download.01.org/0day-ci/archive/20231129/202311291736.0McBUX0W-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311291736.0McBUX0W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311291736.0McBUX0W-lkp@intel.com/

New smatch warnings:
arch/riscv/kernel/signal.c:153 setup_sigcontext() warn: ignoring unreachable code.

Old smatch warnings:
arch/riscv/kernel/signal.c:76 restore_sigcontext() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:197 setup_rt_frame() warn: ignoring unreachable code.

vim +153 arch/riscv/kernel/signal.c

e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  139  
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  140  static long setup_sigcontext(struct rt_sigframe __user *frame,
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  141  	struct pt_regs *regs)
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  142  {
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  143  	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  144  	long err;
a45cedaa1ac0da Andy Chiu      2023-06-05  145  	size_t i;
a45cedaa1ac0da Andy Chiu      2023-06-05  146  
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  147  	/* sc_regs is structured the same as the start of pt_regs */
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  148  	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  149  	/* Save the floating-point state. */
37a7a2a10ec525 Jisheng Zhang  2021-05-12  150  	if (has_fpu())
007f5c35895786 Alan Kao       2018-10-09  151  		err |= save_fp_state(regs, &sc->sc_fpregs);
a45cedaa1ac0da Andy Chiu      2023-06-05  152  	/* We support no other extension state at this time. */
a45cedaa1ac0da Andy Chiu      2023-06-05 @153  	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++)
a45cedaa1ac0da Andy Chiu      2023-06-05  154  		err |= __put_user(0, &sc->sc_fpregs.q.reserved[i]);
a45cedaa1ac0da Andy Chiu      2023-06-05  155  
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  156  	return err;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  157  }
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
