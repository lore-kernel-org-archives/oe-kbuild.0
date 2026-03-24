Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615283A4538
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 08:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774340624; cv=none; b=qRbCQLyFqrYrqqqe51R5sRy2DQaCfQA33PeVo8zsZ7Vonuq73BhVk15QANOxdpJl7wiIF7y99w3qZCWTpcUBos3qxMr8wHb4nQl+H9fpwRmGrpjd59VN43752dnGa5NBHc9qrlgcjrbolb98rXHE9pAfpl5gytDtPITMFxi0daI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774340624; c=relaxed/simple;
	bh=lCGiSCJ4U21urFE6IpvSAoV3bk1z6x4XWxF1J7fQKtw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PEC42GVL+S5HqQCxzSvZv6pALaUnEhVy7y8jzeEHIaIHsJjaCHF/tqa3YXFjgN8uCiEjNAfnuQAM6kjmij//9YxPndjtJ4sEFL+Rm1pqTl1TeM3oRZNxCFd9Ltw0+k4qLLTCI8KnB1WmdrwFB1YozDAQxWnf7bQuYmwgRlTXH2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSMXHtwC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSMXHtwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774340618; x=1805876618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lCGiSCJ4U21urFE6IpvSAoV3bk1z6x4XWxF1J7fQKtw=;
  b=VSMXHtwCxbjRNHL+Hi2alFiUNk0c3XKosRXmZm7lTVehNPSt+xjG7ReR
   bBW7K9VhksiuzDLro1T3g6FS2NtObZwJuNkXx2nYu7XnK8VKZDe+VIGjl
   sdQ2IghmND+IbawkQJVeYsXFZNVwG3zDCHFljDW5cMv9oTQynRLvyG2ug
   XP2VsfeOpAUhqDN9ZBpK43RERbnQnpa2ndOwBleGuh72Bfnoi3d2jHBVT
   Sk7R7On02DSFIe2oF0C52lS9FrjgVMXlIkR1BgxmBzApiIEaPpMBWQbJQ
   b6EEf1ycWKg9vQTozOcbF0/A1efQmnI5TmZW/YxyIeIlYId8kpTb6VUWE
   A==;
X-CSE-ConnectionGUID: RbwfYXhFT+ebGzxbHo3rhQ==
X-CSE-MsgGUID: yrW5L8JTRmSc8GJuQwOEfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75321926"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75321926"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 01:23:37 -0700
X-CSE-ConnectionGUID: LwINrsJuRDGkdKqzoh0zGw==
X-CSE-MsgGUID: uKIK/HBIT8umSH2uLJbAog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="223500808"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Mar 2026 01:23:35 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4x2y-000000004DV-379I;
	Tue, 24 Mar 2026 08:23:32 +0000
Date: Tue, 24 Mar 2026 16:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] mm/memcontrol: fix obj_cgroup leak in
 mem_cgroup_css_online() error path
Message-ID: <202603241635.qNXDPwjs-lkp@intel.com>
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
In-Reply-To: <20260322164943.37460-1-devnexen@gmail.com>
References: <20260322164943.37460-1-devnexen@gmail.com>
TO: David Carlier <devnexen@gmail.com>
TO: Johannes Weiner <hannes@cmpxchg.org>
TO: Michal Hocko <mhocko@kernel.org>
TO: Roman Gushchin <roman.gushchin@linux.dev>
TO: Shakeel Butt <shakeel.butt@linux.dev>
TO: Muchun Song <muchun.song@linux.dev>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Qi Zheng <zhengqi.arch@bytedance.com>
CC: David Carlier <devnexen@gmail.com>
CC: stable@vger.kernel.org

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Carlier/mm-memcontrol-fix-obj_cgroup-leak-in-mem_cgroup_css_online-error-path/20260324-010357
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260322164943.37460-1-devnexen%40gmail.com
patch subject: [PATCH] mm/memcontrol: fix obj_cgroup leak in mem_cgroup_css_online() error path
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-r072-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241635.qNXDPwjs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603241635.qNXDPwjs-lkp@intel.com/

smatch warnings:
mm/memcontrol.c:4180 mem_cgroup_css_online() warn: variable dereferenced before check 'pn' (see line 4176)

