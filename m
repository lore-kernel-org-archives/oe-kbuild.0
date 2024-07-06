Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A286134AC
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jul 2024 03:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720237769; cv=none; b=dkeNsFvsjLgmLm+Avpwj8kXK3nFw+6nB9EJNrEAN/vAHVBSWgRgDbY2jIuqrnuDuxz3nhBxpcCiXgAtv6OnaTaAp4juv7Vvi1POILPGTN/Y2BvwRzXpThQ7i0nS8rvrKiFWJLqV9NfMN8YNad/fGOr3X+i8dPoireAfV0xxOA/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720237769; c=relaxed/simple;
	bh=cgp+Op5e1EPA67z9hrw1+r137ylBmB0W38LasrueXzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ik7R26v/5AYTlFx5VJb4whLSgICpzwFztP8kFYqMnzFDaD8jnRmmoXUVsyk/19lNtegXmn5CXTiuTrz8UgSrkmVJF8B5noXhZThor3p765rXI706DKc2ub/NVvcc6OeMY4EMmvo6SGDTIJc++CpAXWdOZNJj94G0DTrIV6WCfqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0cbMY3k; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0cbMY3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720237768; x=1751773768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cgp+Op5e1EPA67z9hrw1+r137ylBmB0W38LasrueXzk=;
  b=n0cbMY3kGrtkPv+cNrhwPtpLHRuBctHJSz688FWIEyia3iapBOS+bckh
   inb4i5kV6QHQrkfXYqiUTWKTUIoYKCU+scK/Elv/FTmBmKDOWgbzVbZ3t
   HPXGXyRXqYaWHseOyB81IOXzn2+Kds5/iuFApVSjG2L7gpnKb7tXKkoh4
   Vop5lxrKOtTC3ebrzZerrvg7W/lq1M6IwKipDdVW/q7kOVe05CIUSBwC2
   3PhnLcmIFkh/MQsJZif5rJT3M1zoHiaFK3PChjymrsYn7unKV7vYmIkiF
   GsXQ3LVM2oySqKoPix1ZnWT8iiSc2V//fLKOvC3aT+0ZvhdCqlz9R0VLN
   g==;
X-CSE-ConnectionGUID: JnKHJeW3Qe2/Z4vIR4HFrA==
X-CSE-MsgGUID: FzAQLsWCTBGbb239KTcuEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="42941409"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="42941409"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 20:49:27 -0700
X-CSE-ConnectionGUID: UndC/OgjR/ule5h8O4jTOg==
X-CSE-MsgGUID: SSPRHZNLRaSTjmij0DTUSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="77754407"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Jul 2024 20:49:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPwQN-000THg-0l;
	Sat, 06 Jul 2024 03:49:23 +0000
Date: Sat, 6 Jul 2024 11:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:3305
 mlx5_eswitch_reload_ib_reps() warn: iterator 'i' not incremented
Message-ID: <202407061142.Go8yrIpO-lkp@intel.com>
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
head:   1dd28064d4164a4dc9096fd1a7990d2de15f2bb6
commit: 0f06228d4a2dcc1fca5b3ddb0eefa09c05b102c4 net/mlx5: Reload only IB representors upon lag disable/enable
date:   8 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-161-20240706 (https://download.01.org/0day-ci/archive/20240706/202407061142.Go8yrIpO-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407061142.Go8yrIpO-lkp@intel.com/

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
