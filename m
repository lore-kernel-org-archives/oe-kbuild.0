Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE4312B83
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 08:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683707364; x=1715243364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K9yobWDsAkiQya7vzc/U/+jd2Yc5ZvO8RDG5Qs3CXys=;
  b=KRvzsilybC3JQznSNdhWzVBovcrHx3ChuvpIIYHDCQR8TgB3FKCYcCvb
   IrmLEk5BTIXfH1XsiLQQwtKD8jftCxm/Bm2GdU5JwWYnVHH+c711rPp94
   d6vfL4PEZzCzDZHeoa0POyrASPtlfhPj3cMcAACAntp5NDxDY7Bd4W7n4
   Brq2zB9u0WIi8xNkN1fykwaFkE0CnqESJIK9N+6wZ+FTTRm+yHKiqesJ/
   m3y/dmS+0qfdo4gWLplI0cYzUxgzmv4TSek5T1Plvp3psYP5+EPH43lho
   c0LKuY3F8Vd5Gnl7IZRWHDIAMOml/SboEx886jCOU3niwI4XSzR2XD/OZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="413451870"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="413451870"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 01:29:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="649669917"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="649669917"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 May 2023 01:29:22 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwfCL-00033E-20;
	Wed, 10 May 2023 08:29:21 +0000
Date: Wed, 10 May 2023 16:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: samples/vfio-mdev/mbochs.c:530 mbochs_init_dev() warn: other places
 set '(struct mdev_state)->pagecount' to 'page' instead of 'array_size'
Message-ID: <202305101641.5Ra4QR7t-lkp@intel.com>
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
TO: Yi Liu <yi.l.liu@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   16a8829130ca22666ac6236178a6233208d425c3
commit: 3d5d18e1f899ac3b03e108aef8560f4cb0969da1 vfio/mbochs: Use the new device life cycle helpers
date:   8 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230510/202305101641.5Ra4QR7t-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305101641.5Ra4QR7t-lkp@intel.com/

New smatch warnings:
samples/vfio-mdev/mbochs.c:530 mbochs_init_dev() warn: other places set '(struct mdev_state)->pagecount' to 'page' instead of 'array_size'

Old smatch warnings:
samples/vfio-mdev/mbochs.c:938 mbochs_dmabuf_alloc() warn: other places set '(struct mbochs_dmabuf)->pagecount' to 'page' instead of 'array_size'
samples/vfio-mdev/mbochs.c:946 mbochs_dmabuf_alloc() warn: missing conversion: 'page_offset + pg' 'page + array_size'

vim +530 samples/vfio-mdev/mbochs.c

a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  507  
3d5d18e1f899ac Yi Liu          2022-09-21  508  static int mbochs_init_dev(struct vfio_device *vdev)
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  509  {
3d5d18e1f899ac Yi Liu          2022-09-21  510  	struct mdev_state *mdev_state =
3d5d18e1f899ac Yi Liu          2022-09-21  511  		container_of(vdev, struct mdev_state, vdev);
3d5d18e1f899ac Yi Liu          2022-09-21  512  	struct mdev_device *mdev = to_mdev_device(vdev->dev);
3d3a360e570616 Jason Gunthorpe 2021-04-06  513  	const struct mbochs_type *type =
3d3a360e570616 Jason Gunthorpe 2021-04-06  514  		&mbochs_types[mdev_get_type_group_id(mdev)];
3d5d18e1f899ac Yi Liu          2022-09-21  515  	int avail_mbytes = atomic_read(&mbochs_avail_mbytes);
681c1615f89144 Jason Gunthorpe 2021-06-17  516  	int ret = -ENOMEM;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  517  
de5494af4815a4 Jason Gunthorpe 2021-08-05  518  	do {
de5494af4815a4 Jason Gunthorpe 2021-08-05  519  		if (avail_mbytes < type->mbytes)
de5494af4815a4 Jason Gunthorpe 2021-08-05  520  			return -ENOSPC;
de5494af4815a4 Jason Gunthorpe 2021-08-05  521  	} while (!atomic_try_cmpxchg(&mbochs_avail_mbytes, &avail_mbytes,
de5494af4815a4 Jason Gunthorpe 2021-08-05  522  				     avail_mbytes - type->mbytes));
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  523  
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  524  	mdev_state->vconfig = kzalloc(MBOCHS_CONFIG_SPACE_SIZE, GFP_KERNEL);
3d5d18e1f899ac Yi Liu          2022-09-21  525  	if (!mdev_state->vconfig)
3d5d18e1f899ac Yi Liu          2022-09-21  526  		goto err_avail;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  527  
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  528  	mdev_state->memsize = type->mbytes * 1024 * 1024;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  529  	mdev_state->pagecount = mdev_state->memsize >> PAGE_SHIFT;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11 @530  	mdev_state->pages = kcalloc(mdev_state->pagecount,
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  531  				    sizeof(struct page *),
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  532  				    GFP_KERNEL);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  533  	if (!mdev_state->pages)
3d5d18e1f899ac Yi Liu          2022-09-21  534  		goto err_vconfig;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  535  
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  536  	mutex_init(&mdev_state->ops_lock);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  537  	mdev_state->mdev = mdev;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  538  	INIT_LIST_HEAD(&mdev_state->dmabufs);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  539  	mdev_state->next_id = 1;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  540  
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  541  	mdev_state->type = type;
104c7405a64d93 Gerd Hoffmann   2018-09-21  542  	mdev_state->edid_regs.max_xres = type->max_x;
104c7405a64d93 Gerd Hoffmann   2018-09-21  543  	mdev_state->edid_regs.max_yres = type->max_y;
104c7405a64d93 Gerd Hoffmann   2018-09-21  544  	mdev_state->edid_regs.edid_offset = MBOCHS_EDID_BLOB_OFFSET;
104c7405a64d93 Gerd Hoffmann   2018-09-21  545  	mdev_state->edid_regs.edid_max_size = sizeof(mdev_state->edid_blob);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  546  	mbochs_create_config_space(mdev_state);
681c1615f89144 Jason Gunthorpe 2021-06-17  547  	mbochs_reset(mdev_state);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  548  
3d5d18e1f899ac Yi Liu          2022-09-21  549  	dev_info(vdev->dev, "%s: %s, %d MB, %ld pages\n", __func__,
3d5d18e1f899ac Yi Liu          2022-09-21  550  		 type->name, type->mbytes, mdev_state->pagecount);
3d5d18e1f899ac Yi Liu          2022-09-21  551  	return 0;
3d5d18e1f899ac Yi Liu          2022-09-21  552  
3d5d18e1f899ac Yi Liu          2022-09-21  553  err_vconfig:
3d5d18e1f899ac Yi Liu          2022-09-21  554  	kfree(mdev_state->vconfig);
3d5d18e1f899ac Yi Liu          2022-09-21  555  err_avail:
3d5d18e1f899ac Yi Liu          2022-09-21  556  	atomic_add(type->mbytes, &mbochs_avail_mbytes);
3d5d18e1f899ac Yi Liu          2022-09-21  557  	return ret;
3d5d18e1f899ac Yi Liu          2022-09-21  558  }
3d5d18e1f899ac Yi Liu          2022-09-21  559  

:::::: The code at line 530 was first introduced by commit
:::::: a5e6e6505f38f7bce1d3576503a2bffff3fa888c sample: vfio bochs vbe display (host device for bochs-drm)

:::::: TO: Gerd Hoffmann <kraxel@redhat.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