vim +/pn +4180 mm/memcontrol.c

0b8f73e104285a Johannes Weiner  2016-01-20  4119  
73f576c04b9410 Johannes Weiner  2016-07-20  4120  static int mem_cgroup_css_online(struct cgroup_subsys_state *css)
0b8f73e104285a Johannes Weiner  2016-01-20  4121  {
58fa2a5512d9f2 Vladimir Davydov 2016-10-07  4122  	struct mem_cgroup *memcg = mem_cgroup_from_css(css);
a0dd8b1942f5bf Muchun Song      2026-03-05  4123  	struct obj_cgroup *objcg;
098fad3e1621cb Qi Zheng         2026-03-05  4124  	int nid;
58fa2a5512d9f2 Vladimir Davydov 2016-10-07  4125  
a0dd8b1942f5bf Muchun Song      2026-03-05  4126  	memcg_online_kmem(memcg);
da0efe30944476 Muchun Song      2022-03-22  4127  
0a4465d340282f Kirill Tkhai     2018-08-17  4128  	/*
e4262c4f51d637 Yang Shi         2021-05-04  4129  	 * A memcg must be visible for expand_shrinker_info()
0a4465d340282f Kirill Tkhai     2018-08-17  4130  	 * by the time the maps are allocated. So, we allocate maps
0a4465d340282f Kirill Tkhai     2018-08-17  4131  	 * here, when for_each_mem_cgroup() can't skip it.
0a4465d340282f Kirill Tkhai     2018-08-17  4132  	 */
da0efe30944476 Muchun Song      2022-03-22  4133  	if (alloc_shrinker_info(memcg))
da0efe30944476 Muchun Song      2022-03-22  4134  		goto offline_kmem;
0a4465d340282f Kirill Tkhai     2018-08-17  4135  
098fad3e1621cb Qi Zheng         2026-03-05  4136  	for_each_node(nid) {
a0dd8b1942f5bf Muchun Song      2026-03-05  4137  		objcg = obj_cgroup_alloc();
59f75a1877fbf7 David Carlier    2026-03-22  4138  		if (!objcg) {
098fad3e1621cb Qi Zheng         2026-03-05  4139  			goto free_objcg;
59f75a1877fbf7 David Carlier    2026-03-22  4140  		}
a0dd8b1942f5bf Muchun Song      2026-03-05  4141  
7e6ee1e3da3510 Muchun Song      2026-03-05  4142  		if (unlikely(mem_cgroup_is_root(memcg)))
098fad3e1621cb Qi Zheng         2026-03-05  4143  			objcg->is_root = true;
7e6ee1e3da3510 Muchun Song      2026-03-05  4144  
a0dd8b1942f5bf Muchun Song      2026-03-05  4145  		objcg->memcg = memcg;
098fad3e1621cb Qi Zheng         2026-03-05  4146  		rcu_assign_pointer(memcg->nodeinfo[nid]->objcg, objcg);
a0dd8b1942f5bf Muchun Song      2026-03-05  4147  		obj_cgroup_get(objcg);
098fad3e1621cb Qi Zheng         2026-03-05  4148  		memcg->nodeinfo[nid]->orig_objcg = objcg;
098fad3e1621cb Qi Zheng         2026-03-05  4149  	}
a0dd8b1942f5bf Muchun Song      2026-03-05  4150  
13ef7424577ff9 T.J. Mercier     2024-01-26  4151  	if (unlikely(mem_cgroup_is_root(memcg)) && !mem_cgroup_disabled())
0bcbd7cf659682 Marco Crivellari 2026-01-13  4152  		queue_delayed_work(system_dfl_wq, &stats_flush_dwork,
396faf88981917 Miaohe Lin       2023-06-03  4153  				   FLUSH_TIME);
e4dde56cd20867 Yu Zhao          2022-12-21  4154  	lru_gen_online_memcg(memcg);
6f0df8e16eb543 Johannes Weiner  2023-08-23  4155  
6f0df8e16eb543 Johannes Weiner  2023-08-23  4156  	/* Online state pins memcg ID, memcg ID pins CSS */
6f0df8e16eb543 Johannes Weiner  2023-08-23  4157  	refcount_set(&memcg->id.ref, 1);
6f0df8e16eb543 Johannes Weiner  2023-08-23  4158  	css_get(css);
6f0df8e16eb543 Johannes Weiner  2023-08-23  4159  
6f0df8e16eb543 Johannes Weiner  2023-08-23  4160  	/*
e77786b4682e69 Shakeel Butt     2025-12-25  4161  	 * Ensure mem_cgroup_from_private_id() works once we're fully online.
6f0df8e16eb543 Johannes Weiner  2023-08-23  4162  	 *
6f0df8e16eb543 Johannes Weiner  2023-08-23  4163  	 * We could do this earlier and require callers to filter with
6f0df8e16eb543 Johannes Weiner  2023-08-23  4164  	 * css_tryget_online(). But right now there are no users that
6f0df8e16eb543 Johannes Weiner  2023-08-23  4165  	 * need earlier access, and the workingset code relies on the
6f0df8e16eb543 Johannes Weiner  2023-08-23  4166  	 * cgroup tree linkage (mem_cgroup_get_nr_swap_pages()). So
6f0df8e16eb543 Johannes Weiner  2023-08-23  4167  	 * publish it here at the end of onlining. This matches the
6f0df8e16eb543 Johannes Weiner  2023-08-23  4168  	 * regular ID destruction during offlining.
6f0df8e16eb543 Johannes Weiner  2023-08-23  4169  	 */
e77786b4682e69 Shakeel Butt     2025-12-25  4170  	xa_store(&mem_cgroup_private_ids, memcg->id.id, memcg, GFP_KERNEL);
6f0df8e16eb543 Johannes Weiner  2023-08-23  4171  
2f7dd7a4100ad4 Johannes Weiner  2014-10-02  4172  	return 0;
098fad3e1621cb Qi Zheng         2026-03-05  4173  free_objcg:
098fad3e1621cb Qi Zheng         2026-03-05  4174  	for_each_node(nid) {
098fad3e1621cb Qi Zheng         2026-03-05  4175  		struct mem_cgroup_per_node *pn = memcg->nodeinfo[nid];
59f75a1877fbf7 David Carlier    2026-03-22 @4176  		objcg = rcu_replace_pointer(pn->objcg, NULL, true);
59f75a1877fbf7 David Carlier    2026-03-22  4177  		if (objcg)
59f75a1877fbf7 David Carlier    2026-03-22  4178  			percpu_ref_kill(&objcg->refcnt);
098fad3e1621cb Qi Zheng         2026-03-05  4179  
4a2f95f5c79e02 Qi Zheng         2026-03-09 @4180  		if (pn && pn->orig_objcg) {
098fad3e1621cb Qi Zheng         2026-03-05  4181  			obj_cgroup_put(pn->orig_objcg);
4a2f95f5c79e02 Qi Zheng         2026-03-09  4182  			/*
02b5fc7885d9f8 Andrew Morton    2026-03-09  4183  			 * Reset pn->orig_objcg to NULL to prevent
02b5fc7885d9f8 Andrew Morton    2026-03-09  4184  			 * obj_cgroup_put() from being called again in
02b5fc7885d9f8 Andrew Morton    2026-03-09  4185  			 * __mem_cgroup_free().
4a2f95f5c79e02 Qi Zheng         2026-03-09  4186  			 */
4a2f95f5c79e02 Qi Zheng         2026-03-09  4187  			pn->orig_objcg = NULL;
4a2f95f5c79e02 Qi Zheng         2026-03-09  4188  		}
098fad3e1621cb Qi Zheng         2026-03-05  4189  	}
a0dd8b1942f5bf Muchun Song      2026-03-05  4190  	free_shrinker_info(memcg);
da0efe30944476 Muchun Song      2022-03-22  4191  offline_kmem:
da0efe30944476 Muchun Song      2022-03-22  4192  	memcg_offline_kmem(memcg);
e77786b4682e69 Shakeel Butt     2025-12-25  4193  	mem_cgroup_private_id_remove(memcg);
da0efe30944476 Muchun Song      2022-03-22  4194  	return -ENOMEM;
8cdea7c0545426 Balbir Singh     2008-02-07  4195  }
8cdea7c0545426 Balbir Singh     2008-02-07  4196  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
