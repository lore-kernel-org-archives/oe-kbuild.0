Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436EC256D
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Nov 2022 09:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668419129; x=1699955129;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eX687uWQCpVK4ng4NUvvighODAryNpx2v1NSVjKTbOc=;
  b=GlOwUdc/63NPh2oIQ9OmbOKOtiIwEkZ2CLONBMbDoms5JzsPV0N5qWC/
   laIUBGXjfybzmS76eXITFwTzB/bTSUOeK4acBIYxFRsj/rsappO2lmmmQ
   cWV7ofQN40Hv2r/cs0htMiLvfO2VteX0HpNtc6+Qg4IUoMq6AfWKk6ylq
   5HwG6N7n/CUT1xDxkXtWlRy1+rznz5mV442nFykndfviHOEgAJHpKq1PP
   tvIQoyDIBvY2nk4O2Uqo5dsySLolLQm1/lQEJaoUiVtwSh46N12WbrfyF
   LRUD1TO7KP3RSy19EUnIPwk8+L9O6Rziwsdg1cIfWYVRRLB88rrtoEv+r
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="309554076"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="309554076"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 01:45:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="638409834"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="638409834"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Nov 2022 01:45:27 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ouW1u-0000FL-1v;
	Mon, 14 Nov 2022 09:45:26 +0000
Date: Mon, 14 Nov 2022 17:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/kernel/unwind.c:451:48: warning: Boolean result is used in
 bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Message-ID: <202211141725.x21Uom7I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm/kernel/unwind.c:451:48: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   094226ad94f471a9f19e8f8e7140a09c2625abaa
