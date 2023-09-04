Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4837E
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Sep 2023 00:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693786862; x=1725322862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NraEs2irVNIjhvVMXvvHVgtCMeJ/hMXNMXNGJJOO3cI=;
  b=IRG6UtzSV98fpMcs2je16wQs4P8jGWFXDg7bnRTgQkU8N8nY8eKmGzG8
   ghxgfV6AW/7PJ3qHdBNoquXGg9Ci+cIh/ojipgz2qzwNKR/85pm96/j+M
   in6MDxgP+8BYeEEHN49vc9+ivoSct3AkWnBuSa5KmWR5aqf6pUaDHnPhF
   e7crtSvJbXmVgixKVzISstgDzaCo4NXp5LEKIrqHSruWZ1ir0TmbLykpk
   POjOFbbmk0i9x85axA0jKlF8h0cKHYutzVZZ7Ic5ukii0YRgiiZrrNT+g
   vAJipskkE55dpo13pfh3Ei77iKy1JOHm/Kj0FM6zZw3nBnKy6nIrxsUZZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="355987756"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="355987756"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 17:21:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="987324249"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="987324249"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Sep 2023 17:21:00 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcxKs-0003Wx-1g;
	Mon, 04 Sep 2023 00:20:58 +0000
Date: Mon, 4 Sep 2023 08:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [leon-rdma:rdma-next 19/30] checkpatch: WARNING: struct kobj_type
 should normally be const
Message-ID: <202309040824.Psc98zIy-lkp@intel.com>
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
head:   38bffdee6796363445d1a41417723c7b9d285b0b
commit: 5ac17a23a1f6ce7889b262d3f064ad1c098423ca [19/30] RDMA/core: Introduce peer memory interface
:::::: branch date: 11 hours ago
:::::: commit date: 12 days ago
reproduce: (https://download.01.org/0day-ci/archive/20230904/202309040824.Psc98zIy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309040824.Psc98zIy-lkp@intel.com/

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
