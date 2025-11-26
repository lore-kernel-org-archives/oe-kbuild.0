Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867982FDC43
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 14:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764167702; cv=none; b=p8Y+1j+XamuJdw769j/MORlKKFi77LB29EthuXnbb9D9crEfLnPC457ukgY3CrWIqRiMreqZJw5p8ZOgkk9NUFRTTbrxGBWb/Otd/wekYFIqsHDNkwzgjXDeZStJH0ReuMSnkEX27emOl84H+aNcack9FvLFxOuNXjzc8ice8gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764167702; c=relaxed/simple;
	bh=fVKWA3nKTfhaitTI/OQrEMOnviHeKVmiJzNhR7nbywQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W070ESVHq4kvowLUbf+CQExoaAMUFCj3JNITvswAZlgCu/tCoZtdMsae7qsLS2fFnUSKwvDzyab9vux44e+MM3lwE04um+L1JrDvAVxndxTa+0sOPmMNd851UJ5/82HUEylR1IUbWTZkcumiTVUmNIw1SXmoQaMAarLc1i3RLMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FrwHFWNK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FrwHFWNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764167701; x=1795703701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fVKWA3nKTfhaitTI/OQrEMOnviHeKVmiJzNhR7nbywQ=;
  b=FrwHFWNKRkC0H+mFYD64uefcylNUUprGWdaIjRbyEgAWJSLhfGjDFtW8
   X0Zqmt+nMf15mQircS5UJbOMk7kE/I+OHeqYJqAYL8t251oGrRrjEnII6
   LZ57WBnoRbzQi8g9MjF7LQV3ibrF4nd/m+6tHo7n/aaDoAtO9gJ339nB9
   PdirqMob2uPhwrFXTj/qFPEMHWGd5s7bvyEIhXy17TLzXOwf9PBqVuGsa
   vBYttECTcrVsRYlkwfvbDJTTywZbMKls9/ctFWwqpClBZEWnQbpFt4N1n
   zqqYRfw55sz1swQoE3FBg7rOQbFgkN6e/sYR7k1cxsjImu8si5RmRuex5
   A==;
X-CSE-ConnectionGUID: mpNaFWEaRHa/j15gsoOVzA==
X-CSE-MsgGUID: F+tDynEgQZau08NlLCFUXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66153797"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66153797"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 06:35:00 -0800
X-CSE-ConnectionGUID: 6yhF4xF4RlCqquoMIrevbQ==
X-CSE-MsgGUID: SQ3SgwWnQuSnprku4ELeCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="216316580"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2025 06:34:59 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOGbg-000000002zD-2m71;
	Wed, 26 Nov 2025 14:34:56 +0000
Date: Wed, 26 Nov 2025 22:34:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/steering/hws/fs_hws.c:89
 mlx5_fs_cleanup_hws_actions_pool() warn: iterator 'i' not incremented
Message-ID: <202511262206.KNrj0ihn-lkp@intel.com>
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
TO: Moshe Shemesh <moshe@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Yevgeny Kliteynik <kliteyn@nvidia.com>
CC: Mark Bloch <mbloch@nvidia.com>
CC: Tariq Toukan <tariqt@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   30f09200cc4aefbd8385b01e41bde2e4565a6f0e
commit: aecd9d1020e3c6d29ecc9efccbcee7863e83c517 net/mlx5: fs, add HWS packet reformat API function
date:   11 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20251125 (https://download.01.org/0day-ci/archive/20251126/202511262206.KNrj0ihn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511262206.KNrj0ihn-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/steering/hws/fs_hws.c:89 mlx5_fs_cleanup_hws_actions_pool() warn: iterator 'i' not incremented

vim +/i +89 drivers/net/ethernet/mellanox/mlx5/core/steering/hws/fs_hws.c

c7e62a788a9838 Moshe Shemesh 2025-01-09   79  
c7e62a788a9838 Moshe Shemesh 2025-01-09   80  static void mlx5_fs_cleanup_hws_actions_pool(struct mlx5_fs_hws_context *fs_ctx)
c7e62a788a9838 Moshe Shemesh 2025-01-09   81  {
c7e62a788a9838 Moshe Shemesh 2025-01-09   82  	struct mlx5_fs_hws_actions_pool *hws_pool = &fs_ctx->hws_pool;
aecd9d1020e3c6 Moshe Shemesh 2025-01-09   83  	struct mlx5_fs_pool *pool;
aecd9d1020e3c6 Moshe Shemesh 2025-01-09   84  	unsigned long i;
aecd9d1020e3c6 Moshe Shemesh 2025-01-09   85  
aecd9d1020e3c6 Moshe Shemesh 2025-01-09   86  	xa_for_each(&hws_pool->el2tol2tnl_pools, i, pool)
aecd9d1020e3c6 Moshe Shemesh 2025-01-09   87  		mlx5_fs_destroy_pr_pool(pool, &hws_pool->el2tol2tnl_pools, i);
aecd9d1020e3c6 Moshe Shemesh 2025-01-09   88  	xa_destroy(&hws_pool->el2tol2tnl_pools);
aecd9d1020e3c6 Moshe Shemesh 2025-01-09  @89  	xa_for_each(&hws_pool->el2tol3tnl_pools, i, pool)
aecd9d1020e3c6 Moshe Shemesh 2025-01-09   90  		mlx5_fs_destroy_pr_pool(pool, &hws_pool->el2tol3tnl_pools, i);
aecd9d1020e3c6 Moshe Shemesh 2025-01-09   91  	xa_destroy(&hws_pool->el2tol3tnl_pools);
aecd9d1020e3c6 Moshe Shemesh 2025-01-09   92  	mlx5_fs_hws_pr_pool_cleanup(&hws_pool->dl3tnltol2_pool);
aecd9d1020e3c6 Moshe Shemesh 2025-01-09   93  	mlx5_fs_hws_pr_pool_cleanup(&hws_pool->insert_hdr_pool);
aecd9d1020e3c6 Moshe Shemesh 2025-01-09   94  	mlx5hws_action_destroy(hws_pool->remove_hdr_vlan_action);
c7e62a788a9838 Moshe Shemesh 2025-01-09   95  	mlx5hws_action_destroy(hws_pool->decapl2_action);
c7e62a788a9838 Moshe Shemesh 2025-01-09   96  	mlx5hws_action_destroy(hws_pool->drop_action);
c7e62a788a9838 Moshe Shemesh 2025-01-09   97  	mlx5hws_action_destroy(hws_pool->push_vlan_action);
c7e62a788a9838 Moshe Shemesh 2025-01-09   98  	mlx5hws_action_destroy(hws_pool->pop_vlan_action);
c7e62a788a9838 Moshe Shemesh 2025-01-09   99  	mlx5hws_action_destroy(hws_pool->tag_action);
c7e62a788a9838 Moshe Shemesh 2025-01-09  100  }
c7e62a788a9838 Moshe Shemesh 2025-01-09  101  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
