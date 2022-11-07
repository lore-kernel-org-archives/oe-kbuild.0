Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E099228E2
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Nov 2022 07:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667805932; x=1699341932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iM9i0DtdCGFrrI7MtkxjghocFaiS4FtLjjUAUCmGrp8=;
  b=bTdm3vhoF8KI5NkgVRHiZA3x9fwFNzClEAxKwgqi3YLOsjudVzIXV+tr
   +7jLTpXaBOOS4ADrBmQPjA6zaJQHrUlU7JFDOR+XMqzS22i8OqsSHBCaS
   OURSToJnG9L+yDrLmfGHwSl2G2y9Tv3L+BIe4oIYgwCac0JxV8OjDUvJo
   MFL74A1ENVeDpVNylbbQApEgPjd215peDMFT6eqTphUCmC8sAweRsIH8m
   9qNhMx6cfZb7RlvHF7y/CB7sRB9ciIm7D6A8G5EjPHx9p6CR+kAz0iN/C
   sYNyXLad7n2/B5Qa6AX7OLPpbxvqsEJEuTSaOj+qBLjpgoVqTtpBAy03J
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="297836888"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="297836888"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2022 23:25:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="613767299"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="613767299"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Nov 2022 23:25:31 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1orwVe-0000QK-2r;
	Mon, 07 Nov 2022 07:25:30 +0000
Date: Mon, 7 Nov 2022 15:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/kernel/stacktrace.c:163:1: warning: Label 'here' is not
 used. There is #if in function body so the label might be used in code that
 is removed by the preprocessor. [unusedLabelConfiguration]
Message-ID: <202211071531.om5DP1OP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm/kernel/stacktrace.c:163:1: warning: Label 'here' is not used. There is #if in function body so the label might be used in code that is removed by the preprocessor. [unusedLabelConfiguration]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0c4d9fc9cc9462659728d168387191387e903cc
commit: c46c2c9b43f4f08f20dc06417fbf7091e4ca6d34 ARM: unwind: set frame.pc correctly for current-thread unwinding
date:   8 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c46c2c9b43f4f08f20dc06417fbf7091e4ca6d34
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm/mm/fault.c:529:28: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    if (!inf->fn(addr, fsr & ~FSR_LNX_PF, regs))
                              ^
   arch/arm/mm/fault.c:559:28: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    if (!inf->fn(addr, ifsr | FSR_LNX_PF, regs))
                              ^
