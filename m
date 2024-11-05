Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A7918132A
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 07:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730791154; cv=none; b=c3HgvNj9LwDDWUd05P/jueFrfcqo8CLjD0hXA2rxGntHcLKFhQHIqMvbrDeJFPFLffLyB3VMmbA1pq1HpqBdDamgORv4ff8mr9P3oM1GCk1Q2LJAqP6LMXvGPrGNDJ6JYSrJZbUpkk6MnzNYs9CPbaHIeKTTc5sAhcg2T65vtFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730791154; c=relaxed/simple;
	bh=LOad309vqyEsfnDO+ZpabjoZM0tVujVQWqgzihqbR9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ASQTA+AlHNzCFQ3gQY3pY7qencTgN43TjbHOzKTbC1+a/lfH+pNN8FB/MwIymMq+nC9llgxdWahAsSVOyCJZ+fvbVt0LWJWYZfEwnnQKNfBXqghC31smbMbXhVA5HsErGGH33b0vwZJX0wkP1QvepU1fR+jMQs9gBLiBhAEirOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHzfp0Ci; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHzfp0Ci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730791152; x=1762327152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LOad309vqyEsfnDO+ZpabjoZM0tVujVQWqgzihqbR9I=;
  b=nHzfp0Ci9Hj8zvM/xYvfcC8pkW9YEmc8N65JyT//UnHd//UvMYwAYwIv
   TVJ3VMmk3imY1VqDb7+GOTzik8F1QKvZSOgemUpNkgIYgX28zN1QV7X3j
   Sr8/biMqXXHeVU0HHFeeVO+xDP67DRF3KJSvmnDeBklxc2suHkxOA0Fxh
   JsmOPYhfyoPCApBNT/AQZ6AaiWcgl9fkUkUdbrDHiEnV1CesYOFsATFjW
   uVI7sW5Zwl4YECbrqxesME4jTUDe/TWM2d+a3iFxkT8OI4ep8nEeG1lhS
   zW9+A+yn3Hi3ev6JJ0AiiodNJswGl0BoT/AxOXCDSH8dxFvJM1Bx93CgK
   Q==;
X-CSE-ConnectionGUID: XM29biDqRzyMlS2c8t8ISg==
X-CSE-MsgGUID: yHjsoc+8SpaC7wpbM+N2TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34209897"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34209897"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 23:19:12 -0800
X-CSE-ConnectionGUID: GlRwTiV2Rhmn3O0z8uGDmA==
X-CSE-MsgGUID: 2QixOWAdQ6qctFAo9PPbXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83799412"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2024 23:19:11 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8DqG-000lkT-1K;
	Tue, 05 Nov 2024 07:19:08 +0000
Date: Tue, 5 Nov 2024 15:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:timers/vdso 11/42] arch/powerpc/mm/pgtable-frag.c:25
 pte_frag_destroy() warn: mask and shift to zero: expr='(pte_frag & ~(~(((1)
 << 12) - 1))) >> 12'
Message-ID: <202411051527.wNrHvEGw-lkp@intel.com>
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
CC: x86@kernel.org
TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
head:   7fa3c36ea2707c495cf31ccab733ac8bf3f9d0c2
commit: efe8419ae78d65e83edc31aad74b605c12e7d60c [11/42] vdso: Introduce vdso/page.h
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: powerpc64-randconfig-r071-20241104 (https://download.01.org/0day-ci/archive/20241105/202411051527.wNrHvEGw-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411051527.wNrHvEGw-lkp@intel.com/

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
