Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EFF4C74
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Mar 2025 05:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743052729; cv=none; b=QRrPZSblxnTLIihMvGHIdv5r5zVxlk4pQJTr/ed/t23EkJqQyEJowx+Fz3mbjRfoqj8e3EzjEcOXEAyF29C2VWi1Xd8h8+wcWyCHAHUiOEUXU2WjRYVtmUOXgGbYvC77gE9OpVE29F4m21XIwOWGjwIDOFdebmWkZnP84J65cBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743052729; c=relaxed/simple;
	bh=0sPb7GWLZhzldiAA4EXFw1tKtpg2yUnKbLfBFIQaVtA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RaaeMXt/IWfMapCPifnZdC3OL13hhpGxG3VsXdNH2gIXsQ7iuWUqZESLjgmjztVP0xEYmz42B/rClX8N2gaD7WYb/58nOgQKI4Y8koGjCUVMmf0Y3NtBVg6xcSjK8WMBJT7jPtJiZuB3/i6LC3c0Qx8fztIW1J83UUbZ+YGFoOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QuhLer/T; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuhLer/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743052728; x=1774588728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0sPb7GWLZhzldiAA4EXFw1tKtpg2yUnKbLfBFIQaVtA=;
  b=QuhLer/TUcZ4d8plvsV/CK+vn+dGvr/ZjkQ5GAuzHwJPvLOGoHDu7yTH
   BkBJ82FAmL1e3A/zy3+aNCQYeKU6tZgREKwBvY4WJeiaNq3t/KDD5CV84
   9TnGCXFFV3bqCWuTiaUxskbRtG6RJgflnuar9a2WL2yKWezuUxX8W5523
   XZxNNFPvsEIvgr2vdtIhlZOHCFwOQCnhHdmkyqjbgKSuoirblkM+Bhl02
   RAi4n306UCzOA0uEiwaFeh68KPk1VHtAqyEl3dncsCkq4DKhTSyuDYqB4
   wCb5Q9XTb82OQ62ID1waQpW8fOO4WjjsPAvj95cPM4iY+vJC5BBwSEPr4
   g==;
X-CSE-ConnectionGUID: iTNyVQ6ESyuVY1JckIxrPw==
X-CSE-MsgGUID: LHDvYYJqQ5ezqrKbUKyo3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48021391"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="48021391"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 22:18:47 -0700
X-CSE-ConnectionGUID: js6/ZnlUQhKD95XwhlVinw==
X-CSE-MsgGUID: 7FU4dW8vQKeG5R/lL0hBig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="162260022"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Mar 2025 22:18:46 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txfdc-0006OB-03;
	Thu, 27 Mar 2025 05:18:44 +0000
Date: Thu, 27 Mar 2025 13:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:bits/030-misc 1/40] drivers/soc/apple/rtkit.c:371
 apple_rtkit_crashlog_rx() warn: passing freed memory 'bfr' (line 365)
Message-ID: <202503271318.nPEG98L6-lkp@intel.com>
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
TO: Asahi Lina <lina@asahilina.net>
CC: Janne Grunau <j@jannau.net>
CC: Jens Axboe <axboe@kernel.dk>
CC: Sven Peter <sven@svenpeter.dev>

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   da85ded736004f61e37a67eaac233c87e42ab459
commit: 037dde44780dec39060eed27b25a910d7b6e812b [1/40] soc: apple: rtkit: Pass the crashlog to the crashed() callback
:::::: branch date: 4 days ago
:::::: commit date: 7 weeks ago
config: sparc64-randconfig-r072-20250327 (https://download.01.org/0day-ci/archive/20250327/202503271318.nPEG98L6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503271318.nPEG98L6-lkp@intel.com/

smatch warnings:
drivers/soc/apple/rtkit.c:371 apple_rtkit_crashlog_rx() warn: passing freed memory 'bfr' (line 365)

vim +/bfr +371 drivers/soc/apple/rtkit.c

9bd1d9a0d8bb1a Sven Peter 2022-05-01  333  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  334  static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  335  {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  336  	u8 type = FIELD_GET(APPLE_RTKIT_SYSLOG_TYPE, msg);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  337  	u8 *bfr;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  338  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  339  	if (type != APPLE_RTKIT_CRASHLOG_CRASH) {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  340  		dev_warn(rtk->dev, "RTKit: Unknown crashlog message: %llx\n",
9bd1d9a0d8bb1a Sven Peter 2022-05-01  341  			 msg);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  342  		return;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  343  	}
9bd1d9a0d8bb1a Sven Peter 2022-05-01  344  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  345  	if (!rtk->crashlog_buffer.size) {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  346  		apple_rtkit_common_rx_get_buffer(rtk, &rtk->crashlog_buffer,
9bd1d9a0d8bb1a Sven Peter 2022-05-01  347  						 APPLE_RTKIT_EP_CRASHLOG, msg);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  348  		return;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  349  	}
9bd1d9a0d8bb1a Sven Peter 2022-05-01  350  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  351  	dev_err(rtk->dev, "RTKit: co-processor has crashed\n");
9bd1d9a0d8bb1a Sven Peter 2022-05-01  352  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  353  	/*
9bd1d9a0d8bb1a Sven Peter 2022-05-01  354  	 * create a shadow copy here to make sure the co-processor isn't able
9bd1d9a0d8bb1a Sven Peter 2022-05-01  355  	 * to change the log while we're dumping it. this also ensures
9bd1d9a0d8bb1a Sven Peter 2022-05-01  356  	 * the buffer is in normal memory and not iomem for e.g. the SMC
9bd1d9a0d8bb1a Sven Peter 2022-05-01  357  	 */
9bd1d9a0d8bb1a Sven Peter 2022-05-01  358  	bfr = kzalloc(rtk->crashlog_buffer.size, GFP_KERNEL);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  359  	if (bfr) {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  360  		apple_rtkit_memcpy(rtk, bfr, &rtk->crashlog_buffer, 0,
9bd1d9a0d8bb1a Sven Peter 2022-05-01  361  				   rtk->crashlog_buffer.size);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  362  		apple_rtkit_crashlog_dump(rtk, bfr, rtk->crashlog_buffer.size);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  363  		kfree(bfr);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  364  	} else {
9bd1d9a0d8bb1a Sven Peter 2022-05-01 @365  		dev_err(rtk->dev,
9bd1d9a0d8bb1a Sven Peter 2022-05-01  366  			"RTKit: Couldn't allocate crashlog shadow buffer\n");
9bd1d9a0d8bb1a Sven Peter 2022-05-01  367  	}
9bd1d9a0d8bb1a Sven Peter 2022-05-01  368  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  369  	rtk->crashed = true;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  370  	if (rtk->ops->crashed)
037dde44780dec Asahi Lina 2025-02-02 @371  		rtk->ops->crashed(rtk->cookie, bfr, rtk->crashlog_buffer.size);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  372  }
9bd1d9a0d8bb1a Sven Peter 2022-05-01  373  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
