Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F782522B
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jan 2024 08:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDSHDKCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704528485; x=1736064485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vmcRATIdSsUFbJGLQYthW/Dwwxym7KNW2iJdk0Bhfi0=;
  b=JDSHDKCMXgNvCZ41AZvEgSKCZp8sa2+V4NNivNgc3Qh9arnQV+wEPHVK
   2kxbGWK6Q4lpbnxq1o0zFd5ZN60PBtUH9QhVXuXBqmac/NBvVnnGtLKO7
   G4aYIWRHgpxeGFBPAXtiQg80K57LuBXP3z0fJ+33leW1FPbzXeTcugiNA
   kkGM4G4bR/quQ+zqURnpKOFqulH7WWCOOuIoaLaRCxDCIcBHyYbpWNJDJ
   lY2xWnYf71VsDoFKR+jKzTlC+YfKTn+CNP+SMNzT39GdojyLChz8WBzRT
   9hTDwErjnBOICQsS/DZWgEFMX6E0QKBLEFimISSfMslDGNmvGJiIDt7ky
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="16251714"
X-IronPort-AV: E=Sophos;i="6.04,336,1695711600"; 
   d="scan'208";a="16251714"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 23:54:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="757154664"
X-IronPort-AV: E=Sophos;i="6.04,336,1695711600"; 
   d="scan'208";a="757154664"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Jan 2024 23:54:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rM1W4-0002Ce-2A;
	Sat, 06 Jan 2024 07:54:48 +0000
Date: Sat, 6 Jan 2024 15:53:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 7503/12662]
 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:6357:1-7: preceding lock
 on line 6318
