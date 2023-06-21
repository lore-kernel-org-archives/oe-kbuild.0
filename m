Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDCEECA
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jun 2023 00:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687308115; x=1718844115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DKJMBagrr/BY6VtwuUeCFnJ+wx/C/7oDeT/hezl+HIY=;
  b=EK+1Xx+EstmGciGSpUnE2EsKdct7mDhPNysS0VBm/G85PaNWngk0Q7Uu
   rde+FnGa1SrX98DbShG3aVD/3chtoGqUnGYEEl52Fjz7uIW/wAOdzFb/P
   wx4K1zqPqi4T2ZRMYdF5lD++iYNz1AiWBP/qzzsrsgcrjTIxGVM0rHUqd
   PcMIz8IE3fvNz+cRzpmjPHJpdU7Rm85uXWsT0aj67oi8NEUE9b6FbTzkr
   a8DNvxZVLq7O4Fh0yB5C8BEx6X0oE/4QRnMHWYZgaNsVqGcXvNfeZ30Qf
   QcVd7pAn3+sWrEbMfsShafioh0kmlhzKLnzwnEojwjgoHPXAqx2c5hllG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="446396759"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="446396759"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 17:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="779642425"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="779642425"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2023 17:41:46 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBlus-0006Na-0j;
	Wed, 21 Jun 2023 00:41:46 +0000
Date: Wed, 21 Jun 2023 08:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] mm/lru_gen: Don't build multi-gen LRU page table
 walk code on architecture not supported
Message-ID: <202306210854.KhzSokFU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um arch report"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230613120047.149573-3-aneesh.kumar@linux.ibm.com>
References: <20230613120047.149573-3-aneesh.kumar@linux.ibm.com>
TO: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
TO: linux-mm@kvack.org
TO: akpm@linux-foundation.org
CC: Yu Zhao <yuzhao@google.com>
CC: "T . J . Alumbaugh" <talumbau@google.com>
CC: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

Hi Aneesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master tip/x86/core v6.4-rc7 next-20230620]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V/mm-lru_gen-lru_gen_look_around-simplification/20230613-200408
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230613120047.149573-3-aneesh.kumar%40linux.ibm.com
patch subject: [PATCH 3/3] mm/lru_gen: Don't build multi-gen LRU page table walk code on architecture not supported
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: um-randconfig-r026-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210854.KhzSokFU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210854.KhzSokFU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306210854.KhzSokFU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/vmscan.c:19:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/vmscan.c:19:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/vmscan.c:19:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> mm/vmscan.c:4564:6: warning: no previous prototype for function '__try_to_inc_max_seq' [-Wmissing-prototypes]
    4564 | bool __try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_seq,
         |      ^
   mm/vmscan.c:4564:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4564 | bool __try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_seq,
         | ^
         | static 
>> mm/vmscan.c:4760:6: warning: variable 'young' set but not used [-Wunused-but-set-variable]
    4760 |         int young = 0;
         |             ^
   14 warnings generated.


vim +/__try_to_inc_max_seq +4564 mm/vmscan.c

