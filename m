Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D84E226D17
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 04:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765255034; cv=none; b=gM1Fmjpu0Qsi1UUvCAienSR1MZvMIf4P56nF85uXbMgPReRnBuk2/W7kEdYnS6Cgjg4OYWUj7a4h3sZsfpByuGLccIlbj6t6SB2ir5p0VOXpwAwNKQ8yHrGAx6Nj+oHiDFFcg45SktixLvnH41mdtpOdAMla0pA/6K1k6rL05z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765255034; c=relaxed/simple;
	bh=YPzYwb6y53XU0HocmQ1nmfOuqYWzE0nt+RdkVdlc3Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iWMTTQjSzQ9n3r+0aOlAOZ57oPAl2f4Odee/sV/18Km2Uk01XhoHF/o2QtNuk/WncR0CInUQiT3yY9bVYDCvVm0ff5oIRjXpFLzMeKRWATR9+jlbK07IUFYgznB1EAzyBMxDTetBAi6UsOQPR/5CO5vBG+a6uXIwFYXUV+r6Cc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJPOlHzw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJPOlHzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765255032; x=1796791032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YPzYwb6y53XU0HocmQ1nmfOuqYWzE0nt+RdkVdlc3Yc=;
  b=GJPOlHzwlH+WEbe7iSj3H18x2MJTU6Q8E+uOX+6AD+BmG3Hv5mg+dDde
   Bbeqbjp+mVXOrQUuMCVpJF+1t12+V1RQrxB8SnGwoLDw89kpYFrNVVgqg
   P3aXi5wTJPYSUgMaEs2L2xH2ZNRcbxQBCf8skcK2++45WX7h0zVgXQVvj
   1o0Ks9bc+jBZ8ZXc5RVLRXp0tF/shOyROdKC3i6mRhzIDQ4OVvYgzrmgQ
   gd6lFV2V9Vg24Ccr1/4xNmFpQCeVjyLvxrReMcz+usHxtZI5B+ajAGXr6
   FqD+Yv7MJyvw/sFcTWUqPMtJp+1vO0htkZgKS1YWafVcMEbqny3lxrW7g
   Q==;
X-CSE-ConnectionGUID: te83PJMwTv2K2S5keFTUzg==
X-CSE-MsgGUID: cIyhsWDFS+uDm0vm/Mr2Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77824294"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="77824294"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 20:37:11 -0800
X-CSE-ConnectionGUID: LbgbNAyKTJyP/rApjqamIA==
X-CSE-MsgGUID: fWf7oYYjRBa/jL3lQBVA/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="201236771"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Dec 2025 20:37:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSpTH-000000001Jp-3C5T;
	Tue, 09 Dec 2025 04:37:07 +0000
Date: Tue, 9 Dec 2025 12:36:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/sparse-vmemmap.c:400 vmemmap_populate_hvo() error: uninitialized
 symbol 'pte'.
Message-ID: <202512091213.DKfu3rVr-lkp@intel.com>
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
head:   cfd4039213e7b5a828c5b78e1b5235cac91af53d
commit: 9eb6207b7812cee13431831c9661d21b53f3e93f mm/sparse: add vmemmap_*_hvo functions
date:   9 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20251209 (https://download.01.org/0day-ci/archive/20251209/202512091213.DKfu3rVr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512091213.DKfu3rVr-lkp@intel.com/

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
