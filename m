Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE5A1C39
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Jul 2023 11:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689422040; x=1720958040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QvECkv6bFJr9gp89MPiFSbOSHVljIMRPNWulh8iEzdo=;
  b=ZpjDj0LOmroFdwc5QTX0MhjrSjgE9m4I3D3JIM1vdjdI/qcUxlwbjNIz
   8+0hcYqAC6/CfxtbcVjgJC/iI/vvd/8J0HGZCJ0WbmV3tcK//9WnVk2bK
   z91mjtSMkp3Kn64qedWndr1u0gCDisjQ0Oxih559ycd/13q9WFYXO983/
   6tuH5pyBvjv2vuHRyRvx5MSF+kxFcs2kRmUyZKyhsF+TROt7bD2n0iRW1
   iSeMAxIbCvC0hW/4n4vfgcnK+xq1uGvM8173NjZopShnAr8SYWkSnWHO+
   NSFPEk8xONm0JVsltTcUHphh5o52p9T/yDoVGi0p+f7Tmr/lppAGXNnxC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="396468418"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="396468418"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 04:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="836329917"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="836329917"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2023 04:53:58 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKdqX-00089F-2U;
	Sat, 15 Jul 2023 11:53:57 +0000
Date: Sat, 15 Jul 2023 19:53:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sashal-stable:pending-6.1 476/494] block/blk-cgroup.c:1258
 blkcg_css_alloc() error: uninitialized symbol 'ret'.
