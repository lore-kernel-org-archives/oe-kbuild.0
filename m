Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFAB53A0
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Feb 2023 21:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677273911; x=1708809911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=12x7vxLV2jWFDRA1P6LoeasEcgKq+Oyo6ZfV+08aaNE=;
  b=fa/MDpNOvUFSSWQvLawHP2IS7e7KalbckmZBSkXK7s7+ZDQtB4/MZypY
   fognfRWTs1v7NS5GTyWZAIWwL4ukRxY8IC2zPjbulJ7BeqEuE9b6h85zs
   pmIYJQhBXzfV5hXZGnxzW8V/sYQSucnPeRFdGzJ5ZdpJqjAL8MFzlF4dA
   xViBixJr1DDnrh9Nd8LDkZtfEcKeE+Yj5XgMYDdNuaGY350Pjlw4+6243
   AOcU4OhfCeEKWmiEZC++5sDvA1kps4b9OlThPMmlb0kPFL917p59mlWvO
   2wSKiFXxZ+wZsCpPaAMY5EGiQfV5PwT0wEdVmNP9heKLTcZyNGRL9BwFS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="396094664"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="396094664"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 13:25:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="782517015"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="782517015"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2023 13:25:08 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVfYx-0002jb-2l;
	Fri, 24 Feb 2023 21:25:07 +0000
