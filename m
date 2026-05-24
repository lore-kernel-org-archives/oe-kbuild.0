Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F363274B3B
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 02:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779591083; cv=none; b=jo+uSi/0azx+OrBPC+fYf9rfevoZM/Tpb52mVTUMG7cXlb5n3EokyC066wEGMaWrhIWpBmZEkKqThfihF+Qd2giSNDS7vqK1IygP/PK7251pOIuZ8AkB1o11lpRn2QIDI+6yY/dFNiq96y18yCVK28PtJeyDqLMBglvs2GzVwHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779591083; c=relaxed/simple;
	bh=3+Hlpr9UhqDm6Iir1eYNeQjRugdx21LPcO50nrrFlbs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VUmApdyWkmuL2gl/HfVQLw5//a2jm/9AKO2Sh+KpB7ANoIjXlu+0hmSTGuVJIqsANwjuRvh913qVyROc/9Z9Zats+oCm7HkZvs2CK/PB1Y3OrexcDR4aFAF64mUWb0Jv2Fg4uqzcex6Ton6G3ApeLBpIo0x+LT6YRrYrBLWFmIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArCkS23S; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArCkS23S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779591080; x=1811127080;
  h=date:from:to:cc:subject:message-id;
  bh=3+Hlpr9UhqDm6Iir1eYNeQjRugdx21LPcO50nrrFlbs=;
  b=ArCkS23S3dfhhvZwLxhEohy3BICfsOzDqr/hiDTo6G3hc5pXiKVUC3R3
   GIuIbi0G6oDfmU+yCDmui6mFIvce1DcSXRbsMdqpiaZcOehFHtG6TA2qJ
   0Pb2PAr8UOVRT6Dz2yN6JkWwW3Dt4tT/36GiiWO67aJVWeCvE32Xxxsfy
   z3asDBynYICRyfz9CC6D1FAajdYG8L0ngob75s0lhW8vzfsOqxX3azhOz
   m5myRiJB+qq7ZK/GR9+JlnbpTS/S+tNDqrwCYTakzhILDp932ZNZjmtx5
   QGgul3DlXQbJxlnRJX5rDr+ryV26SvkgW6TWhc3IHgAFNBSGAjSvAn4+1
   Q==;
X-CSE-ConnectionGUID: hqar/vTnRwOfJObReuzeQg==
X-CSE-MsgGUID: eVqNsy/eQEKB+0gwjw+jSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="84316776"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="84316776"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 19:51:19 -0700
X-CSE-ConnectionGUID: zMMTtKruScWGBp685ufThg==
X-CSE-MsgGUID: z2UPJVraQ92vl0/uhkVcMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="238703931"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 May 2026 19:51:17 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQyvq-000000000dB-3zw4;
	Sun, 24 May 2026 02:51:14 +0000
Date: Sun, 24 May 2026 10:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rppt:uffd/merge+rwp 11/16] mm/userfaultfd.c:2654
 userfaultfd_huge_must_wait() warn: bitwise AND condition is false here
