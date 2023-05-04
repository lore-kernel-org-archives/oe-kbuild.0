Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DDF7E
	for <oe-kbuild@lists.linux.dev>; Thu,  4 May 2023 02:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683166677; x=1714702677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UJL4TdtCxC9BsblMymxw0IlVflSXk+1aB52jQFX8C2o=;
  b=Es8nrxpwlgLrqpsO7yq+607DQ907+6K1SzJQjNxbWf5dRYsuEY+8sjHE
   /mmHdzz9XQjkD0iYCHuwiJZiG4nAt5YxfRD7pTxeA7woXnBr2meiFrxLn
   Jeopx/F/dS2zUdIBMzvhALZKnSq0xRdrINf4wB5pbwg/+KHRrtliehwlx
   Ed0bgh/mr6+bDiSyhBg/tBci0mSBbict3luGidHwliSogfN6uQTPBsDBL
   26p0TwobQFEl8YweUI56Ivg+xKyCiCUgxjGH28QcbT5Xlr1sIy8ipPw+Q
   G/R7Na3vUNhybsOQZBGCJxpg4+k+b2fsXV9AdNmUDopOSYPEgKk0/iShC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="411987192"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="411987192"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 19:17:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="647146219"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="647146219"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 May 2023 19:17:43 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puOXO-0002Ss-2f;
	Thu, 04 May 2023 02:17:42 +0000
Date: Thu, 4 May 2023 10:17:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/base/regmap/regcache-maple.c:185 regcache_maple_drop()
 error: uninitialized symbol 'ret'.
