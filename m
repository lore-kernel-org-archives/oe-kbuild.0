Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2998A125DB
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Feb 2024 04:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708922418; cv=none; b=EUq1dET053Ypy9YZ3u0SauO75YyG4ABxpxY7nN2fdrUsPahM5Ih2TA1P/Ddy3VULOyk3iEszB33BQAmmjW8PgxYCyG3zDd/GTMSU7Lp1SUpEID1qcE65iAerIxGOhwIrmxp4xmjTleeajCFzYJ14kNkIg1h3sJdUcnyb9xj8drE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708922418; c=relaxed/simple;
	bh=MO8eV5GA/4M2+tLyHCU4b5zV413lPnz5sNS1QZu2D7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FpOUk3djflcpPY9qaIKi7JenI2a6OOzPvLvB2zMc7w8xLJ1wfTYSBey9vdIqo4EsRpawYfsbCRRCI9/CJpTRnn7coYnraLxkRc0nlfg361QBCrFKUx0IERetGXWdPg9OddF6WGfJynKUyra/HaA4AWIcA/qqESsfDMmuB3ALLwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BG1UjVQj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BG1UjVQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708922417; x=1740458417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MO8eV5GA/4M2+tLyHCU4b5zV413lPnz5sNS1QZu2D7A=;
  b=BG1UjVQjg/9Fbl3DQrO6wLbpzMpcB2BV5+OEWGAC9lUpmdJZROCSvWMc
   HiID836WabsONGBoGCKPczi7ei+4QLtTqkZEzNa5GFi9z8ZBsUI4qPcTj
   qqvqxgczMK4brsT5Ic1nxZO9AxIZla6xGSoWn5Y1h5VOu09+lThflnMz8
   ExMqMVvfCc1MgBScFJzeMTKDNf4OvYVhex3T6Tvri0UM/beYxE/r/kWrw
   eGOjY5bW7Nk+fZ6DjZoydMQ0HlTWrb95NM6TJfSIIifJT/1oNEePV6eML
   dYXqF1/VGE7eEPSo9kwIt6in21d7vlJSF3OO/5UZ3VPDKb1Id7/KhNowg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3106508"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3106508"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 20:40:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="29713740"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Feb 2024 20:40:14 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reSmh-000A4K-2U;
	Mon, 26 Feb 2024 04:40:11 +0000
Date: Mon, 26 Feb 2024 12:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1670
 kvm_commit_memory_region() error: we previously assumed 'old' could be null
 (see line 1663)
Message-ID: <202402261246.fwz4CsUO-lkp@intel.com>
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
head:   d206a76d7d2726f3b096037f2079ce0bd3ba329b
commit: c1fc48aad14dbe7654f5986afb906332b528d54b LoongArch: KVM: Enable kvm config and add the makefile
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r081-20240225 (https://download.01.org/0day-ci/archive/20240226/202402261246.fwz4CsUO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402261246.fwz4CsUO-lkp@intel.com/

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