>> arch/arm/mm/fault.c:529:28: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
    if (!inf->fn(addr, fsr & ~FSR_LNX_PF, regs))
                              ^
   arch/arm/mm/fault.c:559:28: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
    if (!inf->fn(addr, ifsr | FSR_LNX_PF, regs))
                              ^
   arch/arm/mm/fault.c:269:12: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    if (fsr & FSR_LNX_PF) {
              ^
   arch/arm/mm/fault.c:269:12: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
    if (fsr & FSR_LNX_PF) {
              ^
--
>> arch/arm/kernel/stacktrace.c:163:1: warning: Label 'here' is not used. There is #if in function body so the label might be used in code that is removed by the preprocessor. [unusedLabelConfiguration]
   here:
   ^
   arch/arm/kernel/stacktrace.c:133:61: warning: Parameter 'tsk' can be declared as pointer to const [constParameter]
   static noinline void __save_stack_trace(struct task_struct *tsk,
                                                               ^
--
>> arch/arm/kernel/return_address.c:44:1: warning: Label 'here' is not used. There is #if in function body so the label might be used in code that is removed by the preprocessor. [unusedLabelConfiguration]
   here:
   ^

vim +/here +163 arch/arm/kernel/stacktrace.c

f16fb1ecc5a1cb Russell King          2007-04-28  131  
3683f44c42e991 Russell King          2014-05-03  132  /* This must be noinline to so that our skip calculation works correctly */
3683f44c42e991 Russell King          2014-05-03  133  static noinline void __save_stack_trace(struct task_struct *tsk,
3683f44c42e991 Russell King          2014-05-03  134  	struct stack_trace *trace, unsigned int nosched)
f16fb1ecc5a1cb Russell King          2007-04-28  135  {
f16fb1ecc5a1cb Russell King          2007-04-28  136  	struct stack_trace_data data;
2d7c11bfc91637 Catalin Marinas       2009-02-11  137  	struct stackframe frame;
f16fb1ecc5a1cb Russell King          2007-04-28  138  
f16fb1ecc5a1cb Russell King          2007-04-28  139  	data.trace = trace;
f16fb1ecc5a1cb Russell King          2007-04-28  140  	data.skip = trace->skip;
3683f44c42e991 Russell King          2014-05-03  141  	data.no_sched_functions = nosched;
f76e9154736e9a Nicolas Pitre         2008-04-24  142  
f76e9154736e9a Nicolas Pitre         2008-04-24  143  	if (tsk != current) {
f76e9154736e9a Nicolas Pitre         2008-04-24  144  #ifdef CONFIG_SMP
f76e9154736e9a Nicolas Pitre         2008-04-24  145  		/*
d5996b2ff0e26c Russell King          2011-01-15  146  		 * What guarantees do we have here that 'tsk' is not
d5996b2ff0e26c Russell King          2011-01-15  147  		 * running on another CPU?  For now, ignore it as we
d5996b2ff0e26c Russell King          2011-01-15  148  		 * can't guarantee we won't explode.
f76e9154736e9a Nicolas Pitre         2008-04-24  149  		 */
d5996b2ff0e26c Russell King          2011-01-15  150  		return;
f76e9154736e9a Nicolas Pitre         2008-04-24  151  #else
2d7c11bfc91637 Catalin Marinas       2009-02-11  152  		frame.fp = thread_saved_fp(tsk);
2d7c11bfc91637 Catalin Marinas       2009-02-11  153  		frame.sp = thread_saved_sp(tsk);
2d7c11bfc91637 Catalin Marinas       2009-02-11  154  		frame.lr = 0;		/* recovered from the stack */
2d7c11bfc91637 Catalin Marinas       2009-02-11  155  		frame.pc = thread_saved_pc(tsk);
f76e9154736e9a Nicolas Pitre         2008-04-24  156  #endif
f76e9154736e9a Nicolas Pitre         2008-04-24  157  	} else {
3683f44c42e991 Russell King          2014-05-03  158  		/* We don't want this function nor the caller */
3683f44c42e991 Russell King          2014-05-03  159  		data.skip += 2;
2d7c11bfc91637 Catalin Marinas       2009-02-11  160  		frame.fp = (unsigned long)__builtin_frame_address(0);
74dbeee0fcded9 Behan Webster         2014-09-27  161  		frame.sp = current_stack_pointer;
2d7c11bfc91637 Catalin Marinas       2009-02-11  162  		frame.lr = (unsigned long)__builtin_return_address(0);
c46c2c9b43f4f0 Russell King (Oracle  2022-03-09 @163) here:
c46c2c9b43f4f0 Russell King (Oracle  2022-03-09  164) 		frame.pc = (unsigned long)&&here;
f76e9154736e9a Nicolas Pitre         2008-04-24  165  	}
fed240d9c97438 Masami Hiramatsu      2021-10-21  166  #ifdef CONFIG_KRETPROBES
fed240d9c97438 Masami Hiramatsu      2021-10-21  167  	frame.kr_cur = NULL;
fed240d9c97438 Masami Hiramatsu      2021-10-21  168  	frame.tsk = tsk;
fed240d9c97438 Masami Hiramatsu      2021-10-21  169  #endif
f16fb1ecc5a1cb Russell King          2007-04-28  170  
2d7c11bfc91637 Catalin Marinas       2009-02-11  171  	walk_stackframe(&frame, save_trace, &data);
f76e9154736e9a Nicolas Pitre         2008-04-24  172  }
f76e9154736e9a Nicolas Pitre         2008-04-24  173  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
