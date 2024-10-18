Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37022022DD
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729262927; cv=none; b=KZSDleoaLPWS2BfaAdX4LdupDd7V0+kwrTT0ULYJ1D7RvMmbY015WfCPVqrhBei2mcpUUb8UbO5Mb4Vx8VMT8s5n2VwWcXaeTAj96vLkGvFvjjDtPoXkxsiDY8cia1l+oHWPylPJ1ncDaXXAJ4+Q+VbUx1YQvyJl0p2OX8RqNoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729262927; c=relaxed/simple;
	bh=vvb8hJAGdz0/g+qmKJU1PtCvPJar+sLDr9xcrmmB8Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qsREWFUKCFMfOLnInMM28tXeiyITSEUV7ZmUEjMGS2vI4ks29ZgUcOEauKvYWSZ0YeHpK/8F6N5mVHyGFsmYVzwOjblzyJnItD9UOz7McCsh8OmTPf8wWCz1HH19kPJcRZUTLmYnjFjU1Z2jMyrfR+fEdsOpOD1VjdV9hKz48eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYOKjhx4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYOKjhx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729262925; x=1760798925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vvb8hJAGdz0/g+qmKJU1PtCvPJar+sLDr9xcrmmB8Yw=;
  b=eYOKjhx4cSR8tA/v2njDGqgdZtv3rxMd9UJr+8W3YVqsCamWSOC7hnZ6
   eVkTHyoVnUAIEzfM9EIsHtrrYMQ25epIoOMkAJ0ahXzgGOGZfKUGF3DZO
   McgpZTrTIeV11EMEGy5KLRJnDRKPB97YvyYib+/KXMXdAsQR/TUp1WOaI
   wKs77eaIWaz3lwgN7DABxFONmUsYmK7xpPPWtCFTcICvsJrI0UENtd5wT
   OyJNjCHPTc33di+HdiW0jJS9ARSlgl2wGtqzJahCy6Sly9FVZsCLZ2GLc
   ihoYC18RasNvbi5BWJhVagZW7p44fM1vXaj2s+IsVPfcGL+hgRoh0oCOB
   A==;
X-CSE-ConnectionGUID: gk6KcK2xQTuI1Y1y1nkt8w==
X-CSE-MsgGUID: 3az86bsPRb+BlLRwGZ9pGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="46296899"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="46296899"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 07:48:45 -0700
X-CSE-ConnectionGUID: dO3MD+VMRrGpdx9dDpoUPg==
X-CSE-MsgGUID: 9RDl7PsIQxan0VDOkYegZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="83658337"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Oct 2024 07:48:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1oHR-000NwJ-1D;
	Fri, 18 Oct 2024 14:48:41 +0000
Date: Fri, 18 Oct 2024 22:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:timers/vdso 11/12] arch/powerpc/mm/pgtable-frag.c:25
 pte_frag_destroy() warn: mask and shift to zero: expr='(pte_frag & ~(~(((1)
 << 12) - 1))) >> 12'
Message-ID: <202410182245.Vi475RuM-lkp@intel.com>
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
head:   6febe0efb2df49105b839d6a3a45ab63d40f315a
commit: efe8419ae78d65e83edc31aad74b605c12e7d60c [11/12] vdso: Introduce vdso/page.h
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-r072-20241018 (https://download.01.org/0day-ci/archive/20241018/202410182245.Vi475RuM-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410182245.Vi475RuM-lkp@intel.com/

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
