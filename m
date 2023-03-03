Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97961139C
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Mar 2023 22:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677883170; x=1709419170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5p0LmwOM6Xkz09XAMaSmXcasql57hEWgodRMMO4D7XY=;
  b=ZcR4IXA0GHBvUUpAlY3HsrWNQ05gWUmjvxqyUzs//iA31gfRD+l61u19
   FAvhPvwvinEsgyOpfTJRknNhKhde/9gycXYI5pQRfshS/NYuqULCfhCUe
   2D4DYVMGBdwsSf66PmzqT5BezlcjKS0e4OguaAowCKq4i1JcdYlEbJLUs
   KyuoWVS5BTXzx1dfFxQVinjVbFdVYFNhyfPMjUJ65Zve6BJ48ejm/fjfN
   sOpekbQc+uVAod6SQgLd+aGCeSG02KHsvA036E4VpQISL1gWeofe2epe4
   HDFTNNhIGKeBDyDo6bI7ilHi71AjeUIwxByOzULaBfID/Mmh1mgEA46+Y
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="399990327"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="399990327"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 14:39:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="849640988"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="849640988"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Mar 2023 14:39:27 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYE3i-0001hP-30;
	Fri, 03 Mar 2023 22:39:26 +0000
Date: Sat, 4 Mar 2023 06:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vdpa/mlx5/net/mlx5_vnet.c:2187 mlx5_vdpa_change_map() warn:
 missing error code 'err'
Message-ID: <202303040639.hhpgT3tB-lkp@intel.com>
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
TO: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0a3f9a6b0265b64c02226fcabb5e9a958307913b
commit: 1c80cf031e0204fde471558ee40183695773ce13 vdpa: mlx5: synchronize driver status with CVQ
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: microblaze-randconfig-m031-20230302 (https://download.01.org/0day-ci/archive/20230304/202303040639.hhpgT3tB-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303040639.hhpgT3tB-lkp@intel.com/

New smatch warnings:
drivers/vdpa/mlx5/net/mlx5_vnet.c:2187 mlx5_vdpa_change_map() warn: missing error code 'err'

Old smatch warnings:
drivers/vdpa/mlx5/net/mlx5_vnet.c:686 set_umem_size() error: uninitialized symbol 'p_a'.
drivers/vdpa/mlx5/net/mlx5_vnet.c:686 set_umem_size() error: uninitialized symbol 'p_b'.
drivers/vdpa/mlx5/net/mlx5_vnet.c:763 umem_destroy() error: potentially dereferencing uninitialized 'umem'.
drivers/vdpa/mlx5/net/mlx5_vnet.c:2789 mlx5_vdpa_dev_add() error: uninitialized symbol 'pfmdev'.

vim +/err +2187 drivers/vdpa/mlx5/net/mlx5_vnet.c

1a86b377aa2147 Eli Cohen  2020-08-04  2169  
ae0428debf7cdd Eli Cohen  2021-08-23  2170  static int mlx5_vdpa_change_map(struct mlx5_vdpa_dev *mvdev, struct vhost_iotlb *iotlb)
1a86b377aa2147 Eli Cohen  2020-08-04  2171  {
ae0428debf7cdd Eli Cohen  2021-08-23  2172  	struct mlx5_vdpa_net *ndev = to_mlx5_vdpa_ndev(mvdev);
1a86b377aa2147 Eli Cohen  2020-08-04  2173  	int err;
1a86b377aa2147 Eli Cohen  2020-08-04  2174  
1a86b377aa2147 Eli Cohen  2020-08-04  2175  	suspend_vqs(ndev);
1a86b377aa2147 Eli Cohen  2020-08-04  2176  	err = save_channels_info(ndev);
1a86b377aa2147 Eli Cohen  2020-08-04  2177  	if (err)
1a86b377aa2147 Eli Cohen  2020-08-04  2178  		goto err_mr;
1a86b377aa2147 Eli Cohen  2020-08-04  2179  
1a86b377aa2147 Eli Cohen  2020-08-04  2180  	teardown_driver(ndev);
ae0428debf7cdd Eli Cohen  2021-08-23  2181  	mlx5_vdpa_destroy_mr(mvdev);
ae0428debf7cdd Eli Cohen  2021-08-23  2182  	err = mlx5_vdpa_create_mr(mvdev, iotlb);
1a86b377aa2147 Eli Cohen  2020-08-04  2183  	if (err)
1a86b377aa2147 Eli Cohen  2020-08-04  2184  		goto err_mr;
1a86b377aa2147 Eli Cohen  2020-08-04  2185  
ae0428debf7cdd Eli Cohen  2021-08-23  2186  	if (!(mvdev->status & VIRTIO_CONFIG_S_DRIVER_OK))
1c80cf031e0204 Jason Wang 2022-03-29 @2187  		goto err_mr;
1897f0b618b0af Eli Cohen  2020-09-08  2188  
1a86b377aa2147 Eli Cohen  2020-08-04  2189  	restore_channels_info(ndev);
ae0428debf7cdd Eli Cohen  2021-08-23  2190  	err = setup_driver(mvdev);
1a86b377aa2147 Eli Cohen  2020-08-04  2191  	if (err)
1a86b377aa2147 Eli Cohen  2020-08-04  2192  		goto err_setup;
1a86b377aa2147 Eli Cohen  2020-08-04  2193  
1a86b377aa2147 Eli Cohen  2020-08-04  2194  	return 0;
1a86b377aa2147 Eli Cohen  2020-08-04  2195  
1a86b377aa2147 Eli Cohen  2020-08-04  2196  err_setup:
ae0428debf7cdd Eli Cohen  2021-08-23  2197  	mlx5_vdpa_destroy_mr(mvdev);
1a86b377aa2147 Eli Cohen  2020-08-04  2198  err_mr:
1a86b377aa2147 Eli Cohen  2020-08-04  2199  	return err;
1a86b377aa2147 Eli Cohen  2020-08-04  2200  }
1a86b377aa2147 Eli Cohen  2020-08-04  2201  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
