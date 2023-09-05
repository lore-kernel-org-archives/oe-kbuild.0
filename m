Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56A4CA49
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Sep 2023 11:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693912297; x=1725448297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RbLLbAiMMU9zMNiGs/Aa7nF/JY34aKCKhiBg6+U0Cok=;
  b=meNqKi1Gp49HdjJPjd++nbfsFT+tt3WM9Y7ggNM5PeMPuTGFLmsTiLNX
   gEgsfEZrtr/TfRr8ds/dTCxbe7EZPqgTKRpOBYGgdb6Cg5NcfWNg25WyY
   5sQxMtotuZaN3hXQB6LFxhYNd5jAZ0EZkNX9k/i8Z59vxuUpHF/KzwhLV
   MiSvBcmeTI4tVUXq9oUa5gkBtB0kyJtQycfedxV8+PXUjjqTe84WvB3EA
   nfjD2GIrzEF4553UsDmZSVsAnYxW1gwQuBbDrVBE6sTB4vGHVgNBnofu9
   BspSjjFJnev/0Mu063zMEsPVMWAYOxTRw+r21CLY9tzAuMgWt6RkjeX7s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="379488792"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="379488792"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 04:11:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="690895253"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="690895253"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Sep 2023 04:11:33 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdTxz-0001Zp-1i;
	Tue, 05 Sep 2023 11:11:31 +0000
Date: Tue, 5 Sep 2023 19:10:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/slub.c:2142:15: warning: variable 'partial_slabs' set but not used
Message-ID: <202309051941.72ZiILCM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "force check is set"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vlastimil Babka <vbabka@suse.cz>
CC: Roman Gushchin <guro@fb.com>
CC: Hyeonggon Yoo <42.hyeyoo@gmail.com>

Hi Vlastimil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f86ed6ec0b390c033eae7f9c487a3fea268e027
commit: bb192ed9aa7191a5d65548f82c42b6750d65f569 mm/slub: Convert most struct page to struct slab by spatch
date:   1 year, 8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year, 8 months ago
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20230905/202309051941.72ZiILCM-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309051941.72ZiILCM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309051941.72ZiILCM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slub.c:2142:15: warning: variable 'partial_slabs' set but not used [-Wunused-but-set-variable]
           unsigned int partial_slabs = 0;
                        ^
   mm/slub.c:1681:21: warning: unused function 'kmalloc_large_node_hook' [-Wunused-function]
   static inline void *kmalloc_large_node_hook(void *ptr, size_t size, gfp_t flags)
                       ^
   2 warnings generated.


vim +/partial_slabs +2142 mm/slub.c

49e2258586b423 Christoph Lameter 2011-08-09  2132  
81819f0fc8285a Christoph Lameter 2007-05-06  2133  /*
672bba3a4b2e65 Christoph Lameter 2007-05-09  2134   * Try to allocate a partial slab from a specific node.
81819f0fc8285a Christoph Lameter 2007-05-06  2135   */
8ba00bb68a067c Joonsoo Kim       2012-09-17  2136  static void *get_partial_node(struct kmem_cache *s, struct kmem_cache_node *n,
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2137  			      struct slab **ret_slab, gfp_t gfpflags)
81819f0fc8285a Christoph Lameter 2007-05-06  2138  {
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2139  	struct slab *slab, *slab2;
49e2258586b423 Christoph Lameter 2011-08-09  2140  	void *object = NULL;
4b1f449dedd2ff Vlastimil Babka   2021-05-11  2141  	unsigned long flags;
bb192ed9aa7191 Vlastimil Babka   2021-11-03 @2142  	unsigned int partial_slabs = 0;
81819f0fc8285a Christoph Lameter 2007-05-06  2143  
81819f0fc8285a Christoph Lameter 2007-05-06  2144  	/*
81819f0fc8285a Christoph Lameter 2007-05-06  2145  	 * Racy check. If we mistakenly see no partial slabs then we
81819f0fc8285a Christoph Lameter 2007-05-06  2146  	 * just allocate an empty slab. If we mistakenly try to get a
70b6d25ec59cbc Chen Tao          2020-10-15  2147  	 * partial slab and there is none available then get_partial()
672bba3a4b2e65 Christoph Lameter 2007-05-09  2148  	 * will return NULL.
81819f0fc8285a Christoph Lameter 2007-05-06  2149  	 */
81819f0fc8285a Christoph Lameter 2007-05-06  2150  	if (!n || !n->nr_partial)
81819f0fc8285a Christoph Lameter 2007-05-06  2151  		return NULL;
81819f0fc8285a Christoph Lameter 2007-05-06  2152  
4b1f449dedd2ff Vlastimil Babka   2021-05-11  2153  	spin_lock_irqsave(&n->list_lock, flags);
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2154  	list_for_each_entry_safe(slab, slab2, &n->partial, slab_list) {
8ba00bb68a067c Joonsoo Kim       2012-09-17  2155  		void *t;
49e2258586b423 Christoph Lameter 2011-08-09  2156  
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2157  		if (!pfmemalloc_match(slab, gfpflags))
8ba00bb68a067c Joonsoo Kim       2012-09-17  2158  			continue;
8ba00bb68a067c Joonsoo Kim       2012-09-17  2159  
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2160  		t = acquire_slab(s, n, slab, object == NULL);
49e2258586b423 Christoph Lameter 2011-08-09  2161  		if (!t)
9b1ea29bc0d7b9 Linus Torvalds    2021-03-10  2162  			break;
49e2258586b423 Christoph Lameter 2011-08-09  2163  
12d79634f8d7af Alex Shi          2011-09-07  2164  		if (!object) {
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2165  			*ret_slab = slab;
49e2258586b423 Christoph Lameter 2011-08-09  2166  			stat(s, ALLOC_FROM_PARTIAL);
49e2258586b423 Christoph Lameter 2011-08-09  2167  			object = t;
49e2258586b423 Christoph Lameter 2011-08-09  2168  		} else {
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2169  			put_cpu_partial(s, slab, 0);
8028dcea8abbbd Alex Shi          2012-02-03  2170  			stat(s, CPU_PARTIAL_NODE);
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2171  			partial_slabs++;
49e2258586b423 Christoph Lameter 2011-08-09  2172  		}
b47291ef02b0be Vlastimil Babka   2021-11-05  2173  #ifdef CONFIG_SLUB_CPU_PARTIAL
345c905d13a4ec Joonsoo Kim       2013-06-19  2174  		if (!kmem_cache_has_cpu_partial(s)
bb192ed9aa7191 Vlastimil Babka   2021-11-03  2175  			|| partial_slabs > s->cpu_partial_slabs / 2)
49e2258586b423 Christoph Lameter 2011-08-09  2176  			break;
b47291ef02b0be Vlastimil Babka   2021-11-05  2177  #else
b47291ef02b0be Vlastimil Babka   2021-11-05  2178  		break;
b47291ef02b0be Vlastimil Babka   2021-11-05  2179  #endif
49e2258586b423 Christoph Lameter 2011-08-09  2180  
497b66f2ecc978 Christoph Lameter 2011-08-09  2181  	}
4b1f449dedd2ff Vlastimil Babka   2021-05-11  2182  	spin_unlock_irqrestore(&n->list_lock, flags);
497b66f2ecc978 Christoph Lameter 2011-08-09  2183  	return object;
81819f0fc8285a Christoph Lameter 2007-05-06  2184  }
81819f0fc8285a Christoph Lameter 2007-05-06  2185  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
