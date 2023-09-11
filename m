Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9310BE67
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694432231; x=1725968231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9f/Hgnqi1dQM3yvos6lKAdgWuamyWJwaPcHj2IMYsjk=;
  b=cSYuGgnbDpMzoX8hLPssINAyNarE3XhBlCPvLQi6RhsVjyFLvEZdNDSF
   PX756NlmjcyyKtI9GJCvmYmC3nYaJnVmSrRZi3lHtqv1nvENhorwaGfFk
   K4sMw7TmIrj9h7BwFUcAZR0b9ENAZl6fuZr3bw/PmcimTUFLaCNW8zjir
   j+drVQzJSBWQKtNfLf6PRGAi88s0W8HKZmRluw/y2E8pNFngtNattJDzn
   S13Or3Y9qYDfH5dSbRgwZsYUPR4HiVPvCa9yXm4dIb+NaGR5Q9eZTKnGV
   qiNYxGvDHj6LW/7tty8HooQg5oR8ZtEIKe90lURVpjAG0oNEdRlq6GOaP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="358361010"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="358361010"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 04:37:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="778359701"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="778359701"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Sep 2023 04:37:01 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qffDv-0006AA-26;
	Mon, 11 Sep 2023 11:36:59 +0000
Date: Mon, 11 Sep 2023 19:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/slub.c:571 __slab_update_freelist() warn: bitwise AND condition
 is false here