Message-ID: <202605241059.0s22N3oE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Mike Rapoport <rppt@kernel.org>
TO: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd/merge+rwp
head:   4acb6751ddb876e82b41ca0f81f7cb7b0bc08741
commit: 4184d5b897b847dfb2cdbf4a732a0f894e72de8e [11/16] mm/userfaultfd: add RWP fault delivery and expose UFFDIO_REGISTER_MODE_RWP
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-r071-20260524 (https://download.01.org/0day-ci/archive/20260524/202605241059.0s22N3oE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605241059.0s22N3oE-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:2654 userfaultfd_huge_must_wait() warn: bitwise AND condition is false here
mm/userfaultfd.c:2720 userfaultfd_must_wait() warn: bitwise AND condition is false here

vim +2654 mm/userfaultfd.c

aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2612) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2613) #ifdef CONFIG_HUGETLB_PAGE
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2614) /*
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2615)  * Same functionality as userfaultfd_must_wait below with modifications for
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2616)  * hugepmd ranges.
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2617)  */
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2618) static inline bool userfaultfd_huge_must_wait(struct userfaultfd_ctx *ctx,
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2619) 					      struct vm_fault *vmf,
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2620) 					      unsigned long reason)
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2621) {
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2622) 	struct vm_area_struct *vma = vmf->vma;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2623) 	pte_t *ptep, pte;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2624) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2625) 	assert_fault_locked(vmf);
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2626) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2627) 	ptep = hugetlb_walk(vma, vmf->address, vma_mmu_pagesize(vma));
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2628) 	if (!ptep)
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2629) 		return true;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2630) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2631) 	pte = huge_ptep_get(vma->vm_mm, vmf->address, ptep);
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2632) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2633) 	/*
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2634) 	 * Lockless access: we're in a wait_event so it's ok if it
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2635) 	 * changes under us.
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2636) 	 */
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2637) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2638) 	/* Entry is still missing, wait for userspace to resolve the fault. */
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2639) 	if (huge_pte_none(pte))
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2640) 		return true;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2641) 	/* UFFD PTE markers require userspace to resolve the fault. */
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2642) 	if (pte_is_uffd_marker(pte))
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2643) 		return true;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2644) 	/*
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2645) 	 * If VMA has UFFD WP faults enabled and WP fault, wait for userspace to
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2646) 	 * resolve the fault.
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2647) 	 */
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2648) 	if (!huge_pte_write(pte) && (reason & VM_UFFD_WP))
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2649) 		return true;
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2650) 	/*
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2651) 	 * PTE is still RW-protected (protnone with uffd bit), wait for
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2652) 	 * resolution. Plain PROT_NONE without the marker is not an RWP fault.
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2653) 	 */
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22 @2654) 	if (pte_protnone(pte) && huge_pte_uffd(pte) && (reason & VM_UFFD_RWP))
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2655) 		return true;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2656) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2657) 	return false;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2658) }
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2659) #else
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2660) static inline bool userfaultfd_huge_must_wait(struct userfaultfd_ctx *ctx,
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2661) 					      struct vm_fault *vmf,
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2662) 					      unsigned long reason)
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2663) {
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2664) 	/* Should never get here. */
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2665) 	VM_WARN_ON_ONCE(1);
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2666) 	return false;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2667) }
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2668) #endif /* CONFIG_HUGETLB_PAGE */
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2669) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2670) /*
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2671)  * Verify the pagetables are still not ok after having registered into
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2672)  * the fault_pending_wqh to avoid userland having to UFFDIO_WAKE any
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2673)  * userfault that has already been resolved, if userfaultfd_read_iter and
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2674)  * UFFDIO_COPY|ZEROPAGE are being run simultaneously on two different
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2675)  * threads.
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2676)  */
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2677) static inline bool userfaultfd_must_wait(struct userfaultfd_ctx *ctx,
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2678) 					 struct vm_fault *vmf,
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2679) 					 unsigned long reason)
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2680) {
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2681) 	struct mm_struct *mm = ctx->mm;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2682) 	unsigned long address = vmf->address;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2683) 	pgd_t *pgd;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2684) 	p4d_t *p4d;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2685) 	pud_t *pud;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2686) 	pmd_t *pmd, _pmd;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2687) 	pte_t *pte;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2688) 	pte_t ptent;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2689) 	bool ret;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2690) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2691) 	assert_fault_locked(vmf);
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2692) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2693) 	pgd = pgd_offset(mm, address);
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2694) 	if (!pgd_present(*pgd))
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2695) 		return true;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2696) 	p4d = p4d_offset(pgd, address);
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2697) 	if (!p4d_present(*p4d))
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2698) 		return true;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2699) 	pud = pud_offset(p4d, address);
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2700) 	if (!pud_present(*pud))
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2701) 		return true;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2702) 	pmd = pmd_offset(pud, address);
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2703) again:
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2704) 	_pmd = pmdp_get_lockless(pmd);
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2705) 	if (pmd_none(_pmd))
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2706) 		return true;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2707) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2708) 	/*
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2709) 	 * A race could arise which would result in a softleaf entry such as
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2710) 	 * migration entry unexpectedly being present in the PMD, so explicitly
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2711) 	 * check for this and bail out if so.
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2712) 	 */
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2713) 	if (!pmd_present(_pmd))
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2714) 		return false;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2715) 
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2716) 	if (pmd_trans_huge(_pmd)) {
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2717) 		if (!pmd_write(_pmd) && (reason & VM_UFFD_WP))
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2718) 			return true;
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2719) 		if (pmd_protnone(_pmd) && pmd_uffd(_pmd) &&
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22 @2720) 		    (reason & VM_UFFD_RWP))
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2721) 			return true;
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2722) 		return false;
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2723) 	}
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2724) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2725) 	pte = pte_offset_map(pmd, address);
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2726) 	if (!pte)
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2727) 		goto again;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2728) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2729) 	/*
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2730) 	 * Lockless access: we're in a wait_event so it's ok if it
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2731) 	 * changes under us.
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2732) 	 */
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2733) 	ptent = ptep_get(pte);
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2734) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2735) 	ret = true;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2736) 	/* Entry is still missing, wait for userspace to resolve the fault. */
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2737) 	if (pte_none(ptent))
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2738) 		goto out;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2739) 	/* UFFD PTE markers require userspace to resolve the fault. */
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2740) 	if (pte_is_uffd_marker(ptent))
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2741) 		goto out;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2742) 	/*
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2743) 	 * If VMA has UFFD WP faults enabled and WP fault, wait for userspace to
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2744) 	 * resolve the fault.
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2745) 	 */
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2746) 	if (!pte_write(ptent) && (reason & VM_UFFD_WP))
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2747) 		goto out;
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2748) 	/*
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2749) 	 * PTE is still RW-protected (protnone with uffd bit), wait for
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2750) 	 * userspace to resolve. Plain PROT_NONE without the marker is not
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2751) 	 * an RWP fault.
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2752) 	 */
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2753) 	if (pte_protnone(ptent) && pte_uffd(ptent) && (reason & VM_UFFD_RWP))
4184d5b897b847d Kiryl Shutsemau (Meta     2026-05-22  2754) 		goto out;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2755) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2756) 	ret = false;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2757) out:
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2758) 	pte_unmap(pte);
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2759) 	return ret;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2760) }
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2761) 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
