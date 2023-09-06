Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C85CED6
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Sep 2023 12:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694003050; x=1725539050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=16O78AbKOx47kq644sNXdRW75bOkYpcbCH6okmlxgKk=;
  b=X6R9CMObby1Rg783PuOVLVLPq9uJsjtBprUQNtXx3tcNcm/64aVYHFRS
   I8J3Hy820sMB58nKkwlFJrPEFijQBF6s1Wo3aNyJXnBd+L1apzBa4XuOJ
   scYmOFRobkDGKPKRFAJb3hNngQNSUJ71dShPoGtCdpyObT+GeJf6fFA20
   cqdZ2S8FiuabDMt0uWVGhnUiyDlwe0dnDovNK9UEuxvyh3+Lp+mx+ttfM
   KxGkH7KnDp/2aGkXptA0UVVnuRO1yhsCHMrS68fKdc9f8p2anxH2hLL5A
   b7E+JPFH42wAoH8TiM8PJ9Y+pXK9uBf0N7rhcExNDxxZcGwY4aj0uK9i3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="376966463"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="376966463"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 05:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="856416973"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="856416973"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2023 05:24:07 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdrZl-0000Cl-1p;
	Wed, 06 Sep 2023 12:24:05 +0000
Date: Wed, 6 Sep 2023 20:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [leon-rdma:rdma-next 19/30] checkpatch: WARNING: struct kobj_type
 should normally be const
Message-ID: <202309062015.RNS4j8Xg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>
CC: Yishai Hadas <yishaih@mellanox.com>
CC: Feras Daoud <ferasda@mellanox.com>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   62e60515ccc64acd2581d41abc324b559c973d79
commit: 5ac17a23a1f6ce7889b262d3f064ad1c098423ca [19/30] RDMA/core: Introduce peer memory interface
:::::: branch date: 4 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20230906/202309062015.RNS4j8Xg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309062015.RNS4j8Xg-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#26: 
 https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver/blob/master/drivers/gpu/drm/amd/amdkfd/kfd_peerdirect.c

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#64: 
new file mode 100644

WARNING: struct kobj_type should normally be const
#286: drivers/infiniband/core/peer_mem.c:146:
+static struct kobj_type peer_mem_type = {

WARNING: Block comments use * on subsequent lines
#824: drivers/infiniband/core/peer_mem.c:684:
+/* Use it like this:
+struct peer_memory_client_ex peer_memory_test = {

WARNING: From:/Signed-off-by: email address mismatch: 'From: Jason Gunthorpe <jgg@nvidia.com>' != 'Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
