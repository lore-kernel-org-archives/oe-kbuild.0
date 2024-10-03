Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3761482F3
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Oct 2024 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727949087; cv=none; b=ZbLysSonMGaTpx14FToLozo5Gzq2ZB1m3XtFTVKxUvApSj8KMcOGE6a0JHfwunUsoOvP97mVJSJqEp/4w9poLpX3VC8lUgYYzC2b/i9rZWCn/0xst4GClrpR1XuRWxulVyJFLtToMEmJVSzZZh38HrxjcTYH2H5SFP/9Vf3K/ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727949087; c=relaxed/simple;
	bh=kTDBCZDAjTxIMKpJJTKO/Voak/1EXn5ospy8j7ODvCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JZzHWUVS9mnPj12cDhMGgfW72mGPB1Xr4CmH2ZOmX5rJqNrN88teEoCEW29XMjPZM4/XYTU16Txw4OIl2V7CgMY7JIrK2pkATNh1EsrEwpZ5ufPNIyTx1bmCnVIfZaZ/RKVMSckgegYALIkQhXD63ckCDZUSd701fHbraQcltNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JeBbuuSq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JeBbuuSq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727949085; x=1759485085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kTDBCZDAjTxIMKpJJTKO/Voak/1EXn5ospy8j7ODvCk=;
  b=JeBbuuSqxDwti1bOdheJORPMpzcWCYNW6RxhX3BSaLrgpmf+HVZrIN+I
   NvZQJ8rwmSpY/RVilt8b4Em8TU9J1TIAeDOFn/7G//JsvphgvLFDx53BR
   XFY/AWCamwfEFxctORr9Z9igaYShssz2cW1sGT78PNpXKHe5JSVqomy5u
   OxGYBfK/V3MVEreRm6cxi72Ieuhp4gYUfSrG7zxnT6e13ggvxL65aBlE0
   wnzndQwOjYaiKEUOhx+420kFlwGrowJ0mIaZeyZeNpQsfJ5fKjc0WWaLm
   Mi/bRjVY6SuuSqdjk/WqufRlclwjUNitgn8cdwhDfGYEo5+CIdxEZcPH3
   Q==;
X-CSE-ConnectionGUID: oRZ/97u3TYqyT8/V42AWEQ==
X-CSE-MsgGUID: 1U4zTncTSveJ1Nr8TX3aIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30928624"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="30928624"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 02:51:25 -0700
X-CSE-ConnectionGUID: qUxejG6QSbqbm8KAfIqFTw==
X-CSE-MsgGUID: 7OaXz7RUT926AmW9VCYm1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="111759060"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Oct 2024 02:51:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swIUS-0000Fi-2W;
	Thu, 03 Oct 2024 09:51:20 +0000
Date: Thu, 3 Oct 2024 17:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/loongarch/kvm/mmu.c:867 kvm_map_page() warn: if statement not
 indented
Message-ID: <202410031753.YKQowtNa-lkp@intel.com>
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
TO: Tianrui Zhao <zhaotianrui@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>
CC: Bibo Mao <maobibo@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ec462100ef9142344ddbf86f2c3008b97acddbe
commit: c1fc48aad14dbe7654f5986afb906332b528d54b LoongArch: KVM: Enable kvm config and add the makefile
date:   1 year ago
:::::: branch date: 10 hours ago
:::::: commit date: 1 year ago
config: loongarch-randconfig-r071-20241003 (https://download.01.org/0day-ci/archive/20241003/202410031753.YKQowtNa-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410031753.YKQowtNa-lkp@intel.com/

New smatch warnings:
arch/loongarch/kvm/mmu.c:867 kvm_map_page() warn: if statement not indented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:529 kvm_destroy_vcpus() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1670 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1663)
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1672 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1664)
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:4643 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5720 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5731 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented

Old smatch warnings:
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:330 kvm_make_all_cpus_request_except() warn: iterator 'i' not incremented
arch/loongarch/include/asm/atomic.h:109 arch_atomic_fetch_add_unless() warn: inconsistent indenting
include/linux/kvm_host.h:945 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented

vim +867 arch/loongarch/kvm/mmu.c

