Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFC8C8F0
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 02:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728960025; cv=none; b=aKUUvZSDV8QXpiq6+3UZq3uU7c4g+BpRuwx750tQiMR67t6vMmE6A3cxxDuOXlWycAXrnWrBBLHT3/6IVXKjpUQ6rCcXL/tUiIYslUAMaIbd8XvXnp0ojyD6mBjQDNnExCpCy2OSY1FES+1b3G++adUg5jGhTv0RELNRmbZkF64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728960025; c=relaxed/simple;
	bh=VFr/PHpQdQBJgdOEx+H98k5C7F4Ksfr8n2pimw8PaDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LBzKj7tBIsKo0dNvY1eH1O2owJ1T0uY7hztPlC3bhixECFhCCLd6Juz98/WPIDdv48+4o2EakWump6gSUpGAYIfOzYYpiRBXfdHBafzK80Y1sDxvmkP1gMK/OhKaYhExFW/u4QZ07Q5aeneFf+smWJ89QyZNRbkU3RekDhV4vqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dd6ceMff; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dd6ceMff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728960023; x=1760496023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VFr/PHpQdQBJgdOEx+H98k5C7F4Ksfr8n2pimw8PaDM=;
  b=dd6ceMffz8a17+lSXNXPEP9LXU/6V0AIhoWo/ufPoZ87+ej3RIJsQDTR
   B1lglfNFKTaFL6+ccxatRuQz9Ev+BI15sRmqnLjFoMXB0dLabS3PnPiBW
   1pKI0ZjWKyEH6W32HxmSD8fymNGpoPND275E1W+DjnB31ufLxA67koJmX
   17TR8x+eyXaXGMrWq2YQkXrDBwG6rL8nVUY1mmxBZh7zv4VzjaIVax8MQ
   kn4FIh1fF5ZBPsQHlPuXQpa8LSyh5qjTo2+f/U34KJxOlfzhpimWr5y5m
   AZxHfzZ4D8Td59IEXFYN2BE+hDnAmZDd1u765cItrnSedMyLKepG7laSt
   g==;
X-CSE-ConnectionGUID: pcsKaKS2TserQ6/J+z4osg==
X-CSE-MsgGUID: fEDH5iI9R+SahzX16o9MOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27781697"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="27781697"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 19:40:23 -0700
X-CSE-ConnectionGUID: 69snN2LjQRKLHIrQcHpSKg==
X-CSE-MsgGUID: G+RBA0vlRVmFz3EIlcw2hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="78097453"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Oct 2024 19:40:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0XTv-000HVL-2G;
	Tue, 15 Oct 2024 02:40:19 +0000
Date: Tue, 15 Oct 2024 10:40:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:3305
 mlx5_eswitch_reload_ib_reps() warn: iterator 'i' not incremented
Message-ID: <202410151027.kansFjYc-lkp@intel.com>
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
TO: Maher Sanalla <msanalla@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Mark Bloch <mbloch@nvidia.com>
CC: Tariq Toukan <tariqt@nvidia.com>
CC: Simon Horman <horms@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eca631b8fe808748d7585059c4307005ca5c5820
commit: 0f06228d4a2dcc1fca5b3ddb0eefa09c05b102c4 net/mlx5: Reload only IB representors upon lag disable/enable
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151027.kansFjYc-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410151027.kansFjYc-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:3305 mlx5_eswitch_reload_ib_reps() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:1491 esw_vport_tbl_put() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:1507 esw_vport_tbl_get() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:2210 mlx5_eswitch_inline_mode_get() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:2388 esw_offloads_cleanup_reps() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:2401 esw_offloads_init_reps() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:2528 __unload_reps_all_vport() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:2885 mlx5_esw_offloads_rep_event_unpair() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:2919 mlx5_esw_offloads_pair() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:3190 esw_offloads_metadata_uninit() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:3203 esw_offloads_metadata_init() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:4047 mlx5_eswitch_register_vport_reps() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:4065 mlx5_eswitch_unregister_vport_reps() warn: iterator 'i' not incremented

vim +/i +3305 drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c

184867373d8c6b Eli Britstein 2019-03-04  3287  
0f06228d4a2dcc Maher Sanalla 2024-05-09  3288  int mlx5_eswitch_reload_ib_reps(struct mlx5_eswitch *esw)
db202995f5035f Mark Bloch    2021-08-03  3289  {
db202995f5035f Mark Bloch    2021-08-03  3290  	struct mlx5_eswitch_rep *rep;
db202995f5035f Mark Bloch    2021-08-03  3291  	unsigned long i;
db202995f5035f Mark Bloch    2021-08-03  3292  	int ret;
db202995f5035f Mark Bloch    2021-08-03  3293  
db202995f5035f Mark Bloch    2021-08-03  3294  	if (!esw || esw->mode != MLX5_ESWITCH_OFFLOADS)
db202995f5035f Mark Bloch    2021-08-03  3295  		return 0;
db202995f5035f Mark Bloch    2021-08-03  3296  
db202995f5035f Mark Bloch    2021-08-03  3297  	rep = mlx5_eswitch_get_rep(esw, MLX5_VPORT_UPLINK);
db202995f5035f Mark Bloch    2021-08-03  3298  	if (atomic_read(&rep->rep_data[REP_ETH].state) != REP_LOADED)
db202995f5035f Mark Bloch    2021-08-03  3299  		return 0;
db202995f5035f Mark Bloch    2021-08-03  3300  
0f06228d4a2dcc Maher Sanalla 2024-05-09  3301  	ret = __esw_offloads_load_rep(esw, rep, REP_IB);
db202995f5035f Mark Bloch    2021-08-03  3302  	if (ret)
db202995f5035f Mark Bloch    2021-08-03  3303  		return ret;
db202995f5035f Mark Bloch    2021-08-03  3304  
db202995f5035f Mark Bloch    2021-08-03 @3305  	mlx5_esw_for_each_rep(esw, i, rep) {
db202995f5035f Mark Bloch    2021-08-03  3306  		if (atomic_read(&rep->rep_data[REP_ETH].state) == REP_LOADED)
0f06228d4a2dcc Maher Sanalla 2024-05-09  3307  			__esw_offloads_load_rep(esw, rep, REP_IB);
db202995f5035f Mark Bloch    2021-08-03  3308  	}
db202995f5035f Mark Bloch    2021-08-03  3309  
db202995f5035f Mark Bloch    2021-08-03  3310  	return 0;
db202995f5035f Mark Bloch    2021-08-03  3311  }
db202995f5035f Mark Bloch    2021-08-03  3312  

:::::: The code at line 3305 was first introduced by commit
:::::: db202995f5035f13a11df48a0af05edbb3720659 net/mlx5: E-Switch, add logic to enable shared FDB

:::::: TO: Mark Bloch <mbloch@nvidia.com>
:::::: CC: Saeed Mahameed <saeedm@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
