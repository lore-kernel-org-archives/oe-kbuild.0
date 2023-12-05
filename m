Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CA36978A
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 11:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYFps6b0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775590; x=1733311590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pcI08WyqsjByrIXuBlFS2eTpWGBusTQaxzjr2fj5eTE=;
  b=cYFps6b0ZcIPMxRe1b+nIz7WgDgaNVxwmVvPP+z+b/tHWzksp7h1pKBq
   8u5hsiCqPpT8RjkIRQIuXSYEwKgK8KUJXVaJmhlzG/xjMYFDg/ZfS5ESp
   fbGczhTAYxFVM8Q6ll4Ts+RXd5yHHtHkWdU+suWXAdb88u5RpzJ9PBg2C
   nbxv54DzwtJdXa9eb37MegWZaga8lSlUqnSEHGNicJANQTdbebmIRkStU
   xMTMNAfmd0WRFI5JbRy4/R7fCoqBmQy6R9XPQnfka13Bk1ifF1Rf0Tmo8
   rJUMDAaHM3bmUeaNb8VBRGOPvJHtk7vWhzeY4ey/nYumH5SyqPhEUqndj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="943523"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="943523"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 03:26:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747193398"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="747193398"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Dec 2023 03:26:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rATZJ-0008rd-1O;
	Tue, 05 Dec 2023 11:26:25 +0000
Date: Tue, 5 Dec 2023 19:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/arm64/kvm/mmu.c:147:3-9: preceding lock on line 140
Message-ID: <202312051929.CzljWUvq-lkp@intel.com>
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
TO: Ricardo Koller <ricarkol@google.com>
CC: Oliver Upton <oliver.upton@linux.dev>
CC: Shaoqin Huang <shahuang@redhat.com>
CC: Gavin Shan <gshan@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: e7bf7a490c68b0b64bc05aa0a4f09f6044037db1 KVM: arm64: Split huge pages when dirty logging is enabled
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-r061-20231203 (https://download.01.org/0day-ci/archive/20231205/202312051929.CzljWUvq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312051929.CzljWUvq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312051929.CzljWUvq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/mmu.c:147:3-9: preceding lock on line 140

vim +147 arch/arm64/kvm/mmu.c

e7bf7a490c68b0 Ricardo Koller 2023-04-26  113  
e7bf7a490c68b0 Ricardo Koller 2023-04-26  114  static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
e7bf7a490c68b0 Ricardo Koller 2023-04-26  115  				    phys_addr_t end)
e7bf7a490c68b0 Ricardo Koller 2023-04-26  116  {
e7bf7a490c68b0 Ricardo Koller 2023-04-26  117  	struct kvm_mmu_memory_cache *cache;
e7bf7a490c68b0 Ricardo Koller 2023-04-26  118  	struct kvm_pgtable *pgt;
e7bf7a490c68b0 Ricardo Koller 2023-04-26  119  	int ret, cache_capacity;
e7bf7a490c68b0 Ricardo Koller 2023-04-26  120  	u64 next, chunk_size;
e7bf7a490c68b0 Ricardo Koller 2023-04-26  121  
e7bf7a490c68b0 Ricardo Koller 2023-04-26  122  	lockdep_assert_held_write(&kvm->mmu_lock);
e7bf7a490c68b0 Ricardo Koller 2023-04-26  123  
e7bf7a490c68b0 Ricardo Koller 2023-04-26  124  	chunk_size = kvm->arch.mmu.split_page_chunk_size;
e7bf7a490c68b0 Ricardo Koller 2023-04-26  125  	cache_capacity = kvm_mmu_split_nr_page_tables(chunk_size);
e7bf7a490c68b0 Ricardo Koller 2023-04-26  126  
e7bf7a490c68b0 Ricardo Koller 2023-04-26  127  	if (chunk_size == 0)
e7bf7a490c68b0 Ricardo Koller 2023-04-26  128  		return 0;
e7bf7a490c68b0 Ricardo Koller 2023-04-26  129  
e7bf7a490c68b0 Ricardo Koller 2023-04-26  130  	cache = &kvm->arch.mmu.split_page_cache;
e7bf7a490c68b0 Ricardo Koller 2023-04-26  131  
e7bf7a490c68b0 Ricardo Koller 2023-04-26  132  	do {
e7bf7a490c68b0 Ricardo Koller 2023-04-26  133  		if (need_split_memcache_topup_or_resched(kvm)) {
e7bf7a490c68b0 Ricardo Koller 2023-04-26  134  			write_unlock(&kvm->mmu_lock);
e7bf7a490c68b0 Ricardo Koller 2023-04-26  135  			cond_resched();
e7bf7a490c68b0 Ricardo Koller 2023-04-26  136  			/* Eager page splitting is best-effort. */
e7bf7a490c68b0 Ricardo Koller 2023-04-26  137  			ret = __kvm_mmu_topup_memory_cache(cache,
e7bf7a490c68b0 Ricardo Koller 2023-04-26  138  							   cache_capacity,
e7bf7a490c68b0 Ricardo Koller 2023-04-26  139  							   cache_capacity);
e7bf7a490c68b0 Ricardo Koller 2023-04-26 @140  			write_lock(&kvm->mmu_lock);
e7bf7a490c68b0 Ricardo Koller 2023-04-26  141  			if (ret)
e7bf7a490c68b0 Ricardo Koller 2023-04-26  142  				break;
e7bf7a490c68b0 Ricardo Koller 2023-04-26  143  		}
e7bf7a490c68b0 Ricardo Koller 2023-04-26  144  
e7bf7a490c68b0 Ricardo Koller 2023-04-26  145  		pgt = kvm->arch.mmu.pgt;
e7bf7a490c68b0 Ricardo Koller 2023-04-26  146  		if (!pgt)
e7bf7a490c68b0 Ricardo Koller 2023-04-26 @147  			return -EINVAL;
e7bf7a490c68b0 Ricardo Koller 2023-04-26  148  
e7bf7a490c68b0 Ricardo Koller 2023-04-26  149  		next = __stage2_range_addr_end(addr, end, chunk_size);
e7bf7a490c68b0 Ricardo Koller 2023-04-26  150  		ret = kvm_pgtable_stage2_split(pgt, addr, next - addr, cache);
e7bf7a490c68b0 Ricardo Koller 2023-04-26  151  		if (ret)
e7bf7a490c68b0 Ricardo Koller 2023-04-26  152  			break;
e7bf7a490c68b0 Ricardo Koller 2023-04-26  153  	} while (addr = next, addr != end);
e7bf7a490c68b0 Ricardo Koller 2023-04-26  154  
e7bf7a490c68b0 Ricardo Koller 2023-04-26  155  	return ret;
e7bf7a490c68b0 Ricardo Koller 2023-04-26  156  }
e7bf7a490c68b0 Ricardo Koller 2023-04-26  157  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
