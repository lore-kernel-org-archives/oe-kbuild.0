Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466021E231E
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 17:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764177193; cv=none; b=LDnx0Mz4B8E1+vzL9/XONYMcPYB4hjCth9l0a8Az5FPNskVo2fY8SfPoHHhYAGOeztLeSpqNZNWFMdLL2Uw0S3axVq6hnCV/HlORHv0NVcV+HfDod9KeFD46Y3cjIevBNIoe958QWNRdXkY6ViNhxFRIHr02MLMLs+aRXN9iTsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764177193; c=relaxed/simple;
	bh=rcLgso+6/Tw7ngSEgvffTJ+LRjaO0mWuXCKRmAZ7oug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L42pWkrwcVYOfBa7q2A90oCAr9Ezbv42arMN2NaIW7Prdf8ZCoW0e8S5G+zA485IA+Xk3Fko1cO+z4/UFvVOvtqoWMv8ZenydDfyrKrUvyrG2LQxfs4pEtUEcESLtS98p6le8dKZCpDhK2u34tV4Wrk/OU36O4LsFxj+ftqZB8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1C4eu+U; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1C4eu+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764177191; x=1795713191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rcLgso+6/Tw7ngSEgvffTJ+LRjaO0mWuXCKRmAZ7oug=;
  b=O1C4eu+U3/M70Gyr/yaZXgdvw0sH3jDozFaZHJD/SdpIsmEep1MalMIm
   A05h1p6Vo+kTmIzpC6lRaPADrNfh+ljfZH1NGmNB8TRmyXBUuyyM0V1PP
   N/WH91JX5ZuWunpC4AxIg3NEAcgJHbpPVeF/3Aq+TID9lf+FteP4vu1y1
   /lFP1FVMNKe+RObMZ+YupqLj8ADzmqi7URcUlJJD2aPRarnyfVuv9nEFM
   voGaPgXZiAgVNYkECrt8XIIw2iyTaFjePLcWVdA+o3pot03HDJgvspvHx
   C7dKXvYdyCd1oEDlopuIDJoB/1Vs0rSVFHOfETno2e8c4F5xWPqCTG3Sg
   Q==;
X-CSE-ConnectionGUID: yJTexaF0SfKaBeDr6l9Kvg==
X-CSE-MsgGUID: 6WU7EiAfSz6L6DjCX09k1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65408905"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="65408905"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 09:13:10 -0800
X-CSE-ConnectionGUID: YuEyw5vATRaqQX89towH4w==
X-CSE-MsgGUID: 9a5PekIgRkqcVmDHsJS54g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192628375"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Nov 2025 09:13:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOJ4l-0000000039j-2IP2;
	Wed, 26 Nov 2025 17:13:07 +0000
Date: Thu, 27 Nov 2025 01:12:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/steering/hws/fs_hws.c:595
 mlx5_cmd_hws_modify_header_alloc() warn: iterator 'i' not incremented
