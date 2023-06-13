Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDD133C99
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jun 2023 19:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686683480; x=1718219480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6BrvU9TBBSiZz/ZSt3y80f/3KULCBjYLt6abFMtunis=;
  b=cpyaYqu+iFy6IcOJblR58yiltcmCCAZef4zx5EWeJOWEdFp5xp0AzU0t
   GVI4DPd0xiKAwsb5az4O/oWNhzJWXqqAf5h2TGJOq56Q9cI4nljLjhqo8
   6k9agST6XqyJ7FccoDW4iS00Y4WENvA06E01ZEXVqPIVisrOEhBdLq2vg
   fNc33lYXeTXq1/4NWBY/jTyKnKAlR/tMtL1Vjg+bSuFe1pq/EO5MlOFad
   w6LAIrDq/7edpGVpQE/v6SQA1rI7fWrUJtzMcwHx7R3QQTo6ttC4FSCsb
   JJ+KZn/zIUlFiY/1PrEH/F9PuHK7PSvawse/ha00OlPHvcnNUFUHc2hlH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="422027718"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="422027718"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 12:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="824524778"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="824524778"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2023 12:11:17 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q99QD-0001gi-05;
	Tue, 13 Jun 2023 19:11:17 +0000
Date: Wed, 14 Jun 2023 03:10:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6203/9385]
 drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:98
 mlx5_devcom_register_device() error: uninitialized symbol 'tmp_dev'.
