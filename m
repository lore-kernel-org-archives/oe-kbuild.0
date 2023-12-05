Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B297863DFA
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 17:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGPcXbT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701795668; x=1733331668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f3AcPDIhBCePDoVhxb1J7JaCoPQYLQIMJtupsQYzmhc=;
  b=fGPcXbT3HhXMQagyTfSR0DUWlUvk1wn8XFs/jDHen2pGxUP1zNZ2l4/a
   4kaaiB3JFjPdHbdIRjf2pgKKH2YwjNvNcVzzBW4BLCNlSD2MELe7p7Hgd
   7ZWFLGE1RBcD0T2x4o0wlTSBBZF0NuezODX1vL1Vw9P9wePmAMnTUCyCw
   PWHw8u9BMua8WMkB+36ZHg0W0RDWF/nIC+9jdMmSucDc7Y9Nj0vgUMLKI
   KTvKUconk7TDEV7E7A3Hsa7q4F/6zGr6c+tz5r83TnQmuPSbRsi8vMuaa
   x2UcPuBfsVMCYQ+MOj/EbtMfP3Pz8LYzdeExEqtYmYGf5UgtoeUiJQlY1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="397820589"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="397820589"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 09:01:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="861807120"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="861807120"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2023 09:01:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAYn7-0009P2-0w;
	Tue, 05 Dec 2023 17:01:01 +0000
Date: Wed, 6 Dec 2023 01:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 12/31] arch/x86/kernel/process_64.c:624:9: sparse:
 sparse: not in switch scope
Message-ID: <202312060008.sHGyEIdE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/x86/kernel/process_64.c:624:9: sparse: sparse: not in switch scope"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Uros Bizjak <ubizjak@gmail.com>
CC: Ingo Molnar <mingo@kernel.org>
CC: Nadav Amit <namit@vmware.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/percpu
head:   fc50065325f8b88d6986f089ae103b5db858ab96
commit: ca4256348660cb2162668ec3d13d1f921d05374a [12/31] x86/percpu: Use C for percpu read/write accessors
:::::: branch date: 3 days ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-r121-20231205 (https://download.01.org/0day-ci/archive/20231206/202312060008.sHGyEIdE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060008.sHGyEIdE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312060008.sHGyEIdE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/include/asm/desc.h:350:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/desc.h:350:17: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c: note: in included file (through arch/x86/include/asm/mmu_context.h):
   include/trace/events/tlb.h:38:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/tlb.h:38:1: sparse: sparse: got __seg_gs
   include/trace/events/tlb.h:38:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/tlb.h:38:1: sparse: sparse: got __seg_gs
   include/trace/events/tlb.h:38:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/tlb.h:38:1: sparse: sparse: got __seg_gs
   include/trace/events/tlb.h:38:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/tlb.h:38:1: sparse: sparse: got __seg_gs
   include/trace/events/tlb.h:38:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/tlb.h:38:1: sparse: sparse: got __seg_gs
   include/trace/events/tlb.h:38:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/tlb.h:38:1: sparse: sparse: got __seg_gs
   include/trace/events/tlb.h:38:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/tlb.h:38:1: sparse: sparse: got __seg_gs
   include/trace/events/tlb.h:38:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/tlb.h:38:1: sparse: sparse: got __seg_gs
   include/trace/events/tlb.h:38:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/tlb.h:38:1: sparse: sparse: got __seg_gs
   include/trace/events/tlb.h:38:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/tlb.h:38:1: sparse: sparse: got __seg_gs
   include/trace/events/tlb.h:38:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/tlb.h:38:1: sparse: sparse: got __seg_gs
   include/trace/events/tlb.h:38:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/tlb.h:38:1: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c: note: in included file (through arch/x86/include/asm/mmu_context.h):
   arch/x86/include/asm/debugreg.h:112:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/debugreg.h:112:16: sparse: sparse: got __seg_gs
   arch/x86/include/asm/debugreg.h:112:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/debugreg.h:112:16: sparse: sparse: got __seg_gs
   arch/x86/include/asm/debugreg.h:112:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/debugreg.h:112:16: sparse: sparse: got __seg_gs
   arch/x86/include/asm/debugreg.h:112:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/debugreg.h:112:16: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c: note: in included file:
   arch/x86/include/asm/resctrl.h:54:43: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/resctrl.h:54:43: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:167:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:192:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:566:19: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:566:19: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:566:19: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:566:19: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:566:19: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:566:19: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:566:19: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:566:19: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:568:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:568:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:568:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:568:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:568:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:568:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:568:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:568:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:623:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:623:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:623:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:623:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:623:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:623:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:623:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:623:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: expected 'while' after 'do'
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: Expected ( after 'do-while'
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: got )
>> arch/x86/kernel/process_64.c:624:9: sparse: sparse: not in switch scope
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: expected 'while' after 'do'
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: Expected ( after 'do-while'
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: got )
>> arch/x86/kernel/process_64.c:624:9: sparse: sparse: break/continue not in iterator scope
>> arch/x86/kernel/process_64.c:624:9: sparse: sparse: not in switch scope
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: expected 'while' after 'do'
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: Expected ( after 'do-while'
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: got )
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: Expected ) in function declarator
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: got 0
>> arch/x86/kernel/process_64.c:624:9: sparse: sparse: Trying to use reserved word 'while' as identifier
>> arch/x86/kernel/process_64.c:624:9: sparse: sparse: Trying to use reserved word 'break' as identifier
>> arch/x86/kernel/process_64.c:624:9: sparse: sparse: Trying to use reserved word 'case' as identifier
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: Expected ; at end of declaration
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: got 8
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: Expected ; at end of declaration
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: got +=
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: Expected ) in nested declarator
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: got pt_regs
>> arch/x86/kernel/process_64.c:624:9: sparse: sparse: Trying to use reserved word 'struct' as identifier
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: got }
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: got }
>> arch/x86/kernel/process_64.c:624:9: sparse: sparse: Trying to use reserved word 'break' as identifier
>> arch/x86/kernel/process_64.c:624:9: sparse: sparse: Trying to use reserved word 'default' as identifier
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: Expected ; at end of declaration
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: got :
>> arch/x86/kernel/process_64.c:624:9: sparse: sparse: Trying to use reserved word 'break' as identifier
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: got }
   arch/x86/kernel/process_64.c:633:13: sparse: sparse: Expected ) in function declarator
   arch/x86/kernel/process_64.c:633:13: sparse: sparse: got (
>> arch/x86/kernel/process_64.c:633:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/x86/kernel/process_64.c:657:28: sparse: sparse: Expected ) in function declarator
   arch/x86/kernel/process_64.c:657:28: sparse: sparse: got !=
   arch/x86/kernel/process_64.c:657:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/x86/kernel/process_64.c:658:25: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/kernel/process_64.c:658:25: sparse: sparse: got }
   arch/x86/kernel/process_64.c:659:9: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/kernel/process_64.c:659:9: sparse: sparse: got }
