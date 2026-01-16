Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32D535FF6E
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 10:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560119; cv=none; b=oyf9EKoOkpF5hJIKKt6Ggvfq9k1SJ7nxdfA7/sImmqsPT38iw7tPA9vs4NEa1an5SBFMzgDc0GoHpshaxU3fsM19UUpQ6eK9s6RYNWj7P0ufN4bz3p56U8tZzQ3hDDmlamBpI5TbWfJxCMGEWCqbrEJ6VfiHww93ips0vJ8CC44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560119; c=relaxed/simple;
	bh=0u/H/srRWXV52p1bmy17Jrj4heaORIUYGCg/z7wJnsM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UNWOgdtq5e+NynLY4pdq8ftjxMZiYkB32lJtcVDzVLzpbhSueBEgSDtSL4Q32NB/W2wpGxtzGik5C+cxRtZU4ApqRo5Jvk/WvugKprOvdCW0omAv/WOOJifm4D5dSP3/j1Yalg2hjpv9cMO1DFbuirtO0IKrCNjTy8xgWpOQ1FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1rwG8R0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1rwG8R0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768560117; x=1800096117;
  h=date:from:to:cc:subject:message-id;
  bh=0u/H/srRWXV52p1bmy17Jrj4heaORIUYGCg/z7wJnsM=;
  b=T1rwG8R0EkRg/9l5G4mdjWxDC6e3RDTuYpHfDUQgIZ424TlvGQVt2Sgj
   R532rWJGw922XEmLlTJhbiRRIsSoMIcLVh+24l/Qkbo4jSQGlHPez/Zo0
   elxNGP707dZJLizE31oUD0QspGuqEUaQR7T2y9F0nmMScvyZ4pz18JVgj
   fuPqaZMnKK3G8eAY3UOlci2snHrAlVkcx3arEovzFrJzUpOy03cULwEhg
   Vpf4dasQculyQkXmP1Q8TIwFEZP/mMERi9tZFkC3UpnhEtE5Rg/w2eWu1
   uDm6LkkXafqu/2zGBt3+BGEByVH0q0OgQM8cobJDoWq6Gy1H2dh1Vm2ae
   g==;
X-CSE-ConnectionGUID: e7VY059TSsicqkU6MH4tbQ==
X-CSE-MsgGUID: lW26eQCjRYOst9SHvvjPqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="68882886"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="68882886"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:41:56 -0800
X-CSE-ConnectionGUID: njx9XL2bTY2UksINV+8jwQ==
X-CSE-MsgGUID: SxUpglxaThuYTfmy6KgP9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="209348743"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Jan 2026 02:41:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vghH6-00000000KjV-0pge;
	Fri, 16 Jan 2026 10:41:52 +0000
Date: Fri, 16 Jan 2026 18:41:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 4/4]
 kernel/cgroup/cgroup.c:5780 cgroup_create() warn: passing zero to 'ERR_PTR'
Message-ID: <202601161853.J6x4IThy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a58a97026588e9128868c7778ca1ffacbb53c931
commit: 2917fe4f77b5432ae691329891513c43ce250baa [4/4] ANDROID: cgroup: Use backport reservation for freeze time
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-141-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161853.J6x4IThy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601161853.J6x4IThy-lkp@intel.com/

smatch warnings:
kernel/cgroup/cgroup.c:5780 cgroup_create() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +5780 kernel/cgroup/cgroup.c

