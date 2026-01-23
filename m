Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB3029E113
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 21:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769204067; cv=none; b=rrliv3x4qr74yEYwxv8I803Bnt9Is4eNOBYhEAAmG0sXynAeJE5hPncsw3S7H0OQcPSSwCINRdVNK9dgfkThZHg6UbsifaXNRaffjTzEuriGs6wbXzQVankE5gT7IzioX+CrKjDp+ImsjIDKspxc0rhOGP52GjBKCvqsBC1ojJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769204067; c=relaxed/simple;
	bh=dO6vOhtOesH2eKC2RvG51a15dfjC8R2wY848tT7DKHE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mWySmit9pARjgRNoVRimwIAGJo1e8WnY3LunpWv3pE3YrLzVAJe4VAPQiofgh1kovt7S9Ol2JTBMWyOHMAMkcMn16jPI2Sd9AKvCUWWJSA28reStqh14Nmd4QRDlK1KggMM1eGokv8fcnZlXsKpEEO39CkqHIP33+6Z5Op+dNQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjgpZuYH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjgpZuYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769204066; x=1800740066;
  h=date:from:to:cc:subject:message-id;
  bh=dO6vOhtOesH2eKC2RvG51a15dfjC8R2wY848tT7DKHE=;
  b=TjgpZuYHpViSKWjcriosN5jjVR6bh05+y24mX+EjWki0rMJyhT4E+jlp
   alDQoZg3KOs+73f7Hk/HuokHSe4taRzSmlV1ymhPUMqWrFVU4vqB9JX57
   qh2xmAoDtED1Jg/IXuma5CVfkZTwlJk+PLskIy9DzG6oeFgA5pgbezov/
   tzONxtNTv/8xDehWDSKiybjUc4UedlPZ3VxTonFaH5rrfqsqt/KJ2yW7o
   qWcvfAUIudBu052SlgNiREFwZcLSxHWWh/COJs7JsnWNHUvKp3Tmp1DuJ
   bBmYc0ZsiF07xZJLjV9SCoRgaHlmrD6mVF2ibnT4jTLV/c4xVLvis9/Pl
   g==;
X-CSE-ConnectionGUID: JPPntDjURLWccrlPZ7Du0w==
X-CSE-MsgGUID: hoTaDg2iSp2vFLjNUuWmag==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74094211"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="74094211"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:34:26 -0800
X-CSE-ConnectionGUID: KXxE+71MQfec9aXqMnFpJw==
X-CSE-MsgGUID: 6pAeA9htRaS1PBoqVvmAAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="212119367"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Jan 2026 13:34:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjOnO-00000000UUQ-03mx;
	Fri, 23 Jan 2026 21:34:22 +0000
Date: Sat, 24 Jan 2026 05:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:scrub-syzbot-fixes-7.0 11/44] mm/gup.c:3176:20:
 warning: 'seq' may be used uninitialized
Message-ID: <202601240529.QpFyEbEP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git scrub-syzbot-fixes-7.0
head:   2d76e519f5fa0d3323cdd2ce3404fc19e6c23f3d
commit: c45a0220071a896d5492a1b839c518327df54f9f [11/44] fs: turn on more warnings for the filesystem code we modify most
:::::: branch date: 4 hours ago
:::::: commit date: 5 days ago
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260124/202601240529.QpFyEbEP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240529.QpFyEbEP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240529.QpFyEbEP-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In function 'gup_fast',
       inlined from 'gup_fast_fallback' at mm/gup.c:3213:14:
