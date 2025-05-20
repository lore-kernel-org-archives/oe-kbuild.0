Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916D51B7F4
	for <oe-kbuild@lists.linux.dev>; Tue, 20 May 2025 15:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756269; cv=none; b=k5WYmXWINDLOGlqv5hjpJUjATd7QKh2EnGsy0B0Ho5d9fIIq7TLAjs3GSLA0/qBf538RmljKBb6zRSogUHMzgZ2EbTtA9M3+oEr7mWtksAhM5jIEGP8xvqBrpGpOHggLpQKJXR833Cdv2HqauyVVejC08ViNufSNWymaCZ2EIOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756269; c=relaxed/simple;
	bh=J8VJWbKeTfg79l93MwRjSxJnInbyY0wt8GZYfYqnB5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hiREL6898hvJjaAjReicVniTmTymqe4x6OgH497hYBW3wabB9haJ1z0+0u16ZiLOT8QaxBHxM8GclfOJoaNAyA9Xzrd+gOlHwZcopKqgEIC8N0/Y3XD1sFM+StGijcqn4yX09eyjYim94VceMp1JdBvD3S0YftobfIrxB7YpTY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9FPUZGj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9FPUZGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747756268; x=1779292268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J8VJWbKeTfg79l93MwRjSxJnInbyY0wt8GZYfYqnB5o=;
  b=m9FPUZGjqBDrGwQAxXLKF5ukWX/zl3Xrqul3yXU5owfouj13/i48BOTa
   BKM7L37sknUKd8FAitID82wDvZJVYS5nf9wdJqCmOb9MHZUqOb6k6Gf+0
   jfVgU6AEV98JBt4WC6+4KyVBj5aiql+sUKnZfyU/iQ3ZwZxlMaCB9DbT1
   +lXcpV5RdmDF2hcTd4erMJWfxiBn17nmOLI+lHvMDbZUOuoQgnjutydF2
   E12d5DjDpZ2xJbIjv4sFZcsb5n8IKi5wOKIL66yJvR7YlR8vBFvUavUQu
   IZv4qgwAuguYoQAry3gB4zaxmPKWN+x73IBDLQNHy3dr564H8Dafan+04
   Q==;
X-CSE-ConnectionGUID: 9emTfRl/RCOgbz3o/Oyltw==
X-CSE-MsgGUID: 6a8RfaNeQk+4Qf5IZKi0KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53365793"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="53365793"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 08:51:06 -0700
X-CSE-ConnectionGUID: 7nOF5k1+QcuDH/mxR4Rrwg==
X-CSE-MsgGUID: RKvgs/zwT/OdtzkYhQTs/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="163025924"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2025 08:51:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHPF8-000NJY-1s;
	Tue, 20 May 2025 15:51:02 +0000
Date: Tue, 20 May 2025 23:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/sparse-vmemmap.c:400 vmemmap_populate_hvo() error: uninitialized
 symbol 'pte'.
Message-ID: <202505202343.IOd88OEa-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Frank van der Linden <fvdl@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a5806cd506af5a7c19bcd596e4708b5c464bfd21
commit: 9eb6207b7812cee13431831c9661d21b53f3e93f mm/sparse: add vmemmap_*_hvo functions
date:   9 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-161-20250520 (https://download.01.org/0day-ci/archive/20250520/202505202343.IOd88OEa-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505202343.IOd88OEa-lkp@intel.com/

smatch warnings:
mm/sparse-vmemmap.c:400 vmemmap_populate_hvo() error: uninitialized symbol 'pte'.

vim +/pte +400 mm/sparse-vmemmap.c

9eb6207b7812cee Frank van der Linden 2025-02-28  378  
9eb6207b7812cee Frank van der Linden 2025-02-28  379  /*
9eb6207b7812cee Frank van der Linden 2025-02-28  380   * Populate vmemmap pages HVO-style. The first page contains the head
9eb6207b7812cee Frank van der Linden 2025-02-28  381   * page and needed tail pages, the other ones are mirrors of the first
9eb6207b7812cee Frank van der Linden 2025-02-28  382   * page.
9eb6207b7812cee Frank van der Linden 2025-02-28  383   */
9eb6207b7812cee Frank van der Linden 2025-02-28  384  int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
9eb6207b7812cee Frank van der Linden 2025-02-28  385  				       int node, unsigned long headsize)
9eb6207b7812cee Frank van der Linden 2025-02-28  386  {
9eb6207b7812cee Frank van der Linden 2025-02-28  387  	pte_t *pte;
9eb6207b7812cee Frank van der Linden 2025-02-28  388  	unsigned long maddr;
9eb6207b7812cee Frank van der Linden 2025-02-28  389  
9eb6207b7812cee Frank van der Linden 2025-02-28  390  	for (maddr = addr; maddr < addr + headsize; maddr += PAGE_SIZE) {
9eb6207b7812cee Frank van der Linden 2025-02-28  391  		pte = vmemmap_populate_address(maddr, node, NULL, -1, 0);
9eb6207b7812cee Frank van der Linden 2025-02-28  392  		if (!pte)
9eb6207b7812cee Frank van der Linden 2025-02-28  393  			return -ENOMEM;
9eb6207b7812cee Frank van der Linden 2025-02-28  394  	}
9eb6207b7812cee Frank van der Linden 2025-02-28  395  
9eb6207b7812cee Frank van der Linden 2025-02-28  396  	/*
9eb6207b7812cee Frank van der Linden 2025-02-28  397  	 * Reuse the last page struct page mapped above for the rest.
9eb6207b7812cee Frank van der Linden 2025-02-28  398  	 */
9eb6207b7812cee Frank van der Linden 2025-02-28  399  	return vmemmap_populate_range(maddr, end, node, NULL,
9eb6207b7812cee Frank van der Linden 2025-02-28 @400  					pte_pfn(ptep_get(pte)), 0);
4917f55b4ef963e Joao Martins         2022-04-28  401  }
4917f55b4ef963e Joao Martins         2022-04-28  402  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
