Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518673D60
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 17:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683739962; x=1715275962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FrmmyZqS/uwMxbMgoJwhDLxYYU4Oqp9XycF9C8YOcFo=;
  b=GnalCuUK57GvNoe+OvLrvBQw+6Yddt924wLTqbf56xW/KyyM0ORxx+Ct
   h1B1qwcig2B4PKVAFS9ahmTrFZUktTz592Sk+/ppmoZHCD9dQLo0eOzIT
   Jrtwp1F7yt5vDmNxgbmJ/0/Zg4T4n14F5NIAcPyyjTh1BF9vs9NUpFCTZ
   AF5T54JX/B49WXdyEoi2c3vER87QNK3AIKPeFtdkzTJ8YLYi/PeH5z/wR
   TpHkBJZDPppIYbsLzdes2DnGTGuMeCKqMLmdGHsdyk2bqjFSLx4n717Y/
   9F57bKG2CAH30tqn94FdEAnFagS+EclBt1AsSiMTWlVZ4uJy5bvplbq9e
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="415850071"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="415850071"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 10:32:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="873644597"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="873644597"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 May 2023 10:32:40 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwng8-0003TA-0l;
	Wed, 10 May 2023 17:32:40 +0000
Date: Thu, 11 May 2023 01:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/vmscan.c:4080:29: sparse: sparse: cast to non-scalar
Message-ID: <202305110108.HdFFPTJN-lkp@intel.com>
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
head:   ad2fd53a7870a395b8564697bef6c329d017c6c9
commit: bd74fdaea146029e4fa12c6de89adbe0779348a9 mm: multi-gen LRU: support page table walks
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: alpha-randconfig-s031-20230510 (https://download.01.org/0day-ci/archive/20230511/202305110108.HdFFPTJN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bd74fdaea146029e4fa12c6de89adbe0779348a9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bd74fdaea146029e4fa12c6de89adbe0779348a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305110108.HdFFPTJN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/vmscan.c:4080:29: sparse: sparse: cast to non-scalar
>> mm/vmscan.c:4080:29: sparse: sparse: cast from non-scalar
   mm/vmscan.c:1385:28: sparse: sparse: context imbalance in '__remove_mapping' - unexpected unlock
   mm/vmscan.c:2274:33: sparse: sparse: context imbalance in 'folio_isolate_lru' - unexpected unlock
   mm/vmscan.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:737:9: sparse: sparse: context imbalance in 'lru_gen_look_around' - different lock contexts for basic block
   mm/vmscan.c: note: in included file (through include/linux/swap.h):
   include/linux/memcontrol.h:1663:39: sparse: sparse: context imbalance in 'check_move_unevictable_folios' - unexpected unlock

vim +4080 mm/vmscan.c

bd74fdaea146029 Yu Zhao 2022-09-18  4065  
bd74fdaea146029 Yu Zhao 2022-09-18  4066  static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long end,
bd74fdaea146029 Yu Zhao 2022-09-18  4067  			  struct mm_walk *args)
bd74fdaea146029 Yu Zhao 2022-09-18  4068  {
bd74fdaea146029 Yu Zhao 2022-09-18  4069  	int i;
bd74fdaea146029 Yu Zhao 2022-09-18  4070  	pud_t *pud;
bd74fdaea146029 Yu Zhao 2022-09-18  4071  	unsigned long addr;
bd74fdaea146029 Yu Zhao 2022-09-18  4072  	unsigned long next;
bd74fdaea146029 Yu Zhao 2022-09-18  4073  	struct lru_gen_mm_walk *walk = args->private;
bd74fdaea146029 Yu Zhao 2022-09-18  4074  
bd74fdaea146029 Yu Zhao 2022-09-18  4075  	VM_WARN_ON_ONCE(p4d_leaf(*p4d));
bd74fdaea146029 Yu Zhao 2022-09-18  4076  
bd74fdaea146029 Yu Zhao 2022-09-18  4077  	pud = pud_offset(p4d, start & P4D_MASK);
bd74fdaea146029 Yu Zhao 2022-09-18  4078  restart:
bd74fdaea146029 Yu Zhao 2022-09-18  4079  	for (i = pud_index(start), addr = start; addr != end; i++, addr = next) {
bd74fdaea146029 Yu Zhao 2022-09-18 @4080  		pud_t val = READ_ONCE(pud[i]);
bd74fdaea146029 Yu Zhao 2022-09-18  4081  
bd74fdaea146029 Yu Zhao 2022-09-18  4082  		next = pud_addr_end(addr, end);
bd74fdaea146029 Yu Zhao 2022-09-18  4083  
bd74fdaea146029 Yu Zhao 2022-09-18  4084  		if (!pud_present(val) || WARN_ON_ONCE(pud_leaf(val)))
bd74fdaea146029 Yu Zhao 2022-09-18  4085  			continue;
bd74fdaea146029 Yu Zhao 2022-09-18  4086  
bd74fdaea146029 Yu Zhao 2022-09-18  4087  		walk_pmd_range(&val, addr, next, args);
bd74fdaea146029 Yu Zhao 2022-09-18  4088  
bd74fdaea146029 Yu Zhao 2022-09-18  4089  		/* a racy check to curtail the waiting time */
bd74fdaea146029 Yu Zhao 2022-09-18  4090  		if (wq_has_sleeper(&walk->lruvec->mm_state.wait))
bd74fdaea146029 Yu Zhao 2022-09-18  4091  			return 1;
bd74fdaea146029 Yu Zhao 2022-09-18  4092  
bd74fdaea146029 Yu Zhao 2022-09-18  4093  		if (need_resched() || walk->batched >= MAX_LRU_BATCH) {
bd74fdaea146029 Yu Zhao 2022-09-18  4094  			end = (addr | ~PUD_MASK) + 1;
bd74fdaea146029 Yu Zhao 2022-09-18  4095  			goto done;
bd74fdaea146029 Yu Zhao 2022-09-18  4096  		}
bd74fdaea146029 Yu Zhao 2022-09-18  4097  	}
bd74fdaea146029 Yu Zhao 2022-09-18  4098  
bd74fdaea146029 Yu Zhao 2022-09-18  4099  	if (i < PTRS_PER_PUD && get_next_vma(P4D_MASK, PUD_SIZE, args, &start, &end))
bd74fdaea146029 Yu Zhao 2022-09-18  4100  		goto restart;
bd74fdaea146029 Yu Zhao 2022-09-18  4101  
bd74fdaea146029 Yu Zhao 2022-09-18  4102  	end = round_up(end, P4D_SIZE);
bd74fdaea146029 Yu Zhao 2022-09-18  4103  done:
bd74fdaea146029 Yu Zhao 2022-09-18  4104  	if (!end || !args->vma)
bd74fdaea146029 Yu Zhao 2022-09-18  4105  		return 1;
bd74fdaea146029 Yu Zhao 2022-09-18  4106  
bd74fdaea146029 Yu Zhao 2022-09-18  4107  	walk->next_addr = max(end, args->vma->vm_start);
bd74fdaea146029 Yu Zhao 2022-09-18  4108  
bd74fdaea146029 Yu Zhao 2022-09-18  4109  	return -EAGAIN;
bd74fdaea146029 Yu Zhao 2022-09-18  4110  }
bd74fdaea146029 Yu Zhao 2022-09-18  4111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
