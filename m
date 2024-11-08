Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945B01E47CC
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Nov 2024 12:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731068226; cv=none; b=FYK9FVVa+xXHVF6TIRzpTq3hmUa+s437WmWZUwwHwjZ7Fa0O4jixwjVRJYkoIMKh4YOnLbEBrLVGH2Rd7jPRnSQFRgbk0+zX6eE/XuaSgLVO8vh5OAnrLwS0mEVoayYmPxOuooxK6dliZK5OZZhwMeUbS/xHcgs16/nlFzDPti8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731068226; c=relaxed/simple;
	bh=hS9Mbzh073nHQSnRj83VDi05k/SNT9SyG6XYMweIoIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=stkPHcP21MYrw4EtTj+JSmEUOdHLmS7jwzEAdET2VG16ux4uLR01U6hQEc1hEANkaIkHtUh4sPrjNOoEskrcn2/KsxXlEUu/5N9zZhV6JGjx4P8SnX0zlETsvJwRpfXcsoTgK7mhFyZpZAbeqUmnWDOweq7xV9uOCWQuugSqkEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5+NG1xo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5+NG1xo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731068225; x=1762604225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hS9Mbzh073nHQSnRj83VDi05k/SNT9SyG6XYMweIoIM=;
  b=L5+NG1xowZsuPgcYkljDIaPE/pNymVSkqFZb9/XmN814xat+oMrCdU7T
   7VZGtNrSLO+3nf4PRYfVOzAylxBGVxjpMMNa3nA0EES3R8zM9W/g4YA0p
   P0EjEaaQ/y48xVQ3uL5Qfcd3BfuS7lupTr/4QyR9lX1tPlTu8Aa1rv62t
   1yhwyfi7Te510WW9upaA43dCEaPqfNGmtr9VV7lBcBgsoE+YYU1MJzNLD
   8OPjT0CLKFWesxiTxkVqb3iz2JRL+BDl/dCTTAgmte3p4p2GH5eFRy7qR
   xJbhEvUEgvC4Y7RfPL0WGEDZJFl1e2WeAnT48ZWj5iqaJ0iO5ZAddUR6d
   Q==;
X-CSE-ConnectionGUID: q2gr0uM4QP6RF9ALywKzhQ==
X-CSE-MsgGUID: zrDvtSMaQtukNeC5i/gA2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41507848"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41507848"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 04:17:04 -0800
X-CSE-ConnectionGUID: Skc44o9mTj2WaRBcRjv1vA==
X-CSE-MsgGUID: OBdQD6AyRUalnmhrU7w7yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="90078260"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Nov 2024 04:17:03 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9NvA-000rPa-1q;
	Fri, 08 Nov 2024 12:17:00 +0000
Date: Fri, 8 Nov 2024 20:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/virtio/virtio_pci_common.c:396 vp_find_vqs_intx() warn:
 'vp_dev->pci_dev->irq' from request_irq() not released on lines: 396.
