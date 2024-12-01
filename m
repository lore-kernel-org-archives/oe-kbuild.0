Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B92D1CEEAD
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 13:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733059983; cv=none; b=s7qM5qNHMAulIQtl9QwJkR5APhMwCEB1zQIWVPRrPpg5+zOV0d2t8l29+ksvUnXUrPjWmEULQhuYpf0NVetTnwkiD5wluDcpn23AgF0I+CaLBC69LdhPXMsfmpxE7TsVz1uuVXjIUwnpa/CmWFWs9jSnNv3CO7BIYwZ9G/r4F5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733059983; c=relaxed/simple;
	bh=YSM8YGRE2w9aw7xdJQxFLdhgfaG8NP4qyul0yUhWHmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fszNZTFMBO4xhahIBDD4X4+5+mSnO/NizCQ5Pk5zcmeJjLTrBcx/olbuC8ucVFj5WYbsD71V9EWZA3Cxdx9KyXO4vyqh1fakytk287xmcSuZ2fFhVsYV6AOJqXQNRrIdweD4hyFnrXBl6/cPbwo02B46Y9Qp3NuFIJouLjux9GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O32CV8q5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O32CV8q5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733059981; x=1764595981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YSM8YGRE2w9aw7xdJQxFLdhgfaG8NP4qyul0yUhWHmc=;
  b=O32CV8q518tj3MKatgM/nsjILsYTXTIt8TEcSgqksW0ceKI38YE8Sb7M
   pLn0BZgPipuozw3pbgqeL7LVWMDs1jNawvunvpEPdeBh2tvYl2O6GX/p/
   CUZ8CqMcOPNi7G6CH3ETwAqi8c2EvV2g51A024GwJ+AoKHc6cJIJbOjR3
   s8LQ1NnYF54sarIvFiMaH3aZ3OFo/HSI7zi5Egg933dQ0GpmpmMenN8Jk
   NynxpKnloF4CkbW/8eoeYxBS4z/6PNS+iAq+eDS9pZjvovMLAvCjKPUlk
   HWJB+Gh+IQmQA8AtGVQ+BdTWshYqzsW9z5FLKl208A1GFVpTLEvoFvL4z
   g==;
X-CSE-ConnectionGUID: klEHZZeuRdeeLN9FNE0Qkw==
X-CSE-MsgGUID: OCyk5I5ZRU6vrKrlhPsWBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="44612510"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="44612510"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 05:33:00 -0800
X-CSE-ConnectionGUID: 3cxZth5cRmiAptUGlz3oVw==
X-CSE-MsgGUID: 8Q8YNbMBS1SLaqS+/8aO/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="97831231"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 01 Dec 2024 05:32:58 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHk4G-0001Yn-1t;
	Sun, 01 Dec 2024 13:32:56 +0000
Date: Sun, 1 Dec 2024 21:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/rcu/rcutorture.c:1900:11-12: WARNING kmalloc is used to
 allocate this memory at line 1887
