Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E891381
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676967414; x=1708503414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I/5Iyqg814UCUV7TWH7F/cCnHVwsywwwRy9CKn0IbNM=;
  b=I3nEZ+XYEuto6E29TgPK89tx1L/+0enTkfA4uMqqefNNSpBTUL6unBJV
   E8OdEKXZu0eIfigwVw72xOq+Qn8AvawRTH70ZGHCYQ0Wk7C0Kt9hfSGz1
   TOXGCfJrwIJGM9RWq0A/w7TGZ91yHFuY0Q4qNFJoZX5VODkS4SBjurbof
   VzF9ZrE2D+xC75V2kmYOHphgYggC/cOoElEj9wnXZOrpBXpnv1jZNWO6/
   HWcq1n6IE8D2r/DXCsALZ2n5GijkTBgh0RU2SCkr2rQAQRxPc7GwE1idW
   8vV0UJ9pScGSCIudqG4TsgD1MB20K2GOFdLoa90EToAqBIixYUHu8RcRN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="330295948"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="330295948"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 00:16:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="814415268"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="814415268"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2023 00:16:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUNpT-000EZv-1t;
	Tue, 21 Feb 2023 08:16:51 +0000
Date: Tue, 21 Feb 2023 16:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jpoimboe:noreturn-start-kernel 27/28]
 arch/x86/kernel/doublefault_32.c:81 doublefault_shim() warn: ignoring
 unreachable code.
Message-ID: <202302211629.IPKThxKV-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git noreturn-start-kernel
head:   397ac3f03606c948ea7e0166e75be998f48899f8
commit: e2f525d08b1ac947d6db89beef1e3dc77e7825d1 [27/28] Make exc_double_fault __noreturn
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230221/202302211629.IPKThxKV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302211629.IPKThxKV-lkp@intel.com/

smatch warnings:
arch/x86/kernel/doublefault_32.c:81 doublefault_shim() warn: ignoring unreachable code.

vim +81 arch/x86/kernel/doublefault_32.c

dc4e0021b00b5a arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-26  18  
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  19  /*
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  20   * Called by double_fault with CR0.TS and EFLAGS.NT cleared.  The CPU thinks
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  21   * we're running the doublefault task.  Cannot return.
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  22   */
c29c775a554f70 arch/x86/kernel/doublefault_32.c Thomas Gleixner 2020-02-25  23  asmlinkage noinstr void __noreturn doublefault_shim(void)
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  24  {
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  25  	unsigned long cr2;
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  26  	struct pt_regs regs;
^1da177e4c3f41 arch/i386/kernel/doublefault.c   Linus Torvalds  2005-04-16  27  
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  28  	BUILD_BUG_ON(sizeof(struct doublefault_stack) != PAGE_SIZE);
^1da177e4c3f41 arch/i386/kernel/doublefault.c   Linus Torvalds  2005-04-16  29  
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  30  	cr2 = native_read_cr2();
^1da177e4c3f41 arch/i386/kernel/doublefault.c   Linus Torvalds  2005-04-16  31  
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  32  	/* Reset back to the normal kernel task. */
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  33  	force_reload_TR();
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  34  	set_df_gdt_entry(smp_processor_id());
^1da177e4c3f41 arch/i386/kernel/doublefault.c   Linus Torvalds  2005-04-16  35  
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  36  	trace_hardirqs_off();
^1da177e4c3f41 arch/i386/kernel/doublefault.c   Linus Torvalds  2005-04-16  37  
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  38  	/*
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  39  	 * Fill in pt_regs.  A downside of doing this in C is that the unwinder
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  40  	 * won't see it (no ENCODE_FRAME_POINTER), so a nested stack dump
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  41  	 * won't successfully unwind to the source of the double fault.
c29c775a554f70 arch/x86/kernel/doublefault_32.c Thomas Gleixner 2020-02-25  42  	 * The main dump from exc_double_fault() is fine, though, since it
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  43  	 * uses these regs directly.
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  44  	 *
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  45  	 * If anyone ever cares, this could be moved to asm.
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  46  	 */
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  47  	regs.ss		= TSS(ss);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  48  	regs.__ssh	= 0;
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  49  	regs.sp		= TSS(sp);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  50  	regs.flags	= TSS(flags);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  51  	regs.cs		= TSS(cs);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  52  	/* We won't go through the entry asm, so we can leave __csh as 0. */
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  53  	regs.__csh	= 0;
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  54  	regs.ip		= TSS(ip);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  55  	regs.orig_ax	= 0;
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  56  	regs.gs		= TSS(gs);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  57  	regs.__gsh	= 0;
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  58  	regs.fs		= TSS(fs);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  59  	regs.__fsh	= 0;
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  60  	regs.es		= TSS(es);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  61  	regs.__esh	= 0;
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  62  	regs.ds		= TSS(ds);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  63  	regs.__dsh	= 0;
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  64  	regs.ax		= TSS(ax);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  65  	regs.bp		= TSS(bp);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  66  	regs.di		= TSS(di);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  67  	regs.si		= TSS(si);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  68  	regs.dx		= TSS(dx);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  69  	regs.cx		= TSS(cx);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  70  	regs.bx		= TSS(bx);
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  71  
c29c775a554f70 arch/x86/kernel/doublefault_32.c Thomas Gleixner 2020-02-25  72  	exc_double_fault(&regs, 0, cr2);
^1da177e4c3f41 arch/i386/kernel/doublefault.c   Linus Torvalds  2005-04-16  73  
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  74  	/*
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  75  	 * x86_32 does not save the original CR3 anywhere on a task switch.
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  76  	 * This means that, even if we wanted to return, we would need to find
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  77  	 * some way to reconstruct CR3.  We could make a credible guess based
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  78  	 * on cpu_tlbstate, but that would be racy and would not account for
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  79  	 * PTI.
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20  80  	 */
7d8d8cfdee9a7b arch/x86/kernel/doublefault_32.c Andy Lutomirski 2019-11-20 @81  	panic("cannot return from double fault\n");
^1da177e4c3f41 arch/i386/kernel/doublefault.c   Linus Torvalds  2005-04-16  82  }
^1da177e4c3f41 arch/i386/kernel/doublefault.c   Linus Torvalds  2005-04-16  83  

:::::: The code at line 81 was first introduced by commit
:::::: 7d8d8cfdee9a7bd6f9682f253fa98efdd8048a9e x86/doublefault/32: Rewrite the x86_32 #DF handler and unify with 64-bit

:::::: TO: Andy Lutomirski <luto@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
