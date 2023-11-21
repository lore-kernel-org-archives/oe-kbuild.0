Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7191A180
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 00:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idYtuUo3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700525018; x=1732061018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ufgGB4IjlJPas6VkvphxWftNARJaRs1Fgvq12jxDzk=;
  b=idYtuUo3fon5t0KXO38Q5CIlUaf4w/A22yv35PRZdWYhp9hEdVbLFNkR
   JtH5TEuRXL1ySwGulcGqYbA6F64wZwumO2c85t+qLgzHWmKWD4qKsGHjG
   pWA7Tde1ZvQ4XocOhVvbM/2enXoz7oH60duH9BsktYjoUUdD+cLr6dVvr
   NOmALFUrCNKgkrkCEpYFlsoPzQ94JkcmqGbNwyFxLh43HD0+bdWVmyxqz
   euKDwonEtZfsxg8Olo7UOZIiBqO/L3A+qPHx79N/e71/AtQVX3yXBXIb5
   IasoMbrB2K54cVBymsIIegLv6BigiJxrBmIoJj92kD4CWKXP1y3c9zZMZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="382125028"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="382125028"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 16:03:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="14317461"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 Nov 2023 16:03:17 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5EEU-00075F-1j;
	Tue, 21 Nov 2023 00:03:14 +0000
Date: Tue, 21 Nov 2023 08:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 802/2011] mm/slub.c:2562 __put_partials() error:
 calling 'spin_unlock_irqrestore()' with bogus flags
Message-ID: <202311210702.qw2Sc9qM-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Chengming Zhou <zhouchengming@bytedance.com>
CC: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5a82d69d48c82e89aef44483d2a129f869f3506a
commit: 4b436491294e5091de82c86deaeae0dbaa9b479e [802/2011] slub: Rename all *unfreeze_partials* functions to *put_partials*
:::::: branch date: 18 hours ago
:::::: commit date: 8 days ago
config: i386-randconfig-141-20231121 (https://download.01.org/0day-ci/archive/20231121/202311210702.qw2Sc9qM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311210702.qw2Sc9qM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311210702.qw2Sc9qM-lkp@intel.com/

smatch warnings:
mm/slub.c:2562 __put_partials() error: calling 'spin_unlock_irqrestore()' with bogus flags

vim +2562 mm/slub.c

81819f0fc8285a Christoph Lameter 2007-05-06  2547  
345c905d13a4ec Joonsoo Kim       2013-06-19  2548  #ifdef CONFIG_SLUB_CPU_PARTIAL
4b436491294e50 Chengming Zhou    2023-11-02  2549  static void __put_partials(struct kmem_cache *s, struct slab *partial_slab)
fc1455f4e023b2 Vlastimil Babka   2021-05-20  2550  {
43d77867a4f333 Joonsoo Kim       2012-06-09  2551  	struct kmem_cache_node *n = NULL, *n2 = NULL;
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2552  	struct slab *slab, *slab_to_discard = NULL;
7cf9f3ba2f0221 Vlastimil Babka   2021-05-21  2553  	unsigned long flags = 0;
49e2258586b423 Christoph Lameter 2011-08-09  2554  
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2555  	while (partial_slab) {
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2556  		slab = partial_slab;
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2557  		partial_slab = slab->next;
43d77867a4f333 Joonsoo Kim       2012-06-09  2558  
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2559  		n2 = get_node(s, slab_nid(slab));
43d77867a4f333 Joonsoo Kim       2012-06-09  2560  		if (n != n2) {
43d77867a4f333 Joonsoo Kim       2012-06-09  2561  			if (n)
7cf9f3ba2f0221 Vlastimil Babka   2021-05-21 @2562  				spin_unlock_irqrestore(&n->list_lock, flags);
43d77867a4f333 Joonsoo Kim       2012-06-09  2563  
43d77867a4f333 Joonsoo Kim       2012-06-09  2564  			n = n2;
7cf9f3ba2f0221 Vlastimil Babka   2021-05-21  2565  			spin_lock_irqsave(&n->list_lock, flags);
43d77867a4f333 Joonsoo Kim       2012-06-09  2566  		}
49e2258586b423 Christoph Lameter 2011-08-09  2567  
c8d312e039030e Chengming Zhou    2023-11-02  2568  		if (unlikely(!slab->inuse && n->nr_partial >= s->min_partial)) {
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2569  			slab->next = slab_to_discard;
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2570  			slab_to_discard = slab;
43d77867a4f333 Joonsoo Kim       2012-06-09  2571  		} else {
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2572  			add_partial(n, slab, DEACTIVATE_TO_TAIL);
43d77867a4f333 Joonsoo Kim       2012-06-09  2573  			stat(s, FREE_ADD_PARTIAL);
49e2258586b423 Christoph Lameter 2011-08-09  2574  		}
49e2258586b423 Christoph Lameter 2011-08-09  2575  	}
49e2258586b423 Christoph Lameter 2011-08-09  2576  
49e2258586b423 Christoph Lameter 2011-08-09  2577  	if (n)
7cf9f3ba2f0221 Vlastimil Babka   2021-05-21  2578  		spin_unlock_irqrestore(&n->list_lock, flags);
8de06a6f48f206 Vlastimil Babka   2021-05-20  2579  
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2580  	while (slab_to_discard) {
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2581  		slab = slab_to_discard;
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2582  		slab_to_discard = slab_to_discard->next;
9ada19342b2441 Shaohua Li        2011-11-14  2583  
9ada19342b2441 Shaohua Li        2011-11-14  2584  		stat(s, DEACTIVATE_EMPTY);
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2585  		discard_slab(s, slab);
9ada19342b2441 Shaohua Li        2011-11-14  2586  		stat(s, FREE_SLAB);
9ada19342b2441 Shaohua Li        2011-11-14  2587  	}
fc1455f4e023b2 Vlastimil Babka   2021-05-20  2588  }
f3ab8b6b922817 Vlastimil Babka   2021-05-20  2589  

:::::: The code at line 2562 was first introduced by commit
:::::: 7cf9f3ba2f02216b2303e648c0c5439f00191008 mm, slub: only disable irq with spin_lock in __unfreeze_partials()

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
