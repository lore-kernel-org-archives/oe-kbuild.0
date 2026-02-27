Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639C01FE44B
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Feb 2026 00:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772152109; cv=none; b=OvHY5K1Ty8NMeeg1oxxt1AIEpspoOCx0t1xR/Lfvx6lYYWQFw1yuEKz07qOIhPoYXPA8snDow7iidW9IT0Bz4GxSoSw6KXPHeRfENAKtLNgRNCptei9dS5qK2OJiwfHgC/QMayLB6bIuXYhjmFVkf1Os9Ax2c8Tq2cLNnhpS6IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772152109; c=relaxed/simple;
	bh=k0/cpUASX8EBMFQcqgkWmZC3lAbN6sMJiEiZ2NGmov4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IZx3axiVm9cSUxRbIgXN/rrK54Af7WJAvwFUSaHdLKzBC9cWBCEoahazRBvuA18QA6ASuSY42iBqNT03m5QL6rAfiGMnSSPgSNrJhOQWq6bsFp3F9iVkaHSWepWro5EKWRA+gnj1dSQha62AhSpGBCCqka8Y7SJht4IpjDFabas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPapdxvT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPapdxvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772152107; x=1803688107;
  h=date:from:to:cc:subject:message-id;
  bh=k0/cpUASX8EBMFQcqgkWmZC3lAbN6sMJiEiZ2NGmov4=;
  b=bPapdxvTw/QRNW2mYIwkzM9v99z9xQ9Cp/f3ASzGsp1Lz7DQn7+L2YLx
   pXwzb1q842zswZ8uK67C4ZAInn9WyQM46UmHagoPMPRJJPG0O7qxa198P
   6RcYkmv91TltxDrUujZWQGlm+JCLEOD/B8tF0mmH9VqDWhrp7Qh8D9sTg
   yhBfAHiDlZUcAs8Pvhl5jpx2Yi5E8AKNQ/yZvdm/vTs4Fu9Z2kU/8Yf2G
   aCCdYHe9G4+q+K8PjrU1gAu1tGQv9gaZQ/CiipL9EVoFSNalOjNu3Md8V
   gmex+WE5yg64k6MZcX9gHkiOP6sY6nfgVHaqb+VhujZTqmhrIiJGkS+Jm
   g==;
X-CSE-ConnectionGUID: BIAniPCkQpul7/coLfmybg==
X-CSE-MsgGUID: mKcVLSB/QQSZda0dhKdDew==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73335238"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73335238"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 16:28:27 -0800
X-CSE-ConnectionGUID: S4qnkWvFT7+AL0t9CEXokQ==
X-CSE-MsgGUID: K7LokIUbQtetb7Xvb55ZWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="220871353"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Feb 2026 16:28:26 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvliL-00000000A2p-37Bw;
	Fri, 27 Feb 2026 00:28:21 +0000
Date: Fri, 27 Feb 2026 08:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android17-6.18 3/3]
 arch/arm64/kvm/mmu.c:2395 kvm_arch_prepare_memory_region() error: we
 previously assumed 'new' could be null (see line 2381)
