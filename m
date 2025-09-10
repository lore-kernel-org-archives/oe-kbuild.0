Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32E722D9E9
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Sep 2025 22:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757544257; cv=none; b=ImaT1nqCK31cyncVJewyYeE7Z2nAG9eLNz7v9EislBG/mXi54j3D76pJHUBwCeCq2L7bksQtJN/yzbXt6HYDVql585rr8Uhq5OyUmwMrskvtV3TaNwgtxiNPCxjVeF5CltW6PT99J+T3YGDT9OqIQ0jHhtuWNrIW33LVf2deDWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757544257; c=relaxed/simple;
	bh=bITanxOPjy1x5OmeP3yMKId5XXc9IYWrJ3sKWgL3rFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uA85HRzQz54wZtoilayJ2aH9nyasLhJj2i9OhKIjWKx2v2bHuTvdMUMk0tdPHiOVNSkYyM6wQNq8H8ejrRAmW2T9knWmVxX2+RU/FNzO0fC3RmoD6huybKbpo4Kcv7EgykvW9cftSk225O55IJS3f4UQ0UCGF9Ef/tx1/Zvrve0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+WlQ8GJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+WlQ8GJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757544255; x=1789080255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bITanxOPjy1x5OmeP3yMKId5XXc9IYWrJ3sKWgL3rFo=;
  b=i+WlQ8GJZ2Sz3U92/MsfUBmTMWcKXRU9bPnq3d3R3ulGLAMagmUItH8O
   B1JA+UzUcHpihWhA6sxFRYNlii1wwgi5zzWlqXkZwg0Q0Un4HVlWWHhL+
   CkISfA2CVsyFZlZDWEpG5lwE6yMH8fLb5sfKnqqJg//KLe0IXv3m4CCyX
   KxOiXSKkGyt6puoozSQz7a/aVO2vY4kvCLLyyBcpWV4dR3L0M/eAES6+v
   SRhcRW4UVIZqdnFbq8lsosRSuztrNUuQmQ3G794fKAz7aBBia9mls9MwO
   gj2kawdTF7NojhOcE+F7HTWrRdsh1eDAV3cmBFhYMlkLZpXQ+vGw9QQ3i
   g==;
X-CSE-ConnectionGUID: OYq+OshCQ2CWpXq27wD8bQ==
X-CSE-MsgGUID: 8/TdTW7uQWuHSlz5tmgIVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77322430"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="77322430"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 15:44:15 -0700
X-CSE-ConnectionGUID: 4NFos9I1RgmVyfU7WvIJmg==
X-CSE-MsgGUID: AR9tsw0bQYK2c93ohI0fnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="177859415"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Sep 2025 15:44:13 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwTXu-0006L9-22;
	Wed, 10 Sep 2025 22:44:10 +0000
Date: Thu, 11 Sep 2025 06:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-new 367/411] mm/memcontrol.c:3725 mem_cgroup_alloc()
 warn: iterator 'i' not incremented
