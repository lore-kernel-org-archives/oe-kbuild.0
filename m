Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E3826ED3A
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 05:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783574648; cv=none; b=F2uSynNAqRVVmHb9g2P0oJ1oYrBNS0lyBPUYl71+zmzvjF8OtAp6FE7NEJPuTuxEquxutmjQJEjrDVHV3/UZ2NXBMPdnOuSsLOOUKzEewwlRpm/+eIRNC79PEJGsu3CroprtECuJ7O8mZzFAccSV4UxLNKmiDlBrNZu7jz1J6Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783574648; c=relaxed/simple;
	bh=qoo9By+B9KRgQ5AUI6lnbOcqkYgKH6cuXOfZdNiZTZc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jqwmQ3upOBVa+h5DWoP+79ceSNV7bqAyTnkg03hQ1Vewl1MTGJAZ6I+Ik64D17W+ezv8HqcCsZev7pwV0yv76qjfymCRg3mslWOovFPb5J4qgr9uU32t/gTnfEHGaG02+wDhwN41HV4/1IbffYK8HY7Z9MoeI7OEWZSt/Kg0vpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QdeisCkR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QdeisCkR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783574646; x=1815110646;
  h=date:from:to:cc:subject:message-id;
  bh=qoo9By+B9KRgQ5AUI6lnbOcqkYgKH6cuXOfZdNiZTZc=;
  b=QdeisCkR3iXMN7BWW6ni9ZWpZ5KLrqyEsi7SW2KXKMoohapYVS/wAq9h
   CZ4sVyPDcS9z/robx/I4wduyBp0QW21EFyRWS7c+epwQ/WTNX1OyxsHo/
   lhdnwAyxXB1xWUKvBP19iH5v/3rHE4r1HWEKKDV8sIfkApAfuBEntwp8m
   HOHm+QczvUFv/unylStGoN77FVHB73M6Vpj22i5akx9BTflP240XLbL91
   zstjG/s2NnRYnqsQRBuEHbEKDEUvphj6jcvGnT9wKzkeWblD7vA0++EYc
   C+3v20PSW2X4H8+ACX9tSzqT/6GsIRtZ9UKLsAB/azVTdGVKhxBKE5wgk
   g==;
X-CSE-ConnectionGUID: RiTOBd8hQo6PyS3tCBMsAw==
X-CSE-MsgGUID: IlxR5IWHTl6Gbx08atOm7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84360211"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84360211"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 22:24:05 -0700
X-CSE-ConnectionGUID: ZYCTA1o2QeenNWun4lw6Pg==
X-CSE-MsgGUID: 1kNgl4qOTgSZhOYskoCb0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259385579"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jul 2026 22:24:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whhEw-00000000HJB-12Kf;
	Thu, 09 Jul 2026 05:24:02 +0000
Date: Thu, 09 Jul 2026 13:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.18/linux 1/1]
 drivers/misc/mei/hw-virtio.c:704:9: sparse: sparse: no generic selection for
 'unsigned int virtio_cread_v'
