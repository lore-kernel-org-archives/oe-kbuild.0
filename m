Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C21F568C
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Oct 2023 03:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bg3hxcFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698724287; x=1730260287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lWoVeOdS498xqW0DYOc5icn0SEuaE8mfIRqa6PRsWfg=;
  b=bg3hxcFpge40htkO/WNL3MA2mutWVauXOQjPM3IjMRonnbMffY7Vky7j
   ualmuieZFx6J9jemgLNfq+cpMeliaZY2wObFs136Gpwm4x2HB6F4K/ND4
   aHuM4y3sbXh/rJi8/DqnrDZ83lLgc+AisAIS37QKb8hp/BOtBOCK5fVEB
   KHgwMHp1Tph3NbdWtDBGxuGuiyybTh7KYFoO9liBeQHDG/nTO30noLVdm
   iry/duFei0pen9B5DuMxh5nTo4c103sBQkAXl2zlvRCdBsM7KZhlViKmE
   aeJS+ms9cXkqBzHiJxJc/E+0n++9Y+raeFWXaU8ApcXf6lj3AJXNKhzR/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1087055"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="1087055"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 20:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1007642119"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="1007642119"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 Oct 2023 20:51:24 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxfmk-000Dnm-0n;
	Tue, 31 Oct 2023 03:51:22 +0000
Date: Tue, 31 Oct 2023 11:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/virtio/virtgpu_kms.c:220 virtio_gpu_init() error:
 uninitialized symbol 'virtio_cread_v'.
