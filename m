Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F34E5A7AA
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729348421; cv=none; b=pQz/DZ5FSxw1Bv7oklKG80lnneIbjITA11zxx8UXeOX0yvXaqeY+AalM4T6J6RxMgEfSE/mKjEmzMRbty8dGOGwUwOkcC+tzzWJdZYXOmyT6qmWJqZaPF31dH4NhgScCxvParSYiziDHBGrnrlDhu2QFN7GPgJYMfvE06HSunjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729348421; c=relaxed/simple;
	bh=Uud01JDOfDrr2GlbFSQ/d6Bq+1GGeAhf8TVhAhkW1XU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aUjywfrtcfhYI2wp2Fd/sf+BXvIJbNc/HD+wMoaDl/bZn8NM7VRYqHXXYg4iKQmwpnIBaN21m2WroFVytDCefKcQZbGCrn/Dy+LIk2/zSz0r4nqW0ZnT2qPi2/pJJsvvuJZ4RdJlLzJOUt57HvzFdweK3aYFtiYIrQkQvxT6qTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHMCqLgn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHMCqLgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729348419; x=1760884419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uud01JDOfDrr2GlbFSQ/d6Bq+1GGeAhf8TVhAhkW1XU=;
  b=cHMCqLgnYoH74jtmCpVQrzOiQNb1RTIG1gc1A4ko9Y1WkI7+ABa6n8i4
   sCyY/yIeCvMt7QpGb4FrajVJWCB++6lYv8d3ZQnf1O5QOF4w5gjB5TEhu
   /mfc2sHPyBbVkV4t1VnH0CyvIGhIsnQK7r/0+mpoZO+ZuQWgCX90uMGnd
   3/VZwp7aX1GKKAUP7zHMWOGs49javnPeUW84wE2XywWKp0xoAacLEfL/2
   sS2lpg+h5AZ0Fi/iWoSMdEW6zxm3n7OD7+GJ+WH8MeR6qJCvJG3YaGY9l
   689MRwdOmnxB/eHt3RLv14NrXD6/gefWjnq3IG5Aab5QObvwr/1KF9VqL
   Q==;
X-CSE-ConnectionGUID: XIT914GdQW2hmMhwxwT1dg==
X-CSE-MsgGUID: +Foz+79zSuqgxkR+eEwhyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28754773"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28754773"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 07:33:36 -0700
X-CSE-ConnectionGUID: oY5eEr7hRkKoW1bITgKeRw==
X-CSE-MsgGUID: v6iiX2T4TPao+4It7aKTPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="83744080"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Oct 2024 07:33:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2AWK-000P4c-2r;
	Sat, 19 Oct 2024 14:33:32 +0000
Date: Sat, 19 Oct 2024 22:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/nested.c:174 get_s2_mmu_nested() error: we previously
 assumed 's2_mmu' could be null (see line 152)
Message-ID: <202410192211.6zHd8Ix2-lkp@intel.com>
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
head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
commit: 4f128f8e1aaac189f83d0f828bcdb2986d8d2e51 KVM: arm64: nv: Support multiple nested Stage-2 mmu structures
date:   4 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241019/202410192211.6zHd8Ix2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410192211.6zHd8Ix2-lkp@intel.com/

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