Message-ID: <202607091348.ehXQZbTV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/misc/mei/hw-virtio.c:704:9: sparse: sparse: no generic selection for 'unsigned int virtio_cread_v'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexander Usyskin <alexander.usyskin@intel.com>
CC: "sys_oak" <sys_oak@intel.com>
CC: Wang Yu <yu1.wang@intel.com>
CC: Liu Shuo <shuo.a.liu@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   5100e1c74efeba843945492f8d5840e6166c0392
commit: e5479216aa5ef4d1d806c4ec9d7e7b6fded0dff1 [1/1] mei: virtio: virtualization frontend driver
:::::: branch date: 10 days ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-r111-20260708 (https://download.01.org/0day-ci/archive/20260709/202607091348.ehXQZbTV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091348.ehXQZbTV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607091348.ehXQZbTV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/mei/hw-virtio.c:704:9: sparse: sparse: no generic selection for 'unsigned int virtio_cread_v'
>> drivers/misc/mei/hw-virtio.c:704:9: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/misc/mei/hw-virtio.c:704:9: sparse:    bad type *
   drivers/misc/mei/hw-virtio.c:704:9: sparse:    unsigned int *
>> drivers/misc/mei/hw-virtio.c:704:9: sparse: sparse: no generic selection for 'unsigned int [addressable] virtio_cread_v'

vim +704 drivers/misc/mei/hw-virtio.c

e5479216aa5ef4d Alexander Usyskin 2020-08-18  686  
e5479216aa5ef4d Alexander Usyskin 2020-08-18  687  static int mei_virtio_probe(struct virtio_device *vdev)
e5479216aa5ef4d Alexander Usyskin 2020-08-18  688  {
e5479216aa5ef4d Alexander Usyskin 2020-08-18  689  	struct mei_virtio_hw *hw;
e5479216aa5ef4d Alexander Usyskin 2020-08-18  690  	int ret;
e5479216aa5ef4d Alexander Usyskin 2020-08-18  691  
e5479216aa5ef4d Alexander Usyskin 2020-08-18  692  	hw = devm_kzalloc(&vdev->dev, sizeof(*hw), GFP_KERNEL);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  693  	if (!hw)
e5479216aa5ef4d Alexander Usyskin 2020-08-18  694  		return -ENOMEM;
e5479216aa5ef4d Alexander Usyskin 2020-08-18  695  
e5479216aa5ef4d Alexander Usyskin 2020-08-18  696  	vdev->priv = hw;
e5479216aa5ef4d Alexander Usyskin 2020-08-18  697  
e5479216aa5ef4d Alexander Usyskin 2020-08-18  698  	INIT_WORK(&hw->intr_handler, mei_virtio_intr_handler);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  699  
e5479216aa5ef4d Alexander Usyskin 2020-08-18  700  	ret = mei_virtio_init_vqs(hw, vdev);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  701  	if (ret)
e5479216aa5ef4d Alexander Usyskin 2020-08-18  702  		goto vqs_failed;
e5479216aa5ef4d Alexander Usyskin 2020-08-18  703  
e5479216aa5ef4d Alexander Usyskin 2020-08-18 @704  	virtio_cread(vdev, struct mei_virtio_cfg,
e5479216aa5ef4d Alexander Usyskin 2020-08-18  705  		     buf_depth, &hw->cfg.buf_depth);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  706  
e5479216aa5ef4d Alexander Usyskin 2020-08-18  707  	hw->recv_buf = kzalloc(mei_slots2data(hw->cfg.buf_depth), GFP_KERNEL);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  708  	if (!hw->recv_buf) {
e5479216aa5ef4d Alexander Usyskin 2020-08-18  709  		ret = -ENOMEM;
e5479216aa5ef4d Alexander Usyskin 2020-08-18  710  		goto hbuf_failed;
e5479216aa5ef4d Alexander Usyskin 2020-08-18  711  	}
e5479216aa5ef4d Alexander Usyskin 2020-08-18  712  	atomic_set(&hw->hbuf_ready, 0);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  713  
e5479216aa5ef4d Alexander Usyskin 2020-08-18  714  	virtio_device_ready(vdev);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  715  
e5479216aa5ef4d Alexander Usyskin 2020-08-18  716  	mei_device_init(&hw->mdev, &vdev->dev, false, &mei_virtio_ops);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  717  
e5479216aa5ef4d Alexander Usyskin 2020-08-18  718  	pm_runtime_get_noresume(&vdev->dev);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  719  	pm_runtime_set_active(&vdev->dev);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  720  	pm_runtime_enable(&vdev->dev);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  721  
e5479216aa5ef4d Alexander Usyskin 2020-08-18  722  	ret = mei_start(&hw->mdev);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  723  	if (ret)
e5479216aa5ef4d Alexander Usyskin 2020-08-18  724  		goto mei_start_failed;
e5479216aa5ef4d Alexander Usyskin 2020-08-18  725  
e5479216aa5ef4d Alexander Usyskin 2020-08-18  726  	pm_runtime_set_autosuspend_delay(&vdev->dev, MEI_VIRTIO_RPM_TIMEOUT);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  727  	pm_runtime_use_autosuspend(&vdev->dev);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  728  
e5479216aa5ef4d Alexander Usyskin 2020-08-18  729  	ret = mei_register(&hw->mdev, &vdev->dev);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  730  	if (ret)
e5479216aa5ef4d Alexander Usyskin 2020-08-18  731  		goto mei_failed;
e5479216aa5ef4d Alexander Usyskin 2020-08-18  732  
e5479216aa5ef4d Alexander Usyskin 2020-08-18  733  	pm_runtime_put(&vdev->dev);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  734  
e5479216aa5ef4d Alexander Usyskin 2020-08-18  735  	return 0;
e5479216aa5ef4d Alexander Usyskin 2020-08-18  736  
e5479216aa5ef4d Alexander Usyskin 2020-08-18  737  mei_failed:
e5479216aa5ef4d Alexander Usyskin 2020-08-18  738  	mei_stop(&hw->mdev);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  739  mei_start_failed:
e5479216aa5ef4d Alexander Usyskin 2020-08-18  740  	mei_cancel_work(&hw->mdev);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  741  	mei_disable_interrupts(&hw->mdev);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  742  	kfree(hw->recv_buf);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  743  hbuf_failed:
e5479216aa5ef4d Alexander Usyskin 2020-08-18  744  	vdev->config->del_vqs(vdev);
e5479216aa5ef4d Alexander Usyskin 2020-08-18  745  vqs_failed:
e5479216aa5ef4d Alexander Usyskin 2020-08-18  746  	return ret;
e5479216aa5ef4d Alexander Usyskin 2020-08-18  747  }
e5479216aa5ef4d Alexander Usyskin 2020-08-18  748  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
