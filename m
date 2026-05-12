Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BFE3839A4
	for <oe-kbuild@lists.linux.dev>; Tue, 12 May 2026 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778582976; cv=none; b=WDZg/r/bmO83tP/AGIUh/zmxJAGnRwBgX7cw9dJy767LmMyM76udXMq+RpYvs6jjnp20NoTK5wSea3D3nvkljjVd66wzxYVugNSq3CWs9SyWAqlclhrvT3odhOmvQDlP777VExeuIHSMmxXYv7/LhHhoA6d6Uf1gzvwBhy8BB/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778582976; c=relaxed/simple;
	bh=V7C47G65GGYqTI7AX5K2dtHq70duzeXCJWekjVWd/bs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pXg8Qw1acP/OUtfIpfdC5bUaaa9Zb42bcu3v0upmMpfEU2f/abEf8kVURUkUiOSaUxZwDGZdlOxbhZ7Nukrd4kUpWU4RzccZlVU6lfJeANK0KsSV73fZWN/CiJpAccBGbhdnX2FEysU6zglXQ0gQXYHlKsvbiHwxhNvdtTGAhHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lleZU+f3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lleZU+f3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778582975; x=1810118975;
  h=date:from:to:cc:subject:message-id;
  bh=V7C47G65GGYqTI7AX5K2dtHq70duzeXCJWekjVWd/bs=;
  b=lleZU+f3CxVO6TefRoS3RG1jj2PTDTvCiD06IwyV6YUPTWxHOcP3rtyM
   oLNYM1S/qJLtRR9uQd/nhhcD0kx+xm5RGEJyFUbLNShY3Ft6WQgFMYB0t
   QYSRqjoCng6KdIB1s2xKUQJi0cQIa54/Y11siGCNlTegNDt4dgoM/KxUK
   OmLMhcjrAkud3tvqBaLgZCKSwEZ/jkfhq99HOR3visNxHMLwkQXgFnue4
   sA/9mUKSQVEtFxcMR68Xwh9YwYmZvMGM4ssXP5NimuPC/Eipn+bwQw79z
   OsStYR7alIN2hwsz5fYqOY9P7vjgv3soO68TGK8bX/Q5NQ6UnIv+/E8Hr
   g==;
X-CSE-ConnectionGUID: NxCBcyFtSuiEhyvIPYCTtw==
X-CSE-MsgGUID: gcZIe3ZAQASKFk+iUl3jdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83360538"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="83360538"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 03:49:35 -0700
X-CSE-ConnectionGUID: QwQdK+3AR5CVHgYIYsq1HQ==
X-CSE-MsgGUID: FSM6Wk2BST6JeI3S0LgOHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="242702652"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 May 2026 03:49:33 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMkg6-0000000020O-2ecn;
	Tue, 12 May 2026 10:49:30 +0000
Date: Tue, 12 May 2026 18:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/kvm/kvm-s390.c:5659
 kvm_arch_prepare_memory_region() error: we previously assumed 'new' could be
 null (see line 5645)
