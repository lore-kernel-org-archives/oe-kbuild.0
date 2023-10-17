Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD7CA50
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Oct 2023 05:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSqIs/5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697519710; x=1729055710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=srgys6fPkQrNdsjPf0HvvY3zGN0slImPf5xFgSWgZPw=;
  b=GSqIs/5YVoQk0Uk8JD2BJaSc7EmroTfnK6K09zxs13Dzhb6MNLVmD9d1
   bA59ARfEFzux+79Jw/0j8ag2gMGkD8LQP/xhgUoQNBGUFGliMg4lunMGp
   p7NGT/lqys9/7GHLrb4gBj4SzADz9AWF3U1rwMZ+MGlTt3pDfUXfbtfVI
   HLrrdJCyX6gRvGeOKOvzBS/HPyZDjX5ymuaToBFcVW0UqZt5see+gINgK
   AE51kqzZ5szxq1PoUCCFeQF8hNhty5e1Zxoy2dBkculxL3DLNNWblcjZd
   gyv5Czd6Cv0zdKocV9Ql7gWv3W8zCDBTz7O0DvD3TrH6CkFKJlpAThwqN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="384577390"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="384577390"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 22:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="749534713"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="749534713"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Oct 2023 22:15:07 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qscQ5-000934-1m;
	Tue, 17 Oct 2023 05:15:05 +0000
Date: Tue, 17 Oct 2023 13:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/mm/pgtable.c:305 pgd_prepopulate_pmd() warn: we never enter
 this loop
Message-ID: <202310171313.bwg3FhqC-lkp@intel.com>
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
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
commit: 25226df4b9be7f6d5d722af5b75e86e76e5c3a80 mm/pgtable: Fix multiple -Wstringop-overflow warnings
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231017/202310171313.bwg3FhqC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171313.bwg3FhqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310171313.bwg3FhqC-lkp@intel.com/

New smatch warnings:
arch/x86/mm/pgtable.c:305 pgd_prepopulate_pmd() warn: we never enter this loop

Old smatch warnings:
arch/x86/mm/pgtable.c:281 pgd_mop_up_pmds() warn: we never enter this loop

vim +305 arch/x86/mm/pgtable.c

4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  295  
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  296  static void pgd_prepopulate_pmd(struct mm_struct *mm, pgd_t *pgd, pmd_t *pmds[])
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  297  {
e0c4f6750e1305 Kirill A. Shutemov  2017-03-13  298  	p4d_t *p4d;
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  299  	pud_t *pud;
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  300  	int i;
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  301  
e0c4f6750e1305 Kirill A. Shutemov  2017-03-13  302  	p4d = p4d_offset(pgd, 0);
e0c4f6750e1305 Kirill A. Shutemov  2017-03-13  303  	pud = pud_offset(p4d, 0);
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  304  
73b44ff43c4b3c Wanpeng Li          2013-07-08 @305  	for (i = 0; i < PREALLOCATED_PMDS; i++, pud++) {
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  306  		pmd_t *pmd = pmds[i];
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  307  
68db065c845bd9 Jeremy Fitzhardinge 2008-03-17  308  		if (i >= KERNEL_PGD_BOUNDARY)
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  309  			memcpy(pmd, (pmd_t *)pgd_page_vaddr(swapper_pg_dir[i]),
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  310  			       sizeof(pmd_t) * PTRS_PER_PMD);
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  311  
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  312  		pud_populate(mm, pud, pmd);
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  313  	}
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  314  }
1ec1fe73dfb711 Ingo Molnar         2008-03-19  315  

:::::: The code at line 305 was first introduced by commit
:::::: 73b44ff43c4b3cf517826da03c51948593f88753 mm/pgtable: don't accumulate addr during pgd prepopulate pmd

:::::: TO: Wanpeng Li <liwanp@linux.vnet.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
