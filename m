Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C035DA5B
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Apr 2023 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682246171; x=1713782171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b41xlJ5HKgAjHrXjuSMDbjODeolnaAonBcHNmFHscH8=;
  b=YxvotFM8WSHYrZQ1+Yuyo5yK/q88C/WGLNWaOa59/G4eC998AmcPkiT/
   9FL7/kjVDES/4l+d3lLKpU+6b5Isy9ScSHpV9IN65u0KjQFexLnB+DOW7
   2gDghkac+RjRIlc5y85s0KMQ2xVSASFUxz7czhTsAMpwKjGvbiVrzmTc9
   EKWeb89Y4c+3RQOcC7i7nL5J5UdjHPFza10T/HU6w/XSOMGVeYwy+J0Qf
   XsizCgkCuaE+yJewETCeW18/R0JlhB4sZ0dNjNzAjlreJNIAdKAYeYErm
   mBNjhf0UrNAPELkAYqH74FfuxOKRU2kcEo2CGOhibXGUjKkrElAvi+E68
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="409202739"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="409202739"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 03:36:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="643021793"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="643021793"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Apr 2023 03:36:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqX4g-000hqC-2I;
	Sun, 23 Apr 2023 10:36:06 +0000
Date: Sun, 23 Apr 2023 18:35:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v9 vfio 1/7] vfio: Commonize combine_ranges for use in
 other VFIO drivers
Message-ID: <202304231830.gaYXbmEa-lkp@intel.com>
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
In-Reply-To: <20230422010642.60720-2-brett.creeley@amd.com>
References: <20230422010642.60720-2-brett.creeley@amd.com>
TO: Brett Creeley <brett.creeley@amd.com>
TO: kvm@vger.kernel.org
TO: netdev@vger.kernel.org
TO: alex.williamson@redhat.com
TO: jgg@nvidia.com
TO: yishaih@nvidia.com
TO: shameerali.kolothum.thodi@huawei.com
TO: kevin.tian@intel.com
CC: brett.creeley@amd.com
CC: shannon.nelson@amd.com
CC: drivers@pensando.io

Hi Brett,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230421]
[also build test WARNING on v6.3-rc7]
[cannot apply to awilliam-vfio/next awilliam-vfio/for-linus horms-ipvs/master linus/master v6.3-rc7 v6.3-rc6 v6.3-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brett-Creeley/vfio-Commonize-combine_ranges-for-use-in-other-VFIO-drivers/20230422-090900
base:   next-20230421
patch link:    https://lore.kernel.org/r/20230422010642.60720-2-brett.creeley%40amd.com
patch subject: [PATCH v9 vfio 1/7] vfio: Commonize combine_ranges for use in other VFIO drivers
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230423/202304231830.gaYXbmEa-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304231830.gaYXbmEa-lkp@intel.com/

New smatch warnings:
drivers/vfio/vfio_main.c:887 vfio_combine_iova_ranges() error: uninitialized symbol 'last'.
drivers/vfio/vfio_main.c:908 vfio_combine_iova_ranges() error: potentially dereferencing uninitialized 'comb_end'.
drivers/vfio/vfio_main.c:908 vfio_combine_iova_ranges() error: potentially dereferencing uninitialized 'comb_start'.

Old smatch warnings:
drivers/vfio/vfio_main.c:1349 vfio_pin_pages() warn: impossible condition '(iova > (~0)) => (0-u32max > u32max)'
drivers/vfio/vfio_main.c:1426 vfio_dma_rw() warn: impossible condition '(iova > (~0)) => (0-u32max > u32max)'

vim +/last +887 drivers/vfio/vfio_main.c

115dcec65f61d5 drivers/vfio/vfio.c      Jason Gunthorpe 2022-02-24  867  
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  868  void vfio_combine_iova_ranges(struct rb_root_cached *root, u32 cur_nodes,
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  869  			      u32 req_nodes)
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  870  {
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  871  	struct interval_tree_node *prev, *curr, *comb_start, *comb_end;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  872  	unsigned long min_gap, curr_gap;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  873  
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  874  	/* Special shortcut when a single range is required */
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  875  	if (req_nodes == 1) {
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  876  		unsigned long last;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  877  
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  878  		comb_start = interval_tree_iter_first(root, 0, ULONG_MAX);
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  879  		curr = comb_start;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  880  		while (curr) {
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  881  			last = curr->last;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  882  			prev = curr;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  883  			curr = interval_tree_iter_next(curr, 0, ULONG_MAX);
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  884  			if (prev != comb_start)
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  885  				interval_tree_remove(prev, root);
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  886  		}
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21 @887  		comb_start->last = last;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  888  		return;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  889  	}
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  890  
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  891  	/* Combine ranges which have the smallest gap */
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  892  	while (cur_nodes > req_nodes) {
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  893  		prev = NULL;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  894  		min_gap = ULONG_MAX;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  895  		curr = interval_tree_iter_first(root, 0, ULONG_MAX);
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  896  		while (curr) {
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  897  			if (prev) {
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  898  				curr_gap = curr->start - prev->last;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  899  				if (curr_gap < min_gap) {
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  900  					min_gap = curr_gap;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  901  					comb_start = prev;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  902  					comb_end = curr;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  903  				}
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  904  			}
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  905  			prev = curr;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  906  			curr = interval_tree_iter_next(curr, 0, ULONG_MAX);
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  907  		}
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21 @908  		comb_start->last = comb_end->last;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  909  		interval_tree_remove(comb_end, root);
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  910  		cur_nodes--;
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  911  	}
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  912  }
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  913  EXPORT_SYMBOL_GPL(vfio_combine_iova_ranges);
841a03ec82db66 drivers/vfio/vfio_main.c Brett Creeley   2023-04-21  914  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
