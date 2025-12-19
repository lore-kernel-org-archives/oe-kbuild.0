Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFDD2D3EF2
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 23:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766187686; cv=none; b=ujLlJrPtU7wvx/jUhAi0Gx3fpRUR0otWoYxkCEX7lqMUUXVGwA2r9KBLJq3bc9q3PVHOpFiGOgxgl1vjbrPSFe9ZgmWbDoRW2nywoK76GN2QAYf9DdN25Augllr+H1sh0jBR20tK3qK8xVC8X7l/SXrPBul4r4hHE3gDDQy0V+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766187686; c=relaxed/simple;
	bh=/q9QY8AmwqeaQHVs/sLe1Hx+/GmTCNBwqs3Gv/YHD48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H7VE6Mu76t/QsiezjRzPu52NYcnm1IVlzdIm1BL+eNRW1hTpfrXxnX6cidI3N5Xmd/9r0nADEQw6H298lfeXpF9eZA0/7YTfsMbVe6sKqSdptlpx+WxIdU+hqep2BY9g3Z2c5ImCIkA2XtN7h8fsknrYJB4MElvX36DUVQvlX6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ed8L3aZe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ed8L3aZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766187684; x=1797723684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/q9QY8AmwqeaQHVs/sLe1Hx+/GmTCNBwqs3Gv/YHD48=;
  b=ed8L3aZeU67+OMblGXwoaAv19rS4gPM3Fl7GudK0MjviGAji6FYikL5y
   LNkU03kKCSPpvXR0GVuTPszkgvzDgaJKMDuyGQ8M5YrAzrD5eQhiHMRSA
   VkSFakonZ6LA9m5KYexwVFOIXn0ENQ9PjMTlkmWvD5j/uI8vUkxeQpS3i
   U2jl4vq7ew7ndjYNjQs8hxykQ/YVN2zNXnl9OVtMWsDIccipiz7jlkb6o
   N1f8kfDUqVa09cWun4iv+7QpHF/xQoO3G3A/B3s90hIg95+P33mY/J+MI
   9PHpz1Mhokhrkl71kEIWmhtWcQ1hfgCbUGiyNNncBUlwvkyqeLtopNUAU
   A==;
X-CSE-ConnectionGUID: hn6+zVPoQjqCMG2xOunbVg==
X-CSE-MsgGUID: kYeW4Q19QBGpg7BNPG7/vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68028730"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="68028730"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 15:41:23 -0800
X-CSE-ConnectionGUID: CVr1fMFQT5q5sVMZh/oxKQ==
X-CSE-MsgGUID: uyWsehp/SYi6GlYUsoULhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="222399535"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Dec 2025 15:41:23 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWk64-0000000047J-2dMq;
	Fri, 19 Dec 2025 23:41:20 +0000
Date: Sat, 20 Dec 2025 07:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 43/43]
 drivers/virtio/virtio_balloon.c:908 virtballoon_probe() error: uninitialized
 symbol 'virtio_cread_v'.
Message-ID: <202512200734.YCoi0aZZ-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: 12748383a4ceb5771ff4034cff6685953d00c6b1 [43/43] ANDROID: virtio-balloon: Allow pagesize configuration
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 3 months ago
config: i386-randconfig-141-20251217 (https://download.01.org/0day-ci/archive/20251220/202512200734.YCoi0aZZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512200734.YCoi0aZZ-lkp@intel.com/

New smatch warnings:
drivers/virtio/virtio_balloon.c:908 virtballoon_probe() error: uninitialized symbol 'virtio_cread_v'.

Old smatch warnings:
drivers/virtio/virtio_balloon.c:409 towards_target() error: uninitialized symbol 'virtio_cread_v'.
drivers/virtio/virtio_balloon.c:592 virtio_balloon_cmd_id_received() error: uninitialized symbol 'virtio_cread_v'.

vim +/virtio_cread_v +908 drivers/virtio/virtio_balloon.c

71994620bb25a8 Wei Wang              2018-08-16  883  
be91c33dd15eff Amit Shah             2011-12-22  884  static int virtballoon_probe(struct virtio_device *vdev)
be91c33dd15eff Amit Shah             2011-12-22  885  {
be91c33dd15eff Amit Shah             2011-12-22  886  	struct virtio_balloon *vb;
be91c33dd15eff Amit Shah             2011-12-22  887  	int err;
be91c33dd15eff Amit Shah             2011-12-22  888  
2d9becc1e0c6f8 Michael S. Tsirkin    2015-01-12  889  	if (!vdev->config->get) {
2d9becc1e0c6f8 Michael S. Tsirkin    2015-01-12  890  		dev_err(&vdev->dev, "%s failure: config access disabled\n",
2d9becc1e0c6f8 Michael S. Tsirkin    2015-01-12  891  			__func__);
2d9becc1e0c6f8 Michael S. Tsirkin    2015-01-12  892  		return -EINVAL;
2d9becc1e0c6f8 Michael S. Tsirkin    2015-01-12  893  	}
2d9becc1e0c6f8 Michael S. Tsirkin    2015-01-12  894  
c51d8fca0ce368 Wei Wang              2018-08-16  895  	vdev->priv = vb = kzalloc(sizeof(*vb), GFP_KERNEL);
be91c33dd15eff Amit Shah             2011-12-22  896  	if (!vb) {
be91c33dd15eff Amit Shah             2011-12-22  897  		err = -ENOMEM;
be91c33dd15eff Amit Shah             2011-12-22  898  		goto out;
be91c33dd15eff Amit Shah             2011-12-22  899  	}
be91c33dd15eff Amit Shah             2011-12-22  900  
fd0e21c31e1e63 Petr Mladek           2016-01-25  901  	INIT_WORK(&vb->update_balloon_stats_work, update_balloon_stats_func);
fd0e21c31e1e63 Petr Mladek           2016-01-25  902  	INIT_WORK(&vb->update_balloon_size_work, update_balloon_size_func);
fad7b7b27b6a16 Petr Mladek           2016-01-25  903  	spin_lock_init(&vb->stop_update_lock);
e22504296d4f64 Rafael Aquini         2012-12-11  904  	mutex_init(&vb->balloon_lock);
9c378abc5c0c6f Michael S. Tsirkin    2012-07-02  905  	init_waitqueue_head(&vb->acked);
be91c33dd15eff Amit Shah             2011-12-22  906  	vb->vdev = vdev;
12748383a4ceb5 Vaibhav Nagarnaik     2022-10-05  907  	/* Set the hugepage_order provided by the hypervisor */
12748383a4ceb5 Vaibhav Nagarnaik     2022-10-05 @908  	virtio_cread_le(vb->vdev, struct virtio_balloon_config, hugepage_order,
12748383a4ceb5 Vaibhav Nagarnaik     2022-10-05  909  			&vb->hugepage_order);
12748383a4ceb5 Vaibhav Nagarnaik     2022-10-05  910  	dev_info_ratelimited(&vdev->dev, "allocation using order=%d", vb->hugepage_order);
be91c33dd15eff Amit Shah             2011-12-22  911  
9d1ba8056474a2 Konstantin Khlebnikov 2014-10-09  912  	balloon_devinfo_init(&vb->vb_dev_info);
e22504296d4f64 Rafael Aquini         2012-12-11  913  
be91c33dd15eff Amit Shah             2011-12-22  914  	err = init_vqs(vb);
be91c33dd15eff Amit Shah             2011-12-22  915  	if (err)
9d1ba8056474a2 Konstantin Khlebnikov 2014-10-09  916  		goto out_free_vb;
6b35e40767c6c1 Rusty Russell         2008-02-04  917  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
