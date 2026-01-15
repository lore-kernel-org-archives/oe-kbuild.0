Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C5122A4EB
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 10:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472641; cv=none; b=BFnKw4o0q4MzwfF0XApkGLJwFZn2mCKfdk/jzOSSWviezNW0U2SFepPpLuFp7dEtLeL7OzN/wygyJKQJvrmi6NmNFh3z/gb325d3tTO4Yg4zwwx4Eq9kRo2MJT/Ja/G865C+V0ld6NcWrMuZ2+WlcttrEZESTh3beL1lb4u6zX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472641; c=relaxed/simple;
	bh=8G5r9TQAMFyCvWQzw0chL1VjTls4ntaO7GCWnRtV4Ok=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KqXAnrn0B1RhGLfM83jUeEfvT3bIEKVP1fICro39Gac7iFg0DyzkT1ngwYgfWstUJxM8GbsRhMEj2ZJnUPmTRTbrZ6yPbtEsNk48iKHRrqj2RLs73Fxzqb1n/NyJPbA5vgSFCitd/hp7mMZ5apnoRWTMmWvXw/RaC2Aikm/9UYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ig3pyCzU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ig3pyCzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768472640; x=1800008640;
  h=date:from:to:cc:subject:message-id;
  bh=8G5r9TQAMFyCvWQzw0chL1VjTls4ntaO7GCWnRtV4Ok=;
  b=Ig3pyCzUDVF0j52VAS+aEDrC+D8VM+kw06zSKBbYA5hRrrEQWiDRXA+U
   ficoqdnvvg95QyipHUzRl4IPJWKSk37KBs810Z+JXY2DWpLFBBbqE4RWG
   g0HIeQzZmZqLMIhJzTBQod4VAWrSNTIvqoiHNVfzUObt/DZKSZPpC6Ym9
   qeXdd/bFBSoyH+oC892q5WjVs1+0H2mTnm8OhlLrdvqPmnmqlDB7iFdaT
   hWw4gL1ypAz/poDHz6/ru5pqWkjMltVDsPFvTMr90VK+y4I43u9pQN1wA
   b8UJRKBl40bhvsJ1pGXvPMkswKmtWQOMsRPmbY7FYtvu1em61iiAriV5a
   g==;
X-CSE-ConnectionGUID: sRPuznt6QcmMU+ykXS2wag==
X-CSE-MsgGUID: zAc8u9vWT+ayEXnsxlu5Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="68787892"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="68787892"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:23:59 -0800
X-CSE-ConnectionGUID: dMz9cv9GRwOWKSHhur45gw==
X-CSE-MsgGUID: Qbu4pdMvRSuBv6vAjuwbVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209393811"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jan 2026 02:23:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgKWB-00000000HqI-0yBL;
	Thu, 15 Jan 2026 10:23:55 +0000
Date: Thu, 15 Jan 2026 18:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-new 331/335] mm/memcontrol-v1.c:685
 memcg1_swapout() warn: inconsistent returns 'rcu_read'.
Message-ID: <202601151810.ie4EgP4S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
TO: Muchun Song <songmuchun@bytedance.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Qi Zheng <zhengqi.arch@bytedance.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   78d5565acc4516dfe1fe5a3779a53bc7aaedc2e1
commit: 8e5f42f2bf326f0efb1e565fa57b5ef99b40e646 [331/335] mm: memcontrol: eliminate the problem of dying memory cgroup for LRU folios
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: parisc-randconfig-r072-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151810.ie4EgP4S-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601151810.ie4EgP4S-lkp@intel.com/

smatch warnings:
mm/memcontrol-v1.c:685 memcg1_swapout() warn: inconsistent returns 'rcu_read'.

vim +/rcu_read +685 mm/memcontrol-v1.c

