Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F98218E025
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 06:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778655538; cv=none; b=srcl/i31ttN9UuMWd7I2YgbJSDunwohOhOfxqkEvO6xR7YYPahHO6k68VltnJgcyGTjJRmw3kEGQNrGkZJOWoI/O07pUrzrGOnXnnGh0e+qQRqwcvXAnzvAUxVh8pQgNO/UkSTckilp0754/KZPBsIaxD/A4TcOVhnP4ZWY/FF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778655538; c=relaxed/simple;
	bh=Yhl4tbtJ5ogwLcjHgDcVpGBQ1aZJoAPkMIYCuQ4pH88=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U89qhgt0iPIhvncWJNSHZZgWK4NSIB50++ucPvd3TyoqadN5TmFeYsHWaSagNKPVlryrYOlCsbnwqXTZE6M40jIw9hPyfAsg45XSSr6bRmljX4BUxwx4vURyn0QKdI2+xJICkBZ8eH3PY1awreb1Mep/rRM3Dhe3FPdR/x0iJe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hW/JbG2H; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hW/JbG2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778655538; x=1810191538;
  h=date:from:to:cc:subject:message-id;
  bh=Yhl4tbtJ5ogwLcjHgDcVpGBQ1aZJoAPkMIYCuQ4pH88=;
  b=hW/JbG2HwfDIJEltH8bQZRxBC/QL+kmbq6QkFHohLOfVJ3R5iw4D+FH/
   jQI6IyRezoOkLuZMGcu5rDd3i0vchxUA1iJov1aZUrGp0jyjtJafN6IWA
   VYj+PVy6bdBAIhMhMliol3oNfBAe5SHcSXrHah8EFD9KBYbWDnvv57kdY
   kJ4EZeGY6aSGrCZMTxEGwGJ7IDkvsCNiPGwMPK4H8luMf+5RXkG7P8rKh
   TZw5Kt20HrS2tIdFyzEU6i3+3vi0zQtZ2gyqJMYhDRJQBc1dJp3vzVtHx
   W8mdrP2H1cUo6CTr2MOhx+wKPaa25VAAU4M+GSulkfln9gPY4+7hx3B50
   Q==;
X-CSE-ConnectionGUID: FsJ7q/d9SKWZMoOOmVWr8g==
X-CSE-MsgGUID: yZgdMFa7QfmQP/5kno34nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97001234"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="97001234"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 23:58:58 -0700
X-CSE-ConnectionGUID: RW//HG9+Qx2WU93O932dNw==
X-CSE-MsgGUID: mLOGtkLuQEO5zdSxvGRayA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="242960479"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 May 2026 23:58:55 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN3YT-000000003bz-1lfx;
	Wed, 13 May 2026 06:58:53 +0000
Date: Wed, 13 May 2026 14:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kas:uffd/v2 9/14] fs/userfaultfd.c:268
 userfaultfd_huge_must_wait() warn: bitwise AND condition is false here
