Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F0E6FA2
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Mar 2023 19:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680118158; x=1711654158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UrWtTP2vtTFbmHdL2VTRrzqbmR8m2V6fIuQRihLGe+g=;
  b=i5Z+aD8n8EHi5zMrmmrp6pdaedv36HJJ4vdCKX4EqU6/X9k4REK6iFLI
   wEkrHCTjbxON7QR/9G293nXwymJgj0cfs98NOmkIA+2AslLS6suDPRF89
   hx7AYXbvY9yuzMQ1CkESx3+WEa0ja0X7DWA4JazF8rn2Lx8zgR51kcZsJ
   NRGVsE8v4YFjMqvaob+ph+PXLkunF8ps6b3i5I9bGCIpseed869euA3l4
   w+Ri4H2nRd0LlKfdEzNAWdB8ZYHlh/hcq/lf4S+Hcrqj/e8b5D1u318Vq
   zq0b2moyyUa96wRq27YErXTtfcHG9jz2900lQy1UKyVuHpbiabWN8sMH+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="329466249"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="329466249"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 12:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="808348323"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="808348323"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Mar 2023 12:29:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phbTp-000JsO-2J;
	Wed, 29 Mar 2023 19:29:09 +0000
Date: Thu, 30 Mar 2023 03:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/vmscan.c:4080:29: sparse: sparse: cast to non-scalar
Message-ID: <202303300325.Mp5ACtcb-lkp@intel.com>
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
head:   ffe78bbd512166e0ef1cc4858010b128c510ed7d
commit: bd74fdaea146029e4fa12c6de89adbe0779348a9 mm: multi-gen LRU: support page table walks
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: alpha-randconfig-s052-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300325.Mp5ACtcb-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/r/202303300325.Mp5ACtcb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/vmscan.c:4080:29: sparse: sparse: cast to non-scalar
>> mm/vmscan.c:4080:29: sparse: sparse: cast from non-scalar
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
https://github.com/intel/lkp-tests