>> arch/x86/kernel/process_64.c:664:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/kernel/process_64.c:664:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/kernel/process_64.c:664:16: sparse: sparse: got prev_p
   arch/x86/kernel/process_64.c:665:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/kernel/process_64.c:665:1: sparse: sparse: got }
   arch/x86/kernel/process_64.c:674:9: sparse: sparse: Expected ) in nested declarator
   arch/x86/kernel/process_64.c:674:9: sparse: sparse: got {
   arch/x86/kernel/process_64.c:674:9: sparse: sparse: Expected ; at end of declaration
   arch/x86/kernel/process_64.c:674:9: sparse: sparse: got +=
   arch/x86/kernel/process_64.c:674:9: sparse: sparse: Expected ) in nested declarator
   arch/x86/kernel/process_64.c:674:9: sparse: sparse: got pt_regs
   arch/x86/kernel/process_64.c:674:9: sparse: sparse: Trying to use reserved word 'struct' as identifier
   arch/x86/kernel/process_64.c:674:9: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/kernel/process_64.c:674:9: sparse: sparse: got }
   arch/x86/kernel/process_64.c:675:9: sparse: sparse: Expected ) in nested declarator
   arch/x86/kernel/process_64.c:675:9: sparse: sparse: got thread_info
   arch/x86/kernel/process_64.c:675:9: sparse: sparse: Trying to use reserved word 'struct' as identifier
   arch/x86/kernel/process_64.c:676:13: sparse: sparse: Expected ) in function declarator
   arch/x86/kernel/process_64.c:676:13: sparse: sparse: got (
   arch/x86/kernel/process_64.c:676:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/x86/kernel/process_64.c:683:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/kernel/process_64.c:683:16: sparse: sparse: got ->
   arch/x86/kernel/process_64.c:684:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/kernel/process_64.c:684:1: sparse: sparse: got }
   arch/x86/kernel/process_64.c:692:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/kernel/process_64.c:692:16: sparse: sparse: got ->
   arch/x86/kernel/process_64.c:701:9: sparse: sparse: Expected ) in nested declarator
   arch/x86/kernel/process_64.c:701:9: sparse: sparse: got {
   arch/x86/kernel/process_64.c:701:9: sparse: sparse: Expected ; at end of declaration
   arch/x86/kernel/process_64.c:701:9: sparse: sparse: got +=
   arch/x86/kernel/process_64.c:701:9: sparse: sparse: Expected ) in nested declarator
   arch/x86/kernel/process_64.c:701:9: sparse: sparse: got pt_regs
   arch/x86/kernel/process_64.c:701:9: sparse: sparse: Trying to use reserved word 'struct' as identifier
   arch/x86/kernel/process_64.c:701:9: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/kernel/process_64.c:701:9: sparse: sparse: got }
   arch/x86/kernel/process_64.c:702:9: sparse: sparse: Expected ) in nested declarator
   arch/x86/kernel/process_64.c:702:9: sparse: sparse: got thread_info
   arch/x86/kernel/process_64.c:702:9: sparse: sparse: Trying to use reserved word 'struct' as identifier
   arch/x86/kernel/process_64.c:704:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/kernel/process_64.c:704:1: sparse: sparse: got }
   arch/x86/kernel/process_64.c:715:9: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/kernel/process_64.c:715:9: sparse: sparse: got }
   arch/x86/kernel/process_64.c:719:9: sparse: sparse: Expected ) in nested declarator
   arch/x86/kernel/process_64.c:719:9: sparse: sparse: got {
   arch/x86/kernel/process_64.c:719:9: sparse: sparse: Expected ; at end of declaration
   arch/x86/kernel/process_64.c:719:9: sparse: sparse: got +=
   arch/x86/kernel/process_64.c:719:9: sparse: sparse: Expected ) in nested declarator
   arch/x86/kernel/process_64.c:719:9: sparse: sparse: got pt_regs
   arch/x86/kernel/process_64.c:719:9: sparse: sparse: Trying to use reserved word 'struct' as identifier
   arch/x86/kernel/process_64.c:719:9: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/kernel/process_64.c:719:9: sparse: sparse: got }
   arch/x86/kernel/process_64.c:720:9: sparse: sparse: Expected ) in nested declarator
   arch/x86/kernel/process_64.c:720:9: sparse: sparse: got thread_info
   arch/x86/kernel/process_64.c:720:9: sparse: sparse: Trying to use reserved word 'struct' as identifier
   arch/x86/kernel/process_64.c:722:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/kernel/process_64.c:722:1: sparse: sparse: got }
   arch/x86/kernel/process_64.c:729:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/x86/kernel/process_64.c:730:17: sparse: sparse: Expected ; at end of declaration
   arch/x86/kernel/process_64.c:730:17: sparse: sparse: got __set_personality_x32
