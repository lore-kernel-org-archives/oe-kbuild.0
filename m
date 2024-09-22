Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4026213D89D
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 12:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727008137; cv=none; b=DfTfkhG+SZaMbNJX6Mu6ZNBnwBeST8aukIHaIjEI4wcPm5JHUfQe3S+bFog6WlHHO2fDuVgCMO5KhJF6TgvkK7C7qjrGzcfmRe2zYOPPxYS1Lc8nep9tP3kyZ6k23xc3ZrUfW5wAmXUcJZZGJmEtVcHGE1q9QdcVR/i7AjEPj9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727008137; c=relaxed/simple;
	bh=7Dw1q0P+bX2or7ix+ouHCI+0ARs3aWpioAWKJ0Z4O54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EB3fnYO394dyfyFdndPa9LpI65r+vPn1ISoe3AzN3p7LbXLoTUeWjijdiQrzwlFSPnpr3OTiqIcKumrgTdxUqty5tBUiQuQT4X7xOK8SJoQC+f5i2km4vx1iOiA6IaesNYdc8GFal0HpdB3o8wFcHmPfUZDGsPmgav9TpPWByGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ja8HTCt7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ja8HTCt7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727008135; x=1758544135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Dw1q0P+bX2or7ix+ouHCI+0ARs3aWpioAWKJ0Z4O54=;
  b=ja8HTCt7OSyEEZdh9GEF61eE/DsiSstAxTbxZ+Df12nfyZZHLqVHygMJ
   FN3WmdxD8CBqpK/gtBfImU7Bl57eUP0B+VuFOuThlWdRtOs3rO1DFqIGg
   2g8+Lb5Rfco1SplJssdBgWF/ODZjPMpUn9eTV91H4ctAsecce57pnSBJr
   XLYbUc5n03UmO/TXjtZ1d7xsDb+GHlGxhTcRjY6YiOOFjcRnYSRUpEtPQ
   YqRJJ24a9eNKpCtxdPVnioPcnIxwaRMSXnqMe4p8JrNiN5VyLBBiIHGqC
   05jE4Cew0D8cnovsQLzF1LVUNSOD+L/G40Ee8VLTpqZ5m4mFecqgQplRu
   g==;
X-CSE-ConnectionGUID: alsHjjAxTJWV/gehbkEsgg==
X-CSE-MsgGUID: dvUyab3CRGy9lqtPLFaPIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37333928"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="37333928"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 05:28:55 -0700
X-CSE-ConnectionGUID: mxO34tuxSTCTDjkmPUTMLA==
X-CSE-MsgGUID: sSsEQ1m3R+mLFi9kYSmq4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="75171172"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Sep 2024 05:28:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssLhr-000GJi-0I;
	Sun, 22 Sep 2024 12:28:51 +0000
Date: Sun, 22 Sep 2024 20:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-lts:4.19/android_s 4156/30000]
 drivers/gpu/drm/virtio/virtgpu_vq.c:750 virtio_gpu_cmd_get_edids() error:
 'cmd_p' dereferencing possible ERR_PTR()
Message-ID: <202409222012.3X1WV06O-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: d4f5248ba0ac929a5d79faf185766987fac4a73b [4156/30000] UPSTREAM: drm/virtio: add edid support
:::::: branch date: 3 weeks ago
:::::: commit date: 5 years ago
config: i386-randconfig-141-20240913 (https://download.01.org/0day-ci/archive/20240922/202409222012.3X1WV06O-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409222012.3X1WV06O-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/virtio/virtgpu_vq.c:750 virtio_gpu_cmd_get_edids() error: 'cmd_p' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/gpu/drm/virtio/virtgpu_vq.c:381 virtio_gpu_cmd_create_resource() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:400 virtio_gpu_cmd_unref_resource() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:416 virtio_gpu_cmd_resource_inval_backing() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:433 virtio_gpu_cmd_set_scanout() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:455 virtio_gpu_cmd_resource_flush() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:484 virtio_gpu_cmd_transfer_to_host_2d() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:508 virtio_gpu_cmd_resource_attach_backing() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:646 virtio_gpu_cmd_get_display_info() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:668 virtio_gpu_cmd_get_capset_info() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:721 virtio_gpu_cmd_get_capset() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:767 virtio_gpu_cmd_context_create() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:784 virtio_gpu_cmd_context_destroy() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:799 virtio_gpu_cmd_context_attach_resource() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:816 virtio_gpu_cmd_context_detach_resource() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:834 virtio_gpu_cmd_resource_create_3d() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:861 virtio_gpu_cmd_transfer_to_host_3d() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:883 virtio_gpu_cmd_transfer_from_host_3d() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:906 virtio_gpu_cmd_submit() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:934 virtio_gpu_object_attach() error: we previously assumed 'obj->pages' could be null (see line 925)

vim +/cmd_p +750 drivers/gpu/drm/virtio/virtgpu_vq.c

62fb7a5e10962a Gerd Hoffmann 2014-10-28  729  
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  730  int virtio_gpu_cmd_get_edids(struct virtio_gpu_device *vgdev)
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  731  {
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  732  	struct virtio_gpu_cmd_get_edid *cmd_p;
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  733  	struct virtio_gpu_vbuffer *vbuf;
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  734  	void *resp_buf;
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  735  	int scanout;
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  736  
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  737  	if (WARN_ON(!vgdev->has_edid))
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  738  		return -EINVAL;
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  739  
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  740  	for (scanout = 0; scanout < vgdev->num_scanouts; scanout++) {
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  741  		resp_buf = kzalloc(sizeof(struct virtio_gpu_resp_edid),
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  742  				   GFP_KERNEL);
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  743  		if (!resp_buf)
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  744  			return -ENOMEM;
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  745  
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  746  		cmd_p = virtio_gpu_alloc_cmd_resp
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  747  			(vgdev, &virtio_gpu_cmd_get_edid_cb, &vbuf,
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  748  			 sizeof(*cmd_p), sizeof(struct virtio_gpu_resp_edid),
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  749  			 resp_buf);
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30 @750  		cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_GET_EDID);
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  751  		cmd_p->scanout = cpu_to_le32(scanout);
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  752  		virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  753  	}
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  754  
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  755  	return 0;
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  756  }
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  757  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