Date: Sat, 25 Feb 2023 05:24:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/page-writeback.c:1413:28: warning: shift by negative count ('-1')
Message-ID: <202302250542.DrZaQQ8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem: mm/page-writeback.c:1413:28: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2980d8d826554fa6981d621e569a453787472f8
commit: f334f5668bedf7307f6df1d98b14f55902931926 ilog2: force inlining of __ilog2_u32() and __ilog2_u64()
date:   11 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20230222 (https://download.01.org/0day-ci/archive/20230225/202302250542.DrZaQQ8x-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f334f5668bedf7307f6df1d98b14f55902931926
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f334f5668bedf7307f6df1d98b14f55902931926
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302250542.DrZaQQ8x-lkp@intel.com/

gcc_analyzer warnings: (new ones prefixed by >>)
       |      |      |
       |      |      (1) entry to 'wb_over_bg_thresh'
       |
     'wb_over_bg_thresh': event 2
       |
       |include/linux/compiler.h:56:26:
       |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
       |      |                          ^
       |      |                          |
       |      |                          (2) following 'false' branch...
   mm/page-writeback.c:1960:9: note: in expansion of macro 'if'
       | 1960 |         if (gdtc->dirty > gdtc->bg_thresh)
       |      |         ^~
       |
     'wb_over_bg_thresh': events 3-4
       |
       | 1963 |         thresh = wb_calc_thresh(gdtc->wb, gdtc->bg_thresh);
       |      |         ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |        |
       |      |         |        (4) calling 'wb_calc_thresh' from 'wb_over_bg_thresh'
       |      |         (3) ...to here
       |
       +--> 'wb_calc_thresh': events 5-6
              |
              |  779 | unsigned long wb_calc_thresh(struct bdi_writeback *wb, unsigned long thresh)
              |      |               ^~~~~~~~~~~~~~
              |      |               |
              |      |               (5) entry to 'wb_calc_thresh'
              |......
              |  783 |         return __wb_calc_thresh(&gdtc);
              |      |                ~~~~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (6) calling '__wb_calc_thresh' from 'wb_calc_thresh'
              |
              +--> '__wb_calc_thresh': events 7-8
                     |
                     |  752 | static unsigned long __wb_calc_thresh(struct dirty_throttle_control *dtc)
                     |      |                      ^~~~~~~~~~~~~~~~
                     |      |                      |
                     |      |                      (7) entry to '__wb_calc_thresh'
                     |......
                     |  757 |         unsigned long numerator, denominator;
                     |      |                       ~~~~~~~~~
                     |      |                       |
                     |      |                       (8) use of uninitialized value '<unknown>' here
                     |
   mm/page-writeback.c:757:34: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     757 |         unsigned long numerator, denominator;
         |                                  ^~~~~~~~~~~
     'wb_over_bg_thresh': event 1
       |
       | 1942 | bool wb_over_bg_thresh(struct bdi_writeback *wb)
       |      |      ^~~~~~~~~~~~~~~~~
       |      |      |
       |      |      (1) entry to 'wb_over_bg_thresh'
       |
     'wb_over_bg_thresh': event 2
       |
       |include/linux/compiler.h:56:26:
       |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
       |      |                          ^
       |      |                          |
       |      |                          (2) following 'false' branch...
   mm/page-writeback.c:1960:9: note: in expansion of macro 'if'
       | 1960 |         if (gdtc->dirty > gdtc->bg_thresh)
       |      |         ^~
       |
     'wb_over_bg_thresh': events 3-4
       |
       | 1963 |         thresh = wb_calc_thresh(gdtc->wb, gdtc->bg_thresh);
       |      |         ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |        |
       |      |         |        (4) calling 'wb_calc_thresh' from 'wb_over_bg_thresh'
       |      |         (3) ...to here
       |
       +--> 'wb_calc_thresh': events 5-6
              |
              |  779 | unsigned long wb_calc_thresh(struct bdi_writeback *wb, unsigned long thresh)
              |      |               ^~~~~~~~~~~~~~
              |      |               |
              |      |               (5) entry to 'wb_calc_thresh'
              |......
              |  783 |         return __wb_calc_thresh(&gdtc);
              |      |                ~~~~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (6) calling '__wb_calc_thresh' from 'wb_calc_thresh'
              |
              +--> '__wb_calc_thresh': events 7-8
                     |
                     |  752 | static unsigned long __wb_calc_thresh(struct dirty_throttle_control *dtc)
                     |      |                      ^~~~~~~~~~~~~~~~
                     |      |                      |
                     |      |                      (7) entry to '__wb_calc_thresh'
                     |......
                     |  757 |         unsigned long numerator, denominator;
                     |      |                                  ~~~~~~~~~~~
                     |      |                                  |
                     |      |                                  (8) use of uninitialized value '<unknown>' here
                     |
   mm/page-writeback.c: In function 'dirty_poll_interval.part.0':
>> mm/page-writeback.c:1413:28: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]
    1413 |                 return 1UL << (ilog2(thresh - dirty) >> 1);
         |                        ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'dirty_poll_interval.part.0': event 1
       |
       | 1413 |                 return 1UL << (ilog2(thresh - dirty) >> 1);
       |      |                        ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                            |
       |      |                            (1) following 'false' branch...
       |
     'dirty_poll_interval.part.0': event 2
       |
       |include/linux/log2.h:24:9:
       |   24 |         return fls(n) - 1;
       |      |         ^~~~~~
       |      |         |
       |      |         (2) ...to here
       |
     'dirty_poll_interval.part.0': event 3
       |
       |include/asm-generic/bitops/builtin-fls.h:14:53:
       |   14 |         return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
       |      |                                                     |
       |      |                                                     (3) following 'false' branch...
       |
     'dirty_poll_interval.part.0': event 4
       |
       |include/linux/log2.h:24:23:
       |   24 |         return fls(n) - 1;
       |      |                ~~~~~~~^~~
       |      |                       |
       |      |                       (4) ...to here
       |
     'dirty_poll_interval.part.0': event 5
       |
       |mm/page-writeback.c:1413:28:
       | 1413 |                 return 1UL << (ilog2(thresh - dirty) >> 1);
       |      |                        ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                            |
       |      |                            (5) shift by negative amount here ('-1')
       |
   mm/page-writeback.c: In function 'balance_dirty_pages':
   mm/page-writeback.c:1574:13: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1574 |         int nr_dirtied_pause;
         |             ^~~~~~~~~~~~~~~~
     'balance_dirty_pages_ratelimited': event 1
       |
       | 1878 | void balance_dirty_pages_ratelimited(struct address_space *mapping)
       |      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |      |
       |      |      (1) entry to 'balance_dirty_pages_ratelimited'
       |
     'balance_dirty_pages_ratelimited': event 2
       |
       |include/linux/compiler.h:56:26:
       |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
       |      |                          ^
       |      |                          |
       |      |                          (2) following 'false' branch...
   mm/page-writeback.c:1886:9: note: in expansion of macro 'if'
       | 1886 |         if (!(bdi->capabilities & BDI_CAP_WRITEBACK))
       |      |         ^~
       |
     'balance_dirty_pages_ratelimited': event 3
       |
       |include/linux/compiler.h:56:23:
       |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
       |      |                       ^~
       |      |                       |
       |      |                       (3) ...to here
   mm/page-writeback.c:1889:9: note: in expansion of macro 'if'
       | 1889 |         if (inode_cgwb_enabled(inode))
       |      |         ^~
       |
     'balance_dirty_pages_ratelimited': event 4
       |
       |include/linux/compiler.h:70:46:
       |   69 |         (cond) ?                                        \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |   70 |                 (__if_trace.miss_hit[1]++,1) :          \
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
       |      |                                              |
       |      |                                              (4) following 'true' branch (when '______r != 0')...
       |   71 |                 (__if_trace.miss_hit[0]++,0);           \
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
   include/linux/compiler.h:58:69: note: in expansion of macro '__trace_if_value'
       |   58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
       |      |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
       |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
       |      |                            ^~~~~~~~~~~~~~
   mm/page-writeback.c:1926:9: note: in expansion of macro 'if'
       | 1926 |         if (unlikely(current->nr_dirtied >= ratelimit))
       |      |         ^~
       |
     'balance_dirty_pages_ratelimited': event 5
       |
       |include/linux/compiler.h:70:37:
       |   70 |                 (__if_trace.miss_hit[1]++,1) :          \
       |      |                  ~~~~~~~~~~~~~~~~~~~^~~

