Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670823;
	b=zuDNRPKbmrqJsGqQC8zd42m6s/z//bHT3Oi0VYJNCXK1g2Sm595yPz4hL5VI3/KfY9g/
	 hjAbEqgQT8al2zyScU5Fh1NPRDXJJ9vM7ozsp8rZmOwPYEHWsSbbWHOIj2/hKjuOxqT7I
	 XTdln/lKSIFIUTBXBFSxQ8sZDHDa9QT9+EDe3g17uITziFXbQkG6km7PuNZnQWqwGY87C
	 0vbPwQoeUmrAYL4l0Lg8REMDXhx9i4rR2b7UmzFLpaHFf9HP3swTvPBt9fFGFDXK/vEZF
	 WqwZtALlEdp2DGFVDqrLfF4oNuygHAHdGcpPc9ifgIBTDs6HvPFngUpwdh8/6nPvCPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670823;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LQSzf3/iUMZ/6YxCMLNqcaWHRbhCg9P8UVgRnsDoX3I=;
	b=r9n/A+YZib+P5XroivLpk/GymcuILDlhki+/DFm+L1CimN9EbQJX08m+B3nb6jeIbckn
	 KLdVGogFUW4eeISEhO7dwm3zDmET+lRo15veZ/XamWW8uge/eiC12d1KMGVFcTA5Rx2tI
	 6UpsVaonwBY5e+CF/V0YgQq9tUh8vnF0i9A19GSHZcg21PoCh7G3tosM5PBtMUQFer47x
	 vgUOjRkGE+NsRrVif/bttomi5SKOS93dFW+X7LfofaqlqT07s4TNzqluRgPZ14OfO2gHT
	 DQkfKX0FU9dzRYhSqwOFIX8LFCM+JCXrFs36j6Uoy+anHfJYQq9hLlAUmxzoFygPwjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=csfNwYUR;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9019C606A31E
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 05:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9019C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=csfNwYUR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795670822; x=1827206822;
  h=date:from:to:cc:subject:message-id;
  bh=TpGNtm/Pwug5K9xpy/n+RGuGp7g8GwooWZj7Suqkl/o=;
  b=csfNwYURShSJ8NEozdEaawK2xHiP21rajPQNeHvRZH4PEc/ljpGfupks
   BWMgC9OBKcw6umDDv53AvM8cBR6IB8ylqueh8n1336Ft938XSQmc++jhM
   Qd0AQCIVczf1/AkEPzUpef9KHfnCl1J83mo63m5iAfJzPExWSuzhw8oZj
   TWrAXwsHMB0bFsptLY/FLg6CGxvLFZFiPoSwUw+qTTNKYMvgrBwAfviJc
   H1rWd9WztqmGBtX0yarWxzMhL1O1+5c8s/SR/znNlSja8zT/YOlVYeYeY
   bWHpEkosvtsVRZbXwtQi9PooOZB16p1xVW34lsnvQ1VUiw59A/BgnoA42
   A==;
X-CSE-ConnectionGUID: x2Xcx0oBTjedR7Iw7/skMQ==
X-CSE-MsgGUID: vAJ1BqbkT1eqBjlM+v7iSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4577048"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4577048"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 21:25:10 -0800
X-CSE-ConnectionGUID: XBoQ4q8mTcCosAPOez/NFA==
X-CSE-MsgGUID: 0ge2jv4QSC6aSEyIwKHnGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12234955"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Nov 2026 21:24:41 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWRyI-000000000El-1lYL;
	Thu, 26 Nov 2026 05:24:38 +0000
Date: Thu, 26 Nov 2026 06:24:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/riscv/kvm/mmu.c:147:3-9: preceding lock on line 143
Message-ID: <20261126061910.YfGdaG3l-lkp@intel.com>
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
TO: Wang Yechao <wang.yechao255@zte.com.cn>
CC: Anup Patel <anup@brainfault.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40212b29a6f718d4e7fb3275cede181cb8e137cf
commit: da870fdafa8adf6f6287dbbdd2c3b3181655965e RISC-V: KVM: Split huge pages when dirty logging is enabled
date:   4 months ago
:::::: branch date: 66 minutes ago
:::::: commit date: 4 months ago
config: riscv-randconfig-r2102-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126061910.YfGdaG3l-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: da870fdafa8a ("RISC-V: KVM: Split huge pages when dirty logging is enabled")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261126061910.YfGdaG3l-lkp@intel.com/

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