Message-ID: <202605121849.vHgrQKWJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Claudio Imbrenda <imbrenda@linux.ibm.com>
CC: Steffen Eiden <seiden@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50897c955902c93ae71c38698abb910525ebdc89
commit: 9b8e8aad5896d66005d29920cb1643076a20b172 KVM: s390: ucontrol: Fix memslot handling
date:   5 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 weeks ago
config: s390-randconfig-r073-20260512 (https://download.01.org/0day-ci/archive/20260512/202605121849.vHgrQKWJ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9b8e8aad5896 ("KVM: s390: ucontrol: Fix memslot handling")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605121849.vHgrQKWJ-lkp@intel.com/

smatch warnings:
arch/s390/kvm/kvm-s390.c:5659 kvm_arch_prepare_memory_region() error: we previously assumed 'new' could be null (see line 5645)

vim +/new +5659 arch/s390/kvm/kvm-s390.c

d663b8a28598607 Paolo Bonzini        2022-11-03  5638  
b0c632db637d68a Heiko Carstens       2008-03-25  5639  /* Section: memory related */
f7784b8ec9b6a04 Marcelo Tosatti      2009-12-23  5640  int kvm_arch_prepare_memory_region(struct kvm *kvm,
537a17b31493009 Sean Christopherson  2021-12-06  5641  				   const struct kvm_memory_slot *old,
537a17b31493009 Sean Christopherson  2021-12-06  5642  				   struct kvm_memory_slot *new,
7b6195a91d60909 Takuya Yoshikawa     2013-02-27  5643  				   enum kvm_mr_change change)
b0c632db637d68a Heiko Carstens       2008-03-25  5644  {
9b8e8aad5896d66 Claudio Imbrenda     2026-04-02 @5645  	if (kvm_is_ucontrol(kvm) && new && new->id < KVM_USER_MEM_SLOTS)
7816e58967d0e6c Christoph Schlameuss 2024-06-24  5646  		return -EINVAL;
7816e58967d0e6c Christoph Schlameuss 2024-06-24  5647  
ec5c86976674d2f Sean Christopherson  2021-12-06  5648  	/* When we are protected, we should not change the memory slots */
ec5c86976674d2f Sean Christopherson  2021-12-06  5649  	if (kvm_s390_pv_get_handle(kvm))
ec5c86976674d2f Sean Christopherson  2021-12-06  5650  		return -EINVAL;
ec5c86976674d2f Sean Christopherson  2021-12-06  5651  
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5652  	if (change != KVM_MR_DELETE && change != KVM_MR_FLAGS_ONLY) {
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5653  		/*
06a20c3ab6042ea Claudio Imbrenda     2026-04-02  5654  		 * A few sanity checks. The memory in userland is ok to be
06a20c3ab6042ea Claudio Imbrenda     2026-04-02  5655  		 * fragmented into various different vmas. It is okay to mmap()
06a20c3ab6042ea Claudio Imbrenda     2026-04-02  5656  		 * and munmap() stuff in this slot after doing this call at any
06a20c3ab6042ea Claudio Imbrenda     2026-04-02  5657  		 * time.
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5658  		 */
06a20c3ab6042ea Claudio Imbrenda     2026-04-02 @5659  		if (new->userspace_addr & ~PAGE_MASK)
b0c632db637d68a Heiko Carstens       2008-03-25  5660  			return -EINVAL;
06a20c3ab6042ea Claudio Imbrenda     2026-04-02  5661  		if ((new->base_gfn + new->npages) * PAGE_SIZE > kvm->arch.mem_limit)
a3a92c31bf0b57a Dominik Dingel       2014-12-01  5662  			return -EINVAL;
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5663  	}
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5664  
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5665  	if (!kvm->arch.migration_mode)
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5666  		return 0;
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5667  
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5668  	/*
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5669  	 * Turn off migration mode when:
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5670  	 * - userspace creates a new memslot with dirty logging off,
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5671  	 * - userspace modifies an existing memslot (MOVE or FLAGS_ONLY) and
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5672  	 *   dirty logging is turned off.
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5673  	 * Migration mode expects dirty page logging being enabled to store
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5674  	 * its dirty bitmap.
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5675  	 */
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5676  	if (change != KVM_MR_DELETE &&
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5677  	    !(new->flags & KVM_MEM_LOG_DIRTY_PAGES))
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5678  		WARN(kvm_s390_vm_stop_migration(kvm),
f2d3155e2a6bac4 Nico Boehr           2023-01-27  5679  		     "Failed to stop migration mode");
a3a92c31bf0b57a Dominik Dingel       2014-12-01  5680  
f7784b8ec9b6a04 Marcelo Tosatti      2009-12-23  5681  	return 0;
f7784b8ec9b6a04 Marcelo Tosatti      2009-12-23  5682  }
f7784b8ec9b6a04 Marcelo Tosatti      2009-12-23  5683  

:::::: The code at line 5659 was first introduced by commit
:::::: 06a20c3ab6042ea7f9927fbeb50aa4e79894c136 KVM: s390: Allow 4k granularity for memslots

:::::: TO: Claudio Imbrenda <imbrenda@linux.ibm.com>
:::::: CC: Claudio Imbrenda <imbrenda@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
