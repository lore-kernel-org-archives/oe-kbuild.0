Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6E315AE5
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 06:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVhxJAr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702274571; x=1733810571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NyBsMP1mcxnDAOO9QsvFDpFsNTdX5VeyFgADv1bI2eQ=;
  b=IVhxJAr3sg2L0umx/g5CwXBnodwNwyN7r5WRUbJ0cmCh3968yeAfeYNt
   zPXqVWQ38Fsenn8g5DJra8ZvWIl2zIiC0Dgoeig9wqbDJYJ6tX5iZtHXI
   lmylA2xRz83+d3IF1nRul8Ly0yzsorQ4lyDqtUIrooogBjbSQt592etxA
   rXe2o2iEzDF0DJMlS1ggdwX7m07fK3Q5aFPyaITd3uOn7lZCk7fZH2ILI
   nXa5LlEf5pg67c3ZuOoaw/rn80CPrrFOMX1VasSSUB3juy4+7e+E4qzjK
   MYEeAgKSDtQne1oXCi2Iyi5sEARD4xKaoPcWbDivSYcbnw+xhMPtTX8DF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="393462929"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="393462929"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 22:02:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="766239122"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="766239122"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Dec 2023 22:02:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCZNK-000Hgz-31;
	Mon, 11 Dec 2023 06:02:42 +0000
Date: Mon, 11 Dec 2023 14:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vdpa/mlx5/net/mlx5_vnet.c:2063 mlx5_vdpa_dev_add() error:
 uninitialized symbol 'pfmdev'.
