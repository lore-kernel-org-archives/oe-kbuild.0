Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088A93EA6C
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jul 2024 06:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721371692; cv=none; b=i9FvchOg0u8lFeidBfQAdfuSbZE15fzqumqC981PYjRJgREvXX9JfTZdOZLR5BBREqU1fhRzyNAis4SVg6NSjvS9xi3hLlOQQjZ0fgWXgvqSoFHizCzsqqNoHe6JP4iHv0md4SMcvXL6P1RQwI+B8k5VceshTMomQz6vWHh/tdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721371692; c=relaxed/simple;
	bh=A/6YVAmNdtpfEX8vw7vWEODr6N6JSSHz2HLCUMfeaf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ugzo2WnjK0sJHSFeIEkF9NNjCiSNxxRTNhsuj3mhotF/aonblfrZ3FcYRvRWc4rieGb+C2xPL5b5W8InaW6MmyEuxqe8JTz777i5LNnRIjuJYv3w5evbI00REso0eRYFyrnghxwoA9DA8c5V7Li1qEfJWIktIOa/9W9kSqjdtl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4uiIuhe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4uiIuhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721371691; x=1752907691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A/6YVAmNdtpfEX8vw7vWEODr6N6JSSHz2HLCUMfeaf4=;
  b=H4uiIuhej+w5xj/xmKOhS7nvN4g791foLsw7G5+e6m6xfqoLQ5ytByH0
   pVGAD43TOqBzMYWf7H244pJ+mK78WrDQdRyxQUpobgzYmkh4EGwLmGnF4
   uE7WjmDFPQA5LaZ2ojFXdfYI14skuBLTpwT1EpYSPdoUeung33ouWzrYV
   Tc4uMvWyIw3z4SFNQ1WeW3/252E1nTyheL+Bjjke9Aan7SOQ6gN5IaqpE
   2JwY6taGzzwlUPqnAdJLvu+dC0f/KkwIsmTO/pUdhRk1lnUQJ4Lpj63nf
   nTukJGJSlv74gsb9RIB42IbqGl33859ZgqMYYMdLqXDkHrhMInlqiIFMe
   w==;
X-CSE-ConnectionGUID: CABWROUmSDmHjt+c4tqSfQ==
X-CSE-MsgGUID: Jh0Fxw6JTiKZaiwRZFmckQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="21873873"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="21873873"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 23:48:10 -0700
X-CSE-ConnectionGUID: yW0x8ZhmRtq8dNifoL1iyw==
X-CSE-MsgGUID: 22mf3PK8T8ekTagb+07qTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="88520162"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2024 23:48:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUhPS-000hwN-0O;
	Fri, 19 Jul 2024 06:48:06 +0000
Date: Fri, 19 Jul 2024 14:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-asm-generic:syscall-tbl-6.11 81/98]
 arch/powerpc/kernel/systbl.c: asm/syscall_table_64.h is included more than
 once.
Message-ID: <202407191441.ju1QSbU8-lkp@intel.com>
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
commit: 895267a916ccea4816ebf852ee2fd278a705a18e [81/98] powerpc: use non-conflicting syscall function names
:::::: branch date: 7 days ago
:::::: commit date: 13 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407191441.ju1QSbU8-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   arch/powerpc/kernel/systbl.c: asm/syscall_table_32.h is included more than once.
>> arch/powerpc/kernel/systbl.c: asm/syscall_table_64.h is included more than once.

vim +25 arch/powerpc/kernel/systbl.c

    20	
    21	#undef __SYSCALL
    22	#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
    23	#define __SYSCALL(nr, entry)      asmlinkage long __powerpc_##entry(const struct pt_regs *);
    24	#ifdef CONFIG_PPC64
  > 25	#include <asm/syscall_table_64.h>
    26	#else
    27	#include <asm/syscall_table_32.h>
    28	#endif
    29	#undef __SYSCALL
    30	#define __SYSCALL(nr, entry) [nr] = __powerpc_##entry,
    31	#else
    32	/*
    33	 * Coerce syscall handlers with arbitrary parameters to common type
    34	 * requires cast to void* to avoid -Wcast-function-type.
    35	 */
    36	#define __SYSCALL(nr, entry) [nr] = (void *) entry,
    37	#endif
    38	
    39	const syscall_fn sys_call_table[] = {
    40	#ifdef CONFIG_PPC64
  > 41	#include <asm/syscall_table_64.h>
    42	#else
    43	#include <asm/syscall_table_32.h>
    44	#endif
    45	};
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
