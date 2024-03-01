Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BB16A035
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Mar 2024 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709282699; cv=none; b=HYYp5aKib/7NLs4G6aSDKGzReT2optgOPbXc67uDhcqpeb8D0JuoROFxnyvoM2eXLl2NKN+o4hRVKVXupx+gPDlRPIGR/t7WGxeAC0p/bhTDAKrOPumrBc/NsilzkFfO317YeGXU5es5JXcvYeBycxIzpVCwXoftAX0IKMcpXjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709282699; c=relaxed/simple;
	bh=4pkXvVGBcv2gi+j00bizFGgoiuXMDzO+A85NQPj8PMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bPm4ncxxz57RrsKnR2V6z1vP4e1hHA4wOmgSk4bPxo2PQwN4OLEOOISpoRSn3jTfLYgiov0yPP7mFqeXdfH3ciSNOTT6KVhvUGnrCio+q70w6cuSx/peCxF68/f3hdcQx799S8cCqivzJwcfmxEryFGzCknI+CCJGQKlsTnV+3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAoBatu+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAoBatu+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709282697; x=1740818697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4pkXvVGBcv2gi+j00bizFGgoiuXMDzO+A85NQPj8PMk=;
  b=oAoBatu+sB/YlAKRu/0+nXBIXnhGsz9Ak/xVHtzvezavi+Y5EYx3GKyK
   8H+zWZf16rnBFPubLR9YlBq1e13xFyD4fyfMKmSuNYFsb3y+JOx/svzv1
   3SCLbkXytwHsFWzfNI35k3zNZ4ta29ICR5qHleh0dkwMghgHEeEKpzVOD
   PIWGfpfLen679fqcD/5TdI3XuDr1q7wZ6Qq8W4J6nQduY4+LlAEFTsu9V
   ktjG8hFULrwm+7+zIL6vNnGQnEberFAUwUU7iih71DTycIbP0aGvEospN
   TbIRdh4CVyIUyOqjErOiTYGHcbCq7SSC7lTVFrys7bJljThqBfaXPWrfu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14449581"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="14449581"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 00:44:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8024899"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Mar 2024 00:44:56 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfyVh-000Dfz-23;
	Fri, 01 Mar 2024 08:44:53 +0000
Date: Fri, 1 Mar 2024 16:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1670
 kvm_commit_memory_region() error: we previously assumed 'old' could be null
 (see line 1663)
Message-ID: <202403011612.ha92fMO8-lkp@intel.com>
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
head:   87adedeba51a822533649b143232418b9e26d08b
commit: c1fc48aad14dbe7654f5986afb906332b528d54b LoongArch: KVM: Enable kvm config and add the makefile
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r081-20240225 (https://download.01.org/0day-ci/archive/20240301/202403011612.ha92fMO8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403011612.ha92fMO8-lkp@intel.com/

New smatch warnings:
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1670 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1663)
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1672 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1664)
arch/loongarch/kvm/mmu.c:867 kvm_map_page() warn: if statement not indented

Old smatch warnings:
arch/loongarch/include/asm/atomic.h:109 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +/old +1670 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c

36947254e5f981 Sean Christopherson 2020-02-18  1657  
07921665a65191 Sean Christopherson 2021-12-06  1658  static void kvm_commit_memory_region(struct kvm *kvm,
07921665a65191 Sean Christopherson 2021-12-06  1659  				     struct kvm_memory_slot *old,
07921665a65191 Sean Christopherson 2021-12-06  1660  				     const struct kvm_memory_slot *new,
cf47f50b5c2e24 Sean Christopherson 2020-02-18  1661  				     enum kvm_mr_change change)
cf47f50b5c2e24 Sean Christopherson 2020-02-18  1662  {
6c7b2202e4d115 Paolo Bonzini       2022-11-17 @1663  	int old_flags = old ? old->flags : 0;
6c7b2202e4d115 Paolo Bonzini       2022-11-17 @1664  	int new_flags = new ? new->flags : 0;
07921665a65191 Sean Christopherson 2021-12-06  1665  	/*
07921665a65191 Sean Christopherson 2021-12-06  1666  	 * Update the total number of memslot pages before calling the arch
07921665a65191 Sean Christopherson 2021-12-06  1667  	 * hook so that architectures can consume the result directly.
07921665a65191 Sean Christopherson 2021-12-06  1668  	 */
07921665a65191 Sean Christopherson 2021-12-06  1669  	if (change == KVM_MR_DELETE)
07921665a65191 Sean Christopherson 2021-12-06 @1670  		kvm->nr_memslot_pages -= old->npages;
07921665a65191 Sean Christopherson 2021-12-06  1671  	else if (change == KVM_MR_CREATE)
07921665a65191 Sean Christopherson 2021-12-06 @1672  		kvm->nr_memslot_pages += new->npages;
cf47f50b5c2e24 Sean Christopherson 2020-02-18  1673  
6c7b2202e4d115 Paolo Bonzini       2022-11-17  1674  	if ((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES) {
6c7b2202e4d115 Paolo Bonzini       2022-11-17  1675  		int change = (new_flags & KVM_MEM_LOG_DIRTY_PAGES) ? 1 : -1;
6c7b2202e4d115 Paolo Bonzini       2022-11-17  1676  		atomic_set(&kvm->nr_memslots_dirty_logging,
6c7b2202e4d115 Paolo Bonzini       2022-11-17  1677  			   atomic_read(&kvm->nr_memslots_dirty_logging) + change);
6c7b2202e4d115 Paolo Bonzini       2022-11-17  1678  	}
6c7b2202e4d115 Paolo Bonzini       2022-11-17  1679  
07921665a65191 Sean Christopherson 2021-12-06  1680  	kvm_arch_commit_memory_region(kvm, old, new, change);
07921665a65191 Sean Christopherson 2021-12-06  1681  
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1682  	switch (change) {
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1683  	case KVM_MR_CREATE:
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1684  		/* Nothing more to do. */
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1685  		break;
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1686  	case KVM_MR_DELETE:
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1687  		/* Free the old memslot and all its metadata. */
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1688  		kvm_free_memslot(kvm, old);
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1689  		break;
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1690  	case KVM_MR_MOVE:
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1691  	case KVM_MR_FLAGS_ONLY:
b10a038e84d188 Ben Gardon          2021-05-18  1692  		/*
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1693  		 * Free the dirty bitmap as needed; the below check encompasses
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1694  		 * both the flags and whether a ring buffer is being used)
07921665a65191 Sean Christopherson 2021-12-06  1695  		 */
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1696  		if (old->dirty_bitmap && !new->dirty_bitmap)
07921665a65191 Sean Christopherson 2021-12-06  1697  			kvm_destroy_dirty_bitmap(old);
07921665a65191 Sean Christopherson 2021-12-06  1698  
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1699  		/*
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1700  		 * The final quirk.  Free the detached, old slot, but only its
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1701  		 * memory, not any metadata.  Metadata, including arch specific
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1702  		 * data, may be reused by @new.
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1703  		 */
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1704  		kfree(old);
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1705  		break;
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1706  	default:
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1707  		BUG();
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1708  	}
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1709  }
cf47f50b5c2e24 Sean Christopherson 2020-02-18  1710  

:::::: The code at line 1670 was first introduced by commit
:::::: 07921665a651918350bc6653d4ca8a516a867b4b KVM: Use prepare/commit hooks to handle generic memslot metadata updates

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
