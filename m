Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A06219EA5
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741360716; cv=none; b=PLAaU/pTfdRviB/fEuPGWNKrbjgYIaMDLwy9YZb/9thuuUPx7n1T1sCPr56hfbBF5oa/cQtrvlpucmhmkvRYlCYy4Qzq6zzc6c4Gqqy3ZVOsOlwjXUxIJ/qxZwXVXYyp4n6vyFvTxx1uUTjv2B33H7qFntUuDaY4FJeksblYPeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741360716; c=relaxed/simple;
	bh=c1ab9S8c1wd59t2Xf3NvAgVaZIBPKjG0/U0Ct4aJnj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lyLxNxpkA79pU55ZonRW3HHsOkGHcZwkanKXY80Pa9w4OiMNVb/xJXmVEFyHrlyeKcvhSGsDPMN2Dlua0w54UQdD6ndehU/8kD2FpHaqpXHcVRaQJM6Wb7aouPhUTNlqxZFyJXaBz2eBsMDcp/dZ60fZHyDsMxeccG1McPN01tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmA9JwBn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmA9JwBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741360714; x=1772896714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c1ab9S8c1wd59t2Xf3NvAgVaZIBPKjG0/U0Ct4aJnj8=;
  b=PmA9JwBncZCOzQCTDtbuMi1USb93nFYkKnprX8XTqxXk60930+Eew4vC
   nWIhfbn9P8rNYOFDZ7sZoy38P+OrTmDbxJdWAtig51WrJq5+g7Or5Sli+
   5NCLq4Zkvk3vNGzHbw8KCV2JSIzxY1RjoOdmVjmqoD2Qe8hfAMLWmz3d9
   9ERRh3sy9V7Uc23nmjj8WsZys1tsBIS+Y/9/xqh+GDizFKV//E9EgdfK/
   5/GmiWdkFEevJuK5AECbhpnRI7Y3ak2t8EbKwZW28JApX109RTfuuH2SB
   EF1PCL5kCyzILXK801r0PWxOXPvkUa47ovGgWaRpRhmiGhl4MbkhFxAOn
   w==;
X-CSE-ConnectionGUID: mQxswKoVS/eSHuW4AoUd/w==
X-CSE-MsgGUID: 1KOGjScBTVylwVLbb+hV6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42640823"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42640823"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 07:18:33 -0800
X-CSE-ConnectionGUID: 4EcY6otdSEixy5DrhR2bSQ==
X-CSE-MsgGUID: vvxyQxVUSz2Q0/2brTWmVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="120044351"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Mar 2025 07:18:32 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqZT4-0000dP-0v;
	Fri, 07 Mar 2025 15:18:30 +0000
Date: Fri, 7 Mar 2025 23:18:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8205/9634] fs/nfsd/nfs4callback.c:1074
 nfsd4_requeue_cb() warn: set_bit() takes a bit number
Message-ID: <202503072332.8ka5OwiC-lkp@intel.com>
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
commit: 8239580bd7033b1d46cffb114d65e7406fdfd713 [8205/9634] nfsd: move cb_need_restart flag into cb_flags
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250306 (https://download.01.org/0day-ci/archive/20250307/202503072332.8ka5OwiC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503072332.8ka5OwiC-lkp@intel.com/

New smatch warnings:
fs/nfsd/nfs4callback.c:1074 nfsd4_requeue_cb() warn: set_bit() takes a bit number
fs/nfsd/nfs4callback.c:1621 nfsd4_run_cb_work() warn: test_and_clear_bit() takes a bit number

Old smatch warnings:
fs/nfsd/nfs4callback.c:1318 nfsd41_destroy_cb() warn: clear_bit() takes a bit number

vim +1074 fs/nfsd/nfs4callback.c

2bbfed98a4d82a Trond Myklebust 2019-10-23  1066  
d61be1345ca99e Jeff Layton     2025-02-09  1067  static void nfsd4_requeue_cb(struct rpc_task *task, struct nfsd4_callback *cb)
d61be1345ca99e Jeff Layton     2025-02-09  1068  {
d61be1345ca99e Jeff Layton     2025-02-09  1069  	struct nfs4_client *clp = cb->cb_clp;
d61be1345ca99e Jeff Layton     2025-02-09  1070  
d61be1345ca99e Jeff Layton     2025-02-09  1071  	if (!test_bit(NFSD4_CLIENT_CB_KILL, &clp->cl_flags)) {
d61be1345ca99e Jeff Layton     2025-02-09  1072  		trace_nfsd_cb_restart(clp, cb);
d61be1345ca99e Jeff Layton     2025-02-09  1073  		task->tk_status = 0;
8239580bd7033b Jeff Layton     2025-02-20 @1074  		set_bit(NFSD4_CALLBACK_REQUEUE, &cb->cb_flags);
d61be1345ca99e Jeff Layton     2025-02-09  1075  	}
d61be1345ca99e Jeff Layton     2025-02-09  1076  }
d61be1345ca99e Jeff Layton     2025-02-09  1077  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
