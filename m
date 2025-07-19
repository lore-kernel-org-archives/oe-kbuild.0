Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9C51DA10B
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Jul 2025 08:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752914755; cv=none; b=qDbhf/r6kHqidl5GCwWZRHLwwyxAoI2O1jS6NriHRpvGRALUtQqWBL4k+9r7nhfvSvw0KcXD9BM9YmOiXvxjAkFCFHYqytW2/988RsU1RScDMaUmsbAUg1avJ9ByHay61GQSChycVFff7k5y9noxrQI81GqD9TZjsFofib99ITA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752914755; c=relaxed/simple;
	bh=IjNw6vjtz4WpOaCH+tCG7azM7vS5fDWTl+d1ZE6vsYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OMWIoJZ6awJc2Th3yH2OW1yWwaACuX4vo6XdsCeQzvHDfxlTeTgFTubF1OaJgdrBX0EtR7ToerJFz25Qed4qCLaNhsfHJ2vWVOb8TDm72/rU29H+m9EGftih0mOix9f2uvxD6mSqRfJv8QFf88+jMV0ZOHnNsvcffB4Sx5xAFaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWZCFCEd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWZCFCEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752914754; x=1784450754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IjNw6vjtz4WpOaCH+tCG7azM7vS5fDWTl+d1ZE6vsYY=;
  b=bWZCFCEdUwa6/PkuDK4GB/ZbPMLknvDxb2xVrTywXE5cvZuLdzw3xw87
   YFtAQX+3CGEWMCSPqITrFWwewWKMYeMbaRLJZFvwAKcFUbMive6PbJHM2
   Vg0Od3UT7s+9+m+cJFFvH0xn48oqcy/3/DLYRIcjUurL+2vk5Vkj1puod
   CEBo43On3Jzhneao3x2cPvBSBABecs7RTwKX+ALQ4DABL7/Y9pqIv7Fjs
   2DlzsoqzBgZApaQrAGpOuFvhltre0KFu/5XDk20ZcAlnuChFr4rJ7hXjV
   1JcANDf/LVkhP2Q0w0J6cW9tfC1qPXd2qORMvX22FMCWxEqXBkX8gAq3A
   A==;
X-CSE-ConnectionGUID: 6rNXw4qlSQWUu24F4Hic0w==
X-CSE-MsgGUID: 77HHUSoXRnaOqHlJahxRoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="58987131"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="58987131"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 01:45:52 -0700
X-CSE-ConnectionGUID: U6hJyc9WSxu4s04IhBacdA==
X-CSE-MsgGUID: SiJB81F1Ti2vFJF/tsVL3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="162445970"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jul 2025 01:45:51 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud3CW-000FMB-2H;
	Sat, 19 Jul 2025 08:45:48 +0000
Date: Sat, 19 Jul 2025 16:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ast-bpf:kmalloc_nolock 6/7] mm/slub.c:3849 ___slab_alloc() error:
 uninitialized symbol 'flags'.
Message-ID: <202507191651.2KyV83xj-lkp@intel.com>
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
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git kmalloc_nolock
head:   de3de6fc810275dad0998ffed42d921690c667ec
commit: 8e58427a2c80d3a9be8b6f2f9ccc4319d1f27906 [6/7] slab: Introduce kmalloc_nolock() and kfree_nolock().
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-161-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191651.2KyV83xj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507191651.2KyV83xj-lkp@intel.com/

smatch warnings:
mm/slub.c:3849 ___slab_alloc() error: uninitialized symbol 'flags'.

vim +/flags +3849 mm/slub.c