Message-ID: <202511270112.WRgYlBf3-lkp@intel.com>
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
commit: b36315ca69cb39c839c98a31cae27b266481b0ac net/mlx5: fs, add HWS modify header API function
date:   11 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20251125 (https://download.01.org/0day-ci/archive/20251127/202511270112.WRgYlBf3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511270112.WRgYlBf3-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/steering/hws/fs_hws.c:595 mlx5_cmd_hws_modify_header_alloc() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/steering/hws/fs_hws.c:96 mlx5_fs_cleanup_hws_actions_pool() warn: iterator 'i' not incremented

vim +/i +595 drivers/net/ethernet/mellanox/mlx5/core/steering/hws/fs_hws.c

b36315ca69cb39 Moshe Shemesh 2025-01-09  576  
b36315ca69cb39 Moshe Shemesh 2025-01-09  577  static int mlx5_cmd_hws_modify_header_alloc(struct mlx5_flow_root_namespace *ns,
b36315ca69cb39 Moshe Shemesh 2025-01-09  578  					    u8 namespace, u8 num_actions,
b36315ca69cb39 Moshe Shemesh 2025-01-09  579  					    void *modify_actions,
b36315ca69cb39 Moshe Shemesh 2025-01-09  580  					    struct mlx5_modify_hdr *modify_hdr)
b36315ca69cb39 Moshe Shemesh 2025-01-09  581  {
b36315ca69cb39 Moshe Shemesh 2025-01-09  582  	struct mlx5_fs_hws_actions_pool *hws_pool = &ns->fs_hws_context.hws_pool;
b36315ca69cb39 Moshe Shemesh 2025-01-09  583  	struct mlx5hws_action_mh_pattern pattern = {};
b36315ca69cb39 Moshe Shemesh 2025-01-09  584  	struct mlx5_fs_hws_mh *mh_data = NULL;
b36315ca69cb39 Moshe Shemesh 2025-01-09  585  	struct mlx5hws_action *hws_action;
b36315ca69cb39 Moshe Shemesh 2025-01-09  586  	struct mlx5_fs_pool *pool;
b36315ca69cb39 Moshe Shemesh 2025-01-09  587  	unsigned long i, cnt = 0;
b36315ca69cb39 Moshe Shemesh 2025-01-09  588  	bool known_pattern;
b36315ca69cb39 Moshe Shemesh 2025-01-09  589  	int err;
b36315ca69cb39 Moshe Shemesh 2025-01-09  590  
b36315ca69cb39 Moshe Shemesh 2025-01-09  591  	pattern.sz = MLX5_UN_SZ_BYTES(set_add_copy_action_in_auto) * num_actions;
b36315ca69cb39 Moshe Shemesh 2025-01-09  592  	pattern.data = modify_actions;
b36315ca69cb39 Moshe Shemesh 2025-01-09  593  
b36315ca69cb39 Moshe Shemesh 2025-01-09  594  	known_pattern = false;
b36315ca69cb39 Moshe Shemesh 2025-01-09 @595  	xa_for_each(&hws_pool->mh_pools, i, pool) {
b36315ca69cb39 Moshe Shemesh 2025-01-09  596  		if (mlx5_fs_hws_mh_pool_match(pool, &pattern)) {
b36315ca69cb39 Moshe Shemesh 2025-01-09  597  			known_pattern = true;
b36315ca69cb39 Moshe Shemesh 2025-01-09  598  			break;
b36315ca69cb39 Moshe Shemesh 2025-01-09  599  		}
b36315ca69cb39 Moshe Shemesh 2025-01-09  600  		cnt++;
b36315ca69cb39 Moshe Shemesh 2025-01-09  601  	}
b36315ca69cb39 Moshe Shemesh 2025-01-09  602  
b36315ca69cb39 Moshe Shemesh 2025-01-09  603  	if (!known_pattern) {
b36315ca69cb39 Moshe Shemesh 2025-01-09  604  		pool = mlx5_fs_create_mh_pool(ns->dev, &pattern,
b36315ca69cb39 Moshe Shemesh 2025-01-09  605  					      &hws_pool->mh_pools, cnt);
b36315ca69cb39 Moshe Shemesh 2025-01-09  606  		if (IS_ERR(pool))
b36315ca69cb39 Moshe Shemesh 2025-01-09  607  			return PTR_ERR(pool);
b36315ca69cb39 Moshe Shemesh 2025-01-09  608  	}
b36315ca69cb39 Moshe Shemesh 2025-01-09  609  	mh_data = mlx5_fs_hws_mh_pool_acquire_mh(pool);
b36315ca69cb39 Moshe Shemesh 2025-01-09  610  	if (IS_ERR(mh_data)) {
b36315ca69cb39 Moshe Shemesh 2025-01-09  611  		err = PTR_ERR(mh_data);
b36315ca69cb39 Moshe Shemesh 2025-01-09  612  		goto destroy_pool;
b36315ca69cb39 Moshe Shemesh 2025-01-09  613  	}
b36315ca69cb39 Moshe Shemesh 2025-01-09  614  	hws_action = mh_data->bulk->hws_action;
b36315ca69cb39 Moshe Shemesh 2025-01-09  615  	mh_data->data = kmemdup(pattern.data, pattern.sz, GFP_KERNEL);
b36315ca69cb39 Moshe Shemesh 2025-01-09  616  	if (!mh_data->data) {
b36315ca69cb39 Moshe Shemesh 2025-01-09  617  		err = -ENOMEM;
b36315ca69cb39 Moshe Shemesh 2025-01-09  618  		goto release_mh;
b36315ca69cb39 Moshe Shemesh 2025-01-09  619  	}
b36315ca69cb39 Moshe Shemesh 2025-01-09  620  	modify_hdr->fs_hws_action.mh_data = mh_data;
b36315ca69cb39 Moshe Shemesh 2025-01-09  621  	modify_hdr->fs_hws_action.fs_pool = pool;
b36315ca69cb39 Moshe Shemesh 2025-01-09  622  	modify_hdr->owner = MLX5_FLOW_RESOURCE_OWNER_SW;
b36315ca69cb39 Moshe Shemesh 2025-01-09  623  	modify_hdr->fs_hws_action.hws_action = hws_action;
b36315ca69cb39 Moshe Shemesh 2025-01-09  624  
b36315ca69cb39 Moshe Shemesh 2025-01-09  625  	return 0;
b36315ca69cb39 Moshe Shemesh 2025-01-09  626  
b36315ca69cb39 Moshe Shemesh 2025-01-09  627  release_mh:
b36315ca69cb39 Moshe Shemesh 2025-01-09  628  	mlx5_fs_hws_mh_pool_release_mh(pool, mh_data);
b36315ca69cb39 Moshe Shemesh 2025-01-09  629  destroy_pool:
b36315ca69cb39 Moshe Shemesh 2025-01-09  630  	if (!known_pattern)
b36315ca69cb39 Moshe Shemesh 2025-01-09  631  		mlx5_fs_destroy_mh_pool(pool, &hws_pool->mh_pools, cnt);
b36315ca69cb39 Moshe Shemesh 2025-01-09  632  	return err;
b36315ca69cb39 Moshe Shemesh 2025-01-09  633  }
b36315ca69cb39 Moshe Shemesh 2025-01-09  634  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