>> arch/x86/kernel/process_64.c:731:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   arch/x86/kernel/process_64.c:732:17: sparse: sparse: Expected ; at end of declaration
   arch/x86/kernel/process_64.c:732:17: sparse: sparse: got __set_personality_ia32
   arch/x86/kernel/process_64.c:733:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/kernel/process_64.c:733:1: sparse: sparse: got }
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: undefined identifier '__ptr'
   arch/x86/kernel/process_64.c:624:9: sparse: sparse: undefined identifier '__ptr'
   arch/x86/kernel/process_64.c:626:9: sparse: sparse: symbol 'switch_fpu_finish' redeclared with different type (different base types):
>> arch/x86/kernel/process_64.c:626:9: sparse:    int static [signed] [toplevel] switch_fpu_finish( ... )
   arch/x86/kernel/process_64.c: note: in included file:
   arch/x86/include/asm/fpu/sched.h:63:20: sparse: note: previously declared as:
>> arch/x86/include/asm/fpu/sched.h:63:20: sparse:    void static inline [gnu_inline] [toplevel] switch_fpu_finish( ... )
   arch/x86/kernel/process_64.c:629:9: sparse: sparse: symbol 'update_task_stack' redeclared with different type (incompatible argument 1 (different base types)):
>> arch/x86/kernel/process_64.c:629:9: sparse:    int static [signed] [toplevel] update_task_stack( ... )
   arch/x86/kernel/process_64.c: note: in included file (through arch/x86/include/asm/stacktrace.h, arch/x86/include/asm/perf_event.h, include/linux/perf_event.h, ...):
   arch/x86/include/asm/switch_to.h:67:20: sparse: note: previously declared as:
>> arch/x86/include/asm/switch_to.h:67:20: sparse:    void static inline [gnu_inline] [toplevel] update_task_stack( ... )
   arch/x86/kernel/process_64.c:631:9: sparse: sparse: symbol 'switch_to_extra' redeclared with different type (incompatible argument 1 (different base types)):
>> arch/x86/kernel/process_64.c:631:9: sparse:    int static [signed] [toplevel] switch_to_extra( ... )
   arch/x86/kernel/process_64.c: note: in included file:
   arch/x86/kernel/process.h:13:20: sparse: note: previously declared as:
>> arch/x86/kernel/process.h:13:20: sparse:    void static inline [gnu_inline] [toplevel] switch_to_extra( ... )
   arch/x86/kernel/process_64.c:683:9: sparse: sparse: symbol 'get_current' redeclared with different type (different base types):
>> arch/x86/kernel/process_64.c:683:9: sparse:    int static [signed] [toplevel] get_current( ... )
   arch/x86/kernel/process_64.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   arch/x86/include/asm/current.h:39:43: sparse: note: previously declared as:
>> arch/x86/include/asm/current.h:39:43: sparse:    struct task_struct *static inline [gnu_inline] [toplevel] get_current( ... )
   arch/x86/kernel/process_64.c:692:9: sparse: sparse: symbol 'get_current' redeclared with different type (different base types):
   arch/x86/kernel/process_64.c:692:9: sparse:    int static [signed] [toplevel] get_current( ... )
   arch/x86/include/asm/current.h:39:43: sparse: note: previously declared as:
>> arch/x86/include/asm/current.h:39:43: sparse:    struct task_struct *static inline [gnu_inline] [toplevel] get_current( ... )
>> arch/x86/kernel/process_64.c:811:26: sparse: sparse: incompatible types for operation (==):
>> arch/x86/kernel/process_64.c:811:26: sparse:    struct task_struct *task
>> arch/x86/kernel/process_64.c:811:26: sparse:    int
   arch/x86/kernel/process_64.c:841:26: sparse: sparse: incompatible types for operation (==):
   arch/x86/kernel/process_64.c:841:26: sparse:    struct task_struct *task
   arch/x86/kernel/process_64.c:841:26: sparse:    int
