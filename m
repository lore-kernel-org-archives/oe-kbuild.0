Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AABE390CA3
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947646; cv=none; b=XG/m+uFbEkeNWC14s0+2svrTGVeVTkf8HK3owVIwwVrmBUmZwYR/4s41mlhdI6PHb0aPy2VV0k7uDkMeC2RwRGtOpfHVl29ysvHzdoPP92W4mla6bx5ic8ZSVFRvBLBhEjS4LH3bRt0r5nGvx7HJynAO+xqjna+lIN/eWahpcko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947646; c=relaxed/simple;
	bh=LyzZ80L9wn1kq0YXHLF1sa6xV9R5TXt1NQwrkW34X2k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rc8g8RsNFz5hBfBtVlGoKWhySoPOKj8TnD4AjjiwkySOlowkfR6i33fBxqR27Xfu1umEl/Z2m+z+cOai6R9lvVDfByjiIRgIZrmgt+1MU5FPH9KS8XAKcT+5cOveAaBEW3jvFlzhin/w68r+uG1+SoMrc6Bk2xU+yxsmJeKsWEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIhYRrRQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIhYRrRQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790947645; x=1822483645;
  h=date:from:to:cc:subject:message-id;
  bh=LyzZ80L9wn1kq0YXHLF1sa6xV9R5TXt1NQwrkW34X2k=;
  b=nIhYRrRQt4q0ikqsgzj+ywGYqz5hscXQciczgKEHBoSVT1XbLPtJnrzX
   fAQCl5zonTaiFED7OaTF3P6LmPI2zStlgz9dTqrg9PSuM/qT8j2uJMGuU
   GoVqsWXREZZXcVIer1f25cKmd/FGfgGUiTokOpwcBQs63K72jIAqqCkeI
   XSMJ8fup1AUjSXfErz+euXkGQA7y/14diPbdKdKi6Qf/zNgv9QrdtlsaX
   J7rcVMPSPiscDBqnjKMSur5IukU1zb42JX3BmvuLZD5R0+iEUGJ6xtEuJ
   5zR8ctbAI5dDQRoZ4PvPVEDjV0zwjLV5kTPxVta3b/hY/dCjMfKDUQwIF
   g==;
X-CSE-ConnectionGUID: DGCViuf4Tv2kRvBDfweE4Q==
X-CSE-MsgGUID: USJnxknDSsahjimMeFrj4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90768613"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90768613"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 06:27:24 -0700
X-CSE-ConnectionGUID: u8YI4cvYReSzgjnQA4w3Fg==
X-CSE-MsgGUID: hbK969dKR6yVQGn+DXbm4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="272654331"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 02 Oct 2026 06:27:22 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCdIF-000000000YV-3Ndn;
	Fri, 02 Oct 2026 13:27:19 +0000
Date: Fri, 02 Oct 2026 15:26:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [kvmarm:next 11/11] arch/arm64/kvm/mmu.c:1804:46-53: ERROR:
 reference preceded by free on line 1763
