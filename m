Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6CA3CF692
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Sep 2026 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788597329; cv=none; b=kwjSBJfPSwL6VmLmwmMTgHJVH5Ovmnx93AC61A1kL7e4WFYFd89zeO19IEmPCtcvf7UdaawGg8pl6XeXd1FX9A4gGU7aePgLjL7mUKno6f95k33J/W9//2NKnHpeZqsLkwrL4MkbCjFYvKoX5PZ9SP/Gq7QVZXQJe3vmg3k/iIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788597329; c=relaxed/simple;
	bh=x9Rj5ucb20rZHkxu9MQixm1lcn+l+BlcColy1zIebCM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Shz7XACe8H+paSgWU/OBXmKZNWBV5eHrr0+PARW5L5xMNPNTbVULjMKhmIeSKoARYdksg0L+4eaZNsD7OhNcSNyW4Rk2T1O55vNxEWoruFEim5+A52RHVeLjbxnHj58HfZ+FkqktC6e+tbOsGNHpI/jgt/QXbCIC5KfzWWKarGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKpT4vM0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKpT4vM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788597327; x=1820133327;
  h=date:from:to:cc:subject:message-id;
  bh=x9Rj5ucb20rZHkxu9MQixm1lcn+l+BlcColy1zIebCM=;
  b=KKpT4vM0fvKYirUMSATQksALTN6cgTZE9zVbPlLXlqHLX7VZ5zUpjMVa
   wmreVocmZqQqRWmEs4xLSpTLFawfdyMkMFA84xmIungRSHYBrAQ9XzVNW
   9a+ssFJheSi3AneFGH6Au2jHh+iwBPrw0rQ8Om1XRGDccSDVkNaP2W8+N
   Zkt9Iylc9eOgowJEXs4o7Vn5JymuSu0KE6d42Jte+5imbeXQna0h0DpAF
   m1JR+9kXBt/jPmkeShgKr/EWUwppaSQn1OKaDCZ9EQTErd2qKtr+EFUx5
   OsLkBZMjt34KQO53V8/72xsBnzIgtuCCximl0uVXNehQkagUrmtQPagym
   w==;
X-CSE-ConnectionGUID: hHJUknmqTHa/RfYWWIgmQA==
X-CSE-MsgGUID: H4+7/wYDRoezi9u1ccLrXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89296894"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="89296894"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:35:26 -0700
X-CSE-ConnectionGUID: uxMu9nGFT9O59MRtIrd70g==
X-CSE-MsgGUID: gQqin6YsScG8PDaZScVhTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="269746415"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Sep 2026 01:35:25 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2lrv-000000000IJ-1NBb;
	Sat, 05 Sep 2026 08:35:23 +0000
Date: Sat, 05 Sep 2026 16:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2783/4370]
 drivers/infiniband/ulp/iser/iser_initiator.c:614 iser_check_remote_inv()
 warn: missing unwind goto?
Message-ID: <202609051647.SMk0YLBD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
CC: Leon Romanovsky <leon@kernel.org>
CC: Max Gurtovoy <mgurtovoy@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
commit: d85f0f0a7c85756fc992c70d869706f19dac9259 [2783/4370] IB/iser: reject a remote invalidation of an unregistered direction
:::::: branch date: 13 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20260904 (https://download.01.org/0day-ci/archive/20260905/202609051647.SMk0YLBD-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609051647.SMk0YLBD-lkp@intel.com/

smatch warnings:
drivers/infiniband/ulp/iser/iser_initiator.c:614 iser_check_remote_inv() warn: missing unwind goto?

vim +614 drivers/infiniband/ulp/iser/iser_initiator.c

59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  590  
ca2770c65b56374 Max Gurtovoy     2021-12-15  591  static int iser_check_remote_inv(struct iser_conn *iser_conn, struct ib_wc *wc,
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  592  				 struct iscsi_hdr *hdr)
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  593  {
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  594  	if (wc->wc_flags & IB_WC_WITH_INVALIDATE) {
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  595  		struct iscsi_task *task;
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  596  		u32 rkey = wc->ex.invalidate_rkey;
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  597  
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  598  		iser_dbg("conn %p: remote invalidation for rkey %#x\n",
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  599  			 iser_conn, rkey);
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  600  
d85f0f0a7c85756 Yehyeong Lee     2026-08-19  601  		if (unlikely(!iser_conn->snd_w_inv))
d85f0f0a7c85756 Yehyeong Lee     2026-08-19  602  			goto bad_inv;
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  603  
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  604  		task = iscsi_itt_to_ctask(iser_conn->iscsi_conn, hdr->itt);
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  605  		if (likely(task)) {
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  606  			struct iscsi_iser_task *iser_task = task->dd_data;
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  607  			struct iser_fr_desc *desc;
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  608  
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  609  			if (iser_task->dir[ISER_DIR_IN]) {
ee4efeaea8837bb Max Gurtovoy     2022-03-08  610  				desc = iser_task->rdma_reg[ISER_DIR_IN].desc;
d85f0f0a7c85756 Yehyeong Lee     2026-08-19  611  				if (unlikely(!desc))
d85f0f0a7c85756 Yehyeong Lee     2026-08-19  612  					goto bad_inv;
65f07f5a09dacf3 Israel Rukshin   2018-09-26  613  				if (unlikely(iser_inv_desc(desc, rkey)))
65f07f5a09dacf3 Israel Rukshin   2018-09-26 @614  					return -EINVAL;
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  615  			}
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  616  
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  617  			if (iser_task->dir[ISER_DIR_OUT]) {
ee4efeaea8837bb Max Gurtovoy     2022-03-08  618  				desc = iser_task->rdma_reg[ISER_DIR_OUT].desc;
d85f0f0a7c85756 Yehyeong Lee     2026-08-19  619  				if (unlikely(!desc))
d85f0f0a7c85756 Yehyeong Lee     2026-08-19  620  					goto bad_inv;
65f07f5a09dacf3 Israel Rukshin   2018-09-26  621  				if (unlikely(iser_inv_desc(desc, rkey)))
65f07f5a09dacf3 Israel Rukshin   2018-09-26  622  					return -EINVAL;
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  623  			}
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  624  		} else {
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  625  			iser_err("failed to get task for itt=%d\n", hdr->itt);
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  626  			return -EINVAL;
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  627  		}
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  628  	}
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  629  
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  630  	return 0;
d85f0f0a7c85756 Yehyeong Lee     2026-08-19  631  
d85f0f0a7c85756 Yehyeong Lee     2026-08-19  632  bad_inv:
d85f0f0a7c85756 Yehyeong Lee     2026-08-19  633  	iser_err("conn %p: unexpected remote invalidation, terminating connection\n",
d85f0f0a7c85756 Yehyeong Lee     2026-08-19  634  		 iser_conn);
d85f0f0a7c85756 Yehyeong Lee     2026-08-19  635  	return -EPROTO;
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  636  }
59caaed7a72a0e3 Jenny Derzhavetz 2015-12-24  637  

:::::: The code at line 614 was first introduced by commit
:::::: 65f07f5a09dacf3b60619f196f096ea3671a5eda IB/iser: Fix possible NULL deref at iser_inv_desc()

:::::: TO: Israel Rukshin <israelr@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
