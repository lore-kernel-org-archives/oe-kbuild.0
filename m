Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD6316401
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jul 2023 20:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689885649; x=1721421649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FYSnLYuO/J3VWdPgxCH3ZTtpJO0v7/A45Sjegb3s770=;
  b=hfjguqCqtnmWYSe2nEcxITmkmUyses9tatYHWyMkDxZOaXuwlX8fXoPY
   CiTjlLQKgDoLvutS3Z++QEZaqlEVzpeAVYVw+ugGvmvmfqC9a7HckVZ7r
   TFC55W/Yx8ATxWAFWC1XDfk7GVSyj3iR9yXxx1/g8q64Kt9w+WLHR7/DG
   bpfO+npQjpWOHr7ub/lgWpXD9YfhPfXPcrM4P4BsM5lecIb346BqP+Jir
   xMzyjAFGw9EdWL/h7FP52WdXriY4lHMMR1EqaN8X7vyh9fLYBlh3Z2iWB
   h6ZNAszthbc7j4j3zMYbZ/4SvEjVOvC9TlNmal6E8tpp6cTv5e4LHwO0Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433080955"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="433080955"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 13:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="727842044"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="727842044"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jul 2023 13:40:48 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMaS2-0006UT-1A;
	Thu, 20 Jul 2023 20:40:42 +0000
Date: Fri, 21 Jul 2023 04:40:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 3/8] memcg: recharge mapped folios when a memcg is
 offlined
Message-ID: <202307210457.KkeM3K9v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230720070825.992023-4-yosryahmed@google.com>
References: <20230720070825.992023-4-yosryahmed@google.com>
TO: Yosry Ahmed <yosryahmed@google.com>