Message-ID: <202610021551.njYrSfzq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: kvmarm@lists.linux.dev
TO: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
head:   bf6201bd69e90fe8661d8795de8fe0c9c95fcc96
commit: bf6201bd69e90fe8661d8795de8fe0c9c95fcc96 [11/11] Merge branch kvm-arm64/mmu-fixes-7.4 into kvmarm-master/next
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-r2105-20261002 (https://download.01.org/0day-ci/archive/20261002/202610021551.njYrSfzq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610021551.njYrSfzq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/mmu.c:1804:46-53: ERROR: reference preceded by free on line 1763
   arch/arm64/kvm/mmu.c:1812:7-14: ERROR: reference preceded by free on line 1763

vim +1804 arch/arm64/kvm/mmu.c

18b94675b1fb22b Lorenzo Stoakes (ARM  2026-09-23  1709) 
0cdcc1039200b3c Vincent Donnefort     2026-09-28  1710  static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
0cdcc1039200b3c Vincent Donnefort     2026-09-28  1711  				     struct kvm_s2_fault_vma_info *s2vi);
0cdcc1039200b3c Vincent Donnefort     2026-09-28  1712  
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1713  static gfn_t get_canonical_gfn(const struct kvm_s2_fault_desc *s2fd,
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1714  			       const struct kvm_s2_fault_vma_info *s2vi);
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1715  
f1fbc7ef12caf07 Lorenzo Stoakes (ARM  2026-09-23  1716) static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
f1fbc7ef12caf07 Lorenzo Stoakes (ARM  2026-09-23  1717) 		      struct kvm_s2_fault_result *result)
a7b57e0995927cc Fuad Tabba            2025-07-29  1718  {
fb9888fdfada0b5 Marc Zyngier          2026-03-15  1719  	bool write_fault, exec_fault;
18b94675b1fb22b Lorenzo Stoakes (ARM  2026-09-23  1720) 	bool perm_fault = kvm_s2_fault_is_perm(s2fd);
19cffd16ed64897 Will Deacon           2026-01-05  1721  	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
a7b57e0995927cc Fuad Tabba            2025-07-29  1722  	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
b477bcdfa034214 Lorenzo Stoakes (ARM  2026-09-23  1723) 	struct kvm_pgtable *pgt = s2fd->mmu->pgt;
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15  1724  	struct kvm_guest_s2_mapping *mapping = NULL;
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1725  	struct kvm_s2_fault_vma_info s2vi = {};
e9550374d13a4bf Marc Zyngier          2026-03-15  1726  	struct kvm *kvm = s2fd->vcpu->kvm;
9be19df816dea9e Alexandru Elisei      2026-05-05  1727  	void *memcache = NULL;
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1728  	gfn_t canonical_gfn;
a7b57e0995927cc Fuad Tabba            2025-07-29  1729  	int ret;
a7b57e0995927cc Fuad Tabba            2025-07-29  1730  
9be19df816dea9e Alexandru Elisei      2026-05-05  1731  	if (!perm_fault) {
e9550374d13a4bf Marc Zyngier          2026-03-15  1732  		memcache = get_mmu_memcache(s2fd->vcpu);
d27acc152c62f36 Lorenzo Stoakes (ARM  2026-09-23  1733) 		ret = topup_mmu_memcache(s2fd->mmu, memcache);
a7b57e0995927cc Fuad Tabba            2025-07-29  1734  		if (ret)
a7b57e0995927cc Fuad Tabba            2025-07-29  1735  			return ret;
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15  1736  		if (kvm_is_nested_s2_mmu(kvm, pgt->mmu)) {
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15  1737  			mapping = kmalloc_obj(struct kvm_guest_s2_mapping, GFP_KERNEL_ACCOUNT);
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15  1738  			if (!mapping)
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15  1739  				return -ENOMEM;
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15  1740  		}
9be19df816dea9e Alexandru Elisei      2026-05-05  1741  	}
a7b57e0995927cc Fuad Tabba            2025-07-29  1742  
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1743  	s2vi.vma_pagesize = PAGE_SIZE;
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1744  	s2vi.gfn = ALIGN_DOWN(s2fd->fault_ipa, s2vi.vma_pagesize) >> PAGE_SHIFT;
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1745  	canonical_gfn = get_canonical_gfn(s2fd, &s2vi);
a7b57e0995927cc Fuad Tabba            2025-07-29  1746  
18b94675b1fb22b Lorenzo Stoakes (ARM  2026-09-23  1747) 	write_fault = kvm_s2_fault_is_write(s2fd);
18b94675b1fb22b Lorenzo Stoakes (ARM  2026-09-23  1748) 	exec_fault = kvm_s2_fault_is_exec(s2fd);
a7b57e0995927cc Fuad Tabba            2025-07-29  1749  
a7b57e0995927cc Fuad Tabba            2025-07-29  1750  	VM_WARN_ON_ONCE(write_fault && exec_fault);
a7b57e0995927cc Fuad Tabba            2025-07-29  1751  
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1752  	s2vi.mmu_seq = kvm->mmu_invalidate_seq;
a7b57e0995927cc Fuad Tabba            2025-07-29  1753  	/* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
a7b57e0995927cc Fuad Tabba            2025-07-29  1754  	smp_rmb();
a7b57e0995927cc Fuad Tabba            2025-07-29  1755  
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1756  	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, canonical_gfn, &s2vi.pfn, &s2vi.page, NULL);
a7b57e0995927cc Fuad Tabba            2025-07-29  1757  	if (ret) {
f1fbc7ef12caf07 Lorenzo Stoakes (ARM  2026-09-23  1758) 		/* If result is non-NULL this is a synthetic fault. */
f1fbc7ef12caf07 Lorenzo Stoakes (ARM  2026-09-23  1759) 		if (!result)
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1760  			kvm_prepare_memory_fault_exit(s2fd->vcpu, gfn_to_gpa(canonical_gfn),
bf6201bd69e90fe Marc Zyngier          2026-10-01  1761  						      s2vi.vma_pagesize, write_fault, exec_fault,
bf6201bd69e90fe Marc Zyngier          2026-10-01  1762  						      false);
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15 @1763  		kfree(mapping);
a7b57e0995927cc Fuad Tabba            2025-07-29  1764  	}
a7b57e0995927cc Fuad Tabba            2025-07-29  1765  
e9550374d13a4bf Marc Zyngier          2026-03-15  1766  	if (!(s2fd->memslot->flags & KVM_MEM_READONLY))
fb9888fdfada0b5 Marc Zyngier          2026-03-15  1767  		prot |= KVM_PGTABLE_PROT_W;
a7b57e0995927cc Fuad Tabba            2025-07-29  1768  
e9550374d13a4bf Marc Zyngier          2026-03-15  1769  	if (s2fd->nested)
e9550374d13a4bf Marc Zyngier          2026-03-15  1770  		prot = adjust_nested_fault_perms(s2fd->nested, prot);
a7b57e0995927cc Fuad Tabba            2025-07-29  1771  
d93febe2ed2e049 Oliver Upton          2025-11-24  1772  	if (exec_fault || cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
a7b57e0995927cc Fuad Tabba            2025-07-29  1773  		prot |= KVM_PGTABLE_PROT_X;
a7b57e0995927cc Fuad Tabba            2025-07-29  1774  
e9550374d13a4bf Marc Zyngier          2026-03-15  1775  	if (s2fd->nested)
e9550374d13a4bf Marc Zyngier          2026-03-15  1776  		prot = adjust_nested_exec_perms(kvm, s2fd->nested, prot);
d93febe2ed2e049 Oliver Upton          2025-11-24  1777  
a7b57e0995927cc Fuad Tabba            2025-07-29  1778  	kvm_fault_lock(kvm);
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1779  	if (mmu_invalidate_retry(kvm, s2vi.mmu_seq)) {
a7b57e0995927cc Fuad Tabba            2025-07-29  1780  		ret = -EAGAIN;
a7b57e0995927cc Fuad Tabba            2025-07-29  1781  		goto out_unlock;
a7b57e0995927cc Fuad Tabba            2025-07-29  1782  	}
a7b57e0995927cc Fuad Tabba            2025-07-29  1783  
9be19df816dea9e Alexandru Elisei      2026-05-05  1784  	if (perm_fault) {
9be19df816dea9e Alexandru Elisei      2026-05-05  1785  		/*
9be19df816dea9e Alexandru Elisei      2026-05-05  1786  		 * Drop the SW bits in favour of those stored in the
9be19df816dea9e Alexandru Elisei      2026-05-05  1787  		 * PTE, which will be preserved.
9be19df816dea9e Alexandru Elisei      2026-05-05  1788  		 */
9be19df816dea9e Alexandru Elisei      2026-05-05  1789  		prot &= ~KVM_NV_GUEST_MAP_SZ;
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1790  		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, gfn_to_gpa(s2vi.gfn),
9be19df816dea9e Alexandru Elisei      2026-05-05  1791  								 prot, flags);
9be19df816dea9e Alexandru Elisei      2026-05-05  1792  	} else {
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1793  		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(s2vi.gfn),
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1794  							 s2vi.vma_pagesize,
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1795  							 __pfn_to_phys(s2vi.pfn), prot,
a7b57e0995927cc Fuad Tabba            2025-07-29  1796  							 memcache, flags);
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15  1797  		/*
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15  1798  		 * -EAGAIN from kvm_pgtable_stage2_map() can install mappings.
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15  1799  		 * We don't know which subrange is installed, track the whole
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15  1800  		 * thing.
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15  1801  		 */
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15  1802  		if ((ret == 0 || ret == -EAGAIN) && kvm_is_nested_s2_mmu(kvm, pgt->mmu)) {
bf6201bd69e90fe Marc Zyngier          2026-10-01  1803  			kvm_record_guest_s2_mapping(pgt->mmu, canonical_gfn << PAGE_SHIFT,
bf6201bd69e90fe Marc Zyngier          2026-10-01 @1804  						    s2fd->fault_ipa, s2vi.vma_pagesize, mapping);
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15  1805  			mapping = NULL;
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15  1806  		}
9be19df816dea9e Alexandru Elisei      2026-05-05  1807  	}
a7b57e0995927cc Fuad Tabba            2025-07-29  1808  
a7b57e0995927cc Fuad Tabba            2025-07-29  1809  out_unlock:
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1810  	kvm_release_faultin_page(kvm, s2vi.page, !!ret, prot & KVM_PGTABLE_PROT_W);
a7b57e0995927cc Fuad Tabba            2025-07-29  1811  	kvm_fault_unlock(kvm);
c2778d14cd2ff75 Wei-Lin Chang         2026-09-15  1812  	kfree(mapping);
a7b57e0995927cc Fuad Tabba            2025-07-29  1813  
fb9888fdfada0b5 Marc Zyngier          2026-03-15  1814  	if ((prot & KVM_PGTABLE_PROT_W) && !ret)
80b0b86dc5e4344 Fuad Tabba            2026-09-28  1815  		mark_page_dirty_in_slot(kvm, s2fd->memslot, canonical_gfn);
a7b57e0995927cc Fuad Tabba            2025-07-29  1816  
f1fbc7ef12caf07 Lorenzo Stoakes (ARM  2026-09-23  1817) 	if (ret == -EAGAIN)
f1fbc7ef12caf07 Lorenzo Stoakes (ARM  2026-09-23  1818) 		return result ? ret : 0;
f1fbc7ef12caf07 Lorenzo Stoakes (ARM  2026-09-23  1819) 
f1fbc7ef12caf07 Lorenzo Stoakes (ARM  2026-09-23  1820) 	if (result && !ret)
bf6201bd69e90fe Marc Zyngier          2026-10-01  1821  		result->mapping_size = s2vi.vma_pagesize;
f1fbc7ef12caf07 Lorenzo Stoakes (ARM  2026-09-23  1822) 
f1fbc7ef12caf07 Lorenzo Stoakes (ARM  2026-09-23  1823) 	return ret;
a7b57e0995927cc Fuad Tabba            2025-07-29  1824  }
a7b57e0995927cc Fuad Tabba            2025-07-29  1825  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
