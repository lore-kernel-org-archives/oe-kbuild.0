Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533452F37
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Nov 2022 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667846537; x=1699382537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7464gaME6KegIucNLvrDpx7PbrK76J4shO/zQ/V6NaU=;
  b=ENR9nw9t3CzCLmnvvhQfhU8cjX30DCmaFnjX5yKM/RwwGgfIQ0e19/Dp
   Wo8MYjb8iAY8pG4r4a0TCKulmmOvCf4gcVQyIT4iaPLA6hWgUBWFF7B6Z
   mYAEt/F06DZ8GeOHAvIbCq96LRMkIr68WZDLFVUk7r890p/hKU0zwqjE1
   1NozxJULLdl0Ij9YcojKbE9Gvnk57aJyXKnSV0nGr8kmsgJZqgUDTSGsh
   vkjdH1uE68PN6dO/fnFwIr9HOyN8ssK1VZi9+KYBtUCifgLPWePO9QU+H
   3mRFxJUiB+1p5h78pGpUHYS1Fvv4FSHgPRa3uJ6m1LjO6LGlmivZcoQOU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="290880631"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="290880631"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 10:42:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="587082250"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="587082250"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 10:42:00 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1os74J-0000vV-2s;
	Mon, 07 Nov 2022 18:41:59 +0000
Date: Tue, 8 Nov 2022 02:41:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/slab.c:3310:7: warning: Redundant assignment of 'objp' to itself.
 [selfAssignment]
Message-ID: <202211080245.zufEXuyI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/slab.c:3310:7: warning: Redundant assignment of 'objp' to itself. [selfAssignment]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vlastimil Babka <vbabka@suse.cz>
CC: Roman Gushchin <guro@fb.com>

Hi Vlastimil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0c4d9fc9cc9462659728d168387191387e903cc
commit: 7981e67efb85908d9c4924c8e6669c5d5fe365b7 mm/slab: Convert most struct page to struct slab by spatch
date:   10 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 10 months ago
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 7981e67efb85908d9c4924c8e6669c5d5fe365b7
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> mm/slab.c:3334:16: warning: Local variable 'slab' shadows outer variable [shadowVariable]
     struct slab *slab;
                  ^
   mm/slab.c:3328:15: note: Shadowed declaration
    struct slab *slab;
                 ^
   mm/slab.c:3334:16: note: Shadow variable
     struct slab *slab;
                  ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/slab.c:3310:7: warning: Redundant assignment of 'objp' to itself. [selfAssignment]
    objp = cache_alloc_debugcheck_after(cachep, flags, objp, caller);
         ^
   mm/slab.c:3455:7: warning: Redundant assignment of 'objp' to itself. [selfAssignment]
    objp = cache_free_debugcheck(cachep, objp, caller);
         ^
>> mm/slab.c:3515:8: warning: Redundant assignment of 'p[i]' to itself. [selfAssignment]
     p[i] = cache_alloc_debugcheck_after(s, flags, p[i], caller);
          ^
>> mm/slab.c:405:9: warning: Local variable 'slab_size' shadows outer function [shadowFunction]
    size_t slab_size = PAGE_SIZE << gfporder;
           ^
   mm/slab.h:170:22: note: Shadowed declaration
   static inline size_t slab_size(const struct slab *slab)
                        ^
   mm/slab.c:405:9: note: Shadow variable
    size_t slab_size = PAGE_SIZE << gfporder;
           ^

vim +/objp +3310 mm/slab.c