f7d49ba03ae755 Shakeel Butt       2024-08-14  605  
89ce924f0bd447 Johannes Weiner    2025-01-24  606  /**
89ce924f0bd447 Johannes Weiner    2025-01-24  607   * memcg1_swapout - transfer a memsw charge to swap
89ce924f0bd447 Johannes Weiner    2025-01-24  608   * @folio: folio whose memsw charge to transfer
89ce924f0bd447 Johannes Weiner    2025-01-24  609   * @entry: swap entry to move the charge to
89ce924f0bd447 Johannes Weiner    2025-01-24  610   *
89ce924f0bd447 Johannes Weiner    2025-01-24  611   * Transfer the memsw charge of @folio to @entry.
89ce924f0bd447 Johannes Weiner    2025-01-24  612   */
89ce924f0bd447 Johannes Weiner    2025-01-24  613  void memcg1_swapout(struct folio *folio, swp_entry_t entry)
f7d49ba03ae755 Shakeel Butt       2024-08-14  614  {
89ce924f0bd447 Johannes Weiner    2025-01-24  615  	struct mem_cgroup *memcg, *swap_memcg;
8e5f42f2bf326f Muchun Song        2026-01-14  616  	struct obj_cgroup *objcg;
89ce924f0bd447 Johannes Weiner    2025-01-24  617  	unsigned int nr_entries;
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  618  	unsigned short oldid;
89ce924f0bd447 Johannes Weiner    2025-01-24  619  
89ce924f0bd447 Johannes Weiner    2025-01-24  620  	VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);
89ce924f0bd447 Johannes Weiner    2025-01-24  621  	VM_BUG_ON_FOLIO(folio_ref_count(folio), folio);
89ce924f0bd447 Johannes Weiner    2025-01-24  622  
89ce924f0bd447 Johannes Weiner    2025-01-24  623  	if (mem_cgroup_disabled())
89ce924f0bd447 Johannes Weiner    2025-01-24  624  		return;
89ce924f0bd447 Johannes Weiner    2025-01-24  625  
89ce924f0bd447 Johannes Weiner    2025-01-24  626  	if (!do_memsw_account())
89ce924f0bd447 Johannes Weiner    2025-01-24  627  		return;
89ce924f0bd447 Johannes Weiner    2025-01-24  628  
8e5f42f2bf326f Muchun Song        2026-01-14  629  	objcg = folio_objcg(folio);
8e5f42f2bf326f Muchun Song        2026-01-14  630  	VM_WARN_ON_ONCE_FOLIO(!objcg, folio);
8e5f42f2bf326f Muchun Song        2026-01-14  631  	if (!objcg)
89ce924f0bd447 Johannes Weiner    2025-01-24  632  		return;
89ce924f0bd447 Johannes Weiner    2025-01-24  633  
8e5f42f2bf326f Muchun Song        2026-01-14  634  	rcu_read_lock();
8e5f42f2bf326f Muchun Song        2026-01-14  635  	memcg = obj_cgroup_memcg(objcg);
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  636  	/*
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  637  	 * Check if this swap entry is already recorded. This can happen
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  638  	 * when MADV_PAGEOUT is called multiple times on pages that remain
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  639  	 * in swapcache, reusing the same swap entries.
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  640  	 */
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  641  	oldid = lookup_swap_cgroup_id(entry);
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  642  	if (oldid == mem_cgroup_id(memcg))
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  643  		return;
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  644  	VM_WARN_ON_ONCE(oldid != 0);
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  645  
89ce924f0bd447 Johannes Weiner    2025-01-24  646  	/*
89ce924f0bd447 Johannes Weiner    2025-01-24  647  	 * In case the memcg owning these pages has been offlined and doesn't
89ce924f0bd447 Johannes Weiner    2025-01-24  648  	 * have an ID allocated to it anymore, charge the closest online
89ce924f0bd447 Johannes Weiner    2025-01-24  649  	 * ancestor for the swap instead and transfer the memory+swap charge.
89ce924f0bd447 Johannes Weiner    2025-01-24  650  	 */
1d7634095c770c Shakeel Butt       2025-12-25  651  	swap_memcg = mem_cgroup_private_id_get_online(memcg);
89ce924f0bd447 Johannes Weiner    2025-01-24  652  	nr_entries = folio_nr_pages(folio);
89ce924f0bd447 Johannes Weiner    2025-01-24  653  	/* Get references for the tail pages, too */
89ce924f0bd447 Johannes Weiner    2025-01-24  654  	if (nr_entries > 1)
1d7634095c770c Shakeel Butt       2025-12-25  655  		mem_cgroup_private_id_get_many(swap_memcg, nr_entries - 1);
89ce924f0bd447 Johannes Weiner    2025-01-24  656  	mod_memcg_state(swap_memcg, MEMCG_SWAP, nr_entries);
89ce924f0bd447 Johannes Weiner    2025-01-24  657  
1d7634095c770c Shakeel Butt       2025-12-25  658  	swap_cgroup_record(folio, mem_cgroup_private_id(swap_memcg), entry);
89ce924f0bd447 Johannes Weiner    2025-01-24  659  
89ce924f0bd447 Johannes Weiner    2025-01-24  660  	folio_unqueue_deferred_split(folio);
89ce924f0bd447 Johannes Weiner    2025-01-24  661  	folio->memcg_data = 0;
89ce924f0bd447 Johannes Weiner    2025-01-24  662  
8e5f42f2bf326f Muchun Song        2026-01-14  663  	if (!obj_cgroup_is_root(objcg))
89ce924f0bd447 Johannes Weiner    2025-01-24  664  		page_counter_uncharge(&memcg->memory, nr_entries);
89ce924f0bd447 Johannes Weiner    2025-01-24  665  
89ce924f0bd447 Johannes Weiner    2025-01-24  666  	if (memcg != swap_memcg) {
89ce924f0bd447 Johannes Weiner    2025-01-24  667  		if (!mem_cgroup_is_root(swap_memcg))
89ce924f0bd447 Johannes Weiner    2025-01-24  668  			page_counter_charge(&swap_memcg->memsw, nr_entries);
89ce924f0bd447 Johannes Weiner    2025-01-24  669  		page_counter_uncharge(&memcg->memsw, nr_entries);
89ce924f0bd447 Johannes Weiner    2025-01-24  670  	}
89ce924f0bd447 Johannes Weiner    2025-01-24  671  
f7d49ba03ae755 Shakeel Butt       2024-08-14  672  	/*
f7d49ba03ae755 Shakeel Butt       2024-08-14  673  	 * Interrupts should be disabled here because the caller holds the
f7d49ba03ae755 Shakeel Butt       2024-08-14  674  	 * i_pages lock which is taken with interrupts-off. It is
f7d49ba03ae755 Shakeel Butt       2024-08-14  675  	 * important here to have the interrupts disabled because it is the
f7d49ba03ae755 Shakeel Butt       2024-08-14  676  	 * only synchronisation we have for updating the per-CPU variables.
f7d49ba03ae755 Shakeel Butt       2024-08-14  677  	 */
f7d49ba03ae755 Shakeel Butt       2024-08-14  678  	preempt_disable_nested();
f7d49ba03ae755 Shakeel Butt       2024-08-14  679  	VM_WARN_ON_IRQS_ENABLED();
f7d49ba03ae755 Shakeel Butt       2024-08-14  680  	memcg1_charge_statistics(memcg, -folio_nr_pages(folio));
f7d49ba03ae755 Shakeel Butt       2024-08-14  681  	preempt_enable_nested();
f7d49ba03ae755 Shakeel Butt       2024-08-14  682  	memcg1_check_events(memcg, folio_nid(folio));
89ce924f0bd447 Johannes Weiner    2025-01-24  683  
8e5f42f2bf326f Muchun Song        2026-01-14  684  	rcu_read_unlock();
8e5f42f2bf326f Muchun Song        2026-01-14 @685  	obj_cgroup_put(objcg);
89ce924f0bd447 Johannes Weiner    2025-01-24  686  }
89ce924f0bd447 Johannes Weiner    2025-01-24  687  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
