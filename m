Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEDC43ACB
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Aug 2024 05:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723267666; cv=none; b=H6132vd4ALkTYTIRFJ+XZNpSXZi80UZOQJRYIr9vtqIOIVoAOXlGPjwvAU/A35CoeEoS2rdbO9iMShGkaqVEgb/IIvG7TVID9855pszi2C4IntZummtAKNVnnOVwNCNM3EW9bDovzBOmg3jkrJnysLNRrfSVtq+JqTkmzVobGyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723267666; c=relaxed/simple;
	bh=NpcaovvbPAHbatykna7uEjlYMZgXv31RsOILHbWV2vo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bw0wt/wXOUNy5OHHOQyut9rfZumwdsx9HrDLvxyK16VhZXs17oMJaMd2ebwXDtybm1qKdqm48OS7MM3s2HtmbRhosi1KLEEnSXNf1M/f1oODrtTSltnejADXse0CIqif2yGHdx4mzSHYUKAnpSwDm+KyPOc/RoL6nSG6s94vUBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UfURd9yq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UfURd9yq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723267664; x=1754803664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NpcaovvbPAHbatykna7uEjlYMZgXv31RsOILHbWV2vo=;
  b=UfURd9yqKOw0+VR0LN9Wvg+nxrZLQEOigX18uVMqvArQGeMPl3krUSlA
   wKqlpxBeVDnZWz5TgkpLGzqvEF9g5VHoW5+FXPPVWTL0jEXAZZxkJpQPj
   xf3X5/f1tyEBP4ry1tSMOCn3xZDawKC/obwVPk6B2zabHaU1NRKcTBTRM
   +GyrCgoT4d55hK3aVAGKZou2aMz3Zk/+dqapJsqtPxiNwlQGSYnTlxG6J
   hOidI3qHYvpScp2EdOjKQB2I4Vdn/T8w8Y5bQm7srymim4qgI8ivukG82
   3k14KWx0AO64WVXGMO4ZcPNAfT2FH4g34doFeKaXPeqGtWGKBlY57ixno
   g==;
X-CSE-ConnectionGUID: 0xySrrwlTYa24eubSJcDAw==
X-CSE-MsgGUID: lcK9H7O5Sw6IO38hjUoolA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="38899462"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="38899462"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 22:27:43 -0700
X-CSE-ConnectionGUID: XcJGrBMJQSWG6KXXwNSkzA==
X-CSE-MsgGUID: T9gUIJXKRLmzke6Ja4OrKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="57841602"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 09 Aug 2024 22:27:41 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scedf-0009eR-1g;
	Sat, 10 Aug 2024 05:27:39 +0000
Date: Sat, 10 Aug 2024 13:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-unstable 206/217] mm/mprotect.c:450:23: sparse: sparse:
 cast to non-scalar
