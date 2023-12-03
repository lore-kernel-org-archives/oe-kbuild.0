Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3C3A3B
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpSyNija"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585116; x=1733121116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3FmdyzkHi0BXvcQ7rST1nv9m8fSPqG4DohCWVkWfRM=;
  b=OpSyNijazvHtISKljqRjnVBQDgtQms3pRAiYdPEpOwH8py9swbb8mocf
   z+DgbD9l+nAcvzlLIfPm6oD3ExjYmmydfFbVEM4Isgmfbndu2vZIpgVl3
   JJ45Om98T96qOPTIdMx6oAEg8YvDKhr4XfNbZ/VgghFnVXo/wX7cp4fpM
   pisZKiG112HF5Umxi2+c+7a44/JQu4UKsi8+DqOaNrBnpZaipkg1M1k+b
   mdK+gz523LXdrbHloYUxXSbrdT0Z91llF5LEp8Eoutub0OwTUGcGe7g25
   xzhgI+/AUWGE4VEZU+TwydjJzC/Cuy0Ja9LznfQ6M0yDhMaKRavc13CE9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="6942684"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="6942684"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:31:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="893652743"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="893652743"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 02 Dec 2023 22:31:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g11-0006KT-2N;
	Sun, 03 Dec 2023 06:31:43 +0000
