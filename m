Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD1A15A0
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Nov 2023 05:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCmbYAXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699074694; x=1730610694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QT6V6czCQi0k90LxHTJjWsPKtK7w1rx/J3FPraHxhYc=;
  b=QCmbYAXCqKw0WznqcylUXlVuPE79ESWqc/AoI4REtZolomWz67Vt+YID
   O3pA0MCLOqBcdMse1BBam0BTBVCH6PhvhqOA6Quv0CD+DYdzuYF7Dk3sN
   E+6ABW0veUrPQe9BvY/IXaPrgLBZ7AXBcjii8MptdxzBPJEdcMXPOrII8
   pKH63zkGSPO3Z0TlYvOz6eqsVb93k7bm+R5IE38anp3fiEOoXl4WFo38R
   gwbMtSJIDiCLbd7+7dLXHI2qD6Wy+B7/uQSmwuV4TVJgYQSmQJFa0HwWr
   yZbJoEi56LR/3J/+KXcK2Cet2QTWz4taZd6KhhyKQO31j+whFBqdVlXxb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="369268786"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="369268786"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 22:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="935305629"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="935305629"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Nov 2023 22:11:31 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz8wT-0003So-1r;
	Sat, 04 Nov 2023 05:11:29 +0000
Date: Sat, 4 Nov 2023 13:10:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/shmem_quota.c:253 shmem_is_empty_dquot() error: uninitialized
 symbol 'bhardlimit'.
Message-ID: <202311041355.PwqmvfFM-lkp@intel.com>
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
TO: Lukas Czerner <lczerner@redhat.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Carlos Maiolino <cmaiolino@redhat.com>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2c40c1c6adab90ee4660caf03722b3a3ec67767b
commit: de4c0e7ca8b526a82ff7e5ee5533787bb6d01724 shmem: Add default quota limit mount options
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231104/202311041355.PwqmvfFM-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311041355.PwqmvfFM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311041355.PwqmvfFM-lkp@intel.com/

smatch warnings:
mm/shmem_quota.c:253 shmem_is_empty_dquot() error: uninitialized symbol 'bhardlimit'.
mm/shmem_quota.c:254 shmem_is_empty_dquot() error: uninitialized symbol 'ihardlimit'.

vim +/bhardlimit +253 mm/shmem_quota.c

