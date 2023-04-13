Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52A933CC
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Apr 2023 10:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681381670; x=1712917670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S35VRKNzsIQjpZYUip/I535OSi9UyRCwKpcPFWjhJz8=;
  b=bxavEAQgsepdk3WwHMD3J5kRDhgUfpANa9JPVl4edzAq/Vjf+xQP3SFB
   4alNYUdIUFt8A4LQXL03qIK+OVhQMFcWHJ7KJ8va0zsVGkFajyK97BT+2
   1OHHREc4IaDIOW6YZEXuYp/irpfEoqWpIJOp2fMaOn+DRtOVs2c0Is363
   J0RjLUG2BpifcgjCOBh4saetSt2FWx14P/e4IPMUTOnIPohyPl0EioVOB
   KiOefGMHoTwhmLpAuKmpaTvvpo2iMP2Diai9oJzw6oB+O/mcejiTce3Ye
   ccGENrP+AHyuw91EdaN6hA6zfOih9uYD8w88OXFddWEgrhe3WVRgkSpIC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="345938234"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="345938234"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 03:27:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="833090075"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="833090075"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2023 03:27:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmuB7-000Yc1-2j;
	Thu, 13 Apr 2023 10:27:45 +0000
Date: Thu, 13 Apr 2023 18:26:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:core/wip-u128 8/10] mm/slub.c:572
 __slab_update_freelist() warn: bitwise AND condition is false here