213094b5d1af7e Chengming Zhou     2023-11-02  3762  
81819f0fc8285a Christoph Lameter  2007-05-06  3763  /*
894b8788d7f265 Christoph Lameter  2007-05-10  3764   * Slow path. The lockless freelist is empty or we need to perform
894b8788d7f265 Christoph Lameter  2007-05-10  3765   * debugging duties.
894b8788d7f265 Christoph Lameter  2007-05-10  3766   *
894b8788d7f265 Christoph Lameter  2007-05-10  3767   * Processing is still very fast if new objects have been freed to the
894b8788d7f265 Christoph Lameter  2007-05-10  3768   * regular freelist. In that case we simply take over the regular freelist
894b8788d7f265 Christoph Lameter  2007-05-10  3769   * as the lockless freelist and zap the regular freelist.
81819f0fc8285a Christoph Lameter  2007-05-06  3770   *
894b8788d7f265 Christoph Lameter  2007-05-10  3771   * If that is not working then we fall back to the partial lists. We take the
894b8788d7f265 Christoph Lameter  2007-05-10  3772   * first element of the freelist as the object to allocate now and move the
894b8788d7f265 Christoph Lameter  2007-05-10  3773   * rest of the freelist to the lockless freelist.
81819f0fc8285a Christoph Lameter  2007-05-06  3774   *
894b8788d7f265 Christoph Lameter  2007-05-10  3775   * And if we were unable to get a new slab from the partial slab lists then
6446faa2ff30ca Christoph Lameter  2008-02-15  3776   * we need to allocate a new slab. This is the slowest path since it involves
6446faa2ff30ca Christoph Lameter  2008-02-15  3777   * a call to the page allocator and the setup of a new slab.
a380a3c75529a5 Christoph Lameter  2015-11-20  3778   *
e500059ba55268 Vlastimil Babka    2021-05-07  3779   * Version of __slab_alloc to use when we know that preemption is
a380a3c75529a5 Christoph Lameter  2015-11-20  3780   * already disabled (which is the case for bulk allocation).
81819f0fc8285a Christoph Lameter  2007-05-06  3781   */
a380a3c75529a5 Christoph Lameter  2015-11-20  3782  static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
6edf2576a6cc46 Feng Tang          2022-09-13  3783  			  unsigned long addr, struct kmem_cache_cpu *c, unsigned int orig_size)
81819f0fc8285a Christoph Lameter  2007-05-06  3784  {
8e58427a2c80d3 Alexei Starovoitov 2025-04-04  3785  	bool allow_spin = gfpflags_allow_spinning(gfpflags);
6faa68337b0c90 Christoph Lameter  2012-05-09  3786  	void *freelist;
bb192ed9aa7191 Vlastimil Babka    2021-11-03  3787  	struct slab *slab;
e500059ba55268 Vlastimil Babka    2021-05-07  3788  	unsigned long flags;
6edf2576a6cc46 Feng Tang          2022-09-13  3789  	struct partial_context pc;
9198ffbd2b494d Chen Jun           2024-03-30  3790  	bool try_thisnode = true;
81819f0fc8285a Christoph Lameter  2007-05-06  3791  
9f986d998a3001 Abel Wu            2020-10-13  3792  	stat(s, ALLOC_SLOWPATH);
9f986d998a3001 Abel Wu            2020-10-13  3793  
c2092c12064a97 Vlastimil Babka    2021-11-15  3794  reread_slab:
0b303fb402862d Vlastimil Babka    2021-05-08  3795  
bb192ed9aa7191 Vlastimil Babka    2021-11-03  3796  	slab = READ_ONCE(c->slab);
bb192ed9aa7191 Vlastimil Babka    2021-11-03  3797  	if (!slab) {
0715e6c516f106 Vlastimil Babka    2020-03-21  3798  		/*
0715e6c516f106 Vlastimil Babka    2020-03-21  3799  		 * if the node is not online or has no normal memory, just
0715e6c516f106 Vlastimil Babka    2020-03-21  3800  		 * ignore the node constraint
0715e6c516f106 Vlastimil Babka    2020-03-21  3801  		 */
0715e6c516f106 Vlastimil Babka    2020-03-21  3802  		if (unlikely(node != NUMA_NO_NODE &&
7e1fa93deff446 Vlastimil Babka    2021-02-24  3803  			     !node_isset(node, slab_nodes)))
0715e6c516f106 Vlastimil Babka    2020-03-21  3804  			node = NUMA_NO_NODE;
81819f0fc8285a Christoph Lameter  2007-05-06  3805  		goto new_slab;
0715e6c516f106 Vlastimil Babka    2020-03-21  3806  	}
6faa68337b0c90 Christoph Lameter  2012-05-09  3807  
bb192ed9aa7191 Vlastimil Babka    2021-11-03  3808  	if (unlikely(!node_match(slab, node))) {
0715e6c516f106 Vlastimil Babka    2020-03-21  3809  		/*
0715e6c516f106 Vlastimil Babka    2020-03-21  3810  		 * same as above but node_match() being false already
8e58427a2c80d3 Alexei Starovoitov 2025-04-04  3811  		 * implies node != NUMA_NO_NODE.
8e58427a2c80d3 Alexei Starovoitov 2025-04-04  3812  		 * Reentrant slub cannot take locks necessary to
8e58427a2c80d3 Alexei Starovoitov 2025-04-04  3813  		 * deactivate_slab, hence ignore node preference.
8e58427a2c80d3 Alexei Starovoitov 2025-04-04  3814  		 * kmalloc_nolock() doesn't allow __GFP_THISNODE.
0715e6c516f106 Vlastimil Babka    2020-03-21  3815  		 */
8e58427a2c80d3 Alexei Starovoitov 2025-04-04  3816  		if (!node_isset(node, slab_nodes) ||
8e58427a2c80d3 Alexei Starovoitov 2025-04-04  3817  		    !allow_spin) {
0715e6c516f106 Vlastimil Babka    2020-03-21  3818  			node = NUMA_NO_NODE;
0715e6c516f106 Vlastimil Babka    2020-03-21  3819  		} else {
e36a2652d7d1ad Christoph Lameter  2011-06-01  3820  			stat(s, ALLOC_NODE_MISMATCH);
0b303fb402862d Vlastimil Babka    2021-05-08  3821  			goto deactivate_slab;
fc59c05306fe1d Christoph Lameter  2011-06-01  3822  		}
a561ce00b09e15 Joonsoo Kim        2014-10-09  3823  	}
6446faa2ff30ca Christoph Lameter  2008-02-15  3824  
072bb0aa5e0629 Mel Gorman         2012-07-31  3825  	/*
072bb0aa5e0629 Mel Gorman         2012-07-31  3826  	 * By rights, we should be searching for a slab page that was
072bb0aa5e0629 Mel Gorman         2012-07-31  3827  	 * PFMEMALLOC but right now, we are losing the pfmemalloc
072bb0aa5e0629 Mel Gorman         2012-07-31  3828  	 * information when the page leaves the per-cpu allocator
072bb0aa5e0629 Mel Gorman         2012-07-31  3829  	 */
8e58427a2c80d3 Alexei Starovoitov 2025-04-04  3830  	if (unlikely(!pfmemalloc_match(slab, gfpflags) && allow_spin))
0b303fb402862d Vlastimil Babka    2021-05-08  3831  		goto deactivate_slab;
072bb0aa5e0629 Mel Gorman         2012-07-31  3832  
c2092c12064a97 Vlastimil Babka    2021-11-15  3833  	/* must check again c->slab in case we got preempted and it changed */
8e58427a2c80d3 Alexei Starovoitov 2025-04-04  3834  	local_lock_cpu_slab(s, flags);
8e58427a2c80d3 Alexei Starovoitov 2025-04-04  3835  
bb192ed9aa7191 Vlastimil Babka    2021-11-03  3836  	if (unlikely(slab != c->slab)) {
8e58427a2c80d3 Alexei Starovoitov 2025-04-04  3837  		local_unlock_cpu_slab(s, flags);
c2092c12064a97 Vlastimil Babka    2021-11-15  3838  		goto reread_slab;
0b303fb402862d Vlastimil Babka    2021-05-08  3839  	}
6faa68337b0c90 Christoph Lameter  2012-05-09  3840  	freelist = c->freelist;
6faa68337b0c90 Christoph Lameter  2012-05-09  3841  	if (freelist)
73736e0387ba0e Eric Dumazet       2011-12-13  3842  		goto load_freelist;
01ad8a7bc226dd Christoph Lameter  2011-04-15  3843  
bb192ed9aa7191 Vlastimil Babka    2021-11-03  3844  	freelist = get_freelist(s, slab);
6446faa2ff30ca Christoph Lameter  2008-02-15  3845  
6faa68337b0c90 Christoph Lameter  2012-05-09  3846  	if (!freelist) {
bb192ed9aa7191 Vlastimil Babka    2021-11-03  3847  		c->slab = NULL;
eeaa345e128515 Jann Horn          2022-06-08  3848  		c->tid = next_tid(c->tid);
8e58427a2c80d3 Alexei Starovoitov 2025-04-04 @3849  		local_unlock_cpu_slab(s, flags);
03e404af26dc2e Christoph Lameter  2011-06-01  3850  		stat(s, DEACTIVATE_BYPASS);
fc59c05306fe1d Christoph Lameter  2011-06-01  3851  		goto new_slab;
03e404af26dc2e Christoph Lameter  2011-06-01  3852  	}
81819f0fc8285a Christoph Lameter  2007-05-06  3853  
2cfb7455d223ab Christoph Lameter  2011-06-01  3854  	stat(s, ALLOC_REFILL);
01ad8a7bc226dd Christoph Lameter  2011-04-15  3855  
4eade540fc3535 Christoph Lameter  2011-06-01  3856  load_freelist:
0b303fb402862d Vlastimil Babka    2021-05-08  3857  
bd0e7491a931f5 Vlastimil Babka    2021-05-22  3858  	lockdep_assert_held(this_cpu_ptr(&s->cpu_slab->lock));
0b303fb402862d Vlastimil Babka    2021-05-08  3859  
507effeaba29bf Christoph Lameter  2012-05-09  3860  	/*
507effeaba29bf Christoph Lameter  2012-05-09  3861  	 * freelist is pointing to the list of objects to be used.
c2092c12064a97 Vlastimil Babka    2021-11-15  3862  	 * slab is pointing to the slab from which the objects are obtained.
c2092c12064a97 Vlastimil Babka    2021-11-15  3863  	 * That slab must be frozen for per cpu allocations to work.
507effeaba29bf Christoph Lameter  2012-05-09  3864  	 */
bb192ed9aa7191 Vlastimil Babka    2021-11-03  3865  	VM_BUG_ON(!c->slab->frozen);
6faa68337b0c90 Christoph Lameter  2012-05-09  3866  	c->freelist = get_freepointer(s, freelist);
8a5ec0ba42c491 Christoph Lameter  2011-02-25  3867  	c->tid = next_tid(c->tid);
8e58427a2c80d3 Alexei Starovoitov 2025-04-04  3868  	local_unlock_cpu_slab(s, flags);
6faa68337b0c90 Christoph Lameter  2012-05-09  3869  	return freelist;
81819f0fc8285a Christoph Lameter  2007-05-06  3870  
0b303fb402862d Vlastimil Babka    2021-05-08  3871  deactivate_slab:
0b303fb402862d Vlastimil Babka    2021-05-08  3872  
8e58427a2c80d3 Alexei Starovoitov 2025-04-04  3873  	local_lock_cpu_slab(s, flags);
bb192ed9aa7191 Vlastimil Babka    2021-11-03  3874  	if (slab != c->slab) {
8e58427a2c80d3 Alexei Starovoitov 2025-04-04  3875  		local_unlock_cpu_slab(s, flags);
c2092c12064a97 Vlastimil Babka    2021-11-15  3876  		goto reread_slab;
0b303fb402862d Vlastimil Babka    2021-05-08  3877  	}
a019d20162586a Vlastimil Babka    2021-05-12  3878  	freelist = c->freelist;
bb192ed9aa7191 Vlastimil Babka    2021-11-03  3879  	c->slab = NULL;
a019d20162586a Vlastimil Babka    2021-05-12  3880  	c->freelist = NULL;
eeaa345e128515 Jann Horn          2022-06-08  3881  	c->tid = next_tid(c->tid);
8e58427a2c80d3 Alexei Starovoitov 2025-04-04  3882  	local_unlock_cpu_slab(s, flags);
bb192ed9aa7191 Vlastimil Babka    2021-11-03  3883  	deactivate_slab(s, slab, freelist);
0b303fb402862d Vlastimil Babka    2021-05-08  3884  
81819f0fc8285a Christoph Lameter  2007-05-06  3885  new_slab:
2cfb7455d223ab Christoph Lameter  2011-06-01  3886  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
