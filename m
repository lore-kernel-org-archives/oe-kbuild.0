Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BC7184F
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Mar 2023 05:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677906578; x=1709442578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TGn6jf4/PS6Gw+vsn1x5L7cW4DO01YWjQjCNEA7mFY0=;
  b=KpGLY1yLJ7x4SLkLM3STFovQosQCcPIR43NCn9NLny2zdmn06EpYsi9A
   fSE5G2pXoQFt5/KDJXIzOSKtsGKCy1xDj/Nl6iarb9wladzA1OUx/ZiYb
   H3dojCffnVcz3/RrFmlxLiF7WVdzRggQ9amArGzSoEGufge0Gj92b1lPm
   85D3XzoHMp8AaMbvzfOSKpUbSCGbsvVOBx74e3UzKGBhCWNqha/N3tx0E
   2wzxOzv9EgrGOR0EhX8jfigzrL43mAf8L3shqIy3KVspNzhu29NB16+F6
   KB9D6Xno9OW/t77mI/0/thR92nI4QotRd6PXoYoEPgXS/7be+94qaBhoA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="332702500"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="332702500"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 21:09:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="799438395"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="799438395"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Mar 2023 21:09:36 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYK9H-0001t2-10;
	Sat, 04 Mar 2023 05:09:35 +0000
Date: Sat, 4 Mar 2023 13:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vfio/pci/mlx5/cmd.c:432 combine_ranges() error:
 uninitialized symbol 'last'.
Message-ID: <202303041345.5CaIg4XZ-lkp@intel.com>
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
TO: Yishai Hadas <yishaih@nvidia.com>
CC: Alex Williamson <alex.williamson@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0988a0ea791999ebbf95693f2676381825b05033
commit: c1d050b0d169fd60c8acef157db53bd4e3141799 vfio/mlx5: Create and destroy page tracker object
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
config: microblaze-randconfig-m031-20230302 (https://download.01.org/0day-ci/archive/20230304/202303041345.5CaIg4XZ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303041345.5CaIg4XZ-lkp@intel.com/

smatch warnings:
drivers/vfio/pci/mlx5/cmd.c:432 combine_ranges() error: uninitialized symbol 'last'.
drivers/vfio/pci/mlx5/cmd.c:453 combine_ranges() error: potentially dereferencing uninitialized 'comb_end'.
drivers/vfio/pci/mlx5/cmd.c:453 combine_ranges() error: potentially dereferencing uninitialized 'comb_start'.

vim +/last +432 drivers/vfio/pci/mlx5/cmd.c

79c3cf279926f8 Yishai Hadas 2022-09-08  412  
c1d050b0d169fd Yishai Hadas 2022-09-08  413  static void combine_ranges(struct rb_root_cached *root, u32 cur_nodes,
c1d050b0d169fd Yishai Hadas 2022-09-08  414  			   u32 req_nodes)
c1d050b0d169fd Yishai Hadas 2022-09-08  415  {
c1d050b0d169fd Yishai Hadas 2022-09-08  416  	struct interval_tree_node *prev, *curr, *comb_start, *comb_end;
c1d050b0d169fd Yishai Hadas 2022-09-08  417  	unsigned long min_gap;
c1d050b0d169fd Yishai Hadas 2022-09-08  418  	unsigned long curr_gap;
c1d050b0d169fd Yishai Hadas 2022-09-08  419  
c1d050b0d169fd Yishai Hadas 2022-09-08  420  	/* Special shortcut when a single range is required */
c1d050b0d169fd Yishai Hadas 2022-09-08  421  	if (req_nodes == 1) {
c1d050b0d169fd Yishai Hadas 2022-09-08  422  		unsigned long last;
c1d050b0d169fd Yishai Hadas 2022-09-08  423  
c1d050b0d169fd Yishai Hadas 2022-09-08  424  		curr = comb_start = interval_tree_iter_first(root, 0, ULONG_MAX);
c1d050b0d169fd Yishai Hadas 2022-09-08  425  		while (curr) {
c1d050b0d169fd Yishai Hadas 2022-09-08  426  			last = curr->last;
c1d050b0d169fd Yishai Hadas 2022-09-08  427  			prev = curr;
c1d050b0d169fd Yishai Hadas 2022-09-08  428  			curr = interval_tree_iter_next(curr, 0, ULONG_MAX);
c1d050b0d169fd Yishai Hadas 2022-09-08  429  			if (prev != comb_start)
c1d050b0d169fd Yishai Hadas 2022-09-08  430  				interval_tree_remove(prev, root);
c1d050b0d169fd Yishai Hadas 2022-09-08  431  		}
c1d050b0d169fd Yishai Hadas 2022-09-08 @432  		comb_start->last = last;
c1d050b0d169fd Yishai Hadas 2022-09-08  433  		return;
c1d050b0d169fd Yishai Hadas 2022-09-08  434  	}
c1d050b0d169fd Yishai Hadas 2022-09-08  435  
c1d050b0d169fd Yishai Hadas 2022-09-08  436  	/* Combine ranges which have the smallest gap */
c1d050b0d169fd Yishai Hadas 2022-09-08  437  	while (cur_nodes > req_nodes) {
c1d050b0d169fd Yishai Hadas 2022-09-08  438  		prev = NULL;
c1d050b0d169fd Yishai Hadas 2022-09-08  439  		min_gap = ULONG_MAX;
c1d050b0d169fd Yishai Hadas 2022-09-08  440  		curr = interval_tree_iter_first(root, 0, ULONG_MAX);
c1d050b0d169fd Yishai Hadas 2022-09-08  441  		while (curr) {
c1d050b0d169fd Yishai Hadas 2022-09-08  442  			if (prev) {
c1d050b0d169fd Yishai Hadas 2022-09-08  443  				curr_gap = curr->start - prev->last;
c1d050b0d169fd Yishai Hadas 2022-09-08  444  				if (curr_gap < min_gap) {
c1d050b0d169fd Yishai Hadas 2022-09-08  445  					min_gap = curr_gap;
c1d050b0d169fd Yishai Hadas 2022-09-08  446  					comb_start = prev;
c1d050b0d169fd Yishai Hadas 2022-09-08  447  					comb_end = curr;
c1d050b0d169fd Yishai Hadas 2022-09-08  448  				}
c1d050b0d169fd Yishai Hadas 2022-09-08  449  			}
c1d050b0d169fd Yishai Hadas 2022-09-08  450  			prev = curr;
c1d050b0d169fd Yishai Hadas 2022-09-08  451  			curr = interval_tree_iter_next(curr, 0, ULONG_MAX);
c1d050b0d169fd Yishai Hadas 2022-09-08  452  		}
c1d050b0d169fd Yishai Hadas 2022-09-08 @453  		comb_start->last = comb_end->last;
c1d050b0d169fd Yishai Hadas 2022-09-08  454  		interval_tree_remove(comb_end, root);
c1d050b0d169fd Yishai Hadas 2022-09-08  455  		cur_nodes--;
c1d050b0d169fd Yishai Hadas 2022-09-08  456  	}
c1d050b0d169fd Yishai Hadas 2022-09-08  457  }
c1d050b0d169fd Yishai Hadas 2022-09-08  458  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