Hi Yosry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on mcgrof/sysctl-next]
[also build test ERROR on linus/master v6.5-rc2 next-20230720]
[cannot apply to akpm-mm/mm-everything tj-cgroup/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/memcg-refactor-updating-memcg-moving_account/20230720-151020
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git sysctl-next
patch link:    https://lore.kernel.org/r/20230720070825.992023-4-yosryahmed%40google.com
patch subject: [RFC PATCH 3/8] memcg: recharge mapped folios when a memcg is offlined
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230721/202307210457.KkeM3K9v-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210457.KkeM3K9v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307210457.KkeM3K9v-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/memcontrol.c: In function 'mem_cgroup_recharge_folio':
>> mm/memcontrol.c:6393:15: error: implicit declaration of function 'mem_cgroup_move_account'; did you mean 'mem_cgroup_move_swap_account'? [-Werror=implicit-function-declaration]
    6393 |         err = mem_cgroup_move_account(&folio->page, folio_test_large(folio),
         |               ^~~~~~~~~~~~~~~~~~~~~~~
         |               mem_cgroup_move_swap_account
   mm/memcontrol.c: In function 'folio_memcg_rmap_recharge_one':
>> mm/memcontrol.c:6408:9: error: implicit declaration of function 'DEFINE_FOLIO_VMA_WALK' [-Werror=implicit-function-declaration]
    6408 |         DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
         |         ^~~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol.c:6408:31: error: 'pvmw' undeclared (first use in this function)
    6408 |         DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
         |                               ^~~~
   mm/memcontrol.c:6408:31: note: each undeclared identifier is reported only once for each function it appears in
>> mm/memcontrol.c:6417:16: error: implicit declaration of function 'page_vma_mapped_walk' [-Werror=implicit-function-declaration]
    6417 |         while (page_vma_mapped_walk(&pvmw)) {
         |                ^~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol.c:6422:17: error: implicit declaration of function 'page_vma_mapped_walk_done' [-Werror=implicit-function-declaration]
    6422 |                 page_vma_mapped_walk_done(&pvmw);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c: In function 'folio_memcg_rmap_recharge':
>> mm/memcontrol.c:6434:16: error: variable 'rwc' has initializer but incomplete type
    6434 |         struct rmap_walk_control rwc = {
         |                ^~~~~~~~~~~~~~~~~
>> mm/memcontrol.c:6435:18: error: 'struct rmap_walk_control' has no member named 'rmap_one'
    6435 |                 .rmap_one = folio_memcg_rmap_recharge_one,
         |                  ^~~~~~~~
>> mm/memcontrol.c:6435:29: warning: excess elements in struct initializer
    6435 |                 .rmap_one = folio_memcg_rmap_recharge_one,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6435:29: note: (near initialization for 'rwc')
>> mm/memcontrol.c:6436:18: error: 'struct rmap_walk_control' has no member named 'arg'
    6436 |                 .arg = (void *)&arg,
         |                  ^~~
   mm/memcontrol.c:6436:24: warning: excess elements in struct initializer
    6436 |                 .arg = (void *)&arg,
         |                        ^
   mm/memcontrol.c:6436:24: note: (near initialization for 'rwc')
>> mm/memcontrol.c:6437:18: error: 'struct rmap_walk_control' has no member named 'anon_lock'
    6437 |                 .anon_lock = folio_lock_anon_vma_read,
         |                  ^~~~~~~~~
>> mm/memcontrol.c:6437:30: error: 'folio_lock_anon_vma_read' undeclared (first use in this function)
    6437 |                 .anon_lock = folio_lock_anon_vma_read,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6437:30: warning: excess elements in struct initializer
   mm/memcontrol.c:6437:30: note: (near initialization for 'rwc')
>> mm/memcontrol.c:6438:18: error: 'struct rmap_walk_control' has no member named 'try_lock'
    6438 |                 .try_lock = true,
         |                  ^~~~~~~~
   mm/memcontrol.c:6438:29: warning: excess elements in struct initializer
    6438 |                 .try_lock = true,
         |                             ^~~~
   mm/memcontrol.c:6438:29: note: (near initialization for 'rwc')
>> mm/memcontrol.c:6434:34: error: storage size of 'rwc' isn't known
    6434 |         struct rmap_walk_control rwc = {
         |                                  ^~~
>> mm/memcontrol.c:6441:9: error: implicit declaration of function 'rmap_walk'; did you mean 'mas_walk'? [-Werror=implicit-function-declaration]
    6441 |         rmap_walk(folio, &rwc);
         |         ^~~~~~~~~
         |         mas_walk
   mm/memcontrol.c:6434:34: warning: unused variable 'rwc' [-Wunused-variable]
    6434 |         struct rmap_walk_control rwc = {
         |                                  ^~~
   mm/memcontrol.c: In function 'memcg_recharge_lruvec_list':
>> mm/memcontrol.c:6520:9: error: implicit declaration of function 'mem_cgroup_start_move_charge' [-Werror=implicit-function-declaration]
    6520 |         mem_cgroup_start_move_charge(memcg);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol.c:6537:9: error: implicit declaration of function 'mem_cgroup_end_move_charge'; did you mean 'mem_cgroup_uncharge'? [-Werror=implicit-function-declaration]
    6537 |         mem_cgroup_end_move_charge(memcg);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mem_cgroup_uncharge
   cc1: some warnings being treated as errors


vim +6393 mm/memcontrol.c

67e465a77ba658 Balbir Singh 2008-02-07  6376  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6377  /* Returns true if recharging is successful */
be4b67dc30d90f Yosry Ahmed  2023-07-20  6378  static bool mem_cgroup_recharge_folio(struct folio *folio,
be4b67dc30d90f Yosry Ahmed  2023-07-20  6379  				      struct mem_cgroup *new_memcg)
be4b67dc30d90f Yosry Ahmed  2023-07-20  6380  {
be4b67dc30d90f Yosry Ahmed  2023-07-20  6381  	struct mem_cgroup *old_memcg = folio_memcg(folio);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6382  	gfp_t gfp = GFP_KERNEL | __GFP_RETRY_MAYFAIL;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6383  	long nr_pages = folio_nr_pages(folio);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6384  	int err = -1;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6385  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6386  	if (!new_memcg)
be4b67dc30d90f Yosry Ahmed  2023-07-20  6387  		goto out;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6388  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6389  	err = try_charge(new_memcg, gfp, nr_pages);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6390  	if (err)
be4b67dc30d90f Yosry Ahmed  2023-07-20  6391  		goto out;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6392  
be4b67dc30d90f Yosry Ahmed  2023-07-20 @6393  	err = mem_cgroup_move_account(&folio->page, folio_test_large(folio),
be4b67dc30d90f Yosry Ahmed  2023-07-20  6394  				      old_memcg, new_memcg);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6395  	cancel_charge(err ? new_memcg : old_memcg, nr_pages);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6396  out:
be4b67dc30d90f Yosry Ahmed  2023-07-20  6397  	return err == 0;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6398  }
be4b67dc30d90f Yosry Ahmed  2023-07-20  6399  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6400  struct folio_memcg_rmap_recharge_arg {
be4b67dc30d90f Yosry Ahmed  2023-07-20  6401  	bool recharged;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6402  };
be4b67dc30d90f Yosry Ahmed  2023-07-20  6403  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6404  static bool folio_memcg_rmap_recharge_one(struct folio *folio,
be4b67dc30d90f Yosry Ahmed  2023-07-20  6405  		struct vm_area_struct *vma, unsigned long address, void *arg)
be4b67dc30d90f Yosry Ahmed  2023-07-20  6406  {
be4b67dc30d90f Yosry Ahmed  2023-07-20  6407  	struct folio_memcg_rmap_recharge_arg *recharge_arg = arg;
be4b67dc30d90f Yosry Ahmed  2023-07-20 @6408  	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6409  	struct mem_cgroup *memcg;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6410  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6411  	/*
be4b67dc30d90f Yosry Ahmed  2023-07-20  6412  	 * page_vma_mapped_walk() is only needed to grab any pte lock to
be4b67dc30d90f Yosry Ahmed  2023-07-20  6413  	 * serialize with page_remove_rmap(), as folio_mapped() must remain
be4b67dc30d90f Yosry Ahmed  2023-07-20  6414  	 * stable during the move.
be4b67dc30d90f Yosry Ahmed  2023-07-20  6415  	 */
be4b67dc30d90f Yosry Ahmed  2023-07-20  6416  	recharge_arg->recharged = false;
be4b67dc30d90f Yosry Ahmed  2023-07-20 @6417  	while (page_vma_mapped_walk(&pvmw)) {
be4b67dc30d90f Yosry Ahmed  2023-07-20  6418  		memcg = get_mem_cgroup_from_mm(vma->vm_mm);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6419  		if (mem_cgroup_recharge_folio(folio, memcg))
be4b67dc30d90f Yosry Ahmed  2023-07-20  6420  			recharge_arg->recharged = true;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6421  		mem_cgroup_put(memcg);
be4b67dc30d90f Yosry Ahmed  2023-07-20 @6422  		page_vma_mapped_walk_done(&pvmw);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6423  		break;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6424  	}
be4b67dc30d90f Yosry Ahmed  2023-07-20  6425  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6426  	/* stop the rmap walk if we were successful */
be4b67dc30d90f Yosry Ahmed  2023-07-20  6427  	return !recharge_arg->recharged;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6428  }
be4b67dc30d90f Yosry Ahmed  2023-07-20  6429  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6430  /* Returns true if recharging is successful */
be4b67dc30d90f Yosry Ahmed  2023-07-20  6431  static bool folio_memcg_rmap_recharge(struct folio *folio)
be4b67dc30d90f Yosry Ahmed  2023-07-20  6432  {
be4b67dc30d90f Yosry Ahmed  2023-07-20  6433  	struct folio_memcg_rmap_recharge_arg arg = { .recharged = false };
be4b67dc30d90f Yosry Ahmed  2023-07-20 @6434  	struct rmap_walk_control rwc = {
be4b67dc30d90f Yosry Ahmed  2023-07-20 @6435  		.rmap_one = folio_memcg_rmap_recharge_one,
be4b67dc30d90f Yosry Ahmed  2023-07-20 @6436  		.arg = (void *)&arg,
be4b67dc30d90f Yosry Ahmed  2023-07-20 @6437  		.anon_lock = folio_lock_anon_vma_read,
be4b67dc30d90f Yosry Ahmed  2023-07-20 @6438  		.try_lock = true,
be4b67dc30d90f Yosry Ahmed  2023-07-20  6439  	};
be4b67dc30d90f Yosry Ahmed  2023-07-20  6440  
be4b67dc30d90f Yosry Ahmed  2023-07-20 @6441  	rmap_walk(folio, &rwc);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6442  	return arg.recharged;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6443  }
be4b67dc30d90f Yosry Ahmed  2023-07-20  6444  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6445  static unsigned long lruvec_nr_local_mapped_pages(struct lruvec *lruvec)
be4b67dc30d90f Yosry Ahmed  2023-07-20  6446  {
be4b67dc30d90f Yosry Ahmed  2023-07-20  6447  	return lruvec_page_state_local(lruvec, NR_ANON_MAPPED) +
be4b67dc30d90f Yosry Ahmed  2023-07-20  6448  		lruvec_page_state_local(lruvec, NR_FILE_MAPPED);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6449  }
be4b67dc30d90f Yosry Ahmed  2023-07-20  6450  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6451  static unsigned long memcg_nr_local_mapped_pages(struct mem_cgroup *memcg)
be4b67dc30d90f Yosry Ahmed  2023-07-20  6452  {
be4b67dc30d90f Yosry Ahmed  2023-07-20  6453  	return memcg_page_state_local(memcg, NR_ANON_MAPPED) +
be4b67dc30d90f Yosry Ahmed  2023-07-20  6454  		memcg_page_state_local(memcg, NR_FILE_MAPPED);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6455  }
be4b67dc30d90f Yosry Ahmed  2023-07-20  6456  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6457  static bool memcg_recharge_lruvec_list(struct lruvec *lruvec,
be4b67dc30d90f Yosry Ahmed  2023-07-20  6458  				       struct list_head *list,
be4b67dc30d90f Yosry Ahmed  2023-07-20  6459  				       enum lru_list lru,
be4b67dc30d90f Yosry Ahmed  2023-07-20  6460  				       void *arg)
be4b67dc30d90f Yosry Ahmed  2023-07-20  6461  {
be4b67dc30d90f Yosry Ahmed  2023-07-20  6462  	int isolated_idx = NR_ISOLATED_ANON + is_file_lru(lru);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6463  	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6464  	unsigned long *nr_recharged = arg;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6465  	unsigned long nr_staged = 0;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6466  	LIST_HEAD(folios_skipped);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6467  	LIST_HEAD(folios_staged);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6468  	struct folio *folio;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6469  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6470  	/* Are we done with mapped pages on this node? */
be4b67dc30d90f Yosry Ahmed  2023-07-20  6471  	if (!lruvec_nr_local_mapped_pages(lruvec))
be4b67dc30d90f Yosry Ahmed  2023-07-20  6472  		return true;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6473  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6474  	/*
be4b67dc30d90f Yosry Ahmed  2023-07-20  6475  	 * Iterating the LRUs here is tricky, because we
be4b67dc30d90f Yosry Ahmed  2023-07-20  6476  	 * usually cannot iterate the entire list with the
be4b67dc30d90f Yosry Ahmed  2023-07-20  6477  	 * lock held, and the LRU can change once we release it.
be4b67dc30d90f Yosry Ahmed  2023-07-20  6478  	 *
be4b67dc30d90f Yosry Ahmed  2023-07-20  6479  	 * What we try to do is isolate as many folios as we can
be4b67dc30d90f Yosry Ahmed  2023-07-20  6480  	 * without hogging the lock or the cpu. We need to move
be4b67dc30d90f Yosry Ahmed  2023-07-20  6481  	 * all the folios we iterate off the list to try to
be4b67dc30d90f Yosry Ahmed  2023-07-20  6482  	 * avoid re-visiting them on retries.
be4b67dc30d90f Yosry Ahmed  2023-07-20  6483  	 *
be4b67dc30d90f Yosry Ahmed  2023-07-20  6484  	 * The folios we are interested in are moved to
be4b67dc30d90f Yosry Ahmed  2023-07-20  6485  	 * @folios_staged, and other folios are moved to
be4b67dc30d90f Yosry Ahmed  2023-07-20  6486  	 * @folios_skipped. Before releasing the lock, we splice
be4b67dc30d90f Yosry Ahmed  2023-07-20  6487  	 * @folios_skipped back into the beginning of the LRU.
be4b67dc30d90f Yosry Ahmed  2023-07-20  6488  	 * This essentially rotates the LRU, similar to reclaim,
be4b67dc30d90f Yosry Ahmed  2023-07-20  6489  	 * as lru_to_folio() fetches folios from the end of the
be4b67dc30d90f Yosry Ahmed  2023-07-20  6490  	 * LRU.
be4b67dc30d90f Yosry Ahmed  2023-07-20  6491  	 */
be4b67dc30d90f Yosry Ahmed  2023-07-20  6492  	spin_lock_irq(&lruvec->lru_lock);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6493  	while (!list_empty(list) && !need_resched() &&
be4b67dc30d90f Yosry Ahmed  2023-07-20  6494  	       !spin_is_contended(&lruvec->lru_lock)) {
be4b67dc30d90f Yosry Ahmed  2023-07-20  6495  		folio = lru_to_folio(list);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6496  		if (!folio_mapped(folio)) {
be4b67dc30d90f Yosry Ahmed  2023-07-20  6497  			list_move(&folio->lru, &folios_skipped);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6498  			continue;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6499  		}
be4b67dc30d90f Yosry Ahmed  2023-07-20  6500  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6501  		if (unlikely(!folio_try_get(folio))) {
be4b67dc30d90f Yosry Ahmed  2023-07-20  6502  			list_move(&folio->lru, &folios_skipped);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6503  			continue;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6504  		}
be4b67dc30d90f Yosry Ahmed  2023-07-20  6505  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6506  		if (!folio_test_clear_lru(folio)) {
be4b67dc30d90f Yosry Ahmed  2023-07-20  6507  			list_move(&folio->lru, &folios_skipped);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6508  			folio_put(folio);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6509  			continue;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6510  		}
be4b67dc30d90f Yosry Ahmed  2023-07-20  6511  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6512  		lruvec_del_folio(lruvec, folio);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6513  		list_add(&folio->lru, &folios_staged);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6514  		nr_staged += folio_nr_pages(folio);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6515  	}
be4b67dc30d90f Yosry Ahmed  2023-07-20  6516  	list_splice(&folios_skipped, list);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6517  	spin_unlock_irq(&lruvec->lru_lock);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6518  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6519  	mod_lruvec_state(lruvec, isolated_idx, nr_staged);
be4b67dc30d90f Yosry Ahmed  2023-07-20 @6520  	mem_cgroup_start_move_charge(memcg);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6521  	while (!list_empty(&folios_staged)) {
be4b67dc30d90f Yosry Ahmed  2023-07-20  6522  		folio = lru_to_folio(&folios_staged);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6523  		list_del(&folio->lru);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6524  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6525  		if (!folio_trylock(folio)) {
be4b67dc30d90f Yosry Ahmed  2023-07-20  6526  			folio_putback_lru(folio);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6527  			continue;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6528  		}
be4b67dc30d90f Yosry Ahmed  2023-07-20  6529  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6530  		if (folio_memcg_rmap_recharge(folio))
be4b67dc30d90f Yosry Ahmed  2023-07-20  6531  			*nr_recharged += folio_nr_pages(folio);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6532  
be4b67dc30d90f Yosry Ahmed  2023-07-20  6533  		folio_unlock(folio);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6534  		folio_putback_lru(folio);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6535  		cond_resched();
be4b67dc30d90f Yosry Ahmed  2023-07-20  6536  	}
be4b67dc30d90f Yosry Ahmed  2023-07-20 @6537  	mem_cgroup_end_move_charge(memcg);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6538  	mod_lruvec_state(lruvec, isolated_idx, -nr_staged);
be4b67dc30d90f Yosry Ahmed  2023-07-20  6539  	return false;
be4b67dc30d90f Yosry Ahmed  2023-07-20  6540  }
be4b67dc30d90f Yosry Ahmed  2023-07-20  6541  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
