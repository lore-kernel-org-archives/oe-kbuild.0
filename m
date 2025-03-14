Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951C42AF1D
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Mar 2025 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741950868; cv=none; b=dd0KdfNIeaJbk+9OZIwy65wRaO2pSaW9zlE8gihjzyGdpb4sT5FMw7gU3xkl+z68x45ljzuJnfqd4cMXuOenbPe8KnMMgvtpse8/NdK1umJDmmc/0D/EslncjKeRPZaqkDjq2Z/IthKKDodRTibqb4bf2xbUOqK4LrZc3X9y498=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741950868; c=relaxed/simple;
	bh=j+QPOEnUYo2eytC4kWJhmHBsW+AAgsU1WgT4k8Z9Swk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lqjo0L4Kfls3g6uoeVTCSFNesBH6b62FHfogHI0FJ6Rd6fLWYdEWU0HabdC9OMWndXLZ1sIETiYbksqEBuU1WIzjlz3B6oi3T6jE6iV6TbB8Onqo62jOECMJy5XRbMLlhHkZNU78Uu0I2mRVCbogZynOS11zMJAXpqWx3tm1xU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIcOBVzD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIcOBVzD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741950866; x=1773486866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j+QPOEnUYo2eytC4kWJhmHBsW+AAgsU1WgT4k8Z9Swk=;
  b=BIcOBVzDE1qf0kTy2HHH4aGNjRbptAcCLSROMCWIfR0HB9mioc5LMYls
   yJJp+rf2mQ9t3s5FOQw4kOmu4pgAqtAvowOaBMhVBGDBCPZhoBMoN4D9R
   d/TS++0QQXxMxEpdPa2dpPT74vPAGjfm+5bGWCgGpU4L4aeR/y1KLk9HG
   vcxgmRW1AvKen8wjhO6JPRTcETpmyn16dl8Win7sUwRDucbPtT2TavhLE
   L6UlNUYg8UUhKpUL4F19UF+QeHPLaVv+Eo00YsVawY5njO6e9deZ/zB39
   D+sZHu+Y+aP0/2iI9GdcIVzhGEC7XtIQTN5cDIwwXtVu3JD0Rw11LajKb
   Q==;
X-CSE-ConnectionGUID: EpPhGIFNR/+DvfyWesTHtA==
X-CSE-MsgGUID: JA6QVYwaSECloL0nwX2hlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68466623"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="68466623"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 04:14:26 -0700
X-CSE-ConnectionGUID: ppwtQJ5VTCKDDgc0uByR8A==
X-CSE-MsgGUID: BU6YLUG7QaG6G0oqs6IbFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126289189"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 14 Mar 2025 04:14:25 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt2ze-000ANM-1R;
	Fri, 14 Mar 2025 11:14:22 +0000
Date: Fri, 14 Mar 2025 19:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mfd/cgbc-core.c:104 cgbc_session_request() warn: passing
 positive error code '4294967277' to 'dev_err_probe'
Message-ID: <202503141923.7kKVyjHt-lkp@intel.com>
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
TO: Thomas Richard <thomas.richard@bootlin.com>
CC: Lee Jones <lee@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   695caca9345a160ecd9645abab8e70cfe849e9ff
commit: 6f1067cfbee72b04fc42234f7f1588f838cec0b6 mfd: Add Congatec Board Controller driver
date:   5 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141923.7kKVyjHt-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503141923.7kKVyjHt-lkp@intel.com/

smatch warnings:
drivers/mfd/cgbc-core.c:104 cgbc_session_request() warn: passing positive error code '4294967277' to 'dev_err_probe'

vim +104 drivers/mfd/cgbc-core.c

6f1067cfbee72b0 Thomas Richard 2024-10-01   96  
6f1067cfbee72b0 Thomas Richard 2024-10-01   97  static int cgbc_session_request(struct cgbc_device_data *cgbc)
6f1067cfbee72b0 Thomas Richard 2024-10-01   98  {
6f1067cfbee72b0 Thomas Richard 2024-10-01   99  	unsigned int ret;
6f1067cfbee72b0 Thomas Richard 2024-10-01  100  
6f1067cfbee72b0 Thomas Richard 2024-10-01  101  	ret = cgbc_wait_device(cgbc);
6f1067cfbee72b0 Thomas Richard 2024-10-01  102  
6f1067cfbee72b0 Thomas Richard 2024-10-01  103  	if (ret)
6f1067cfbee72b0 Thomas Richard 2024-10-01 @104  		return dev_err_probe(cgbc->dev, ret, "device not found or not ready\n");
6f1067cfbee72b0 Thomas Richard 2024-10-01  105  
6f1067cfbee72b0 Thomas Richard 2024-10-01  106  	cgbc->session = cgbc_session_command(cgbc, CGBC_SESSION_CMD_REQUEST);
6f1067cfbee72b0 Thomas Richard 2024-10-01  107  
6f1067cfbee72b0 Thomas Richard 2024-10-01  108  	/* The Board Controller sent us a wrong session handle, we cannot communicate with it */
6f1067cfbee72b0 Thomas Richard 2024-10-01  109  	if (cgbc->session < CGBC_SESSION_VALID_MIN || cgbc->session > CGBC_SESSION_VALID_MAX)
6f1067cfbee72b0 Thomas Richard 2024-10-01  110  		return dev_err_probe(cgbc->dev, -ECONNREFUSED,
6f1067cfbee72b0 Thomas Richard 2024-10-01  111  				     "failed to get a valid session handle\n");
6f1067cfbee72b0 Thomas Richard 2024-10-01  112  
6f1067cfbee72b0 Thomas Richard 2024-10-01  113  	return 0;
6f1067cfbee72b0 Thomas Richard 2024-10-01  114  }
6f1067cfbee72b0 Thomas Richard 2024-10-01  115  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
