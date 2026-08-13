Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF85351C25
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 12:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622427; cv=none; b=XkYvxvGz/FLERJkznvlpW1WYTEg0uJg+aHF/VyhcEJfDoiwnumV+ab26iCSLvluSJobeunC7RoAfRVc6Vw2ud38U/zz9RQZsysKD5PObehsusOEuIdvYp8YgDZT5Q7LLOOOPnGyJNBmTr+fcGC40wupiAqsw0wVkqOmsOY6BX4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622427; c=relaxed/simple;
	bh=+oUaDf2nkNShALFh9sQSPlLah3i0MR2oSqxarHnqztE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kiJZcKBYYENFsyOZbZF3vF56FeWk5wXhakaEX7I8jLEr0oNeypH73IWI/wsid/lTkV4u07+LN+LhjHV3uzkDVPhwGlTEupjbDh2UQyy7uS2K5E1cR5LB1J+osOqHGCgcwe9SwUCQh8L5mas2Nxmd8oeAYXJk4eI12oxdkgW3j8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/1hes5h; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/1hes5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786622426; x=1818158426;
  h=date:from:to:cc:subject:message-id;
  bh=+oUaDf2nkNShALFh9sQSPlLah3i0MR2oSqxarHnqztE=;
  b=X/1hes5hxLW820LN24SAntBsZMRvG6W1g4wEXMqsNh/2kMYr6xi6f/HB
   FTaaRFYH8p3cK7wPeWf8aIN6Dlmd3i0qSCPAL97GOyOvZf1GK+bHkSRnj
   uw3hJhmUY1rqzz9WXTHaItJhd2HelZ+uaFLszn7//8rJA9GYflLK5eNho
   52YUdj/AkpW+85Rx+bZwwSNPpe+retS6BLjlfyBwxNvbHfFxz9//utGqf
   /SGp1d29RsbJZBdyMhxi+HIvO5pJRi1gW1qI/L1tV6kSp6I+N/gByKCzj
   wWGCulQ/OA/EgvdrhSFEH/LnhUN+xhxQ2axFJjj7Aru4yCEKmWAzZCb5v
   A==;
X-CSE-ConnectionGUID: eFoEqDrHR6Od45kZgH4sSg==
X-CSE-MsgGUID: 77QSGdEVSfSRzsKw4/47BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86312192"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="86312192"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 05:00:25 -0700
X-CSE-ConnectionGUID: J8OyQqqFTvqK1n21/5KWzg==
X-CSE-MsgGUID: ReSg6yP6SgWAA9l9xkKojw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="263953231"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Aug 2026 05:00:24 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuU6f-00000000Tyi-2oAm;
	Thu, 13 Aug 2026 12:00:21 +0000
Date: Thu, 13 Aug 2026 20:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [avpatel:riscv_trace_support_v5 17/108]
 arch/riscv/kvm/mmu.c:147:3-9: preceding lock on line 143
Message-ID: <202608131903.pedqFZRo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Wang Yechao <wang.yechao255@zte.com.cn>
CC: Anup Patel <anup@brainfault.org>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v5
head:   d5f1be8d8fd44129a93976f98cc0153408015030
commit: da870fdafa8adf6f6287dbbdd2c3b3181655965e [17/108] RISC-V: KVM: Split huge pages when dirty logging is enabled
:::::: branch date: 76 minutes ago
:::::: commit date: 12 days ago
config: riscv-randconfig-r063-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131903.pedqFZRo-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6ea395e4fe4db26920d57779ddae98eac6ba945d)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608131903.pedqFZRo-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/mmu.c:147:3-9: preceding lock on line 143

vim +147 arch/riscv/kvm/mmu.c