c81c925ad9b046 kernel/cgroup.c        Tejun Heo          2013-12-06  5655  
07cd12945551b6 kernel/cgroup.c        Tejun Heo          2017-01-26  5656  /*
07cd12945551b6 kernel/cgroup.c        Tejun Heo          2017-01-26  5657   * The returned cgroup is fully initialized including its control mask, but
a3fdeeb3f1c1fa kernel/cgroup/cgroup.c Miaohe Lin         2023-07-19  5658   * it doesn't have the control mask applied.
07cd12945551b6 kernel/cgroup.c        Tejun Heo          2017-01-26  5659   */
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5660  static struct cgroup *cgroup_create(struct cgroup *parent, const char *name,
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5661  				    umode_t mode)
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5662  {
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5663  	struct cgroup_root *root = parent->root;
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5664  	struct cgroup *cgrp, *tcgrp;
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5665  	struct kernfs_node *kn;
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5666  	int level = parent->level + 1;
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5667  	int ret;
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5668  
0a950f65e1e64f kernel/cgroup.c        Tejun Heo          2012-11-19  5669  	/* allocate the cgroup and its ID, 0 is reserved for the root */
7f203bc89eb66d kernel/cgroup/cgroup.c Tejun Heo          2022-07-29  5670  	cgrp = kzalloc(struct_size(cgrp, ancestors, (level + 1)), GFP_KERNEL);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5671  	if (!cgrp)
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5672  		return ERR_PTR(-ENOMEM);
0ab02ca8f88790 kernel/cgroup.c        Li Zefan           2014-02-11  5673  
2aad2a86f6685c kernel/cgroup.c        Tejun Heo          2014-09-24  5674  	ret = percpu_ref_init(&cgrp->self.refcnt, css_release, 0, GFP_KERNEL);
9d755d33f0db8c kernel/cgroup.c        Tejun Heo          2014-05-14  5675  	if (ret)
9d755d33f0db8c kernel/cgroup.c        Tejun Heo          2014-05-14  5676  		goto out_free_cgrp;
9d755d33f0db8c kernel/cgroup.c        Tejun Heo          2014-05-14  5677  
c58632b3631cb2 kernel/cgroup/cgroup.c Tejun Heo          2018-04-26  5678  	ret = cgroup_rstat_init(cgrp);
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5679  	if (ret)
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5680  		goto out_cancel_ref;
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5681  
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5682  	/* create the directory */
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5683  	kn = kernfs_create_dir(parent->kn, name, mode, cgrp);
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5684  	if (IS_ERR(kn)) {
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5685  		ret = PTR_ERR(kn);
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5686  		goto out_stat_exit;
976c06bcccc505 kernel/cgroup.c        Tejun Heo          2012-11-05  5687  	}
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5688  	cgrp->kn = kn;
976c06bcccc505 kernel/cgroup.c        Tejun Heo          2012-11-05  5689  
cc31edceee04a7 kernel/cgroup.c        Paul Menage        2008-10-18  5690  	init_cgroup_housekeeping(cgrp);
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5691  
9d800df12d3173 kernel/cgroup.c        Tejun Heo          2014-05-14  5692  	cgrp->self.parent = &parent->self;
ba0f4d761503bd kernel/cgroup.c        Tejun Heo          2014-05-13  5693  	cgrp->root = root;
b11cfb5807e303 kernel/cgroup.c        Tejun Heo          2015-11-20  5694  	cgrp->level = level;
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5695  
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5696  	ret = psi_cgroup_alloc(cgrp);
324bda9e6c5add kernel/cgroup/cgroup.c Alexei Starovoitov 2017-10-02  5697  	if (ret)
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5698  		goto out_kernfs_remove;
b11cfb5807e303 kernel/cgroup.c        Tejun Heo          2015-11-20  5699  
9e67b054198f22 kernel/cgroup/cgroup.c Chen Ridong        2024-10-18  5700  	if (cgrp->root == &cgrp_dfl_root) {
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5701  		ret = cgroup_bpf_inherit(cgrp);
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5702  		if (ret)
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5703  			goto out_psi_free;
9e67b054198f22 kernel/cgroup/cgroup.c Chen Ridong        2024-10-18  5704  	}
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5705  
2917fe4f77b543 kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5706  	cgrp->kmi_ext_info = kzalloc(sizeof(*cgrp->kmi_ext_info), GFP_KERNEL);
2917fe4f77b543 kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5707  	if (!cgrp->kmi_ext_info)
2917fe4f77b543 kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5708  		goto out_psi_free;
2917fe4f77b543 kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5709  
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5710  	/*
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5711  	 * New cgroup inherits effective freeze counter, and
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5712  	 * if the parent has to be frozen, the child has too.
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5713  	 */
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5714  	cgrp->freezer.e_freeze = parent->freezer.e_freeze;
2917fe4f77b543 kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5715  	seqcount_init(&cgrp->kmi_ext_info->freezer.freeze_seq);
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5716  	if (cgrp->freezer.e_freeze) {
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5717  		/*
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5718  		 * Set the CGRP_FREEZE flag, so when a process will be
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5719  		 * attached to the child cgroup, it will become frozen.
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5720  		 * At this point the new cgroup is unpopulated, so we can
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5721  		 * consider it frozen immediately.
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5722  		 */
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5723  		set_bit(CGRP_FREEZE, &cgrp->flags);
2917fe4f77b543 kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5724  		cgrp->kmi_ext_info->freezer.freeze_start_nsec = ktime_get_ns();
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5725  		set_bit(CGRP_FROZEN, &cgrp->flags);
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5726  	}
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5727  
4dcabece4c3a9f kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5728  	spin_lock_irq(&css_set_lock);
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5729  	for (tcgrp = cgrp; tcgrp; tcgrp = cgroup_parent(tcgrp)) {
7f203bc89eb66d kernel/cgroup/cgroup.c Tejun Heo          2022-07-29  5730  		cgrp->ancestors[tcgrp->level] = tcgrp;
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5731  
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5732  		if (tcgrp != cgrp) {
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5733  			tcgrp->nr_descendants++;
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5734  
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5735  			/*
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5736  			 * If the new cgroup is frozen, all ancestor cgroups
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5737  			 * get a new frozen descendant, but their state can't
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5738  			 * change because of this.
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5739  			 */
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5740  			if (cgrp->freezer.e_freeze)
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5741  				tcgrp->freezer.nr_frozen_descendants++;
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5742  		}
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5743  	}
4dcabece4c3a9f kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5744  	spin_unlock_irq(&css_set_lock);
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5745  
b6abdb0e6ca5c2 kernel/cgroup.c        Li Zefan           2008-03-04  5746  	if (notify_on_release(parent))
b6abdb0e6ca5c2 kernel/cgroup.c        Li Zefan           2008-03-04  5747  		set_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
b6abdb0e6ca5c2 kernel/cgroup.c        Li Zefan           2008-03-04  5748  
2260e7fc1f18ad kernel/cgroup.c        Tejun Heo          2012-11-19  5749  	if (test_bit(CGRP_CPUSET_CLONE_CHILDREN, &parent->flags))
2260e7fc1f18ad kernel/cgroup.c        Tejun Heo          2012-11-19  5750  		set_bit(CGRP_CPUSET_CLONE_CHILDREN, &cgrp->flags);
97978e6d1f2da0 kernel/cgroup.c        Daniel Lezcano     2010-10-27  5751  
0cb51d71c1fa92 kernel/cgroup.c        Tejun Heo          2014-05-16  5752  	cgrp->self.serial_nr = css_serial_nr_next++;
53fa5261747a90 kernel/cgroup.c        Tejun Heo          2013-05-24  5753  
4e139afc22cb98 kernel/cgroup.c        Tejun Heo          2012-11-19  5754  	/* allocation complete, commit to creation */
d5c419b68e368f kernel/cgroup.c        Tejun Heo          2014-05-16  5755  	list_add_tail_rcu(&cgrp->self.sibling, &cgroup_parent(cgrp)->self.children);
3c9c825b8b50de kernel/cgroup.c        Tejun Heo          2014-02-12  5756  	atomic_inc(&root->nr_cgrps);
a590b90d472f2c kernel/cgroup/cgroup.c Tejun Heo          2017-04-28  5757  	cgroup_get_live(parent);
415cf07a1c1c65 kernel/cgroup.c        Li Zefan           2013-04-08  5758  
bd53d617b34c78 kernel/cgroup.c        Tejun Heo          2014-04-23  5759  	/*
bd53d617b34c78 kernel/cgroup.c        Tejun Heo          2014-04-23  5760  	 * On the default hierarchy, a child doesn't automatically inherit
667c24917144e3 kernel/cgroup.c        Tejun Heo          2014-07-08  5761  	 * subtree_control from the parent.  Each is configured manually.
bd53d617b34c78 kernel/cgroup.c        Tejun Heo          2014-04-23  5762  	 */
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5763  	if (!cgroup_on_dfl(cgrp))
5531dc915ba10b kernel/cgroup.c        Tejun Heo          2016-03-03  5764  		cgrp->subtree_control = cgroup_control(cgrp);
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5765  
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5766  	cgroup_propagate_control(cgrp);
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5767  
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5768  	return cgrp;
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5769  
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5770  out_psi_free:
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5771  	psi_cgroup_free(cgrp);
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5772  out_kernfs_remove:
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5773  	kernfs_remove(cgrp->kn);
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5774  out_stat_exit:
c58632b3631cb2 kernel/cgroup/cgroup.c Tejun Heo          2018-04-26  5775  	cgroup_rstat_exit(cgrp);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5776  out_cancel_ref:
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5777  	percpu_ref_exit(&cgrp->self.refcnt);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5778  out_free_cgrp:
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5779  	kfree(cgrp);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03 @5780  	return ERR_PTR(ret);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5781  }
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5782  

:::::: The code at line 5780 was first introduced by commit
:::::: a5bca2152036de826595723437c5cbe8f6c13983 cgroup: factor out cgroup_create() out of cgroup_mkdir()

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
