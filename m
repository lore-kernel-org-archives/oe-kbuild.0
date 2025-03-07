Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27D62940D
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 17:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741368875; cv=none; b=nNnWoeMEIIhhSgBq/ipag8uXaKyDCinzsLex0KcfgEQyxy8qXzQlm2FZMksNmEasaL/a9z97CthTJR24hbP3sVUf5qLykA+++cWr+jlCjDvVLoGCKgU1tMnDtg0ROK689+UGLrA0yZi8VZdBQkfE72rnyJtRMIaMdgKhQCo0ZSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741368875; c=relaxed/simple;
	bh=yLZRhWR3Xh8C8X7M2Tb6kjPq4OTiu7Po/frEM+kfMeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uDkwbrY1kh2yXW15SDZBBvkURfAOCGkqHZWZblDs/JVrXBYh8DGTAtKUeVvza9Oi6pCMrUm87BRZsnVX+w5eQiCeGT0OGq5vM4X4+EI8XBwSc6e5XWX5t/Ynuevycop5MaHbMWGCCyIB7SoepiNKvqPGGKrQvOjoCCIq4plWQ+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OL5lA9/B; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OL5lA9/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741368874; x=1772904874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yLZRhWR3Xh8C8X7M2Tb6kjPq4OTiu7Po/frEM+kfMeo=;
  b=OL5lA9/BmMUKqkQ8Eazo09Eu6aVVNI5ZfVWGNQqfQivI01hSHhGXruIk
   HTDrGKssXfYjlCmD8VE4iEq8NKu2uQERHC/R2Yvo+GML8Yl8b5OiMRFMt
   jhyHpRh4FTLai4rLrSKDSpq97vuXHVXQsFJipmZVe4669/lV/z7e6DSBX
   Q39bD6oBFoM33glnihGokEMak4P3q03HunnaW5FpxzSMWzEfirlVqaRHQ
   rdGIctJBQiUSmwFubfPoJ4CoNZ6XCUG02C0ny+GWqQ8yLYOvy00QnPVD7
   89VHgmOSEreC6VK0EFoQ/vfsNRs4N8lTp/DwBQeQaZdsyNw3aWUW29LBk
   Q==;
X-CSE-ConnectionGUID: k12MDTz0TnevK2YDiBQG4Q==
X-CSE-MsgGUID: CDqO8joJTH6RHAKP0E8H9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52634255"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="52634255"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 09:34:31 -0800
X-CSE-ConnectionGUID: TcMBSFoYSEGIngijGcYnVw==
X-CSE-MsgGUID: FxbCKStdTKCGeFai1T4d9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="120080579"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Mar 2025 09:34:30 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqbae-0000rh-1F;
	Fri, 07 Mar 2025 17:34:28 +0000
Date: Sat, 8 Mar 2025 01:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8206/9634] fs/nfsd/nfs4callback.c:1631
 nfsd4_run_cb_work() warn: set_bit() takes a bit number
