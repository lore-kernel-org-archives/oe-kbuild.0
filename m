Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353447485
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 22:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729291994; cv=none; b=gNQ7DXapaTD4KuN00kxAd29gUirIvWnk9cZWC0f1Bcz1lppy9kOtOqsTc1Gq+nNXPu9L3pg3OjmWcCjWgzibGplIfXvn+eTooWm/Xgy5RiKqOdtw7jWPVHhWO+HQDn24DRNPDlmUWRXVISlfu4aUpyHNe+k5EyonhyXgNFoSwYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729291994; c=relaxed/simple;
	bh=a8/BRJkyNA9ByERLwaXHaQArlMngL2KpD+u2KPmfZlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4lpJ+TLA5ejQFN5Uy/8xiyUilZ23vDgEhqFjtcSWh7LlDtFALYAV8BaT7xgupnZCX3v+yv1zoEB376Lj2uf/6YrsInUt8OJ2/D1XkTVz+HJA9tYsq5wsJPDyiafKaz4xtdUTpF0Vapp3XPKYVRaLcONiRO4YQxRp9UIPjN7Hrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OarXUD6V; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OarXUD6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729291991; x=1760827991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a8/BRJkyNA9ByERLwaXHaQArlMngL2KpD+u2KPmfZlc=;
  b=OarXUD6VUeCPvyUPohIGomRssfitABFhl3xWRfwaSGF07Wu1fwuTv9U9
   Qpk8A669xQzgq1odWMFXjt0j7vF5J+BZvSoJYT4cALSzE8O2IVQH0kNNQ
   5v8SuncUji7Bq/BbcjHKRPZujuGRNd/sjgKzZIsFx2O+2PGSY5p4oklwM
   P5uBuiR0Ds+AlyixNi0fuXb+REJWBXGSXj8brL5Fz/0EJ8miZPuvMLLLh
   OEwm7QFn7DTkZECkJwR/IkPJrobKBHxM61FMxzzLsl5O+XpmwHL8L2Skx
   Tc9cYj9ej4wnINM47BlhFjwzYHXcNAas+dhqfft5s0z61SyCMliJYyNu6
   A==;
X-CSE-ConnectionGUID: 1+AhG3g0TW2FTBVPDsxlaA==
X-CSE-MsgGUID: G8iW0KlySw+gq0I1X6wOHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28717955"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="28717955"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 15:53:08 -0700
X-CSE-ConnectionGUID: xPDqLpxzSyC8kiBBbreLwg==
X-CSE-MsgGUID: cYR9AWlsSM++9Kz0Do5RJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="82960935"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Oct 2024 15:53:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1vqC-000ONW-2E;
	Fri, 18 Oct 2024 22:53:04 +0000
Date: Sat, 19 Oct 2024 06:52:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/mmu.c:1570 user_mem_abort() error: uninitialized
 symbol 'fault_granule'.
Message-ID: <202410190636.tP4RGFhE-lkp@intel.com>
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
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Marc Zyngier <maz@kernel.org>

Hi Ard,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b04ae0f45168973edb658ac2385045ac13c5aca7
commit: 11e5ea5242e38d44fcede879473566bb6d68f954 KVM: arm64: Use helpers to classify exception types reported via ESR
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241019/202410190636.tP4RGFhE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410190636.tP4RGFhE-lkp@intel.com/

smatch warnings:
arch/arm64/kvm/mmu.c:1570 user_mem_abort() error: uninitialized symbol 'fault_granule'.

vim +/fault_granule +1570 arch/arm64/kvm/mmu.c

