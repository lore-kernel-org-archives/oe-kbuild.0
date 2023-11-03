Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFDD2D627
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 05:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxWCXOm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698987931; x=1730523931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UYbxz/TF/4rFNgtOZAeP8nBJ5jjGw/Z/p0j6BPUAroY=;
  b=MxWCXOm5u/dEa/VF16BcxH5qG8PEkGG0vFcX1NcfBzEpHoOdFlWUhE8N
   Hg09P4/l3S0wC7rD2VETCBKUaX/h9uICk1DAtcWDhIKI8dWauEkuyOUGF
   6S8r3M7t5Nw37ZmOTlZoEjcYa0PGZlNlkL0A6hdWurfMCWCq0vKUXkrvn
   tp3mJiyR0AJXzVIFIFCVRpT8UEWkBv6PEGMDnsdDwjZgqYDoKH2b+uiKN
   kidPgHdcJcD4Wh0k5tiBPBMVdgJ19ERs1vQ4z2TSrd5hR6671G3hLHawd
   9P/RQ9Bh2lEezuhr9pwC2iavTyTjYU4mDn+knFHlc00glu/X8ynf6xDwz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="7517870"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="7517870"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 22:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="831925525"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="831925525"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Nov 2023 22:05:26 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qymN3-0002Ee-37;
	Fri, 03 Nov 2023 05:05:25 +0000
Date: Fri, 3 Nov 2023 13:04:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/bpf/memalloc.c:344 bpf_mem_alloc_destroy() error: potentially
 dereferencing uninitialized 'c'.
Message-ID: <202311031223.J9ZRhOzu-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   431f1051884e38d2a5751e4731d69b2ff289ee56
commit: 7c8199e24fa09d2344ae0204527d55d7803e8409 bpf: Introduce any context BPF specific memory allocator.
date:   1 year, 2 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 2 months ago
config: i386-randconfig-141-20231102 (https://download.01.org/0day-ci/archive/20231103/202311031223.J9ZRhOzu-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311031223.J9ZRhOzu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311031223.J9ZRhOzu-lkp@intel.com/

smatch warnings:
kernel/bpf/memalloc.c:344 bpf_mem_alloc_destroy() error: potentially dereferencing uninitialized 'c'.

vim +/c +344 kernel/bpf/memalloc.c

7c8199e24fa09d Alexei Starovoitov 2022-09-02  331  
7c8199e24fa09d Alexei Starovoitov 2022-09-02  332  void bpf_mem_alloc_destroy(struct bpf_mem_alloc *ma)
7c8199e24fa09d Alexei Starovoitov 2022-09-02  333  {
7c8199e24fa09d Alexei Starovoitov 2022-09-02  334  	struct bpf_mem_caches *cc;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  335  	struct bpf_mem_cache *c;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  336  	int cpu, i;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  337  
7c8199e24fa09d Alexei Starovoitov 2022-09-02  338  	if (ma->cache) {
7c8199e24fa09d Alexei Starovoitov 2022-09-02  339  		for_each_possible_cpu(cpu) {
7c8199e24fa09d Alexei Starovoitov 2022-09-02  340  			c = per_cpu_ptr(ma->cache, cpu);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  341  			drain_mem_cache(c);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  342  		}
7c8199e24fa09d Alexei Starovoitov 2022-09-02  343  		/* kmem_cache and memcg are the same across cpus */
7c8199e24fa09d Alexei Starovoitov 2022-09-02 @344  		kmem_cache_destroy(c->kmem_cache);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  345  		if (c->objcg)
7c8199e24fa09d Alexei Starovoitov 2022-09-02  346  			obj_cgroup_put(c->objcg);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  347  		free_percpu(ma->cache);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  348  		ma->cache = NULL;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  349  	}
7c8199e24fa09d Alexei Starovoitov 2022-09-02  350  	if (ma->caches) {
7c8199e24fa09d Alexei Starovoitov 2022-09-02  351  		for_each_possible_cpu(cpu) {
7c8199e24fa09d Alexei Starovoitov 2022-09-02  352  			cc = per_cpu_ptr(ma->caches, cpu);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  353  			for (i = 0; i < NUM_CACHES; i++) {
7c8199e24fa09d Alexei Starovoitov 2022-09-02  354  				c = &cc->cache[i];
7c8199e24fa09d Alexei Starovoitov 2022-09-02  355  				drain_mem_cache(c);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  356  			}
7c8199e24fa09d Alexei Starovoitov 2022-09-02  357  		}
7c8199e24fa09d Alexei Starovoitov 2022-09-02  358  		if (c->objcg)
7c8199e24fa09d Alexei Starovoitov 2022-09-02  359  			obj_cgroup_put(c->objcg);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  360  		free_percpu(ma->caches);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  361  		ma->caches = NULL;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  362  	}
7c8199e24fa09d Alexei Starovoitov 2022-09-02  363  }
7c8199e24fa09d Alexei Starovoitov 2022-09-02  364  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
