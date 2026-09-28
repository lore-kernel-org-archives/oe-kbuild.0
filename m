Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5606249CF39
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Sep 2026 12:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597299; cv=none; b=d7+u/m+bJ6FOmFLJBkA+PODSQZMxzogEu0Jvxb+1gXarjJjxyZONrdiIHbcLy91W0jgR8fLqnG0RbCnmXCpBRGvz1W+QwPA/WhttsRQ1KAIsFzaMfoX5Lx6IS/LpZf4rXTOOsYFaUvD7TWRdWr6IU6s5jUH+6sA3pWpElmvTsvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597299; c=relaxed/simple;
	bh=eiXiVpPRqKBxgSFmcnK/T24Dbrrl/QuFC5p+gnfvm9I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Onm4NsARxTHgOdXOmT+yscShM0KtANqor1AIl0RIUt6sGuAHCoPms1iumGrcmip6f7WJXPkqubYWrUFNhD7FBBCdhNcVqr54FmOTMdQRQSYYahb2x147jnyLJQk9X6lIFPrBhbrzQVL3TvnIa1O7en5QakQlB9xZJaFaI/smlzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZ2POrcR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZ2POrcR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790597298; x=1822133298;
  h=date:from:to:cc:subject:message-id;
  bh=eiXiVpPRqKBxgSFmcnK/T24Dbrrl/QuFC5p+gnfvm9I=;
  b=RZ2POrcRy4C8PQ1QfK0kTsfCH/jbpMj43YSCdFmdbZgIrQiWCb/0tDer
   IGsI7GRnzM4UoFsLbCtLHUxKnJAvk/Yv2OBVDDvLmD296+6jZA+t2Fk5G
   byKcPMejZMcsaxWlL2pLLtXzJqBWmIXY3BLGhCD48UmnVnqQb8waDvB6/
   +ZOh+Z0nKOigQkLk24r4tUqIxl/hRZi87yqqbYvz9M8PfUA7qvKSaQEIW
   +4iU5vFZSQEUBfQtQSSsy4nqOnFcx8UQJyzJqeQ1h88LNiTTmxpqCivAW
   PUAGfX14oKsbwXkb730l/WPE1+oehb/+/dtG7lpyrXxEzRgHU0HJckl1D
   A==;
X-CSE-ConnectionGUID: W03QdARRTOupaBneKfgKNw==
X-CSE-MsgGUID: z0ajlmgBQ++w9uqLg+7b1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90060335"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90060335"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:08:17 -0700
X-CSE-ConnectionGUID: y7gvBcryTc2qLhioyKCtfQ==
X-CSE-MsgGUID: IK9OTYkkQrSfKYqO32flgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="273640015"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2026 05:08:16 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBA9U-000000000zZ-2ldC;
	Mon, 28 Sep 2026 12:08:12 +0000
Date: Mon, 28 Sep 2026 14:07:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: net/sunrpc/backchannel_rqst.c:249:2-31: opportunity for
 str_true_false(list_empty ( & xprt -> bc_pa_list ))
Message-ID: <202609281359.Rw9Guzpb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Anna Schumaker <anna.schumaker@oracle.com>

Hi Anna,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
commit: 7537db24806fdc3d3ec4fef53babdc22c9219e75 NFS: Merge CONFIG_NFS_V4_1 with CONFIG_NFS_V4
date:   8 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-2101-20260928 (https://download.01.org/0day-ci/archive/20260928/202609281359.Rw9Guzpb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7537db24806f ("NFS: Merge CONFIG_NFS_V4_1 with CONFIG_NFS_V4")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609281359.Rw9Guzpb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/sunrpc/backchannel_rqst.c:249:2-31: opportunity for str_true_false(list_empty ( & xprt -> bc_pa_list ))

vim +249 net/sunrpc/backchannel_rqst.c

42e5c3e2725ba0 Chuck Lever           2015-10-24  224  
42e5c3e2725ba0 Chuck Lever           2015-10-24  225  void xprt_destroy_bc(struct rpc_xprt *xprt, unsigned int max_reqs)
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  226  {
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  227  	struct rpc_rqst *req = NULL, *tmp = NULL;
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  228  
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  229  	dprintk("RPC:        destroy backchannel transport\n");
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  230  
c4ded8d9771c8e Weston Andros Adamson 2012-10-23  231  	if (max_reqs == 0)
c4ded8d9771c8e Weston Andros Adamson 2012-10-23  232  		goto out;
c4ded8d9771c8e Weston Andros Adamson 2012-10-23  233  
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  234  	spin_lock_bh(&xprt->bc_pa_lock);
669996add4c924 Trond Myklebust       2019-10-17  235  	xprt->bc_alloc_max -= min(max_reqs, xprt->bc_alloc_max);
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  236  	list_for_each_entry_safe(req, tmp, &xprt->bc_pa_list, rq_bc_pa_list) {
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  237  		dprintk("RPC:        req=%p\n", req);
628356791b04ea Trond Myklebust       2014-02-11  238  		list_del(&req->rq_bc_pa_list);
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  239  		xprt_free_allocation(req);
7402a4fedc2bc4 Trond Myklebust       2019-07-16  240  		xprt->bc_alloc_count--;
7402a4fedc2bc4 Trond Myklebust       2019-07-16  241  		atomic_dec(&xprt->bc_slot_count);
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  242  		if (--max_reqs == 0)
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  243  			break;
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  244  	}
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  245  	spin_unlock_bh(&xprt->bc_pa_lock);
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  246  
c4ded8d9771c8e Weston Andros Adamson 2012-10-23  247  out:
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  248  	dprintk("RPC:        backchannel list empty= %s\n",
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01 @249  		list_empty(&xprt->bc_pa_list) ? "true" : "false");
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  250  }
fb7a0b9addbdbb Ricardo Labiaga       2009-04-01  251  

:::::: The code at line 249 was first introduced by commit
:::::: fb7a0b9addbdbbb13b7bc02abf55ee524ea19ce1 nfs41: New backchannel helper routines

:::::: TO: Ricardo Labiaga <Ricardo.Labiaga@netapp.com>
:::::: CC: Benny Halevy <bhalevy@panasas.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