Date: Sun, 3 Dec 2023 14:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/rds/rdma.c:486 rds_rdma_unuse() warn: 'mr' double freed
Message-ID: <202312022032.6jmnIOv2-lkp@intel.com>
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
TO: "Ka-Cheong Poon" <ka-cheong.poon@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 2fabef4f65b46b261434a27ecdce291b63de8522 net/rds: Fix MR reference counting problem
date:   3 years, 8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 years, 8 months ago
config: i386-randconfig-141-20231109 (https://download.01.org/0day-ci/archive/20231202/202312022032.6jmnIOv2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312022032.6jmnIOv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312022032.6jmnIOv2-lkp@intel.com/

smatch warnings:
net/rds/rdma.c:486 rds_rdma_unuse() warn: 'mr' double freed

vim +/mr +486 net/rds/rdma.c

eff5f53bef75c0 Andy Grover       2009-02-24  438  
eff5f53bef75c0 Andy Grover       2009-02-24  439  /*
eff5f53bef75c0 Andy Grover       2009-02-24  440   * This is called when we receive an extension header that
eff5f53bef75c0 Andy Grover       2009-02-24  441   * tells us this MR was used. It allows us to implement
eff5f53bef75c0 Andy Grover       2009-02-24  442   * use_once semantics
eff5f53bef75c0 Andy Grover       2009-02-24  443   */
eff5f53bef75c0 Andy Grover       2009-02-24  444  void rds_rdma_unuse(struct rds_sock *rs, u32 r_key, int force)
eff5f53bef75c0 Andy Grover       2009-02-24  445  {
eff5f53bef75c0 Andy Grover       2009-02-24  446  	struct rds_mr *mr;
eff5f53bef75c0 Andy Grover       2009-02-24  447  	unsigned long flags;
eff5f53bef75c0 Andy Grover       2009-02-24  448  	int zot_me = 0;
eff5f53bef75c0 Andy Grover       2009-02-24  449  
eff5f53bef75c0 Andy Grover       2009-02-24  450  	spin_lock_irqsave(&rs->rs_rdma_lock, flags);
eff5f53bef75c0 Andy Grover       2009-02-24  451  	mr = rds_mr_tree_walk(&rs->rs_rdma_keys, r_key, NULL);
3ef13f3c22aaea Andy Grover       2010-01-12  452  	if (!mr) {
c536a068870a08 Santosh Shilimkar 2016-07-03  453  		pr_debug("rds: trying to unuse MR with unknown r_key %u!\n",
c536a068870a08 Santosh Shilimkar 2016-07-03  454  			 r_key);
3ef13f3c22aaea Andy Grover       2010-01-12  455  		spin_unlock_irqrestore(&rs->rs_rdma_lock, flags);
3ef13f3c22aaea Andy Grover       2010-01-12  456  		return;
3ef13f3c22aaea Andy Grover       2010-01-12  457  	}
3ef13f3c22aaea Andy Grover       2010-01-12  458  
2fabef4f65b46b Ka-Cheong Poon    2020-04-08  459  	/* Get a reference so that the MR won't go away before calling
2fabef4f65b46b Ka-Cheong Poon    2020-04-08  460  	 * sync_mr() below.
2fabef4f65b46b Ka-Cheong Poon    2020-04-08  461  	 */
2fabef4f65b46b Ka-Cheong Poon    2020-04-08  462  	kref_get(&mr->r_kref);
2fabef4f65b46b Ka-Cheong Poon    2020-04-08  463  
2fabef4f65b46b Ka-Cheong Poon    2020-04-08  464  	/* If it is going to be freed, remove it from the tree now so
2fabef4f65b46b Ka-Cheong Poon    2020-04-08  465  	 * that no other thread can find it and free it.
2fabef4f65b46b Ka-Cheong Poon    2020-04-08  466  	 */
3ef13f3c22aaea Andy Grover       2010-01-12  467  	if (mr->r_use_once || force) {
eff5f53bef75c0 Andy Grover       2009-02-24  468  		rb_erase(&mr->r_rb_node, &rs->rs_rdma_keys);
eff5f53bef75c0 Andy Grover       2009-02-24  469  		RB_CLEAR_NODE(&mr->r_rb_node);
eff5f53bef75c0 Andy Grover       2009-02-24  470  		zot_me = 1;
3ef13f3c22aaea Andy Grover       2010-01-12  471  	}
eff5f53bef75c0 Andy Grover       2009-02-24  472  	spin_unlock_irqrestore(&rs->rs_rdma_lock, flags);
eff5f53bef75c0 Andy Grover       2009-02-24  473  
eff5f53bef75c0 Andy Grover       2009-02-24  474  	/* May have to issue a dma_sync on this memory region.
eff5f53bef75c0 Andy Grover       2009-02-24  475  	 * Note we could avoid this if the operation was a RDMA READ,
eff5f53bef75c0 Andy Grover       2009-02-24  476  	 * but at this point we can't tell. */
eff5f53bef75c0 Andy Grover       2009-02-24  477  	if (mr->r_trans->sync_mr)
eff5f53bef75c0 Andy Grover       2009-02-24  478  		mr->r_trans->sync_mr(mr->r_trans_private, DMA_FROM_DEVICE);
eff5f53bef75c0 Andy Grover       2009-02-24  479  
2fabef4f65b46b Ka-Cheong Poon    2020-04-08  480  	/* Release the reference held above. */
2fabef4f65b46b Ka-Cheong Poon    2020-04-08  481  	kref_put(&mr->r_kref, __rds_put_mr_final);
2fabef4f65b46b Ka-Cheong Poon    2020-04-08  482  
eff5f53bef75c0 Andy Grover       2009-02-24  483  	/* If the MR was marked as invalidate, this will
eff5f53bef75c0 Andy Grover       2009-02-24  484  	 * trigger an async flush. */
2fabef4f65b46b Ka-Cheong Poon    2020-04-08  485  	if (zot_me)
e228a5d05e9ee2 Ka-Cheong Poon    2020-04-08 @486  		kref_put(&mr->r_kref, __rds_put_mr_final);
eff5f53bef75c0 Andy Grover       2009-02-24  487  }
eff5f53bef75c0 Andy Grover       2009-02-24  488  

:::::: The code at line 486 was first introduced by commit
:::::: e228a5d05e9ee25878e9a40de96e7ceb579d4893 net/rds: Replace struct rds_mr's r_refcount with struct kref

:::::: TO: Ka-Cheong Poon <ka-cheong.poon@oracle.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
