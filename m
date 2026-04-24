Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECBF1D6BB
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Apr 2026 12:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032485; cv=none; b=ebSkDc6QQRbchwWviZuHZS3mCZwJ8C3n3q7ywfwQhvekny0ZtoVFJ++mMs6g/wqgbl2oeJBaFyd3C2FVZtNSdprQqU1HOXzPAKXS5sw13CiwIJdFfegZLWSVl7zZ3EGIT0wB6kxBPegp9cMgv48zuOIemzZ+QijkpFi2VW3WF0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032485; c=relaxed/simple;
	bh=kYAW2JEDywRk7IDQWk1hop/y8kZJd7U6qHUrFmIH1TQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lb9TtP4xlwrsMZrKFTDSwkX0zCH+7AwxOQy0MKxMoJ+vbp+Ps7akJ1j4tpgN6ToxmFPvJaaudUiIE5CnVnoNQGrfxzCjdpNorKYy7THhhtAtq0BrUzqS2TjlWQQ7OBkZ93SNEZSe8a0Qz9OUP3AvNV82n+DcGmWV98TzgKi6ARE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQqNlHT8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQqNlHT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777032484; x=1808568484;
  h=date:from:to:cc:subject:message-id;
  bh=kYAW2JEDywRk7IDQWk1hop/y8kZJd7U6qHUrFmIH1TQ=;
  b=GQqNlHT8xZb9z8lyD4JYsPURZ7u7u9FQtVYM5mqGP2jTK80pM3rb6Jwo
   b7IzyKmTLN+meDN4tqn8WVA+oFEvz7taiKSinL1MEitwggybzNISdNwKB
   2g2Cl8abmzOsFBdUlQSeaTFglq9qTUfiTypyDLlrqFcAvvi/Id6H8SDdB
   1AArG4URxOCROHLNsrusUlKS1lNFqCEAffcZyqHbQCsrtUGKEnJuHTvfc
   RrOUgppYYjZB96KVIWf54dOkay45UervKe1u87wXUoSb1+D5H7AZEuO21
   sxDAYSNjmd/6D8PA6qoei/Vj21RrpJQZ3g9G+PWS1j0YHiqSA308QGwBQ
   g==;
X-CSE-ConnectionGUID: tpoPx81SRDOe9oONZYqOvQ==
X-CSE-MsgGUID: zk6k67jQRJKt5qlagwluIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="89473895"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="89473895"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 05:08:03 -0700
X-CSE-ConnectionGUID: bLAgKAofSMWHGVy6rlbmNg==
X-CSE-MsgGUID: Amhk51E0RG6aVAexx4+oFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="230285145"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 24 Apr 2026 05:08:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGFKB-000000003FX-2N5d;
	Fri, 24 Apr 2026 12:07:59 +0000
Date: Fri, 24 Apr 2026 14:07:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ./include/linux/kvm_host.h:2569:23: error: 'kvm' undeclared
Message-ID: <202604241441.ZAS2AFOa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dave Jiang <dave.jiang@intel.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Dave-Jiang/dax-rate-limit-dev_dax_huge_fault-output/20260424-144914
head:   f8b7f4f5432fa1c0c2c4ef2cb58a045a0d731b17
commit: acb8652cb8737cd31c16cf43a52bea1bda3cdf5e kvm: Implement dax support for KVM faulting
date:   5 hours ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260424/202604241441.ZAS2AFOa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260424/202604241441.ZAS2AFOa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604241441.ZAS2AFOa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/x86/include/asm/bug.h:193,
                    from ./arch/x86/include/asm/alternative.h:9,
                    from ./arch/x86/include/asm/segment.h:6,
                    from ./arch/x86/include/asm/ptrace.h:5,
                    from ./arch/x86/include/asm/math_emu.h:5,
                    from ./arch/x86/include/asm/processor.h:13,
                    from ./arch/x86/include/asm/timex.h:5,
                    from ./include/linux/timex.h:67,
                    from ./include/linux/time32.h:13,
                    from ./include/linux/time.h:60,
                    from ./include/linux/stat.h:19,
                    from ./include/linux/fs_dirent.h:5,
                    from ./include/linux/fs/super_types.h:5,
                    from ./include/linux/fs/super.h:5,
                    from ./include/linux/fs.h:5,
                    from ./include/linux/dax.h:5,
                    from mm/filemap.c:15:
   ./include/linux/kvm_host.h: In function 'kvm_dax_get_pfn':
>> ./include/linux/kvm_host.h:2569:23: error: 'kvm' undeclared (first use in this function)
    2569 |         KVM_BUG_ON(1, kvm);
         |                       ^~~
   ./include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   ./include/linux/kvm_host.h:2569:9: note: in expansion of macro 'KVM_BUG_ON'
    2569 |         KVM_BUG_ON(1, kvm);
         |         ^~~~~~~~~~
   ./include/linux/kvm_host.h:2569:23: note: each undeclared identifier is reported only once for each function it appears in
    2569 |         KVM_BUG_ON(1, kvm);
         |                       ^~~
   ./include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   ./include/linux/kvm_host.h:2569:9: note: in expansion of macro 'KVM_BUG_ON'
    2569 |         KVM_BUG_ON(1, kvm);
         |         ^~~~~~~~~~


vim +/kvm +2569 ./include/linux/kvm_host.h

5a475554db1e47 Chao Peng           2023-10-27  2550  
19a9a1ab5c3dce Fuad Tabba          2025-07-29  2551  #ifdef CONFIG_KVM_GUEST_MEMFD
a7800aa80ea4d5 Sean Christopherson 2023-11-13  2552  int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
1fbee5b01a0fd2 Sean Christopherson 2024-10-10  2553  		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
1fbee5b01a0fd2 Sean Christopherson 2024-10-10  2554  		     int *max_order);
acb8652cb8737c Dave Jiang          2026-04-23  2555  int kvm_dax_get_pfn(struct kvm_memory_slot *slot, pgoff_t index, kvm_pfn_t *pfn,
acb8652cb8737c Dave Jiang          2026-04-23  2556  		    struct page **refcounted_page);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  2557  #else
a7800aa80ea4d5 Sean Christopherson 2023-11-13  2558  static inline int kvm_gmem_get_pfn(struct kvm *kvm,
a7800aa80ea4d5 Sean Christopherson 2023-11-13  2559  				   struct kvm_memory_slot *slot, gfn_t gfn,
1fbee5b01a0fd2 Sean Christopherson 2024-10-10  2560  				   kvm_pfn_t *pfn, struct page **page,
1fbee5b01a0fd2 Sean Christopherson 2024-10-10  2561  				   int *max_order)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  2562  {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  2563  	KVM_BUG_ON(1, kvm);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  2564  	return -EIO;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  2565  }
acb8652cb8737c Dave Jiang          2026-04-23  2566  static inline int kvm_dax_get_pfn(struct kvm_memory_slot *slot, gfn_t gfn,
acb8652cb8737c Dave Jiang          2026-04-23  2567  				  kvm_pfn_t *pfn)
acb8652cb8737c Dave Jiang          2026-04-23  2568  {
acb8652cb8737c Dave Jiang          2026-04-23 @2569  	KVM_BUG_ON(1, kvm);
acb8652cb8737c Dave Jiang          2026-04-23  2570  	return -EIO;
acb8652cb8737c Dave Jiang          2026-04-23  2571  }
19a9a1ab5c3dce Fuad Tabba          2025-07-29  2572  #endif /* CONFIG_KVM_GUEST_MEMFD */
a7800aa80ea4d5 Sean Christopherson 2023-11-13  2573  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
