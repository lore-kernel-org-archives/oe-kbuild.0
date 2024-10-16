Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C98C1384B3
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 15:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094011; cv=none; b=cf7y8NcGWmQQNVfD6hnwsLzGekzrxc7oirBMbN/xAcRAo5neGehOT2RSiBvPfVFDWqK48/mGtB7+6bT/QSoqPp6/7JfHYn4rYX5Oe+Zxfr94yNucl7ddf/yJ1IKO7dfbBgLsn84HpDYrnh1ZFZMvD1fh3R7m9wN3o/HlTklNCZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094011; c=relaxed/simple;
	bh=i+htVlshzFMvGoni3Id18yY9pnBN/ADXloBO/Ldn7lE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQkcjpTvHe7BHlh+Mvjsjl0ISSRM4Whatle8JYioAuYOgU+bZTbMF2ZsCRvgF8vkJNHPnWRydPKnImfPVpOBwO0gTFVL+g+hm+w8yO1ocuFcJByRnwBY62V2k3V/XdcLs9iZC2aZmg5Fwa+cT90/JaEXpaOayX5A4ugpdnq5UAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8zkiAwp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8zkiAwp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729094010; x=1760630010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i+htVlshzFMvGoni3Id18yY9pnBN/ADXloBO/Ldn7lE=;
  b=n8zkiAwp+XzP7hAdGrnQ0AfqhWCf2HIGbrE7ai66M+fSGleHB/eWis7M
   0nP6/HPvbtoRU+BiSGPwxkt0dDzY1NyZWXgZcNI8IANHjz7WJB9U1mE/Z
   gFBVu3ZvnB3LMtPnK0dxMxBPufGbOkKBO/Etud8vloznjvhguzH2wE5db
   DWKr0SheB81ZvOnKz7OwAALqqKE2Rh5fMH/Nxv4PLH6OvwZuHnUmnnHf4
   sEvKMeuaFa6NQMLyM5hBALSlfe+cobzuzOrpKuvXSWsGtjYSwFyoaKCr8
   2K/zzXZ6e3A1l0DktZPXEFmwDKpsNw0fMwJki5dsMEqGHOkVdYfYYxOkl
   A==;
X-CSE-ConnectionGUID: I9us42QzQqmyPUXL6c6s6A==
X-CSE-MsgGUID: a3EHsSMlSiWHjfF1BZscGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28645911"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28645911"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 08:53:30 -0700
X-CSE-ConnectionGUID: OiqggZxfQnO+ChMEOV8m7Q==
X-CSE-MsgGUID: PZIOHFnWQ5iwUlsL/nT+YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="78157691"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Oct 2024 08:53:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t16L0-000L5X-1E;
	Wed, 16 Oct 2024 15:53:26 +0000
Date: Wed, 16 Oct 2024 23:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/nested.c:174 get_s2_mmu_nested() error: we previously
 assumed 's2_mmu' could be null (see line 152)
Message-ID: <202410162324.8Uhdjwdm-lkp@intel.com>
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
head:   2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
commit: 4f128f8e1aaac189f83d0f828bcdb2986d8d2e51 KVM: arm64: nv: Support multiple nested Stage-2 mmu structures
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241016/202410162324.8Uhdjwdm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410162324.8Uhdjwdm-lkp@intel.com/

smatch warnings:
arch/arm64/kvm/nested.c:174 get_s2_mmu_nested() error: we previously assumed 's2_mmu' could be null (see line 152)

vim +/s2_mmu +174 arch/arm64/kvm/nested.c

