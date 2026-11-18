Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043404;
	b=PhJWTf1ZocYg5hf5CDSLipR/9w8gtc12WmMs+rcb+04zlnbRiVA2J6LAxKYgGErJLEN2
	 J6AiFCdX39dn7r2nYIHnJpfw9OIXQlwlqVgZbRbuMp64Cl9ier+AtmO4RU1jbKl4Ewih1
	 /prniSkJsuqcQxEBH/n/QR8klikQKNPSo9NR2V/8i7bofC/Grz6EgQ0uOjoYq5DDLPm+T
	 9lcQWFnF7DlCVMoBE6QbMUsobIl58RvRoxcLS1/N8t33dTaXuR3HoC+MDkcokJ8/unu1C
	 Y/ofMeVC4mT3zY5rcj0D5uOBWl1opJk+mCNoQqvJ3cnbzJCQUK2+7Y/uHNzUwQrYS6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043404;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=J3kFu8dDhn2aUPsm00Fvxu60SMezinzUBAJFDAbamTQ=;
	b=IN0e5WzrTapTdBiISiohirhrFMX9+wfNYM4DVd+822IhNIvBTkbfav2BHU001WH/ckn+
	 kprx0BonRMKPWMlX0Lro9HcHxD0x2nIJzWAKRer4iqoW5Rs6R3Wm3qeN7s+ypnZJRV3jD
	 JW/LdgjQ7Bn+JcQVj6MP9oxA3YBNM36tihWBy1PJEqRyZoyfvjZuBZhsz8ftXXrOyC6kM
	 qhDR+yBWQMMGWQ+UkA9pyuwyfydWrZ4KZyLveJR0jwqMhewZu7mUmJyGG5LITbCdDNV7Q
	 3/Q00U5B/6WvwWX+SXLzvt24PEKUp33lXvgNE/LqN+fLXC3Yi3EU4WGSyh4r2ELzi5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PckVchTq;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C370A606A325
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 23:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C370A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PckVchTq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795043402; x=1826579402;
  h=date:from:to:cc:subject:message-id;
  bh=HjRg6wzqXW/nE81ytBUyTCnKC8FMLgTsFW4rCiuqBwQ=;
  b=PckVchTqfxq9cd1HsogW0D2dSwOm9iO9/ochcRq7U243bvvp0G2/voVk
   548nXTbWRS97NdIcYd5tzashz8WtuAZVcKOGN2GitTKh66yssXPGCB5QR
   lnWJ5g52D7HfJHB4QCvAGi/guCSxhTh6QQxXp//mQ0mfuQnWaTMG8H7C3
   HeVxOCJSXco/+Ro0bjE/hUWw7iVbPqf8e9OW0uNYqbgJcBdxl5j07yEgR
   +2x/04ijEAU9hrdxiLqFI4oAuh2RLEV1ij77yBhdgpplqJI4zkF1Asksp
   ysppucb90gATX4j99IcRBJYT19uEX1O2wlnL5H7TNfivJDDYRP4j6Jk65
   g==;
X-CSE-ConnectionGUID: j0KwgUPgTdeS8ZolPYB1bw==
X-CSE-MsgGUID: 0r1jm73bRsSq/LKzUAMAww==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3775237"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3775237"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 15:10:02 -0800
X-CSE-ConnectionGUID: nCE5L8PBTfqBepFR85xOIA==
X-CSE-MsgGUID: Xr5OsEpuSnKevpN25p/fQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10268103"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Nov 2026 15:10:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTomq-000000003Vt-3WSC;
	Wed, 18 Nov 2026 23:09:56 +0000
Date: Thu, 19 Nov 2026 00:09:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [leon-rdma:device-trust-core-v3 20/32]
 drivers/base/trust.c:95 device_trust_prepare() error: we previously assumed
 'dev->p' could be null (see line 90)
Message-ID: <20261119000643.qKZkrw1f-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git device-trust-core-v3
head:   ff78947dbc26baf4175b0a682ded1a9f45d2df0c
commit: ecb674d98988f0f964435c876c16e49290941770 [20/32] driver core: Introduce a generic device trust level
:::::: branch date: 4 hours ago
:::::: commit date: 6 hours ago
config: m68k-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119000643.qKZkrw1f-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261119000643.qKZkrw1f-lkp@intel.com/

smatch warnings:
drivers/base/trust.c:95 device_trust_prepare() error: we previously assumed 'dev->p' could be null (see line 90)

vim +95 drivers/base/trust.c

ecb674d98988f0 Leon Romanovsky 2026-11-11   73  
ecb674d98988f0 Leon Romanovsky 2026-11-11   74  /**
ecb674d98988f0 Leon Romanovsky 2026-11-11   75   * device_trust_prepare - Admit a driver before operating a device
ecb674d98988f0 Leon Romanovsky 2026-11-11   76   * @dev: initialized device with its bus, name and initial policy set
ecb674d98988f0 Leon Romanovsky 2026-11-11   77   * @drv: driver claiming or probing the device
ecb674d98988f0 Leon Romanovsky 2026-11-11   78   *
ecb674d98988f0 Leon Romanovsky 2026-11-11   79   * The caller must hold the device lock. Buses may admit a claim before
ecb674d98988f0 Leon Romanovsky 2026-11-11   80   * device_add(); registration preserves the resulting policy and commitment.
ecb674d98988f0 Leon Romanovsky 2026-11-11   81   * Clear the active level after the driver has stopped operating the device.
ecb674d98988f0 Leon Romanovsky 2026-11-11   82   *
ecb674d98988f0 Leon Romanovsky 2026-11-11   83   * Return: 0 on admission, or a negative error before driver setup.
ecb674d98988f0 Leon Romanovsky 2026-11-11   84   */
ecb674d98988f0 Leon Romanovsky 2026-11-11   85  int device_trust_prepare(struct device *dev, const struct device_driver *drv)
ecb674d98988f0 Leon Romanovsky 2026-11-11   86  {
ecb674d98988f0 Leon Romanovsky 2026-11-11   87  	int ret;
ecb674d98988f0 Leon Romanovsky 2026-11-11   88  
ecb674d98988f0 Leon Romanovsky 2026-11-11   89  	device_lock_assert(dev);
ecb674d98988f0 Leon Romanovsky 2026-11-11  @90  	if (!dev->p) {
ecb674d98988f0 Leon Romanovsky 2026-11-11   91  		ret = device_private_init(dev);
ecb674d98988f0 Leon Romanovsky 2026-11-11   92  		if (ret)
ecb674d98988f0 Leon Romanovsky 2026-11-11   93  			return ret;
ecb674d98988f0 Leon Romanovsky 2026-11-11   94  		device_trust_init(dev);
ecb674d98988f0 Leon Romanovsky 2026-11-11  @95  		device_trust_init_state(dev);
ecb674d98988f0 Leon Romanovsky 2026-11-11   96  	}
ecb674d98988f0 Leon Romanovsky 2026-11-11   97  	return __device_trust_prepare(dev, drv, false);
ecb674d98988f0 Leon Romanovsky 2026-11-11   98  }
ecb674d98988f0 Leon Romanovsky 2026-11-11   99  EXPORT_SYMBOL_GPL(device_trust_prepare);
ecb674d98988f0 Leon Romanovsky 2026-11-11  100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