Message-ID: <202503080140.TRD8XYfV-lkp@intel.com>
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
TO: Jeff Layton <jlayton@kernel.org>
CC: Chuck Lever <chuck.lever@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a2f889128969dab41861b6e40111aa03dc57014
commit: 614a76b508220f310a37591caf5de93e09642c82 [8206/9634] nfsd: handle errors from rpc_call_async()
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250306 (https://download.01.org/0day-ci/archive/20250308/202503080140.TRD8XYfV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503080140.TRD8XYfV-lkp@intel.com/

New smatch warnings:
fs/nfsd/nfs4callback.c:1631 nfsd4_run_cb_work() warn: set_bit() takes a bit number

Old smatch warnings:
fs/nfsd/nfs4callback.c:1074 nfsd4_requeue_cb() warn: set_bit() takes a bit number
fs/nfsd/nfs4callback.c:1318 nfsd41_destroy_cb() warn: clear_bit() takes a bit number
fs/nfsd/nfs4callback.c:1621 nfsd4_run_cb_work() warn: test_and_clear_bit() takes a bit number

vim +1631 fs/nfsd/nfs4callback.c

6ff8da088766d7 J. Bruce Fields   2010-06-04  1587  
02e1215f9f72ad Jeff Layton       2014-07-16  1588  static void
0162ac2b978e18 Christoph Hellwig 2014-09-24  1589  nfsd4_run_cb_work(struct work_struct *work)
5878453dbde627 J. Bruce Fields   2010-05-16  1590  {
0162ac2b978e18 Christoph Hellwig 2014-09-24  1591  	struct nfsd4_callback *cb =
8ddb7142c8ab37 Chuck Lever       2024-04-23  1592  		container_of(work, struct nfsd4_callback, cb_work);
fb003923263c3f J. Bruce Fields   2010-05-31  1593  	struct nfs4_client *clp = cb->cb_clp;
6ff8da088766d7 J. Bruce Fields   2010-06-04  1594  	struct rpc_clnt *clnt;
614a76b508220f Jeff Layton       2025-02-20  1595  	int flags, ret;
63e4863fabc6e1 J. Bruce Fields   2009-05-01  1596  
a7cdf065e1126b Chuck Lever       2024-01-26  1597  	trace_nfsd_cb_start(clp);
0162ac2b978e18 Christoph Hellwig 2014-09-24  1598  
a52d726bbd9281 Jeff Layton       2012-03-21  1599  	if (clp->cl_flags & NFSD4_CLIENT_CB_FLAG_MASK)
6ff8da088766d7 J. Bruce Fields   2010-06-04  1600  		nfsd4_process_cb_update(cb);
6ff8da088766d7 J. Bruce Fields   2010-06-04  1601  
6ff8da088766d7 J. Bruce Fields   2010-06-04  1602  	clnt = clp->cl_cb_client;
036ac2778f7b28 Dai Ngo           2025-01-30  1603  	if (!clnt || clp->cl_state == NFSD4_COURTESY) {
036ac2778f7b28 Dai Ngo           2025-01-30  1604  		/*
036ac2778f7b28 Dai Ngo           2025-01-30  1605  		 * Callback channel broken, client killed or
036ac2778f7b28 Dai Ngo           2025-01-30  1606  		 * nfs4_client in courtesy state; give up.
036ac2778f7b28 Dai Ngo           2025-01-30  1607  		 */
2bbfed98a4d82a Trond Myklebust   2019-10-23  1608  		nfsd41_destroy_cb(cb);
6ff8da088766d7 J. Bruce Fields   2010-06-04  1609  		return;
ac94bf58252934 J. Bruce Fields   2010-05-31  1610  	}
4bd9e9b77fc678 Christoph Hellwig 2015-04-30  1611  
4bd9e9b77fc678 Christoph Hellwig 2015-04-30  1612  	/*
4bd9e9b77fc678 Christoph Hellwig 2015-04-30  1613  	 * Don't send probe messages for 4.1 or later.
4bd9e9b77fc678 Christoph Hellwig 2015-04-30  1614  	 */
4bd9e9b77fc678 Christoph Hellwig 2015-04-30  1615  	if (!cb->cb_ops && clp->cl_minorversion) {
8476c69a7fa0f1 Chuck Lever       2021-05-14  1616  		nfsd4_mark_cb_state(clp, NFSD4_CB_UP);
2bbfed98a4d82a Trond Myklebust   2019-10-23  1617  		nfsd41_destroy_cb(cb);
4bd9e9b77fc678 Christoph Hellwig 2015-04-30  1618  		return;
4bd9e9b77fc678 Christoph Hellwig 2015-04-30  1619  	}
4bd9e9b77fc678 Christoph Hellwig 2015-04-30  1620  
8239580bd7033b Jeff Layton       2025-02-20  1621  	if (!test_and_clear_bit(NFSD4_CALLBACK_REQUEUE, &cb->cb_flags)) {
c1ccfcf1a9bf36 Chuck Lever       2024-01-26  1622  		if (cb->cb_ops && cb->cb_ops->prepare)
c1ccfcf1a9bf36 Chuck Lever       2024-01-26  1623  			cb->cb_ops->prepare(cb);
c1ccfcf1a9bf36 Chuck Lever       2024-01-26  1624  	}
8239580bd7033b Jeff Layton       2025-02-20  1625  
c6bb3ca27d78b9 J. Bruce Fields   2012-11-01  1626  	cb->cb_msg.rpc_cred = clp->cl_cb_cred;
6221f1d9b63fed Chuck Lever       2020-04-17  1627  	flags = clp->cl_minorversion ? RPC_TASK_NOCONNECT : RPC_TASK_SOFTCONN;
614a76b508220f Jeff Layton       2025-02-20  1628  	ret = rpc_call_async(clnt, &cb->cb_msg, RPC_TASK_SOFT | flags,
0162ac2b978e18 Christoph Hellwig 2014-09-24  1629  			     cb->cb_ops ? &nfsd4_cb_ops : &nfsd4_cb_probe_ops, cb);
614a76b508220f Jeff Layton       2025-02-20  1630  	if (ret != 0) {
614a76b508220f Jeff Layton       2025-02-20 @1631  		set_bit(NFSD4_CALLBACK_REQUEUE, &cb->cb_flags);
614a76b508220f Jeff Layton       2025-02-20  1632  		nfsd4_queue_cb(cb);
614a76b508220f Jeff Layton       2025-02-20  1633  	}
02e1215f9f72ad Jeff Layton       2014-07-16  1634  }
02e1215f9f72ad Jeff Layton       2014-07-16  1635  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