Message-ID: <202312111323.7TNjXNJF-lkp@intel.com>
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
TO: Eli Cohen <elic@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: 7c9f131f366ab414691907fa0407124ea2b2f3bc {net,vdpa}/mlx5: Configure interface MAC into mpfs L2 table
date:   2 years, 7 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 2 years, 7 months ago
config: i386-randconfig-141-20230929 (https://download.01.org/0day-ci/archive/20231211/202312111323.7TNjXNJF-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312111323.7TNjXNJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312111323.7TNjXNJF-lkp@intel.com/

New smatch warnings:
drivers/vdpa/mlx5/net/mlx5_vnet.c:2063 mlx5_vdpa_dev_add() error: uninitialized symbol 'pfmdev'.

Old smatch warnings:
drivers/vdpa/mlx5/net/mlx5_vnet.c:638 umem_size() error: uninitialized symbol 'p_a'.
drivers/vdpa/mlx5/net/mlx5_vnet.c:638 umem_size() error: uninitialized symbol 'p_b'.
drivers/vdpa/mlx5/net/mlx5_vnet.c:720 umem_destroy() error: potentially dereferencing uninitialized 'umem'.

vim +/pfmdev +2063 drivers/vdpa/mlx5/net/mlx5_vnet.c

58926c8aab104d Eli Cohen       2021-04-08  1994  
58926c8aab104d Eli Cohen       2021-04-08  1995  static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name)
1a86b377aa2147 Eli Cohen       2020-08-04  1996  {
58926c8aab104d Eli Cohen       2021-04-08  1997  	struct mlx5_vdpa_mgmtdev *mgtdev = container_of(v_mdev, struct mlx5_vdpa_mgmtdev, mgtdev);
1a86b377aa2147 Eli Cohen       2020-08-04  1998  	struct virtio_net_config *config;
7c9f131f366ab4 Eli Cohen       2021-04-22  1999  	struct mlx5_core_dev *pfmdev;
1a86b377aa2147 Eli Cohen       2020-08-04  2000  	struct mlx5_vdpa_dev *mvdev;
1a86b377aa2147 Eli Cohen       2020-08-04  2001  	struct mlx5_vdpa_net *ndev;
58926c8aab104d Eli Cohen       2021-04-08  2002  	struct mlx5_core_dev *mdev;
1a86b377aa2147 Eli Cohen       2020-08-04  2003  	u32 max_vqs;
1a86b377aa2147 Eli Cohen       2020-08-04  2004  	int err;
1a86b377aa2147 Eli Cohen       2020-08-04  2005  
58926c8aab104d Eli Cohen       2021-04-08  2006  	if (mgtdev->ndev)
58926c8aab104d Eli Cohen       2021-04-08  2007  		return -ENOSPC;
58926c8aab104d Eli Cohen       2021-04-08  2008  
58926c8aab104d Eli Cohen       2021-04-08  2009  	mdev = mgtdev->madev->mdev;
1a86b377aa2147 Eli Cohen       2020-08-04  2010  	/* we save one virtqueue for control virtqueue should we require it */
1a86b377aa2147 Eli Cohen       2020-08-04  2011  	max_vqs = MLX5_CAP_DEV_VDPA_EMULATION(mdev, max_num_virtio_queues);
1a86b377aa2147 Eli Cohen       2020-08-04  2012  	max_vqs = min_t(u32, max_vqs, MLX5_MAX_SUPPORTED_VQS);
1a86b377aa2147 Eli Cohen       2020-08-04  2013  
1a86b377aa2147 Eli Cohen       2020-08-04  2014  	ndev = vdpa_alloc_device(struct mlx5_vdpa_net, mvdev.vdev, mdev->device, &mlx5_vdpa_ops,
58926c8aab104d Eli Cohen       2021-04-08  2015  				 name);
1a86b377aa2147 Eli Cohen       2020-08-04  2016  	if (IS_ERR(ndev))
74c9729dd892a1 Leon Romanovsky 2020-10-04  2017  		return PTR_ERR(ndev);
1a86b377aa2147 Eli Cohen       2020-08-04  2018  
1a86b377aa2147 Eli Cohen       2020-08-04  2019  	ndev->mvdev.max_vqs = max_vqs;
1a86b377aa2147 Eli Cohen       2020-08-04  2020  	mvdev = &ndev->mvdev;
1a86b377aa2147 Eli Cohen       2020-08-04  2021  	mvdev->mdev = mdev;
1a86b377aa2147 Eli Cohen       2020-08-04  2022  	init_mvqs(ndev);
1a86b377aa2147 Eli Cohen       2020-08-04  2023  	mutex_init(&ndev->reslock);
1a86b377aa2147 Eli Cohen       2020-08-04  2024  	config = &ndev->config;
d084d996aaf53c Si-Wei Liu      2021-04-08  2025  	err = query_mtu(mdev, &ndev->mtu);
1a86b377aa2147 Eli Cohen       2020-08-04  2026  	if (err)
1a86b377aa2147 Eli Cohen       2020-08-04  2027  		goto err_mtu;
1a86b377aa2147 Eli Cohen       2020-08-04  2028  
1a86b377aa2147 Eli Cohen       2020-08-04  2029  	err = mlx5_query_nic_vport_mac_address(mdev, 0, 0, config->mac);
1a86b377aa2147 Eli Cohen       2020-08-04  2030  	if (err)
1a86b377aa2147 Eli Cohen       2020-08-04  2031  		goto err_mtu;
1a86b377aa2147 Eli Cohen       2020-08-04  2032  
7c9f131f366ab4 Eli Cohen       2021-04-22  2033  	if (!is_zero_ether_addr(config->mac)) {
7c9f131f366ab4 Eli Cohen       2021-04-22  2034  		pfmdev = pci_get_drvdata(pci_physfn(mdev->pdev));
7c9f131f366ab4 Eli Cohen       2021-04-22  2035  		err = mlx5_mpfs_add_mac(pfmdev, config->mac);
7c9f131f366ab4 Eli Cohen       2021-04-22  2036  		if (err)
7c9f131f366ab4 Eli Cohen       2021-04-22  2037  			goto err_mtu;
7c9f131f366ab4 Eli Cohen       2021-04-22  2038  	}
7c9f131f366ab4 Eli Cohen       2021-04-22  2039  
1a86b377aa2147 Eli Cohen       2020-08-04  2040  	mvdev->vdev.dma_dev = mdev->device;
1a86b377aa2147 Eli Cohen       2020-08-04  2041  	err = mlx5_vdpa_alloc_resources(&ndev->mvdev);
1a86b377aa2147 Eli Cohen       2020-08-04  2042  	if (err)
7c9f131f366ab4 Eli Cohen       2021-04-22  2043  		goto err_mpfs;
1a86b377aa2147 Eli Cohen       2020-08-04  2044  
1a86b377aa2147 Eli Cohen       2020-08-04  2045  	err = alloc_resources(ndev);
1a86b377aa2147 Eli Cohen       2020-08-04  2046  	if (err)
1a86b377aa2147 Eli Cohen       2020-08-04  2047  		goto err_res;
1a86b377aa2147 Eli Cohen       2020-08-04  2048  
58926c8aab104d Eli Cohen       2021-04-08  2049  	mvdev->vdev.mdev = &mgtdev->mgtdev;
58926c8aab104d Eli Cohen       2021-04-08  2050  	err = _vdpa_register_device(&mvdev->vdev, 2 * mlx5_vdpa_max_qps(max_vqs));
1a86b377aa2147 Eli Cohen       2020-08-04  2051  	if (err)
1a86b377aa2147 Eli Cohen       2020-08-04  2052  		goto err_reg;
1a86b377aa2147 Eli Cohen       2020-08-04  2053  
58926c8aab104d Eli Cohen       2021-04-08  2054  	mgtdev->ndev = ndev;
74c9729dd892a1 Leon Romanovsky 2020-10-04  2055  	return 0;
1a86b377aa2147 Eli Cohen       2020-08-04  2056  
1a86b377aa2147 Eli Cohen       2020-08-04  2057  err_reg:
1a86b377aa2147 Eli Cohen       2020-08-04  2058  	free_resources(ndev);
1a86b377aa2147 Eli Cohen       2020-08-04  2059  err_res:
1a86b377aa2147 Eli Cohen       2020-08-04  2060  	mlx5_vdpa_free_resources(&ndev->mvdev);
7c9f131f366ab4 Eli Cohen       2021-04-22  2061  err_mpfs:
7c9f131f366ab4 Eli Cohen       2021-04-22  2062  	if (!is_zero_ether_addr(config->mac))
7c9f131f366ab4 Eli Cohen       2021-04-22 @2063  		mlx5_mpfs_del_mac(pfmdev, config->mac);
1a86b377aa2147 Eli Cohen       2020-08-04  2064  err_mtu:
1a86b377aa2147 Eli Cohen       2020-08-04  2065  	mutex_destroy(&ndev->reslock);
1a86b377aa2147 Eli Cohen       2020-08-04  2066  	put_device(&mvdev->vdev.dev);
74c9729dd892a1 Leon Romanovsky 2020-10-04  2067  	return err;
1a86b377aa2147 Eli Cohen       2020-08-04  2068  }
1a86b377aa2147 Eli Cohen       2020-08-04  2069  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