ea7fc1bb1cd1b9 arch/arm64/kvm/mmu.c Steven Price        2021-06-21  1376  
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1377  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
98047888bb9fd5 arch/arm/kvm/mmu.c   Christoffer Dall    2014-08-19  1378  			  struct kvm_memory_slot *memslot, unsigned long hva,
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1379  			  bool fault_is_perm)
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1380  {
ffd1b63a586096 arch/arm64/kvm/mmu.c Will Deacon         2020-09-30  1381  	int ret = 0;
6396b852e46e56 virt/kvm/arm/mmu.c   Punit Agrawal       2018-12-11  1382  	bool write_fault, writable, force_pte = false;
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1383  	bool exec_fault, mte_allowed;
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1384  	bool device = false;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1385  	unsigned long mmu_seq;
ad361f093c1e31 arch/arm/kvm/mmu.c   Christoffer Dall    2012-11-01  1386  	struct kvm *kvm = vcpu->kvm;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1387  	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
ad361f093c1e31 arch/arm/kvm/mmu.c   Christoffer Dall    2012-11-01  1388  	struct vm_area_struct *vma;
1559b7583ff6ed virt/kvm/arm/mmu.c   James Morse         2019-12-17  1389  	short vma_shift;
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1390  	gfn_t gfn;
ba049e93aef7e8 arch/arm/kvm/mmu.c   Dan Williams        2016-01-15  1391  	kvm_pfn_t pfn;
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1392  	bool logging_active = memslot_is_logging(memslot);
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1393  	long vma_pagesize, fault_granule;
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1394  	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1395  	struct kvm_pgtable *pgt;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1396  
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1397  	if (fault_is_perm)
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1398  		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
a7d079cea2dffb arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-09  1399  	write_fault = kvm_is_write_fault(vcpu);
c4ad98e4b72cb5 arch/arm64/kvm/mmu.c Marc Zyngier        2020-09-15  1400  	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
d0e22b4ac3ba23 virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1401  	VM_BUG_ON(write_fault && exec_fault);
d0e22b4ac3ba23 virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1402  
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1403  	if (fault_is_perm && !write_fault && !exec_fault) {
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1404  		kvm_err("Unexpected L2 read permission error\n");
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1405  		return -EFAULT;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1406  	}
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1407  
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1408  	/*
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1409  	 * Permission faults just need to update the existing leaf entry,
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1410  	 * and so normally don't require allocations from the memcache. The
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1411  	 * only exception to this is when dirty logging is enabled at runtime
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1412  	 * and a write fault needs to collapse a block entry into a table.
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1413  	 */
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1414  	if (!fault_is_perm || (logging_active && write_fault)) {
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1415  		ret = kvm_mmu_topup_memory_cache(memcache,
fe49fd940e2259 arch/arm64/kvm/mmu.c Marc Zyngier        2023-10-12  1416  						 kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu));
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1417  		if (ret)
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1418  			return ret;
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1419  	}
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1420  
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1421  	/*
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1422  	 * Let's check if we will get back a huge page backed by hugetlbfs, or
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1423  	 * get block mapping for device MMIO region.
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1424  	 */
89154dd5313f77 arch/arm64/kvm/mmu.c Michel Lespinasse   2020-06-08  1425  	mmap_read_lock(current->mm);
09eef83a801512 arch/arm64/kvm/mmu.c Liam Howlett        2021-06-28  1426  	vma = vma_lookup(current->mm, hva);
37b544087ef3f6 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1427  	if (unlikely(!vma)) {
37b544087ef3f6 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1428  		kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
89154dd5313f77 arch/arm64/kvm/mmu.c Michel Lespinasse   2020-06-08  1429  		mmap_read_unlock(current->mm);
37b544087ef3f6 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1430  		return -EFAULT;
37b544087ef3f6 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1431  	}
37b544087ef3f6 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1432  
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1433  	/*
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1434  	 * logging_active is guaranteed to never be true for VM_PFNMAP
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1435  	 * memslots.
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1436  	 */
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1437  	if (logging_active) {
a80868f3985548 virt/kvm/arm/mmu.c   Suzuki K Poulose    2019-03-12  1438  		force_pte = true;
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1439  		vma_shift = PAGE_SHIFT;
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1440  	} else {
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1441  		vma_shift = get_vma_page_shift(vma, hva);
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1442  	}
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1443  
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1444  	switch (vma_shift) {
faf000397e7f10 arch/arm64/kvm/mmu.c Gavin Shan          2020-11-03  1445  #ifndef __PAGETABLE_PMD_FOLDED
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1446  	case PUD_SHIFT:
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1447  		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1448  			break;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1449  		fallthrough;
faf000397e7f10 arch/arm64/kvm/mmu.c Gavin Shan          2020-11-03  1450  #endif
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1451  	case CONT_PMD_SHIFT:
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1452  		vma_shift = PMD_SHIFT;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1453  		fallthrough;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1454  	case PMD_SHIFT:
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1455  		if (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE))
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1456  			break;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1457  		fallthrough;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1458  	case CONT_PTE_SHIFT:
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1459  		vma_shift = PAGE_SHIFT;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1460  		force_pte = true;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1461  		fallthrough;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1462  	case PAGE_SHIFT:
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1463  		break;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1464  	default:
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1465  		WARN_ONCE(1, "Unknown vma_shift %d", vma_shift);
a80868f3985548 virt/kvm/arm/mmu.c   Suzuki K Poulose    2019-03-12  1466  	}
a80868f3985548 virt/kvm/arm/mmu.c   Suzuki K Poulose    2019-03-12  1467  
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1468  	vma_pagesize = 1UL << vma_shift;
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1469  	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1470  		fault_ipa &= ~(vma_pagesize - 1);
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1471  
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1472  	gfn = fault_ipa >> PAGE_SHIFT;
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1473  	mte_allowed = kvm_vma_mte_allowed(vma);
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1474  
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1475  	/* Don't use the VMA after the unlock -- it may have vanished */
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1476  	vma = NULL;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1477  
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1478  	/*
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1479  	 * Read mmu_invalidate_seq so that KVM can detect if the results of
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1480  	 * vma_lookup() or __gfn_to_pfn_memslot() become stale prior to
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1481  	 * acquiring kvm->mmu_lock.
10ba2d17d29729 arch/arm64/kvm/mmu.c Gavin Shan          2021-03-16  1482  	 *
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1483  	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1484  	 * with the smp_wmb() in kvm_mmu_invalidate_end().
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1485  	 */
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1486  	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1487  	mmap_read_unlock(current->mm);
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1488  
c8b88b332bedf4 arch/arm64/kvm/mmu.c Peter Xu            2022-10-11  1489  	pfn = __gfn_to_pfn_memslot(memslot, gfn, false, false, NULL,
10ba2d17d29729 arch/arm64/kvm/mmu.c Gavin Shan          2021-03-16  1490  				   write_fault, &writable, NULL);
196f878a7ac2e7 virt/kvm/arm/mmu.c   James Morse         2017-06-20  1491  	if (pfn == KVM_PFN_ERR_HWPOISON) {
1559b7583ff6ed virt/kvm/arm/mmu.c   James Morse         2019-12-17  1492  		kvm_send_hwpoison_signal(hva, vma_shift);
196f878a7ac2e7 virt/kvm/arm/mmu.c   James Morse         2017-06-20  1493  		return 0;
196f878a7ac2e7 virt/kvm/arm/mmu.c   James Morse         2017-06-20  1494  	}
9ac715954682b2 arch/arm/kvm/mmu.c   Christoffer Dall    2016-08-17  1495  	if (is_error_noslot_pfn(pfn))
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1496  		return -EFAULT;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1497  
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1498  	if (kvm_is_device_pfn(pfn)) {
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1499  		/*
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1500  		 * If the page was identified as device early by looking at
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1501  		 * the VMA flags, vma_pagesize is already representing the
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1502  		 * largest quantity we can map.  If instead it was mapped
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1503  		 * via gfn_to_pfn_prot(), vma_pagesize is set to PAGE_SIZE
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1504  		 * and must not be upgraded.
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1505  		 *
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1506  		 * In both cases, we don't let transparent_hugepage_adjust()
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1507  		 * change things at the last minute.
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1508  		 */
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1509  		device = true;
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1510  	} else if (logging_active && !write_fault) {
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1511  		/*
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1512  		 * Only actually map the page as writable if this was a write
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1513  		 * fault.
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1514  		 */
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1515  		writable = false;
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1516  	}
b88657674d39fc arch/arm/kvm/mmu.c   Kim Phillips        2014-06-26  1517  
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1518  	if (exec_fault && device)
6d674e28f642e3 virt/kvm/arm/mmu.c   Marc Zyngier        2019-12-11  1519  		return -ENOEXEC;
6d674e28f642e3 virt/kvm/arm/mmu.c   Marc Zyngier        2019-12-11  1520  
f783ef1c0e82e4 arch/arm64/kvm/mmu.c Jing Zhang          2022-01-18  1521  	read_lock(&kvm->mmu_lock);
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1522  	pgt = vcpu->arch.hw_mmu->pgt;
20ec3ebd707c77 arch/arm64/kvm/mmu.c Chao Peng           2022-08-16  1523  	if (mmu_invalidate_retry(kvm, mmu_seq))
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1524  		goto out_unlock;
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1525  
3f58bf63455588 virt/kvm/arm/mmu.c   Punit Agrawal       2018-12-11  1526  	/*
0529c9021252a5 arch/arm64/kvm/mmu.c Suzuki K Poulose    2020-05-07  1527  	 * If we are not forced to use page mapping, check if we are
0529c9021252a5 arch/arm64/kvm/mmu.c Suzuki K Poulose    2020-05-07  1528  	 * backed by a THP and thus use block mapping if possible.
3f58bf63455588 virt/kvm/arm/mmu.c   Punit Agrawal       2018-12-11  1529  	 */
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1530  	if (vma_pagesize == PAGE_SIZE && !(force_pte || device)) {
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1531  		if (fault_is_perm && fault_granule > PAGE_SIZE)
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1532  			vma_pagesize = fault_granule;
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1533  		else
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1534  			vma_pagesize = transparent_hugepage_adjust(kvm, memslot,
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1535  								   hva, &pfn,
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1536  								   &fault_ipa);
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1537  
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1538  		if (vma_pagesize < 0) {
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1539  			ret = vma_pagesize;
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1540  			goto out_unlock;
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1541  		}
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1542  	}
a9c0e12ebee56e virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1543  
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1544  	if (!fault_is_perm && !device && kvm_has_mte(kvm)) {
d89585fbb30869 arch/arm64/kvm/mmu.c Peter Collingbourne 2022-11-03  1545  		/* Check the VMM hasn't introduced a new disallowed VMA */
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1546  		if (mte_allowed) {
2dbf12ae132cc7 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1547  			sanitise_mte_tags(kvm, pfn, vma_pagesize);
2dbf12ae132cc7 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1548  		} else {
9f03db6673598f arch/arm64/kvm/mmu.c Marc Zyngier        2021-06-22  1549  			ret = -EFAULT;
ea7fc1bb1cd1b9 arch/arm64/kvm/mmu.c Steven Price        2021-06-21  1550  			goto out_unlock;
ea7fc1bb1cd1b9 arch/arm64/kvm/mmu.c Steven Price        2021-06-21  1551  		}
2dbf12ae132cc7 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1552  	}
3f58bf63455588 virt/kvm/arm/mmu.c   Punit Agrawal       2018-12-11  1553  
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1554  	if (writable)
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1555  		prot |= KVM_PGTABLE_PROT_W;
a9c0e12ebee56e virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1556  
25aa28691bb960 arch/arm64/kvm/mmu.c Yanan Wang          2021-06-17  1557  	if (exec_fault)
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1558  		prot |= KVM_PGTABLE_PROT_X;
a9c0e12ebee56e virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1559  
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1560  	if (device)
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1561  		prot |= KVM_PGTABLE_PROT_DEVICE;
d8569fba13850b arch/arm64/kvm/mmu.c Mark Rutland        2023-10-16  1562  	else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1563  		prot |= KVM_PGTABLE_PROT_X;
a15f693935a9f1 virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1564  
7d894834a30556 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1565  	/*
7d894834a30556 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1566  	 * Under the premise of getting a FSC_PERM fault, we just need to relax
7d894834a30556 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1567  	 * permissions only if vma_pagesize equals fault_granule. Otherwise,
7d894834a30556 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1568  	 * kvm_pgtable_stage2_map() should be called to change block size.
7d894834a30556 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1569  	 */
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28 @1570  	if (fault_is_perm && vma_pagesize == fault_granule)
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1571  		ret = kvm_pgtable_stage2_relax_perms(pgt, fault_ipa, prot);
1577cb5823cefd arch/arm64/kvm/mmu.c Oliver Upton        2022-11-07  1572  	else
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1573  		ret = kvm_pgtable_stage2_map(pgt, fault_ipa, vma_pagesize,
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1574  					     __pfn_to_phys(pfn), prot,
ddcadb297ce5cc arch/arm64/kvm/mmu.c Oliver Upton        2022-12-02  1575  					     memcache,
ddcadb297ce5cc arch/arm64/kvm/mmu.c Oliver Upton        2022-12-02  1576  					     KVM_PGTABLE_WALK_HANDLE_FAULT |
ddcadb297ce5cc arch/arm64/kvm/mmu.c Oliver Upton        2022-12-02  1577  					     KVM_PGTABLE_WALK_SHARED);
ad361f093c1e31 arch/arm/kvm/mmu.c   Christoffer Dall    2012-11-01  1578  
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1579  	/* Mark the page dirty only if the fault is handled successfully */
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1580  	if (writable && !ret) {
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1581  		kvm_set_pfn_dirty(pfn);
10ba2d17d29729 arch/arm64/kvm/mmu.c Gavin Shan          2021-03-16  1582  		mark_page_dirty_in_slot(kvm, memslot, gfn);
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1583  	}
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1584  
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1585  out_unlock:
f783ef1c0e82e4 arch/arm64/kvm/mmu.c Jing Zhang          2022-01-18  1586  	read_unlock(&kvm->mmu_lock);
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1587  	kvm_release_pfn_clean(pfn);
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1588  	return ret != -EAGAIN ? ret : 0;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1589  }
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1590  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