4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4559  
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4560  /*
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4561   * inc_max_seq can drop the lru_lock in between. So use a waitqueue seq_update_progress
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4562   * to allow concurrent access.
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4563   */
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13 @4564  bool __try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_seq,
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4565  			  bool can_swap, bool force_scan)
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4566  {
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4567  	bool success = false;
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4568  	struct lru_gen_folio *lrugen = &lruvec->lrugen;
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4569  
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4570  	VM_WARN_ON_ONCE(max_seq > READ_ONCE(lrugen->max_seq));
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4571  
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4572  	/* see the comment in iterate_mm_list() */
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4573  	if (lruvec->seq_update_progress)
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4574  		success = false;
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4575  	else {
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4576  		spin_lock_irq(&lruvec->lru_lock);
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4577  
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4578  		if (max_seq != lrugen->max_seq)
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4579  			goto done;
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4580  
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4581  		if (lruvec->seq_update_progress)
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4582  			goto done;
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4583  
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4584  		success = true;
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4585  		lruvec->seq_update_progress = true;
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4586  done:
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4587  		spin_unlock_irq(&lruvec->lru_lock);
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4588  	}
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4589  
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4590  	if (success)
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4591  		inc_max_seq(lruvec, can_swap, force_scan);
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4592  
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4593  	return success;
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4594  }
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4595  
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4596  static bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_seq,
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4597  			       bool can_swap, bool force_scan)
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4598  {
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4599  	return __try_to_inc_max_seq(lruvec, max_seq, can_swap, force_scan);
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4600  }
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4601  #endif
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4602  
bd74fdaea14602 Yu Zhao                 2022-09-18  4603  
7b8144e63d8471 T.J. Alumbaugh          2023-01-18  4604  /******************************************************************************
7b8144e63d8471 T.J. Alumbaugh          2023-01-18  4605   *                          working set protection
7b8144e63d8471 T.J. Alumbaugh          2023-01-18  4606   ******************************************************************************/
7b8144e63d8471 T.J. Alumbaugh          2023-01-18  4607  
7348cc91821b0c Yu Zhao                 2022-12-21  4608  static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc)
ac35a490237446 Yu Zhao                 2022-09-18  4609  {
7348cc91821b0c Yu Zhao                 2022-12-21  4610  	int gen, type, zone;
7348cc91821b0c Yu Zhao                 2022-12-21  4611  	unsigned long total = 0;
7348cc91821b0c Yu Zhao                 2022-12-21  4612  	bool can_swap = get_swappiness(lruvec, sc);
7348cc91821b0c Yu Zhao                 2022-12-21  4613  	struct lru_gen_folio *lrugen = &lruvec->lrugen;
ac35a490237446 Yu Zhao                 2022-09-18  4614  	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
ac35a490237446 Yu Zhao                 2022-09-18  4615  	DEFINE_MAX_SEQ(lruvec);
ac35a490237446 Yu Zhao                 2022-09-18  4616  	DEFINE_MIN_SEQ(lruvec);
ac35a490237446 Yu Zhao                 2022-09-18  4617  
7348cc91821b0c Yu Zhao                 2022-12-21  4618  	for (type = !can_swap; type < ANON_AND_FILE; type++) {
7348cc91821b0c Yu Zhao                 2022-12-21  4619  		unsigned long seq;
ac35a490237446 Yu Zhao                 2022-09-18  4620  
7348cc91821b0c Yu Zhao                 2022-12-21  4621  		for (seq = min_seq[type]; seq <= max_seq; seq++) {
7348cc91821b0c Yu Zhao                 2022-12-21  4622  			gen = lru_gen_from_seq(seq);
ac35a490237446 Yu Zhao                 2022-09-18  4623  
7348cc91821b0c Yu Zhao                 2022-12-21  4624  			for (zone = 0; zone < MAX_NR_ZONES; zone++)
7348cc91821b0c Yu Zhao                 2022-12-21  4625  				total += max(READ_ONCE(lrugen->nr_pages[gen][type][zone]), 0L);
7348cc91821b0c Yu Zhao                 2022-12-21  4626  		}
7348cc91821b0c Yu Zhao                 2022-12-21  4627  	}
7348cc91821b0c Yu Zhao                 2022-12-21  4628  
7348cc91821b0c Yu Zhao                 2022-12-21  4629  	/* whether the size is big enough to be helpful */
7348cc91821b0c Yu Zhao                 2022-12-21  4630  	return mem_cgroup_online(memcg) ? (total >> sc->priority) : total;
7348cc91821b0c Yu Zhao                 2022-12-21  4631  }
7348cc91821b0c Yu Zhao                 2022-12-21  4632  
7348cc91821b0c Yu Zhao                 2022-12-21  4633  static bool lruvec_is_reclaimable(struct lruvec *lruvec, struct scan_control *sc,
7348cc91821b0c Yu Zhao                 2022-12-21  4634  				  unsigned long min_ttl)
7348cc91821b0c Yu Zhao                 2022-12-21  4635  {
7348cc91821b0c Yu Zhao                 2022-12-21  4636  	int gen;
7348cc91821b0c Yu Zhao                 2022-12-21  4637  	unsigned long birth;
7348cc91821b0c Yu Zhao                 2022-12-21  4638  	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
7348cc91821b0c Yu Zhao                 2022-12-21  4639  	DEFINE_MIN_SEQ(lruvec);
ac35a490237446 Yu Zhao                 2022-09-18  4640  
7348cc91821b0c Yu Zhao                 2022-12-21  4641  	/* see the comment on lru_gen_folio */
7348cc91821b0c Yu Zhao                 2022-12-21  4642  	gen = lru_gen_from_seq(min_seq[LRU_GEN_FILE]);
7348cc91821b0c Yu Zhao                 2022-12-21  4643  	birth = READ_ONCE(lruvec->lrugen.timestamps[gen]);
1332a809d95a4f Yu Zhao                 2022-09-18  4644  
1332a809d95a4f Yu Zhao                 2022-09-18  4645  	if (time_is_after_jiffies(birth + min_ttl))
1332a809d95a4f Yu Zhao                 2022-09-18  4646  		return false;
1332a809d95a4f Yu Zhao                 2022-09-18  4647  
7348cc91821b0c Yu Zhao                 2022-12-21  4648  	if (!lruvec_is_sizable(lruvec, sc))
1332a809d95a4f Yu Zhao                 2022-09-18  4649  		return false;
1332a809d95a4f Yu Zhao                 2022-09-18  4650  
7348cc91821b0c Yu Zhao                 2022-12-21  4651  	mem_cgroup_calculate_protection(NULL, memcg);
1332a809d95a4f Yu Zhao                 2022-09-18  4652  
7348cc91821b0c Yu Zhao                 2022-12-21  4653  	return !mem_cgroup_below_min(NULL, memcg);
ac35a490237446 Yu Zhao                 2022-09-18  4654  }
ac35a490237446 Yu Zhao                 2022-09-18  4655  
1332a809d95a4f Yu Zhao                 2022-09-18  4656  /* to protect the working set of the last N jiffies */
1332a809d95a4f Yu Zhao                 2022-09-18  4657  static unsigned long lru_gen_min_ttl __read_mostly;
1332a809d95a4f Yu Zhao                 2022-09-18  4658  
ac35a490237446 Yu Zhao                 2022-09-18  4659  static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
ac35a490237446 Yu Zhao                 2022-09-18  4660  {
ac35a490237446 Yu Zhao                 2022-09-18  4661  	struct mem_cgroup *memcg;
1332a809d95a4f Yu Zhao                 2022-09-18  4662  	unsigned long min_ttl = READ_ONCE(lru_gen_min_ttl);
ac35a490237446 Yu Zhao                 2022-09-18  4663  
ac35a490237446 Yu Zhao                 2022-09-18  4664  	VM_WARN_ON_ONCE(!current_is_kswapd());
ac35a490237446 Yu Zhao                 2022-09-18  4665  
7348cc91821b0c Yu Zhao                 2022-12-21  4666  	/* check the order to exclude compaction-induced reclaim */
7348cc91821b0c Yu Zhao                 2022-12-21  4667  	if (!min_ttl || sc->order || sc->priority == DEF_PRIORITY)
f76c83378851f8 Yu Zhao                 2022-09-18  4668  		return;
bd74fdaea14602 Yu Zhao                 2022-09-18  4669  
ac35a490237446 Yu Zhao                 2022-09-18  4670  	memcg = mem_cgroup_iter(NULL, NULL, NULL);
ac35a490237446 Yu Zhao                 2022-09-18  4671  	do {
ac35a490237446 Yu Zhao                 2022-09-18  4672  		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
ac35a490237446 Yu Zhao                 2022-09-18  4673  
7348cc91821b0c Yu Zhao                 2022-12-21  4674  		if (lruvec_is_reclaimable(lruvec, sc, min_ttl)) {
7348cc91821b0c Yu Zhao                 2022-12-21  4675  			mem_cgroup_iter_break(NULL, memcg);
7348cc91821b0c Yu Zhao                 2022-12-21  4676  			return;
7348cc91821b0c Yu Zhao                 2022-12-21  4677  		}
ac35a490237446 Yu Zhao                 2022-09-18  4678  
ac35a490237446 Yu Zhao                 2022-09-18  4679  		cond_resched();
ac35a490237446 Yu Zhao                 2022-09-18  4680  	} while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)));
bd74fdaea14602 Yu Zhao                 2022-09-18  4681  
1332a809d95a4f Yu Zhao                 2022-09-18  4682  	/*
1332a809d95a4f Yu Zhao                 2022-09-18  4683  	 * The main goal is to OOM kill if every generation from all memcgs is
1332a809d95a4f Yu Zhao                 2022-09-18  4684  	 * younger than min_ttl. However, another possibility is all memcgs are
7348cc91821b0c Yu Zhao                 2022-12-21  4685  	 * either too small or below min.
1332a809d95a4f Yu Zhao                 2022-09-18  4686  	 */
1332a809d95a4f Yu Zhao                 2022-09-18  4687  	if (mutex_trylock(&oom_lock)) {
1332a809d95a4f Yu Zhao                 2022-09-18  4688  		struct oom_control oc = {
1332a809d95a4f Yu Zhao                 2022-09-18  4689  			.gfp_mask = sc->gfp_mask,
1332a809d95a4f Yu Zhao                 2022-09-18  4690  		};
1332a809d95a4f Yu Zhao                 2022-09-18  4691  
1332a809d95a4f Yu Zhao                 2022-09-18  4692  		out_of_memory(&oc);
1332a809d95a4f Yu Zhao                 2022-09-18  4693  
1332a809d95a4f Yu Zhao                 2022-09-18  4694  		mutex_unlock(&oom_lock);
1332a809d95a4f Yu Zhao                 2022-09-18  4695  	}
ac35a490237446 Yu Zhao                 2022-09-18  4696  }
ac35a490237446 Yu Zhao                 2022-09-18  4697  
db19a43d9b3a88 T.J. Alumbaugh          2023-01-18  4698  /******************************************************************************
db19a43d9b3a88 T.J. Alumbaugh          2023-01-18  4699   *                          rmap/PT walk feedback
db19a43d9b3a88 T.J. Alumbaugh          2023-01-18  4700   ******************************************************************************/
db19a43d9b3a88 T.J. Alumbaugh          2023-01-18  4701  
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4702  static void __look_around_gen_update(struct folio *folio, int new_gen)
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4703  {
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4704  	int old_gen;
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4705  
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4706  	old_gen = folio_lru_gen(folio);
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4707  	if (old_gen < 0)
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4708  		folio_set_referenced(folio);
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4709  	else if (old_gen != new_gen)
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4710  		folio_activate(folio);
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4711  }
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4712  
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4713  #ifdef CONFIG_LRU_TASK_PAGE_AGING
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4714  static inline bool current_reclaim_state_can_swap(void)
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4715  {
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4716  	if (current->reclaim_state)
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4717  		return current->reclaim_state->mm_walk->can_swap;
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4718  	return true;
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4719  }
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4720  
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4721  static void look_around_gen_update(struct folio *folio, int new_gen)
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4722  {
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4723  	int old_gen;
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4724  	struct lru_gen_mm_walk *walk;
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4725  
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4726  	walk = current->reclaim_state ? current->reclaim_state->mm_walk : NULL;
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4727  	if (walk) {
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4728  		old_gen = folio_update_gen(folio, new_gen);
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4729  		if (old_gen >= 0 && old_gen != new_gen)
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4730  			update_batch_size(walk, folio, old_gen, new_gen);
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4731  		return;
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4732  	}
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4733  	return __look_around_gen_update(folio, new_gen);
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4734  }
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4735  #else
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4736  
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4737  static inline bool current_reclaim_state_can_swap(void)
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4738  {
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4739  	return true;
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4740  }
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4741  
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4742  static inline void look_around_gen_update(struct folio *folio, int new_gen)
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4743  {
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4744  	return __look_around_gen_update(folio, new_gen);
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4745  }
4bfcfc7496afb0 Aneesh Kumar K.V        2023-06-13  4746  #endif
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4747  
018ee47f14893d Yu Zhao                 2022-09-18  4748  /*
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  4749)  * This function exploits spatial locality when shrink_folio_list() walks the
bd74fdaea14602 Yu Zhao                 2022-09-18  4750   * rmap. It scans the adjacent PTEs of a young PTE and promotes hot pages. If
bd74fdaea14602 Yu Zhao                 2022-09-18  4751   * the scan was done cacheline efficiently, it adds the PMD entry pointing to
bd74fdaea14602 Yu Zhao                 2022-09-18  4752   * the PTE table to the Bloom filter. This forms a feedback loop between the
bd74fdaea14602 Yu Zhao                 2022-09-18  4753   * eviction and the aging.
018ee47f14893d Yu Zhao                 2022-09-18  4754   */
018ee47f14893d Yu Zhao                 2022-09-18  4755  void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
018ee47f14893d Yu Zhao                 2022-09-18  4756  {
018ee47f14893d Yu Zhao                 2022-09-18  4757  	int i;
018ee47f14893d Yu Zhao                 2022-09-18  4758  	unsigned long start;
018ee47f14893d Yu Zhao                 2022-09-18  4759  	unsigned long end;
bd74fdaea14602 Yu Zhao                 2022-09-18 @4760  	int young = 0;
abf086721a2f1e T.J. Alumbaugh          2023-01-18  4761  	pte_t *pte = pvmw->pte;
abf086721a2f1e T.J. Alumbaugh          2023-01-18  4762  	unsigned long addr = pvmw->address;
018ee47f14893d Yu Zhao                 2022-09-18  4763  	struct folio *folio = pfn_folio(pvmw->pfn);
018ee47f14893d Yu Zhao                 2022-09-18  4764  	struct mem_cgroup *memcg = folio_memcg(folio);
018ee47f14893d Yu Zhao                 2022-09-18  4765  	struct pglist_data *pgdat = folio_pgdat(folio);
018ee47f14893d Yu Zhao                 2022-09-18  4766  	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
018ee47f14893d Yu Zhao                 2022-09-18  4767  	DEFINE_MAX_SEQ(lruvec);
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4768  	int new_gen = lru_gen_from_seq(max_seq);
018ee47f14893d Yu Zhao                 2022-09-18  4769  
018ee47f14893d Yu Zhao                 2022-09-18  4770  	lockdep_assert_held(pvmw->ptl);
018ee47f14893d Yu Zhao                 2022-09-18  4771  	VM_WARN_ON_ONCE_FOLIO(folio_test_lru(folio), folio);
018ee47f14893d Yu Zhao                 2022-09-18  4772  
018ee47f14893d Yu Zhao                 2022-09-18  4773  	if (spin_is_contended(pvmw->ptl))
018ee47f14893d Yu Zhao                 2022-09-18  4774  		return;
018ee47f14893d Yu Zhao                 2022-09-18  4775  
abf086721a2f1e T.J. Alumbaugh          2023-01-18  4776  	start = max(addr & PMD_MASK, pvmw->vma->vm_start);
abf086721a2f1e T.J. Alumbaugh          2023-01-18  4777  	end = min(addr | ~PMD_MASK, pvmw->vma->vm_end - 1) + 1;
018ee47f14893d Yu Zhao                 2022-09-18  4778  
018ee47f14893d Yu Zhao                 2022-09-18  4779  	if (end - start > MIN_LRU_BATCH * PAGE_SIZE) {
abf086721a2f1e T.J. Alumbaugh          2023-01-18  4780  		if (addr - start < MIN_LRU_BATCH * PAGE_SIZE / 2)
018ee47f14893d Yu Zhao                 2022-09-18  4781  			end = start + MIN_LRU_BATCH * PAGE_SIZE;
abf086721a2f1e T.J. Alumbaugh          2023-01-18  4782  		else if (end - addr < MIN_LRU_BATCH * PAGE_SIZE / 2)
018ee47f14893d Yu Zhao                 2022-09-18  4783  			start = end - MIN_LRU_BATCH * PAGE_SIZE;
018ee47f14893d Yu Zhao                 2022-09-18  4784  		else {
abf086721a2f1e T.J. Alumbaugh          2023-01-18  4785  			start = addr - MIN_LRU_BATCH * PAGE_SIZE / 2;
abf086721a2f1e T.J. Alumbaugh          2023-01-18  4786  			end = addr + MIN_LRU_BATCH * PAGE_SIZE / 2;
018ee47f14893d Yu Zhao                 2022-09-18  4787  		}
018ee47f14893d Yu Zhao                 2022-09-18  4788  	}
018ee47f14893d Yu Zhao                 2022-09-18  4789  
abf086721a2f1e T.J. Alumbaugh          2023-01-18  4790  	/* folio_update_gen() requires stable folio_memcg() */
abf086721a2f1e T.J. Alumbaugh          2023-01-18  4791  	if (!mem_cgroup_trylock_pages(memcg))
abf086721a2f1e T.J. Alumbaugh          2023-01-18  4792  		return;
018ee47f14893d Yu Zhao                 2022-09-18  4793  
018ee47f14893d Yu Zhao                 2022-09-18  4794  	arch_enter_lazy_mmu_mode();
018ee47f14893d Yu Zhao                 2022-09-18  4795  
abf086721a2f1e T.J. Alumbaugh          2023-01-18  4796  	pte -= (addr - start) / PAGE_SIZE;
abf086721a2f1e T.J. Alumbaugh          2023-01-18  4797  
018ee47f14893d Yu Zhao                 2022-09-18  4798  	for (i = 0, addr = start; addr != end; i++, addr += PAGE_SIZE) {
018ee47f14893d Yu Zhao                 2022-09-18  4799  		unsigned long pfn;
018ee47f14893d Yu Zhao                 2022-09-18  4800  
018ee47f14893d Yu Zhao                 2022-09-18  4801  		pfn = get_pte_pfn(pte[i], pvmw->vma, addr);
018ee47f14893d Yu Zhao                 2022-09-18  4802  		if (pfn == -1)
018ee47f14893d Yu Zhao                 2022-09-18  4803  			continue;
018ee47f14893d Yu Zhao                 2022-09-18  4804  
018ee47f14893d Yu Zhao                 2022-09-18  4805  		if (!pte_young(pte[i]))
018ee47f14893d Yu Zhao                 2022-09-18  4806  			continue;
018ee47f14893d Yu Zhao                 2022-09-18  4807  
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4808  		folio = get_pfn_folio(pfn, memcg, pgdat,
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4809  				      current_reclaim_state_can_swap());
018ee47f14893d Yu Zhao                 2022-09-18  4810  		if (!folio)
018ee47f14893d Yu Zhao                 2022-09-18  4811  			continue;
018ee47f14893d Yu Zhao                 2022-09-18  4812  
018ee47f14893d Yu Zhao                 2022-09-18  4813  		if (!ptep_test_and_clear_young(pvmw->vma, addr, pte + i))
018ee47f14893d Yu Zhao                 2022-09-18  4814  			VM_WARN_ON_ONCE(true);
018ee47f14893d Yu Zhao                 2022-09-18  4815  
bd74fdaea14602 Yu Zhao                 2022-09-18  4816  		young++;
bd74fdaea14602 Yu Zhao                 2022-09-18  4817  
018ee47f14893d Yu Zhao                 2022-09-18  4818  		if (pte_dirty(pte[i]) && !folio_test_dirty(folio) &&
018ee47f14893d Yu Zhao                 2022-09-18  4819  		    !(folio_test_anon(folio) && folio_test_swapbacked(folio) &&
018ee47f14893d Yu Zhao                 2022-09-18  4820  		      !folio_test_swapcache(folio)))
018ee47f14893d Yu Zhao                 2022-09-18  4821  			folio_mark_dirty(folio);
018ee47f14893d Yu Zhao                 2022-09-18  4822  
b94907270ac7be Aneesh Kumar K.V        2023-06-13  4823  		look_around_gen_update(folio, new_gen);
018ee47f14893d Yu Zhao                 2022-09-18  4824  	}
018ee47f14893d Yu Zhao                 2022-09-18  4825  
018ee47f14893d Yu Zhao                 2022-09-18  4826  	arch_leave_lazy_mmu_mode();
abf086721a2f1e T.J. Alumbaugh          2023-01-18  4827  	mem_cgroup_unlock_pages();
018ee47f14893d Yu Zhao                 2022-09-18  4828  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
