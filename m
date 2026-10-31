Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793427929;
	b=c5DUnKedQqdIpMWjiyJGQEnK210btS+/ANmFAP7nc6mIjMlI5VwaPyS6WQtvWEzWA5a7
	 lZilcXp8SMIFC57u77MiiSM+MBFJkPUVNfhKg2G93DDvZTUFv12uisEEgUaofmthvhH42
	 QGiNm2TZ2khXcrGJo+AvkGjks8oyPmX8aVLcdhFezrOYNlQxe22jI1nciE/JOVZk4BUAJ
	 d6/EwdV85E2dbpQsZm75JNaw/mxya9grlsjrORbGWQ5Aug69SauMvok7FVPMe00QgVKLe
	 S86rMpysPaxtlVwubnwLvn3o+zQbPfaP5gtnS0j4OWYBXqv6NTU9UXbti+5nqtF6Nww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793427929;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OBllNpfBVb1lR9rt3Gn+ohj6gHEt1lDChZwVY7jBnUA=;
	b=HAdRo+c7J6CrhshfPXKCkxlc/mdixe7g09Ru5uWz4gwRXXXzxXTmhr6Vefl/OgquHNo+
	 WCkIoF8z1zQUPQuhl/k/NgfVQRAOIi+BEmzBEclDD5Kn3r/An1Vlyf+51LqNEL/tz+0cx
	 rg7xskPqrQFpuEFHJR4X8QjcLtS0U+Y/BFD9j173As3FzvYV4MMFcjCTyxpVyIAs0blX3
	 DSJ+1idbnOvNpUGb88QX7iNNIG59aKGBQtRD3WNg8eKYdHXAvv8qU8+VM9AwLPxppgTFX
	 1purjaUCgf3e4rhwUk46pioqWO8E0VL9SGtXRnsYNjxMe4g2egYVyBJbCUiQDH1pV4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gmGfoqFt;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F9D606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 06:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67F9D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gmGfoqFt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793427929; x=1824963929;
  h=date:from:to:cc:subject:message-id;
  bh=fFx4q0ms+JaTbtw5iG8ThV8KASkYTifGYfP71GqvSao=;
  b=gmGfoqFta2LcLe6E8DuyX3OQve/QN8rLqY3RBXWPpUuDHccN/sWEu26L
   Xv+3ZTqcEGAHPHFTNVT0srqkH6pPjb29g8VMaCBdJWq4+5bJVWi4jMCny
   Wh2Sdum2Zepn9pnPMrjuxNugneNlg5QZFRMQHiPcCOqb1V8mSU5ynQE4i
   BwDuZCVd62GyYALt9Y7kJee23T4T8M93Y3uCJ5UIsIss1IVNjWNCc3pzt
   MTPiLx9u4bzD4So7IKhZBNKqlyyOtEVF8SEyZsUFpMdx2lnAtG91ht3H+
   hyEvoyqzKGC4vQFVovXmY/1FIiPOocmKH0e0SWScR9jX61fTc/eB6a6LK
   A==;
X-CSE-ConnectionGUID: HdTN+36FSDOeO3EwL9vIYw==
X-CSE-MsgGUID: p7yMc/x2RQ2YWvzff/B+lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2193564"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2193564"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 23:25:28 -0700
X-CSE-ConnectionGUID: IBuRmAj1TxyIXipX6FES+Q==
X-CSE-MsgGUID: AbrA/I48QcS7iszIsHNtHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7450957"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 30 Oct 2026 23:25:26 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN2Wq-000000005tT-255p;
	Sat, 31 Oct 2026 06:25:24 +0000
