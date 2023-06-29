Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7588315480
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jun 2023 19:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688066380; x=1719602380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QgZRbCfiVTlBZA9vfhL06v/nisVDr0bIa9fCebvBG1k=;
  b=g41V/HdV2vyLKabByQEr9Xy6Vsql37alpZBBcHA3kNaP9pOpOWb063wh
   x8kgWfuLUfbq2OqrPF52c/xw+VANVxpbr2unhy2ZGjSVnwt45pfrYHHa2
   b4/x/fd6+Ucba/OSVkqVEol/yVnoDPegNgm24jevoPonL2Casw4WG1EP6
   ZccpRM0rY7XyQ6KJZGBxiVIBsfYF1+Dq5+IwVS//IwuiFSQia1yxoSI+N
   WfGWmSOpNGHPkO0WFHDxP7BR8rCUMgwouBYeF2VTIDTYR0kqsuF9SsUzP
   IKEyac3IAYWhJWiYv3nOZRu1z54uCuUDSGuAw/ZYLKsqE0eY0/PiJTcUD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="346987451"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="346987451"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 12:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="747130607"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="747130607"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Jun 2023 12:19:38 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qExB3-000ELt-23;
	Thu, 29 Jun 2023 19:19:37 +0000
Date: Fri, 30 Jun 2023 03:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/vmscan.c:4080:29: sparse: sparse: cast to non-scalar
Message-ID: <202306300356.RiOenM6y-lkp@intel.com>
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
head:   1b722407a13b7f8658d2e26917791f32805980a2
commit: bd74fdaea146029e4fa12c6de89adbe0779348a9 mm: multi-gen LRU: support page table walks
date:   9 months ago
:::::: branch date: 72 minutes ago
:::::: commit date: 9 months ago
config: alpha-randconfig-r081-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300356.RiOenM6y-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300356.RiOenM6y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306300356.RiOenM6y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/vmscan.c:4080:29: sparse: sparse: cast to non-scalar
>> mm/vmscan.c:4080:29: sparse: sparse: cast from non-scalar
   mm/vmscan.c:2274:33: sparse: sparse: context imbalance in 'folio_isolate_lru' - unexpected unlock
   mm/vmscan.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:737:9: sparse: sparse: context imbalance in 'lru_gen_look_around' - different lock contexts for basic block
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