Message-ID: <202509110607.ZpZ2R8ug-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Julian Sun <sunjunchao@bytedance.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   3a0afa6640282ff559b6f4ff432cffc3ecc2bc77
commit: b87d0f2ecfaf93277592052967f7ee9042c799ab [367/411] memcg: don't wait writeback completion when release memcg
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r071-20250910 (https://download.01.org/0day-ci/archive/20250911/202509110607.ZpZ2R8ug-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509110607.ZpZ2R8ug-lkp@intel.com/

smatch warnings:
mm/memcontrol.c:3725 mem_cgroup_alloc() warn: iterator 'i' not incremented

vim +/i +3725 mm/memcontrol.c

b87d0f2ecfaf93 Julian Sun        2025-08-28  3718  
9cee7e8ef3e31c Yosry Ahmed       2024-01-24  3719  static struct mem_cgroup *mem_cgroup_alloc(struct mem_cgroup *parent)
8cdea7c0545426 Balbir Singh      2008-02-07  3720  {
8a4b42b955286c Shakeel Butt      2025-05-14  3721  	struct memcg_vmstats_percpu *statc;
8a4b42b955286c Shakeel Butt      2025-05-14  3722  	struct memcg_vmstats_percpu __percpu *pstatc_pcpu;
d142e3e66731a0 Glauber Costa     2013-02-22  3723  	struct mem_cgroup *memcg;
9cee7e8ef3e31c Yosry Ahmed       2024-01-24  3724  	int node, cpu;
b87d0f2ecfaf93 Julian Sun        2025-08-28 @3725  	int __maybe_unused i = 0;
07222371912c83 Shakeel Butt      2024-08-09  3726  	long error;
8cdea7c0545426 Balbir Singh      2008-02-07  3727  
97e4fc4b35dc1b Huan Yang         2025-04-25  3728  	memcg = kmem_cache_zalloc(memcg_cachep, GFP_KERNEL);
c0ff4b8540a5c1 Raghavendra K T   2011-11-02  3729  	if (!memcg)
07222371912c83 Shakeel Butt      2024-08-09  3730  		return ERR_PTR(-ENOMEM);
0b8f73e104285a Johannes Weiner   2016-01-20  3731  
07222371912c83 Shakeel Butt      2024-08-09  3732  	error = xa_alloc(&mem_cgroup_ids, &memcg->id.id, NULL,
07222371912c83 Shakeel Butt      2024-08-09  3733  			 XA_LIMIT(1, MEM_CGROUP_ID_MAX), GFP_KERNEL);
07222371912c83 Shakeel Butt      2024-08-09  3734  	if (error)
73f576c04b9410 Johannes Weiner   2016-07-20  3735  		goto fail;
07222371912c83 Shakeel Butt      2024-08-09  3736  	error = -ENOMEM;
73f576c04b9410 Johannes Weiner   2016-07-20  3737  
aab6103b97f1c7 Roman Gushchin    2024-05-01  3738  	memcg->vmstats = kzalloc(sizeof(struct memcg_vmstats),
aab6103b97f1c7 Roman Gushchin    2024-05-01  3739  				 GFP_KERNEL_ACCOUNT);
410f8e82689e1e Shakeel Butt      2022-09-07  3740  	if (!memcg->vmstats)
410f8e82689e1e Shakeel Butt      2022-09-07  3741  		goto fail;
410f8e82689e1e Shakeel Butt      2022-09-07  3742  
3e38e0aaca9eaf Roman Gushchin    2020-08-11  3743  	memcg->vmstats_percpu = alloc_percpu_gfp(struct memcg_vmstats_percpu,
3e38e0aaca9eaf Roman Gushchin    2020-08-11  3744  						 GFP_KERNEL_ACCOUNT);
871789d4af807d Chris Down        2019-05-14  3745  	if (!memcg->vmstats_percpu)
0b8f73e104285a Johannes Weiner   2016-01-20  3746  		goto fail;
8cdea7c0545426 Balbir Singh      2008-02-07  3747  
5d383b69a04e2e Shakeel Butt      2024-08-14  3748  	if (!memcg1_alloc_events(memcg))
5d383b69a04e2e Shakeel Butt      2024-08-14  3749  		goto fail;
5d383b69a04e2e Shakeel Butt      2024-08-14  3750  
9cee7e8ef3e31c Yosry Ahmed       2024-01-24  3751  	for_each_possible_cpu(cpu) {
9cee7e8ef3e31c Yosry Ahmed       2024-01-24  3752  		if (parent)
8a4b42b955286c Shakeel Butt      2025-05-14  3753  			pstatc_pcpu = parent->vmstats_percpu;
9cee7e8ef3e31c Yosry Ahmed       2024-01-24  3754  		statc = per_cpu_ptr(memcg->vmstats_percpu, cpu);
8a4b42b955286c Shakeel Butt      2025-05-14  3755  		statc->parent_pcpu = parent ? pstatc_pcpu : NULL;
9cee7e8ef3e31c Yosry Ahmed       2024-01-24  3756  		statc->vmstats = memcg->vmstats;
9cee7e8ef3e31c Yosry Ahmed       2024-01-24  3757  	}
9cee7e8ef3e31c Yosry Ahmed       2024-01-24  3758  
3ed28fa1080c73 Bob Liu           2012-01-12  3759  	for_each_node(node)
a8248bb72fed58 Xiu Jianfeng      2024-05-07  3760  		if (!alloc_mem_cgroup_per_node_info(memcg, node))
0b8f73e104285a Johannes Weiner   2016-01-20  3761  			goto fail;
f64c3f54940d69 Balbir Singh      2009-09-23  3762  
0b8f73e104285a Johannes Weiner   2016-01-20  3763  	if (memcg_wb_domain_init(memcg, GFP_KERNEL))
0b8f73e104285a Johannes Weiner   2016-01-20  3764  		goto fail;
d142e3e66731a0 Glauber Costa     2013-02-22  3765  
f7e1cb6ec51b04 Johannes Weiner   2016-01-14  3766  	INIT_WORK(&memcg->high_work, high_work_func);
70ddf637eebe47 Anton Vorontsov   2013-04-29  3767  	vmpressure_init(&memcg->vmpressure);
c6f53ed8f213a6 David Finkel      2024-07-29  3768  	INIT_LIST_HEAD(&memcg->memory_peaks);
c6f53ed8f213a6 David Finkel      2024-07-29  3769  	INIT_LIST_HEAD(&memcg->swap_peaks);
c6f53ed8f213a6 David Finkel      2024-07-29  3770  	spin_lock_init(&memcg->peaks_lock);
378bdb97405a00 Kuniyuki Iwashima 2025-07-17  3771  	memcg->socket_pressure = get_jiffies_64();
378bdb97405a00 Kuniyuki Iwashima 2025-07-17  3772  #if BITS_PER_LONG < 64
378bdb97405a00 Kuniyuki Iwashima 2025-07-17  3773  	seqlock_init(&memcg->socket_pressure_seqlock);
378bdb97405a00 Kuniyuki Iwashima 2025-07-17  3774  #endif
b5855a26dedf21 Roman Gushchin    2024-06-28  3775  	memcg1_memcg_init(memcg);
900a38f027b37b Vladimir Davydov  2014-12-12  3776  	memcg->kmemcg_id = -1;
bf4f059954dcb2 Roman Gushchin    2020-08-06  3777  	INIT_LIST_HEAD(&memcg->objcg_list);
52ebea749aaed1 Tejun Heo         2015-05-22  3778  #ifdef CONFIG_CGROUP_WRITEBACK
52ebea749aaed1 Tejun Heo         2015-05-22  3779  	INIT_LIST_HEAD(&memcg->cgwb_list);
b87d0f2ecfaf93 Julian Sun        2025-08-28  3780  	for (i = 0; i < MEMCG_CGWB_FRN_CNT; i++) {
b87d0f2ecfaf93 Julian Sun        2025-08-28  3781  		struct memcg_cgwb_frn *frn = &memcg->cgwb_frn[i];
b87d0f2ecfaf93 Julian Sun        2025-08-28  3782  
b87d0f2ecfaf93 Julian Sun        2025-08-28  3783  		frn->wait = kmalloc(sizeof(struct cgwb_frn_wait), GFP_KERNEL);
b87d0f2ecfaf93 Julian Sun        2025-08-28  3784  		if (!frn->wait)
b87d0f2ecfaf93 Julian Sun        2025-08-28  3785  			goto fail;
b87d0f2ecfaf93 Julian Sun        2025-08-28  3786  
b87d0f2ecfaf93 Julian Sun        2025-08-28  3787  		frn->wait->done =
97b27821b4854c Tejun Heo         2019-08-26  3788  			__WB_COMPLETION_INIT(&memcg_cgwb_frn_waitq);
b87d0f2ecfaf93 Julian Sun        2025-08-28  3789  		init_wait_func(&frn->wait->wq_entry, memcg_cgwb_waitq_callback_fn);
b87d0f2ecfaf93 Julian Sun        2025-08-28  3790  	}
87eaceb3faa59b Yang Shi          2019-09-23  3791  #endif
87eaceb3faa59b Yang Shi          2019-09-23  3792  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
87eaceb3faa59b Yang Shi          2019-09-23  3793  	spin_lock_init(&memcg->deferred_split_queue.split_queue_lock);
87eaceb3faa59b Yang Shi          2019-09-23  3794  	INIT_LIST_HEAD(&memcg->deferred_split_queue.split_queue);
87eaceb3faa59b Yang Shi          2019-09-23  3795  	memcg->deferred_split_queue.split_queue_len = 0;
52ebea749aaed1 Tejun Heo         2015-05-22  3796  #endif
ec1c86b25f4bdd Yu Zhao           2022-09-18  3797  	lru_gen_init_memcg(memcg);
0b8f73e104285a Johannes Weiner   2016-01-20  3798  	return memcg;
0b8f73e104285a Johannes Weiner   2016-01-20  3799  fail:
b87d0f2ecfaf93 Julian Sun        2025-08-28  3800  #ifdef CONFIG_CGROUP_WRITEBACK
b87d0f2ecfaf93 Julian Sun        2025-08-28  3801  	while (i--)
b87d0f2ecfaf93 Julian Sun        2025-08-28  3802  		kfree(memcg->cgwb_frn[i].wait);
b87d0f2ecfaf93 Julian Sun        2025-08-28  3803  #endif
7e97de0b033bca Kirill Tkhai      2018-08-02  3804  	mem_cgroup_id_remove(memcg);
40e952f9d68792 Tahsin Erdogan    2017-03-09  3805  	__mem_cgroup_free(memcg);
11d6761218d19c Yafang Shao       2020-05-07  3806  	return ERR_PTR(error);
d142e3e66731a0 Glauber Costa     2013-02-22  3807  }
d142e3e66731a0 Glauber Costa     2013-02-22  3808  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