Message-ID: <202309111927.iYOIXSWs-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Mark Rutland <mark.rutland@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: 6801be4f2653e5fdddca73b527cf0728284ba8a3 slub: Replace cmpxchg_double()
date:   3 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 months ago
config: openrisc-randconfig-r071-20230906 (https://download.01.org/0day-ci/archive/20230911/202309111927.iYOIXSWs-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309111927.iYOIXSWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309111927.iYOIXSWs-lkp@intel.com/

smatch warnings:
mm/slub.c:571 __slab_update_freelist() warn: bitwise AND condition is false here
mm/slub.c:598 slab_update_freelist() warn: bitwise AND condition is false here

vim +571 mm/slub.c

6801be4f2653e5 Peter Zijlstra    2023-05-31  553  
a2b4ae8bfd9c10 Vlastimil Babka   2021-06-04  554  /*
a2b4ae8bfd9c10 Vlastimil Babka   2021-06-04  555   * Interrupts must be disabled (for the fallback code to work right), typically
5875e59828a026 Vlastimil Babka   2022-08-23  556   * by an _irqsave() lock variant. On PREEMPT_RT the preempt_disable(), which is
5875e59828a026 Vlastimil Babka   2022-08-23  557   * part of bit_spin_lock(), is sufficient because the policy is not to allow any
5875e59828a026 Vlastimil Babka   2022-08-23  558   * allocation/ free operation in hardirq context. Therefore nothing can
5875e59828a026 Vlastimil Babka   2022-08-23  559   * interrupt the operation.
a2b4ae8bfd9c10 Vlastimil Babka   2021-06-04  560   */
6801be4f2653e5 Peter Zijlstra    2023-05-31  561  static inline bool __slab_update_freelist(struct kmem_cache *s, struct slab *slab,
1d07171c5e58e6 Christoph Lameter 2011-07-14  562  		void *freelist_old, unsigned long counters_old,
1d07171c5e58e6 Christoph Lameter 2011-07-14  563  		void *freelist_new, unsigned long counters_new,
1d07171c5e58e6 Christoph Lameter 2011-07-14  564  		const char *n)
1d07171c5e58e6 Christoph Lameter 2011-07-14  565  {
6801be4f2653e5 Peter Zijlstra    2023-05-31  566  	bool ret;
6801be4f2653e5 Peter Zijlstra    2023-05-31  567  
1f04b07d976da0 Thomas Gleixner   2022-08-25  568  	if (USE_LOCKLESS_FAST_PATH())
a2b4ae8bfd9c10 Vlastimil Babka   2021-06-04  569  		lockdep_assert_irqs_disabled();
6801be4f2653e5 Peter Zijlstra    2023-05-31  570  
1d07171c5e58e6 Christoph Lameter 2011-07-14 @571  	if (s->flags & __CMPXCHG_DOUBLE) {
6801be4f2653e5 Peter Zijlstra    2023-05-31  572  		ret = __update_freelist_fast(slab, freelist_old, counters_old,
6801be4f2653e5 Peter Zijlstra    2023-05-31  573  				            freelist_new, counters_new);
6801be4f2653e5 Peter Zijlstra    2023-05-31  574  	} else {
6801be4f2653e5 Peter Zijlstra    2023-05-31  575  		ret = __update_freelist_slow(slab, freelist_old, counters_old,
6801be4f2653e5 Peter Zijlstra    2023-05-31  576  				            freelist_new, counters_new);
1d07171c5e58e6 Christoph Lameter 2011-07-14  577  	}
6801be4f2653e5 Peter Zijlstra    2023-05-31  578  	if (likely(ret))
6801be4f2653e5 Peter Zijlstra    2023-05-31  579  		return true;
1d07171c5e58e6 Christoph Lameter 2011-07-14  580  
1d07171c5e58e6 Christoph Lameter 2011-07-14  581  	cpu_relax();
1d07171c5e58e6 Christoph Lameter 2011-07-14  582  	stat(s, CMPXCHG_DOUBLE_FAIL);
1d07171c5e58e6 Christoph Lameter 2011-07-14  583  
1d07171c5e58e6 Christoph Lameter 2011-07-14  584  #ifdef SLUB_DEBUG_CMPXCHG
f9f58285947d9c Fabian Frederick  2014-06-04  585  	pr_info("%s %s: cmpxchg double redo ", n, s->name);
1d07171c5e58e6 Christoph Lameter 2011-07-14  586  #endif
1d07171c5e58e6 Christoph Lameter 2011-07-14  587  
6f6528a1632cb9 Joe Perches       2015-04-14  588  	return false;
1d07171c5e58e6 Christoph Lameter 2011-07-14  589  }
1d07171c5e58e6 Christoph Lameter 2011-07-14  590  
6801be4f2653e5 Peter Zijlstra    2023-05-31  591  static inline bool slab_update_freelist(struct kmem_cache *s, struct slab *slab,
b789ef518b2a72 Christoph Lameter 2011-06-01  592  		void *freelist_old, unsigned long counters_old,
b789ef518b2a72 Christoph Lameter 2011-06-01  593  		void *freelist_new, unsigned long counters_new,
b789ef518b2a72 Christoph Lameter 2011-06-01  594  		const char *n)
b789ef518b2a72 Christoph Lameter 2011-06-01  595  {
6801be4f2653e5 Peter Zijlstra    2023-05-31  596  	bool ret;
6801be4f2653e5 Peter Zijlstra    2023-05-31  597  
b789ef518b2a72 Christoph Lameter 2011-06-01 @598  	if (s->flags & __CMPXCHG_DOUBLE) {
6801be4f2653e5 Peter Zijlstra    2023-05-31  599  		ret = __update_freelist_fast(slab, freelist_old, counters_old,
6801be4f2653e5 Peter Zijlstra    2023-05-31  600  				            freelist_new, counters_new);
6801be4f2653e5 Peter Zijlstra    2023-05-31  601  	} else {
1d07171c5e58e6 Christoph Lameter 2011-07-14  602  		unsigned long flags;
1d07171c5e58e6 Christoph Lameter 2011-07-14  603  
1d07171c5e58e6 Christoph Lameter 2011-07-14  604  		local_irq_save(flags);
6801be4f2653e5 Peter Zijlstra    2023-05-31  605  		ret = __update_freelist_slow(slab, freelist_old, counters_old,
6801be4f2653e5 Peter Zijlstra    2023-05-31  606  				            freelist_new, counters_new);
1d07171c5e58e6 Christoph Lameter 2011-07-14  607  		local_irq_restore(flags);
b789ef518b2a72 Christoph Lameter 2011-06-01  608  	}
6801be4f2653e5 Peter Zijlstra    2023-05-31  609  	if (likely(ret))
6801be4f2653e5 Peter Zijlstra    2023-05-31  610  		return true;
b789ef518b2a72 Christoph Lameter 2011-06-01  611  
b789ef518b2a72 Christoph Lameter 2011-06-01  612  	cpu_relax();
b789ef518b2a72 Christoph Lameter 2011-06-01  613  	stat(s, CMPXCHG_DOUBLE_FAIL);
b789ef518b2a72 Christoph Lameter 2011-06-01  614  

:::::: The code at line 571 was first introduced by commit
:::::: 1d07171c5e58e68a76a141970a3a5e816a414ce6 slub: disable interrupts in cmpxchg_double_slab when falling back to pagelock

:::::: TO: Christoph Lameter <cl@linux.com>
:::::: CC: Pekka Enberg <penberg@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
