Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4051A0B1D
	for <oe-kbuild@lists.linux.dev>; Wed, 29 May 2024 18:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717008198; cv=none; b=KFRocoy2wG9iyA7BlWEWdG9Tmr7m80clFW42Viwy8qLs+viIcu/D760CgYaRtRbQT7IFWg666gNF68zypiiawuDtdVJTIZCeKofYlOkguM9l9nzuIgXvqX1k/kRxCwcO7MVSlMtDQRxzNHHs37D6TanomT6whLlOlcuUP+QSaD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717008198; c=relaxed/simple;
	bh=yRlakIgwExThcV/yvNjnMqcvBT7wm+UMshMePkf3fsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hcGiAWhvI1FWzmj3PA85DDyowMR60UDlAjOszIkp3rWIGPuKRfRlpiK/gpDke4u5dB7lYFS6y3ac5N5/bLrcISZ3qJ1bAbNv2vmw3nXPnn8jrHqi29NTrypsuqcaWVsZB+Kc4r4l+KauEHnpb4WoXdiSCvyiQPn+tJlmzFQKx0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtHPUhcy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtHPUhcy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717008196; x=1748544196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yRlakIgwExThcV/yvNjnMqcvBT7wm+UMshMePkf3fsQ=;
  b=dtHPUhcyw41DyQWla6slhxn1R5d4fC1m+U0Pmiiwov+Wsvv2IrMPGWcF
   607VIGWQClA+aGf1Rk1Bd27Ydd9DZCy8/VZgBwnveM7TxbeaqOSOA2GC2
   p0/4ValujxWndbWVPocbRWMrIJ5wMJHPzQBKKXZKqSwFGG1Tyui4NyCPU
   +PRgXDIXl3wtRZBfR0cKkckh1jMaAvx6NNLxUBsAAofKBLgMmradfmDol
   2B3dQ4ILYhL+GkUZTj1VGbRX0l5nMmWRqJqnYmYirB6MtBMuQQSGHfQXA
   ByQtj2lNyEuioI7HqDtmrh2sw+Xpj/oUO5hIsmbW2V+cyC0YxIbOAD+ow
   g==;
X-CSE-ConnectionGUID: ZFUu07aGSGKIqDS3lt9DqA==
X-CSE-MsgGUID: YrqUhiPKRS+NwsYZfhXvCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24048463"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="24048463"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 11:43:16 -0700
X-CSE-ConnectionGUID: AOASyGTMQEuBi/6322R9dA==
X-CSE-MsgGUID: S6Y/PQaFRoCckOxB+slbKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="35556365"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 May 2024 11:43:14 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCOGW-000E5r-29;
	Wed, 29 May 2024 18:43:12 +0000
Date: Thu, 30 May 2024 02:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: fs/netfs/objects.c:148:5-24: WARNING: atomic_dec_and_test variation
 before object free at line 150.
Message-ID: <202405300204.HLp3CCgL-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Dominique Martinet <asmadeus@codewreck.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a4be1ad3a6efea16c56615f31117590fd881358
commit: f89ea63f1c65d3e93b255f14f9d9e05df87955fa netfs, 9p: Fix race between umount and async request completion
date:   2 days ago
:::::: branch date: 2 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-103-20240529 (https://download.01.org/0day-ci/archive/20240530/202405300204.HLp3CCgL-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405300204.HLp3CCgL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/netfs/objects.c:148:5-24: WARNING: atomic_dec_and_test variation before object free at line 150.

vim +148 fs/netfs/objects.c

d9f85a04fb0eee David Howells 2024-03-15  123  
3a4a38e66d2443 David Howells 2022-02-17  124  static void netfs_free_request(struct work_struct *work)
3a4a38e66d2443 David Howells 2022-02-17  125  {
3a4a38e66d2443 David Howells 2022-02-17  126  	struct netfs_io_request *rreq =
3a4a38e66d2443 David Howells 2022-02-17  127  		container_of(work, struct netfs_io_request, work);
f89ea63f1c65d3 David Howells 2024-05-24  128  	struct netfs_inode *ictx = netfs_inode(rreq->inode);
21d706d5cf5709 David Howells 2021-07-09  129  	unsigned int i;
bc899ee1c898e5 David Howells 2021-06-29  130  
3a4a38e66d2443 David Howells 2022-02-17  131  	trace_netfs_rreq(rreq, netfs_rreq_trace_free);
87b57a048964ab David Howells 2022-03-04  132  	netfs_proc_del_rreq(rreq);
40a81101202300 David Howells 2022-02-25  133  	netfs_clear_subrequests(rreq, false);
40a81101202300 David Howells 2022-02-25  134  	if (rreq->netfs_ops->free_request)
40a81101202300 David Howells 2022-02-25  135  		rreq->netfs_ops->free_request(rreq);
3a4a38e66d2443 David Howells 2022-02-17  136  	if (rreq->cache_resources.ops)
3a4a38e66d2443 David Howells 2022-02-17  137  		rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
21d706d5cf5709 David Howells 2021-07-09  138  	if (rreq->direct_bv) {
21d706d5cf5709 David Howells 2021-07-09  139  		for (i = 0; i < rreq->direct_bv_count; i++) {
21d706d5cf5709 David Howells 2021-07-09  140  			if (rreq->direct_bv[i].bv_page) {
21d706d5cf5709 David Howells 2021-07-09  141  				if (rreq->direct_bv_unpin)
21d706d5cf5709 David Howells 2021-07-09  142  					unpin_user_page(rreq->direct_bv[i].bv_page);
21d706d5cf5709 David Howells 2021-07-09  143  			}
21d706d5cf5709 David Howells 2021-07-09  144  		}
21d706d5cf5709 David Howells 2021-07-09  145  		kvfree(rreq->direct_bv);
21d706d5cf5709 David Howells 2021-07-09  146  	}
f89ea63f1c65d3 David Howells 2024-05-24  147  
f89ea63f1c65d3 David Howells 2024-05-24 @148  	if (atomic_dec_and_test(&ictx->io_count))
f89ea63f1c65d3 David Howells 2024-05-24  149  		wake_up_var(&ictx->io_count);
d9f85a04fb0eee David Howells 2024-03-15 @150  	call_rcu(&rreq->rcu, netfs_free_request_rcu);
3a4a38e66d2443 David Howells 2022-02-17  151  }
3a4a38e66d2443 David Howells 2022-02-17  152  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