Message-ID: <202305041044.OhP7ORwW-lkp@intel.com>
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
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fa31fc82fb775445c176e576304c4098222f47f2
commit: f033c26de5a5734625d2dd1dc196745fae186f1b regmap: Add maple tree based register cache
date:   4 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 weeks ago
config: nios2-randconfig-m031-20230503 (https://download.01.org/0day-ci/archive/20230504/202305041044.OhP7ORwW-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305041044.OhP7ORwW-lkp@intel.com/

New smatch warnings:
drivers/base/regmap/regcache-maple.c:185 regcache_maple_drop() error: uninitialized symbol 'ret'.
drivers/base/regmap/regcache-maple.c:216 regcache_maple_sync() error: uninitialized symbol 'ret'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/ret +185 drivers/base/regmap/regcache-maple.c

f033c26de5a573 Mark Brown 2023-03-30  106  
f033c26de5a573 Mark Brown 2023-03-30  107  static int regcache_maple_drop(struct regmap *map, unsigned int min,
f033c26de5a573 Mark Brown 2023-03-30  108  			       unsigned int max)
f033c26de5a573 Mark Brown 2023-03-30  109  {
f033c26de5a573 Mark Brown 2023-03-30  110  	struct maple_tree *mt = map->cache;
f033c26de5a573 Mark Brown 2023-03-30  111  	MA_STATE(mas, mt, min, max);
f033c26de5a573 Mark Brown 2023-03-30  112  	unsigned long *entry, *lower, *upper;
f033c26de5a573 Mark Brown 2023-03-30  113  	unsigned long lower_index, lower_last;
f033c26de5a573 Mark Brown 2023-03-30  114  	unsigned long upper_index, upper_last;
f033c26de5a573 Mark Brown 2023-03-30  115  	int ret;
f033c26de5a573 Mark Brown 2023-03-30  116  
f033c26de5a573 Mark Brown 2023-03-30  117  	lower = NULL;
f033c26de5a573 Mark Brown 2023-03-30  118  	upper = NULL;
f033c26de5a573 Mark Brown 2023-03-30  119  
f033c26de5a573 Mark Brown 2023-03-30  120  	mas_lock(&mas);
f033c26de5a573 Mark Brown 2023-03-30  121  
f033c26de5a573 Mark Brown 2023-03-30  122  	mas_for_each(&mas, entry, max) {
f033c26de5a573 Mark Brown 2023-03-30  123  		/*
f033c26de5a573 Mark Brown 2023-03-30  124  		 * This is safe because the regmap lock means the
f033c26de5a573 Mark Brown 2023-03-30  125  		 * Maple lock is redundant, but we need to take it due
f033c26de5a573 Mark Brown 2023-03-30  126  		 * to lockdep asserts in the maple tree code.
f033c26de5a573 Mark Brown 2023-03-30  127  		 */
f033c26de5a573 Mark Brown 2023-03-30  128  		mas_unlock(&mas);
f033c26de5a573 Mark Brown 2023-03-30  129  
f033c26de5a573 Mark Brown 2023-03-30  130  		/* Do we need to save any of this entry? */
f033c26de5a573 Mark Brown 2023-03-30  131  		if (mas.index < min) {
f033c26de5a573 Mark Brown 2023-03-30  132  			lower_index = mas.index;
f033c26de5a573 Mark Brown 2023-03-30  133  			lower_last = min -1;
f033c26de5a573 Mark Brown 2023-03-30  134  
f033c26de5a573 Mark Brown 2023-03-30  135  			lower = kmemdup(entry, ((min - mas.index) *
f033c26de5a573 Mark Brown 2023-03-30  136  						sizeof(unsigned long)),
f033c26de5a573 Mark Brown 2023-03-30  137  					GFP_KERNEL);
f033c26de5a573 Mark Brown 2023-03-30  138  			if (!lower) {
f033c26de5a573 Mark Brown 2023-03-30  139  				ret = -ENOMEM;
f033c26de5a573 Mark Brown 2023-03-30  140  				goto out;
f033c26de5a573 Mark Brown 2023-03-30  141  			}
f033c26de5a573 Mark Brown 2023-03-30  142  		}
f033c26de5a573 Mark Brown 2023-03-30  143  
f033c26de5a573 Mark Brown 2023-03-30  144  		if (mas.last > max) {
f033c26de5a573 Mark Brown 2023-03-30  145  			upper_index = max + 1;
f033c26de5a573 Mark Brown 2023-03-30  146  			upper_last = mas.last;
f033c26de5a573 Mark Brown 2023-03-30  147  
f033c26de5a573 Mark Brown 2023-03-30  148  			upper = kmemdup(&entry[max + 1],
f033c26de5a573 Mark Brown 2023-03-30  149  					((mas.last - max) *
f033c26de5a573 Mark Brown 2023-03-30  150  					 sizeof(unsigned long)),
f033c26de5a573 Mark Brown 2023-03-30  151  					GFP_KERNEL);
f033c26de5a573 Mark Brown 2023-03-30  152  			if (!upper) {
f033c26de5a573 Mark Brown 2023-03-30  153  				ret = -ENOMEM;
f033c26de5a573 Mark Brown 2023-03-30  154  				goto out;
f033c26de5a573 Mark Brown 2023-03-30  155  			}
f033c26de5a573 Mark Brown 2023-03-30  156  		}
f033c26de5a573 Mark Brown 2023-03-30  157  
f033c26de5a573 Mark Brown 2023-03-30  158  		kfree(entry);
f033c26de5a573 Mark Brown 2023-03-30  159  		mas_lock(&mas);
f033c26de5a573 Mark Brown 2023-03-30  160  		mas_erase(&mas);
f033c26de5a573 Mark Brown 2023-03-30  161  
f033c26de5a573 Mark Brown 2023-03-30  162  		/* Insert new nodes with the saved data */
f033c26de5a573 Mark Brown 2023-03-30  163  		if (lower) {
f033c26de5a573 Mark Brown 2023-03-30  164  			mas_set_range(&mas, lower_index, lower_last);
f033c26de5a573 Mark Brown 2023-03-30  165  			ret = mas_store_gfp(&mas, lower, GFP_KERNEL);
f033c26de5a573 Mark Brown 2023-03-30  166  			if (ret != 0)
f033c26de5a573 Mark Brown 2023-03-30  167  				goto out;
f033c26de5a573 Mark Brown 2023-03-30  168  			lower = NULL;
f033c26de5a573 Mark Brown 2023-03-30  169  		}
f033c26de5a573 Mark Brown 2023-03-30  170  
f033c26de5a573 Mark Brown 2023-03-30  171  		if (upper) {
f033c26de5a573 Mark Brown 2023-03-30  172  			mas_set_range(&mas, upper_index, upper_last);
f033c26de5a573 Mark Brown 2023-03-30  173  			ret = mas_store_gfp(&mas, upper, GFP_KERNEL);
f033c26de5a573 Mark Brown 2023-03-30  174  			if (ret != 0)
f033c26de5a573 Mark Brown 2023-03-30  175  				goto out;
f033c26de5a573 Mark Brown 2023-03-30  176  			upper = NULL;
f033c26de5a573 Mark Brown 2023-03-30  177  		}
f033c26de5a573 Mark Brown 2023-03-30  178  	}
f033c26de5a573 Mark Brown 2023-03-30  179  
f033c26de5a573 Mark Brown 2023-03-30  180  out:
f033c26de5a573 Mark Brown 2023-03-30  181  	mas_unlock(&mas);
f033c26de5a573 Mark Brown 2023-03-30  182  	kfree(lower);
f033c26de5a573 Mark Brown 2023-03-30  183  	kfree(upper);
f033c26de5a573 Mark Brown 2023-03-30  184  
f033c26de5a573 Mark Brown 2023-03-30 @185  	return ret;
f033c26de5a573 Mark Brown 2023-03-30  186  }
f033c26de5a573 Mark Brown 2023-03-30  187  
f033c26de5a573 Mark Brown 2023-03-30  188  static int regcache_maple_sync(struct regmap *map, unsigned int min,
f033c26de5a573 Mark Brown 2023-03-30  189  			       unsigned int max)
f033c26de5a573 Mark Brown 2023-03-30  190  {
f033c26de5a573 Mark Brown 2023-03-30  191  	struct maple_tree *mt = map->cache;
f033c26de5a573 Mark Brown 2023-03-30  192  	unsigned long *entry;
f033c26de5a573 Mark Brown 2023-03-30  193  	MA_STATE(mas, mt, min, max);
f033c26de5a573 Mark Brown 2023-03-30  194  	unsigned long lmin = min;
f033c26de5a573 Mark Brown 2023-03-30  195  	unsigned long lmax = max;
f033c26de5a573 Mark Brown 2023-03-30  196  	unsigned int r;
f033c26de5a573 Mark Brown 2023-03-30  197  	int ret;
f033c26de5a573 Mark Brown 2023-03-30  198  
f033c26de5a573 Mark Brown 2023-03-30  199  	map->cache_bypass = true;
f033c26de5a573 Mark Brown 2023-03-30  200  
f033c26de5a573 Mark Brown 2023-03-30  201  	rcu_read_lock();
f033c26de5a573 Mark Brown 2023-03-30  202  
f033c26de5a573 Mark Brown 2023-03-30  203  	mas_for_each(&mas, entry, max) {
f033c26de5a573 Mark Brown 2023-03-30  204  		for (r = max(mas.index, lmin); r <= min(mas.last, lmax); r++) {
f033c26de5a573 Mark Brown 2023-03-30  205  			ret = regcache_sync_val(map, r, entry[r - mas.index]);
f033c26de5a573 Mark Brown 2023-03-30  206  			if (ret != 0)
f033c26de5a573 Mark Brown 2023-03-30  207  				goto out;
f033c26de5a573 Mark Brown 2023-03-30  208  		}
f033c26de5a573 Mark Brown 2023-03-30  209  	}
f033c26de5a573 Mark Brown 2023-03-30  210  
f033c26de5a573 Mark Brown 2023-03-30  211  out:
f033c26de5a573 Mark Brown 2023-03-30  212  	rcu_read_unlock();
f033c26de5a573 Mark Brown 2023-03-30  213  
f033c26de5a573 Mark Brown 2023-03-30  214  	map->cache_bypass = false;
f033c26de5a573 Mark Brown 2023-03-30  215  
f033c26de5a573 Mark Brown 2023-03-30 @216  	return ret;
f033c26de5a573 Mark Brown 2023-03-30  217  }
f033c26de5a573 Mark Brown 2023-03-30  218  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