752e2cd7b4fb41 Tianrui Zhao 2023-10-02  732  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  733  /*
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  734   * kvm_map_page() - Map a guest physical page.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  735   * @vcpu:		vCPU pointer.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  736   * @gpa:		Guest physical address of fault.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  737   * @write:	Whether the fault was due to a write.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  738   *
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  739   * Handle GPA faults by creating a new GPA mapping (or updating an existing
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  740   * one).
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  741   *
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  742   * This takes care of marking pages young or dirty (idle/dirty page tracking),
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  743   * asking KVM for the corresponding PFN, and creating a mapping in the GPA page
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  744   * tables. Derived mappings (GVA page tables and TLBs) must be handled by the
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  745   * caller.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  746   *
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  747   * Returns:	0 on success
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  748   *		-EFAULT if there is no memory region at @gpa or a write was
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  749   *		attempted to a read-only memory region. This is usually handled
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  750   *		as an MMIO access.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  751   */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  752  static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  753  {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  754  	bool writeable;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  755  	int srcu_idx, err, retry_no = 0, level;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  756  	unsigned long hva, mmu_seq, prot_bits;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  757  	kvm_pfn_t pfn;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  758  	kvm_pte_t *ptep, new_pte;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  759  	gfn_t gfn = gpa >> PAGE_SHIFT;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  760  	struct kvm *kvm = vcpu->kvm;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  761  	struct kvm_memory_slot *memslot;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  762  	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  763  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  764  	/* Try the fast path to handle old / clean pages */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  765  	srcu_idx = srcu_read_lock(&kvm->srcu);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  766  	err = kvm_map_page_fast(vcpu, gpa, write);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  767  	if (!err)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  768  		goto out;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  769  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  770  	memslot = gfn_to_memslot(kvm, gfn);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  771  	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writeable);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  772  	if (kvm_is_error_hva(hva) || (write && !writeable)) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  773  		err = -EFAULT;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  774  		goto out;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  775  	}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  776  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  777  	/* We need a minimum of cached pages ready for page table creation */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  778  	err = kvm_mmu_topup_memory_cache(memcache, KVM_MMU_CACHE_MIN_PAGES);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  779  	if (err)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  780  		goto out;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  781  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  782  retry:
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  783  	/*
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  784  	 * Used to check for invalidations in progress, of the pfn that is
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  785  	 * returned by pfn_to_pfn_prot below.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  786  	 */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  787  	mmu_seq = kvm->mmu_invalidate_seq;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  788  	/*
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  789  	 * Ensure the read of mmu_invalidate_seq isn't reordered with PTE reads in
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  790  	 * gfn_to_pfn_prot() (which calls get_user_pages()), so that we don't
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  791  	 * risk the page we get a reference to getting unmapped before we have a
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  792  	 * chance to grab the mmu_lock without mmu_invalidate_retry() noticing.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  793  	 *
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  794  	 * This smp_rmb() pairs with the effective smp_wmb() of the combination
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  795  	 * of the pte_unmap_unlock() after the PTE is zapped, and the
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  796  	 * spin_lock() in kvm_mmu_invalidate_invalidate_<page|range_end>() before
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  797  	 * mmu_invalidate_seq is incremented.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  798  	 */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  799  	smp_rmb();
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  800  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  801  	/* Slow path - ask KVM core whether we can access this GPA */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  802  	pfn = gfn_to_pfn_prot(kvm, gfn, write, &writeable);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  803  	if (is_error_noslot_pfn(pfn)) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  804  		err = -EFAULT;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  805  		goto out;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  806  	}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  807  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  808  	/* Check if an invalidation has taken place since we got pfn */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  809  	spin_lock(&kvm->mmu_lock);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  810  	if (mmu_invalidate_retry_hva(kvm, mmu_seq, hva)) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  811  		/*
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  812  		 * This can happen when mappings are changed asynchronously, but
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  813  		 * also synchronously if a COW is triggered by
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  814  		 * gfn_to_pfn_prot().
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  815  		 */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  816  		spin_unlock(&kvm->mmu_lock);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  817  		kvm_release_pfn_clean(pfn);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  818  		if (retry_no > 100) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  819  			retry_no = 0;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  820  			schedule();
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  821  		}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  822  		retry_no++;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  823  		goto retry;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  824  	}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  825  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  826  	/*
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  827  	 * For emulated devices such virtio device, actual cache attribute is
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  828  	 * determined by physical machine.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  829  	 * For pass through physical device, it should be uncachable
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  830  	 */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  831  	prot_bits = _PAGE_PRESENT | __READABLE;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  832  	if (pfn_valid(pfn))
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  833  		prot_bits |= _CACHE_CC;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  834  	else
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  835  		prot_bits |= _CACHE_SUC;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  836  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  837  	if (writeable) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  838  		prot_bits |= _PAGE_WRITE;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  839  		if (write)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  840  			prot_bits |= __WRITEABLE;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  841  	}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  842  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  843  	/* Disable dirty logging on HugePages */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  844  	level = 0;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  845  	if (!fault_supports_huge_mapping(memslot, hva, PMD_SIZE, write)) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  846  		level = 0;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  847  	} else {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  848  		level = host_pfn_mapping_level(kvm, gfn, memslot);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  849  		if (level == 1) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  850  			gfn = gfn & ~(PTRS_PER_PTE - 1);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  851  			pfn = pfn & ~(PTRS_PER_PTE - 1);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  852  		}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  853  	}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  854  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  855  	/* Ensure page tables are allocated */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  856  	ptep = kvm_populate_gpa(kvm, memcache, gpa, level);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  857  	new_pte = kvm_pfn_pte(pfn, __pgprot(prot_bits));
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  858  	if (level == 1) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  859  		new_pte = kvm_pte_mkhuge(new_pte);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  860  		/*
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  861  		 * previous pmd entry is invalid_pte_table
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  862  		 * there is invalid tlb with small page
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  863  		 * need flush these invalid tlbs for current vcpu
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  864  		 */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  865  		kvm_make_request(KVM_REQ_TLB_FLUSH, vcpu);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  866  		++kvm->stat.hugepages;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02 @867  	}  else if (kvm_pte_huge(*ptep) && write)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  868  		ptep = kvm_split_huge(vcpu, ptep, gfn);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  869  	else
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  870  		++kvm->stat.pages;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  871  	kvm_set_pte(ptep, new_pte);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  872  	spin_unlock(&kvm->mmu_lock);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  873  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  874  	if (prot_bits & _PAGE_DIRTY) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  875  		mark_page_dirty_in_slot(kvm, memslot, gfn);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  876  		kvm_set_pfn_dirty(pfn);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  877  	}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  878  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  879  	kvm_set_pfn_accessed(pfn);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  880  	kvm_release_pfn_clean(pfn);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  881  out:
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  882  	srcu_read_unlock(&kvm->srcu, srcu_idx);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  883  	return err;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  884  }
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  885  

:::::: The code at line 867 was first introduced by commit
:::::: 752e2cd7b4fb412f3e008493e0195e357bab9773 LoongArch: KVM: Implement kvm mmu operations

:::::: TO: Tianrui Zhao <zhaotianrui@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