Message-ID: <202412012159.XzUyULh7-lkp@intel.com>
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
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
commit: 0d3dd2c8eadb7d4404b8788f552fb2b824fe2c7e rcutorture: Add crude tests for mem_dump_obj()
date:   3 years, 9 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 3 years, 9 months ago
config: x86_64-randconfig-r063-20241119 (https://download.01.org/0day-ci/archive/20241201/202412012159.XzUyULh7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412012159.XzUyULh7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/rcu/rcutorture.c:1900:11-12: WARNING kmalloc is used to allocate this memory at line 1887

vim +1900 kernel/rcu/rcutorture.c

a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney 2005-10-30  1849  
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney 2005-10-30  1850  /*
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney 2005-10-30  1851   * Periodically prints torture statistics, if periodic statistics printing
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney 2005-10-30  1852   * was specified via the stat_interval module parameter.
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney 2005-10-30  1853   */
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney 2005-10-30  1854  static int
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney 2005-10-30  1855  rcu_torture_stats(void *arg)
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney 2005-10-30  1856  {
5ccf60f23d33af kernel/rcu/rcutorture.c Paul E. McKenney 2014-01-29  1857  	VERBOSE_TOROUT_STRING("rcu_torture_stats task started");
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney 2005-10-30  1858  	do {
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney 2005-10-30  1859  		schedule_timeout_interruptible(stat_interval * HZ);
a241ec65aeac3d kernel/rcutorture.c     Paul E. McKenney 2005-10-30  1860  		rcu_torture_stats_print();
f67a33561e6e54 kernel/rcu/rcutorture.c Paul E. McKenney 2014-01-29  1861  		torture_shutdown_absorb("rcu_torture_stats");
36970bb91d8961 kernel/rcu/rcutorture.c Paul E. McKenney 2014-01-30  1862  	} while (!torture_must_stop());
7fafaac5b9ce22 kernel/rcu/rcutorture.c Paul E. McKenney 2014-01-31  1863  	torture_kthread_stopping("rcu_torture_stats");
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1864  
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1865  	{
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1866  		struct rcu_head *rhp;
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1867  		struct kmem_cache *kcp;
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1868  		static int z;
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1869  
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1870  		kcp = kmem_cache_create("rcuscale", 136, 8, SLAB_STORE_USER, NULL);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1871  		rhp = kmem_cache_alloc(kcp, GFP_KERNEL);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1872  		pr_alert("mem_dump_obj() slab test: rcu_torture_stats = %px, &rhp = %px, rhp = %px, &z = %px\n", stats_task, &rhp, rhp, &z);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1873  		pr_alert("mem_dump_obj(ZERO_SIZE_PTR):");
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1874  		mem_dump_obj(ZERO_SIZE_PTR);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1875  		pr_alert("mem_dump_obj(NULL):");
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1876  		mem_dump_obj(NULL);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1877  		pr_alert("mem_dump_obj(%px):", &rhp);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1878  		mem_dump_obj(&rhp);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1879  		pr_alert("mem_dump_obj(%px):", rhp);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1880  		mem_dump_obj(rhp);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1881  		pr_alert("mem_dump_obj(%px):", &rhp->func);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1882  		mem_dump_obj(&rhp->func);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1883  		pr_alert("mem_dump_obj(%px):", &z);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1884  		mem_dump_obj(&z);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1885  		kmem_cache_free(kcp, rhp);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1886  		kmem_cache_destroy(kcp);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07 @1887  		rhp = kmalloc(sizeof(*rhp), GFP_KERNEL);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1888  		pr_alert("mem_dump_obj() kmalloc test: rcu_torture_stats = %px, &rhp = %px, rhp = %px\n", stats_task, &rhp, rhp);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1889  		pr_alert("mem_dump_obj(kmalloc %px):", rhp);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1890  		mem_dump_obj(rhp);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1891  		pr_alert("mem_dump_obj(kmalloc %px):", &rhp->func);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1892  		mem_dump_obj(&rhp->func);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1893  		kfree(rhp);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1894  		rhp = vmalloc(4096);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1895  		pr_alert("mem_dump_obj() vmalloc test: rcu_torture_stats = %px, &rhp = %px, rhp = %px\n", stats_task, &rhp, rhp);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1896  		pr_alert("mem_dump_obj(vmalloc %px):", rhp);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1897  		mem_dump_obj(rhp);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1898  		pr_alert("mem_dump_obj(vmalloc %px):", &rhp->func);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1899  		mem_dump_obj(&rhp->func);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07 @1900  		vfree(rhp);
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1901  	}
0d3dd2c8eadb7d kernel/rcu/rcutorture.c Paul E. McKenney 2020-12-07  1902  
d120f65f3aaf30 kernel/rcutorture.c     Paul E. McKenney 2008-06-18  1903  	return 0;
d120f65f3aaf30 kernel/rcutorture.c     Paul E. McKenney 2008-06-18  1904  }
d120f65f3aaf30 kernel/rcutorture.c     Paul E. McKenney 2008-06-18  1905  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
