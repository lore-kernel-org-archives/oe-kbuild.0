Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B6C50279
	for <oe-kbuild@lists.linux.dev>; Mon, 13 May 2024 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715609075; cv=none; b=V9MZQlizUlM3NS1um41LZURTKC2Ss1dugxq6iTLJCx9S/g0JpZd0us6uYXMyDdUl3IwHALGl95/q8hSbGJ+1vqEwoaXsXU+DXJLbfBCnzG1nRSpI9MRm144h3HG+cYMGXN2Vbw513JKjgH5Qg/HdQXNBsC85JENzM4XlAtNGwlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715609075; c=relaxed/simple;
	bh=tyUsCC/1CNnZGvvb/EXI0/XpByE1FWCvvSYl7sWZLw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ryAF65mmDQX/x3ECKAnMsh4SmMMs2EfZIVMb+6eHQfEmvMxtrRH0ec7aYQroTMedSCBd8hqvsX9ToEjYR57N5JVzWgGzz0tZybfvWnQ2o/NYZlKrfvx3X/GQ2ggpQdOGfLHJOlFhYHtAdwrGNzpJyocdpmhN+8u6AIYbPeuhoQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccaiUdnv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccaiUdnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715609073; x=1747145073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tyUsCC/1CNnZGvvb/EXI0/XpByE1FWCvvSYl7sWZLw4=;
  b=ccaiUdnvMhHQiROSVOOGFcqVaLPLD9A6WSf/w8pcfINlNA6afF7kO7q/
   CQhX3CMjveyernokQsU79bZNJEzfrf1HleB6Z5JTN5TmGvo3sE1Zl4NCL
   sKsuX/OZoS8fJAWV4Uyvn64lqd2u/YeXPPH165YEsM4+02fAcj6HYMsfB
   6ho/MS1wB5nZi7WcJYP1gwNZ0y10LPsLTGQAgRrbGPdLN5cVpFUtTsJPf
   2DfnOAa+VEHK+F+iPTLv23pO+XucnzlnZWOcHZWcwNE9xR10H+ir1eher
   gy2UraZE55kWJHwluGkDrd1TzfNvHZ83JpW9yfFbuyrSnPF6TDGvPBNd9
   Q==;
X-CSE-ConnectionGUID: 3Stjb1PhRFKUFnDhEgO/1A==
X-CSE-MsgGUID: /5aKdwCvR3mnwJQoHj6uIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22949282"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="22949282"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 07:04:33 -0700
X-CSE-ConnectionGUID: u/98OcQzSWG0ZEOrbjTQ6A==
X-CSE-MsgGUID: 0jg1QGR4RHGjtIFppwwYAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="30387313"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 May 2024 07:04:32 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6WI1-000AAE-2T;
	Mon, 13 May 2024 14:04:29 +0000
Date: Mon, 13 May 2024 22:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-asm-generic:syscall-tbl-6.9 41/46]
 arch/x86/entry/syscall_64.c: asm/syscall_table_64.h is included more than
 once.
Message-ID: <202405132210.6Zcaw3Ag-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git syscall-tbl-6.9
head:   e0d7a2fe9b74052a280531e773ebaba59e2d523f
commit: cec850adcba9373c7518b4f84110036166db0fb6 [41/46] x86: rename some syscall table generation identifiers
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405132210.6Zcaw3Ag-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/entry/syscall_64.c: asm/syscall_table_64.h is included more than once.
--
>> arch/x86/entry/syscall_x32.c: asm/syscall_table_x32.h is included more than once.
--
>> arch/x86/um/sys_call_table_64.c: asm/syscall_table_64.h is included more than once.
--
>> arch/x86/entry/syscall_32.c: asm/syscall_table_32.h is included more than once.

vim +11 arch/x86/entry/syscall_64.c

     9	
    10	#define __SYSCALL(nr, sym) extern long __x64_##sym(const struct pt_regs *);
  > 11	#include <asm/syscall_table_64.h>
    12	#undef __SYSCALL
    13	
    14	#define __SYSCALL(nr, sym) __x64_##sym,
    15	
    16	asmlinkage const sys_call_ptr_t sys_call_table[] = {
  > 17	#include <asm/syscall_table_64.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
