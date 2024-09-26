Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9871898FF
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Sep 2024 23:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727391952; cv=none; b=fOATmYTMnoYYF1/BXkEu6FWJOOtFkYauUSYSsLOL4JQYBkJKFSwycydlhrp/OL36zl5Q+AHOmT49WKrpOTFJv5+FzhOfP7xpyDSQvsyPSbZ5/M+ZlbyPy7DlEotH2k+qOhLRZhUrML/adFcHVzPLyKnzx1bqhPxE9V9LZfvGKys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727391952; c=relaxed/simple;
	bh=Q/ZURUTPwrsjI9lxE6mxhCPU4HsoFck+ARBPu10CLL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DWAP9UT31c98pZfVGI4581ISrzj6UDsUa/QWz9zPCC4wYxXWC96fPQYLRgdYxpxhNBCY6qSPlfv6u1VRvnJfMgPChlCaPQudmuhUXiVEkhdy1L/WGFoz/+yKQFzkkAI1k4DGG46aDy00zj7r7xZ75+1OcnUEsd2HfmijnLevhXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IuL/aR3m; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IuL/aR3m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727391950; x=1758927950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q/ZURUTPwrsjI9lxE6mxhCPU4HsoFck+ARBPu10CLL0=;
  b=IuL/aR3m/eaz776+DCAF0QYqUhB3Qz+H+cD9KOGBST2ePoCInRBEXqrO
   d+FlI2+hnDsXSkXO/TWSUU2pOd/TRfr/2AiDBmnLBFNfp7QpuJmxnKXZD
   9QS6TE3A0gLrYZp3wRs3wI0PCXEzwPjwhWgBFyvNUgzH7lrml01/MxfK+
   DAEB7oEd5XyH+tg8w1mA/J2jMmlGABXAhE4Z6HRLejZwQnnUc1gytiEV5
   KJ7WZJHikBWN0NVXv4rrTBx/f1Es438Az6X1o4yBGHCwzpiTnOggnq9gk
   EGqxkJBhLsgLBh6KFpuUMOj6lUtY38DnzOH0MhOXKR4D3pWYkJnTTKhJq
   Q==;
X-CSE-ConnectionGUID: eCUl/dFlTw6gZu3ttjsZeQ==
X-CSE-MsgGUID: yQPKPeVWRNqkNnaHBdOSNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26393188"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="26393188"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 16:05:49 -0700
X-CSE-ConnectionGUID: Wfy1ew3UTm2paYJW2yeZng==
X-CSE-MsgGUID: KX0JjFJLSyy75MXWFcR0UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="72629386"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Sep 2024 16:05:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stxYO-000LHC-2v;
	Thu, 26 Sep 2024 23:05:44 +0000
Date: Fri, 27 Sep 2024 07:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kernel/armv8_deprecated.c:243 (null)() warn: (struct
 ctl_table)->procname cannot be NULL. Expression : insn_swp.sysctl.procname