Message-ID: <202605131448.3M8vurVv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git uffd/v2
head:   0b6f87fd4809245f9eebee73f34e2fb14230330c
commit: 454b3381cb7ead65291b2d7e24c0bff62e55c41b [9/14] mm/userfaultfd: add RWP fault delivery and expose UFFDIO_REGISTER_MODE_RWP
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: powerpc-randconfig-r071-20260512 (https://download.01.org/0day-ci/archive/20260513/202605131448.3M8vurVv-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605131448.3M8vurVv-lkp@intel.com/

New smatch warnings:
fs/userfaultfd.c:268 userfaultfd_huge_must_wait() warn: bitwise AND condition is false here

Old smatch warnings:
fs/userfaultfd.c:218 userfault_msg() warn: bitwise AND condition is false here
fs/userfaultfd.c:334 userfaultfd_must_wait() warn: bitwise AND condition is false here
fs/userfaultfd.c:368 userfaultfd_must_wait() warn: bitwise AND condition is false here
fs/userfaultfd.c:1330 userfaultfd_register() warn: bitwise AND condition is false here

vim +268 fs/userfaultfd.c

86039bd3b4e6a11 Andrea Arcangeli       2015-09-04  226  
369cd2121be4405 Mike Kravetz           2017-02-22  227  #ifdef CONFIG_HUGETLB_PAGE
369cd2121be4405 Mike Kravetz           2017-02-22  228  /*
369cd2121be4405 Mike Kravetz           2017-02-22  229   * Same functionality as userfaultfd_must_wait below with modifications for
369cd2121be4405 Mike Kravetz           2017-02-22  230   * hugepmd ranges.
369cd2121be4405 Mike Kravetz           2017-02-22  231   */
369cd2121be4405 Mike Kravetz           2017-02-22  232  static inline bool userfaultfd_huge_must_wait(struct userfaultfd_ctx *ctx,
29a22b9e08d70d6 Suren Baghdasaryan     2023-06-30  233  					      struct vm_fault *vmf,
369cd2121be4405 Mike Kravetz           2017-02-22  234  					      unsigned long reason)
369cd2121be4405 Mike Kravetz           2017-02-22  235  {
29a22b9e08d70d6 Suren Baghdasaryan     2023-06-30  236  	struct vm_area_struct *vma = vmf->vma;
1e2c043628c7736 Janosch Frank          2018-07-03  237  	pte_t *ptep, pte;
369cd2121be4405 Mike Kravetz           2017-02-22  238  
29a22b9e08d70d6 Suren Baghdasaryan     2023-06-30  239  	assert_fault_locked(vmf);
1e2c043628c7736 Janosch Frank          2018-07-03  240  
29a22b9e08d70d6 Suren Baghdasaryan     2023-06-30  241  	ptep = hugetlb_walk(vma, vmf->address, vma_mmu_pagesize(vma));
1e2c043628c7736 Janosch Frank          2018-07-03  242  	if (!ptep)
c093cf451094a9a Lorenzo Stoakes        2025-11-10  243  		return true;
369cd2121be4405 Mike Kravetz           2017-02-22  244  
e6c0c03245b14d6 Christophe Leroy       2024-07-02  245  	pte = huge_ptep_get(vma->vm_mm, vmf->address, ptep);
369cd2121be4405 Mike Kravetz           2017-02-22  246  
369cd2121be4405 Mike Kravetz           2017-02-22  247  	/*
369cd2121be4405 Mike Kravetz           2017-02-22  248  	 * Lockless access: we're in a wait_event so it's ok if it
c093cf451094a9a Lorenzo Stoakes        2025-11-10  249  	 * changes under us.
c093cf451094a9a Lorenzo Stoakes        2025-11-10  250  	 */
c093cf451094a9a Lorenzo Stoakes        2025-11-10  251  
c093cf451094a9a Lorenzo Stoakes        2025-11-10  252  	/* Entry is still missing, wait for userspace to resolve the fault. */
c093cf451094a9a Lorenzo Stoakes        2025-11-10  253  	if (huge_pte_none(pte))
c093cf451094a9a Lorenzo Stoakes        2025-11-10  254  		return true;
c093cf451094a9a Lorenzo Stoakes        2025-11-10  255  	/* UFFD PTE markers require userspace to resolve the fault. */
68aa2fdbf57f769 Lorenzo Stoakes        2025-11-10  256  	if (pte_is_uffd_marker(pte))
c093cf451094a9a Lorenzo Stoakes        2025-11-10  257  		return true;
c093cf451094a9a Lorenzo Stoakes        2025-11-10  258  	/*
c093cf451094a9a Lorenzo Stoakes        2025-11-10  259  	 * If VMA has UFFD WP faults enabled and WP fault, wait for userspace to
c093cf451094a9a Lorenzo Stoakes        2025-11-10  260  	 * resolve the fault.
369cd2121be4405 Mike Kravetz           2017-02-22  261  	 */
1e2c043628c7736 Janosch Frank          2018-07-03  262  	if (!huge_pte_write(pte) && (reason & VM_UFFD_WP))
c093cf451094a9a Lorenzo Stoakes        2025-11-10  263  		return true;
454b3381cb7ead6 Kiryl Shutsemau (Meta  2026-04-18  264) 	/*
454b3381cb7ead6 Kiryl Shutsemau (Meta  2026-04-18  265) 	 * PTE is still RW-protected (protnone with uffd bit), wait for
454b3381cb7ead6 Kiryl Shutsemau (Meta  2026-04-18  266) 	 * resolution. Plain PROT_NONE without the marker is not an RWP fault.
454b3381cb7ead6 Kiryl Shutsemau (Meta  2026-04-18  267) 	 */
454b3381cb7ead6 Kiryl Shutsemau (Meta  2026-04-18 @268) 	if (pte_protnone(pte) && huge_pte_uffd(pte) && (reason & VM_UFFD_RWP))
454b3381cb7ead6 Kiryl Shutsemau (Meta  2026-04-18  269) 		return true;
c093cf451094a9a Lorenzo Stoakes        2025-11-10  270  
c093cf451094a9a Lorenzo Stoakes        2025-11-10  271  	return false;
369cd2121be4405 Mike Kravetz           2017-02-22  272  }
369cd2121be4405 Mike Kravetz           2017-02-22  273  #else
369cd2121be4405 Mike Kravetz           2017-02-22  274  static inline bool userfaultfd_huge_must_wait(struct userfaultfd_ctx *ctx,
29a22b9e08d70d6 Suren Baghdasaryan     2023-06-30  275  					      struct vm_fault *vmf,
369cd2121be4405 Mike Kravetz           2017-02-22  276  					      unsigned long reason)
369cd2121be4405 Mike Kravetz           2017-02-22  277  {
c093cf451094a9a Lorenzo Stoakes        2025-11-10  278  	/* Should never get here. */
c093cf451094a9a Lorenzo Stoakes        2025-11-10  279  	VM_WARN_ON_ONCE(1);
c093cf451094a9a Lorenzo Stoakes        2025-11-10  280  	return false;
369cd2121be4405 Mike Kravetz           2017-02-22  281  }
369cd2121be4405 Mike Kravetz           2017-02-22  282  #endif /* CONFIG_HUGETLB_PAGE */
369cd2121be4405 Mike Kravetz           2017-02-22  283  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