Message-ID: <202307151941.rN09QKcs-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   8ed10e3be3d7f6905f1a98b67b823e83668664e3
commit: f73586085d021950507a5d20f7288a9f092589f0 [476/494] blk-cgroup: Optimize blkcg_rstat_flush()
:::::: branch date: 23 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001-20230713 (https://download.01.org/0day-ci/archive/20230715/202307151941.rN09QKcs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307151941.rN09QKcs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307151941.rN09QKcs-lkp@intel.com/

smatch warnings:
block/blk-cgroup.c:1258 blkcg_css_alloc() error: uninitialized symbol 'ret'.

vim +/ret +1258 block/blk-cgroup.c

31e4c28d95e64f Vivek Goyal      2009-12-03  1188  
eb95419b023aba Tejun Heo        2013-08-08  1189  static struct cgroup_subsys_state *
eb95419b023aba Tejun Heo        2013-08-08  1190  blkcg_css_alloc(struct cgroup_subsys_state *parent_css)
31e4c28d95e64f Vivek Goyal      2009-12-03  1191  {
3c798398e393e5 Tejun Heo        2012-04-16  1192  	struct blkcg *blkcg;
e48453c386f39c Arianna Avanzini 2015-06-05  1193  	struct cgroup_subsys_state *ret;
e48453c386f39c Arianna Avanzini 2015-06-05  1194  	int i;
31e4c28d95e64f Vivek Goyal      2009-12-03  1195  
7876f930d0e78a Tejun Heo        2015-07-09  1196  	mutex_lock(&blkcg_pol_mutex);
7876f930d0e78a Tejun Heo        2015-07-09  1197  
eb95419b023aba Tejun Heo        2013-08-08  1198  	if (!parent_css) {
3c798398e393e5 Tejun Heo        2012-04-16  1199  		blkcg = &blkcg_root;
bc915e61cde25d Tejun Heo        2015-08-18  1200  	} else {
31e4c28d95e64f Vivek Goyal      2009-12-03  1201  		blkcg = kzalloc(sizeof(*blkcg), GFP_KERNEL);
e48453c386f39c Arianna Avanzini 2015-06-05  1202  		if (!blkcg) {
e48453c386f39c Arianna Avanzini 2015-06-05  1203  			ret = ERR_PTR(-ENOMEM);
4c18c9e962eb02 weiping zhang    2017-08-25  1204  			goto unlock;
e48453c386f39c Arianna Avanzini 2015-06-05  1205  		}
bc915e61cde25d Tejun Heo        2015-08-18  1206  	}
e48453c386f39c Arianna Avanzini 2015-06-05  1207  
f73586085d0219 Waiman Long      2022-11-04  1208  	if (init_blkcg_llists(blkcg))
f73586085d0219 Waiman Long      2022-11-04  1209  		goto free_blkcg;
f73586085d0219 Waiman Long      2022-11-04  1210  
e48453c386f39c Arianna Avanzini 2015-06-05  1211  	for (i = 0; i < BLKCG_MAX_POLS ; i++) {
e48453c386f39c Arianna Avanzini 2015-06-05  1212  		struct blkcg_policy *pol = blkcg_policy[i];
e48453c386f39c Arianna Avanzini 2015-06-05  1213  		struct blkcg_policy_data *cpd;
e48453c386f39c Arianna Avanzini 2015-06-05  1214  
e48453c386f39c Arianna Avanzini 2015-06-05  1215  		/*
e48453c386f39c Arianna Avanzini 2015-06-05  1216  		 * If the policy hasn't been attached yet, wait for it
e48453c386f39c Arianna Avanzini 2015-06-05  1217  		 * to be attached before doing anything else. Otherwise,
e48453c386f39c Arianna Avanzini 2015-06-05  1218  		 * check if the policy requires any specific per-cgroup
e48453c386f39c Arianna Avanzini 2015-06-05  1219  		 * data: if it does, allocate and initialize it.
e48453c386f39c Arianna Avanzini 2015-06-05  1220  		 */
e4a9bde9589fdc Tejun Heo        2015-08-18  1221  		if (!pol || !pol->cpd_alloc_fn)
e48453c386f39c Arianna Avanzini 2015-06-05  1222  			continue;
e48453c386f39c Arianna Avanzini 2015-06-05  1223  
e4a9bde9589fdc Tejun Heo        2015-08-18  1224  		cpd = pol->cpd_alloc_fn(GFP_KERNEL);
e48453c386f39c Arianna Avanzini 2015-06-05  1225  		if (!cpd) {
e48453c386f39c Arianna Avanzini 2015-06-05  1226  			ret = ERR_PTR(-ENOMEM);
e48453c386f39c Arianna Avanzini 2015-06-05  1227  			goto free_pd_blkcg;
e48453c386f39c Arianna Avanzini 2015-06-05  1228  		}
814376483e7d85 Tejun Heo        2015-08-18  1229  		blkcg->cpd[i] = cpd;
814376483e7d85 Tejun Heo        2015-08-18  1230  		cpd->blkcg = blkcg;
e48453c386f39c Arianna Avanzini 2015-06-05  1231  		cpd->plid = i;
e4a9bde9589fdc Tejun Heo        2015-08-18  1232  		if (pol->cpd_init_fn)
814376483e7d85 Tejun Heo        2015-08-18  1233  			pol->cpd_init_fn(cpd);
e48453c386f39c Arianna Avanzini 2015-06-05  1234  	}
31e4c28d95e64f Vivek Goyal      2009-12-03  1235  
31e4c28d95e64f Vivek Goyal      2009-12-03  1236  	spin_lock_init(&blkcg->lock);
d866dbf6178713 Tejun Heo        2019-07-24  1237  	refcount_set(&blkcg->online_pin, 1);
e00f4f4d0ff7e1 Tejun Heo        2016-11-21  1238  	INIT_RADIX_TREE(&blkcg->blkg_tree, GFP_NOWAIT | __GFP_NOWARN);
31e4c28d95e64f Vivek Goyal      2009-12-03  1239  	INIT_HLIST_HEAD(&blkcg->blkg_list);
52ebea749aaed1 Tejun Heo        2015-05-22  1240  #ifdef CONFIG_CGROUP_WRITEBACK
52ebea749aaed1 Tejun Heo        2015-05-22  1241  	INIT_LIST_HEAD(&blkcg->cgwb_list);
52ebea749aaed1 Tejun Heo        2015-05-22  1242  #endif
7876f930d0e78a Tejun Heo        2015-07-09  1243  	list_add_tail(&blkcg->all_blkcgs_node, &all_blkcgs);
7876f930d0e78a Tejun Heo        2015-07-09  1244  
7876f930d0e78a Tejun Heo        2015-07-09  1245  	mutex_unlock(&blkcg_pol_mutex);
31e4c28d95e64f Vivek Goyal      2009-12-03  1246  	return &blkcg->css;
e48453c386f39c Arianna Avanzini 2015-06-05  1247  
e48453c386f39c Arianna Avanzini 2015-06-05  1248  free_pd_blkcg:
e48453c386f39c Arianna Avanzini 2015-06-05  1249  	for (i--; i >= 0; i--)
e4a9bde9589fdc Tejun Heo        2015-08-18  1250  		if (blkcg->cpd[i])
e4a9bde9589fdc Tejun Heo        2015-08-18  1251  			blkcg_policy[i]->cpd_free_fn(blkcg->cpd[i]);
f73586085d0219 Waiman Long      2022-11-04  1252  	free_percpu(blkcg->lhead);
f73586085d0219 Waiman Long      2022-11-04  1253  free_blkcg:
4c18c9e962eb02 weiping zhang    2017-08-25  1254  	if (blkcg != &blkcg_root)
e48453c386f39c Arianna Avanzini 2015-06-05  1255  		kfree(blkcg);
4c18c9e962eb02 weiping zhang    2017-08-25  1256  unlock:
7876f930d0e78a Tejun Heo        2015-07-09  1257  	mutex_unlock(&blkcg_pol_mutex);
e48453c386f39c Arianna Avanzini 2015-06-05 @1258  	return ret;
31e4c28d95e64f Vivek Goyal      2009-12-03  1259  }
31e4c28d95e64f Vivek Goyal      2009-12-03  1260  

:::::: The code at line 1258 was first introduced by commit
:::::: e48453c386f39ca9ea29e9df6efef78f56746af0 block, cgroup: implement policy-specific per-blkcg data

:::::: TO: Arianna Avanzini <avanzini.arianna@gmail.com>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
