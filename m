Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C17E0E8
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Jul 2024 09:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721295396; cv=none; b=m7oH5gPy2WYga2jq4t7jH8EbWSpzZzjBOgASbwBLf4hAJ7WfKp7vxk3aGLOnHxqfOvwlm+egM51PWFbrCs8i8BSrujlpQBd0IpPa83V1/eYkZNuFBG/gJnfyrY3y5DGJXF8npQOwU9sfeaezdyBxZTla6ed3uXiEHMrmr+F0O8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721295396; c=relaxed/simple;
	bh=0gq+9MVrICed+Sdtd1xPlI8xTNOZEpJVGT2Z7dFcDzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=twjM0DJj1EP2IXIuFTFdYGSzYpwIGvjZWvpy/X1riGR5EyDvmqoI7u38Eb34R5ArrWESNTdI2dPiyS9uImKV4c/3zU5naJp0yPWll/xfr44wG+AdBn8Gc9cYPnNnV2uCx7zwr3KAGS+oF69SCPqU9Mcr/mTcmZ59gpvqWu3K7/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGBLDSbP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGBLDSbP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721295394; x=1752831394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0gq+9MVrICed+Sdtd1xPlI8xTNOZEpJVGT2Z7dFcDzw=;
  b=XGBLDSbPtujt7tGFx6G7Qwyn/GVAyQoQ30G7PTVy/PbghUcYAOy/tC1f
   DjPTyDTwXkdZAopUGkD3ZCFq07ZwJ57i2iCSpE6vMBdQ/1uThwuQywiOB
   MoIfaZUsIEnRzxcfTdDlthZAVo725JAbdL+syZGsLORYv10pnW2GzYfF2
   0P/pM3bfLTPypBq7N069HNBgaGGVJP7FxksXxMyV9ihaVLIcV4tx6N+CB
   nB/EvVWi+yCCoO7Houn+lI6HoZ+CjqTXyQtDisifqV8GSUI/c+Pfdk+1L
   4cq5trZo5Iz4razeBiTyEMNzrNSu22+Yw34qn9ZmcPgVGjsgVSjJsbGOj
   Q==;
X-CSE-ConnectionGUID: uA35DFzWS127XlGtjwSYHA==
X-CSE-MsgGUID: fLi+yCwGStCcz/k2ymeCtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18982401"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="18982401"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 02:36:33 -0700
X-CSE-ConnectionGUID: 0sVjf+gGSuSdTDaqsHQbtQ==
X-CSE-MsgGUID: Iq4MlyH3TR+ot5HlbzzQNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="81354343"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jul 2024 02:36:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUNYs-000h7u-0g;
	Thu, 18 Jul 2024 09:36:30 +0000
Date: Thu, 18 Jul 2024 17:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-asm-generic:syscall-tbl-6.11 23/98]
 arch/arm/kernel/entry-common.S: asm/syscall_table_oabi.h is included more
 than once.
Message-ID: <202407181702.EqqoJ2p5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arch@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git syscall-tbl-6.11
head:   9a99991d90521113a738c2a4761a4147fe4b31ca
commit: 02b0dfb7563c416e57dc8fbd3958910042abc047 [23/98] arm: use generic syscall table generation
:::::: branch date: 6 days ago
:::::: commit date: 13 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407181702.EqqoJ2p5-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/arm/kernel/entry-common.S: asm/syscall_table_oabi.h is included more than once.

vim +356 arch/arm/kernel/entry-common.S

   347	
   348	/*
   349	 * This is the syscall table declaration for native ABI syscalls.
   350	 * With EABI a couple syscalls are obsolete and defined as sys_ni_syscall.
   351	 */
   352		syscall_table_start sys_call_table
   353	#ifdef CONFIG_AEABI
   354	#include <asm/syscall_table_eabi.h>
   355	#else
 > 356	#include <asm/syscall_table_oabi.h>
   357	#endif
   358		syscall_table_end sys_call_table
   359	
   360	/*============================================================================
   361	 * Special system call wrappers
   362	 */
   363	@ r0 = syscall number
   364	@ r8 = syscall table
   365	sys_syscall:
   366			bic	scno, r0, #__NR_OABI_SYSCALL_BASE
   367			cmp	scno, #__NR_syscall - __NR_SYSCALL_BASE
   368			cmpne	scno, #NR_syscalls	@ check range
   369	#ifdef CONFIG_CPU_SPECTRE
   370			movhs	scno, #0
   371			csdb
   372	#endif
   373			stmialo	sp, {r5, r6}		@ shuffle args
   374			movlo	r0, r1
   375			movlo	r1, r2
   376			movlo	r2, r3
   377			movlo	r3, r4
   378			ldrlo	pc, [tbl, scno, lsl #2]
   379			b	sys_ni_syscall
   380	ENDPROC(sys_syscall)
   381	
   382	sys_sigreturn_wrapper:
   383			add	r0, sp, #S_OFF
   384			mov	why, #0		@ prevent syscall restart handling
   385			b	sys_sigreturn
   386	ENDPROC(sys_sigreturn_wrapper)
   387	
   388	sys_rt_sigreturn_wrapper:
   389			add	r0, sp, #S_OFF
   390			mov	why, #0		@ prevent syscall restart handling
   391			b	sys_rt_sigreturn
   392	ENDPROC(sys_rt_sigreturn_wrapper)
   393	
   394	sys_statfs64_wrapper:
   395			teq	r1, #88
   396			moveq	r1, #84
   397			b	sys_statfs64
   398	ENDPROC(sys_statfs64_wrapper)
   399	
   400	sys_fstatfs64_wrapper:
   401			teq	r1, #88
   402			moveq	r1, #84
   403			b	sys_fstatfs64
   404	ENDPROC(sys_fstatfs64_wrapper)
   405	
   406	/*
   407	 * Note: off_4k (r5) is always units of 4K.  If we can't do the requested
   408	 * offset, we return EINVAL.
   409	 */
   410	sys_mmap2:
   411			str	r5, [sp, #4]
   412			b	sys_mmap_pgoff
   413	ENDPROC(sys_mmap2)
   414	
   415	#ifdef CONFIG_OABI_COMPAT
   416	
   417	/*
   418	 * These are syscalls with argument register differences
   419	 */
   420	
   421	sys_oabi_pread64:
   422			stmia	sp, {r3, r4}
   423			b	sys_pread64
   424	ENDPROC(sys_oabi_pread64)
   425	
   426	sys_oabi_pwrite64:
   427			stmia	sp, {r3, r4}
   428			b	sys_pwrite64
   429	ENDPROC(sys_oabi_pwrite64)
   430	
   431	sys_oabi_truncate64:
   432			mov	r3, r2
   433			mov	r2, r1
   434			b	sys_truncate64
   435	ENDPROC(sys_oabi_truncate64)
   436	
   437	sys_oabi_ftruncate64:
   438			mov	r3, r2
   439			mov	r2, r1
   440			b	sys_ftruncate64
   441	ENDPROC(sys_oabi_ftruncate64)
   442	
   443	sys_oabi_readahead:
   444			str	r3, [sp]
   445			mov	r3, r2
   446			mov	r2, r1
   447			b	sys_readahead
   448	ENDPROC(sys_oabi_readahead)
   449	
   450	/*
   451	 * Let's declare a second syscall table for old ABI binaries
   452	 * using the compatibility syscall entries.
   453	 */
   454		syscall_table_start sys_oabi_call_table
   455	#undef __SYSCALL_WITH_COMPAT
   456	#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
 > 457	#include <asm/syscall_table_oabi.h>
   458		syscall_table_end sys_oabi_call_table
   459	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