--
   include/trace/events/xen.h:423:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:423:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:423:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:423:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:423:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:423:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:423:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:423:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:423:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:423:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:442:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:442:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:442:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:442:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:442:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:442:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:442:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:442:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:442:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:442:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:442:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:442:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:442:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:442:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:442:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:442:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:442:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:442:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:442:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:442:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:442:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:442:1: sparse: sparse: got __seg_gs
   include/trace/events/xen.h:442:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xen.h:442:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c: note: in included file (through include/linux/cgroup.h, include/linux/perf_event.h, include/linux/trace_events.h, ...):
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c: note: in included file (through include/linux/trace_events.h, include/trace/syscall.h, include/linux/syscalls.h, ...):
   include/linux/perf_event.h:1436:32: sparse: sparse: Expected ) at end of cast operator
   include/linux/perf_event.h:1436:32: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c: note: in included file (through include/linux/entry-common.h, arch/x86/include/asm/idtentry.h):
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/entry-common.h:88:9: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:125:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:125:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:125:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:125:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:125:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:125:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:125:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:125:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: expected 'while' after 'do'
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ( after 'do-while'
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got )
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: not in switch scope
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: expected 'while' after 'do'
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ( after 'do-while'
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got )
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: break/continue not in iterator scope
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: not in switch scope
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: expected 'while' after 'do'
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ( after 'do-while'
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got )
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) in function declarator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got 0
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'while' as identifier
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'break' as identifier
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at end of declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got 8
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) in nested declarator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got {
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at end of declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got {
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at end of declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got __vpp_verify
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got }
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ) in function declarator
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got (
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'switch' as identifier
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got }
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'break' as identifier
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at end of declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got 2
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got }
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'break' as identifier
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at end of declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got 4
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got }
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'break' as identifier
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at end of declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got 8
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got }
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'break' as identifier
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'default' as identifier
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at end of declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got :
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got }
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got }
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got }
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got }
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'break' as identifier
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'default' as identifier
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at end of declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got :
>> arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/xen/enlighten_hvm.c:127:17: sparse: sparse: got }
   arch/x86/xen/enlighten_hvm.c:128:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/xen/enlighten_hvm.c:128:1: sparse: sparse: got }
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: undefined identifier '__sysvec_xen_hvm_callback'
>> arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: static assertion failed: "__builtin_types_compatible_p(typeof(&__sysvec_xen_hvm_callback), void (*)(struct pt_regs *))"
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/xen/enlighten_hvm.c:137:9: sparse: sparse: got __seg_gs
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: undefined identifier '__sysvec_xen_hvm_callback'
   arch/x86/xen/enlighten_hvm.c:130:1: sparse: sparse: undefined identifier '__sysvec_xen_hvm_callback'

vim +624 arch/x86/kernel/process_64.c

