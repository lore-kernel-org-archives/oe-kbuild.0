Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC7A3E0096
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jun 2026 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782472099; cv=none; b=JlQZpoKzotaBpyLz9q5UPowSU9zO52Z5GLxQMeyEHnNVYreHf4sIHtVzNaAj8HukxsorLb0qiJjLBrlDXLxWbBtk8FIJNTXRkdI5vVuh8pp+BsbuMKq7WqQ+ecMMLPq/ouZGmHWY5nKijjJL49G8WcMVFECqfWJFod0I2wMnGw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782472099; c=relaxed/simple;
	bh=YERptEhg0+cDGDGxg+zqIe2oiF3VWmOfdnEz1RJZFfg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ub5ZdSW4Vbc694LxH3uNUWODu+hM4U+BWUw8QYnSkoZ4JSaMq2a+eO2bfv8LaTTjMmltPGD/gQZ2uAPH4Tm7yJVzEweXJNg/7p4THbxdtH4IPl2VfNUSbvBKcSdie0cJc9H5UY8+lcbY1E43culT8ZY1fJVRNORR0PassYVJWHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azFjOEaV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azFjOEaV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782472098; x=1814008098;
  h=date:from:to:cc:subject:message-id;
  bh=YERptEhg0+cDGDGxg+zqIe2oiF3VWmOfdnEz1RJZFfg=;
  b=azFjOEaVn5eYIVjLLuMggvQSDTRvF2X9qxE+Xr/Uyc+GZvelmqB4WxkX
   ZjXADhRp68eipJnLqu3IFbmys7vCQcQuZyftnp1OngMVApA34bHyF1CiY
   +7Ay+4zBREWQWWAdhgDXTiFtjUqHyFigKtZnikjWK9OZteG1+bsgRGXco
   Rl4KO+Gi+PVso3a/XYMG1qCOx5G5IAimcNeijKtVXkO/yB8RIgWsWaQAA
   vwUX1DyPwo+QimLOraMY24qAnqW1SL8LK/UIheF3xMwmIk9sZrSM61Ed6
   MojfR2sugXNpxZndWE+an5zykD5db2VAl8hlH4Ny2Q820SXbdjEhHfAWF
   A==;
X-CSE-ConnectionGUID: nUutTHQESwm6k6s2I8mvkg==
X-CSE-MsgGUID: RHYZNARpSQ6bW0sh+jTtfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="94749412"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="94749412"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 04:08:18 -0700
X-CSE-ConnectionGUID: rHfGPsB7QP2ghbOC1lxw/g==
X-CSE-MsgGUID: ygO9WMaJSZazlYClpPYvMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="289397374"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Jun 2026 04:08:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wd4Pt-0000000050j-26bk;
	Fri, 26 Jun 2026 11:08:13 +0000
Date: Fri, 26 Jun 2026 19:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/mmu.c:2438 kvm_arch_prepare_memory_region()
 error: we previously assumed 'new' could be null (see line 2424)