8c8cc2c10c2194 Pekka Enberg           2007-02-10  3288  
8c8cc2c10c2194 Pekka Enberg           2007-02-10  3289  static __always_inline void *
d3fb45f370d927 Alexander Potapenko    2021-02-25  3290  slab_alloc(struct kmem_cache *cachep, gfp_t flags, size_t orig_size, unsigned long caller)
8c8cc2c10c2194 Pekka Enberg           2007-02-10  3291  {
8c8cc2c10c2194 Pekka Enberg           2007-02-10  3292  	unsigned long save_flags;
8c8cc2c10c2194 Pekka Enberg           2007-02-10  3293  	void *objp;
964d4bd370d559 Roman Gushchin         2020-08-06  3294  	struct obj_cgroup *objcg = NULL;
da844b78724519 Andrey Konovalov       2021-04-29  3295  	bool init = false;
8c8cc2c10c2194 Pekka Enberg           2007-02-10  3296  
dcce284a259373 Benjamin Herrenschmidt 2009-06-18  3297  	flags &= gfp_allowed_mask;
964d4bd370d559 Roman Gushchin         2020-08-06  3298  	cachep = slab_pre_alloc_hook(cachep, &objcg, 1, flags);
011eceaf0ad54e Jesper Dangaard Brouer 2016-03-15  3299  	if (unlikely(!cachep))
824ebef122153a Akinobu Mita           2007-05-06  3300  		return NULL;
824ebef122153a Akinobu Mita           2007-05-06  3301  
d3fb45f370d927 Alexander Potapenko    2021-02-25  3302  	objp = kfence_alloc(cachep, orig_size, flags);
d3fb45f370d927 Alexander Potapenko    2021-02-25  3303  	if (unlikely(objp))
d3fb45f370d927 Alexander Potapenko    2021-02-25  3304  		goto out;
d3fb45f370d927 Alexander Potapenko    2021-02-25  3305  
8c8cc2c10c2194 Pekka Enberg           2007-02-10  3306  	cache_alloc_debugcheck_before(cachep, flags);
8c8cc2c10c2194 Pekka Enberg           2007-02-10  3307  	local_irq_save(save_flags);
8c8cc2c10c2194 Pekka Enberg           2007-02-10  3308  	objp = __do_cache_alloc(cachep, flags);
8c8cc2c10c2194 Pekka Enberg           2007-02-10  3309  	local_irq_restore(save_flags);
8c8cc2c10c2194 Pekka Enberg           2007-02-10 @3310  	objp = cache_alloc_debugcheck_after(cachep, flags, objp, caller);
8c8cc2c10c2194 Pekka Enberg           2007-02-10  3311  	prefetchw(objp);
da844b78724519 Andrey Konovalov       2021-04-29  3312  	init = slab_want_init_on_alloc(flags, cachep);
d07dbea46405b3 Christoph Lameter      2007-07-17  3313  
d3fb45f370d927 Alexander Potapenko    2021-02-25  3314  out:
da844b78724519 Andrey Konovalov       2021-04-29  3315  	slab_post_alloc_hook(cachep, objcg, flags, 1, &objp, init);
8c8cc2c10c2194 Pekka Enberg           2007-02-10  3316  	return objp;
8c8cc2c10c2194 Pekka Enberg           2007-02-10  3317  }
e498be7dafd72f Christoph Lameter      2005-09-09  3318  
e498be7dafd72f Christoph Lameter      2005-09-09  3319  /*
5f0985bb1123b4 Jianyu Zhan            2014-03-30  3320   * Caller needs to acquire correct kmem_cache_node's list_lock
97654dfa20caa5 Joonsoo Kim            2014-08-06  3321   * @list: List of detached free slabs should be freed by caller
e498be7dafd72f Christoph Lameter      2005-09-09  3322   */
97654dfa20caa5 Joonsoo Kim            2014-08-06  3323  static void free_block(struct kmem_cache *cachep, void **objpp,
97654dfa20caa5 Joonsoo Kim            2014-08-06  3324  			int nr_objects, int node, struct list_head *list)
^1da177e4c3f41 Linus Torvalds         2005-04-16  3325  {
^1da177e4c3f41 Linus Torvalds         2005-04-16  3326  	int i;
25c063fbd5512e Joonsoo Kim            2014-08-06  3327  	struct kmem_cache_node *n = get_node(cachep, node);
7981e67efb8590 Vlastimil Babka        2021-11-02  3328  	struct slab *slab;
6052b7880a9555 Joonsoo Kim            2016-05-19  3329  
6052b7880a9555 Joonsoo Kim            2016-05-19  3330  	n->free_objects += nr_objects;
^1da177e4c3f41 Linus Torvalds         2005-04-16  3331  
^1da177e4c3f41 Linus Torvalds         2005-04-16  3332  	for (i = 0; i < nr_objects; i++) {
072bb0aa5e0629 Mel Gorman             2012-07-31  3333  		void *objp;
7981e67efb8590 Vlastimil Babka        2021-11-02 @3334  		struct slab *slab;
^1da177e4c3f41 Linus Torvalds         2005-04-16  3335  
072bb0aa5e0629 Mel Gorman             2012-07-31  3336  		objp = objpp[i];
072bb0aa5e0629 Mel Gorman             2012-07-31  3337  
7981e67efb8590 Vlastimil Babka        2021-11-02  3338  		slab = virt_to_slab(objp);
7981e67efb8590 Vlastimil Babka        2021-11-02  3339  		list_del(&slab->slab_list);
ff69416e6323fe Christoph Lameter      2005-09-22  3340  		check_spinlock_acquired_node(cachep, node);
7981e67efb8590 Vlastimil Babka        2021-11-02  3341  		slab_put_obj(cachep, slab, objp);
^1da177e4c3f41 Linus Torvalds         2005-04-16  3342  		STATS_DEC_ACTIVE(cachep);
^1da177e4c3f41 Linus Torvalds         2005-04-16  3343  
^1da177e4c3f41 Linus Torvalds         2005-04-16  3344  		/* fixup slab chains */
7981e67efb8590 Vlastimil Babka        2021-11-02  3345  		if (slab->active == 0) {
7981e67efb8590 Vlastimil Babka        2021-11-02  3346  			list_add(&slab->slab_list, &n->slabs_free);
f728b0a5d72ae9 Greg Thelen            2016-12-12  3347  			n->free_slabs++;
f728b0a5d72ae9 Greg Thelen            2016-12-12  3348  		} else {
^1da177e4c3f41 Linus Torvalds         2005-04-16  3349  			/* Unconditionally move a slab to the end of the
^1da177e4c3f41 Linus Torvalds         2005-04-16  3350  			 * partial list on free - maximum time for the
^1da177e4c3f41 Linus Torvalds         2005-04-16  3351  			 * other objects to be freed, too.
^1da177e4c3f41 Linus Torvalds         2005-04-16  3352  			 */
7981e67efb8590 Vlastimil Babka        2021-11-02  3353  			list_add_tail(&slab->slab_list, &n->slabs_partial);
^1da177e4c3f41 Linus Torvalds         2005-04-16  3354  		}
^1da177e4c3f41 Linus Torvalds         2005-04-16  3355  	}
6052b7880a9555 Joonsoo Kim            2016-05-19  3356  
6052b7880a9555 Joonsoo Kim            2016-05-19  3357  	while (n->free_objects > n->free_limit && !list_empty(&n->slabs_free)) {
6052b7880a9555 Joonsoo Kim            2016-05-19  3358  		n->free_objects -= cachep->num;
6052b7880a9555 Joonsoo Kim            2016-05-19  3359  
7981e67efb8590 Vlastimil Babka        2021-11-02  3360  		slab = list_last_entry(&n->slabs_free, struct slab, slab_list);
7981e67efb8590 Vlastimil Babka        2021-11-02  3361  		list_move(&slab->slab_list, list);
f728b0a5d72ae9 Greg Thelen            2016-12-12  3362  		n->free_slabs--;
bf00bd3458041c David Rientjes         2016-12-12  3363  		n->total_slabs--;
6052b7880a9555 Joonsoo Kim            2016-05-19  3364  	}
^1da177e4c3f41 Linus Torvalds         2005-04-16  3365  }
^1da177e4c3f41 Linus Torvalds         2005-04-16  3366  

:::::: The code at line 3310 was first introduced by commit
:::::: 8c8cc2c10c21943dd3499a2df7aac835093b37f3 [PATCH] slab: cache alloc cleanups

:::::: TO: Pekka Enberg <penberg@cs.helsinki.fi>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
