Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DEC2E3365
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742042821; cv=none; b=qtdobpfN7K1NGgRpfW38P7ryC38oHKFDrOb/QKXJbrt8MT+gRV/1IsI4+gpiwMuh1JixRAoQCSvsRb3y5G/Lr/ruNJwitMxRnAPKc06vN34JSRjt8HyjRHBCT6Cpr/oUeLF7+ttxOtVF8eTPA04NPE/DaIAZFoBgeB64BGbHjCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742042821; c=relaxed/simple;
	bh=KJC7rwi5rFDsGSc6z/4dlh0BFtc7nPJeTFqZll+EI7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RfWyYniu0G2zYijR41rto4iV6bYB+vkyNbfEegAOLvyowkrkagVbOcqqHyM3tUidrzeQc7N1ZfWVPTpY2sjO2WbeAz4cWyBIDBUyNYnnzGBTxhuNHM91me+7ylhJ/lwY3yMY2XHL5An1t5mWo4Ox9OxqQz+M+pasmDYQO1bU1JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blCecZ8D; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blCecZ8D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742042819; x=1773578819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KJC7rwi5rFDsGSc6z/4dlh0BFtc7nPJeTFqZll+EI7E=;
  b=blCecZ8Du46zSSQM/sQGHvQ6vk8CS69dk+nSUyDzZTNAqUPzyCiX4XQa
   mMRkn255bB5ZVJeLTtwCJkYK9UqwrTWQoxm7W7vODceTCqXNqobyATpOt
   ZT0Hojus/DRbZhb1Lx8K0hcpqbP3BcTw+UOLjW5o6jvyZp6cql0WZ34hO
   T1LUcTTuH7/z7VmKY/fBUGJh33PrO9nF+m6D2rr5NPgBwNXqK2X/RRhBS
   RAtMk5f8Zdr4U4SLwrHi6u1YVWcw4GjQtaoOXOACcmm/wS8K2LXMgArKZ
   efYebpfdPrOeNF5itynzhbyI5IyWtS3aMxbW3lyzboI4XMMRKpN7K51k9
   Q==;
X-CSE-ConnectionGUID: pIVtBW7ST/uL1rC1Q2hxyQ==
X-CSE-MsgGUID: ir9iUoRrRzObbVj7K9NMrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="53823706"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="53823706"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 05:46:58 -0700
X-CSE-ConnectionGUID: ieHTmNXhSsSVMWDBNlV8jg==
X-CSE-MsgGUID: HHF+yZPkS0uzGGzQhJPyMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="122271164"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Mar 2025 05:46:57 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttQul-000BL5-2e;
	Sat, 15 Mar 2025 12:46:55 +0000
Date: Sat, 15 Mar 2025 20:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/7] x86/syscall/x32: Move x32 syscall table
Message-ID: <202503152029.kAWKqXSI-lkp@intel.com>
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
In-Reply-To: <20250314151220.862768-5-brgerst@gmail.com>
References: <20250314151220.862768-5-brgerst@gmail.com>
TO: Brian Gerst <brgerst@gmail.com>

Hi Brian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d08c0d55110b7cbac186e5fa94b0c6d5f4d7905e]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Gerst/x86-xen-Move-Xen-upcall-handler/20250314-231724
base:   d08c0d55110b7cbac186e5fa94b0c6d5f4d7905e
patch link:    https://lore.kernel.org/r/20250314151220.862768-5-brgerst%40gmail.com
patch subject: [PATCH v2 4/7] x86/syscall/x32: Move x32 syscall table
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503152029.kAWKqXSI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   arch/x86/entry/syscall_64.c: asm/syscalls_64.h is included more than once.
>> arch/x86/entry/syscall_64.c: asm/syscalls_x32.h is included more than once.

vim +16 arch/x86/entry/syscall_64.c

    11	
    12	#define __SYSCALL(nr, sym) extern long __x64_##sym(const struct pt_regs *);
    13	#define __SYSCALL_NORETURN(nr, sym) extern long __noreturn __x64_##sym(const struct pt_regs *);
    14	#include <asm/syscalls_64.h>
    15	#ifdef CONFIG_X86_X32_ABI
  > 16	#include <asm/syscalls_x32.h>
    17	#endif
    18	#undef  __SYSCALL
    19	
    20	#undef  __SYSCALL_NORETURN
    21	#define __SYSCALL_NORETURN __SYSCALL
    22	
    23	/*
    24	 * The sys_call_table[] is no longer used for system calls, but
    25	 * kernel/trace/trace_syscalls.c still wants to know the system
    26	 * call address.
    27	 */
    28	#define __SYSCALL(nr, sym) __x64_##sym,
    29	const sys_call_ptr_t sys_call_table[] = {
    30	#include <asm/syscalls_64.h>
    31	};
    32	#undef  __SYSCALL
    33	
    34	#define __SYSCALL(nr, sym) case nr: return __x64_##sym(regs);
    35	long x64_sys_call(const struct pt_regs *regs, unsigned int nr)
    36	{
    37		switch (nr) {
    38		#include <asm/syscalls_64.h>
    39		default: return __x64_sys_ni_syscall(regs);
    40		}
    41	};
    42	
    43	#ifdef CONFIG_X86_X32_ABI
    44	long x32_sys_call(const struct pt_regs *regs, unsigned int nr)
    45	{
    46		switch (nr) {
  > 47		#include <asm/syscalls_x32.h>
    48		default: return __x64_sys_ni_syscall(regs);
    49		}
    50	};
    51	#endif
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
