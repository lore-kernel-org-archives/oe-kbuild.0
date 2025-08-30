Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161FF1AF0A7
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 00:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756514575; cv=none; b=Fk8Rd3mU595x5iIEUGQ7NroV2Sgf0rWB8/eLuHva0bzlHEdsBd1tINGpmJe5u9CPui/7myzMLaPlT2vApaQSM1ySyYfnr1kLKPKJtzAgb13FraQHbhOY4iKZaJKYeduoK3xTzJmAGWJSeEoKPz70H9OlWoGbW0JbdYM1+0044Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756514575; c=relaxed/simple;
	bh=URLaZd+FH1iY3iwaVeklh6F4tXQvP8Z7e/b5yn0br7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BPNt5mehJjsF+XljXTRs0mpOeUoax7dfUMgvkG63O3l0WBanLQgiBTGbJ/yHfHePGHoDTJb9eEKpE/DzIqWChBjSPHE396uDGMYlZi/B5V6NCw8VcsboO64rILPWyNbYxEllIOEQqEBuOeqzSvg+3jEB8hcffAq9yGKRCRscQcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlwySvMy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlwySvMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756514573; x=1788050573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=URLaZd+FH1iY3iwaVeklh6F4tXQvP8Z7e/b5yn0br7M=;
  b=TlwySvMykKHu/IJxHtWf/M/76iE9YNRr/YpQIzANq/dw2LuM7it2npKN
   A+fInk5xXIs5aKfXyMuXaGRJLvBA/lQf3Afr9ItbhVih1h0gtLbjG2Y0h
   4id/iwtn+Qe/dw5SPdXeWgEnB/p7EDuOFY8TqCKgS6bON7Ky7FGN8Oo0S
   0hvZmiCN0qwmLByA+SWdfG77HGRRX1nlOzJJdO0EsThMJWSIW2ZJHzO9H
   q6/mIvzy2zzAzZsqWJkDXOgqanXBa7P6m5b1/JF8dcoGoWyZAAEZTXgUO
   92dhuxlsDCoSv3D6ucTSRNT6mmyTEgo5k+9JLC/tJGOCNhv1u+4W19aDv
   w==;
X-CSE-ConnectionGUID: UxAU0ec3SgeiCPgCKkBdMw==
X-CSE-MsgGUID: wnFT3nEbTiKH7eRUt1InOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="62624892"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="62624892"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 17:42:52 -0700
X-CSE-ConnectionGUID: SrMGDD+MQvettlTKf7lN1Q==
X-CSE-MsgGUID: 5Ws79XfFRGGa3oUPsCiw2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="174870741"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Aug 2025 17:42:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us9g4-000V5T-2k;
	Sat, 30 Aug 2025 00:42:46 +0000
Date: Sat, 30 Aug 2025 08:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/sparse-vmemmap.c:400 vmemmap_populate_hvo() error: uninitialized
 symbol 'pte'.
Message-ID: <202508300805.TlAcICwB-lkp@intel.com>
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
head:   fb679c832b6497f19fffb8274c419783909c0912
commit: 9eb6207b7812cee13431831c9661d21b53f3e93f mm/sparse: add vmemmap_*_hvo functions
date:   6 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20250829 (https://download.01.org/0day-ci/archive/20250830/202508300805.TlAcICwB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508300805.TlAcICwB-lkp@intel.com/

smatch warnings:
mm/sparse-vmemmap.c:400 vmemmap_populate_hvo() error: uninitialized symbol 'pte'.

vim +/pte +400 mm/sparse-vmemmap.c

9eb6207b7812ce Frank van der Linden 2025-02-28  378  
9eb6207b7812ce Frank van der Linden 2025-02-28  379  /*
9eb6207b7812ce Frank van der Linden 2025-02-28  380   * Populate vmemmap pages HVO-style. The first page contains the head
9eb6207b7812ce Frank van der Linden 2025-02-28  381   * page and needed tail pages, the other ones are mirrors of the first
9eb6207b7812ce Frank van der Linden 2025-02-28  382   * page.
9eb6207b7812ce Frank van der Linden 2025-02-28  383   */
9eb6207b7812ce Frank van der Linden 2025-02-28  384  int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
9eb6207b7812ce Frank van der Linden 2025-02-28  385  				       int node, unsigned long headsize)
9eb6207b7812ce Frank van der Linden 2025-02-28  386  {
9eb6207b7812ce Frank van der Linden 2025-02-28  387  	pte_t *pte;
9eb6207b7812ce Frank van der Linden 2025-02-28  388  	unsigned long maddr;
9eb6207b7812ce Frank van der Linden 2025-02-28  389  
9eb6207b7812ce Frank van der Linden 2025-02-28  390  	for (maddr = addr; maddr < addr + headsize; maddr += PAGE_SIZE) {
9eb6207b7812ce Frank van der Linden 2025-02-28  391  		pte = vmemmap_populate_address(maddr, node, NULL, -1, 0);
9eb6207b7812ce Frank van der Linden 2025-02-28  392  		if (!pte)
9eb6207b7812ce Frank van der Linden 2025-02-28  393  			return -ENOMEM;
9eb6207b7812ce Frank van der Linden 2025-02-28  394  	}
9eb6207b7812ce Frank van der Linden 2025-02-28  395  
9eb6207b7812ce Frank van der Linden 2025-02-28  396  	/*
9eb6207b7812ce Frank van der Linden 2025-02-28  397  	 * Reuse the last page struct page mapped above for the rest.
9eb6207b7812ce Frank van der Linden 2025-02-28  398  	 */
9eb6207b7812ce Frank van der Linden 2025-02-28  399  	return vmemmap_populate_range(maddr, end, node, NULL,
9eb6207b7812ce Frank van der Linden 2025-02-28 @400  					pte_pfn(ptep_get(pte)), 0);
4917f55b4ef963 Joao Martins         2022-04-28  401  }
4917f55b4ef963 Joao Martins         2022-04-28  402  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