Message-ID: <202409270750.8AUQVPvy-lkp@intel.com>
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
TO: Joel Granados <j.granados@samsung.com>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62a0e2fa40c5c06742b8b4997ba5095a3ec28503
commit: de8a660b03a35c76b91a03421057833d29973877 arm: Remove now superfluous sentinel elem from ctl_table arrays
date:   12 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-r072-20240925 (https://download.01.org/0day-ci/archive/20240927/202409270750.8AUQVPvy-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409270750.8AUQVPvy-lkp@intel.com/

New smatch warnings:
arch/arm64/kernel/armv8_deprecated.c:243 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : insn_swp.sysctl.procname
arch/arm64/kernel/armv8_deprecated.c:243 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : insn_swp.sysctl.proc_handler
arch/arm64/kernel/armv8_deprecated.c:397 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : insn_setend.sysctl.procname
arch/arm64/kernel/armv8_deprecated.c:397 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : insn_setend.sysctl.proc_handler

Old smatch warnings:
arch/arm64/kernel/armv8_deprecated.c:564 register_insn_emulation() warn: (struct ctl_table)->procname cannot be NULL. Expression : sysctl->procname
arch/arm64/kernel/armv8_deprecated.c:568 register_insn_emulation() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : sysctl->proc_handler

vim +243 arch/arm64/kernel/armv8_deprecated.c

bd35a4adc4131c Punit Agrawal     2014-11-18  242  
b4453cc8a7ebbd Mark Rutland      2022-10-19 @243  static struct insn_emulation insn_swp = {
bd35a4adc4131c Punit Agrawal     2014-11-18  244  	.name = "swp",
bd35a4adc4131c Punit Agrawal     2014-11-18  245  	.status = INSN_OBSOLETE,
124c49b1b5d947 Mark Rutland      2022-10-19  246  	.try_emulate = try_emulate_swp,
bd35a4adc4131c Punit Agrawal     2014-11-18  247  	.set_hw_mode = NULL,
bd35a4adc4131c Punit Agrawal     2014-11-18  248  };
124c49b1b5d947 Mark Rutland      2022-10-19  249  #endif /* CONFIG_SWP_EMULATION */
bd35a4adc4131c Punit Agrawal     2014-11-18  250  
124c49b1b5d947 Mark Rutland      2022-10-19  251  #ifdef CONFIG_CP15_BARRIER_EMULATION
c852f320584600 Punit Agrawal     2014-11-18  252  static int cp15barrier_handler(struct pt_regs *regs, u32 instr)
c852f320584600 Punit Agrawal     2014-11-18  253  {
c852f320584600 Punit Agrawal     2014-11-18  254  	perf_sw_event(PERF_COUNT_SW_EMULATION_FAULTS, 1, regs, regs->pc);
c852f320584600 Punit Agrawal     2014-11-18  255  
2af3ec08b414ce David A. Long     2016-07-08  256  	switch (aarch32_check_condition(instr, regs->pstate)) {
c852f320584600 Punit Agrawal     2014-11-18  257  	case ARM_OPCODE_CONDTEST_PASS:
c852f320584600 Punit Agrawal     2014-11-18  258  		break;
c852f320584600 Punit Agrawal     2014-11-18  259  	case ARM_OPCODE_CONDTEST_FAIL:
c852f320584600 Punit Agrawal     2014-11-18  260  		/* Condition failed - return to next instruction */
c852f320584600 Punit Agrawal     2014-11-18  261  		goto ret;
c852f320584600 Punit Agrawal     2014-11-18  262  	case ARM_OPCODE_CONDTEST_UNCOND:
c852f320584600 Punit Agrawal     2014-11-18  263  		/* If unconditional encoding - not a barrier instruction */
c852f320584600 Punit Agrawal     2014-11-18  264  		return -EFAULT;
c852f320584600 Punit Agrawal     2014-11-18  265  	default:
c852f320584600 Punit Agrawal     2014-11-18  266  		return -EINVAL;
c852f320584600 Punit Agrawal     2014-11-18  267  	}
c852f320584600 Punit Agrawal     2014-11-18  268  
c852f320584600 Punit Agrawal     2014-11-18  269  	switch (aarch32_insn_mcr_extract_crm(instr)) {
c852f320584600 Punit Agrawal     2014-11-18  270  	case 10:
c852f320584600 Punit Agrawal     2014-11-18  271  		/*
c852f320584600 Punit Agrawal     2014-11-18  272  		 * dmb - mcr p15, 0, Rt, c7, c10, 5
c852f320584600 Punit Agrawal     2014-11-18  273  		 * dsb - mcr p15, 0, Rt, c7, c10, 4
c852f320584600 Punit Agrawal     2014-11-18  274  		 */
d784e2988a3e70 Punit Agrawal     2014-11-18  275  		if (aarch32_insn_mcr_extract_opc2(instr) == 5) {
c852f320584600 Punit Agrawal     2014-11-18  276  			dmb(sy);
d784e2988a3e70 Punit Agrawal     2014-11-18  277  			trace_instruction_emulation(
d784e2988a3e70 Punit Agrawal     2014-11-18  278  				"mcr p15, 0, Rt, c7, c10, 5 ; dmb", regs->pc);
d784e2988a3e70 Punit Agrawal     2014-11-18  279  		} else {
c852f320584600 Punit Agrawal     2014-11-18  280  			dsb(sy);
d784e2988a3e70 Punit Agrawal     2014-11-18  281  			trace_instruction_emulation(
d784e2988a3e70 Punit Agrawal     2014-11-18  282  				"mcr p15, 0, Rt, c7, c10, 4 ; dsb", regs->pc);
d784e2988a3e70 Punit Agrawal     2014-11-18  283  		}
c852f320584600 Punit Agrawal     2014-11-18  284  		break;
c852f320584600 Punit Agrawal     2014-11-18  285  	case 5:
c852f320584600 Punit Agrawal     2014-11-18  286  		/*
c852f320584600 Punit Agrawal     2014-11-18  287  		 * isb - mcr p15, 0, Rt, c7, c5, 4
c852f320584600 Punit Agrawal     2014-11-18  288  		 *
c852f320584600 Punit Agrawal     2014-11-18  289  		 * Taking an exception or returning from one acts as an
c852f320584600 Punit Agrawal     2014-11-18  290  		 * instruction barrier. So no explicit barrier needed here.
c852f320584600 Punit Agrawal     2014-11-18  291  		 */
d784e2988a3e70 Punit Agrawal     2014-11-18  292  		trace_instruction_emulation(
d784e2988a3e70 Punit Agrawal     2014-11-18  293  			"mcr p15, 0, Rt, c7, c5, 4 ; isb", regs->pc);
c852f320584600 Punit Agrawal     2014-11-18  294  		break;
c852f320584600 Punit Agrawal     2014-11-18  295  	}
c852f320584600 Punit Agrawal     2014-11-18  296  
c852f320584600 Punit Agrawal     2014-11-18  297  ret:
c852f320584600 Punit Agrawal     2014-11-18  298  	pr_warn_ratelimited("\"%s\" (%ld) uses deprecated CP15 Barrier instruction at 0x%llx\n",
c852f320584600 Punit Agrawal     2014-11-18  299  			current->comm, (unsigned long)current->pid, regs->pc);
c852f320584600 Punit Agrawal     2014-11-18  300  
6436beeee5721a Julien Thierry    2017-10-25  301  	arm64_skip_faulting_instruction(regs, 4);
c852f320584600 Punit Agrawal     2014-11-18  302  	return 0;
c852f320584600 Punit Agrawal     2014-11-18  303  }
c852f320584600 Punit Agrawal     2014-11-18  304  
736d474f0fafd1 Suzuki K. Poulose 2015-01-21  305  static int cp15_barrier_set_hw_mode(bool enable)
c852f320584600 Punit Agrawal     2014-11-18  306  {
736d474f0fafd1 Suzuki K. Poulose 2015-01-21  307  	if (enable)
25be597ada0b49 Mark Rutland      2018-07-11  308  		sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_CP15BEN);
736d474f0fafd1 Suzuki K. Poulose 2015-01-21  309  	else
25be597ada0b49 Mark Rutland      2018-07-11  310  		sysreg_clear_set(sctlr_el1, SCTLR_EL1_CP15BEN, 0);
736d474f0fafd1 Suzuki K. Poulose 2015-01-21  311  	return 0;
c852f320584600 Punit Agrawal     2014-11-18  312  }
c852f320584600 Punit Agrawal     2014-11-18  313  
124c49b1b5d947 Mark Rutland      2022-10-19  314  static bool try_emulate_cp15_barrier(struct pt_regs *regs, u32 insn)
c852f320584600 Punit Agrawal     2014-11-18  315  {
124c49b1b5d947 Mark Rutland      2022-10-19  316  	if (!compat_user_mode(regs) || compat_thumb_mode(regs))
124c49b1b5d947 Mark Rutland      2022-10-19  317  		return false;
124c49b1b5d947 Mark Rutland      2022-10-19  318  
124c49b1b5d947 Mark Rutland      2022-10-19  319  	if ((insn & 0x0fff0fdf) == 0x0e070f9a)
124c49b1b5d947 Mark Rutland      2022-10-19  320  		return cp15barrier_handler(regs, insn) == 0;
124c49b1b5d947 Mark Rutland      2022-10-19  321  
124c49b1b5d947 Mark Rutland      2022-10-19  322  	if ((insn & 0x0fff0fff) == 0x0e070f95)
124c49b1b5d947 Mark Rutland      2022-10-19  323  		return cp15barrier_handler(regs, insn) == 0;
124c49b1b5d947 Mark Rutland      2022-10-19  324  
124c49b1b5d947 Mark Rutland      2022-10-19  325  	return false;
124c49b1b5d947 Mark Rutland      2022-10-19  326  }
c852f320584600 Punit Agrawal     2014-11-18  327  
b4453cc8a7ebbd Mark Rutland      2022-10-19  328  static struct insn_emulation insn_cp15_barrier = {
c852f320584600 Punit Agrawal     2014-11-18  329  	.name = "cp15_barrier",
c852f320584600 Punit Agrawal     2014-11-18  330  	.status = INSN_DEPRECATED,
124c49b1b5d947 Mark Rutland      2022-10-19  331  	.try_emulate = try_emulate_cp15_barrier,
c852f320584600 Punit Agrawal     2014-11-18  332  	.set_hw_mode = cp15_barrier_set_hw_mode,
c852f320584600 Punit Agrawal     2014-11-18  333  };
124c49b1b5d947 Mark Rutland      2022-10-19  334  #endif /* CONFIG_CP15_BARRIER_EMULATION */
c852f320584600 Punit Agrawal     2014-11-18  335  
124c49b1b5d947 Mark Rutland      2022-10-19  336  #ifdef CONFIG_SETEND_EMULATION
2d888f48e05611 Suzuki K. Poulose 2015-01-21  337  static int setend_set_hw_mode(bool enable)
2d888f48e05611 Suzuki K. Poulose 2015-01-21  338  {
2d888f48e05611 Suzuki K. Poulose 2015-01-21  339  	if (!cpu_supports_mixed_endian_el0())
2d888f48e05611 Suzuki K. Poulose 2015-01-21  340  		return -EINVAL;
2d888f48e05611 Suzuki K. Poulose 2015-01-21  341  
2d888f48e05611 Suzuki K. Poulose 2015-01-21  342  	if (enable)
25be597ada0b49 Mark Rutland      2018-07-11  343  		sysreg_clear_set(sctlr_el1, SCTLR_EL1_SED, 0);
2d888f48e05611 Suzuki K. Poulose 2015-01-21  344  	else
25be597ada0b49 Mark Rutland      2018-07-11  345  		sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_SED);
2d888f48e05611 Suzuki K. Poulose 2015-01-21  346  	return 0;
2d888f48e05611 Suzuki K. Poulose 2015-01-21  347  }
2d888f48e05611 Suzuki K. Poulose 2015-01-21  348  
2d888f48e05611 Suzuki K. Poulose 2015-01-21  349  static int compat_setend_handler(struct pt_regs *regs, u32 big_endian)
2d888f48e05611 Suzuki K. Poulose 2015-01-21  350  {
2d888f48e05611 Suzuki K. Poulose 2015-01-21  351  	char *insn;
2d888f48e05611 Suzuki K. Poulose 2015-01-21  352  
2d888f48e05611 Suzuki K. Poulose 2015-01-21  353  	perf_sw_event(PERF_COUNT_SW_EMULATION_FAULTS, 1, regs, regs->pc);
2d888f48e05611 Suzuki K. Poulose 2015-01-21  354  
2d888f48e05611 Suzuki K. Poulose 2015-01-21  355  	if (big_endian) {
2d888f48e05611 Suzuki K. Poulose 2015-01-21  356  		insn = "setend be";
d64567f6783573 Mark Rutland      2018-07-05  357  		regs->pstate |= PSR_AA32_E_BIT;
2d888f48e05611 Suzuki K. Poulose 2015-01-21  358  	} else {
2d888f48e05611 Suzuki K. Poulose 2015-01-21  359  		insn = "setend le";
d64567f6783573 Mark Rutland      2018-07-05  360  		regs->pstate &= ~PSR_AA32_E_BIT;
2d888f48e05611 Suzuki K. Poulose 2015-01-21  361  	}
2d888f48e05611 Suzuki K. Poulose 2015-01-21  362  
2d888f48e05611 Suzuki K. Poulose 2015-01-21  363  	trace_instruction_emulation(insn, regs->pc);
2d888f48e05611 Suzuki K. Poulose 2015-01-21  364  	pr_warn_ratelimited("\"%s\" (%ld) uses deprecated setend instruction at 0x%llx\n",
2d888f48e05611 Suzuki K. Poulose 2015-01-21  365  			current->comm, (unsigned long)current->pid, regs->pc);
2d888f48e05611 Suzuki K. Poulose 2015-01-21  366  
2d888f48e05611 Suzuki K. Poulose 2015-01-21  367  	return 0;
2d888f48e05611 Suzuki K. Poulose 2015-01-21  368  }
2d888f48e05611 Suzuki K. Poulose 2015-01-21  369  
2d888f48e05611 Suzuki K. Poulose 2015-01-21  370  static int a32_setend_handler(struct pt_regs *regs, u32 instr)
2d888f48e05611 Suzuki K. Poulose 2015-01-21  371  {
2d888f48e05611 Suzuki K. Poulose 2015-01-21  372  	int rc = compat_setend_handler(regs, (instr >> 9) & 1);
6436beeee5721a Julien Thierry    2017-10-25  373  	arm64_skip_faulting_instruction(regs, 4);
2d888f48e05611 Suzuki K. Poulose 2015-01-21  374  	return rc;
2d888f48e05611 Suzuki K. Poulose 2015-01-21  375  }
2d888f48e05611 Suzuki K. Poulose 2015-01-21  376  
2d888f48e05611 Suzuki K. Poulose 2015-01-21  377  static int t16_setend_handler(struct pt_regs *regs, u32 instr)
2d888f48e05611 Suzuki K. Poulose 2015-01-21  378  {
2d888f48e05611 Suzuki K. Poulose 2015-01-21  379  	int rc = compat_setend_handler(regs, (instr >> 3) & 1);
6436beeee5721a Julien Thierry    2017-10-25  380  	arm64_skip_faulting_instruction(regs, 2);
2d888f48e05611 Suzuki K. Poulose 2015-01-21  381  	return rc;
2d888f48e05611 Suzuki K. Poulose 2015-01-21  382  }
2d888f48e05611 Suzuki K. Poulose 2015-01-21  383  
124c49b1b5d947 Mark Rutland      2022-10-19  384  static bool try_emulate_setend(struct pt_regs *regs, u32 insn)
2d888f48e05611 Suzuki K. Poulose 2015-01-21  385  {
124c49b1b5d947 Mark Rutland      2022-10-19  386  	if (compat_thumb_mode(regs) &&
124c49b1b5d947 Mark Rutland      2022-10-19  387  	    (insn & 0xfffffff7) == 0x0000b650)
124c49b1b5d947 Mark Rutland      2022-10-19  388  		return t16_setend_handler(regs, insn) == 0;
124c49b1b5d947 Mark Rutland      2022-10-19  389  
124c49b1b5d947 Mark Rutland      2022-10-19  390  	if (compat_user_mode(regs) &&
124c49b1b5d947 Mark Rutland      2022-10-19  391  	    (insn & 0xfffffdff) == 0xf1010000)
124c49b1b5d947 Mark Rutland      2022-10-19  392  		return a32_setend_handler(regs, insn) == 0;
124c49b1b5d947 Mark Rutland      2022-10-19  393  
124c49b1b5d947 Mark Rutland      2022-10-19  394  	return false;
124c49b1b5d947 Mark Rutland      2022-10-19  395  }
2d888f48e05611 Suzuki K. Poulose 2015-01-21  396  
b4453cc8a7ebbd Mark Rutland      2022-10-19 @397  static struct insn_emulation insn_setend = {
2d888f48e05611 Suzuki K. Poulose 2015-01-21  398  	.name = "setend",
2d888f48e05611 Suzuki K. Poulose 2015-01-21  399  	.status = INSN_DEPRECATED,
124c49b1b5d947 Mark Rutland      2022-10-19  400  	.try_emulate = try_emulate_setend,
2d888f48e05611 Suzuki K. Poulose 2015-01-21  401  	.set_hw_mode = setend_set_hw_mode,
2d888f48e05611 Suzuki K. Poulose 2015-01-21  402  };
124c49b1b5d947 Mark Rutland      2022-10-19  403  #endif /* CONFIG_SETEND_EMULATION */
124c49b1b5d947 Mark Rutland      2022-10-19  404  

:::::: The code at line 243 was first introduced by commit
:::::: b4453cc8a7ebbd45436a8cd3ffeaa069ceac146f arm64: armv8_deprecated: fold ops into insn_emulation

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
