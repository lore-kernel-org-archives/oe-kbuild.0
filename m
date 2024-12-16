Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033A26A8D2
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Dec 2024 17:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734370238; cv=none; b=FE89kIXtRRUvkRZTqn4UW1I8+Ea2Be5o9dRl0paBib/sOxilzvJm74BLa1SSo2uy5ep3MV5J4MWAwHdosza6sqSn8keNCA/oipyJ+nAoB6bdvLaXGTB+7hBVDM83FWi4YldM1ij83NTn38NBlM8FwkDxjLacjolLwqr+qVHa2XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734370238; c=relaxed/simple;
	bh=3H8cmyN8osZC/rkespreSz3BlRn1nTIClbwumVwngfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lx1eBCypolOYvv3GRurey/rzaVG96Ti23b84lYOcrVCFJc8Z6cX6CewMdGoo5FXy+rRkIOLPchNACXtHPsY6TfD/LJrFW0erQBRUKjXOIIBanxX0QsdwSN0M2/ZGJ4KUMPn6LJBkR4qiSEZcVEaE8KxipvNKMAAJH7eVk82NlbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ItyDdGF/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ItyDdGF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734370236; x=1765906236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3H8cmyN8osZC/rkespreSz3BlRn1nTIClbwumVwngfY=;
  b=ItyDdGF/b9D92bK6h6upBWaQdlVBxBsjaklwfMznR6hy1vSt8B/9t74X
   r6wKdhdWuF6MIzP2A73swIAhQT2frGBLj21wdK+Lg1yfvJbDTkHDeLS66
   sTfqSAHpJIOQD5iLh1n+2aBBgFxEbbkoFCij/GBpAC9Ik/GUIVL/PQQSD
   kJ3IulypPSA3wVMgPz5plry0G1L6MWqDUQ88wWrgvvynvP6y2Nwp88wAm
   n6zOmRPCCoxBmOVkCvpqZADJ5BFZWiKj2NvcTj1nJ1WGX7K/m2F29PNYT
   /LYXZOSdOnaYqNqKkHT5yJf474qSL4+7DgsbCItxhDqjPII0b3ZODt/Kj
   A==;
X-CSE-ConnectionGUID: peNvUjF5SKWzitlfcwSZbA==
X-CSE-MsgGUID: 81MCwQCOQAmjwJws55J2vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34643868"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="34643868"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 09:30:35 -0800
X-CSE-ConnectionGUID: mCu1dkmQQfmvtIIOi43Nbw==
X-CSE-MsgGUID: 1BPdR4MxRxuC9Lt3Msc8CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="97701028"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Dec 2024 09:30:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNEvP-000EMt-38;
	Mon, 16 Dec 2024 17:30:31 +0000
Date: Tue, 17 Dec 2024 01:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/nested.c:174 get_s2_mmu_nested() error: we previously
 assumed 's2_mmu' could be null (see line 152)
Message-ID: <202412170149.ccSIzNkM-lkp@intel.com>
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
TO: Marc Zyngier <maz@kernel.org>
CC: Oliver Upton <oliver.upton@linux.dev>
CC: Christoffer Dall <christoffer.dall@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
commit: 4f128f8e1aaac189f83d0f828bcdb2986d8d2e51 KVM: arm64: nv: Support multiple nested Stage-2 mmu structures
date:   6 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241217/202412170149.ccSIzNkM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412170149.ccSIzNkM-lkp@intel.com/

smatch warnings:
arch/arm64/kvm/nested.c:174 get_s2_mmu_nested() error: we previously assumed 's2_mmu' could be null (see line 152)

vim +/s2_mmu +174 arch/arm64/kvm/nested.c