vim +1413 mm/page-writeback.c

e98be2d599207c6 Wu Fengguang 2010-08-29  1400  
9d823e8f6b1b7b3 Wu Fengguang 2011-06-11  1401  /*
d0e1d66b5aa1ec9 Namjae Jeon  2012-12-11  1402   * After a task dirtied this many pages, balance_dirty_pages_ratelimited()
9d823e8f6b1b7b3 Wu Fengguang 2011-06-11  1403   * will look to see if it needs to start dirty throttling.
9d823e8f6b1b7b3 Wu Fengguang 2011-06-11  1404   *
9d823e8f6b1b7b3 Wu Fengguang 2011-06-11  1405   * If dirty_poll_interval is too low, big NUMA machines will call the expensive
c41f012ade0b95b Michal Hocko 2017-09-06  1406   * global_zone_page_state() too often. So scale it near-sqrt to the safety margin
9d823e8f6b1b7b3 Wu Fengguang 2011-06-11  1407   * (the number of pages we may dirty without exceeding the dirty limits).
9d823e8f6b1b7b3 Wu Fengguang 2011-06-11  1408   */
9d823e8f6b1b7b3 Wu Fengguang 2011-06-11  1409  static unsigned long dirty_poll_interval(unsigned long dirty,
9d823e8f6b1b7b3 Wu Fengguang 2011-06-11  1410  					 unsigned long thresh)
9d823e8f6b1b7b3 Wu Fengguang 2011-06-11  1411  {
9d823e8f6b1b7b3 Wu Fengguang 2011-06-11  1412  	if (thresh > dirty)
9d823e8f6b1b7b3 Wu Fengguang 2011-06-11 @1413  		return 1UL << (ilog2(thresh - dirty) >> 1);
9d823e8f6b1b7b3 Wu Fengguang 2011-06-11  1414  
9d823e8f6b1b7b3 Wu Fengguang 2011-06-11  1415  	return 1;
9d823e8f6b1b7b3 Wu Fengguang 2011-06-11  1416  }
9d823e8f6b1b7b3 Wu Fengguang 2011-06-11  1417  

:::::: The code at line 1413 was first introduced by commit
:::::: 9d823e8f6b1b7b39f952d7d1795f29162143a433 writeback: per task dirty rate limit

:::::: TO: Wu Fengguang <fengguang.wu@intel.com>
:::::: CC: Wu Fengguang <fengguang.wu@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