eafc474e202978 Carlos Maiolino 2023-07-25  235  
de4c0e7ca8b526 Lukas Czerner   2023-07-25  236  static bool shmem_is_empty_dquot(struct dquot *dquot)
de4c0e7ca8b526 Lukas Czerner   2023-07-25  237  {
de4c0e7ca8b526 Lukas Czerner   2023-07-25  238  	struct shmem_sb_info *sbinfo = dquot->dq_sb->s_fs_info;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  239  	qsize_t bhardlimit;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  240  	qsize_t ihardlimit;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  241  
de4c0e7ca8b526 Lukas Czerner   2023-07-25  242  	if (dquot->dq_id.type == USRQUOTA) {
de4c0e7ca8b526 Lukas Czerner   2023-07-25  243  		bhardlimit = sbinfo->qlimits.usrquota_bhardlimit;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  244  		ihardlimit = sbinfo->qlimits.usrquota_ihardlimit;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  245  	} else if (dquot->dq_id.type == GRPQUOTA) {
de4c0e7ca8b526 Lukas Czerner   2023-07-25  246  		bhardlimit = sbinfo->qlimits.grpquota_bhardlimit;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  247  		ihardlimit = sbinfo->qlimits.grpquota_ihardlimit;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  248  	}
de4c0e7ca8b526 Lukas Czerner   2023-07-25  249  
de4c0e7ca8b526 Lukas Czerner   2023-07-25  250  	if (test_bit(DQ_FAKE_B, &dquot->dq_flags) ||
de4c0e7ca8b526 Lukas Czerner   2023-07-25  251  		(dquot->dq_dqb.dqb_curspace == 0 &&
de4c0e7ca8b526 Lukas Czerner   2023-07-25  252  		 dquot->dq_dqb.dqb_curinodes == 0 &&
de4c0e7ca8b526 Lukas Czerner   2023-07-25 @253  		 dquot->dq_dqb.dqb_bhardlimit == bhardlimit &&
de4c0e7ca8b526 Lukas Czerner   2023-07-25 @254  		 dquot->dq_dqb.dqb_ihardlimit == ihardlimit))
de4c0e7ca8b526 Lukas Czerner   2023-07-25  255  		return true;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  256  
de4c0e7ca8b526 Lukas Czerner   2023-07-25  257  	return false;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  258  }
eafc474e202978 Carlos Maiolino 2023-07-25  259  /*
eafc474e202978 Carlos Maiolino 2023-07-25  260   * Store limits from dquot in the tree unless it's fake. If it is fake
eafc474e202978 Carlos Maiolino 2023-07-25  261   * remove the id from the tree since there is no useful information in
eafc474e202978 Carlos Maiolino 2023-07-25  262   * there.
eafc474e202978 Carlos Maiolino 2023-07-25  263   */
eafc474e202978 Carlos Maiolino 2023-07-25  264  static int shmem_release_dquot(struct dquot *dquot)
eafc474e202978 Carlos Maiolino 2023-07-25  265  {
eafc474e202978 Carlos Maiolino 2023-07-25  266  	struct mem_dqinfo *info = sb_dqinfo(dquot->dq_sb, dquot->dq_id.type);
eafc474e202978 Carlos Maiolino 2023-07-25  267  	struct rb_node *node = ((struct rb_root *)info->dqi_priv)->rb_node;
eafc474e202978 Carlos Maiolino 2023-07-25  268  	qid_t id = from_kqid(&init_user_ns, dquot->dq_id);
eafc474e202978 Carlos Maiolino 2023-07-25  269  	struct quota_info *dqopt = sb_dqopt(dquot->dq_sb);
eafc474e202978 Carlos Maiolino 2023-07-25  270  	struct quota_id *entry = NULL;
eafc474e202978 Carlos Maiolino 2023-07-25  271  
eafc474e202978 Carlos Maiolino 2023-07-25  272  	mutex_lock(&dquot->dq_lock);
eafc474e202978 Carlos Maiolino 2023-07-25  273  	/* Check whether we are not racing with some other dqget() */
eafc474e202978 Carlos Maiolino 2023-07-25  274  	if (dquot_is_busy(dquot))
eafc474e202978 Carlos Maiolino 2023-07-25  275  		goto out_dqlock;
eafc474e202978 Carlos Maiolino 2023-07-25  276  
eafc474e202978 Carlos Maiolino 2023-07-25  277  	down_write(&dqopt->dqio_sem);
eafc474e202978 Carlos Maiolino 2023-07-25  278  	while (node) {
eafc474e202978 Carlos Maiolino 2023-07-25  279  		entry = rb_entry(node, struct quota_id, node);
eafc474e202978 Carlos Maiolino 2023-07-25  280  
eafc474e202978 Carlos Maiolino 2023-07-25  281  		if (id < entry->id)
eafc474e202978 Carlos Maiolino 2023-07-25  282  			node = node->rb_left;
eafc474e202978 Carlos Maiolino 2023-07-25  283  		else if (id > entry->id)
eafc474e202978 Carlos Maiolino 2023-07-25  284  			node = node->rb_right;
eafc474e202978 Carlos Maiolino 2023-07-25  285  		else
eafc474e202978 Carlos Maiolino 2023-07-25  286  			goto found;
eafc474e202978 Carlos Maiolino 2023-07-25  287  	}
eafc474e202978 Carlos Maiolino 2023-07-25  288  
eafc474e202978 Carlos Maiolino 2023-07-25  289  	/* We should always find the entry in the rb tree */
eafc474e202978 Carlos Maiolino 2023-07-25  290  	WARN_ONCE(1, "quota id %u from dquot %p, not in rb tree!\n", id, dquot);
eafc474e202978 Carlos Maiolino 2023-07-25  291  	up_write(&dqopt->dqio_sem);
eafc474e202978 Carlos Maiolino 2023-07-25  292  	mutex_unlock(&dquot->dq_lock);
eafc474e202978 Carlos Maiolino 2023-07-25  293  	return -ENOENT;
eafc474e202978 Carlos Maiolino 2023-07-25  294  
eafc474e202978 Carlos Maiolino 2023-07-25  295  found:
de4c0e7ca8b526 Lukas Czerner   2023-07-25  296  	if (shmem_is_empty_dquot(dquot)) {
eafc474e202978 Carlos Maiolino 2023-07-25  297  		/* Remove entry from the tree */
eafc474e202978 Carlos Maiolino 2023-07-25  298  		rb_erase(&entry->node, info->dqi_priv);
eafc474e202978 Carlos Maiolino 2023-07-25  299  		kfree(entry);
eafc474e202978 Carlos Maiolino 2023-07-25  300  	} else {
eafc474e202978 Carlos Maiolino 2023-07-25  301  		/* Store the limits in the tree */
eafc474e202978 Carlos Maiolino 2023-07-25  302  		spin_lock(&dquot->dq_dqb_lock);
eafc474e202978 Carlos Maiolino 2023-07-25  303  		entry->bhardlimit = dquot->dq_dqb.dqb_bhardlimit;
eafc474e202978 Carlos Maiolino 2023-07-25  304  		entry->bsoftlimit = dquot->dq_dqb.dqb_bsoftlimit;
eafc474e202978 Carlos Maiolino 2023-07-25  305  		entry->ihardlimit = dquot->dq_dqb.dqb_ihardlimit;
eafc474e202978 Carlos Maiolino 2023-07-25  306  		entry->isoftlimit = dquot->dq_dqb.dqb_isoftlimit;
eafc474e202978 Carlos Maiolino 2023-07-25  307  		spin_unlock(&dquot->dq_dqb_lock);
eafc474e202978 Carlos Maiolino 2023-07-25  308  	}
eafc474e202978 Carlos Maiolino 2023-07-25  309  
eafc474e202978 Carlos Maiolino 2023-07-25  310  	clear_bit(DQ_ACTIVE_B, &dquot->dq_flags);
eafc474e202978 Carlos Maiolino 2023-07-25  311  	up_write(&dqopt->dqio_sem);
eafc474e202978 Carlos Maiolino 2023-07-25  312  
eafc474e202978 Carlos Maiolino 2023-07-25  313  out_dqlock:
eafc474e202978 Carlos Maiolino 2023-07-25  314  	mutex_unlock(&dquot->dq_lock);
eafc474e202978 Carlos Maiolino 2023-07-25  315  	return 0;
eafc474e202978 Carlos Maiolino 2023-07-25  316  }
eafc474e202978 Carlos Maiolino 2023-07-25  317  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