>> mm/gup.c:3176:20: warning: 'seq' may be used uninitialized [-Wmaybe-uninitialized]
    3176 |                 if (read_seqcount_retry(&current->mm->write_protect_seq, seq)) {
         |                    ^
   mm/gup.c: In function 'gup_fast_fallback':
   mm/gup.c:3145:18: note: 'seq' was declared here
    3145 |         unsigned seq;
         |                  ^~~


vim +/seq +3176 mm/gup.c

5b65c4677a57a1 Kiryl Shutsemau   2017-09-09  3139  
23babe1934d763 David Hildenbrand 2024-04-02  3140  static unsigned long gup_fast(unsigned long start, unsigned long end,
23babe1934d763 David Hildenbrand 2024-04-02  3141  		unsigned int gup_flags, struct page **pages)
2667f50e8b8145 Steve Capper      2014-10-09  3142  {
376a34efa4eeb6 John Hubbard      2020-06-03  3143  	unsigned long flags;
c28b1fc70390df Jason Gunthorpe   2020-12-14  3144  	int nr_pinned = 0;
57efa1fe595769 Jason Gunthorpe   2020-12-14  3145  	unsigned seq;
c28b1fc70390df Jason Gunthorpe   2020-12-14  3146  
25176ad09ca395 David Hildenbrand 2024-04-02  3147  	if (!IS_ENABLED(CONFIG_HAVE_GUP_FAST) ||
c28b1fc70390df Jason Gunthorpe   2020-12-14  3148  	    !gup_fast_permitted(start, end))
c28b1fc70390df Jason Gunthorpe   2020-12-14  3149  		return 0;
c28b1fc70390df Jason Gunthorpe   2020-12-14  3150  
57efa1fe595769 Jason Gunthorpe   2020-12-14  3151  	if (gup_flags & FOLL_PIN) {
7528585290a1a1 Peter Zijlstra    2024-11-22  3152  		if (!raw_seqcount_try_begin(&current->mm->write_protect_seq, seq))
57efa1fe595769 Jason Gunthorpe   2020-12-14  3153  			return 0;
57efa1fe595769 Jason Gunthorpe   2020-12-14  3154  	}
57efa1fe595769 Jason Gunthorpe   2020-12-14  3155  
c28b1fc70390df Jason Gunthorpe   2020-12-14  3156  	/*
c28b1fc70390df Jason Gunthorpe   2020-12-14  3157  	 * Disable interrupts. The nested form is used, in order to allow full,
c28b1fc70390df Jason Gunthorpe   2020-12-14  3158  	 * general purpose use of this routine.
c28b1fc70390df Jason Gunthorpe   2020-12-14  3159  	 *
c28b1fc70390df Jason Gunthorpe   2020-12-14  3160  	 * With interrupts disabled, we block page table pages from being freed
c28b1fc70390df Jason Gunthorpe   2020-12-14  3161  	 * from under us. See struct mmu_table_batch comments in
c28b1fc70390df Jason Gunthorpe   2020-12-14  3162  	 * include/asm-generic/tlb.h for more details.
c28b1fc70390df Jason Gunthorpe   2020-12-14  3163  	 *
c28b1fc70390df Jason Gunthorpe   2020-12-14  3164  	 * We do not adopt an rcu_read_lock() here as we also want to block IPIs
52084f258e46f0 Jann Horn         2025-05-28  3165  	 * that come from callers of tlb_remove_table_sync_one().
c28b1fc70390df Jason Gunthorpe   2020-12-14  3166  	 */
c28b1fc70390df Jason Gunthorpe   2020-12-14  3167  	local_irq_save(flags);
23babe1934d763 David Hildenbrand 2024-04-02  3168  	gup_fast_pgd_range(start, end, gup_flags, pages, &nr_pinned);
c28b1fc70390df Jason Gunthorpe   2020-12-14  3169  	local_irq_restore(flags);
57efa1fe595769 Jason Gunthorpe   2020-12-14  3170  
57efa1fe595769 Jason Gunthorpe   2020-12-14  3171  	/*
57efa1fe595769 Jason Gunthorpe   2020-12-14  3172  	 * When pinning pages for DMA there could be a concurrent write protect
23babe1934d763 David Hildenbrand 2024-04-02  3173  	 * from fork() via copy_page_range(), in this case always fail GUP-fast.
57efa1fe595769 Jason Gunthorpe   2020-12-14  3174  	 */
57efa1fe595769 Jason Gunthorpe   2020-12-14  3175  	if (gup_flags & FOLL_PIN) {
57efa1fe595769 Jason Gunthorpe   2020-12-14 @3176  		if (read_seqcount_retry(&current->mm->write_protect_seq, seq)) {
23babe1934d763 David Hildenbrand 2024-04-02  3177  			gup_fast_unpin_user_pages(pages, nr_pinned);
57efa1fe595769 Jason Gunthorpe   2020-12-14  3178  			return 0;
b6a2619c60b41a David Hildenbrand 2022-05-09  3179  		} else {
b6a2619c60b41a David Hildenbrand 2022-05-09  3180  			sanity_check_pinned_pages(pages, nr_pinned);
57efa1fe595769 Jason Gunthorpe   2020-12-14  3181  		}
57efa1fe595769 Jason Gunthorpe   2020-12-14  3182  	}
c28b1fc70390df Jason Gunthorpe   2020-12-14  3183  	return nr_pinned;
c28b1fc70390df Jason Gunthorpe   2020-12-14  3184  }
c28b1fc70390df Jason Gunthorpe   2020-12-14  3185  

:::::: The code at line 3176 was first introduced by commit
:::::: 57efa1fe5957694fa541c9062de0a127f0b9acb0 mm/gup: prevent gup_fast from racing with COW during fork

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