513ad84bf60d96 arch/x86/kernel/process_64.c Ingo Molnar               2008-02-21  548  
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  549  /*
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  550   *	switch_to(x,y) should switch tasks from x to y.
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  551   *
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  552   * This could still be optimized:
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  553   * - fold all the options into a flag word and test it with a single test.
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  554   * - could test fs/gs bitsliced
099f318b8d9749 arch/x86_64/kernel/process.c Andi Kleen                2006-02-03  555   *
099f318b8d9749 arch/x86_64/kernel/process.c Andi Kleen                2006-02-03  556   * Kprobes not supported here. Set the probe on schedule instead.
8b96f011981896 arch/x86/kernel/process_64.c Frederic Weisbecker       2008-12-06  557   * Function graph tracer not supported too.
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  558   */
b11671b37f8f47 arch/x86/kernel/process_64.c Alexander Potapenko       2022-09-15  559  __no_kmsan_checks
35ea7903b8a971 arch/x86/kernel/process_64.c Andi Kleen                2013-08-05  560  __visible __notrace_funcgraph struct task_struct *
a88cde13bae3ff arch/x86_64/kernel/process.c Andi Kleen                2005-11-05  561  __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  562  {
87b935a0ef9a1d arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-07-08  563  	struct thread_struct *prev = &prev_p->thread;
87b935a0ef9a1d arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-07-08  564  	struct thread_struct *next = &next_p->thread;
384a23f939912d arch/x86/kernel/process_64.c Ingo Molnar               2015-04-23  565  	struct fpu *prev_fpu = &prev->fpu;
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  566  	int cpu = smp_processor_id();
e07e23e1fd3000 arch/x86_64/kernel/process.c Arjan van de Ven          2006-09-26  567  
1d3e53e8624a3e arch/x86/kernel/process_64.c Andy Lutomirski           2017-07-11  568  	WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_ENTRY) &&
d7b6d709a76a4f arch/x86/kernel/process_64.c Thomas Gleixner           2022-09-15  569  		     this_cpu_read(pcpu_hot.hardirq_stack_inuse));
1d3e53e8624a3e arch/x86/kernel/process_64.c Andy Lutomirski           2017-07-11  570  
5f409e20b79456 arch/x86/kernel/process_64.c Rik van Riel              2019-04-03  571  	if (!test_thread_flag(TIF_NEED_FPU_LOAD))
c474e50711aa79 arch/x86/kernel/process_64.c Rik van Riel              2016-10-14  572  		switch_fpu_prepare(prev_fpu, cpu);
4903062b5485f0 arch/x86/kernel/process_64.c Linus Torvalds            2012-02-16  573  
478de5a9d691dd arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  574  	/* We must save %fs and %gs before load_TLS() because
478de5a9d691dd arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  575  	 * %fs and %gs may be cleared by load_TLS().
478de5a9d691dd arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  576  	 *
478de5a9d691dd arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  577  	 * (e.g. xen_load_tls())
478de5a9d691dd arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  578  	 */
e137a4d8f4dd2e arch/x86/kernel/process_64.c Andy Lutomirski           2017-08-01  579  	save_fsgs(prev_p);
478de5a9d691dd arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  580  
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  581  	/*
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  582  	 * Load TLS before restoring any segments so that segment loads
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  583  	 * reference the correct GDT entries.
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  584  	 */
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  585  	load_TLS(next, cpu);
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  586  
3fe0a63efd4437 arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  587  	/*
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  588  	 * Leave lazy mode, flushing any hypercalls made here.  This
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  589  	 * must be done after loading TLS entries in the GDT but before
6dd677a044e606 arch/x86/kernel/process_64.c Sebastian Andrzej Siewior 2019-04-03  590  	 * loading segments that might reference them.
3fe0a63efd4437 arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  591  	 */
224101ed69d3fb arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2009-02-18  592  	arch_end_context_switch(next_p);
3fe0a63efd4437 arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  593  
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  594  	/* Switch DS and ES.
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  595  	 *
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  596  	 * Reading them only returns the selectors, but writing them (if
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  597  	 * nonzero) loads the full descriptor from the GDT or LDT.  The
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  598  	 * LDT for next is loaded in switch_mm, and the GDT is loaded
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  599  	 * above.
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  600  	 *
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  601  	 * We therefore need to write new values to the segment
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  602  	 * registers on every context switch unless both the new and old
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  603  	 * values are zero.
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  604  	 *
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  605  	 * Note that we don't need to do anything for CS and SS, as
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  606  	 * those are saved and restored as part of pt_regs.
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  607  	 */
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  608  	savesegment(es, prev->es);
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  609  	if (unlikely(next->es | prev->es))
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  610  		loadsegment(es, next->es);
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  611  
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  612  	savesegment(ds, prev->ds);
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  613  	if (unlikely(next->ds | prev->ds))
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  614  		loadsegment(ds, next->ds);
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  615  
f4550b52e495e1 arch/x86/kernel/process_64.c Chang S. Bae              2018-09-18  616  	x86_fsgsbase_load(prev, next);
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  617  
9782a712eb971c arch/x86/kernel/process_64.c Dave Hansen               2021-06-23  618  	x86_pkru_load(prev, next);
9782a712eb971c arch/x86/kernel/process_64.c Dave Hansen               2021-06-23  619  
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  620  	/*
45948d7720e8bd arch/x86_64/kernel/process.c Jan Beulich               2006-03-25  621  	 * Switch the PDA and FPU contexts.
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  622  	 */
e57ef2ed97c1d0 arch/x86/kernel/process_64.c Thomas Gleixner           2022-09-15 @623  	raw_cpu_write(pcpu_hot.current_task, next_p);
c063a217bc0726 arch/x86/kernel/process_64.c Thomas Gleixner           2022-09-15 @624  	raw_cpu_write(pcpu_hot.top_of_stack, task_top_of_stack(next_p));
18bd057b1408cd arch/x86_64/kernel/process.c Andi Kleen                2006-04-20  625  
9568bfb4f04bd9 arch/x86/kernel/process_64.c Thomas Gleixner           2021-10-15 @626  	switch_fpu_finish();
2722146eb78451 arch/x86/kernel/process_64.c Sebastian Andrzej Siewior 2019-04-03  627  
bd7dc5a6afac71 arch/x86/kernel/process_64.c Andy Lutomirski           2017-11-02  628  	/* Reload sp0. */
252e1a0526304f arch/x86/kernel/process_64.c Joerg Roedel              2018-07-18 @629  	update_task_stack(next_p);
b27559a433bb60 arch/x86/kernel/process_64.c Andy Lutomirski           2015-03-06  630  
ff16701a29cba3 arch/x86/kernel/process_64.c Thomas Gleixner           2018-11-25 @631  	switch_to_extra(prev_p, next_p);
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  632  
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26 @633  	if (static_cpu_has_bug(X86_BUG_SYSRET_SS_ATTRS)) {
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  634  		/*
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  635  		 * AMD CPUs have a misfeature: SYSRET sets the SS selector but
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  636  		 * does not update the cached descriptor.  As a result, if we
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  637  		 * do SYSRET while SS is NULL, we'll end up in user mode with
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  638  		 * SS apparently equal to __USER_DS but actually unusable.
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  639  		 *
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  640  		 * The straightforward workaround would be to fix it up just
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  641  		 * before SYSRET, but that would slow down the system call
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  642  		 * fast paths.  Instead, we ensure that SS is never NULL in
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  643  		 * system call context.  We do this by replacing NULL SS
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  644  		 * selectors at every context switch.  SYSCALL sets up a valid
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  645  		 * SS, so the only way to get NULL is to re-enter the kernel
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  646  		 * from CPL 3 through an interrupt.  Since that can't happen
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  647  		 * in the same task as a running syscall, we are guaranteed to
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  648  		 * context switch between every interrupt vector entry and a
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  649  		 * subsequent SYSRET.
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  650  		 *
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  651  		 * We read SS first because SS reads are much faster than
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  652  		 * writes.  Out of caution, we force SS to __KERNEL_DS even if
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  653  		 * it previously had a different non-NULL value.
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  654  		 */
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  655  		unsigned short ss_sel;
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  656  		savesegment(ss, ss_sel);
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  657  		if (ss_sel != __KERNEL_DS)
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  658  			loadsegment(ss, __KERNEL_DS);
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  659  	}
61f01dd941ba9e arch/x86/kernel/process_64.c Andy Lutomirski           2015-04-26  660  
4f341a5e48443f arch/x86/kernel/process_64.c Fenghua Yu                2016-10-28  661  	/* Load the Intel cache allocation PQR MSR. */
7fef099702527c arch/x86/kernel/process_64.c Linus Torvalds            2023-03-07  662  	resctrl_sched_in(next_p);
4f341a5e48443f arch/x86/kernel/process_64.c Fenghua Yu                2016-10-28  663  
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16 @664  	return prev_p;
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  665  }
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  666  
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  667  void set_personality_64bit(void)
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  668  {
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  669  	/* inherit personality from parent */
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  670  
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  671  	/* Make sure to be in 64bit mode */
6bd330083e0e97 arch/x86/kernel/process_64.c H. Peter Anvin            2012-02-06  672  	clear_thread_flag(TIF_ADDR32);
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  673  	/* Pretend that this comes from a 64bit execve */
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  674  	task_pt_regs(current)->orig_ax = __NR_execve;
acf46020012ccb arch/x86/kernel/process_64.c Dmitry Safonov            2018-05-18  675  	current_thread_info()->status &= ~TS_COMPAT;
375906f8765e13 arch/x86/kernel/process_64.c Stephen Wilson            2011-03-13  676  	if (current->mm)
5ef495e55f07aa arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  677  		__set_bit(MM_CONTEXT_HAS_VSYSCALL, &current->mm->context.flags);
375906f8765e13 arch/x86/kernel/process_64.c Stephen Wilson            2011-03-13  678  
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  679  	/* TBD: overwrites user setup. Should have two bits.
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  680  	   But 64bit processes have always behaved this way,
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  681  	   so it's not too bad. The main problem is just that
a97673a1c43d00 arch/x86/kernel/process_64.c Ingo Molnar               2018-12-03  682  	   32bit children are affected again. */
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16 @683  	current->personality &= ~READ_IMPLIES_EXEC;
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  684  }
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  685  
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  686  static void __set_personality_x32(void)
05d43ed8a89c15 arch/x86/kernel/process_64.c H. Peter Anvin            2010-01-28  687  {
83a44a4f47ad20 arch/x86/kernel/process_64.c Masahiro Yamada           2022-03-14  688  #ifdef CONFIG_X86_X32_ABI
b24dc8dace7470 arch/x86/kernel/process_64.c Oleg Nesterov             2014-04-19  689  	if (current->mm)
ff170cd0595398 arch/x86/kernel/process_64.c Gabriel Krisman Bertazi   2020-10-03  690  		current->mm->context.flags = 0;
ff170cd0595398 arch/x86/kernel/process_64.c Gabriel Krisman Bertazi   2020-10-03  691  
d1a797f388d6d3 arch/x86/kernel/process_64.c H. Peter Anvin            2012-02-19 @692  	current->personality &= ~READ_IMPLIES_EXEC;
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  693  	/*
a846446b1914d1 arch/x86/kernel/process_64.c Dmitry Safonov            2018-10-12  694  	 * in_32bit_syscall() uses the presence of the x32 syscall bit
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  695  	 * flag to determine compat status.  The x86 mmap() code relies on
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  696  	 * the syscall bitness so set x32 syscall bit right here to make
a846446b1914d1 arch/x86/kernel/process_64.c Dmitry Safonov            2018-10-12  697  	 * in_32bit_syscall() work during exec().
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  698  	 *
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  699  	 * Pretend to come from a x32 execve.
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  700  	 */
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  701  	task_pt_regs(current)->orig_ax = __NR_x32_execve | __X32_SYSCALL_BIT;
37a8f7c38339b2 arch/x86/kernel/process_64.c Andy Lutomirski           2018-01-28  702  	current_thread_info()->status &= ~TS_COMPAT;
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  703  #endif
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  704  }
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  705  
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  706  static void __set_personality_ia32(void)
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  707  {
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  708  #ifdef CONFIG_IA32_EMULATION
ff170cd0595398 arch/x86/kernel/process_64.c Gabriel Krisman Bertazi   2020-10-03  709  	if (current->mm) {
ff170cd0595398 arch/x86/kernel/process_64.c Gabriel Krisman Bertazi   2020-10-03  710  		/*
ff170cd0595398 arch/x86/kernel/process_64.c Gabriel Krisman Bertazi   2020-10-03  711  		 * uprobes applied to this MM need to know this and
ff170cd0595398 arch/x86/kernel/process_64.c Gabriel Krisman Bertazi   2020-10-03  712  		 * cannot use user_64bit_mode() at that time.
ff170cd0595398 arch/x86/kernel/process_64.c Gabriel Krisman Bertazi   2020-10-03  713  		 */
5ef495e55f07aa arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  714  		__set_bit(MM_CONTEXT_UPROBE_IA32, &current->mm->context.flags);
ff170cd0595398 arch/x86/kernel/process_64.c Gabriel Krisman Bertazi   2020-10-03  715  	}
ff170cd0595398 arch/x86/kernel/process_64.c Gabriel Krisman Bertazi   2020-10-03  716  
d1a797f388d6d3 arch/x86/kernel/process_64.c H. Peter Anvin            2012-02-19  717  	current->personality |= force_personality32;
05d43ed8a89c15 arch/x86/kernel/process_64.c H. Peter Anvin            2010-01-28  718  	/* Prepare the first "return" to user space */
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31 @719  	task_pt_regs(current)->orig_ax = __NR_ia32_execve;
37a8f7c38339b2 arch/x86/kernel/process_64.c Andy Lutomirski           2018-01-28  720  	current_thread_info()->status |= TS_COMPAT;
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  721  #endif
05d43ed8a89c15 arch/x86/kernel/process_64.c H. Peter Anvin            2010-01-28  722  }
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  723  
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  724  void set_personality_ia32(bool x32)
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  725  {
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  726  	/* Make sure to be in 32bit mode */
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  727  	set_thread_flag(TIF_ADDR32);
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  728  
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  729  	if (x32)
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31 @730  		__set_personality_x32();
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31 @731  	else
ada26481dfe698 arch/x86/kernel/process_64.c Dmitry Safonov            2017-03-31  732  		__set_personality_ia32();
d1a797f388d6d3 arch/x86/kernel/process_64.c H. Peter Anvin            2012-02-19 @733  }
febb72a6e4cc6c arch/x86/kernel/process_64.c Larry Finger              2012-05-06  734  EXPORT_SYMBOL_GPL(set_personality_ia32);
05d43ed8a89c15 arch/x86/kernel/process_64.c H. Peter Anvin            2010-01-28  735  
91b7bd39e62e19 arch/x86/kernel/process_64.c Ingo Molnar               2016-09-15  736  #ifdef CONFIG_CHECKPOINT_RESTORE
2eefd8789698e8 arch/x86/kernel/process_64.c Dmitry Safonov            2016-09-05  737  static long prctl_map_vdso(const struct vdso_image *image, unsigned long addr)
2eefd8789698e8 arch/x86/kernel/process_64.c Dmitry Safonov            2016-09-05  738  {
2eefd8789698e8 arch/x86/kernel/process_64.c Dmitry Safonov            2016-09-05  739  	int ret;
2eefd8789698e8 arch/x86/kernel/process_64.c Dmitry Safonov            2016-09-05  740  
2eefd8789698e8 arch/x86/kernel/process_64.c Dmitry Safonov            2016-09-05  741  	ret = map_vdso_once(image, addr);
2eefd8789698e8 arch/x86/kernel/process_64.c Dmitry Safonov            2016-09-05  742  	if (ret)
2eefd8789698e8 arch/x86/kernel/process_64.c Dmitry Safonov            2016-09-05  743  		return ret;
2eefd8789698e8 arch/x86/kernel/process_64.c Dmitry Safonov            2016-09-05  744  
2eefd8789698e8 arch/x86/kernel/process_64.c Dmitry Safonov            2016-09-05  745  	return (long)image->size;
2eefd8789698e8 arch/x86/kernel/process_64.c Dmitry Safonov            2016-09-05  746  }
91b7bd39e62e19 arch/x86/kernel/process_64.c Ingo Molnar               2016-09-15  747  #endif
2eefd8789698e8 arch/x86/kernel/process_64.c Dmitry Safonov            2016-09-05  748  
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  749  #ifdef CONFIG_ADDRESS_MASKING
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  750  
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  751  #define LAM_U57_BITS 6
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  752  
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  753  static int prctl_enable_tagged_addr(struct mm_struct *mm, unsigned long nr_bits)
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  754  {
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  755  	if (!cpu_feature_enabled(X86_FEATURE_LAM))
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  756  		return -ENODEV;
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  757  
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  758  	/* PTRACE_ARCH_PRCTL */
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  759  	if (current->mm != mm)
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  760  		return -EINVAL;
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  761  
23e5d9ec2bab53 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  762  	if (mm_valid_pasid(mm) &&
23e5d9ec2bab53 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  763  	    !test_bit(MM_CONTEXT_FORCE_TAGGED_SVA, &mm->context.flags))
fca1fdd2b0a6fc arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-04-03  764  		return -EINVAL;
23e5d9ec2bab53 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  765  
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  766  	if (mmap_write_lock_killable(mm))
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  767  		return -EINTR;
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  768  
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  769  	if (test_bit(MM_CONTEXT_LOCK_LAM, &mm->context.flags)) {
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  770  		mmap_write_unlock(mm);
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  771  		return -EBUSY;
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  772  	}
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  773  
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  774  	if (!nr_bits) {
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  775  		mmap_write_unlock(mm);
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  776  		return -EINVAL;
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  777  	} else if (nr_bits <= LAM_U57_BITS) {
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  778  		mm->context.lam_cr3_mask = X86_CR3_LAM_U57;
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  779  		mm->context.untag_mask =  ~GENMASK(62, 57);
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  780  	} else {
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  781  		mmap_write_unlock(mm);
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  782  		return -EINVAL;
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  783  	}
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  784  
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  785  	write_cr3(__read_cr3() | mm->context.lam_cr3_mask);
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  786  	set_tlbstate_lam_mode(mm);
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  787  	set_bit(MM_CONTEXT_LOCK_LAM, &mm->context.flags);
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  788  
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  789  	mmap_write_unlock(mm);
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  790  
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  791  	return 0;
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  792  }
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  793  #endif
2f8794bd087e79 arch/x86/kernel/process_64.c Kirill A. Shutemov        2023-03-12  794  
17a6e1b8e8e853 arch/x86/kernel/process_64.c Kyle Huey                 2017-03-20  795  long do_arch_prctl_64(struct task_struct *task, int option, unsigned long arg2)
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  796  {
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  797  	int ret = 0;
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  798  
dd93938a92dc06 arch/x86/kernel/process_64.c Kyle Huey                 2017-03-20  799  	switch (option) {
e696c231bebf5f arch/x86/kernel/process_64.c Chang S. Bae              2018-09-18  800  	case ARCH_SET_GS: {
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  801  		if (unlikely(arg2 >= TASK_SIZE_MAX))
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  802  			return -EPERM;
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  803  
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  804  		preempt_disable();
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  805  		/*
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  806  		 * ARCH_SET_GS has always overwritten the index
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  807  		 * and the base. Zero is the most sensible value
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  808  		 * to put in the index, and is the only value that
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  809  		 * makes any sense if FSGSBASE is unavailable.
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  810  		 */
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26 @811  		if (task == current) {
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  812  			loadseg(GS, 0);
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  813  			x86_gsbase_write_cpu_inactive(arg2);
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  814  
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  815  			/*
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  816  			 * On non-FSGSBASE systems, save_base_legacy() expects
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  817  			 * that we also fill in thread.gsbase.
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  818  			 */
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  819  			task->thread.gsbase = arg2;
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  820  
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  821  		} else {
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  822  			task->thread.gsindex = 0;
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  823  			x86_gsbase_write_task(task, arg2);
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  824  		}
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  825  		preempt_enable();
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  826  		break;
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  827  	}
e696c231bebf5f arch/x86/kernel/process_64.c Chang S. Bae              2018-09-18  828  	case ARCH_SET_FS: {
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  829  		/*
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  830  		 * Not strictly needed for %fs, but do it for symmetry
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  831  		 * with %gs
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  832  		 */
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  833  		if (unlikely(arg2 >= TASK_SIZE_MAX))
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  834  			return -EPERM;
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  835  
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  836  		preempt_disable();
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  837  		/*
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  838  		 * Set the selector to 0 for the same reason
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  839  		 * as %gs above.
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  840  		 */
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  841  		if (task == current) {
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  842  			loadseg(FS, 0);
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  843  			x86_fsbase_write_cpu(arg2);
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  844  
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  845  			/*
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  846  			 * On non-FSGSBASE systems, save_base_legacy() expects
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  847  			 * that we also fill in thread.fsbase.
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  848  			 */
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  849  			task->thread.fsbase = arg2;
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  850  		} else {
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  851  			task->thread.fsindex = 0;
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  852  			x86_fsbase_write_task(task, arg2);
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  853  		}
87ab4689ca6526 arch/x86/kernel/process_64.c Chang S. Bae              2018-11-26  854  		preempt_enable();
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  855  		break;
e696c231bebf5f arch/x86/kernel/process_64.c Chang S. Bae              2018-09-18  856  	}
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  857  	case ARCH_GET_FS: {
e696c231bebf5f arch/x86/kernel/process_64.c Chang S. Bae              2018-09-18  858  		unsigned long base = x86_fsbase_read_task(task);
17a6e1b8e8e853 arch/x86/kernel/process_64.c Kyle Huey                 2017-03-20  859  
17a6e1b8e8e853 arch/x86/kernel/process_64.c Kyle Huey                 2017-03-20  860  		ret = put_user(base, (unsigned long __user *)arg2);
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  861  		break;
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  862  	}
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  863  	case ARCH_GET_GS: {
e696c231bebf5f arch/x86/kernel/process_64.c Chang S. Bae              2018-09-18  864  		unsigned long base = x86_gsbase_read_task(task);
17a6e1b8e8e853 arch/x86/kernel/process_64.c Kyle Huey                 2017-03-20  865  
17a6e1b8e8e853 arch/x86/kernel/process_64.c Kyle Huey                 2017-03-20  866  		ret = put_user(base, (unsigned long __user *)arg2);
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  867  		break;
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  868  	}
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  869  

:::::: The code at line 624 was first introduced by commit
:::::: c063a217bc0726c2560138229de5673dbb253a02 x86/percpu: Move current_top_of_stack next to current_task

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
