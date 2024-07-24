Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4604C84
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Jul 2024 07:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721805862; cv=none; b=ddyf+y0Ubdx/C4Q/ZWxNjcL6/c2xk6e359gPJo8Rhod0aBKIzklQ832H9gsJH+MgU1FoGCJvVTrRWEgk+oyoUuwl0a89O9lS6ykfw5lakCANYRqNqHFn6a8gcIrSNMZhxjdqUqm2a+3aBzepnmys0o/+JlHh/YMfYKL3kS6NJeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721805862; c=relaxed/simple;
	bh=/ir7UuBN1659D0FPh1DwQOfpKZO8Rcq/oVC7tE+IGCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PfvKtOdh1buluztsuaJyyxQBdIWdiWS1hHzJAd1G1VtRYtDi8CcIDkv3VV0Uo5xV7RsQzgu/SIDjV6YjzLHpdVgE9V7GEpm2dEXh82/kmOGRWa4hmTXydDv1YA7Lqt0fxuo3TMQqi47FCobXI523MKqwb8P/W1+GwAcL98CbqB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXcWOF9E; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXcWOF9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721805861; x=1753341861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ir7UuBN1659D0FPh1DwQOfpKZO8Rcq/oVC7tE+IGCs=;
  b=IXcWOF9E8kZgGc6lztGmi6Xa17sBW0o9grTcilK9DnhVSRO/oi6tFfBR
   IIbnAepC4qbgsodXzSCZ7aseY2FS13c/Sy12JZs5DhzYpRwqys5Hf/Xqw
   V8aRsA0yPLrIE3Nm8jWsa7sZTI46g6fzxgN59x/nUxpzBT71eVjIc8sEw
   BT/eN2hrAZfCOzYSPZhP+k1Np6VjYV3xJef5wkAip3nHFu7sijlxTd1uE
   O8DsrBRMUTsLU/x0DSFZxqomijN4nHkFTcRU3AGURrO5jxRSgJgBvD8IE
   uslL8tc/j4tgg6E34/c+7HFienKdPUSDW+gyk0ysOPjv9gtnE6+mlR/Ly
   w==;
X-CSE-ConnectionGUID: NMGhQWDPRG+FlBh+0d72+g==
X-CSE-MsgGUID: i6/3cf4OSb+TNz17uTw5FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="41993537"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="41993537"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 00:24:12 -0700
X-CSE-ConnectionGUID: MHtbyl9cRbutiHqTZ+YXkw==
X-CSE-MsgGUID: m5YelBNdSSe1h3hHVHW8pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="52402932"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Jul 2024 00:24:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWWM3-000mlw-2E;
	Wed, 24 Jul 2024 07:24:07 +0000
Date: Wed, 24 Jul 2024 15:24:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-asm-generic:syscall-tbl-6.11 15/80]
 arch/x86/um/sys_call_table_32.c: asm/syscall_table_32.h is included more
 than once.
Message-ID: <202407241519.q5oFpdPA-lkp@intel.com>
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
head:   ece1b5ebc0b7064a8a130f64e85a81ec76381c3f
commit: 4609bed508e94483ad70aa947c86bb42f364834d [15/80] x86: rename some syscall table generation identifiers
:::::: branch date: 16 hours ago
:::::: commit date: 18 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407241519.q5oFpdPA-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/um/sys_call_table_32.c: asm/syscall_table_32.h is included more than once.

vim +32 arch/x86/um/sys_call_table_32.c

    30	
    31	#define __SYSCALL(nr, sym) extern asmlinkage long sym(unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long);
  > 32	#include <asm/syscall_table_32.h>
    33	#undef  __SYSCALL
    34	
    35	#define __SYSCALL(nr, sym) sym,
    36	const sys_call_ptr_t sys_call_table[] ____cacheline_aligned = {
  > 37	#include <asm/syscall_table_32.h>
    38	};
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
