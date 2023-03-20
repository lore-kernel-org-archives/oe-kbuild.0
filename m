Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28F46D1B
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Mar 2023 19:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679341006; x=1710877006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZlPDR1zFhaOR4zJv2rNRzsolXiyRCCJYtYlX6daG3Z4=;
  b=bj5NIywl5OZZ8VToxehVZvh1rTWMxes45v6O25NFyky4k/LJ138FN3fi
   EcNY4iIymN29fXVJCgcJr3lHocB0dHYPY1GRPckpUbw/3RfJpe0TOduAe
   1VNbgPXpH4e7l06EKclGPejqPAUaX0nkEBXjncCa7kqx8FKZZBH/uaur3
   vFNwQLJ/rFfDiVzOnc40ljGkq9JnalkK1Hc2trpGaE0xZE0RRJ/PFpkRZ
   HDbOyHQ/sO5PpNt02VZssnPzXblNE9+WMMrDQo58WF4GLWcl+I7fePmAU
   UUo07exxPeqc+vrsjvNyNDek3U2cyhH9R8da2U7Xzo2mDZJlPG1POUc3Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="341121098"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="341121098"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 12:32:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="824615835"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="824615835"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Mar 2023 12:32:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peLFW-000BGM-2n;
	Mon, 20 Mar 2023 19:32:54 +0000
Date: Tue, 21 Mar 2023 03:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1651
 kvm_commit_memory_region() error: we previously assumed 'old' could be null
 (see line 1644)
Message-ID: <202303210344.6CnhmgNx-lkp@intel.com>
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
TO: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7d31677bb7b1944ac89e9155110dc1b9acbb3895
commit: 6c7b2202e4d11572ab23a89aeec49005b94bb966 KVM: x86: avoid memslot check in NX hugepage recovery if it cannot succeed
date:   4 months ago
:::::: branch date: 71 minutes ago
:::::: commit date: 4 months ago
config: riscv-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230321/202303210344.6CnhmgNx-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303210344.6CnhmgNx-lkp@intel.com/

New smatch warnings:
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1651 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1644)
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1653 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1645)

Old smatch warnings:
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +/old +1651 arch/riscv/kvm/../../../virt/kvm/kvm_main.c

36947254e5f981 Sean Christopherson 2020-02-18  1638  
07921665a65191 Sean Christopherson 2021-12-06  1639  static void kvm_commit_memory_region(struct kvm *kvm,
07921665a65191 Sean Christopherson 2021-12-06  1640  				     struct kvm_memory_slot *old,
07921665a65191 Sean Christopherson 2021-12-06  1641  				     const struct kvm_memory_slot *new,
cf47f50b5c2e24 Sean Christopherson 2020-02-18  1642  				     enum kvm_mr_change change)
cf47f50b5c2e24 Sean Christopherson 2020-02-18  1643  {
6c7b2202e4d115 Paolo Bonzini       2022-11-17 @1644  	int old_flags = old ? old->flags : 0;
6c7b2202e4d115 Paolo Bonzini       2022-11-17 @1645  	int new_flags = new ? new->flags : 0;
07921665a65191 Sean Christopherson 2021-12-06  1646  	/*
07921665a65191 Sean Christopherson 2021-12-06  1647  	 * Update the total number of memslot pages before calling the arch
07921665a65191 Sean Christopherson 2021-12-06  1648  	 * hook so that architectures can consume the result directly.
07921665a65191 Sean Christopherson 2021-12-06  1649  	 */
07921665a65191 Sean Christopherson 2021-12-06  1650  	if (change == KVM_MR_DELETE)
07921665a65191 Sean Christopherson 2021-12-06 @1651  		kvm->nr_memslot_pages -= old->npages;
07921665a65191 Sean Christopherson 2021-12-06  1652  	else if (change == KVM_MR_CREATE)
07921665a65191 Sean Christopherson 2021-12-06 @1653  		kvm->nr_memslot_pages += new->npages;
cf47f50b5c2e24 Sean Christopherson 2020-02-18  1654  
6c7b2202e4d115 Paolo Bonzini       2022-11-17  1655  	if ((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES) {
6c7b2202e4d115 Paolo Bonzini       2022-11-17  1656  		int change = (new_flags & KVM_MEM_LOG_DIRTY_PAGES) ? 1 : -1;
6c7b2202e4d115 Paolo Bonzini       2022-11-17  1657  		atomic_set(&kvm->nr_memslots_dirty_logging,
6c7b2202e4d115 Paolo Bonzini       2022-11-17  1658  			   atomic_read(&kvm->nr_memslots_dirty_logging) + change);
6c7b2202e4d115 Paolo Bonzini       2022-11-17  1659  	}
6c7b2202e4d115 Paolo Bonzini       2022-11-17  1660  
07921665a65191 Sean Christopherson 2021-12-06  1661  	kvm_arch_commit_memory_region(kvm, old, new, change);
07921665a65191 Sean Christopherson 2021-12-06  1662  
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1663  	switch (change) {
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1664  	case KVM_MR_CREATE:
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1665  		/* Nothing more to do. */
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1666  		break;
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1667  	case KVM_MR_DELETE:
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1668  		/* Free the old memslot and all its metadata. */
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1669  		kvm_free_memslot(kvm, old);
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1670  		break;
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1671  	case KVM_MR_MOVE:
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1672  	case KVM_MR_FLAGS_ONLY:
b10a038e84d188 Ben Gardon          2021-05-18  1673  		/*
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1674  		 * Free the dirty bitmap as needed; the below check encompasses
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1675  		 * both the flags and whether a ring buffer is being used)
07921665a65191 Sean Christopherson 2021-12-06  1676  		 */
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1677  		if (old->dirty_bitmap && !new->dirty_bitmap)
07921665a65191 Sean Christopherson 2021-12-06  1678  			kvm_destroy_dirty_bitmap(old);
07921665a65191 Sean Christopherson 2021-12-06  1679  
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1680  		/*
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1681  		 * The final quirk.  Free the detached, old slot, but only its
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1682  		 * memory, not any metadata.  Metadata, including arch specific
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1683  		 * data, may be reused by @new.
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1684  		 */
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1685  		kfree(old);
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1686  		break;
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1687  	default:
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1688  		BUG();
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1689  	}
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1690  }
cf47f50b5c2e24 Sean Christopherson 2020-02-18  1691  

:::::: The code at line 1651 was first introduced by commit
:::::: 07921665a651918350bc6653d4ca8a516a867b4b KVM: Use prepare/commit hooks to handle generic memslot metadata updates

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
