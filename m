Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53C1630
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 02:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JP2AxAEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699237660; x=1730773660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0/7O3tdz56oKbBTfP3ER5NnadEXGo4w/6jWWdksrX04=;
  b=JP2AxAEqzOBBgVqZScv5CRc4tWtA4fjPmwCvSE1CmYmx0KwuQmTFZaXQ
   zODRjrC9QD6A07UhWz+12po7Fa7FO70x7IctsyGQznDsDuBfoBWDFLvDB
   THYY6T38KZ8+nHJuiDjywIqyA7WxoIYyfIQRZuwfqae0uEsQb9HFu0kqF
   sipB3AaCcRKgZJyo0bin4FGT7km+7BmxahSKSOQqwkzHaylqMLsq5Qhxj
   c9GKEMqLU6kVng/BONQ+R91/E5FIGNsUYXxa3smpjskMXx+iw3SfeOH3X
   Yg19i5DedsXHraUxB2CaFN1WRv5j4Kt9patSJN+hCNag8F9Ej3jmBTa54
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420310437"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="420310437"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 18:27:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="885760721"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="885760721"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Nov 2023 18:27:38 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzpKy-000616-2D;
	Mon, 06 Nov 2023 02:27:36 +0000
Date: Mon, 6 Nov 2023 10:26:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-kiwi-5.10 2/3]
 drivers/virtio/virtio_balloon.c:923 virtballoon_probe() error: uninitialized
 symbol 'virtio_cread_v'.
Message-ID: <202311061046.NwfqX6Mw-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   d34f9e22c31d2a971ef00c69116c0eef46834278
commit: 96e61bf5d620136bcffbcbe625d418d18362ac6c [2/3] ANDROID: virtio-balloon: Allow pagesize configuration
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20231106 (https://download.01.org/0day-ci/archive/20231106/202311061046.NwfqX6Mw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311061046.NwfqX6Mw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311061046.NwfqX6Mw-lkp@intel.com/

New smatch warnings:
drivers/virtio/virtio_balloon.c:923 virtballoon_probe() error: uninitialized symbol 'virtio_cread_v'.

Old smatch warnings:
drivers/virtio/virtio_balloon.c:413 towards_target() error: uninitialized symbol 'virtio_cread_v'.
drivers/virtio/virtio_balloon.c:595 virtio_balloon_cmd_id_received() error: uninitialized symbol 'virtio_cread_v'.

vim +/virtio_cread_v +923 drivers/virtio/virtio_balloon.c

71994620bb25a8 Wei Wang              2018-08-16  898  
be91c33dd15eff Amit Shah             2011-12-22  899  static int virtballoon_probe(struct virtio_device *vdev)
be91c33dd15eff Amit Shah             2011-12-22  900  {
be91c33dd15eff Amit Shah             2011-12-22  901  	struct virtio_balloon *vb;
be91c33dd15eff Amit Shah             2011-12-22  902  	int err;
be91c33dd15eff Amit Shah             2011-12-22  903  
2d9becc1e0c6f8 Michael S. Tsirkin    2015-01-12  904  	if (!vdev->config->get) {
2d9becc1e0c6f8 Michael S. Tsirkin    2015-01-12  905  		dev_err(&vdev->dev, "%s failure: config access disabled\n",
2d9becc1e0c6f8 Michael S. Tsirkin    2015-01-12  906  			__func__);
2d9becc1e0c6f8 Michael S. Tsirkin    2015-01-12  907  		return -EINVAL;
2d9becc1e0c6f8 Michael S. Tsirkin    2015-01-12  908  	}
2d9becc1e0c6f8 Michael S. Tsirkin    2015-01-12  909  
c51d8fca0ce368 Wei Wang              2018-08-16  910  	vdev->priv = vb = kzalloc(sizeof(*vb), GFP_KERNEL);
be91c33dd15eff Amit Shah             2011-12-22  911  	if (!vb) {
be91c33dd15eff Amit Shah             2011-12-22  912  		err = -ENOMEM;
be91c33dd15eff Amit Shah             2011-12-22  913  		goto out;
be91c33dd15eff Amit Shah             2011-12-22  914  	}
be91c33dd15eff Amit Shah             2011-12-22  915  
fd0e21c31e1e63 Petr Mladek           2016-01-25  916  	INIT_WORK(&vb->update_balloon_stats_work, update_balloon_stats_func);
fd0e21c31e1e63 Petr Mladek           2016-01-25  917  	INIT_WORK(&vb->update_balloon_size_work, update_balloon_size_func);
fad7b7b27b6a16 Petr Mladek           2016-01-25  918  	spin_lock_init(&vb->stop_update_lock);
e22504296d4f64 Rafael Aquini         2012-12-11  919  	mutex_init(&vb->balloon_lock);
9c378abc5c0c6f Michael S. Tsirkin    2012-07-02  920  	init_waitqueue_head(&vb->acked);
be91c33dd15eff Amit Shah             2011-12-22  921  	vb->vdev = vdev;
96e61bf5d62013 Vaibhav Nagarnaik     2022-10-05  922  	/* Set the hugepage_order provided by the hypervisor */
96e61bf5d62013 Vaibhav Nagarnaik     2022-10-05 @923  	virtio_cread_le(vb->vdev, struct virtio_balloon_config, hugepage_order,
96e61bf5d62013 Vaibhav Nagarnaik     2022-10-05  924  			&vb->hugepage_order);
96e61bf5d62013 Vaibhav Nagarnaik     2022-10-05  925  	dev_info_ratelimited(&vdev->dev, "allocation using order=%d", vb->hugepage_order);
be91c33dd15eff Amit Shah             2011-12-22  926  
9d1ba8056474a2 Konstantin Khlebnikov 2014-10-09  927  	balloon_devinfo_init(&vb->vb_dev_info);
e22504296d4f64 Rafael Aquini         2012-12-11  928  
be91c33dd15eff Amit Shah             2011-12-22  929  	err = init_vqs(vb);
be91c33dd15eff Amit Shah             2011-12-22  930  	if (err)
9d1ba8056474a2 Konstantin Khlebnikov 2014-10-09  931  		goto out_free_vb;
6b35e40767c6c1 Rusty Russell         2008-02-04  932  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
