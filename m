Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5A82FC00F
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 22:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764196468; cv=none; b=DwArq9zNU6GQ8Yvo6mLEeI6wCLu+jEEBHuYUWZTtWcz5D4/3J7kzyzYvE9YBS7N0V9TBncBq0G1fz5RDmldR+g2OxXdTYMPJrlNkn7wOPwQB10qFZP/+RR52O41R0r/fkvHQwPsEk139R95FVEm+z7tOEEUI2HlaPc6RXIZx6tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764196468; c=relaxed/simple;
	bh=Ci6awYfQkQMv1IguPXNc0n8HgVV45ZceRL/XZspAd6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i/mWP24TWVtH0uGltMYc+YN7XgZvDz6NMBb1ktDFef+ne42tWAeTcC2Jug3RUpKXEOH1oyCxseSeSU3bZ70JSfW3B1QIu6nv/8uDkq2mighQ2qlj1yx/zKcLxa4/eVd1hbQQyKfSCKkmzGsmgzezRWqRqL17iIGaJTMUqSApiwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZR9ECbJF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZR9ECbJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764196467; x=1795732467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ci6awYfQkQMv1IguPXNc0n8HgVV45ZceRL/XZspAd6A=;
  b=ZR9ECbJFyf6tpH22VbzdH6Qi/rJIdP3dfLzXNUzTCuu+M+YIkif8ZHbV
   i1j2SNWmqFD0GgYJ9ycSCkasbya4I/KKgDUIaC8klduofBF02iKaJChwb
   rukDXaF8mTsBt//AOGuDerOwSoS+nrJYZ5gouWm6lmeEO0CitlgIK57LV
   leN/JdWt2RCqVQkH/3vi4p3f+dYNI2fdKKQ8frG/UbGxQ04w31Js9YRA1
   Cr8sOV1rxmBTYxR7UApVpovIaAZzn0WUS1zADvJjB8M3XJFcTHM6vCffr
   eaLs5SAxhXzgVSNOjIUPSf/f03zjDYWMzq5FBIc6k11TjtqGTnQ/QjtZ/
   w==;
X-CSE-ConnectionGUID: ojaO3PftQdC+BS4nm/FKAQ==
X-CSE-MsgGUID: NQzk55PaRTGfOpktxilegg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66129650"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="66129650"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 14:34:26 -0800
X-CSE-ConnectionGUID: y6kkqt75SiSH8k0Gl0bpFQ==
X-CSE-MsgGUID: V3zRfIxPQ8iyYNKy4gL0RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="230342356"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Nov 2025 14:34:26 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOO5f-000000003QO-0yiV;
	Wed, 26 Nov 2025 22:34:23 +0000
Date: Thu, 27 Nov 2025 06:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/esw/adj_vport.c:118
 mlx5_esw_adjacent_vhcas_cleanup() warn: iterator 'i' not incremented
Message-ID: <202511270626.8qghmU7N-lkp@intel.com>
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
TO: Adithya Jayachandran <ajayachandra@nvidia.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Simon Horman <horms@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4941a17751c99e17422be743c02c923ad706f888
commit: 17426c5d4b1db69c0aa34d0bf6a1552cc2c68d95 net/mlx5: E-Switch, Add support for adjacent functions vports discovery
date:   3 months ago
:::::: branch date: 68 minutes ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20251125 (https://download.01.org/0day-ci/archive/20251127/202511270626.8qghmU7N-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511270626.8qghmU7N-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/esw/adj_vport.c:118 mlx5_esw_adjacent_vhcas_cleanup() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1245 mlx5_eswitch_unload_adj_vf_vports() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1260 mlx5_eswitch_load_adj_vf_vports() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:375 update_allmulti_vports() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1095 mlx5_eswitch_clear_vf_vports_info() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1219 mlx5_eswitch_unload_vf_vports() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1283 mlx5_eswitch_load_vf_vports() warn: iterator 'i' not incremented
drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1880 mlx5_esw_vports_cleanup() warn: iterator 'i' not incremented

vim +/i +118 drivers/net/ethernet/mellanox/mlx5/core/esw/adj_vport.c

17426c5d4b1db6 Adithya Jayachandran 2025-08-29  109  
17426c5d4b1db6 Adithya Jayachandran 2025-08-29  110  void mlx5_esw_adjacent_vhcas_cleanup(struct mlx5_eswitch *esw)
17426c5d4b1db6 Adithya Jayachandran 2025-08-29  111  {
17426c5d4b1db6 Adithya Jayachandran 2025-08-29  112  	struct mlx5_vport *vport;
17426c5d4b1db6 Adithya Jayachandran 2025-08-29  113  	unsigned long i;
17426c5d4b1db6 Adithya Jayachandran 2025-08-29  114  
17426c5d4b1db6 Adithya Jayachandran 2025-08-29  115  	if (!MLX5_CAP_GEN_2(esw->dev, delegated_vhca_max))
17426c5d4b1db6 Adithya Jayachandran 2025-08-29  116  		return;
17426c5d4b1db6 Adithya Jayachandran 2025-08-29  117  
17426c5d4b1db6 Adithya Jayachandran 2025-08-29 @118  	mlx5_esw_for_each_vf_vport(esw, i, vport, U16_MAX) {
17426c5d4b1db6 Adithya Jayachandran 2025-08-29  119  		if (!vport->adjacent)
17426c5d4b1db6 Adithya Jayachandran 2025-08-29  120  			continue;
17426c5d4b1db6 Adithya Jayachandran 2025-08-29  121  		mlx5_esw_adj_vport_destroy(esw, vport);
17426c5d4b1db6 Adithya Jayachandran 2025-08-29  122  	}
17426c5d4b1db6 Adithya Jayachandran 2025-08-29  123  }
17426c5d4b1db6 Adithya Jayachandran 2025-08-29  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
