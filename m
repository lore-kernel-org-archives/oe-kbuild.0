Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399653DA7E5
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 05:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769061525; cv=none; b=iQZF5Ea7z3Ti6j2N9gKrOkdjdo+dn5vW++eGQ0I6SXq0g44t9xdX5Utf2QkSkL0QHp6AUcfmtZkMy6VIWck3VYR4JtQv30YSVxY1bQKVzdfzi21L2ztruN6KzUYgCIO3wATM82+ZbKQXCqClyPZyS9QW7buciP3SMqKXNMO11lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769061525; c=relaxed/simple;
	bh=+HF5el13Vm2/4YN2y8aGepIhz4JYq6lpQPM47QqIxsM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cNIK9ChiyHyDrOs6hlfFuH9IHZ8iFnB6Hnl2nOQKAhv+3CH5DNJKkzMP54/2L44tOrR9dc/Tf1ALqLn80T9Ff5j281PNVQhGyyqp2nvflBasrdFdtSCEseA2vTUq0b4YPeC0z/LFFefHDLpJ/E4O1IKBKYUmhNPo9TnkM/XlfJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIh46RPy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIh46RPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769061522; x=1800597522;
  h=date:from:to:cc:subject:message-id;
  bh=+HF5el13Vm2/4YN2y8aGepIhz4JYq6lpQPM47QqIxsM=;
  b=VIh46RPytR149aLDEde2hRQWsMYfVK+DpSocj+H9vWLYnzml4mR1Nks7
   PxsoeEB+TfycgbbTGz23lfrx+fUWcJpLHyFAJpf34rTcEEqql9gZEcqoB
   l90Htz4Bv5VysOG5qEFhjkJcPglCL+WbzF0QKfgQrV7wannA7F1iEIG/A
   IMObvRXNhbRDzbnM3leQXfAIGU/mfojajTe4CIzfbrYtWdbCXc/JjmOCE
   V1D7H4iA2rxV+tiYqCiKho3Ly1v6SRwG6lkMWOaM9r1lR88idTVGaekwq
   tWN0lpIjbtELddZSXWxT1dBPCJ6002PdkPqFWRZmcPAuRP++dL3l9fSJ5
   Q==;
X-CSE-ConnectionGUID: HPZVG4YhTeuUhToJ6RtSkg==
X-CSE-MsgGUID: PC/HhxScRbamWY5G7ffOxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69494612"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="69494612"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 21:58:40 -0800
X-CSE-ConnectionGUID: gzSwOg76RcWP4cP288ZuDA==
X-CSE-MsgGUID: 8IDmJe9qTQOa2cvSlDs4Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="205895531"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Jan 2026 21:58:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viniG-00000000SVX-2YHS;
	Thu, 22 Jan 2026 05:58:36 +0000
Date: Thu, 22 Jan 2026 13:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2904/8780]
 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c:1051
 mlx5_lag_modify_device_vports_speed() warn: iterator 'i' not incremented
Message-ID: <202601221358.gzX7tgY3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Or Har-Toov" <ohartoov@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>
CC: Maher Sanalla <msanalla@nvidia.com>
CC: Mark Bloch <mbloch@nvidia.com>
CC: Edward Srouji <edwards@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
commit: 50f1d188c580222d7a73e96a338a5dc82360ccc0 [2904/8780] net/mlx5: Propagate LAG effective max_tx_speed to vports
:::::: branch date: 13 hours ago
:::::: commit date: 2 weeks ago
config: alpha-randconfig-r072-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221358.gzX7tgY3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601221358.gzX7tgY3-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c:1051 mlx5_lag_modify_device_vports_speed() warn: iterator 'i' not incremented

vim +/i +1051 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c

50f1d188c58022 Or Har-Toov 2025-12-18  1035  
50f1d188c58022 Or Har-Toov 2025-12-18  1036  static void mlx5_lag_modify_device_vports_speed(struct mlx5_core_dev *mdev,
50f1d188c58022 Or Har-Toov 2025-12-18  1037  						u32 speed)
50f1d188c58022 Or Har-Toov 2025-12-18  1038  {
50f1d188c58022 Or Har-Toov 2025-12-18  1039  	u16 op_mod = MLX5_VPORT_STATE_OP_MOD_ESW_VPORT;
50f1d188c58022 Or Har-Toov 2025-12-18  1040  	struct mlx5_eswitch *esw = mdev->priv.eswitch;
50f1d188c58022 Or Har-Toov 2025-12-18  1041  	struct mlx5_vport *vport;
50f1d188c58022 Or Har-Toov 2025-12-18  1042  	unsigned long i;
50f1d188c58022 Or Har-Toov 2025-12-18  1043  	int ret;
50f1d188c58022 Or Har-Toov 2025-12-18  1044  
50f1d188c58022 Or Har-Toov 2025-12-18  1045  	if (!esw)
50f1d188c58022 Or Har-Toov 2025-12-18  1046  		return;
50f1d188c58022 Or Har-Toov 2025-12-18  1047  
50f1d188c58022 Or Har-Toov 2025-12-18  1048  	if (!MLX5_CAP_ESW(mdev, esw_vport_state_max_tx_speed))
50f1d188c58022 Or Har-Toov 2025-12-18  1049  		return;
50f1d188c58022 Or Har-Toov 2025-12-18  1050  
50f1d188c58022 Or Har-Toov 2025-12-18 @1051  	mlx5_esw_for_each_vport(esw, i, vport) {
50f1d188c58022 Or Har-Toov 2025-12-18  1052  		if (!vport)
50f1d188c58022 Or Har-Toov 2025-12-18  1053  			continue;
50f1d188c58022 Or Har-Toov 2025-12-18  1054  
50f1d188c58022 Or Har-Toov 2025-12-18  1055  		if (vport->vport == MLX5_VPORT_UPLINK)
50f1d188c58022 Or Har-Toov 2025-12-18  1056  			continue;
50f1d188c58022 Or Har-Toov 2025-12-18  1057  
50f1d188c58022 Or Har-Toov 2025-12-18  1058  		ret = mlx5_modify_vport_max_tx_speed(mdev, op_mod,
50f1d188c58022 Or Har-Toov 2025-12-18  1059  						     vport->vport, true, speed);
50f1d188c58022 Or Har-Toov 2025-12-18  1060  		if (ret)
50f1d188c58022 Or Har-Toov 2025-12-18  1061  			mlx5_core_dbg(mdev,
50f1d188c58022 Or Har-Toov 2025-12-18  1062  				      "Failed to set vport %d speed %d, err=%d\n",
50f1d188c58022 Or Har-Toov 2025-12-18  1063  				      vport->vport, speed, ret);
50f1d188c58022 Or Har-Toov 2025-12-18  1064  	}
50f1d188c58022 Or Har-Toov 2025-12-18  1065  }
50f1d188c58022 Or Har-Toov 2025-12-18  1066  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
