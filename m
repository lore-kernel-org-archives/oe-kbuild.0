Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9922D15AC1
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Aug 2023 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691510350; x=1723046350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iuW+7jNGtMyDwbbHO9v7Eptu1RIpB4fDUo05bSnEOBI=;
  b=KuX7M6FCgdjKHWd3uZpPO5GNbSccqitHbdY1EaRo1YdwCt2sHtHcd1WN
   X/lcCfFwNHi0D/ReRKnxSu7Q8i2Re3ujWf4WZSJXcS649204Sp/G9aOCX
   YbQByzPdtvIJV6LK5yWSFpZaz/kyBUJkNM4ejUnpnkZqkLxYMuDK6ySsX
   V4jmff4NrGXwFuHYEOZUDOruefvMDSPrk3LcK3OPyc7gVHP2vYafOqeQf
   2YXJTsIy0gAS5xRy13vpBi6U3/nGPz9oprbZcEbAd6Q7KNllyRcyvUO9C
   8aTlYr8L7KnQMb7mj1alczDKzaglykcfKcB0c03YueebEllp3Ox7VtRBj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401826577"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="401826577"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 08:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="905244371"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="905244371"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Aug 2023 08:59:04 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTP6t-0005RQ-24;
	Tue, 08 Aug 2023 15:59:03 +0000
Date: Tue, 8 Aug 2023 23:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/signal.c:153 setup_sigcontext() warn: ignoring
 unreachable code.
Message-ID: <202308082338.k5TKuNKJ-lkp@intel.com>
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
head:   14f9643dc90adea074a0ffb7a17d337eafc6a5cc
commit: a45cedaa1ac0da7b30882afb42ff9d5285e9bb44 riscv: signal: check fp-reserved words unconditionally
date:   9 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 9 weeks ago
config: riscv-randconfig-m031-20230808 (https://download.01.org/0day-ci/archive/20230808/202308082338.k5TKuNKJ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308082338.k5TKuNKJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308082338.k5TKuNKJ-lkp@intel.com/

New smatch warnings:
arch/riscv/kernel/signal.c:153 setup_sigcontext() warn: ignoring unreachable code.

Old smatch warnings:
arch/riscv/kernel/signal.c:46 restore_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:60 save_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?
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