Message-ID: <202310311103.xmemiQpP-lkp@intel.com>
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
TO: Dmitry Osipenko <dmitry.osipenko@collabora.com>
CC: Gerd Hoffmann <kraxel@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   14ab6d425e80674b6a0145f05719b11e82e64824
commit: b5c9ed70d1a94c59dad7b1ecfc928863c0fe6ac0 drm/virtio: Improve DMA API usage for shmem BOs
date:   1 year, 3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 1 year, 3 months ago
config: x86_64-randconfig-005-20230915 (https://download.01.org/0day-ci/archive/20231031/202310311103.xmemiQpP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231031/202310311103.xmemiQpP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310311103.xmemiQpP-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/virtio/virtgpu_kms.c:220 virtio_gpu_init() error: uninitialized symbol 'virtio_cread_v'.

Old smatch warnings:
drivers/gpu/drm/virtio/virtgpu_kms.c:42 virtio_gpu_config_changed_work_func() error: uninitialized symbol 'virtio_cread_v'.
drivers/gpu/drm/virtio/virtgpu_kms.c:231 virtio_gpu_init() error: uninitialized symbol 'virtio_cread_v'.

vim +/virtio_cread_v +220 drivers/gpu/drm/virtio/virtgpu_kms.c

62fb7a5e10962a Gerd Hoffmann      2014-10-28  112  
b5c9ed70d1a94c Dmitry Osipenko    2022-06-30  113  int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
dc5698e80cf724 Dave Airlie        2013-09-09  114  {
dc5698e80cf724 Dave Airlie        2013-09-09  115  	static vq_callback_t *callbacks[] = {
dc5698e80cf724 Dave Airlie        2013-09-09  116  		virtio_gpu_ctrl_ack, virtio_gpu_cursor_ack
dc5698e80cf724 Dave Airlie        2013-09-09  117  	};
f7ad26ff952b3c Stefan Hajnoczi    2015-12-17  118  	static const char * const names[] = { "control", "cursor" };
dc5698e80cf724 Dave Airlie        2013-09-09  119  
dc5698e80cf724 Dave Airlie        2013-09-09  120  	struct virtio_gpu_device *vgdev;
dc5698e80cf724 Dave Airlie        2013-09-09  121  	/* this will expand later */
dc5698e80cf724 Dave Airlie        2013-09-09  122  	struct virtqueue *vqs[2];
62fb7a5e10962a Gerd Hoffmann      2014-10-28  123  	u32 num_scanouts, num_capsets;
1fb97413a3f754 Gurchetan Singh    2020-09-02  124  	int ret = 0;
dc5698e80cf724 Dave Airlie        2013-09-09  125  
b5c9ed70d1a94c Dmitry Osipenko    2022-06-30  126  	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
dc5698e80cf724 Dave Airlie        2013-09-09  127  		return -ENODEV;
dc5698e80cf724 Dave Airlie        2013-09-09  128  
dc5698e80cf724 Dave Airlie        2013-09-09  129  	vgdev = kzalloc(sizeof(struct virtio_gpu_device), GFP_KERNEL);
dc5698e80cf724 Dave Airlie        2013-09-09  130  	if (!vgdev)
dc5698e80cf724 Dave Airlie        2013-09-09  131  		return -ENOMEM;
dc5698e80cf724 Dave Airlie        2013-09-09  132  
dc5698e80cf724 Dave Airlie        2013-09-09  133  	vgdev->ddev = dev;
dc5698e80cf724 Dave Airlie        2013-09-09  134  	dev->dev_private = vgdev;
b5c9ed70d1a94c Dmitry Osipenko    2022-06-30  135  	vgdev->vdev = vdev;
dc5698e80cf724 Dave Airlie        2013-09-09  136  
dc5698e80cf724 Dave Airlie        2013-09-09  137  	spin_lock_init(&vgdev->display_info_lock);
c84adb304c100c David Stevens      2020-08-18  138  	spin_lock_init(&vgdev->resource_export_lock);
16845c5d540929 Gerd Hoffmann      2020-09-23  139  	spin_lock_init(&vgdev->host_visible_lock);
1938d1ae32fefa Matthew Wilcox     2018-09-26  140  	ida_init(&vgdev->ctx_id_ida);
1938d1ae32fefa Matthew Wilcox     2018-09-26  141  	ida_init(&vgdev->resource_ida);
dc5698e80cf724 Dave Airlie        2013-09-09  142  	init_waitqueue_head(&vgdev->resp_wq);
dc5698e80cf724 Dave Airlie        2013-09-09  143  	virtio_gpu_init_vq(&vgdev->ctrlq, virtio_gpu_dequeue_ctrl_func);
dc5698e80cf724 Dave Airlie        2013-09-09  144  	virtio_gpu_init_vq(&vgdev->cursorq, virtio_gpu_dequeue_cursor_func);
dc5698e80cf724 Dave Airlie        2013-09-09  145  
f54d1867005c33 Chris Wilson       2016-10-25  146  	vgdev->fence_drv.context = dma_fence_context_alloc(1);
dc5698e80cf724 Dave Airlie        2013-09-09  147  	spin_lock_init(&vgdev->fence_drv.lock);
dc5698e80cf724 Dave Airlie        2013-09-09  148  	INIT_LIST_HEAD(&vgdev->fence_drv.fences);
62fb7a5e10962a Gerd Hoffmann      2014-10-28  149  	INIT_LIST_HEAD(&vgdev->cap_cache);
dc5698e80cf724 Dave Airlie        2013-09-09  150  	INIT_WORK(&vgdev->config_changed_work,
dc5698e80cf724 Dave Airlie        2013-09-09  151  		  virtio_gpu_config_changed_work_func);
dc5698e80cf724 Dave Airlie        2013-09-09  152  
f0c6cef7e7174b Gerd Hoffmann      2019-08-30  153  	INIT_WORK(&vgdev->obj_free_work,
f0c6cef7e7174b Gerd Hoffmann      2019-08-30  154  		  virtio_gpu_array_put_free_work);
f0c6cef7e7174b Gerd Hoffmann      2019-08-30  155  	INIT_LIST_HEAD(&vgdev->obj_free_list);
f0c6cef7e7174b Gerd Hoffmann      2019-08-30  156  	spin_lock_init(&vgdev->obj_free_lock);
f0c6cef7e7174b Gerd Hoffmann      2019-08-30  157  
ff2ac58a45914c Laurent Vivier     2017-01-24  158  #ifdef __LITTLE_ENDIAN
62fb7a5e10962a Gerd Hoffmann      2014-10-28  159  	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_VIRGL))
62fb7a5e10962a Gerd Hoffmann      2014-10-28  160  		vgdev->has_virgl_3d = true;
ff2ac58a45914c Laurent Vivier     2017-01-24  161  #endif
b4b01b4995fb15 Gerd Hoffmann      2018-10-30  162  	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID)) {
b4b01b4995fb15 Gerd Hoffmann      2018-10-30  163  		vgdev->has_edid = true;
b4b01b4995fb15 Gerd Hoffmann      2018-10-30  164  	}
5edbb56082567d Gerd Hoffmann      2020-02-07  165  	if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
5edbb56082567d Gerd Hoffmann      2020-02-07  166  		vgdev->has_indirect = true;
5edbb56082567d Gerd Hoffmann      2020-02-07  167  	}
c84adb304c100c David Stevens      2020-08-18  168  	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
c84adb304c100c David Stevens      2020-08-18  169  		vgdev->has_resource_assign_uuid = true;
c84adb304c100c David Stevens      2020-08-18  170  	}
6815cfe602d03d Gerd Hoffmann      2020-09-23  171  	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB)) {
6815cfe602d03d Gerd Hoffmann      2020-09-23  172  		vgdev->has_resource_blob = true;
6815cfe602d03d Gerd Hoffmann      2020-09-23  173  	}
6076a9711dc535 Gerd Hoffmann      2020-09-23  174  	if (virtio_get_shm_region(vgdev->vdev, &vgdev->host_visible_region,
6076a9711dc535 Gerd Hoffmann      2020-09-23  175  				  VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
6076a9711dc535 Gerd Hoffmann      2020-09-23  176  		if (!devm_request_mem_region(&vgdev->vdev->dev,
6076a9711dc535 Gerd Hoffmann      2020-09-23  177  					     vgdev->host_visible_region.addr,
6076a9711dc535 Gerd Hoffmann      2020-09-23  178  					     vgdev->host_visible_region.len,
6076a9711dc535 Gerd Hoffmann      2020-09-23  179  					     dev_name(&vgdev->vdev->dev))) {
6076a9711dc535 Gerd Hoffmann      2020-09-23  180  			DRM_ERROR("Could not reserve host visible region\n");
eb988a2ee500d3 Dan Carpenter      2021-02-03  181  			ret = -EBUSY;
6076a9711dc535 Gerd Hoffmann      2020-09-23  182  			goto err_vqs;
6076a9711dc535 Gerd Hoffmann      2020-09-23  183  		}
6076a9711dc535 Gerd Hoffmann      2020-09-23  184  
6076a9711dc535 Gerd Hoffmann      2020-09-23  185  		DRM_INFO("Host memory window: 0x%lx +0x%lx\n",
6076a9711dc535 Gerd Hoffmann      2020-09-23  186  			 (unsigned long)vgdev->host_visible_region.addr,
6076a9711dc535 Gerd Hoffmann      2020-09-23  187  			 (unsigned long)vgdev->host_visible_region.len);
6076a9711dc535 Gerd Hoffmann      2020-09-23  188  		vgdev->has_host_visible = true;
16845c5d540929 Gerd Hoffmann      2020-09-23  189  		drm_mm_init(&vgdev->host_visible_mm,
16845c5d540929 Gerd Hoffmann      2020-09-23  190  			    (unsigned long)vgdev->host_visible_region.addr,
16845c5d540929 Gerd Hoffmann      2020-09-23  191  			    (unsigned long)vgdev->host_visible_region.len);
6076a9711dc535 Gerd Hoffmann      2020-09-23  192  	}
6198770a1fe019 Anthoine Bourgeois 2021-09-21  193  	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_CONTEXT_INIT)) {
6198770a1fe019 Anthoine Bourgeois 2021-09-21  194  		vgdev->has_context_init = true;
6198770a1fe019 Anthoine Bourgeois 2021-09-21  195  	}
62fb7a5e10962a Gerd Hoffmann      2014-10-28  196  
6198770a1fe019 Anthoine Bourgeois 2021-09-21  197  	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible",
9e370dfec4fee8 Gerd Hoffmann      2019-10-18  198  		 vgdev->has_virgl_3d    ? '+' : '-',
6815cfe602d03d Gerd Hoffmann      2020-09-23  199  		 vgdev->has_edid        ? '+' : '-',
6076a9711dc535 Gerd Hoffmann      2020-09-23  200  		 vgdev->has_resource_blob ? '+' : '-',
6076a9711dc535 Gerd Hoffmann      2020-09-23  201  		 vgdev->has_host_visible ? '+' : '-');
9e370dfec4fee8 Gerd Hoffmann      2019-10-18  202  
6198770a1fe019 Anthoine Bourgeois 2021-09-21  203  	DRM_INFO("features: %ccontext_init\n",
6198770a1fe019 Anthoine Bourgeois 2021-09-21  204  		 vgdev->has_context_init ? '+' : '-');
6198770a1fe019 Anthoine Bourgeois 2021-09-21  205  
9b2bbdb2275884 Michael S. Tsirkin 2017-03-06  206  	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
dc5698e80cf724 Dave Airlie        2013-09-09  207  	if (ret) {
dc5698e80cf724 Dave Airlie        2013-09-09  208  		DRM_ERROR("failed to find virt queues\n");
dc5698e80cf724 Dave Airlie        2013-09-09  209  		goto err_vqs;
dc5698e80cf724 Dave Airlie        2013-09-09  210  	}
dc5698e80cf724 Dave Airlie        2013-09-09  211  	vgdev->ctrlq.vq = vqs[0];
dc5698e80cf724 Dave Airlie        2013-09-09  212  	vgdev->cursorq.vq = vqs[1];
dc5698e80cf724 Dave Airlie        2013-09-09  213  	ret = virtio_gpu_alloc_vbufs(vgdev);
dc5698e80cf724 Dave Airlie        2013-09-09  214  	if (ret) {
dc5698e80cf724 Dave Airlie        2013-09-09  215  		DRM_ERROR("failed to alloc vbufs\n");
dc5698e80cf724 Dave Airlie        2013-09-09  216  		goto err_vbufs;
dc5698e80cf724 Dave Airlie        2013-09-09  217  	}
dc5698e80cf724 Dave Airlie        2013-09-09  218  
dc5698e80cf724 Dave Airlie        2013-09-09  219  	/* get display info */
115a71d8045d85 Michael S. Tsirkin 2020-08-05 @220  	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
dc5698e80cf724 Dave Airlie        2013-09-09  221  			num_scanouts, &num_scanouts);
dc5698e80cf724 Dave Airlie        2013-09-09  222  	vgdev->num_scanouts = min_t(uint32_t, num_scanouts,
dc5698e80cf724 Dave Airlie        2013-09-09  223  				    VIRTIO_GPU_MAX_SCANOUTS);
dc5698e80cf724 Dave Airlie        2013-09-09  224  	if (!vgdev->num_scanouts) {
dc5698e80cf724 Dave Airlie        2013-09-09  225  		DRM_ERROR("num_scanouts is zero\n");
dc5698e80cf724 Dave Airlie        2013-09-09  226  		ret = -EINVAL;
dc5698e80cf724 Dave Airlie        2013-09-09  227  		goto err_scanouts;
dc5698e80cf724 Dave Airlie        2013-09-09  228  	}
62fb7a5e10962a Gerd Hoffmann      2014-10-28  229  	DRM_INFO("number of scanouts: %d\n", num_scanouts);
62fb7a5e10962a Gerd Hoffmann      2014-10-28  230  
115a71d8045d85 Michael S. Tsirkin 2020-08-05  231  	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
62fb7a5e10962a Gerd Hoffmann      2014-10-28  232  			num_capsets, &num_capsets);
62fb7a5e10962a Gerd Hoffmann      2014-10-28  233  	DRM_INFO("number of cap sets: %d\n", num_capsets);
dc5698e80cf724 Dave Airlie        2013-09-09  234  
d6005d3dde75f7 Gerd Hoffmann      2020-09-08  235  	ret = virtio_gpu_modeset_init(vgdev);
d6005d3dde75f7 Gerd Hoffmann      2020-09-08  236  	if (ret) {
d6005d3dde75f7 Gerd Hoffmann      2020-09-08  237  		DRM_ERROR("modeset init failed\n");
d6005d3dde75f7 Gerd Hoffmann      2020-09-08  238  		goto err_scanouts;
d6005d3dde75f7 Gerd Hoffmann      2020-09-08  239  	}
dc5698e80cf724 Dave Airlie        2013-09-09  240  
dc5698e80cf724 Dave Airlie        2013-09-09  241  	virtio_device_ready(vgdev->vdev);
dc5698e80cf724 Dave Airlie        2013-09-09  242  
62fb7a5e10962a Gerd Hoffmann      2014-10-28  243  	if (num_capsets)
62fb7a5e10962a Gerd Hoffmann      2014-10-28  244  		virtio_gpu_get_capsets(vgdev, num_capsets);
b4b01b4995fb15 Gerd Hoffmann      2018-10-30  245  	if (vgdev->has_edid)
b4b01b4995fb15 Gerd Hoffmann      2018-10-30  246  		virtio_gpu_cmd_get_edids(vgdev);
441012aff674c8 Dave Airlie        2015-06-16  247  	virtio_gpu_cmd_get_display_info(vgdev);
234489ea55f81a Gerd Hoffmann      2020-02-14  248  	virtio_gpu_notify(vgdev);
441012aff674c8 Dave Airlie        2015-06-16  249  	wait_event_timeout(vgdev->resp_wq, !vgdev->display_info_pending,
441012aff674c8 Dave Airlie        2015-06-16  250  			   5 * HZ);
dc5698e80cf724 Dave Airlie        2013-09-09  251  	return 0;
dc5698e80cf724 Dave Airlie        2013-09-09  252  
dc5698e80cf724 Dave Airlie        2013-09-09  253  err_scanouts:
dc5698e80cf724 Dave Airlie        2013-09-09  254  	virtio_gpu_free_vbufs(vgdev);
dc5698e80cf724 Dave Airlie        2013-09-09  255  err_vbufs:
dc5698e80cf724 Dave Airlie        2013-09-09  256  	vgdev->vdev->config->del_vqs(vgdev->vdev);
dc5698e80cf724 Dave Airlie        2013-09-09  257  err_vqs:
cec7f1774605a5 Xie Yongji         2021-05-17  258  	dev->dev_private = NULL;
dc5698e80cf724 Dave Airlie        2013-09-09  259  	kfree(vgdev);
dc5698e80cf724 Dave Airlie        2013-09-09  260  	return ret;
dc5698e80cf724 Dave Airlie        2013-09-09  261  }
dc5698e80cf724 Dave Airlie        2013-09-09  262  

:::::: The code at line 220 was first introduced by commit
:::::: 115a71d8045d8571fb05df45088837621510ba57 drm/virtio: convert to LE accessors

:::::: TO: Michael S. Tsirkin <mst@redhat.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
