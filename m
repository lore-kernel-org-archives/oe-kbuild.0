Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A07C155326
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 01:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765590711; cv=none; b=DyRl4XOY8FR0JXJ7Yah0vZZFkpppj/K8VNq/8n3sVpUKOS3mray9RCcgZydIBRvRCRg/Rimcgb03/oMOS9ZK2h6Iwy+g6J1P9LhXcN5gkUKPXzft7M5WDcIwIrqJGOKyZm+97hCKZcZF89g9xhahToJKyTJbSYzRilqfFEcRoIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765590711; c=relaxed/simple;
	bh=hEMrdo6YXoM9WcbDRAK7dM3gkvh5CmPt2EeWPaJuLmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdc2ee7/m+uvjHbz1aS5EtcHxKl5t6GC8Jgb9L7oZTbLCbeFu2SDi7YDmtVyBQ35ibhiAH5X3VuvBiERWLbpYuC/vPZK5X8TM46JLqrOtQO616rLgu9B5E0pJx4dM7xkPG2iJumni4AhrXTz5udKVzddlr9cakdWW7MceCeExW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0bR5x7J; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0bR5x7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765590709; x=1797126709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hEMrdo6YXoM9WcbDRAK7dM3gkvh5CmPt2EeWPaJuLmY=;
  b=R0bR5x7J+XRIRQz8gTBfdihnsgUWbDuYicKNDhO+L4QiFXlIpn3FYmt7
   0S9bgnIUsexUKYMQmEc9+xQxBLQS6QoQFKEKXvcULUS4k6d/1i5Oz6AVC
   lLS5zTjAEwg88/cVNJhN9n06amgoo7cRSUNO4Ohyr0ukNE+WmoEt3r/Xm
   HvW8ZcxBSsTgNLV8+mBX8urnxgVWn99/xZ8ZE6VT6G5h+SPf9lDB9ebgG
   3fDWTTRF+3zfm27iHmLX8Ly35OdRAxh+6VpxoNrR7Hotr7ghQ9WGC8aT4
   BOpmQJjcpogvE3HA2Hhkgv9DTV0K2MJXoga13taStLjRADnkwitfl9OwH
   Q==;
X-CSE-ConnectionGUID: wJuDAfAhQaa11mtrwgV+rQ==
X-CSE-MsgGUID: qK0lX4PDT9aLqcrOf56NQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85188131"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85188131"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 17:51:49 -0800
X-CSE-ConnectionGUID: VtyEmHfNQZ+4Grw8eGroYg==
X-CSE-MsgGUID: N6PmxPt/QRqSMHwGjfVtnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197128968"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Dec 2025 17:51:48 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUEnR-000000006uP-44av;
	Sat, 13 Dec 2025 01:51:45 +0000
Date: Sat, 13 Dec 2025 09:51:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c:134
 r535_gsp_device_ctor() warn: 'args' can also be NULL
Message-ID: <202512130925.UQUFlbCS-lkp@intel.com>
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
TO: Ben Skeggs <bskeggs@nvidia.com>
CC: Dave Airlie <airlied@redhat.com>
CC: Timur Tabi <ttabi@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: f964336483159da1f4ca67d7abef3d82e725ed36 drm/nouveau/gsp: split device handling out on its own
date:   7 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 months ago
config: microblaze-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130925.UQUFlbCS-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130925.UQUFlbCS-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c:134 r535_gsp_device_ctor() warn: 'args' can also be NULL

Old smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c:81 r535_gsp_device_event_ctor() warn: 'args' can also be NULL

vim +/args +134 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c

f964336483159d Ben Skeggs 2024-11-14  122  
f964336483159d Ben Skeggs 2024-11-14  123  static int
f964336483159d Ben Skeggs 2024-11-14  124  r535_gsp_device_ctor(struct nvkm_gsp_client *client, struct nvkm_gsp_device *device)
f964336483159d Ben Skeggs 2024-11-14  125  {
f964336483159d Ben Skeggs 2024-11-14  126  	NV0080_ALLOC_PARAMETERS *args;
f964336483159d Ben Skeggs 2024-11-14  127  	int ret;
f964336483159d Ben Skeggs 2024-11-14  128  
f964336483159d Ben Skeggs 2024-11-14  129  	args = nvkm_gsp_rm_alloc_get(&client->object, 0xde1d0000, NV01_DEVICE_0, sizeof(*args),
f964336483159d Ben Skeggs 2024-11-14  130  				     &device->object);
f964336483159d Ben Skeggs 2024-11-14  131  	if (IS_ERR(args))
f964336483159d Ben Skeggs 2024-11-14  132  		return PTR_ERR(args);
f964336483159d Ben Skeggs 2024-11-14  133  
f964336483159d Ben Skeggs 2024-11-14 @134  	args->hClientShare = client->object.handle;
f964336483159d Ben Skeggs 2024-11-14  135  
f964336483159d Ben Skeggs 2024-11-14  136  	ret = nvkm_gsp_rm_alloc_wr(&device->object, args);
f964336483159d Ben Skeggs 2024-11-14  137  	if (ret)
f964336483159d Ben Skeggs 2024-11-14  138  		return ret;
f964336483159d Ben Skeggs 2024-11-14  139  
f964336483159d Ben Skeggs 2024-11-14  140  	ret = r535_gsp_subdevice_ctor(device);
f964336483159d Ben Skeggs 2024-11-14  141  	if (ret)
f964336483159d Ben Skeggs 2024-11-14  142  		nvkm_gsp_rm_free(&device->object);
f964336483159d Ben Skeggs 2024-11-14  143  
f964336483159d Ben Skeggs 2024-11-14  144  	return ret;
f964336483159d Ben Skeggs 2024-11-14  145  }
f964336483159d Ben Skeggs 2024-11-14  146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
