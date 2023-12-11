Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B24413FEB
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 02:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ywchx9Lz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702262847; x=1733798847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZODOuUF8gRwNAc/zMCyNYEfH3pdB1h9o94Z1Z5nydws=;
  b=Ywchx9LzDMjLOYJV0j0RklMHNstvG7LEhBvmIW7Lk9plz5dLti53oMfl
   D53MF+bqpX5R6h/E7W9kVJbrxH9vv5B2TBFBGkFwjY2MT5JWvIP4pgwO7
   TF40eQODTWoTSafKlRms+G8Red0Btdudyhfrq6mJpwnFhVY61QmslcvEl
   fe1fQgOKbxUCUFDfDVGMDzYH8iMScHRfdN4mx7FnEOpuTd57z6Y08T+HZ
   LE2kzWeBMLdY0DJ9zpYF0PgavmJN9n8u2TaLPoFgJPVjC4ah5mCBQ0/zw
   58fkg6PcIbOIIrSXeVjUH6J3vxMy3xqTnIJQcTCTnIvelvVBI2KGg8+9J
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="394320336"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="394320336"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 18:47:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="838843821"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="838843821"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 10 Dec 2023 18:47:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCWKH-000HYq-1x;
	Mon, 11 Dec 2023 02:47:21 +0000
Date: Mon, 11 Dec 2023 10:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/vmscan.c:4080:29: sparse: sparse: cast to non-scalar
Message-ID: <202312111013.7sVRgU8h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/vmscan.c:4080:29: sparse: sparse: cast to non-scalar"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yu Zhao <yuzhao@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: bd74fdaea146029e4fa12c6de89adbe0779348a9 mm: multi-gen LRU: support page table walks
date:   1 year, 2 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 2 months ago
config: alpha-randconfig-r131-20231116 (https://download.01.org/0day-ci/archive/20231211/202312111013.7sVRgU8h-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312111013.7sVRgU8h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312111013.7sVRgU8h-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/vmscan.c:4080:29: sparse: sparse: cast to non-scalar
>> mm/vmscan.c:4080:29: sparse: sparse: cast from non-scalar
   mm/vmscan.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file:
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file:
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file:
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file:
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file:
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:737:9: sparse: sparse: context imbalance in 'lru_gen_look_around' - different lock contexts for basic block
   mm/vmscan.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file:
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file:
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file:
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   include/linux/mm_inline.h:44:9: sparse: sparse: self-comparison always evaluates to false
   mm/vmscan.c: note: in included file (through include/linux/swap.h):
   include/linux/memcontrol.h:1663:39: sparse: sparse: context imbalance in 'check_move_unevictable_folios' - unexpected unlock

vim +4080 mm/vmscan.c

bd74fdaea14602 Yu Zhao 2022-09-18  4065  
bd74fdaea14602 Yu Zhao 2022-09-18  4066  static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long end,
bd74fdaea14602 Yu Zhao 2022-09-18  4067  			  struct mm_walk *args)
bd74fdaea14602 Yu Zhao 2022-09-18  4068  {
bd74fdaea14602 Yu Zhao 2022-09-18  4069  	int i;
bd74fdaea14602 Yu Zhao 2022-09-18  4070  	pud_t *pud;
bd74fdaea14602 Yu Zhao 2022-09-18  4071  	unsigned long addr;
bd74fdaea14602 Yu Zhao 2022-09-18  4072  	unsigned long next;
bd74fdaea14602 Yu Zhao 2022-09-18  4073  	struct lru_gen_mm_walk *walk = args->private;
bd74fdaea14602 Yu Zhao 2022-09-18  4074  
bd74fdaea14602 Yu Zhao 2022-09-18  4075  	VM_WARN_ON_ONCE(p4d_leaf(*p4d));
bd74fdaea14602 Yu Zhao 2022-09-18  4076  
bd74fdaea14602 Yu Zhao 2022-09-18  4077  	pud = pud_offset(p4d, start & P4D_MASK);
bd74fdaea14602 Yu Zhao 2022-09-18  4078  restart:
bd74fdaea14602 Yu Zhao 2022-09-18  4079  	for (i = pud_index(start), addr = start; addr != end; i++, addr = next) {
bd74fdaea14602 Yu Zhao 2022-09-18 @4080  		pud_t val = READ_ONCE(pud[i]);
bd74fdaea14602 Yu Zhao 2022-09-18  4081  
bd74fdaea14602 Yu Zhao 2022-09-18  4082  		next = pud_addr_end(addr, end);
bd74fdaea14602 Yu Zhao 2022-09-18  4083  
bd74fdaea14602 Yu Zhao 2022-09-18  4084  		if (!pud_present(val) || WARN_ON_ONCE(pud_leaf(val)))
bd74fdaea14602 Yu Zhao 2022-09-18  4085  			continue;
bd74fdaea14602 Yu Zhao 2022-09-18  4086  
bd74fdaea14602 Yu Zhao 2022-09-18  4087  		walk_pmd_range(&val, addr, next, args);
bd74fdaea14602 Yu Zhao 2022-09-18  4088  
bd74fdaea14602 Yu Zhao 2022-09-18  4089  		/* a racy check to curtail the waiting time */
bd74fdaea14602 Yu Zhao 2022-09-18  4090  		if (wq_has_sleeper(&walk->lruvec->mm_state.wait))
bd74fdaea14602 Yu Zhao 2022-09-18  4091  			return 1;
bd74fdaea14602 Yu Zhao 2022-09-18  4092  
bd74fdaea14602 Yu Zhao 2022-09-18  4093  		if (need_resched() || walk->batched >= MAX_LRU_BATCH) {
bd74fdaea14602 Yu Zhao 2022-09-18  4094  			end = (addr | ~PUD_MASK) + 1;
bd74fdaea14602 Yu Zhao 2022-09-18  4095  			goto done;
bd74fdaea14602 Yu Zhao 2022-09-18  4096  		}
bd74fdaea14602 Yu Zhao 2022-09-18  4097  	}
bd74fdaea14602 Yu Zhao 2022-09-18  4098  
bd74fdaea14602 Yu Zhao 2022-09-18  4099  	if (i < PTRS_PER_PUD && get_next_vma(P4D_MASK, PUD_SIZE, args, &start, &end))
bd74fdaea14602 Yu Zhao 2022-09-18  4100  		goto restart;
bd74fdaea14602 Yu Zhao 2022-09-18  4101  
bd74fdaea14602 Yu Zhao 2022-09-18  4102  	end = round_up(end, P4D_SIZE);
bd74fdaea14602 Yu Zhao 2022-09-18  4103  done:
bd74fdaea14602 Yu Zhao 2022-09-18  4104  	if (!end || !args->vma)
bd74fdaea14602 Yu Zhao 2022-09-18  4105  		return 1;
bd74fdaea14602 Yu Zhao 2022-09-18  4106  
bd74fdaea14602 Yu Zhao 2022-09-18  4107  	walk->next_addr = max(end, args->vma->vm_start);
bd74fdaea14602 Yu Zhao 2022-09-18  4108  
bd74fdaea14602 Yu Zhao 2022-09-18  4109  	return -EAGAIN;
bd74fdaea14602 Yu Zhao 2022-09-18  4110  }
bd74fdaea14602 Yu Zhao 2022-09-18  4111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
