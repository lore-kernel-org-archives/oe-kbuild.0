Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342B3190664
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 12:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824280; cv=none; b=Z4tQuAAHjgJc+Z4S874MvofVbsLXrxK/Mi1VN5VehHyddN1hAJR6BXqsD3+10k+cUALYoftGh9nc+8wo7B9u5odh5evHxEplHMinCED3fBEUHJQkmC6yTI0IBKLBWgDEVsbVaCQdf6zMmloDGpgDClwCfaycNavQZMDnsmHjLCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824280; c=relaxed/simple;
	bh=fedDuc+BkxRl9/AyXFgmsjK+KzlSjzMOcBqXmcPqjlQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=isG1Yt0Oj+HdU4x5SncdgHRIrO2gZsUK/Vjtgl5xhM9doNgHe5gCOtc1ipq0AqnIK6A2ucEUcFmCt22BpxDB3vev8Lgh8dLp6gL6cwbmCUrzkBiOzZwcLhBW6+4kSNGMTSsJosJk6jdhmnL226hW1aVSyBrMK0Da1rhwOWyZFLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X5k7VMIM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X5k7VMIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768824277; x=1800360277;
  h=date:from:to:cc:subject:message-id;
  bh=fedDuc+BkxRl9/AyXFgmsjK+KzlSjzMOcBqXmcPqjlQ=;
  b=X5k7VMIMv4ubzhmWFRSBWAa3qk/XoIt0Bhq3IQgspksBsr1QwvOhDrk0
   h1+DLownMZBr0e4pOnTZGLXNoxFivf03E034mi2Kt9ClcpSev/qYdHQym
   mpdMh6zwtDqd2yj6Am3ARi1JfDWg0ZbPY373RPJ0jw1awdcc3fxjHGhSs
   eu5T0CJTwenjMRHZCpFPe89b4KWJKXxCGJiDobF4HQ3AStohOSLnb8PRT
   KSDlTFUYTcpbocoLZ4cFmhkNV54+UU7brbvlKFtn/udpqwUAsJhOR6dqZ
   TI/b8DnUKj19tydWqdTzd1pMtaNkvyos2jbiyOrNlHUfyZ/d0rh/rNYFL
   A==;
X-CSE-ConnectionGUID: HQC6hSz1QeSQsalWJvNVag==
X-CSE-MsgGUID: BxlFNfFYQt6DoClitvxpYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="73889911"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="73889911"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:04:36 -0800
X-CSE-ConnectionGUID: yOjzmca/QBWTRCI6gB2evQ==
X-CSE-MsgGUID: 1CMFllQFSNS//M5dVur3ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="237124090"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jan 2026 04:04:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhnzl-00000000Nkv-1J6b;
	Mon, 19 Jan 2026 12:04:33 +0000
Date: Mon, 19 Jan 2026 20:04:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jic23-iio:testing 47/99]
 drivers/iio/magnetometer/mmc5633.c:584:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601191912.yANQBjZC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/magnetometer/mmc5633.c:584:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Li <Frank.Li@nxp.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Carlos Song <carlos.song@nxp.com>
CC: Adrian Fluturel <fluturel.adrian@gmail.com>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   c30e80d68a7afb334fde7147ee0106f25dd58d3a
commit: 6e5f6bf2e3f036e6d7466d2a3322445729ea3356 [47/99] iio: magnetometer: Add mmc5633 sensor
:::::: branch date: 3 days ago
:::::: commit date: 4 weeks ago
config: microblaze-randconfig-r123-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191912.yANQBjZC-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191912.yANQBjZC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601191912.yANQBjZC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/magnetometer/mmc5633.c:584:1: sparse: sparse: bad integer constant expression
   drivers/iio/magnetometer/mmc5633.c:584:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/magnetometer/mmc5633.c:585:1: sparse: sparse: bad integer constant expression
   drivers/iio/magnetometer/mmc5633.c:585:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/magnetometer/mmc5633.c:586:1: sparse: sparse: bad integer constant expression
   drivers/iio/magnetometer/mmc5633.c:586:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/magnetometer/mmc5633.c:586:1: sparse: sparse: bad integer constant expression
   drivers/iio/magnetometer/mmc5633.c:586:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +584 drivers/iio/magnetometer/mmc5633.c

6e5f6bf2e3f036 Frank Li 2025-12-15  583  
6e5f6bf2e3f036 Frank Li 2025-12-15 @584  MODULE_AUTHOR("Frank Li <Frank.li@nxp.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
