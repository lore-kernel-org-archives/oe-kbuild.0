Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E536431DD8A
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 12:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764073789; cv=none; b=a2tPaVZBWygMIqQUxcpxYJhoKlB948dmYQAKjExCM+SkEGXHHmX1HyHSQDwK8zkbHP6vVK52wp0hAHHi8+KGBEvXo63B9lwkHy361cc85chLLz+rqgTSaJvzrMXvltA78OYBUUQbxgUyt57jezmJqCS8w/YRXeVO0bfVvUpPzRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764073789; c=relaxed/simple;
	bh=xZguPIYJ8sQL97UPdEjgtdQ5mfT/afsgGYGScepZu2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p6EMh088Y+pcC856o0p3VM4emQdUB6/aU+aEF8wM8UiGtC6NmbKiL/myhKFVdiDQ8imVtf6lLAwq+dd8fXIQViZko/EuvPSrtxhSZdvLD6objEq784vLmu9XFNmbro5L6mHVV86bV2aNaw+LCHIjmztZJm7Myb5MgJVYoGgYLNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPzavsFK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPzavsFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764073786; x=1795609786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xZguPIYJ8sQL97UPdEjgtdQ5mfT/afsgGYGScepZu2o=;
  b=PPzavsFKsXiS1wnrlWWYBAebgm3YcMiIGlTK265J0+rWwVzf/l62nhyt
   LCWDPhkWeQol9LvOlEXQS6xEbAJ/Fy9o325JLFV8paiiqoJXc7KyISzi/
   F3l7wt8ske3v2ejXozXYaYqw7gsdiZY5mpBB7xzdW0FbwKiRmPOlVaXq9
   VJuT6dd2tHd+UPbqfnIu3dd/aB7tVvwOklVmp9EoFZ1K7KmW8X3HHPpU6
   NP2j4zw206W9FdJGawzH4r9Vv+p33Bb0bhzmxcn5mYQKtF19FMvoPLTyi
   +yTL2/fTGvRGLOUBZmo3LXffT8oHKCh76VtfFvogvlSGvgDEL7e46gc9u
   Q==;
X-CSE-ConnectionGUID: QCGQOjE+Q4W/XuSw/6/8mA==
X-CSE-MsgGUID: xctjEhrKTiWyuhN2L9rDrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77567014"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="77567014"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 04:29:43 -0800
X-CSE-ConnectionGUID: JRVOxdfATSKC/Yrklk3dgA==
X-CSE-MsgGUID: gR9DPXCTRVyuIEK6g3OwtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="229904470"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Nov 2025 04:29:42 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNsAt-000000001mH-20Ul;
	Tue, 25 Nov 2025 12:29:39 +0000
Date: Tue, 25 Nov 2025 20:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/steering/hws/fs_hws.c:89
 mlx5_fs_cleanup_hws_actions_pool() warn: iterator 'i' not incremented
Message-ID: <202511252216.qKF69zAp-lkp@intel.com>
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
head:   ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
commit: aecd9d1020e3c6d29ecc9efccbcee7863e83c517 net/mlx5: fs, add HWS packet reformat API function
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20251125 (https://download.01.org/0day-ci/archive/20251125/202511252216.qKF69zAp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511252216.qKF69zAp-lkp@intel.com/

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
