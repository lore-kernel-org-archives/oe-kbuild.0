Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8F623
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 02:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693707521; x=1725243521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eD/i5wd0wQeYugbHlNt65sEnlPCcWELJR0eyPUlOAF8=;
  b=j9r/3fGM5qcssn1XwwGcUgjxqTnmKUQNOZfr4H19c//TcycrGfxByuin
   aVmisLuAFuxM74cJAbTtewRkSuzjpQaiSz8JH7BzCI5EfYbdHxrIWCfqi
   +QpOMUQJVwH+xXg6pyPIMp/DVkdIiOt/FONXtg8oNNq0xi0q/kv2N0Axk
   tpd3v6MjQH6DNlzwL7IO6meUpo+YR29gZNdc107bDIUjTm/mVtVcZLwRI
   WOnD1X5Z9JYh5RA4iHnLaFzV+Hxaj0t5gFAQJbm/VE5tBPcDNWPz31q66
   W7qOmsQlIKC2vv0uUKFWxNWofBkaeg3elBCEPQaZbPQDYWKBUNvACToSt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="356729709"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="356729709"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 19:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="743561715"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="743561715"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Sep 2023 19:18:39 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcchA-0002o7-2D;
	Sun, 03 Sep 2023 02:18:36 +0000
Date: Sun, 3 Sep 2023 10:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vfio/vfio_main.c:957 vfio_combine_iova_ranges() error:
 uninitialized symbol 'last'.
Message-ID: <202309031015.RIpZul4a-lkp@intel.com>
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
TO: Brett Creeley <brett.creeley@amd.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Shannon Nelson <shannon.nelson@amd.com>
CC: Simon Horman <horms@kernel.org>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92901222f83d988617aee37680cb29e1a743b5e4
commit: 9a4087fab303e7923ab839a6fe35059659a54649 vfio: Commonize combine_ranges for use in other VFIO drivers
date:   2 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20230902 (https://download.01.org/0day-ci/archive/20230903/202309031015.RIpZul4a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230903/202309031015.RIpZul4a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309031015.RIpZul4a-lkp@intel.com/

smatch warnings:
drivers/vfio/vfio_main.c:957 vfio_combine_iova_ranges() error: uninitialized symbol 'last'.
drivers/vfio/vfio_main.c:978 vfio_combine_iova_ranges() error: potentially dereferencing uninitialized 'comb_end'.
drivers/vfio/vfio_main.c:978 vfio_combine_iova_ranges() error: potentially dereferencing uninitialized 'comb_start'.

vim +/last +957 drivers/vfio/vfio_main.c

115dcec65f61d5 drivers/vfio/vfio.c      Jason Gunthorpe 2022-02-24  937  
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  938  void vfio_combine_iova_ranges(struct rb_root_cached *root, u32 cur_nodes,
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  939  			      u32 req_nodes)
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  940  {
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  941  	struct interval_tree_node *prev, *curr, *comb_start, *comb_end;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  942  	unsigned long min_gap, curr_gap;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  943  
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  944  	/* Special shortcut when a single range is required */
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  945  	if (req_nodes == 1) {
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  946  		unsigned long last;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  947  
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  948  		comb_start = interval_tree_iter_first(root, 0, ULONG_MAX);
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  949  		curr = comb_start;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  950  		while (curr) {
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  951  			last = curr->last;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  952  			prev = curr;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  953  			curr = interval_tree_iter_next(curr, 0, ULONG_MAX);
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  954  			if (prev != comb_start)
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  955  				interval_tree_remove(prev, root);
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  956  		}
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07 @957  		comb_start->last = last;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  958  		return;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  959  	}
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  960  
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  961  	/* Combine ranges which have the smallest gap */
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  962  	while (cur_nodes > req_nodes) {
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  963  		prev = NULL;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  964  		min_gap = ULONG_MAX;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  965  		curr = interval_tree_iter_first(root, 0, ULONG_MAX);
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  966  		while (curr) {
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  967  			if (prev) {
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  968  				curr_gap = curr->start - prev->last;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  969  				if (curr_gap < min_gap) {
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  970  					min_gap = curr_gap;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  971  					comb_start = prev;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  972  					comb_end = curr;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  973  				}
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  974  			}
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  975  			prev = curr;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  976  			curr = interval_tree_iter_next(curr, 0, ULONG_MAX);
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  977  		}
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07 @978  		comb_start->last = comb_end->last;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  979  		interval_tree_remove(comb_end, root);
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  980  		cur_nodes--;
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  981  	}
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  982  }
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  983  EXPORT_SYMBOL_GPL(vfio_combine_iova_ranges);
9a4087fab303e7 drivers/vfio/vfio_main.c Brett Creeley   2023-08-07  984  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