commit: f6b8e3526feb025d0259c18d6dc6b8c2e2cfedf0 ARM: unwind: only permit stack switch when unwinding call_with_stack()
date:   8 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 8 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout f6b8e3526feb025d0259c18d6dc6b8c2e2cfedf0
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm/kernel/unwind.c:451:48: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
    if (prel31_to_addr(&idx->addr_offset) == (u32)&call_with_stack) {
                                                  ^

vim +451 arch/arm/kernel/unwind.c

bff595c15c92b9 Catalin Marinas  2009-02-16  377  
bff595c15c92b9 Catalin Marinas  2009-02-16  378  /*
bff595c15c92b9 Catalin Marinas  2009-02-16  379   * Unwind a single frame starting with *sp for the symbol at *pc. It
bff595c15c92b9 Catalin Marinas  2009-02-16  380   * updates the *pc and *sp with the new values.
bff595c15c92b9 Catalin Marinas  2009-02-16  381   */
bff595c15c92b9 Catalin Marinas  2009-02-16  382  int unwind_frame(struct stackframe *frame)
bff595c15c92b9 Catalin Marinas  2009-02-16  383  {
de66a979012dbc Uwe Kleine-König 2011-12-05  384  	const struct unwind_idx *idx;
bff595c15c92b9 Catalin Marinas  2009-02-16  385  	struct unwind_ctrl_block ctrl;
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  386  	unsigned long sp_low;
bff595c15c92b9 Catalin Marinas  2009-02-16  387  
a51345770e5195 Anurag Aggarwal  2014-02-24  388  	/* store the highest address on the stack to avoid crossing it*/
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  389  	sp_low = frame->sp;
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  390  	ctrl.sp_high = ALIGN(sp_low - THREAD_SIZE, THREAD_ALIGN)
a1c510d0adc604 Ard Biesheuvel   2021-09-23  391  		       + THREAD_SIZE;
bff595c15c92b9 Catalin Marinas  2009-02-16  392  
bff595c15c92b9 Catalin Marinas  2009-02-16  393  	pr_debug("%s(pc = %08lx lr = %08lx sp = %08lx)\n", __func__,
bff595c15c92b9 Catalin Marinas  2009-02-16  394  		 frame->pc, frame->lr, frame->sp);
bff595c15c92b9 Catalin Marinas  2009-02-16  395  
bff595c15c92b9 Catalin Marinas  2009-02-16  396  	idx = unwind_find_idx(frame->pc);
bff595c15c92b9 Catalin Marinas  2009-02-16  397  	if (!idx) {
81679376470ef4 Ard Biesheuvel   2022-03-02  398  		if (frame->pc && kernel_text_address(frame->pc))
8b521cb2947d88 Joe Perches      2014-09-16  399  			pr_warn("unwind: Index not found %08lx\n", frame->pc);
bff595c15c92b9 Catalin Marinas  2009-02-16  400  		return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  401  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  402  
bff595c15c92b9 Catalin Marinas  2009-02-16  403  	ctrl.vrs[FP] = frame->fp;
bff595c15c92b9 Catalin Marinas  2009-02-16  404  	ctrl.vrs[SP] = frame->sp;
bff595c15c92b9 Catalin Marinas  2009-02-16  405  	ctrl.vrs[LR] = frame->lr;
bff595c15c92b9 Catalin Marinas  2009-02-16  406  	ctrl.vrs[PC] = 0;
bff595c15c92b9 Catalin Marinas  2009-02-16  407  
bff595c15c92b9 Catalin Marinas  2009-02-16  408  	if (idx->insn == 1)
bff595c15c92b9 Catalin Marinas  2009-02-16  409  		/* can't unwind */
bff595c15c92b9 Catalin Marinas  2009-02-16  410  		return -URC_FAILURE;
532319b9c418fc Ard Biesheuvel   2021-10-04  411  	else if (frame->pc == prel31_to_addr(&idx->addr_offset)) {
532319b9c418fc Ard Biesheuvel   2021-10-04  412  		/*
532319b9c418fc Ard Biesheuvel   2021-10-04  413  		 * Unwinding is tricky when we're halfway through the prologue,
532319b9c418fc Ard Biesheuvel   2021-10-04  414  		 * since the stack frame that the unwinder expects may not be
532319b9c418fc Ard Biesheuvel   2021-10-04  415  		 * fully set up yet. However, one thing we do know for sure is
532319b9c418fc Ard Biesheuvel   2021-10-04  416  		 * that if we are unwinding from the very first instruction of
532319b9c418fc Ard Biesheuvel   2021-10-04  417  		 * a function, we are still effectively in the stack frame of
532319b9c418fc Ard Biesheuvel   2021-10-04  418  		 * the caller, and the unwind info has no relevance yet.
532319b9c418fc Ard Biesheuvel   2021-10-04  419  		 */
532319b9c418fc Ard Biesheuvel   2021-10-04  420  		if (frame->pc == frame->lr)
532319b9c418fc Ard Biesheuvel   2021-10-04  421  			return -URC_FAILURE;
532319b9c418fc Ard Biesheuvel   2021-10-04  422  		frame->pc = frame->lr;
532319b9c418fc Ard Biesheuvel   2021-10-04  423  		return URC_OK;
532319b9c418fc Ard Biesheuvel   2021-10-04  424  	} else if ((idx->insn & 0x80000000) == 0)
bff595c15c92b9 Catalin Marinas  2009-02-16  425  		/* prel31 to the unwind table */
bff595c15c92b9 Catalin Marinas  2009-02-16  426  		ctrl.insn = (unsigned long *)prel31_to_addr(&idx->insn);
bff595c15c92b9 Catalin Marinas  2009-02-16  427  	else if ((idx->insn & 0xff000000) == 0x80000000)
bff595c15c92b9 Catalin Marinas  2009-02-16  428  		/* only personality routine 0 supported in the index */
bff595c15c92b9 Catalin Marinas  2009-02-16  429  		ctrl.insn = &idx->insn;
bff595c15c92b9 Catalin Marinas  2009-02-16  430  	else {
8b521cb2947d88 Joe Perches      2014-09-16  431  		pr_warn("unwind: Unsupported personality routine %08lx in the index at %p\n",
bff595c15c92b9 Catalin Marinas  2009-02-16  432  			idx->insn, idx);
bff595c15c92b9 Catalin Marinas  2009-02-16  433  		return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  434  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  435  
bff595c15c92b9 Catalin Marinas  2009-02-16  436  	/* check the personality routine */
bff595c15c92b9 Catalin Marinas  2009-02-16  437  	if ((*ctrl.insn & 0xff000000) == 0x80000000) {
bff595c15c92b9 Catalin Marinas  2009-02-16  438  		ctrl.byte = 2;
bff595c15c92b9 Catalin Marinas  2009-02-16  439  		ctrl.entries = 1;
bff595c15c92b9 Catalin Marinas  2009-02-16  440  	} else if ((*ctrl.insn & 0xff000000) == 0x81000000) {
bff595c15c92b9 Catalin Marinas  2009-02-16  441  		ctrl.byte = 1;
bff595c15c92b9 Catalin Marinas  2009-02-16  442  		ctrl.entries = 1 + ((*ctrl.insn & 0x00ff0000) >> 16);
bff595c15c92b9 Catalin Marinas  2009-02-16  443  	} else {
8b521cb2947d88 Joe Perches      2014-09-16  444  		pr_warn("unwind: Unsupported personality routine %08lx at %p\n",
bff595c15c92b9 Catalin Marinas  2009-02-16  445  			*ctrl.insn, ctrl.insn);
bff595c15c92b9 Catalin Marinas  2009-02-16  446  		return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  447  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  448  
a51345770e5195 Anurag Aggarwal  2014-02-24  449  	ctrl.check_each_pop = 0;
a51345770e5195 Anurag Aggarwal  2014-02-24  450  
f6b8e3526feb02 Ard Biesheuvel   2022-03-11 @451  	if (prel31_to_addr(&idx->addr_offset) == (u32)&call_with_stack) {
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  452  		/*
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  453  		 * call_with_stack() is the only place where we permit SP to
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  454  		 * jump from one stack to another, and since we know it is
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  455  		 * guaranteed to happen, set up the SP bounds accordingly.
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  456  		 */
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  457  		sp_low = frame->fp;
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  458  		ctrl.sp_high = ALIGN(frame->fp, THREAD_SIZE);
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  459  	}
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  460  
bff595c15c92b9 Catalin Marinas  2009-02-16  461  	while (ctrl.entries > 0) {
a51345770e5195 Anurag Aggarwal  2014-02-24  462  		int urc;
a51345770e5195 Anurag Aggarwal  2014-02-24  463  		if ((ctrl.sp_high - ctrl.vrs[SP]) < sizeof(ctrl.vrs))
a51345770e5195 Anurag Aggarwal  2014-02-24  464  			ctrl.check_each_pop = 1;
a51345770e5195 Anurag Aggarwal  2014-02-24  465  		urc = unwind_exec_insn(&ctrl);
bff595c15c92b9 Catalin Marinas  2009-02-16  466  		if (urc < 0)
bff595c15c92b9 Catalin Marinas  2009-02-16  467  			return urc;
f6b8e3526feb02 Ard Biesheuvel   2022-03-11  468  		if (ctrl.vrs[SP] < sp_low || ctrl.vrs[SP] > ctrl.sp_high)
c894ed6956f126 Catalin Marinas  2009-06-19  469  			return -URC_FAILURE;
bff595c15c92b9 Catalin Marinas  2009-02-16  470  	}
bff595c15c92b9 Catalin Marinas  2009-02-16  471  
bff595c15c92b9 Catalin Marinas  2009-02-16  472  	if (ctrl.vrs[PC] == 0)
bff595c15c92b9 Catalin Marinas  2009-02-16  473  		ctrl.vrs[PC] = ctrl.vrs[LR];
bff595c15c92b9 Catalin Marinas  2009-02-16  474  
c894ed6956f126 Catalin Marinas  2009-06-19  475  	/* check for infinite loop */
8d54a275938968 Russell King     2019-12-22  476  	if (frame->pc == ctrl.vrs[PC] && frame->sp == ctrl.vrs[SP])
c894ed6956f126 Catalin Marinas  2009-06-19  477  		return -URC_FAILURE;
c894ed6956f126 Catalin Marinas  2009-06-19  478  
bff595c15c92b9 Catalin Marinas  2009-02-16  479  	frame->fp = ctrl.vrs[FP];
bff595c15c92b9 Catalin Marinas  2009-02-16  480  	frame->sp = ctrl.vrs[SP];
bff595c15c92b9 Catalin Marinas  2009-02-16  481  	frame->lr = ctrl.vrs[LR];
bff595c15c92b9 Catalin Marinas  2009-02-16  482  	frame->pc = ctrl.vrs[PC];
538b9265c063f0 Ard Biesheuvel   2022-01-24  483  	frame->lr_addr = ctrl.lr_addr;
bff595c15c92b9 Catalin Marinas  2009-02-16  484  
bff595c15c92b9 Catalin Marinas  2009-02-16  485  	return URC_OK;
bff595c15c92b9 Catalin Marinas  2009-02-16  486  }
bff595c15c92b9 Catalin Marinas  2009-02-16  487  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
