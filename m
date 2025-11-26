Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C05301033
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 23:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764199653; cv=none; b=lWVmSPUnwRUhoHpoK4cusF7TMq6cxGoQRYgDNpn083TudCXEAQRi55LUGAcxlVa4KymiDUUW/d/G/QRghi2BdCfsh56scQMR8LBFWTLZ7u2rXGi2qEGXwfQxXDdaieMpRKUi1Lv/aSB8tDZROWAB49i4+zFv+bfplXXSaebfe8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764199653; c=relaxed/simple;
	bh=AAmzWSTUVU6PGRqJUJ2y6vd0Qurt0j/493+QUbJlUR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HCRjaiQ5yZVMhCAuECAMctCz6cU2DyKcU378u9YEMidpi/ah9dlhDvzun4DQRpDFB84wXQO6Fs9ShNPRNMDzSc/n2bCS0BcRevcAO1ITF6vjYAPIv3+gapyWVWHcBJrgc+iKW/DSe4dP+Xc1fE0z4fx4579WueLayRrwv8ou4Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGreoydH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGreoydH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764199651; x=1795735651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AAmzWSTUVU6PGRqJUJ2y6vd0Qurt0j/493+QUbJlUR4=;
  b=AGreoydHazpiKeBJlleIh4Ycse0EKxGgAlE7Tqd387u/WQJyz6DARtus
   HtO+e/BWjjfNx//ObreyTQNZBklEj39IqzdBjTcOuirueInyklVXlyxGy
   uno417zY36nfu1Y/SwVeUA1um9JznYn9Jkp73qnamNw+2KJky4L1fTBQ/
   tHvPWKe7mF/aUihG3BPKL8BWWAS14szDY6lShBrLbHuMVz4FVQHO+ikRs
   Ufd+2dTNEcFcMTP9BPH6K7sA2492DHQ8RksA1tf5DSsne3VEzfY7zOcMf
   2jCPeChWlslEz0oAYdp4G4mJmXBwUNOZ41KUDQTMHG9i5LR59JrPaibZ1
   A==;
X-CSE-ConnectionGUID: JoytnxzeTPSVe2pYrcgJgA==
X-CSE-MsgGUID: yzkmLXLYTOGvjtZmLlDcgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="88890287"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="88890287"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 15:27:29 -0800
X-CSE-ConnectionGUID: QzfaDh4YQX278zCfJXCikA==
X-CSE-MsgGUID: CTY7w+BxTziFyEi1/R1k3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192979886"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Nov 2025 15:27:28 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOOuz-000000003St-3zyP;
	Wed, 26 Nov 2025 23:27:25 +0000
Date: Thu, 27 Nov 2025 07:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [leon-rdma:remove-prefetch-v1 20/65]
 drivers/infiniband/hw/mlx5/ib_rep.c:81 mlx5_ib_release_transport() warn:
 iterator 'i' not incremented
Message-ID: <202511270718.7KIFjwVy-lkp@intel.com>
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
TO: Patrisious Haddad <phaddad@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>
CC: Edward Srouji <edwards@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git remove-prefetch-v1
head:   2ceb7869a58e061f67a7eafe3d7dfd8b8abd582f
commit: 3506242da07156e6804c061554bd01d77c1b463b [20/65] RDMA/mlx5: Change default device for LAG slaves in RDMA TRANSPORT namespaces
:::::: branch date: 16 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-161-20251125 (https://download.01.org/0day-ci/archive/20251127/202511270718.7KIFjwVy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511270718.7KIFjwVy-lkp@intel.com/

New smatch warnings:
drivers/infiniband/hw/mlx5/ib_rep.c:81 mlx5_ib_release_transport() warn: iterator 'i' not incremented
drivers/infiniband/hw/mlx5/ib_rep.c:93 mlx5_ib_take_transport() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/infiniband/hw/mlx5/ib_rep.c:36 mlx5_ib_num_ports_update() warn: iterator 'i' not incremented
drivers/infiniband/hw/mlx5/ib_rep.c:128 mlx5_ib_vport_rep_load() warn: iterator 'i' not incremented
drivers/infiniband/hw/mlx5/ib_rep.c:272 mlx5_ib_register_peer_vport_reps() warn: iterator 'i' not incremented

vim +/i +81 drivers/infiniband/hw/mlx5/ib_rep.c

3506242da07156 Patrisious Haddad 2025-10-29   75  
3506242da07156 Patrisious Haddad 2025-10-29   76  static void mlx5_ib_release_transport(struct mlx5_core_dev *dev)
3506242da07156 Patrisious Haddad 2025-10-29   77  {
3506242da07156 Patrisious Haddad 2025-10-29   78  	struct mlx5_core_dev *peer_dev;
3506242da07156 Patrisious Haddad 2025-10-29   79  	int i, ret;
3506242da07156 Patrisious Haddad 2025-10-29   80  
3506242da07156 Patrisious Haddad 2025-10-29  @81  	mlx5_lag_for_each_peer_mdev(dev, peer_dev, i) {
3506242da07156 Patrisious Haddad 2025-10-29   82  		ret = mlx5_ib_set_owner_transport(peer_dev, peer_dev);
3506242da07156 Patrisious Haddad 2025-10-29   83  		WARN_ON_ONCE(ret);
3506242da07156 Patrisious Haddad 2025-10-29   84  	}
3506242da07156 Patrisious Haddad 2025-10-29   85  }
3506242da07156 Patrisious Haddad 2025-10-29   86  
3506242da07156 Patrisious Haddad 2025-10-29   87  static int mlx5_ib_take_transport(struct mlx5_core_dev *dev)
3506242da07156 Patrisious Haddad 2025-10-29   88  {
3506242da07156 Patrisious Haddad 2025-10-29   89  	struct mlx5_core_dev *peer_dev;
3506242da07156 Patrisious Haddad 2025-10-29   90  	int ret;
3506242da07156 Patrisious Haddad 2025-10-29   91  	int i;
3506242da07156 Patrisious Haddad 2025-10-29   92  
3506242da07156 Patrisious Haddad 2025-10-29  @93  	mlx5_lag_for_each_peer_mdev(dev, peer_dev, i) {
3506242da07156 Patrisious Haddad 2025-10-29   94  		ret = mlx5_ib_set_owner_transport(peer_dev, dev);
3506242da07156 Patrisious Haddad 2025-10-29   95  		if (ret) {
3506242da07156 Patrisious Haddad 2025-10-29   96  			mlx5_ib_release_transport(dev);
3506242da07156 Patrisious Haddad 2025-10-29   97  			return ret;
3506242da07156 Patrisious Haddad 2025-10-29   98  		}
3506242da07156 Patrisious Haddad 2025-10-29   99  	}
3506242da07156 Patrisious Haddad 2025-10-29  100  
3506242da07156 Patrisious Haddad 2025-10-29  101  	return 0;
3506242da07156 Patrisious Haddad 2025-10-29  102  }
3506242da07156 Patrisious Haddad 2025-10-29  103  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