Message-ID: <202401061506.oP8ZfCVq-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Suman Ghosh <sumang@marvell.com>
CC: Simon Horman <horms@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e2425464bc87159274879ab30f9d4fe624b9fcd2
commit: 10b7572d17871b027de1d17152f08a2dc9c3aef6 [7503/12662] octeontx2-af: Fix multicast/mirror group lock/unlock issue
:::::: branch date: 25 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-r053-20240104 (https://download.01.org/0day-ci/archive/20240106/202401061506.oP8ZfCVq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401061506.oP8ZfCVq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:6357:1-7: preceding lock on line 6318
   drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:6494:1-7: preceding lock on line 6387

vim +6357 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c

51b2804c19cd79 Suman Ghosh 2023-11-30  6295  
51b2804c19cd79 Suman Ghosh 2023-11-30  6296  int rvu_mbox_handler_nix_mcast_grp_destroy(struct rvu *rvu,
51b2804c19cd79 Suman Ghosh 2023-11-30  6297  					   struct nix_mcast_grp_destroy_req *req,
51b2804c19cd79 Suman Ghosh 2023-11-30  6298  					   struct msg_rsp *rsp)
51b2804c19cd79 Suman Ghosh 2023-11-30  6299  {
51b2804c19cd79 Suman Ghosh 2023-11-30  6300  	struct npc_delete_flow_req uninstall_req = { 0 };
51b2804c19cd79 Suman Ghosh 2023-11-30  6301  	struct npc_delete_flow_rsp uninstall_rsp = { 0 };
51b2804c19cd79 Suman Ghosh 2023-11-30  6302  	struct nix_mcast_grp_elem *elem;
51b2804c19cd79 Suman Ghosh 2023-11-30  6303  	struct nix_mcast_grp *mcast_grp;
10b7572d17871b Suman Ghosh 2023-12-13  6304  	int blkaddr, err, ret = 0;
51b2804c19cd79 Suman Ghosh 2023-11-30  6305  	struct nix_mcast *mcast;
51b2804c19cd79 Suman Ghosh 2023-11-30  6306  	struct nix_hw *nix_hw;
51b2804c19cd79 Suman Ghosh 2023-11-30  6307  
51b2804c19cd79 Suman Ghosh 2023-11-30  6308  	err = nix_get_struct_ptrs(rvu, req->hdr.pcifunc, &nix_hw, &blkaddr);
51b2804c19cd79 Suman Ghosh 2023-11-30  6309  	if (err)
51b2804c19cd79 Suman Ghosh 2023-11-30  6310  		return err;
51b2804c19cd79 Suman Ghosh 2023-11-30  6311  
51b2804c19cd79 Suman Ghosh 2023-11-30  6312  	mcast_grp = &nix_hw->mcast_grp;
10b7572d17871b Suman Ghosh 2023-12-13  6313  
10b7572d17871b Suman Ghosh 2023-12-13  6314  	/* If AF is requesting for the deletion,
10b7572d17871b Suman Ghosh 2023-12-13  6315  	 * then AF is already taking the lock
10b7572d17871b Suman Ghosh 2023-12-13  6316  	 */
10b7572d17871b Suman Ghosh 2023-12-13  6317  	if (!req->is_af)
10b7572d17871b Suman Ghosh 2023-12-13 @6318  		mutex_lock(&mcast_grp->mcast_grp_lock);
10b7572d17871b Suman Ghosh 2023-12-13  6319  
51b2804c19cd79 Suman Ghosh 2023-11-30  6320  	elem = rvu_nix_mcast_find_grp_elem(mcast_grp, req->mcast_grp_idx);
10b7572d17871b Suman Ghosh 2023-12-13  6321  	if (!elem) {
10b7572d17871b Suman Ghosh 2023-12-13  6322  		ret = NIX_AF_ERR_INVALID_MCAST_GRP;
10b7572d17871b Suman Ghosh 2023-12-13  6323  		goto unlock_grp;
10b7572d17871b Suman Ghosh 2023-12-13  6324  	}
51b2804c19cd79 Suman Ghosh 2023-11-30  6325  
51b2804c19cd79 Suman Ghosh 2023-11-30  6326  	/* If no mce entries are associated with the group
51b2804c19cd79 Suman Ghosh 2023-11-30  6327  	 * then just remove it from the global list.
51b2804c19cd79 Suman Ghosh 2023-11-30  6328  	 */
51b2804c19cd79 Suman Ghosh 2023-11-30  6329  	if (!elem->mcast_mce_list.count)
51b2804c19cd79 Suman Ghosh 2023-11-30  6330  		goto delete_grp;
51b2804c19cd79 Suman Ghosh 2023-11-30  6331  
51b2804c19cd79 Suman Ghosh 2023-11-30  6332  	/* Delete the associated mcam entry and
51b2804c19cd79 Suman Ghosh 2023-11-30  6333  	 * remove all mce entries from the group
51b2804c19cd79 Suman Ghosh 2023-11-30  6334  	 */
51b2804c19cd79 Suman Ghosh 2023-11-30  6335  	mcast = &nix_hw->mcast;
51b2804c19cd79 Suman Ghosh 2023-11-30  6336  	mutex_lock(&mcast->mce_lock);
51b2804c19cd79 Suman Ghosh 2023-11-30  6337  	if (elem->mcam_index != -1) {
51b2804c19cd79 Suman Ghosh 2023-11-30  6338  		uninstall_req.hdr.pcifunc = req->hdr.pcifunc;
51b2804c19cd79 Suman Ghosh 2023-11-30  6339  		uninstall_req.entry = elem->mcam_index;
51b2804c19cd79 Suman Ghosh 2023-11-30  6340  		rvu_mbox_handler_npc_delete_flow(rvu, &uninstall_req, &uninstall_rsp);
51b2804c19cd79 Suman Ghosh 2023-11-30  6341  	}
51b2804c19cd79 Suman Ghosh 2023-11-30  6342  
51b2804c19cd79 Suman Ghosh 2023-11-30  6343  	nix_free_mce_list(mcast, elem->mcast_mce_list.count,
51b2804c19cd79 Suman Ghosh 2023-11-30  6344  			  elem->mce_start_index, elem->dir);
51b2804c19cd79 Suman Ghosh 2023-11-30  6345  	nix_delete_mcast_mce_list(&elem->mcast_mce_list);
51b2804c19cd79 Suman Ghosh 2023-11-30  6346  	mutex_unlock(&mcast->mce_lock);
51b2804c19cd79 Suman Ghosh 2023-11-30  6347  
51b2804c19cd79 Suman Ghosh 2023-11-30  6348  delete_grp:
51b2804c19cd79 Suman Ghosh 2023-11-30  6349  	list_del(&elem->list);
51b2804c19cd79 Suman Ghosh 2023-11-30  6350  	kfree(elem);
51b2804c19cd79 Suman Ghosh 2023-11-30  6351  	mcast_grp->count--;
10b7572d17871b Suman Ghosh 2023-12-13  6352  
10b7572d17871b Suman Ghosh 2023-12-13  6353  unlock_grp:
51b2804c19cd79 Suman Ghosh 2023-11-30  6354  	if (!req->is_af)
51b2804c19cd79 Suman Ghosh 2023-11-30  6355  		mutex_unlock(&mcast_grp->mcast_grp_lock);
51b2804c19cd79 Suman Ghosh 2023-11-30  6356  
10b7572d17871b Suman Ghosh 2023-12-13 @6357  	return ret;
51b2804c19cd79 Suman Ghosh 2023-11-30  6358  }
51b2804c19cd79 Suman Ghosh 2023-11-30  6359  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