Message-ID: <202408101311.JMUuRCE4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/mprotect.c:450:23: sparse: sparse: cast to non-scalar"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Xu <peterx@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   a33849ea97e3b4e522ae6423fc976781391c8ce3
commit: 8bc2ff0f6f8ecbe79b043430f74ea985f3a72203 [206/217] mm/mprotect: fix dax pud handlings
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: alpha-randconfig-r113-20240810 (https://download.01.org/0day-ci/archive/20240810/202408101311.JMUuRCE4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20240810/202408101311.JMUuRCE4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408101311.JMUuRCE4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mprotect.c: note: in included file (through include/linux/mm.h, include/linux/pagewalk.h):
   include/linux/pgtable.h:317:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:317:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:317:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:317:16: sparse: sparse: cast from non-scalar
   mm/mprotect.c:291:9: sparse: sparse: context imbalance in 'change_pte_range' - unexpected unlock
>> mm/mprotect.c:450:23: sparse: sparse: cast to non-scalar
>> mm/mprotect.c:450:23: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:324:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:324:16: sparse: sparse: cast from non-scalar
   mm/mprotect.c:480:47: sparse: sparse: self-comparison always evaluates to false
   mm/mprotect.c:506:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/pgtable.h:317:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:317:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:317:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:317:16: sparse: sparse: cast from non-scalar

vim +450 mm/mprotect.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  428  
a79390f5d6a786 Peter Xu       2023-01-04  429  static inline long change_pud_range(struct mmu_gather *tlb,
4a18419f71cdf9 Nadav Amit     2022-05-09  430  		struct vm_area_struct *vma, p4d_t *p4d, unsigned long addr,
4a18419f71cdf9 Nadav Amit     2022-05-09  431  		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
^1da177e4c3f41 Linus Torvalds 2005-04-16  432  {
f57f3a2637bbf6 Peter Xu       2024-08-07  433  	struct mmu_notifier_range range;
8bc2ff0f6f8ecb Peter Xu       2024-08-07  434  	pud_t *pudp, pud;
^1da177e4c3f41 Linus Torvalds 2005-04-16  435  	unsigned long next;
d1751118c88673 Peter Xu       2023-01-04  436  	long pages = 0, ret;
^1da177e4c3f41 Linus Torvalds 2005-04-16  437  
f57f3a2637bbf6 Peter Xu       2024-08-07  438  	range.start = 0;
f57f3a2637bbf6 Peter Xu       2024-08-07  439  
8bc2ff0f6f8ecb Peter Xu       2024-08-07  440  	pudp = pud_offset(p4d, addr);
^1da177e4c3f41 Linus Torvalds 2005-04-16  441  	do {
8bc2ff0f6f8ecb Peter Xu       2024-08-07  442  again:
^1da177e4c3f41 Linus Torvalds 2005-04-16  443  		next = pud_addr_end(addr, end);
8bc2ff0f6f8ecb Peter Xu       2024-08-07  444  		ret = change_prepare(vma, pudp, pmd, addr, cp_flags);
f57f3a2637bbf6 Peter Xu       2024-08-07  445  		if (ret) {
f57f3a2637bbf6 Peter Xu       2024-08-07  446  			pages = ret;
f57f3a2637bbf6 Peter Xu       2024-08-07  447  			break;
f57f3a2637bbf6 Peter Xu       2024-08-07  448  		}
8bc2ff0f6f8ecb Peter Xu       2024-08-07  449  
8bc2ff0f6f8ecb Peter Xu       2024-08-07 @450  		pud = READ_ONCE(*pudp);
8bc2ff0f6f8ecb Peter Xu       2024-08-07  451  		if (pud_none(pud))
^1da177e4c3f41 Linus Torvalds 2005-04-16  452  			continue;
8bc2ff0f6f8ecb Peter Xu       2024-08-07  453  
f57f3a2637bbf6 Peter Xu       2024-08-07  454  		if (!range.start) {
f57f3a2637bbf6 Peter Xu       2024-08-07  455  			mmu_notifier_range_init(&range,
f57f3a2637bbf6 Peter Xu       2024-08-07  456  						MMU_NOTIFY_PROTECTION_VMA, 0,
f57f3a2637bbf6 Peter Xu       2024-08-07  457  						vma->vm_mm, addr, end);
f57f3a2637bbf6 Peter Xu       2024-08-07  458  			mmu_notifier_invalidate_range_start(&range);
f57f3a2637bbf6 Peter Xu       2024-08-07  459  		}
8bc2ff0f6f8ecb Peter Xu       2024-08-07  460  
8bc2ff0f6f8ecb Peter Xu       2024-08-07  461  		if (pud_leaf(pud)) {
8bc2ff0f6f8ecb Peter Xu       2024-08-07  462  			if ((next - addr != PUD_SIZE) ||
8bc2ff0f6f8ecb Peter Xu       2024-08-07  463  			    pgtable_split_needed(vma, cp_flags)) {
8bc2ff0f6f8ecb Peter Xu       2024-08-07  464  				__split_huge_pud(vma, pudp, addr);
8bc2ff0f6f8ecb Peter Xu       2024-08-07  465  				goto again;
8bc2ff0f6f8ecb Peter Xu       2024-08-07  466  			} else {
8bc2ff0f6f8ecb Peter Xu       2024-08-07  467  				ret = change_huge_pud(tlb, vma, pudp,
8bc2ff0f6f8ecb Peter Xu       2024-08-07  468  						      addr, newprot, cp_flags);
8bc2ff0f6f8ecb Peter Xu       2024-08-07  469  				if (ret == 0)
8bc2ff0f6f8ecb Peter Xu       2024-08-07  470  					goto again;
8bc2ff0f6f8ecb Peter Xu       2024-08-07  471  				/* huge pud was handled */
8bc2ff0f6f8ecb Peter Xu       2024-08-07  472  				if (ret == HPAGE_PUD_NR)
8bc2ff0f6f8ecb Peter Xu       2024-08-07  473  					pages += HPAGE_PUD_NR;
8bc2ff0f6f8ecb Peter Xu       2024-08-07  474  				continue;
8bc2ff0f6f8ecb Peter Xu       2024-08-07  475  			}
8bc2ff0f6f8ecb Peter Xu       2024-08-07  476  		}
8bc2ff0f6f8ecb Peter Xu       2024-08-07  477  
8bc2ff0f6f8ecb Peter Xu       2024-08-07  478  		pages += change_pmd_range(tlb, vma, pudp, addr, next, newprot,
58705444c45b3c Peter Xu       2020-04-06  479  					  cp_flags);
8bc2ff0f6f8ecb Peter Xu       2024-08-07  480  	} while (pudp++, addr = next, addr != end);
7da4d641c58d20 Peter Zijlstra 2012-11-19  481  
f57f3a2637bbf6 Peter Xu       2024-08-07  482  	if (range.start)
f57f3a2637bbf6 Peter Xu       2024-08-07  483  		mmu_notifier_invalidate_range_end(&range);
f57f3a2637bbf6 Peter Xu       2024-08-07  484  
7da4d641c58d20 Peter Zijlstra 2012-11-19  485  	return pages;
^1da177e4c3f41 Linus Torvalds 2005-04-16  486  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  487  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