4f128f8e1aaac18 Marc Zyngier 2024-06-14  142  
4f128f8e1aaac18 Marc Zyngier 2024-06-14  143  static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
4f128f8e1aaac18 Marc Zyngier 2024-06-14  144  {
4f128f8e1aaac18 Marc Zyngier 2024-06-14  145  	struct kvm *kvm = vcpu->kvm;
4f128f8e1aaac18 Marc Zyngier 2024-06-14  146  	struct kvm_s2_mmu *s2_mmu;
4f128f8e1aaac18 Marc Zyngier 2024-06-14  147  	int i;
4f128f8e1aaac18 Marc Zyngier 2024-06-14  148  
4f128f8e1aaac18 Marc Zyngier 2024-06-14  149  	lockdep_assert_held_write(&vcpu->kvm->mmu_lock);
4f128f8e1aaac18 Marc Zyngier 2024-06-14  150  
4f128f8e1aaac18 Marc Zyngier 2024-06-14  151  	s2_mmu = lookup_s2_mmu(vcpu);
4f128f8e1aaac18 Marc Zyngier 2024-06-14 @152  	if (s2_mmu)
4f128f8e1aaac18 Marc Zyngier 2024-06-14  153  		goto out;
4f128f8e1aaac18 Marc Zyngier 2024-06-14  154  
4f128f8e1aaac18 Marc Zyngier 2024-06-14  155  	/*
4f128f8e1aaac18 Marc Zyngier 2024-06-14  156  	 * Make sure we don't always search from the same point, or we
4f128f8e1aaac18 Marc Zyngier 2024-06-14  157  	 * will always reuse a potentially active context, leaving
4f128f8e1aaac18 Marc Zyngier 2024-06-14  158  	 * free contexts unused.
4f128f8e1aaac18 Marc Zyngier 2024-06-14  159  	 */
4f128f8e1aaac18 Marc Zyngier 2024-06-14  160  	for (i = kvm->arch.nested_mmus_next;
4f128f8e1aaac18 Marc Zyngier 2024-06-14  161  	     i < (kvm->arch.nested_mmus_size + kvm->arch.nested_mmus_next);
4f128f8e1aaac18 Marc Zyngier 2024-06-14  162  	     i++) {
4f128f8e1aaac18 Marc Zyngier 2024-06-14  163  		s2_mmu = &kvm->arch.nested_mmus[i % kvm->arch.nested_mmus_size];
4f128f8e1aaac18 Marc Zyngier 2024-06-14  164  
4f128f8e1aaac18 Marc Zyngier 2024-06-14  165  		if (atomic_read(&s2_mmu->refcnt) == 0)
4f128f8e1aaac18 Marc Zyngier 2024-06-14  166  			break;
4f128f8e1aaac18 Marc Zyngier 2024-06-14  167  	}
4f128f8e1aaac18 Marc Zyngier 2024-06-14  168  	BUG_ON(atomic_read(&s2_mmu->refcnt)); /* We have struct MMUs to spare */
4f128f8e1aaac18 Marc Zyngier 2024-06-14  169  
4f128f8e1aaac18 Marc Zyngier 2024-06-14  170  	/* Set the scene for the next search */
4f128f8e1aaac18 Marc Zyngier 2024-06-14  171  	kvm->arch.nested_mmus_next = (i + 1) % kvm->arch.nested_mmus_size;
4f128f8e1aaac18 Marc Zyngier 2024-06-14  172  
4f128f8e1aaac18 Marc Zyngier 2024-06-14  173  	/* Clear the old state */
4f128f8e1aaac18 Marc Zyngier 2024-06-14 @174  	if (kvm_s2_mmu_valid(s2_mmu))
4f128f8e1aaac18 Marc Zyngier 2024-06-14  175  		kvm_stage2_unmap_range(s2_mmu, 0, kvm_phys_size(s2_mmu));
4f128f8e1aaac18 Marc Zyngier 2024-06-14  176  
4f128f8e1aaac18 Marc Zyngier 2024-06-14  177  	/*
4f128f8e1aaac18 Marc Zyngier 2024-06-14  178  	 * The virtual VMID (modulo CnP) will be used as a key when matching
4f128f8e1aaac18 Marc Zyngier 2024-06-14  179  	 * an existing kvm_s2_mmu.
4f128f8e1aaac18 Marc Zyngier 2024-06-14  180  	 *
4f128f8e1aaac18 Marc Zyngier 2024-06-14  181  	 * We cache VTCR at allocation time, once and for all. It'd be great
4f128f8e1aaac18 Marc Zyngier 2024-06-14  182  	 * if the guest didn't screw that one up, as this is not very
4f128f8e1aaac18 Marc Zyngier 2024-06-14  183  	 * forgiving...
4f128f8e1aaac18 Marc Zyngier 2024-06-14  184  	 */
4f128f8e1aaac18 Marc Zyngier 2024-06-14  185  	s2_mmu->tlb_vttbr = vcpu_read_sys_reg(vcpu, VTTBR_EL2) & ~VTTBR_CNP_BIT;
4f128f8e1aaac18 Marc Zyngier 2024-06-14  186  	s2_mmu->tlb_vtcr = vcpu_read_sys_reg(vcpu, VTCR_EL2);
4f128f8e1aaac18 Marc Zyngier 2024-06-14  187  	s2_mmu->nested_stage2_enabled = vcpu_read_sys_reg(vcpu, HCR_EL2) & HCR_VM;
4f128f8e1aaac18 Marc Zyngier 2024-06-14  188  
4f128f8e1aaac18 Marc Zyngier 2024-06-14  189  out:
4f128f8e1aaac18 Marc Zyngier 2024-06-14  190  	atomic_inc(&s2_mmu->refcnt);
4f128f8e1aaac18 Marc Zyngier 2024-06-14  191  	return s2_mmu;
4f128f8e1aaac18 Marc Zyngier 2024-06-14  192  }
4f128f8e1aaac18 Marc Zyngier 2024-06-14  193  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