Message-ID: <202304131828.RHhix4ak-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/wip-u128
head:   dcdbef194e98fa57a618ef991b905abb3c292291
commit: 13d7b4085549789316d5d88fcf9295c9f0b1cd91 [8/10] slub: Replace cmpxchg_double()
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: xtensa-randconfig-m041-20230411 (https://download.01.org/0day-ci/archive/20230413/202304131828.RHhix4ak-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304131828.RHhix4ak-lkp@intel.com/

New smatch warnings:
mm/slub.c:572 __slab_update_freelist() warn: bitwise AND condition is false here
mm/slub.c:599 slab_update_freelist() warn: bitwise AND condition is false here

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +572 mm/slub.c

13d7b408554978 Peter Zijlstra    2022-11-28  554  
a2b4ae8bfd9c10 Vlastimil Babka   2021-06-04  555  /*
a2b4ae8bfd9c10 Vlastimil Babka   2021-06-04  556   * Interrupts must be disabled (for the fallback code to work right), typically
5875e59828a026 Vlastimil Babka   2022-08-23  557   * by an _irqsave() lock variant. On PREEMPT_RT the preempt_disable(), which is
5875e59828a026 Vlastimil Babka   2022-08-23  558   * part of bit_spin_lock(), is sufficient because the policy is not to allow any
5875e59828a026 Vlastimil Babka   2022-08-23  559   * allocation/ free operation in hardirq context. Therefore nothing can
5875e59828a026 Vlastimil Babka   2022-08-23  560   * interrupt the operation.
a2b4ae8bfd9c10 Vlastimil Babka   2021-06-04  561   */
13d7b408554978 Peter Zijlstra    2022-11-28  562  static inline bool __slab_update_freelist(struct kmem_cache *s, struct slab *slab,
1d07171c5e58e6 Christoph Lameter 2011-07-14  563  		void *freelist_old, unsigned long counters_old,
1d07171c5e58e6 Christoph Lameter 2011-07-14  564  		void *freelist_new, unsigned long counters_new,
1d07171c5e58e6 Christoph Lameter 2011-07-14  565  		const char *n)
1d07171c5e58e6 Christoph Lameter 2011-07-14  566  {
13d7b408554978 Peter Zijlstra    2022-11-28  567  	bool ret;
13d7b408554978 Peter Zijlstra    2022-11-28  568  
1f04b07d976da0 Thomas Gleixner   2022-08-25  569  	if (USE_LOCKLESS_FAST_PATH())
a2b4ae8bfd9c10 Vlastimil Babka   2021-06-04  570  		lockdep_assert_irqs_disabled();
13d7b408554978 Peter Zijlstra    2022-11-28  571  
1d07171c5e58e6 Christoph Lameter 2011-07-14 @572  	if (s->flags & __CMPXCHG_DOUBLE) {
13d7b408554978 Peter Zijlstra    2022-11-28  573  		ret = __update_freelist_fast(slab, freelist_old, counters_old,
13d7b408554978 Peter Zijlstra    2022-11-28  574  				            freelist_new, counters_new);
13d7b408554978 Peter Zijlstra    2022-11-28  575  	} else {
13d7b408554978 Peter Zijlstra    2022-11-28  576  		ret = __update_freelist_slow(slab, freelist_old, counters_old,
13d7b408554978 Peter Zijlstra    2022-11-28  577  				            freelist_new, counters_new);
1d07171c5e58e6 Christoph Lameter 2011-07-14  578  	}
13d7b408554978 Peter Zijlstra    2022-11-28  579  	if (likely(ret))
13d7b408554978 Peter Zijlstra    2022-11-28  580  		return true;
1d07171c5e58e6 Christoph Lameter 2011-07-14  581  
1d07171c5e58e6 Christoph Lameter 2011-07-14  582  	cpu_relax();
1d07171c5e58e6 Christoph Lameter 2011-07-14  583  	stat(s, CMPXCHG_DOUBLE_FAIL);
1d07171c5e58e6 Christoph Lameter 2011-07-14  584  
1d07171c5e58e6 Christoph Lameter 2011-07-14  585  #ifdef SLUB_DEBUG_CMPXCHG
f9f58285947d9c Fabian Frederick  2014-06-04  586  	pr_info("%s %s: cmpxchg double redo ", n, s->name);
1d07171c5e58e6 Christoph Lameter 2011-07-14  587  #endif
1d07171c5e58e6 Christoph Lameter 2011-07-14  588  
6f6528a1632cb9 Joe Perches       2015-04-14  589  	return false;
1d07171c5e58e6 Christoph Lameter 2011-07-14  590  }
1d07171c5e58e6 Christoph Lameter 2011-07-14  591  
13d7b408554978 Peter Zijlstra    2022-11-28  592  static inline bool slab_update_freelist(struct kmem_cache *s, struct slab *slab,
b789ef518b2a72 Christoph Lameter 2011-06-01  593  		void *freelist_old, unsigned long counters_old,
b789ef518b2a72 Christoph Lameter 2011-06-01  594  		void *freelist_new, unsigned long counters_new,
b789ef518b2a72 Christoph Lameter 2011-06-01  595  		const char *n)
b789ef518b2a72 Christoph Lameter 2011-06-01  596  {
13d7b408554978 Peter Zijlstra    2022-11-28  597  	bool ret;
13d7b408554978 Peter Zijlstra    2022-11-28  598  
b789ef518b2a72 Christoph Lameter 2011-06-01 @599  	if (s->flags & __CMPXCHG_DOUBLE) {
13d7b408554978 Peter Zijlstra    2022-11-28  600  		ret = __update_freelist_fast(slab, freelist_old, counters_old,
13d7b408554978 Peter Zijlstra    2022-11-28  601  				            freelist_new, counters_new);
13d7b408554978 Peter Zijlstra    2022-11-28  602  	} else {
1d07171c5e58e6 Christoph Lameter 2011-07-14  603  		unsigned long flags;
1d07171c5e58e6 Christoph Lameter 2011-07-14  604  
1d07171c5e58e6 Christoph Lameter 2011-07-14  605  		local_irq_save(flags);
13d7b408554978 Peter Zijlstra    2022-11-28  606  		ret = __update_freelist_slow(slab, freelist_old, counters_old,
13d7b408554978 Peter Zijlstra    2022-11-28  607  				            freelist_new, counters_new);
1d07171c5e58e6 Christoph Lameter 2011-07-14  608  		local_irq_restore(flags);
b789ef518b2a72 Christoph Lameter 2011-06-01  609  	}
13d7b408554978 Peter Zijlstra    2022-11-28  610  	if (likely(ret))
13d7b408554978 Peter Zijlstra    2022-11-28  611  		return true;
b789ef518b2a72 Christoph Lameter 2011-06-01  612  
b789ef518b2a72 Christoph Lameter 2011-06-01  613  	cpu_relax();
b789ef518b2a72 Christoph Lameter 2011-06-01  614  	stat(s, CMPXCHG_DOUBLE_FAIL);
b789ef518b2a72 Christoph Lameter 2011-06-01  615  

:::::: The code at line 572 was first introduced by commit
:::::: 1d07171c5e58e68a76a141970a3a5e816a414ce6 slub: disable interrupts in cmpxchg_double_slab when falling back to pagelock

:::::: TO: Christoph Lameter <cl@linux.com>
:::::: CC: Pekka Enberg <penberg@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
