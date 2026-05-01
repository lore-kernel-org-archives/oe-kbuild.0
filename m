Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470C320C461
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 04:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777609163; cv=none; b=FjJgDTrOUpNuKByXR+b4CWNuontc7w/alC8jnSwJmsJ6P/LJIEDj98BCko7fZCFuYEnSM8ZETadG4I5P1hLgypIFL8K+WbOLHBHXOQAJX81dl2qS1TSA80J7uZSCC+H6EOlDd4Xx/2VQC7+uWNDTHiHcgBsJe2PIGDv+ebh/+/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777609163; c=relaxed/simple;
	bh=x95UGiUfR031MMfBKYFQzAecCbtuzIUKID8+vq7zeaY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iISNkjFAGcZzZq0rVUPgCkWIlfK85jaOrTul/8Ocn15xV8iTpjfhinK+3MO8EdxIqYPqBLwsn72q0DG4y+TV00IHVdeW7zNrU5MQYCvIL3wMyoV3GizXRZ8kj3E7a53q3r6HbkMhia/1OpiFTkX5qVUCU1zTLMqRSm1u/oTsCXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXuX3D/G; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXuX3D/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777609161; x=1809145161;
  h=date:from:to:cc:subject:message-id;
  bh=x95UGiUfR031MMfBKYFQzAecCbtuzIUKID8+vq7zeaY=;
  b=cXuX3D/Gkt8cvsX1nIlk5Y3K61MXPqupvF5vT7gKhgWmI3x/KyQpsefZ
   2VfcXuBXaL3Ori2TumK4FeGhZKjj8oWL7pz7QY+hE8Z0kBtYwS/QAhbhN
   89WF6L2fQZ5OXFlTuKHLmk8RzV5BKQ3Y4rT+RTNtiWl5eY3pyYzV4hFN4
   tb/qdhYKgGpptCLZ23GiNA+c7kWVNk1yyEn8zgDwqf0K/qPx+eB4tKFRB
   3hMt/8AT0Q33yMnMe4u3dCbZg30ipCYtITV644FLjoLW2arBeg7E+bSyI
   U52fKjKqXmZKeck812nU7gcS/InfTf61WxYDymUORlZCz2EiFzb5tDEIV
   Q==;
X-CSE-ConnectionGUID: tUu+MLf1TTiBaOCFqv7T4g==
X-CSE-MsgGUID: BV15Vg2DRqOtnTnAp9okxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89266767"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="89266767"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 21:19:21 -0700
X-CSE-ConnectionGUID: lMWahqjKSN6dyABH6h3fpw==
X-CSE-MsgGUID: GS3Qx3oKQWmeVORWzDm8WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="239783252"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Apr 2026 21:19:19 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIfLR-000000000AK-1LUI;
	Fri, 01 May 2026 04:19:17 +0000
Date: Fri, 01 May 2026 12:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/virtio/virtio.c:709:12: warning:
 'virtio_device_reinit_noirq' defined but not used