Date: Sat, 31 Oct 2026 07:25:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: virt/kvm/kvm_main.c:1989:1-7: preceding lock on line 1909
Message-ID: <202610310716.TfjqI8r7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sean Christopherson <seanjc@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2a500a04d6f969318c05f46aedb6e73fc1963a00
commit: 3fe5d2944e5ac3fc5073344b0982c73703332e18 KVM: guest_memfd: Establish memslot<=>guest_memfd bindings *after* memslot is ready
date:   6 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 weeks ago
config: loongarch-randconfig-r2103-20261029 (https://download.01.org/0day-ci/archive/20261031/202610310716.TfjqI8r7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3fe5d2944e5a ("KVM: guest_memfd: Establish memslot<=>guest_memfd bindings *after* memslot is ready")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610310716.TfjqI8r7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> virt/kvm/kvm_main.c:1989:1-7: preceding lock on line 1909

vim +1989 virt/kvm/kvm_main.c

cf47f50b5c2e24 Sean Christopherson 2020-02-18  1886  
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1887  static int kvm_set_memslot(struct kvm *kvm,
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1888  			   struct kvm_memory_slot *old,
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1889  			   struct kvm_memory_slot *new,
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1890  			   enum kvm_mr_change change)
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1891  {
244893fa2859d6 Sean Christopherson 2021-12-06  1892  	struct kvm_memory_slot *invalid_slot;
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1893  	int r;
bda44d844758c7 Sean Christopherson 2021-11-04  1894  
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1895  	/*
b0d237087c674c Jun Miao            2023-02-23  1896  	 * Released in kvm_swap_active_memslots().
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1897  	 *
b0d237087c674c Jun Miao            2023-02-23  1898  	 * Must be held from before the current memslots are copied until after
b0d237087c674c Jun Miao            2023-02-23  1899  	 * the new memslots are installed with rcu_assign_pointer, then
b0d237087c674c Jun Miao            2023-02-23  1900  	 * released before the synchronize srcu in kvm_swap_active_memslots().
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1901  	 *
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1902  	 * When modifying memslots outside of the slots_lock, must be held
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1903  	 * before reading the pointer to the current memslots until after all
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1904  	 * changes to those memslots are complete.
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1905  	 *
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1906  	 * These rules ensure that installing new memslots does not lose
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1907  	 * changes made to the previous memslots.
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1908  	 */
a54d806688fe1e Maciej S. Szmigiero 2021-12-06 @1909  	mutex_lock(&kvm->slots_arch_lock);
cf47f50b5c2e24 Sean Christopherson 2020-02-18  1910  
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1911  	/*
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1912  	 * Invalidate the old slot if it's being deleted or moved.  This is
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1913  	 * done prior to actually deleting/moving the memslot to allow vCPUs to
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1914  	 * continue running by ensuring there are no mappings or shadow pages
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1915  	 * for the memslot when it is deleted/moved.  Without pre-invalidation
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1916  	 * (and without a lock), a window would exist between effecting the
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1917  	 * delete/move and committing the changes in arch code where KVM or a
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1918  	 * guest could access a non-existent memslot.
244893fa2859d6 Sean Christopherson 2021-12-06  1919  	 *
244893fa2859d6 Sean Christopherson 2021-12-06  1920  	 * Modifications are done on a temporary, unreachable slot.  The old
244893fa2859d6 Sean Christopherson 2021-12-06  1921  	 * slot needs to be preserved in case a later step fails and the
244893fa2859d6 Sean Christopherson 2021-12-06  1922  	 * invalidation needs to be reverted.
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1923  	 */
244893fa2859d6 Sean Christopherson 2021-12-06  1924  	if (change == KVM_MR_DELETE || change == KVM_MR_MOVE) {
69050f8d6d075d Kees Cook           2026-02-20  1925  		invalid_slot = kzalloc_obj(*invalid_slot, GFP_KERNEL_ACCOUNT);
244893fa2859d6 Sean Christopherson 2021-12-06  1926  		if (!invalid_slot) {
244893fa2859d6 Sean Christopherson 2021-12-06  1927  			mutex_unlock(&kvm->slots_arch_lock);
244893fa2859d6 Sean Christopherson 2021-12-06  1928  			return -ENOMEM;
244893fa2859d6 Sean Christopherson 2021-12-06  1929  		}
244893fa2859d6 Sean Christopherson 2021-12-06  1930  		kvm_invalidate_memslot(kvm, old, invalid_slot);
244893fa2859d6 Sean Christopherson 2021-12-06  1931  	}
cf47f50b5c2e24 Sean Christopherson 2020-02-18  1932  
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1933  	r = kvm_prepare_memory_region(kvm, old, new, change);
23a205797cec86 Sean Christopherson 2026-09-21  1934  	if (r)
23a205797cec86 Sean Christopherson 2026-09-21  1935  		goto err;
cf47f50b5c2e24 Sean Christopherson 2020-02-18  1936  
3fe5d2944e5ac3 Sean Christopherson 2026-09-21  1937  	if (change == KVM_MR_CREATE && (new->flags & KVM_MEM_GUEST_MEMFD)) {
3fe5d2944e5ac3 Sean Christopherson 2026-09-21  1938  		r = kvm_gmem_commit_memory_region(kvm, new);
3fe5d2944e5ac3 Sean Christopherson 2026-09-21  1939  		if (r) {
3fe5d2944e5ac3 Sean Christopherson 2026-09-21  1940  			kvm_arch_free_memslot(kvm, new);
3fe5d2944e5ac3 Sean Christopherson 2026-09-21  1941  			kvm_destroy_dirty_bitmap(new);
3fe5d2944e5ac3 Sean Christopherson 2026-09-21  1942  			goto err;
3fe5d2944e5ac3 Sean Christopherson 2026-09-21  1943  		}
3fe5d2944e5ac3 Sean Christopherson 2026-09-21  1944  	}
3fe5d2944e5ac3 Sean Christopherson 2026-09-21  1945  
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1946  	/*
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1947  	 * For DELETE and MOVE, the working slot is now active as the INVALID
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1948  	 * version of the old slot.  MOVE is particularly special as it reuses
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1949  	 * the old slot and returns a copy of the old slot (in working_slot).
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1950  	 * For CREATE, there is no old slot.  For DELETE and FLAGS_ONLY, the
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1951  	 * old slot is detached but otherwise preserved.
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1952  	 */
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1953  	if (change == KVM_MR_CREATE)
244893fa2859d6 Sean Christopherson 2021-12-06  1954  		kvm_create_memslot(kvm, new);
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1955  	else if (change == KVM_MR_DELETE)
244893fa2859d6 Sean Christopherson 2021-12-06  1956  		kvm_delete_memslot(kvm, old, invalid_slot);
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1957  	else if (change == KVM_MR_MOVE)
244893fa2859d6 Sean Christopherson 2021-12-06  1958  		kvm_move_memslot(kvm, old, new, invalid_slot);
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1959  	else if (change == KVM_MR_FLAGS_ONLY)
244893fa2859d6 Sean Christopherson 2021-12-06  1960  		kvm_update_flags_memslot(kvm, old, new);
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1961  	else
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1962  		BUG();
5c0b4f3d5ccc2c Sean Christopherson 2020-02-18  1963  
244893fa2859d6 Sean Christopherson 2021-12-06  1964  	/* Free the temporary INVALID slot used for DELETE and MOVE. */
244893fa2859d6 Sean Christopherson 2021-12-06  1965  	if (change == KVM_MR_DELETE || change == KVM_MR_MOVE)
244893fa2859d6 Sean Christopherson 2021-12-06  1966  		kfree(invalid_slot);
5c0b4f3d5ccc2c Sean Christopherson 2020-02-18  1967  
9e9eb226b91225 Peter Xu            2020-10-14  1968  	/*
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1969  	 * No need to refresh new->arch, changes after dropping slots_arch_lock
a413a625b43e5f Tom Rix             2022-04-10  1970  	 * will directly hit the final, active memslot.  Architectures are
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1971  	 * responsible for knowing that new->arch may be stale.
9e9eb226b91225 Peter Xu            2020-10-14  1972  	 */
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1973  	kvm_commit_memory_region(kvm, old, new, change);
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1974  
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1975  	return 0;
23a205797cec86 Sean Christopherson 2026-09-21  1976  
23a205797cec86 Sean Christopherson 2026-09-21  1977  err:
23a205797cec86 Sean Christopherson 2026-09-21  1978  	/*
23a205797cec86 Sean Christopherson 2026-09-21  1979  	 * For DELETE/MOVE, revert the above INVALID change.  No modifications
23a205797cec86 Sean Christopherson 2026-09-21  1980  	 * required since the original slot was preserved in the inactive slots.
23a205797cec86 Sean Christopherson 2026-09-21  1981  	 * Changing the active memslots also release slots_arch_lock.
23a205797cec86 Sean Christopherson 2026-09-21  1982  	 */
23a205797cec86 Sean Christopherson 2026-09-21  1983  	if (change == KVM_MR_DELETE || change == KVM_MR_MOVE) {
23a205797cec86 Sean Christopherson 2026-09-21  1984  		kvm_activate_memslot(kvm, invalid_slot, old);
23a205797cec86 Sean Christopherson 2026-09-21  1985  		kfree(invalid_slot);
23a205797cec86 Sean Christopherson 2026-09-21  1986  	} else {
23a205797cec86 Sean Christopherson 2026-09-21  1987  		mutex_unlock(&kvm->slots_arch_lock);
23a205797cec86 Sean Christopherson 2026-09-21  1988  	}
23a205797cec86 Sean Christopherson 2026-09-21 @1989  	return r;
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1990  }
a54d806688fe1e Maciej S. Szmigiero 2021-12-06  1991  

:::::: The code at line 1989 was first introduced by commit
:::::: 23a205797cec86f391d0be886b9bc741e1262063 KVM: Use goto to handle errors during memslot preparation

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