4f128f8e1aaac1 Marc Zyngier 2024-06-14  142  
4f128f8e1aaac1 Marc Zyngier 2024-06-14  143  static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
4f128f8e1aaac1 Marc Zyngier 2024-06-14  144  {
4f128f8e1aaac1 Marc Zyngier 2024-06-14  145  	struct kvm *kvm = vcpu->kvm;
4f128f8e1aaac1 Marc Zyngier 2024-06-14  146  	struct kvm_s2_mmu *s2_mmu;
4f128f8e1aaac1 Marc Zyngier 2024-06-14  147  	int i;
4f128f8e1aaac1 Marc Zyngier 2024-06-14  148  
4f128f8e1aaac1 Marc Zyngier 2024-06-14  149  	lockdep_assert_held_write(&vcpu->kvm->mmu_lock);
4f128f8e1aaac1 Marc Zyngier 2024-06-14  150  
4f128f8e1aaac1 Marc Zyngier 2024-06-14  151  	s2_mmu = lookup_s2_mmu(vcpu);
4f128f8e1aaac1 Marc Zyngier 2024-06-14 @152  	if (s2_mmu)
4f128f8e1aaac1 Marc Zyngier 2024-06-14  153  		goto out;
4f128f8e1aaac1 Marc Zyngier 2024-06-14  154  
4f128f8e1aaac1 Marc Zyngier 2024-06-14  155  	/*
4f128f8e1aaac1 Marc Zyngier 2024-06-14  156  	 * Make sure we don't always search from the same point, or we
4f128f8e1aaac1 Marc Zyngier 2024-06-14  157  	 * will always reuse a potentially active context, leaving
4f128f8e1aaac1 Marc Zyngier 2024-06-14  158  	 * free contexts unused.
4f128f8e1aaac1 Marc Zyngier 2024-06-14  159  	 */
4f128f8e1aaac1 Marc Zyngier 2024-06-14  160  	for (i = kvm->arch.nested_mmus_next;
4f128f8e1aaac1 Marc Zyngier 2024-06-14  161  	     i < (kvm->arch.nested_mmus_size + kvm->arch.nested_mmus_next);
4f128f8e1aaac1 Marc Zyngier 2024-06-14  162  	     i++) {
4f128f8e1aaac1 Marc Zyngier 2024-06-14  163  		s2_mmu = &kvm->arch.nested_mmus[i % kvm->arch.nested_mmus_size];
4f128f8e1aaac1 Marc Zyngier 2024-06-14  164  
4f128f8e1aaac1 Marc Zyngier 2024-06-14  165  		if (atomic_read(&s2_mmu->refcnt) == 0)
4f128f8e1aaac1 Marc Zyngier 2024-06-14  166  			break;
4f128f8e1aaac1 Marc Zyngier 2024-06-14  167  	}
4f128f8e1aaac1 Marc Zyngier 2024-06-14  168  	BUG_ON(atomic_read(&s2_mmu->refcnt)); /* We have struct MMUs to spare */
4f128f8e1aaac1 Marc Zyngier 2024-06-14  169  
4f128f8e1aaac1 Marc Zyngier 2024-06-14  170  	/* Set the scene for the next search */
4f128f8e1aaac1 Marc Zyngier 2024-06-14  171  	kvm->arch.nested_mmus_next = (i + 1) % kvm->arch.nested_mmus_size;
4f128f8e1aaac1 Marc Zyngier 2024-06-14  172  
4f128f8e1aaac1 Marc Zyngier 2024-06-14  173  	/* Clear the old state */
4f128f8e1aaac1 Marc Zyngier 2024-06-14 @174  	if (kvm_s2_mmu_valid(s2_mmu))
4f128f8e1aaac1 Marc Zyngier 2024-06-14  175  		kvm_stage2_unmap_range(s2_mmu, 0, kvm_phys_size(s2_mmu));
4f128f8e1aaac1 Marc Zyngier 2024-06-14  176  
4f128f8e1aaac1 Marc Zyngier 2024-06-14  177  	/*
4f128f8e1aaac1 Marc Zyngier 2024-06-14  178  	 * The virtual VMID (modulo CnP) will be used as a key when matching
4f128f8e1aaac1 Marc Zyngier 2024-06-14  179  	 * an existing kvm_s2_mmu.
4f128f8e1aaac1 Marc Zyngier 2024-06-14  180  	 *
4f128f8e1aaac1 Marc Zyngier 2024-06-14  181  	 * We cache VTCR at allocation time, once and for all. It'd be great
4f128f8e1aaac1 Marc Zyngier 2024-06-14  182  	 * if the guest didn't screw that one up, as this is not very
4f128f8e1aaac1 Marc Zyngier 2024-06-14  183  	 * forgiving...
4f128f8e1aaac1 Marc Zyngier 2024-06-14  184  	 */
4f128f8e1aaac1 Marc Zyngier 2024-06-14  185  	s2_mmu->tlb_vttbr = vcpu_read_sys_reg(vcpu, VTTBR_EL2) & ~VTTBR_CNP_BIT;
4f128f8e1aaac1 Marc Zyngier 2024-06-14  186  	s2_mmu->tlb_vtcr = vcpu_read_sys_reg(vcpu, VTCR_EL2);
4f128f8e1aaac1 Marc Zyngier 2024-06-14  187  	s2_mmu->nested_stage2_enabled = vcpu_read_sys_reg(vcpu, HCR_EL2) & HCR_VM;
4f128f8e1aaac1 Marc Zyngier 2024-06-14  188  
4f128f8e1aaac1 Marc Zyngier 2024-06-14  189  out:
4f128f8e1aaac1 Marc Zyngier 2024-06-14  190  	atomic_inc(&s2_mmu->refcnt);
4f128f8e1aaac1 Marc Zyngier 2024-06-14  191  	return s2_mmu;
4f128f8e1aaac1 Marc Zyngier 2024-06-14  192  }
4f128f8e1aaac1 Marc Zyngier 2024-06-14  193  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