Message-ID: <202306140330.pddHcwet-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Shay Drory <shayd@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Mark Bloch <mbloch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1f6ce8392d6ff486af5ca96df9ded5882c4b6977
commit: 6ec0b55e72a5c6fb056ad1eea12a3b5a74a402fe [6203/9385] net/mlx5: Enable 4 ports VF LAG
:::::: branch date: 12 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-m001-20230612 (https://download.01.org/0day-ci/archive/20230614/202306140330.pddHcwet-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306140330.pddHcwet-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:98 mlx5_devcom_register_device() error: uninitialized symbol 'tmp_dev'.

Old smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:309 mlx5_devcom_get_next_peer_data() error: uninitialized symbol 'ret'.
drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:343 mlx5_devcom_get_next_peer_data_rcu() error: uninitialized symbol 'ret'.

vim +/tmp_dev +98 drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c

fadd59fc50d010 Aviv Heller 2018-12-04   66  
fadd59fc50d010 Aviv Heller 2018-12-04   67  /* Must be called with intf_mutex held */
fadd59fc50d010 Aviv Heller 2018-12-04   68  struct mlx5_devcom *mlx5_devcom_register_device(struct mlx5_core_dev *dev)
fadd59fc50d010 Aviv Heller 2018-12-04   69  {
fadd59fc50d010 Aviv Heller 2018-12-04   70  	struct mlx5_devcom_list *priv = NULL, *iter;
fadd59fc50d010 Aviv Heller 2018-12-04   71  	struct mlx5_devcom *devcom = NULL;
fadd59fc50d010 Aviv Heller 2018-12-04   72  	bool new_priv = false;
fadd59fc50d010 Aviv Heller 2018-12-04   73  	u64 sguid0, sguid1;
fadd59fc50d010 Aviv Heller 2018-12-04   74  	int idx, i;
fadd59fc50d010 Aviv Heller 2018-12-04   75  
fadd59fc50d010 Aviv Heller 2018-12-04   76  	if (!mlx5_core_is_pf(dev))
fadd59fc50d010 Aviv Heller 2018-12-04   77  		return NULL;
6ec0b55e72a5c6 Shay Drory  2023-06-06   78  	if (MLX5_CAP_GEN(dev, num_lag_ports) > MLX5_DEVCOM_PORTS_SUPPORTED)
8a6e75e5f57e9a Mark Bloch  2022-02-27   79  		return NULL;
fadd59fc50d010 Aviv Heller 2018-12-04   80  
1f893f57a3bf9f Shay Drory  2023-05-02   81  	mlx5_dev_list_lock();
fadd59fc50d010 Aviv Heller 2018-12-04   82  	sguid0 = mlx5_query_nic_system_image_guid(dev);
fadd59fc50d010 Aviv Heller 2018-12-04   83  	list_for_each_entry(iter, &devcom_list, list) {
6ec0b55e72a5c6 Shay Drory  2023-06-06   84  		/* There is at least one device in iter */
6ec0b55e72a5c6 Shay Drory  2023-06-06   85  		struct mlx5_core_dev *tmp_dev;
fadd59fc50d010 Aviv Heller 2018-12-04   86  
fadd59fc50d010 Aviv Heller 2018-12-04   87  		idx = -1;
8a6e75e5f57e9a Mark Bloch  2022-02-27   88  		for (i = 0; i < MLX5_DEVCOM_PORTS_SUPPORTED; i++) {
fadd59fc50d010 Aviv Heller 2018-12-04   89  			if (iter->devs[i])
fadd59fc50d010 Aviv Heller 2018-12-04   90  				tmp_dev = iter->devs[i];
fadd59fc50d010 Aviv Heller 2018-12-04   91  			else
fadd59fc50d010 Aviv Heller 2018-12-04   92  				idx = i;
fadd59fc50d010 Aviv Heller 2018-12-04   93  		}
fadd59fc50d010 Aviv Heller 2018-12-04   94  
fadd59fc50d010 Aviv Heller 2018-12-04   95  		if (idx == -1)
fadd59fc50d010 Aviv Heller 2018-12-04   96  			continue;
fadd59fc50d010 Aviv Heller 2018-12-04   97  
fadd59fc50d010 Aviv Heller 2018-12-04  @98  		sguid1 = mlx5_query_nic_system_image_guid(tmp_dev);
fadd59fc50d010 Aviv Heller 2018-12-04   99  		if (sguid0 != sguid1)
fadd59fc50d010 Aviv Heller 2018-12-04  100  			continue;
fadd59fc50d010 Aviv Heller 2018-12-04  101  
fadd59fc50d010 Aviv Heller 2018-12-04  102  		priv = iter;
fadd59fc50d010 Aviv Heller 2018-12-04  103  		break;
fadd59fc50d010 Aviv Heller 2018-12-04  104  	}
fadd59fc50d010 Aviv Heller 2018-12-04  105  
fadd59fc50d010 Aviv Heller 2018-12-04  106  	if (!priv) {
fadd59fc50d010 Aviv Heller 2018-12-04  107  		priv = mlx5_devcom_list_alloc();
1f893f57a3bf9f Shay Drory  2023-05-02  108  		if (!priv) {
1f893f57a3bf9f Shay Drory  2023-05-02  109  			devcom = ERR_PTR(-ENOMEM);
1f893f57a3bf9f Shay Drory  2023-05-02  110  			goto out;
1f893f57a3bf9f Shay Drory  2023-05-02  111  		}
fadd59fc50d010 Aviv Heller 2018-12-04  112  
fadd59fc50d010 Aviv Heller 2018-12-04  113  		idx = 0;
fadd59fc50d010 Aviv Heller 2018-12-04  114  		new_priv = true;
fadd59fc50d010 Aviv Heller 2018-12-04  115  	}
fadd59fc50d010 Aviv Heller 2018-12-04  116  
fadd59fc50d010 Aviv Heller 2018-12-04  117  	priv->devs[idx] = dev;
fadd59fc50d010 Aviv Heller 2018-12-04  118  	devcom = mlx5_devcom_alloc(priv, idx);
fadd59fc50d010 Aviv Heller 2018-12-04  119  	if (!devcom) {
af87194352cad8 Shay Drory  2023-05-02  120  		if (new_priv)
fadd59fc50d010 Aviv Heller 2018-12-04  121  			kfree(priv);
1f893f57a3bf9f Shay Drory  2023-05-02  122  		devcom = ERR_PTR(-ENOMEM);
1f893f57a3bf9f Shay Drory  2023-05-02  123  		goto out;
fadd59fc50d010 Aviv Heller 2018-12-04  124  	}
fadd59fc50d010 Aviv Heller 2018-12-04  125  
fadd59fc50d010 Aviv Heller 2018-12-04  126  	if (new_priv)
fadd59fc50d010 Aviv Heller 2018-12-04  127  		list_add(&priv->list, &devcom_list);
1f893f57a3bf9f Shay Drory  2023-05-02  128  out:
1f893f57a3bf9f Shay Drory  2023-05-02  129  	mlx5_dev_list_unlock();
fadd59fc50d010 Aviv Heller 2018-12-04  130  	return devcom;
fadd59fc50d010 Aviv Heller 2018-12-04  131  }
fadd59fc50d010 Aviv Heller 2018-12-04  132  

:::::: The code at line 98 was first introduced by commit
:::::: fadd59fc50d010145f251db583c7ccef37393d19 net/mlx5: Introduce inter-device communication mechanism

:::::: TO: Aviv Heller <avivh@mellanox.com>
:::::: CC: Saeed Mahameed <saeedm@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
