Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920372931CE
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jul 2026 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785054431; cv=none; b=M2rUb+FXaTVwjYAOWb2pXpDimmwuEjGH+AWU6G0ioJn2eIQ52wfGfCXBbKmQUjWI4rmuxxBmQ8MlRYLxVWJTJ6FEQ9et9dyqDNs4PX0qI9Ro3yJJVhUScoGiMKSNmE3ln9S9OdMb4JsylrjJ4evkGZoHNWAm5Rx0j2gg/SROmrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785054431; c=relaxed/simple;
	bh=E5cLjLvWKmph/KGzGXP5uipU7oG2Hr9ccqksilcv040=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ovMygwC0DkbutFZ8H4/j6sA4dRxYLcNt+eBECMTcwnT9MnOGcw7slJVnBFyORlYw518y7Eh/c0dWEvgmbKb7bYFkyNyiWhA0bDz7DMPA3nSUV1AGvhmhm+WYIYtpKRsl8g9Xko3xXhcXBEXOhbKLvlhWSsji8Fasmz172i9NFVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyGZvc+6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyGZvc+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785054429; x=1816590429;
  h=date:from:to:cc:subject:message-id;
  bh=E5cLjLvWKmph/KGzGXP5uipU7oG2Hr9ccqksilcv040=;
  b=QyGZvc+6KNrwoxNX7Elpwa8AZps3pQbdiyCYKEvU0aQNAf3ZExpGIA+8
   D43yW7yEnJDeFES8RLMYW6kofPKGTSC5JvIX4q7bee5+rrohzd6uy/U6i
   Emt8OiXk9nWSZOaVj8EIKPYRDAa4vnk4CrDjKTAUe/N1M4+9aDbFl7fUR
   773NI77VtS0i44fr6GVf1IlFKDTR7IzwlD5st1YclCI14yvea/vakA5ZZ
   VEaKLofHrfIKZYmtOrzne9HvJD5+mPlCQgF/GcswRiKJuC1EV2WbCWQh5
   cOC9EIBvecFkjHEhrUV8gEfnjw58gnKWXxKjZh1mf9ifrb0fjpz8SLgpQ
   Q==;
X-CSE-ConnectionGUID: a9fEVhyoSm+YoGZ4nyFLQg==
X-CSE-MsgGUID: kQQdiJ/sT0m5pG2vrta25Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85771110"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="85771110"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 01:27:09 -0700
X-CSE-ConnectionGUID: o79fevcDRxeq2AFouaBxXg==
X-CSE-MsgGUID: s1oRXm9TSViTMGFKPyGIKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="259191540"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Jul 2026 01:27:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnuBW-00000000cPh-0dH7;
	Sun, 26 Jul 2026 08:26:29 +0000
Date: Sun, 26 Jul 2026 16:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kernel/probes/kprobes.c:307
 kprobe_fault_handler() error: we previously assumed 'cur' could be null (see
 line 292)
Message-ID: <202607261528.q9e91HX1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Pu Hu <hupu@transsion.com>
CC: Will Deacon <will@kernel.org>
CC: Hongyan Xia <hongyan.xia@transsion.com>
CC: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0ce37745d4bfbc493f718169c3974898ffec8ee7
commit: 879a6754d3d11e30af24b7dc486f561510d62641 arm64: kprobes: Only handle faults originating from XOL slot
date:   9 days ago
:::::: branch date: 29 hours ago
:::::: commit date: 9 days ago
config: arm64-randconfig-r073-20260726 (https://download.01.org/0day-ci/archive/20260726/202607261528.q9e91HX1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 879a6754d3d1 ("arm64: kprobes: Only handle faults originating from XOL slot")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607261528.q9e91HX1-lkp@intel.com/

smatch warnings:
arch/arm64/kernel/probes/kprobes.c:307 kprobe_fault_handler() error: we previously assumed 'cur' could be null (see line 292)

vim +/cur +307 arch/arm64/kernel/probes/kprobes.c

2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  279  
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  280  int __kprobes kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr)
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  281  {
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  282  	struct kprobe *cur = kprobe_running();
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  283  	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  284  
879a6754d3d11e Pu Hu           2026-07-10  285  	/*
879a6754d3d11e Pu Hu           2026-07-10  286  	 * Simulated kprobes execute in the debug trap context and have no
879a6754d3d11e Pu Hu           2026-07-10  287  	 * XOL slot. Any page fault taken while a simulated kprobe is in
879a6754d3d11e Pu Hu           2026-07-10  288  	 * progress cannot have been caused by kprobe single-stepping and
879a6754d3d11e Pu Hu           2026-07-10  289  	 * must be left alone for the normal page fault handler, including
879a6754d3d11e Pu Hu           2026-07-10  290  	 * fixup_exception.
879a6754d3d11e Pu Hu           2026-07-10  291  	 */
879a6754d3d11e Pu Hu           2026-07-10 @292  	if (cur && !cur->ainsn.xol_insn)
879a6754d3d11e Pu Hu           2026-07-10  293  		return 0;
879a6754d3d11e Pu Hu           2026-07-10  294  
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  295  	switch (kcb->kprobe_status) {
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  296  	case KPROBE_HIT_SS:
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  297  	case KPROBE_REENTER:
879a6754d3d11e Pu Hu           2026-07-10  298  		/*
879a6754d3d11e Pu Hu           2026-07-10  299  		 * A page fault taken while in KPROBE_HIT_SS or
879a6754d3d11e Pu Hu           2026-07-10  300  		 * KPROBE_REENTER state is only attributable to kprobe
879a6754d3d11e Pu Hu           2026-07-10  301  		 * single-stepping if the faulting PC points to the
879a6754d3d11e Pu Hu           2026-07-10  302  		 * current kprobe's XOL instruction. If the fault occurred
879a6754d3d11e Pu Hu           2026-07-10  303  		 * elsewhere (e.g. in perf or tracing code invoked from the
879a6754d3d11e Pu Hu           2026-07-10  304  		 * debug exception path), leave it for the normal page fault
879a6754d3d11e Pu Hu           2026-07-10  305  		 * handler to process.
879a6754d3d11e Pu Hu           2026-07-10  306  		 */
879a6754d3d11e Pu Hu           2026-07-10 @307  		if (instruction_pointer(regs) != (unsigned long)cur->ainsn.xol_insn)
879a6754d3d11e Pu Hu           2026-07-10  308  			break;
879a6754d3d11e Pu Hu           2026-07-10  309  
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  310  		/*
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  311  		 * We are here because the instruction being single
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  312  		 * stepped caused a page fault. We reset the current
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  313  		 * kprobe and the ip points back to the probe address
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  314  		 * and allow the page fault handler to continue as a
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  315  		 * normal page fault.
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  316  		 */
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  317  		instruction_pointer_set(regs, (unsigned long) cur->addr);
839157876f97fc zhouchuangao    2021-03-30  318  		BUG_ON(!instruction_pointer(regs));
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  319  
738fa58ee13284 Jisheng Zhang   2021-04-12  320  		if (kcb->kprobe_status == KPROBE_REENTER) {
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  321  			restore_previous_kprobe(kcb);
738fa58ee13284 Jisheng Zhang   2021-04-12  322  		} else {
738fa58ee13284 Jisheng Zhang   2021-04-12  323  			kprobes_restore_local_irqflag(kcb, regs);
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  324  			reset_current_kprobe();
738fa58ee13284 Jisheng Zhang   2021-04-12  325  		}
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  326  
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  327  		break;
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  328  	}
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  329  	return 0;
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  330  }
2dd0e8d2d2a157 Sandeepa Prabhu 2016-07-08  331  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