Message-ID: <202605011230.OknGJmgq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Sungho-Bae/virtio_ring-export-virtqueue_reinit_vring-for-noirq-restore/20260430-155746, commit: 8b70d35d8af788aa32d3223b42c7e926ed68d83b"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sungho Bae <baver.bae@lge.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sungho-Bae/virtio_ring-export-virtqueue_reinit_vring-for-noirq-restore/20260430-155746
head:   097a3476162c5497424cb5f14dcb0ac31df6fc08
commit: 8b70d35d8af788aa32d3223b42c7e926ed68d83b virtio: add noirq system sleep PM infrastructure
date:   20 hours ago
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260501/202605011230.OknGJmgq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011230.OknGJmgq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605011230.OknGJmgq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio.c:709:12: warning: 'virtio_device_reinit_noirq' defined but not used [-Wunused-function]
     709 | static int virtio_device_reinit_noirq(struct virtio_device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/virtio/virtio.c:196:13: warning: 'virtio_config_core_enable_noirq' defined but not used [-Wunused-function]
     196 | static void virtio_config_core_enable_noirq(struct virtio_device *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/virtio_device_reinit_noirq +709 drivers/virtio/virtio.c

a0ec4fb63f5ce15 Israel Rukshin 2024-11-27  701  
8b70d35d8af788a Sungho Bae     2026-04-29  702  /*
8b70d35d8af788a Sungho Bae     2026-04-29  703   * noirq-safe variant of virtio_device_reinit().
8b70d35d8af788a Sungho Bae     2026-04-29  704   *
8b70d35d8af788a Sungho Bae     2026-04-29  705   * Requires the transport to declare config_ops->noirq_safe, which means
8b70d35d8af788a Sungho Bae     2026-04-29  706   * reset, get_status, set_status, and finalize_features are safe to call
8b70d35d8af788a Sungho Bae     2026-04-29  707   * during the noirq PM phase.
8b70d35d8af788a Sungho Bae     2026-04-29  708   */
8b70d35d8af788a Sungho Bae     2026-04-29 @709  static int virtio_device_reinit_noirq(struct virtio_device *dev)
8b70d35d8af788a Sungho Bae     2026-04-29  710  {
8b70d35d8af788a Sungho Bae     2026-04-29  711  	struct virtio_driver *drv = drv_to_virtio(dev->dev.driver);
8b70d35d8af788a Sungho Bae     2026-04-29  712  	int ret;
8b70d35d8af788a Sungho Bae     2026-04-29  713  
8b70d35d8af788a Sungho Bae     2026-04-29  714  	/*
8b70d35d8af788a Sungho Bae     2026-04-29  715  	 * We always start by resetting the device, in case a previous
8b70d35d8af788a Sungho Bae     2026-04-29  716  	 * driver messed it up.
8b70d35d8af788a Sungho Bae     2026-04-29  717  	 */
8b70d35d8af788a Sungho Bae     2026-04-29  718  	virtio_reset_device_noirq(dev);
8b70d35d8af788a Sungho Bae     2026-04-29  719  
8b70d35d8af788a Sungho Bae     2026-04-29  720  	/* Acknowledge that we've seen the device. */
8b70d35d8af788a Sungho Bae     2026-04-29  721  	virtio_add_status_noirq(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
8b70d35d8af788a Sungho Bae     2026-04-29  722  
8b70d35d8af788a Sungho Bae     2026-04-29  723  	/*
8b70d35d8af788a Sungho Bae     2026-04-29  724  	 * Maybe driver failed before freeze.
8b70d35d8af788a Sungho Bae     2026-04-29  725  	 * Restore the failed status, for debugging.
8b70d35d8af788a Sungho Bae     2026-04-29  726  	 */
8b70d35d8af788a Sungho Bae     2026-04-29  727  	if (dev->failed)
8b70d35d8af788a Sungho Bae     2026-04-29  728  		virtio_add_status_noirq(dev, VIRTIO_CONFIG_S_FAILED);
8b70d35d8af788a Sungho Bae     2026-04-29  729  
8b70d35d8af788a Sungho Bae     2026-04-29  730  	if (!drv)
8b70d35d8af788a Sungho Bae     2026-04-29  731  		return 0;
8b70d35d8af788a Sungho Bae     2026-04-29  732  
8b70d35d8af788a Sungho Bae     2026-04-29  733  	/* We have a driver! */
8b70d35d8af788a Sungho Bae     2026-04-29  734  	virtio_add_status_noirq(dev, VIRTIO_CONFIG_S_DRIVER);
8b70d35d8af788a Sungho Bae     2026-04-29  735  
8b70d35d8af788a Sungho Bae     2026-04-29  736  	ret = dev->config->finalize_features(dev);
8b70d35d8af788a Sungho Bae     2026-04-29  737  	if (ret)
8b70d35d8af788a Sungho Bae     2026-04-29  738  		return ret;
8b70d35d8af788a Sungho Bae     2026-04-29  739  
8b70d35d8af788a Sungho Bae     2026-04-29  740  	return virtio_features_ok_noirq(dev);
8b70d35d8af788a Sungho Bae     2026-04-29  741  }
8b70d35d8af788a Sungho Bae     2026-04-29  742  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
