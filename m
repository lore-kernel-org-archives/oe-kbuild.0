Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A0F2F44
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 03:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733974007; cv=none; b=AfbjHBz9w4T0YqWx7TMXIfHOv55QQovONbihEPGEmR6Z5LNvOkiJHucKsiBoQ7U7BdT6PWmWojA/WnDOhAtrFhI7vyoHpKHXcWKbpu/S3lpqpeJfvWdL1hdTTd6llWcGAoufSyzQ+Jec+HYcYVQNUpW5oVhv5VaitIc3CXmZ4dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733974007; c=relaxed/simple;
	bh=dceJKhesH9rEwQZf0QXJS4OK/GbWGmZah2brnRorOGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C5CeRygdDgUa9y868bfXMc/pwsrjTXomtIj+9drgsI0lTbXr/LvR4q/FI1oAsNLC9GJO8a4pARlcoWwEGOysEHDheFhJ1vs7FS6mr72onYzDpypXvcHWpobJUNOIA03ZrMAKlc18LjcByHQn1mNBrFGIwJtEsp5j5aF77f7O01o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Somw+zcs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Somw+zcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733974005; x=1765510005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dceJKhesH9rEwQZf0QXJS4OK/GbWGmZah2brnRorOGw=;
  b=Somw+zcsBd4Z9tTRGFzGhpqBy9IDhRJydHEwfAuhmKElt/oXgGJsO2CV
   J5J2Q7+MSbuHs3HkG6bRUr9MH5Sq12Zhj4EUoC7h++zBmplXZqES9kSRa
   an5dswIPlVc2S8lAo0m3cPMLS3urg7I5Eron0q8lFzlwemGJCE4Z3DJr+
   ReBZp0oGFoaIgFz7DOi3fEyxQfLgpnww9SHfiztyEwvvmnWyQBXmpS6Lx
   Dia2Ri8CUQ5DbIXYayUTtofamOsVbgts+q704AwUEF9Cx5iKAoFGzBhrU
   IbZsVbksNku5uKsjQh6kLVFoLAJFwIErypBwyt5MdCgoQDVBfKDdwOQoL
   w==;
X-CSE-ConnectionGUID: XAR6U3NFQpqGhspXt49j5w==
X-CSE-MsgGUID: cS/TBuXnRlefjNXS9Y7h2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34297831"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34297831"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 19:26:28 -0800
X-CSE-ConnectionGUID: 2OaBenfZT3OdUu/7PFftlw==
X-CSE-MsgGUID: wcgEGyG4R8uff9v5VqoZiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="96153067"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Dec 2024 19:26:27 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLZqK-0007OL-25;
	Thu, 12 Dec 2024 03:26:24 +0000
Date: Thu, 12 Dec 2024 11:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:v4l2-loopback 2/2]
 drivers/media/v4l2-core/v4l2-loopback.c:1276 vidioc_querycap() error:
 snprintf() chops off the last chars of 'dev->vdev->name': 64 vs 32
Message-ID: <202412121124.HGf5C5yR-lkp@intel.com>
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
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   a3f82e653c46a6e972edb5f623ab83190db10758
commit: a3f82e653c46a6e972edb5f623ab83190db10758 [2/2] media: v4l2-loopback
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-r073-20241210 (https://download.01.org/0day-ci/archive/20241212/202412121124.HGf5C5yR-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121124.HGf5C5yR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412121124.HGf5C5yR-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/media/v4l2-core/v4l2-loopback.o: in function `buffer_written':
>> (.text+0xb48): undefined reference to `__moddi3'
   microblaze-linux-ld: drivers/media/v4l2-core/v4l2-loopback.o: in function `vidioc_reqbufs':
   (.text+0x36b4): undefined reference to `__moddi3'
   microblaze-linux-ld: drivers/media/v4l2-core/v4l2-loopback.o: in function `v4l2_loopback_write':
   (.text+0x382c): undefined reference to `__moddi3'
   microblaze-linux-ld: drivers/media/v4l2-core/v4l2-loopback.o: in function `get_capture_buffer':
   (.text+0x3c24): undefined reference to `__moddi3'
>> microblaze-linux-ld: (.text+0x3e5c): undefined reference to `__moddi3'

smatch warnings:
drivers/media/v4l2-core/v4l2-loopback.c:1276 vidioc_querycap() error: snprintf() chops off the last chars of 'dev->vdev->name': 64 vs 32
drivers/media/v4l2-core/v4l2-loopback.c:2644 v4l2l_control_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

vim +1276 drivers/media/v4l2-core/v4l2-loopback.c

a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1261  
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1262  /* V4L2 ioctl caps and params calls */
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1263  /* returns device capabilities
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1264   * called on VIDIOC_QUERYCAP
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1265   */
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1266  static int vidioc_querycap(struct file *file, void *priv,
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1267  			   struct v4l2_capability *cap)
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1268  {
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1269  	struct v4l2_loopback_device *dev = v4l2l_getdevice(file);
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1270  	int device_nr =
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1271  		((struct v4l2l_private *)video_get_drvdata(dev->vdev))
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1272  			->device_nr;
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1273  	__u32 capabilities = V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1274  
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1275  	strscpy(cap->driver, "v4l2 loopback", sizeof(cap->driver));
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22 @1276  	snprintf(cap->card, sizeof(cap->card), "%s", dev->vdev->name);
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1277  	snprintf(cap->bus_info, sizeof(cap->bus_info),
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1278  		 "platform:v4l2loopback-%03d", device_nr);
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1279  
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1280  	if (dev->announce_all_caps) {
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1281  		capabilities |= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OUTPUT;
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1282  	} else {
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1283  		if (dev->ready_for_capture) {
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1284  			capabilities |= V4L2_CAP_VIDEO_CAPTURE;
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1285  		}
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1286  		if (dev->ready_for_output) {
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1287  			capabilities |= V4L2_CAP_VIDEO_OUTPUT;
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1288  		}
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1289  	}
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1290  
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1291  	dev->vdev->device_caps = cap->device_caps = cap->capabilities = capabilities;
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1292  	cap->capabilities |= V4L2_CAP_DEVICE_CAPS;
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1293  	memset(cap->reserved, 0, sizeof(cap->reserved));
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1294  	return 0;
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1295  }
a3f82e653c46a6e Jarkko Sakkinen 2024-11-22  1296  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