Message-ID: <202411082004.K40Nskff-lkp@intel.com>
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
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   906bd684e4b1e517dd424a354744c5b0aebef8af
commit: 5284984a4fbacb0883bfebe905902cdda2891a07 bug: Fix no-return-statement warning with !CONFIG_BUG
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: sparc-randconfig-r072-20241107 (https://download.01.org/0day-ci/archive/20241108/202411082004.K40Nskff-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411082004.K40Nskff-lkp@intel.com/

smatch warnings:
drivers/virtio/virtio_pci_common.c:396 vp_find_vqs_intx() warn: 'vp_dev->pci_dev->irq' from request_irq() not released on lines: 396.
drivers/scsi/advansys.c:2671 advansys_info() warn: argument 5 to %lX specifier is cast from pointer
drivers/net/ethernet/dec/tulip/winbond-840.c:653 netdev_open() warn: 'np->pci_dev->irq' from request_irq() not released on lines: 653.
drivers/scsi/qla2xxx/qla_nx.c:1685 qla82xx_iospace_config() warn: 'ha->pdev' from pci_request_regions() not released on lines: 1685.
drivers/scsi/myrb.c:3150 DAC960_PD_hw_init() warn: 'cb->io_addr' from __request_region() not released on lines: 3130,3137,3143.
drivers/scsi/myrb.c:3316 DAC960_P_hw_init() warn: 'cb->io_addr' from __request_region() not released on lines: 3296,3303,3309.

vim +396 drivers/virtio/virtio_pci_common.c

e969fed542cae08 drivers/virtio/virtio_pci.c        Michael S. Tsirkin 2009-07-26  360  
3153234097f6a0d drivers/virtio/virtio_pci_common.c Solomon Tan        2022-04-18  361  static int vp_find_vqs_intx(struct virtio_device *vdev, unsigned int nvqs,
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  362  		struct virtqueue *vqs[], vq_callback_t *callbacks[],
13aa8c6c37bd54e drivers/virtio/virtio_pci_common.c Michael S. Tsirkin 2022-08-16  363  		const char * const names[], const bool *ctx)
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  364  {
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  365  	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
ddbeac07a39a81d drivers/virtio/virtio_pci_common.c Wei Wang           2018-12-28  366  	int i, err, queue_idx = 0;
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  367  
0a9b3f47da5b8a2 drivers/virtio/virtio_pci_common.c Michael S. Tsirkin 2017-04-04  368  	vp_dev->vqs = kcalloc(nvqs, sizeof(*vp_dev->vqs), GFP_KERNEL);
0a9b3f47da5b8a2 drivers/virtio/virtio_pci_common.c Michael S. Tsirkin 2017-04-04  369  	if (!vp_dev->vqs)
0a9b3f47da5b8a2 drivers/virtio/virtio_pci_common.c Michael S. Tsirkin 2017-04-04  370  		return -ENOMEM;
0a9b3f47da5b8a2 drivers/virtio/virtio_pci_common.c Michael S. Tsirkin 2017-04-04  371  
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  372  	err = request_irq(vp_dev->pci_dev->irq, vp_interrupt, IRQF_SHARED,
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  373  			dev_name(&vdev->dev), vp_dev);
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  374  	if (err)
0b0f9dc52ed0333 drivers/virtio/virtio_pci_common.c Michael S. Tsirkin 2017-04-04  375  		goto out_del_vqs;
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  376  
0b0f9dc52ed0333 drivers/virtio/virtio_pci_common.c Michael S. Tsirkin 2017-04-04  377  	vp_dev->intx_enabled = 1;
0a9b3f47da5b8a2 drivers/virtio/virtio_pci_common.c Michael S. Tsirkin 2017-04-04  378  	vp_dev->per_vq_vectors = false;
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  379  	for (i = 0; i < nvqs; ++i) {
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  380  		if (!names[i]) {
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  381  			vqs[i] = NULL;
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  382  			continue;
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  383  		}
ddbeac07a39a81d drivers/virtio/virtio_pci_common.c Wei Wang           2018-12-28  384  		vqs[i] = vp_setup_vq(vdev, queue_idx++, callbacks[i], names[i],
f94682dde5ed23e drivers/virtio/virtio_pci_common.c Michael S. Tsirkin 2017-03-06  385  				     ctx ? ctx[i] : false,
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  386  				     VIRTIO_MSI_NO_VECTOR);
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  387  		if (IS_ERR(vqs[i])) {
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  388  			err = PTR_ERR(vqs[i]);
0b0f9dc52ed0333 drivers/virtio/virtio_pci_common.c Michael S. Tsirkin 2017-04-04  389  			goto out_del_vqs;
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  390  		}
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  391  	}
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  392  
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  393  	return 0;
0b0f9dc52ed0333 drivers/virtio/virtio_pci_common.c Michael S. Tsirkin 2017-04-04  394  out_del_vqs:
0b0f9dc52ed0333 drivers/virtio/virtio_pci_common.c Michael S. Tsirkin 2017-04-04  395  	vp_del_vqs(vdev);
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17 @396  	return err;
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  397  }
a3cbec69727c8c1 drivers/virtio/virtio_pci_common.c Christoph Hellwig  2016-11-17  398  

:::::: The code at line 396 was first introduced by commit
:::::: a3cbec69727c8c149ee2b3652e184818cc269fe6 virtio_pci: split vp_try_to_find_vqs into INTx and MSI-X variants

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