da870fdafa8adf Wang Yechao 2026-07-31  111  
da870fdafa8adf Wang Yechao 2026-07-31  112  static bool mmu_split_huge_pages(struct kvm_gstage *gstage,
da870fdafa8adf Wang Yechao 2026-07-31  113  				 phys_addr_t start, phys_addr_t end)
da870fdafa8adf Wang Yechao 2026-07-31  114  {
da870fdafa8adf Wang Yechao 2026-07-31  115  	struct kvm *kvm = gstage->kvm;
da870fdafa8adf Wang Yechao 2026-07-31  116  	struct kvm_mmu_memory_cache *pcache = &kvm->arch.pgd_split_page_cache;
da870fdafa8adf Wang Yechao 2026-07-31  117  	phys_addr_t addr = ALIGN_DOWN(start, PMD_SIZE);
da870fdafa8adf Wang Yechao 2026-07-31  118  	phys_addr_t last_flush_gfn = addr >> PAGE_SHIFT;
da870fdafa8adf Wang Yechao 2026-07-31  119  	int count = gstage->pgd_levels;
da870fdafa8adf Wang Yechao 2026-07-31  120  	bool flush = false;
da870fdafa8adf Wang Yechao 2026-07-31  121  	int ret;
da870fdafa8adf Wang Yechao 2026-07-31  122  
da870fdafa8adf Wang Yechao 2026-07-31  123  	lockdep_assert_held_write(&kvm->mmu_lock);
da870fdafa8adf Wang Yechao 2026-07-31  124  
da870fdafa8adf Wang Yechao 2026-07-31  125  	while (addr < end) {
da870fdafa8adf Wang Yechao 2026-07-31  126  		if (need_topup_split_caches_or_resched(kvm, count)) {
da870fdafa8adf Wang Yechao 2026-07-31  127  			if (flush) {
da870fdafa8adf Wang Yechao 2026-07-31  128  				kvm_flush_remote_tlbs_range(kvm, last_flush_gfn,
da870fdafa8adf Wang Yechao 2026-07-31  129  					  (addr >> PAGE_SHIFT) - last_flush_gfn);
da870fdafa8adf Wang Yechao 2026-07-31  130  				last_flush_gfn = addr >> PAGE_SHIFT;
da870fdafa8adf Wang Yechao 2026-07-31  131  				flush = false;
da870fdafa8adf Wang Yechao 2026-07-31  132  			}
da870fdafa8adf Wang Yechao 2026-07-31  133  
da870fdafa8adf Wang Yechao 2026-07-31  134  			write_unlock(&kvm->mmu_lock);
da870fdafa8adf Wang Yechao 2026-07-31  135  			cond_resched();
da870fdafa8adf Wang Yechao 2026-07-31  136  
da870fdafa8adf Wang Yechao 2026-07-31  137  			ret = kvm_mmu_topup_memory_cache(pcache, count);
da870fdafa8adf Wang Yechao 2026-07-31  138  			if (ret) {
da870fdafa8adf Wang Yechao 2026-07-31  139  				kvm_err("Failed to toup split page cache\n");
da870fdafa8adf Wang Yechao 2026-07-31  140  				write_lock(&kvm->mmu_lock);
da870fdafa8adf Wang Yechao 2026-07-31  141  				return flush;
da870fdafa8adf Wang Yechao 2026-07-31  142  			}
da870fdafa8adf Wang Yechao 2026-07-31 @143  			write_lock(&kvm->mmu_lock);
da870fdafa8adf Wang Yechao 2026-07-31  144  		}
da870fdafa8adf Wang Yechao 2026-07-31  145  
da870fdafa8adf Wang Yechao 2026-07-31  146  		if (!kvm->arch.pgd)
da870fdafa8adf Wang Yechao 2026-07-31 @147  			return flush;
da870fdafa8adf Wang Yechao 2026-07-31  148  
da870fdafa8adf Wang Yechao 2026-07-31  149  		flush |= kvm_riscv_gstage_split_huge(gstage, pcache, addr, 0, false);
da870fdafa8adf Wang Yechao 2026-07-31  150  
da870fdafa8adf Wang Yechao 2026-07-31  151  		addr += PMD_SIZE;
da870fdafa8adf Wang Yechao 2026-07-31  152  	}
da870fdafa8adf Wang Yechao 2026-07-31  153  
da870fdafa8adf Wang Yechao 2026-07-31  154  	return flush;
da870fdafa8adf Wang Yechao 2026-07-31  155  }
da870fdafa8adf Wang Yechao 2026-07-31  156  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
