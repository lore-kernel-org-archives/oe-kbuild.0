Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009538F54
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Nov 2024 07:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732605408; cv=none; b=Cx11iXmwDrkwS8QuJEjDu8Bi/XSNwQijY5OmpDIz96lcpeiEa4xI9QlWA9V64Egoh+FuXCgKeFvNvzbyD5YbbStaOerWXjSigQsMM9zMMUXeMblKHIZt6Hyj0KOALUawnm24E9rCFGP1Nhwuec3J0slSB4SF+HlKJ1fB5/5dgyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732605408; c=relaxed/simple;
	bh=cNpm8tCFK1OOGAlzluTNPq2dkqnpAOCe1ApeUbFup2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TOjSA2m9cgAVGlmDMe3Pv07essRL3D6iCJYVd375ji7QIBMrcqe52uD1fN85Q+lk1+CogRPwChMG8PA7zeba8OErJAyvrvSntgHiYgfS9tH7rN0Xf/koNydRY2lVgWROcOpk89XliuSjy5fVsjyPJq6tj8RtTInHs1a0MGnTq+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDqpH601; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDqpH601"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732605407; x=1764141407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cNpm8tCFK1OOGAlzluTNPq2dkqnpAOCe1ApeUbFup2c=;
  b=bDqpH601Y6cujMOFTRvD8s8ySoIH0pqxy4i6IWQON+z0YnLy4P35KvCu
   QGGHdw7rFUb8AwWaEupFXjtQDPlmY83JwdvmH30ypY6ZTZo7F4UprSCoq
   WpK1CgeFZqSnBI0LLH2QBC1C1ivku1R1HyDgaJC6ant4nXMt9Nwz3qA9l
   G6Ff12Tz6Iff81jfuh/hFGw/NKHNysu/qknegzk3RyX/K4WYhw4Sk3ohW
   VQE1gLsGXHKXc4QUtulVySnQ4ua9Pc/kjkjz/dmRZ15YroizTwNwWZUDT
   YU+k/qwkjqSsq7P/Qk8chQaiX1+ywuau9lFVdKVxUu7qYbTZMhT0SuWOU
   A==;
X-CSE-ConnectionGUID: JolvrPGjTqSHhel7nFRRFA==
X-CSE-MsgGUID: MkW95PBATTyqxJmoqtxH/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43364328"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="43364328"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 23:16:46 -0800
X-CSE-ConnectionGUID: Yjc8dJmJQqu1hgbC5kvduw==
X-CSE-MsgGUID: 5IqYNYW5Q5aF46U6f7vjBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="95608388"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Nov 2024 23:16:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFpoR-000799-0x;
	Tue, 26 Nov 2024 07:16:43 +0000
Date: Tue, 26 Nov 2024 15:15:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:3305
 mlx5_eswitch_reload_ib_reps() warn: iterator 'i' not incremented
Message-ID: <202411261524.XWFvn7V3-lkp@intel.com>
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
head:   7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
commit: 0f06228d4a2dcc1fca5b3ddb0eefa09c05b102c4 net/mlx5: Reload only IB representors upon lag disable/enable
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: openrisc-randconfig-r071-20241124 (https://download.01.org/0day-ci/archive/20241126/202411261524.XWFvn7V3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411261524.XWFvn7V3-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:3305 mlx5_eswitch_reload_ib_reps() warn: iterator 'i' not incremented

Old smatch warnings:
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
