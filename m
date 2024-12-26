Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7869B13E028
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Dec 2024 18:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237747; cv=none; b=MNx6S38i0L0Ex/azUDtqd3M23TbmrjW7DVYK4S0g0Ywsbdu+Vks5WFY+skmXD29aTRYfQHxC/TpKFO5cBVqaw7ibLaUeynoS2j1is2OAqzxHutdXoT1GLKALHo31sPzjH7392+O095q00M9TdFA+UXWSqSiJsZ3LIpQ1EpltNi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237747; c=relaxed/simple;
	bh=Dcixn1K5F+YPZ04sQvModdKurRXXXmMm+ZaDrBulci4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=naruddiIyZAP3tnnjXLJlGtEa8Cflca0kG2U/207b/YdosTJ4/ctWYahoZS94u5E4DX6iSxTkB/fg6/NlZmiUlS+OQ74wDr8ynS9npsTycpoG/mV1pazX8jcL24Y1i7Z1G28dmsFZzbfxQNAg/Uf6u1YkkMBrdxaPrOZG/yJVqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gy44Ps/5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gy44Ps/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735237744; x=1766773744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dcixn1K5F+YPZ04sQvModdKurRXXXmMm+ZaDrBulci4=;
  b=Gy44Ps/5lmbtGTswXq3cCLurzNNlZE/9CWeNtZPGmsKVtPK9xalTXt7C
   VWu0UlzZxqt38Osp5VjsG8ourCRea8th232JzzN6bCpqAEtm52X5HZ2A3
   HEU8tCMzPJjtPU63oeso6bBlpnV06a+FckXZ8tJYVLkIjbuB+Dh9bEifJ
   FtyHe8J3Nk/61CKt/Y1etvypX3EJD6SMyEwyd7/pCGdJmBjlXyR9YwrIt
   o4j7jMMvz98p3fB94k1/HaY2t8ojtZfDJcFZg0VvAEQICAxrRHHm3KJby
   6busoDdhGHrGw930dv+5bgdq+3Tc5WWaQ0+7xGCNBwX5t04rRvZ8EyoSa
   Q==;
X-CSE-ConnectionGUID: 3w1JxDWrQ6qKIs0CbKFW/A==
X-CSE-MsgGUID: PVuVIhQIR8KHEXgd+9KUHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="35820421"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="35820421"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 10:29:03 -0800
X-CSE-ConnectionGUID: ylMqVi1YSbeaM2yWPPXufg==
X-CSE-MsgGUID: DO4yuwetQ5KB29Plsl/rjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104984273"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Dec 2024 10:29:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQsbT-0002ju-2A;
	Thu, 26 Dec 2024 18:28:59 +0000
Date: Fri, 27 Dec 2024 02:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kvmarm:next 38/59] arch/arm64/kvm/mmu.c:1732 user_mem_abort()
 error: uninitialized symbol 'memcache'.
