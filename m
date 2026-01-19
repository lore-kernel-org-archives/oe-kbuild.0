Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C10A1A3164
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 03:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768792987; cv=none; b=nqT6sZEUqjQRtug+0/9n8nTixFJBAZJJ9G0X0+DUf/m3+2K1L3TdKpzH3xGB4lVE0qyUM3JcIKtPKwhNijUUKNyCU+hLYtpyHIz/nABNhX4wpLnALGtsGnuzZOL5vS1gXm+0ZgXRQvZ87ijyMHRjt9pBX/OVMFUaliOmyIewSDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768792987; c=relaxed/simple;
	bh=QJU6ymA2RYuPU1peDulkPdt29LAn9lUPxL1rn2SxQbU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Em8ytwCg4efNL7nmqIptt8HzF2LxtTS23uJPsm5Rarmx5pMc3KxJ57QvXOB7f0IjuGlutbNT1CQLFDDsgAMu5DjEwwpokgOwQ3URbl6VZpV8VYmqTmqthSEx95Jd5CMxvgKlxgxk1YBRIhsu9K1RFmbvtziF13Jom1YzF3TMzBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ctfa1yuG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ctfa1yuG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768792986; x=1800328986;
  h=date:from:to:cc:subject:message-id;
  bh=QJU6ymA2RYuPU1peDulkPdt29LAn9lUPxL1rn2SxQbU=;
  b=Ctfa1yuGMarIfm0ZHoEYACxOpT3a7N69SkTJMQV6qm75S/s5Rlg3miqe
   ZKgSI8VDYc0bcX3gwFMAh8bsMPWl6BveSKaBsJFRtD9bNBmin6BtqJBDh
   y3NPzoCD6PuC3QK0d66unfihGDc4fMaQQ3KwyAAhB2QgrsSk+va4MED1D
   y33bMIsMPVGCuhVSEG/hK9OJdfh6r5onjfiBzssU+DVhi+dNqeRFnBWLL
   b5zIP342mvlmYeh51hhdaii4PYA24LhodsmSUW21Kf4rwA0lVg08OPHLK
   NvQNxayabJuMKNItfD49UZ+AzahDy3Ytr/ZpQLDnFQy+6hpW2oOeiSKM+
   A==;
X-CSE-ConnectionGUID: UQ4c8ApJRnyiGbrU9U7RUA==
X-CSE-MsgGUID: kHurBuYuT1Gb1QC55p+1Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70049760"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="70049760"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 19:23:06 -0800
X-CSE-ConnectionGUID: 5NnBhRRLQXeyPrD8RzgHvA==
X-CSE-MsgGUID: 1G9XHmx9SLaHZli1D1otlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="243322791"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jan 2026 19:23:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhfr3-00000000NPm-2x9E;
	Mon, 19 Jan 2026 03:23:01 +0000
Date: Mon, 19 Jan 2026 11:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1459/6849]
 drivers/spi/spi-nxp-xspi.c:1382:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601191127.ctCLWums-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/spi/spi-nxp-xspi.c:1382:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Haibo Chen <haibo.chen@nxp.com>
CC: Mark Brown <broonie@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: 29c8c00d9f9db5fb659b6f05f9e8964afc13f3e2 [1459/6849] spi: add driver for NXP XSPI controller
:::::: branch date: 3 days ago
:::::: commit date: 5 weeks ago
config: microblaze-randconfig-r112-20260118 (https://download.01.org/0day-ci/archive/20260119/202601191127.ctCLWums-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191127.ctCLWums-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601191127.ctCLWums-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-nxp-xspi.c:1382:1: sparse: sparse: bad integer constant expression
   drivers/spi/spi-nxp-xspi.c:1382:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/spi/spi-nxp-xspi.c:1383:1: sparse: sparse: bad integer constant expression
   drivers/spi/spi-nxp-xspi.c:1383:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/spi/spi-nxp-xspi.c:1384:1: sparse: sparse: bad integer constant expression
   drivers/spi/spi-nxp-xspi.c:1384:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/spi/spi-nxp-xspi.c:1385:1: sparse: sparse: bad integer constant expression
   drivers/spi/spi-nxp-xspi.c:1385:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1382 drivers/spi/spi-nxp-xspi.c

29c8c00d9f9db5f Haibo Chen 2025-12-16  1381  
29c8c00d9f9db5f Haibo Chen 2025-12-16 @1382  MODULE_DESCRIPTION("NXP xSPI Controller Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
