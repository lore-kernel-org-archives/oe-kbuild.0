Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CB41D5CF4
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736193880; cv=none; b=Sl8bWzqiO95uKQxyDqJEeFtiQUtJmcY2DrfQ3skW7JzPVailGAtzYb5YYVVxmsd5PYrrA4RTQcpt2mOL4RL+O/yyf5O1C2H3vSTDmo7dkIqh5S0BWMbtLU8iswqTI43c23WVx1Tvm0kiLGVu8MMLyQm1q0JNNlLI/r7TQGXZhrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736193880; c=relaxed/simple;
	bh=CcHfl2M/WylaMR13MWZEKfd37SQYDO6VFoyXQUzNrhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WY2ymhnMU23lyybF6SU9XHnhJBwMMsiMPNLINSvRpzHwkDNSt0VFAV+y0lwoRT4d9I3AmhjJfZj/84ZRQVHz0rYsDT2csCDJr/egQlzuWNqTk6/bKw/YZSvVUJtOJl9qcrORtSe+waNI4TqM2EASwlbfZC5H0wLDS8ICGX2ZyIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZaI97/j; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZaI97/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736193879; x=1767729879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CcHfl2M/WylaMR13MWZEKfd37SQYDO6VFoyXQUzNrhE=;
  b=HZaI97/jY8/LWoxRl/9xvLvmfS2xn1Lt6MEra/SXxhfcYt/Finb63YMn
   6fzzF4n/8V/sTUlF2ciIhXKszvrQJYH9VFo4NaTDkoudxuH9rekB7fxjJ
   L2N49HzT8sNL0q+iCM7hdY3jTpXvHJ7VQde1ZZGVnEDQZSYxGZ8ivw3l3
   U5fREi369uupeqIKoMsVMGTpJrt3H696BG+ifpnSo+uDAxCSwwUKTuzPS
   rqgn4/AY7NwgY/K5C/q8RsxlWQ4W046aGwfukd2JAumL0hYeSDJWZt1OD
   rEoW/8vM8ZXZ0Z7Dnda1D+aMijKsNeYtq0ISY9UeatO1yY4NMmKqol0uy
   Q==;
X-CSE-ConnectionGUID: FcwEITmURoK8R/sZi0a0jQ==
X-CSE-MsgGUID: RMD1ShYCRP68SzDc0TUwQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36252232"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="36252232"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 12:04:37 -0800
X-CSE-ConnectionGUID: PyM0YDSoS2y/x4j60gBj3A==
X-CSE-MsgGUID: EyySaUeCSeC9mYLiYooYmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="107500081"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Jan 2025 12:04:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUtKz-000Dsh-2C;
	Mon, 06 Jan 2025 20:04:33 +0000
Date: Tue, 7 Jan 2025 04:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/mm/pgtable-frag.c:25 pte_frag_destroy() warn: mask and
 shift to zero: expr='(pte_frag & ~(~(((1) << 12) - 1))) >> 12'
Message-ID: <202501070309.WMDXDLRl-lkp@intel.com>
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
TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbfd64d25c7af3b8695201ebc85efe90be28c5a3
commit: efe8419ae78d65e83edc31aad74b605c12e7d60c vdso: Introduce vdso/page.h
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: powerpc64-randconfig-r072-20250106 (https://download.01.org/0day-ci/archive/20250107/202501070309.WMDXDLRl-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501070309.WMDXDLRl-lkp@intel.com/

smatch warnings:
arch/powerpc/mm/pgtable-frag.c:25 pte_frag_destroy() warn: mask and shift to zero: expr='(pte_frag & ~(~(((1) << 12) - 1))) >> 12'

vim +25 arch/powerpc/mm/pgtable-frag.c

a95d133c8643ca Christophe Leroy      2018-11-29  17  
a95d133c8643ca Christophe Leroy      2018-11-29  18  void pte_frag_destroy(void *pte_frag)
a95d133c8643ca Christophe Leroy      2018-11-29  19  {
a95d133c8643ca Christophe Leroy      2018-11-29  20  	int count;
4eaca96140b33e Vishal Moola (Oracle  2023-08-07  21) 	struct ptdesc *ptdesc;
a95d133c8643ca Christophe Leroy      2018-11-29  22  
4eaca96140b33e Vishal Moola (Oracle  2023-08-07  23) 	ptdesc = virt_to_ptdesc(pte_frag);
a95d133c8643ca Christophe Leroy      2018-11-29  24  	/* drop all the pending references */
a95d133c8643ca Christophe Leroy      2018-11-29 @25  	count = ((unsigned long)pte_frag & ~PAGE_MASK) >> PTE_FRAG_SIZE_SHIFT;
a95d133c8643ca Christophe Leroy      2018-11-29  26  	/* We allow PTE_FRAG_NR fragments from a PTE page */
4eaca96140b33e Vishal Moola (Oracle  2023-08-07  27) 	if (atomic_sub_and_test(PTE_FRAG_NR - count, &ptdesc->pt_frag_refcount)) {
4eaca96140b33e Vishal Moola (Oracle  2023-08-07  28) 		pagetable_pte_dtor(ptdesc);
4eaca96140b33e Vishal Moola (Oracle  2023-08-07  29) 		pagetable_free(ptdesc);
a95d133c8643ca Christophe Leroy      2018-11-29  30  	}
a95d133c8643ca Christophe Leroy      2018-11-29  31  }
a95d133c8643ca Christophe Leroy      2018-11-29  32  

:::::: The code at line 25 was first introduced by commit
:::::: a95d133c8643cae40a35f82184640d312ba9f11f powerpc/mm: Move pte_fragment_alloc() to a common location

:::::: TO: Christophe Leroy <christophe.leroy@c-s.fr>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