Message-ID: <202602270841.3OJ4WIXH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   5e4c9fb20f07b76cfb11c5a7eac66cf6505dd516
commit: 6163b2aae28fb34dc1dbc3db006c381d08edf1d3 [3/3] ANDROID: KVM: arm64: Disallow dirty logging and RO memslots with pKVM
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r071-20260226 (https://download.01.org/0day-ci/archive/20260227/202602270841.3OJ4WIXH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602270841.3OJ4WIXH-lkp@intel.com/

smatch warnings:
arch/arm64/kvm/mmu.c:2395 kvm_arch_prepare_memory_region() error: we previously assumed 'new' could be null (see line 2381)

vim +/new +2395 arch/arm64/kvm/mmu.c

df6ce24f2ee485c arch/arm/kvm/mmu.c   Eric Auger          2014-06-06  2365  
df6ce24f2ee485c arch/arm/kvm/mmu.c   Eric Auger          2014-06-06  2366  int kvm_arch_prepare_memory_region(struct kvm *kvm,
537a17b31493009 arch/arm64/kvm/mmu.c Sean Christopherson 2021-12-06  2367  				   const struct kvm_memory_slot *old,
537a17b31493009 arch/arm64/kvm/mmu.c Sean Christopherson 2021-12-06  2368  				   struct kvm_memory_slot *new,
df6ce24f2ee485c arch/arm/kvm/mmu.c   Eric Auger          2014-06-06  2369  				   enum kvm_mr_change change)
df6ce24f2ee485c arch/arm/kvm/mmu.c   Eric Auger          2014-06-06  2370  {
509c594ca2dc882 arch/arm64/kvm/mmu.c Sean Christopherson 2021-12-06  2371  	hva_t hva, reg_end;
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2372  	int ret = 0;
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2373  
6163b2aae28fb34 arch/arm64/kvm/mmu.c Quentin Perret      2022-05-06  2374  	if (is_protected_kvm_enabled()) {
8b3e08468995ec1 arch/arm64/kvm/mmu.c Fuad Tabba          2022-04-07  2375  		/* In protected mode, cannot modify memslots once a VM has run. */
6163b2aae28fb34 arch/arm64/kvm/mmu.c Quentin Perret      2022-05-06  2376  		if ((change == KVM_MR_DELETE || change == KVM_MR_MOVE) &&
8b3e08468995ec1 arch/arm64/kvm/mmu.c Fuad Tabba          2022-04-07  2377  		    pkvm_hyp_vm_is_created(kvm)) {
8b3e08468995ec1 arch/arm64/kvm/mmu.c Fuad Tabba          2022-04-07  2378  			return -EPERM;
8b3e08468995ec1 arch/arm64/kvm/mmu.c Fuad Tabba          2022-04-07  2379  		}
8b3e08468995ec1 arch/arm64/kvm/mmu.c Fuad Tabba          2022-04-07  2380  
6163b2aae28fb34 arch/arm64/kvm/mmu.c Quentin Perret      2022-05-06 @2381  		if (new &&
6163b2aae28fb34 arch/arm64/kvm/mmu.c Quentin Perret      2022-05-06  2382  		    new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)) {
6163b2aae28fb34 arch/arm64/kvm/mmu.c Quentin Perret      2022-05-06  2383  			return -EPERM;
6163b2aae28fb34 arch/arm64/kvm/mmu.c Quentin Perret      2022-05-06  2384  		}
6163b2aae28fb34 arch/arm64/kvm/mmu.c Quentin Perret      2022-05-06  2385  	}
6163b2aae28fb34 arch/arm64/kvm/mmu.c Quentin Perret      2022-05-06  2386  
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  2387  	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  2388  			change != KVM_MR_FLAGS_ONLY)
df6ce24f2ee485c arch/arm/kvm/mmu.c   Eric Auger          2014-06-06  2389  		return 0;
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2390  
c3058d5da222262 arch/arm/kvm/mmu.c   Christoffer Dall    2014-10-10  2391  	/*
c3058d5da222262 arch/arm/kvm/mmu.c   Christoffer Dall    2014-10-10  2392  	 * Prevent userspace from creating a memory region outside of the IPA
c3058d5da222262 arch/arm/kvm/mmu.c   Christoffer Dall    2014-10-10  2393  	 * space addressable by the KVM guest IPA space.
c3058d5da222262 arch/arm/kvm/mmu.c   Christoffer Dall    2014-10-10  2394  	 */
fe49fd940e22592 arch/arm64/kvm/mmu.c Marc Zyngier        2023-10-12 @2395  	if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
c3058d5da222262 arch/arm/kvm/mmu.c   Christoffer Dall    2014-10-10  2396  		return -EFAULT;
c3058d5da222262 arch/arm/kvm/mmu.c   Christoffer Dall    2014-10-10  2397  
32e200bd6e4407c arch/arm64/kvm/mmu.c Fuad Tabba          2025-07-29  2398  	/*
32e200bd6e4407c arch/arm64/kvm/mmu.c Fuad Tabba          2025-07-29  2399  	 * Only support guest_memfd backed memslots with mappable memory, since
32e200bd6e4407c arch/arm64/kvm/mmu.c Fuad Tabba          2025-07-29  2400  	 * there aren't any CoCo VMs that support only private memory on arm64.
32e200bd6e4407c arch/arm64/kvm/mmu.c Fuad Tabba          2025-07-29  2401  	 */
32e200bd6e4407c arch/arm64/kvm/mmu.c Fuad Tabba          2025-07-29  2402  	if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
32e200bd6e4407c arch/arm64/kvm/mmu.c Fuad Tabba          2025-07-29  2403  		return -EINVAL;
32e200bd6e4407c arch/arm64/kvm/mmu.c Fuad Tabba          2025-07-29  2404  
509c594ca2dc882 arch/arm64/kvm/mmu.c Sean Christopherson 2021-12-06  2405  	hva = new->userspace_addr;
509c594ca2dc882 arch/arm64/kvm/mmu.c Sean Christopherson 2021-12-06  2406  	reg_end = hva + (new->npages << PAGE_SHIFT);
509c594ca2dc882 arch/arm64/kvm/mmu.c Sean Christopherson 2021-12-06  2407  
89154dd5313f774 arch/arm64/kvm/mmu.c Michel Lespinasse   2020-06-08  2408  	mmap_read_lock(current->mm);
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2409  	/*
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2410  	 * A memory region could potentially cover multiple VMAs, and any holes
fd6f17bade2147b arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  2411  	 * between them, so iterate over all of them.
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2412  	 *
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2413  	 *     +--------------------------------------------+
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2414  	 * +---------------+----------------+   +----------------+
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2415  	 * |   : VMA 1     |      VMA 2     |   |    VMA 3  :    |
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2416  	 * +---------------+----------------+   +----------------+
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2417  	 *     |               memory region                |
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2418  	 *     +--------------------------------------------+
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2419  	 */
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2420  	do {
c728fd4ce75e9c3 arch/arm64/kvm/mmu.c Gavin Shan          2021-03-16  2421  		struct vm_area_struct *vma;
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2422  
c728fd4ce75e9c3 arch/arm64/kvm/mmu.c Gavin Shan          2021-03-16  2423  		vma = find_vma_intersection(current->mm, hva, reg_end);
c728fd4ce75e9c3 arch/arm64/kvm/mmu.c Gavin Shan          2021-03-16  2424  		if (!vma)
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2425  			break;
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2426  
d89585fbb308690 arch/arm64/kvm/mmu.c Peter Collingbourne 2022-11-03  2427  		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
6e6a8ef088e1222 arch/arm64/kvm/mmu.c Quentin Perret      2021-10-05  2428  			ret = -EINVAL;
6e6a8ef088e1222 arch/arm64/kvm/mmu.c Quentin Perret      2021-10-05  2429  			break;
6e6a8ef088e1222 arch/arm64/kvm/mmu.c Quentin Perret      2021-10-05  2430  		}
ea7fc1bb1cd1b92 arch/arm64/kvm/mmu.c Steven Price        2021-06-21  2431  
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2432  		if (vma->vm_flags & VM_PFNMAP) {
15a49a44fc36209 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  2433  			/* IO region dirty page logging not allowed */
537a17b31493009 arch/arm64/kvm/mmu.c Sean Christopherson 2021-12-06  2434  			if (new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
72f310481a08db8 arch/arm/kvm/mmu.c   Marc Zyngier        2017-03-16  2435  				ret = -EINVAL;
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2436  				break;
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2437  			}
2a8dfab26677ae3 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2438  
0c67288e0c8bc1e arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2439  			/*
0c67288e0c8bc1e arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2440  			 * Cacheable PFNMAP is allowed only if the hardware
0c67288e0c8bc1e arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2441  			 * supports it.
0c67288e0c8bc1e arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2442  			 */
0c67288e0c8bc1e arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2443  			if (kvm_vma_is_cacheable(vma) && !kvm_supports_cacheable_pfnmap()) {
2a8dfab26677ae3 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2444  				ret = -EINVAL;
2a8dfab26677ae3 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2445  				break;
2a8dfab26677ae3 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2446  			}
fd6f17bade2147b arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  2447  		}
fd6f17bade2147b arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  2448  		hva = min(reg_end, vma->vm_end);
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2449  	} while (hva < reg_end);
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2450  
89154dd5313f774 arch/arm64/kvm/mmu.c Michel Lespinasse   2020-06-08  2451  	mmap_read_unlock(current->mm);
8eef91239e57d2e arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2452  	return ret;
df6ce24f2ee485c arch/arm/kvm/mmu.c   Eric Auger          2014-06-06  2453  }
df6ce24f2ee485c arch/arm/kvm/mmu.c   Eric Auger          2014-06-06  2454  

:::::: The code at line 2395 was first introduced by commit
:::::: fe49fd940e22592988552e3bcd03f5a64facdecf KVM: arm64: Move VTCR_EL2 into struct s2_mmu

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Oliver Upton <oliver.upton@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