Message-ID: <202606261823.K7LybVgO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Will Deacon <will@kernel.org>
CC: Marc Zyngier <maz@kernel.org>
CC: Fuad Tabba <tabba@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4edcdefd4083ae04b1a5656f4be6cd83ae919ef4
commit: f0877a1455cc6a93be14e4da741ce26ac0d6ca6d KVM: arm64: Prevent unsupported memslot operations on protected VMs
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r072-20260626 (https://download.01.org/0day-ci/archive/20260626/202606261823.K7LybVgO-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f0877a1455cc ("KVM: arm64: Prevent unsupported memslot operations on protected VMs")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606261823.K7LybVgO-lkp@intel.com/

smatch warnings:
arch/arm64/kvm/mmu.c:2438 kvm_arch_prepare_memory_region() error: we previously assumed 'new' could be null (see line 2424)

vim +/new +2438 arch/arm64/kvm/mmu.c

df6ce24f2ee485 arch/arm/kvm/mmu.c   Eric Auger          2014-06-06  2408  
df6ce24f2ee485 arch/arm/kvm/mmu.c   Eric Auger          2014-06-06  2409  int kvm_arch_prepare_memory_region(struct kvm *kvm,
537a17b3149300 arch/arm64/kvm/mmu.c Sean Christopherson 2021-12-06  2410  				   const struct kvm_memory_slot *old,
537a17b3149300 arch/arm64/kvm/mmu.c Sean Christopherson 2021-12-06  2411  				   struct kvm_memory_slot *new,
df6ce24f2ee485 arch/arm/kvm/mmu.c   Eric Auger          2014-06-06  2412  				   enum kvm_mr_change change)
df6ce24f2ee485 arch/arm/kvm/mmu.c   Eric Auger          2014-06-06  2413  {
509c594ca2dc88 arch/arm64/kvm/mmu.c Sean Christopherson 2021-12-06  2414  	hva_t hva, reg_end;
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2415  	int ret = 0;
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2416  
f0877a1455cc6a arch/arm64/kvm/mmu.c Will Deacon         2026-03-30  2417  	if (kvm_vm_is_protected(kvm)) {
f0877a1455cc6a arch/arm64/kvm/mmu.c Will Deacon         2026-03-30  2418  		/* Cannot modify memslots once a pVM has run. */
f0877a1455cc6a arch/arm64/kvm/mmu.c Will Deacon         2026-03-30  2419  		if (pkvm_hyp_vm_is_created(kvm) &&
f0877a1455cc6a arch/arm64/kvm/mmu.c Will Deacon         2026-03-30  2420  		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE)) {
f0877a1455cc6a arch/arm64/kvm/mmu.c Will Deacon         2026-03-30  2421  			return -EPERM;
f0877a1455cc6a arch/arm64/kvm/mmu.c Will Deacon         2026-03-30  2422  		}
f0877a1455cc6a arch/arm64/kvm/mmu.c Will Deacon         2026-03-30  2423  
f0877a1455cc6a arch/arm64/kvm/mmu.c Will Deacon         2026-03-30 @2424  		if (new &&
f0877a1455cc6a arch/arm64/kvm/mmu.c Will Deacon         2026-03-30  2425  		    new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)) {
f0877a1455cc6a arch/arm64/kvm/mmu.c Will Deacon         2026-03-30  2426  			return -EPERM;
f0877a1455cc6a arch/arm64/kvm/mmu.c Will Deacon         2026-03-30  2427  		}
f0877a1455cc6a arch/arm64/kvm/mmu.c Will Deacon         2026-03-30  2428  	}
f0877a1455cc6a arch/arm64/kvm/mmu.c Will Deacon         2026-03-30  2429  
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  2430  	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  2431  			change != KVM_MR_FLAGS_ONLY)
df6ce24f2ee485 arch/arm/kvm/mmu.c   Eric Auger          2014-06-06  2432  		return 0;
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2433  
c3058d5da22226 arch/arm/kvm/mmu.c   Christoffer Dall    2014-10-10  2434  	/*
c3058d5da22226 arch/arm/kvm/mmu.c   Christoffer Dall    2014-10-10  2435  	 * Prevent userspace from creating a memory region outside of the IPA
c3058d5da22226 arch/arm/kvm/mmu.c   Christoffer Dall    2014-10-10  2436  	 * space addressable by the KVM guest IPA space.
c3058d5da22226 arch/arm/kvm/mmu.c   Christoffer Dall    2014-10-10  2437  	 */
fe49fd940e2259 arch/arm64/kvm/mmu.c Marc Zyngier        2023-10-12 @2438  	if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
c3058d5da22226 arch/arm/kvm/mmu.c   Christoffer Dall    2014-10-10  2439  		return -EFAULT;
c3058d5da22226 arch/arm/kvm/mmu.c   Christoffer Dall    2014-10-10  2440  
32e200bd6e4407 arch/arm64/kvm/mmu.c Fuad Tabba          2025-07-29  2441  	/*
32e200bd6e4407 arch/arm64/kvm/mmu.c Fuad Tabba          2025-07-29  2442  	 * Only support guest_memfd backed memslots with mappable memory, since
32e200bd6e4407 arch/arm64/kvm/mmu.c Fuad Tabba          2025-07-29  2443  	 * there aren't any CoCo VMs that support only private memory on arm64.
32e200bd6e4407 arch/arm64/kvm/mmu.c Fuad Tabba          2025-07-29  2444  	 */
32e200bd6e4407 arch/arm64/kvm/mmu.c Fuad Tabba          2025-07-29  2445  	if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
32e200bd6e4407 arch/arm64/kvm/mmu.c Fuad Tabba          2025-07-29  2446  		return -EINVAL;
32e200bd6e4407 arch/arm64/kvm/mmu.c Fuad Tabba          2025-07-29  2447  
509c594ca2dc88 arch/arm64/kvm/mmu.c Sean Christopherson 2021-12-06  2448  	hva = new->userspace_addr;
509c594ca2dc88 arch/arm64/kvm/mmu.c Sean Christopherson 2021-12-06  2449  	reg_end = hva + (new->npages << PAGE_SHIFT);
509c594ca2dc88 arch/arm64/kvm/mmu.c Sean Christopherson 2021-12-06  2450  
89154dd5313f77 arch/arm64/kvm/mmu.c Michel Lespinasse   2020-06-08  2451  	mmap_read_lock(current->mm);
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2452  	/*
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2453  	 * A memory region could potentially cover multiple VMAs, and any holes
fd6f17bade2147 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  2454  	 * between them, so iterate over all of them.
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2455  	 *
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2456  	 *     +--------------------------------------------+
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2457  	 * +---------------+----------------+   +----------------+
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2458  	 * |   : VMA 1     |      VMA 2     |   |    VMA 3  :    |
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2459  	 * +---------------+----------------+   +----------------+
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2460  	 *     |               memory region                |
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2461  	 *     +--------------------------------------------+
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2462  	 */
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2463  	do {
c728fd4ce75e9c arch/arm64/kvm/mmu.c Gavin Shan          2021-03-16  2464  		struct vm_area_struct *vma;
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2465  
c728fd4ce75e9c arch/arm64/kvm/mmu.c Gavin Shan          2021-03-16  2466  		vma = find_vma_intersection(current->mm, hva, reg_end);
c728fd4ce75e9c arch/arm64/kvm/mmu.c Gavin Shan          2021-03-16  2467  		if (!vma)
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2468  			break;
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2469  
d89585fbb30869 arch/arm64/kvm/mmu.c Peter Collingbourne 2022-11-03  2470  		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
6e6a8ef088e122 arch/arm64/kvm/mmu.c Quentin Perret      2021-10-05  2471  			ret = -EINVAL;
6e6a8ef088e122 arch/arm64/kvm/mmu.c Quentin Perret      2021-10-05  2472  			break;
6e6a8ef088e122 arch/arm64/kvm/mmu.c Quentin Perret      2021-10-05  2473  		}
ea7fc1bb1cd1b9 arch/arm64/kvm/mmu.c Steven Price        2021-06-21  2474  
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2475  		if (vma->vm_flags & VM_PFNMAP) {
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  2476  			/* IO region dirty page logging not allowed */
537a17b3149300 arch/arm64/kvm/mmu.c Sean Christopherson 2021-12-06  2477  			if (new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
72f310481a08db arch/arm/kvm/mmu.c   Marc Zyngier        2017-03-16  2478  				ret = -EINVAL;
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2479  				break;
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2480  			}
2a8dfab26677ae arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2481  
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2482  			/*
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2483  			 * Cacheable PFNMAP is allowed only if the hardware
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2484  			 * supports it.
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2485  			 */
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2486  			if (kvm_vma_is_cacheable(vma) && !kvm_supports_cacheable_pfnmap()) {
2a8dfab26677ae arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2487  				ret = -EINVAL;
2a8dfab26677ae arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2488  				break;
2a8dfab26677ae arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  2489  			}
fd6f17bade2147 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  2490  		}
fd6f17bade2147 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  2491  		hva = min(reg_end, vma->vm_end);
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2492  	} while (hva < reg_end);
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2493  
89154dd5313f77 arch/arm64/kvm/mmu.c Michel Lespinasse   2020-06-08  2494  	mmap_read_unlock(current->mm);
8eef91239e57d2 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-10-10  2495  	return ret;
df6ce24f2ee485 arch/arm/kvm/mmu.c   Eric Auger          2014-06-06  2496  }
df6ce24f2ee485 arch/arm/kvm/mmu.c   Eric Auger          2014-06-06  2497  

:::::: The code at line 2438 was first introduced by commit
:::::: fe49fd940e22592988552e3bcd03f5a64facdecf KVM: arm64: Move VTCR_EL2 into struct s2_mmu

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Oliver Upton <oliver.upton@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
