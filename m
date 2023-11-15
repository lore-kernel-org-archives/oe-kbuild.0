Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B8428376
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MB/jTEpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700068238; x=1731604238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W9Es7q54sBdBM+K6MRQ6yqpPwlJzVtwk0cEHfdZgl18=;
  b=MB/jTEpYyjljODRCo/NM+34j1kODUZKt7ZB/GytYGkQg/gA1zyL5TXNv
   YgdoH33rztd7rbtI1up9DWkRe7cJE5BYAbjUytboVEKQEkuKjMhV73mU6
   52NnkSxKfR2vU8CKhcr7FAyY+SOdYKXWrCT5e1CbqD6TGbQAorlEdQZOO
   kwLwMrYuxsjAI/SF0Nxg6tZhgPbxMUIoKUvrWbFVqMUd56+hUP9LQ4RDJ
   yVfHlAq1oi2ay7dMKYfe+3g5GvnlfC4VgX9Rnq305sFM7TavASpafM7f5
   aYthxM0OKVLZMTczc3oE15UIIFDVB1d0RLQsEVgaN4ZQ8UVO7KbaEh4NW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="375955654"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="375955654"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 09:10:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1012339189"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="1012339189"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 15 Nov 2023 09:10:00 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3JOm-0000dt-38;
	Wed, 15 Nov 2023 17:09:57 +0000
Date: Thu, 16 Nov 2023 01:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1651
 kvm_commit_memory_region() error: we previously assumed 'old' could be null
 (see line 1644)
Message-ID: <202311160102.spj39q3d-lkp@intel.com>
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
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 6c7b2202e4d11572ab23a89aeec49005b94bb966 KVM: x86: avoid memslot check in NX hugepage recovery if it cannot succeed
date:   12 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-r071-20231112 (https://download.01.org/0day-ci/archive/20231116/202311160102.spj39q3d-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160102.spj39q3d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311160102.spj39q3d-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