Message-ID: <202412270207.oW4sPR2R-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: kvmarm@lists.cs.columbia.edu
TO: Quentin Perret <qperret@google.com>
CC: Marc Zyngier <maz@kernel.org>
CC: Fuad Tabba <tabba@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
head:   30b2a7aaeee14b80ac3a2c0e68d7ff09b2fb6f0b
commit: fce886a6020734d6253c2c5a3bc285e385cc5496 [38/59] KVM: arm64: Plumb the pKVM MMU in KVM
:::::: branch date: 4 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-r072-20241225 (https://download.01.org/0day-ci/archive/20241227/202412270207.oW4sPR2R-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412270207.oW4sPR2R-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/mmu.c:1732 user_mem_abort() error: uninitialized symbol 'memcache'.

Old smatch warnings:
arch/arm64/kvm/mmu.c:1722 user_mem_abort() error: uninitialized symbol 'fault_granule'.

vim +/memcache +1732 arch/arm64/kvm/mmu.c

ea7fc1bb1cd1b92 arch/arm64/kvm/mmu.c Steven Price        2021-06-21  1454  
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1455  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1456  			  struct kvm_s2_trans *nested,
98047888bb9fd57 arch/arm/kvm/mmu.c   Christoffer Dall    2014-08-19  1457  			  struct kvm_memory_slot *memslot, unsigned long hva,
11e5ea5242e38d4 arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1458  			  bool fault_is_perm)
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1459  {
ffd1b63a5860968 arch/arm64/kvm/mmu.c Will Deacon         2020-09-30  1460  	int ret = 0;
6396b852e46e562 virt/kvm/arm/mmu.c   Punit Agrawal       2018-12-11  1461  	bool write_fault, writable, force_pte = false;
8c2e8ac8ad4be68 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1462  	bool exec_fault, mte_allowed;
8c47ce3e1d2c285 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1463  	bool device = false, vfio_allow_any_uc = false;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1464  	unsigned long mmu_seq;
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1465  	phys_addr_t ipa = fault_ipa;
ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall    2012-11-01  1466  	struct kvm *kvm = vcpu->kvm;
ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall    2012-11-01  1467  	struct vm_area_struct *vma;
1559b7583ff6ed0 virt/kvm/arm/mmu.c   James Morse         2019-12-17  1468  	short vma_shift;
fce886a6020734d arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1469  	void *memcache;
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1470  	gfn_t gfn;
ba049e93aef7e8c arch/arm/kvm/mmu.c   Dan Williams        2016-01-15  1471  	kvm_pfn_t pfn;
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1472  	bool logging_active = memslot_is_logging(memslot);
e86fc1a3a3e9b48 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1473  	long vma_pagesize, fault_granule;
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1474  	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1475  	struct kvm_pgtable *pgt;
85c7869e30b7700 arch/arm64/kvm/mmu.c Sean Christopherson 2024-10-10  1476  	struct page *page;
e279c25d78d6729 arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1477  	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1478  
11e5ea5242e38d4 arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1479  	if (fault_is_perm)
11e5ea5242e38d4 arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1480  		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
a7d079cea2dffb1 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-09  1481  	write_fault = kvm_is_write_fault(vcpu);
c4ad98e4b72cb5b arch/arm64/kvm/mmu.c Marc Zyngier        2020-09-15  1482  	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
d0e22b4ac3ba23c virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1483  	VM_BUG_ON(write_fault && exec_fault);
d0e22b4ac3ba23c virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1484  
11e5ea5242e38d4 arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1485  	if (fault_is_perm && !write_fault && !exec_fault) {
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1486  		kvm_err("Unexpected L2 read permission error\n");
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1487  		return -EFAULT;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1488  	}
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1489  
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1490  	/*
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1491  	 * Permission faults just need to update the existing leaf entry,
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1492  	 * and so normally don't require allocations from the memcache. The
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1493  	 * only exception to this is when dirty logging is enabled at runtime
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1494  	 * and a write fault needs to collapse a block entry into a table.
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1495  	 */
11e5ea5242e38d4 arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1496  	if (!fault_is_perm || (logging_active && write_fault)) {
fce886a6020734d arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1497  		int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
fce886a6020734d arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1498  
fce886a6020734d arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1499  		if (!is_protected_kvm_enabled()) {
fce886a6020734d arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1500  			memcache = &vcpu->arch.mmu_page_cache;
fce886a6020734d arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1501  			ret = kvm_mmu_topup_memory_cache(memcache, min_pages);
fce886a6020734d arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1502  		} else {
fce886a6020734d arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1503  			memcache = &vcpu->arch.pkvm_memcache;
fce886a6020734d arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1504  			ret = topup_hyp_memcache(memcache, min_pages);
fce886a6020734d arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1505  		}
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1506  		if (ret)
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1507  			return ret;
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1508  	}
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1509  
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1510  	/*
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1511  	 * Let's check if we will get back a huge page backed by hugetlbfs, or
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1512  	 * get block mapping for device MMIO region.
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1513  	 */
89154dd5313f774 arch/arm64/kvm/mmu.c Michel Lespinasse   2020-06-08  1514  	mmap_read_lock(current->mm);
09eef83a801512a arch/arm64/kvm/mmu.c Liam Howlett        2021-06-28  1515  	vma = vma_lookup(current->mm, hva);
37b544087ef3f65 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1516  	if (unlikely(!vma)) {
37b544087ef3f65 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1517  		kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
89154dd5313f774 arch/arm64/kvm/mmu.c Michel Lespinasse   2020-06-08  1518  		mmap_read_unlock(current->mm);
37b544087ef3f65 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1519  		return -EFAULT;
37b544087ef3f65 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1520  	}
37b544087ef3f65 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1521  
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1522  	/*
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1523  	 * logging_active is guaranteed to never be true for VM_PFNMAP
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1524  	 * memslots.
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1525  	 */
fce886a6020734d arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1526  	if (logging_active || is_protected_kvm_enabled()) {
a80868f39855484 virt/kvm/arm/mmu.c   Suzuki K Poulose    2019-03-12  1527  		force_pte = true;
523b3999e5f620c arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1528  		vma_shift = PAGE_SHIFT;
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1529  	} else {
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1530  		vma_shift = get_vma_page_shift(vma, hva);
523b3999e5f620c arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1531  	}
523b3999e5f620c arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1532  
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1533  	switch (vma_shift) {
faf000397e7f103 arch/arm64/kvm/mmu.c Gavin Shan          2020-11-03  1534  #ifndef __PAGETABLE_PMD_FOLDED
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1535  	case PUD_SHIFT:
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1536  		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1537  			break;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1538  		fallthrough;
faf000397e7f103 arch/arm64/kvm/mmu.c Gavin Shan          2020-11-03  1539  #endif
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1540  	case CONT_PMD_SHIFT:
523b3999e5f620c arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1541  		vma_shift = PMD_SHIFT;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1542  		fallthrough;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1543  	case PMD_SHIFT:
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1544  		if (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE))
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1545  			break;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1546  		fallthrough;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1547  	case CONT_PTE_SHIFT:
523b3999e5f620c arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1548  		vma_shift = PAGE_SHIFT;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1549  		force_pte = true;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1550  		fallthrough;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1551  	case PAGE_SHIFT:
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1552  		break;
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1553  	default:
2f40c46021bbb3e arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1554  		WARN_ONCE(1, "Unknown vma_shift %d", vma_shift);
a80868f39855484 virt/kvm/arm/mmu.c   Suzuki K Poulose    2019-03-12  1555  	}
a80868f39855484 virt/kvm/arm/mmu.c   Suzuki K Poulose    2019-03-12  1556  
523b3999e5f620c arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1557  	vma_pagesize = 1UL << vma_shift;
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1558  
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1559  	if (nested) {
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1560  		unsigned long max_map_size;
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1561  
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1562  		max_map_size = force_pte ? PAGE_SIZE : PUD_SIZE;
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1563  
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1564  		ipa = kvm_s2_trans_output(nested);
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1565  
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1566  		/*
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1567  		 * If we're about to create a shadow stage 2 entry, then we
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1568  		 * can only create a block mapping if the guest stage 2 page
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1569  		 * table uses at least as big a mapping.
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1570  		 */
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1571  		max_map_size = min(kvm_s2_trans_size(nested), max_map_size);
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1572  
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1573  		/*
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1574  		 * Be careful that if the mapping size falls between
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1575  		 * two host sizes, take the smallest of the two.
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1576  		 */
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1577  		if (max_map_size >= PMD_SIZE && max_map_size < PUD_SIZE)
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1578  			max_map_size = PMD_SIZE;
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1579  		else if (max_map_size >= PAGE_SIZE && max_map_size < PMD_SIZE)
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1580  			max_map_size = PAGE_SIZE;
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1581  
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1582  		force_pte = (max_map_size == PAGE_SIZE);
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1583  		vma_pagesize = min(vma_pagesize, (long)max_map_size);
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1584  	}
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1585  
1d8c3c23a6bc152 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1586  	/*
1d8c3c23a6bc152 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1587  	 * Both the canonical IPA and fault IPA must be hugepage-aligned to
1d8c3c23a6bc152 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1588  	 * ensure we find the right PFN and lay down the mapping in the right
1d8c3c23a6bc152 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1589  	 * place.
1d8c3c23a6bc152 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1590  	 */
1d8c3c23a6bc152 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1591  	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE) {
523b3999e5f620c arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1592  		fault_ipa &= ~(vma_pagesize - 1);
1d8c3c23a6bc152 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1593  		ipa &= ~(vma_pagesize - 1);
1d8c3c23a6bc152 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1594  	}
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1595  
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1596  	gfn = ipa >> PAGE_SHIFT;
8c2e8ac8ad4be68 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1597  	mte_allowed = kvm_vma_mte_allowed(vma);
8c2e8ac8ad4be68 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1598  
8c47ce3e1d2c285 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1599  	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
8c47ce3e1d2c285 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1600  
8c2e8ac8ad4be68 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1601  	/* Don't use the VMA after the unlock -- it may have vanished */
8c2e8ac8ad4be68 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1602  	vma = NULL;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1603  
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1604  	/*
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1605  	 * Read mmu_invalidate_seq so that KVM can detect if the results of
85c7869e30b7700 arch/arm64/kvm/mmu.c Sean Christopherson 2024-10-10  1606  	 * vma_lookup() or __kvm_faultin_pfn() become stale prior to
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1607  	 * acquiring kvm->mmu_lock.
10ba2d17d297292 arch/arm64/kvm/mmu.c Gavin Shan          2021-03-16  1608  	 *
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1609  	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1610  	 * with the smp_wmb() in kvm_mmu_invalidate_end().
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1611  	 */
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1612  	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
13ec9308a85702a arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1613  	mmap_read_unlock(current->mm);
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1614  
85c7869e30b7700 arch/arm64/kvm/mmu.c Sean Christopherson 2024-10-10  1615  	pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
85c7869e30b7700 arch/arm64/kvm/mmu.c Sean Christopherson 2024-10-10  1616  				&writable, &page);
196f878a7ac2e72 virt/kvm/arm/mmu.c   James Morse         2017-06-20  1617  	if (pfn == KVM_PFN_ERR_HWPOISON) {
1559b7583ff6ed0 virt/kvm/arm/mmu.c   James Morse         2019-12-17  1618  		kvm_send_hwpoison_signal(hva, vma_shift);
196f878a7ac2e72 virt/kvm/arm/mmu.c   James Morse         2017-06-20  1619  		return 0;
196f878a7ac2e72 virt/kvm/arm/mmu.c   James Morse         2017-06-20  1620  	}
9ac715954682b23 arch/arm/kvm/mmu.c   Christoffer Dall    2016-08-17  1621  	if (is_error_noslot_pfn(pfn))
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1622  		return -EFAULT;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1623  
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1624  	if (kvm_is_device_pfn(pfn)) {
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1625  		/*
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1626  		 * If the page was identified as device early by looking at
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1627  		 * the VMA flags, vma_pagesize is already representing the
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1628  		 * largest quantity we can map.  If instead it was mapped
85c7869e30b7700 arch/arm64/kvm/mmu.c Sean Christopherson 2024-10-10  1629  		 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1630  		 * and must not be upgraded.
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1631  		 *
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1632  		 * In both cases, we don't let transparent_hugepage_adjust()
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1633  		 * change things at the last minute.
2aa53d68cee6603 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1634  		 */
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1635  		device = true;
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1636  	} else if (logging_active && !write_fault) {
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1637  		/*
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1638  		 * Only actually map the page as writable if this was a write
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1639  		 * fault.
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1640  		 */
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1641  		writable = false;
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1642  	}
b88657674d39fc2 arch/arm/kvm/mmu.c   Kim Phillips        2014-06-26  1643  
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1644  	if (exec_fault && device)
6d674e28f642e3f virt/kvm/arm/mmu.c   Marc Zyngier        2019-12-11  1645  		return -ENOEXEC;
6d674e28f642e3f virt/kvm/arm/mmu.c   Marc Zyngier        2019-12-11  1646  
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1647  	/*
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1648  	 * Potentially reduce shadow S2 permissions to match the guest's own
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1649  	 * S2. For exec faults, we'd only reach this point if the guest
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1650  	 * actually allowed it (see kvm_s2_handle_perm_fault).
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1651  	 *
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1652  	 * Also encode the level of the original translation in the SW bits
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1653  	 * of the leaf entry as a proxy for the span of that translation.
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1654  	 * This will be retrieved on TLB invalidation from the guest and
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1655  	 * used to limit the invalidation scope if a TTL hint or a range
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1656  	 * isn't provided.
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1657  	 */
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1658  	if (nested) {
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1659  		writable &= kvm_s2_trans_writable(nested);
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1660  		if (!kvm_s2_trans_readable(nested))
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1661  			prot &= ~KVM_PGTABLE_PROT_R;
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1662  
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1663  		prot |= kvm_encode_nested_level(nested);
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1664  	}
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1665  
fce886a6020734d arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1666  	kvm_fault_lock(kvm);
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1667  	pgt = vcpu->arch.hw_mmu->pgt;
9c30fc615daa3ef arch/arm64/kvm/mmu.c Fuad Tabba          2024-04-23  1668  	if (mmu_invalidate_retry(kvm, mmu_seq)) {
9c30fc615daa3ef arch/arm64/kvm/mmu.c Fuad Tabba          2024-04-23  1669  		ret = -EAGAIN;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1670  		goto out_unlock;
9c30fc615daa3ef arch/arm64/kvm/mmu.c Fuad Tabba          2024-04-23  1671  	}
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1672  
3f58bf63455588a virt/kvm/arm/mmu.c   Punit Agrawal       2018-12-11  1673  	/*
0529c9021252a58 arch/arm64/kvm/mmu.c Suzuki K Poulose    2020-05-07  1674  	 * If we are not forced to use page mapping, check if we are
0529c9021252a58 arch/arm64/kvm/mmu.c Suzuki K Poulose    2020-05-07  1675  	 * backed by a THP and thus use block mapping if possible.
3f58bf63455588a virt/kvm/arm/mmu.c   Punit Agrawal       2018-12-11  1676  	 */
f2cc327303b13a7 arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1677  	if (vma_pagesize == PAGE_SIZE && !(force_pte || device)) {
11e5ea5242e38d4 arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1678  		if (fault_is_perm && fault_granule > PAGE_SIZE)
f2cc327303b13a7 arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1679  			vma_pagesize = fault_granule;
f2cc327303b13a7 arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1680  		else
f2cc327303b13a7 arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1681  			vma_pagesize = transparent_hugepage_adjust(kvm, memslot,
f2cc327303b13a7 arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1682  								   hva, &pfn,
f2cc327303b13a7 arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1683  								   &fault_ipa);
e86fc1a3a3e9b48 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1684  
e86fc1a3a3e9b48 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1685  		if (vma_pagesize < 0) {
e86fc1a3a3e9b48 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1686  			ret = vma_pagesize;
e86fc1a3a3e9b48 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1687  			goto out_unlock;
e86fc1a3a3e9b48 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1688  		}
f2cc327303b13a7 arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1689  	}
a9c0e12ebee56ef virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1690  
11e5ea5242e38d4 arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1691  	if (!fault_is_perm && !device && kvm_has_mte(kvm)) {
d89585fbb308690 arch/arm64/kvm/mmu.c Peter Collingbourne 2022-11-03  1692  		/* Check the VMM hasn't introduced a new disallowed VMA */
8c2e8ac8ad4be68 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1693  		if (mte_allowed) {
2dbf12ae132cc78 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1694  			sanitise_mte_tags(kvm, pfn, vma_pagesize);
2dbf12ae132cc78 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1695  		} else {
9f03db6673598f6 arch/arm64/kvm/mmu.c Marc Zyngier        2021-06-22  1696  			ret = -EFAULT;
ea7fc1bb1cd1b92 arch/arm64/kvm/mmu.c Steven Price        2021-06-21  1697  			goto out_unlock;
ea7fc1bb1cd1b92 arch/arm64/kvm/mmu.c Steven Price        2021-06-21  1698  		}
2dbf12ae132cc78 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1699  	}
3f58bf63455588a virt/kvm/arm/mmu.c   Punit Agrawal       2018-12-11  1700  
509552e65ae8287 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1701  	if (writable)
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1702  		prot |= KVM_PGTABLE_PROT_W;
a9c0e12ebee56ef virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1703  
25aa28691bb960a arch/arm64/kvm/mmu.c Yanan Wang          2021-06-17  1704  	if (exec_fault)
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1705  		prot |= KVM_PGTABLE_PROT_X;
a9c0e12ebee56ef virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1706  
8c47ce3e1d2c285 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1707  	if (device) {
8c47ce3e1d2c285 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1708  		if (vfio_allow_any_uc)
8c47ce3e1d2c285 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1709  			prot |= KVM_PGTABLE_PROT_NORMAL_NC;
8c47ce3e1d2c285 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1710  		else
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1711  			prot |= KVM_PGTABLE_PROT_DEVICE;
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1712  	} else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC) &&
fd276e71d1e7b7f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1713  		   (!nested || kvm_s2_trans_executable(nested))) {
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1714  		prot |= KVM_PGTABLE_PROT_X;
8c47ce3e1d2c285 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1715  	}
a15f693935a9f1f virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1716  
7d894834a305568 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1717  	/*
7d894834a305568 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1718  	 * Under the premise of getting a FSC_PERM fault, we just need to relax
7d894834a305568 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1719  	 * permissions only if vma_pagesize equals fault_granule. Otherwise,
7d894834a305568 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1720  	 * kvm_pgtable_stage2_map() should be called to change block size.
7d894834a305568 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1721  	 */
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1722  	if (fault_is_perm && vma_pagesize == fault_granule) {
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1723  		/*
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1724  		 * Drop the SW bits in favour of those stored in the
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1725  		 * PTE, which will be preserved.
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1726  		 */
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1727  		prot &= ~KVM_NV_GUEST_MAP_SZ;
fce886a6020734d arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1728  		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, fault_ipa, prot, flags);
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1729  	} else {
fce886a6020734d arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1730  		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault_ipa, vma_pagesize,
6f745f1bb5bf291 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1731  					     __pfn_to_phys(pfn), prot,
e279c25d78d6729 arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18 @1732  					     memcache, flags);
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1733  	}
b1a3a94812b95fb arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1734  
9c30fc615daa3ef arch/arm64/kvm/mmu.c Fuad Tabba          2024-04-23  1735  out_unlock:
85c7869e30b7700 arch/arm64/kvm/mmu.c Sean Christopherson 2024-10-10  1736  	kvm_release_faultin_page(kvm, page, !!ret, writable);
fce886a6020734d arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1737  	kvm_fault_unlock(kvm);
ad361f093c1e31d arch/arm/kvm/mmu.c   Christoffer Dall    2012-11-01  1738  
509552e65ae8287 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1739  	/* Mark the page dirty only if the fault is handled successfully */
28991c91d577c39 arch/arm64/kvm/mmu.c Sean Christopherson 2024-10-10  1740  	if (writable && !ret)
10ba2d17d297292 arch/arm64/kvm/mmu.c Gavin Shan          2021-03-16  1741  		mark_page_dirty_in_slot(kvm, memslot, gfn);
509552e65ae8287 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1742  
509552e65ae8287 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1743  	return ret != -EAGAIN ? ret : 0;
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1744  }
94f8e6418d3915d arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1745  

:::::: The code at line 1732 was first introduced by commit
:::::: e279c25d78d6729e39a0221c98185bd0e7aa0c99 KVM: arm64: Pass walk flags to kvm_pgtable_stage2_relax_perms

:::::: TO: Quentin Perret <qperret@google.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
