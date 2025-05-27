Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1056A1922F4
	for <oe-kbuild@lists.linux.dev>; Tue, 27 May 2025 20:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748376329; cv=none; b=S4RCJyT2uD8M5QQ/OCirJcqTMO7g+XT5duAH4KHkrzWucX1z8StH/wyWMO8S1TWhLje3tccLrKgUBZtfkOWChvjLl4WIQ3XS7Gjvp0mhBij7d7R3fx6M45RR2nJZjmIsBRLFg1CR6ytac6YkrfGGnQXWrQfJYxMpyjXu/yLNk5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748376329; c=relaxed/simple;
	bh=Np8X2O13TDDOsqQy6gHVGxg5yTcFCBHKNoiu5D/8cfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N9JOHtAdy1DCYR331TMlEGc01Rz8aQ6EAH1FYT7+/L+/nN8iOBmMdN1gngclSDeCGE0Uj+C8vAIC6NTa8W7DJmO5FDcaVXiwHYKTrJi74UGaQnIU3yRqpr+lsDSjWMm2w6gkNdq/POxXsI3MG29Z86KFGp4nje3gWAJbgiWrmjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWZe+ouJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWZe+ouJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748376328; x=1779912328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Np8X2O13TDDOsqQy6gHVGxg5yTcFCBHKNoiu5D/8cfM=;
  b=cWZe+ouJy7+r9cWXz2c/qopiTaNBvhF+owql1AEkJWtPw1AuXyzKE8z1
   rWSOqelGc/KnN8+oo9otMJmroQmTl41uHKKXy/UXx4t83tEpMO75sDwIJ
   poNDPfz5Z0O/TlhY4o2v1rkXp8nWYuRhCbDGdOPi2C0MBx63hDfgZgg2c
   bnCfPRObCrzIDYjHWg0D58b3eMBgJSA3zvtn2yOGJnkq/8vWrOPdMjBEK
   EO2IbjgLEAAh0dadKunM9E2zjL/80ytLZeYaZlUpn7/8TlN43AzB2EnZt
   1irtXW1OyVqQVM7pi6yPoe6TE4YV1XRrmAYHvoofxrcby80+N0x1tqab5
   g==;
X-CSE-ConnectionGUID: 7qBQFuatTvKytksaIsq2dg==
X-CSE-MsgGUID: 6keRd7mfSqimol0EbESWlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50544792"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="50544792"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 13:05:27 -0700
X-CSE-ConnectionGUID: Rm3yv8HGS3eU4bzkYa5hnA==
X-CSE-MsgGUID: 7xdyCylQSS2iC+O8hCQF3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="173931316"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 May 2025 13:05:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK0Y8-000Uye-04;
	Tue, 27 May 2025 20:05:24 +0000
Date: Wed, 28 May 2025 04:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12165/13594]
 drivers/firmware/efi/test/efi_test.c:364 efi_runtime_get_waketime() error:
 uninitialized symbol 'pending'.
Message-ID: <202505280429.ar3JbyY2-lkp@intel.com>
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
TO: Ivan Hu <ivan.hu@canonical.com>
CC: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fefff2755f2aa4125dce2a1edfe7e545c7c621f2
commit: 3dcb524d785373fd43b129f01f32bd394fe167e0 [12165/13594] efi/efi_test: Fix missing pending status update in getwakeuptime
:::::: branch date: 10 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20250527 (https://download.01.org/0day-ci/archive/20250528/202505280429.ar3JbyY2-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505280429.ar3JbyY2-lkp@intel.com/

New smatch warnings:
drivers/firmware/efi/test/efi_test.c:364 efi_runtime_get_waketime() error: uninitialized symbol 'pending'.

Old smatch warnings:
drivers/firmware/efi/test/efi_test.c:360 efi_runtime_get_waketime() error: uninitialized symbol 'enabled'.
drivers/firmware/efi/test/efi_test.c:533 efi_runtime_get_nexthighmonocount() error: uninitialized symbol 'count'.

vim +/pending +364 drivers/firmware/efi/test/efi_test.c

ff6301dabc3ca2 Ivan Hu 2016-08-25  335  
ff6301dabc3ca2 Ivan Hu 2016-08-25  336  static long efi_runtime_get_waketime(unsigned long arg)
ff6301dabc3ca2 Ivan Hu 2016-08-25  337  {
ff6301dabc3ca2 Ivan Hu 2016-08-25  338  	struct efi_getwakeuptime __user *getwakeuptime_user;
ff6301dabc3ca2 Ivan Hu 2016-08-25  339  	struct efi_getwakeuptime getwakeuptime;
ff6301dabc3ca2 Ivan Hu 2016-08-25  340  	efi_bool_t enabled, pending;
ff6301dabc3ca2 Ivan Hu 2016-08-25  341  	efi_status_t status;
ff6301dabc3ca2 Ivan Hu 2016-08-25  342  	efi_time_t efi_time;
ff6301dabc3ca2 Ivan Hu 2016-08-25  343  
ff6301dabc3ca2 Ivan Hu 2016-08-25  344  	getwakeuptime_user = (struct efi_getwakeuptime __user *)arg;
ff6301dabc3ca2 Ivan Hu 2016-08-25  345  	if (copy_from_user(&getwakeuptime, getwakeuptime_user,
ff6301dabc3ca2 Ivan Hu 2016-08-25  346  				sizeof(getwakeuptime)))
ff6301dabc3ca2 Ivan Hu 2016-08-25  347  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  348  
ff6301dabc3ca2 Ivan Hu 2016-08-25  349  	status = efi.get_wakeup_time(
ff6301dabc3ca2 Ivan Hu 2016-08-25  350  		getwakeuptime.enabled ? (efi_bool_t *)&enabled : NULL,
ff6301dabc3ca2 Ivan Hu 2016-08-25  351  		getwakeuptime.pending ? (efi_bool_t *)&pending : NULL,
ff6301dabc3ca2 Ivan Hu 2016-08-25  352  		getwakeuptime.time ? &efi_time : NULL);
ff6301dabc3ca2 Ivan Hu 2016-08-25  353  
ff6301dabc3ca2 Ivan Hu 2016-08-25  354  	if (put_user(status, getwakeuptime.status))
ff6301dabc3ca2 Ivan Hu 2016-08-25  355  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  356  
ff6301dabc3ca2 Ivan Hu 2016-08-25  357  	if (status != EFI_SUCCESS)
ff6301dabc3ca2 Ivan Hu 2016-08-25  358  		return -EINVAL;
ff6301dabc3ca2 Ivan Hu 2016-08-25  359  
ff6301dabc3ca2 Ivan Hu 2016-08-25  360  	if (getwakeuptime.enabled && put_user(enabled,
ff6301dabc3ca2 Ivan Hu 2016-08-25  361  						getwakeuptime.enabled))
ff6301dabc3ca2 Ivan Hu 2016-08-25  362  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  363  
3dcb524d785373 Ivan Hu 2025-03-31 @364  	if (getwakeuptime.pending && put_user(pending,
3dcb524d785373 Ivan Hu 2025-03-31  365  						getwakeuptime.pending))
3dcb524d785373 Ivan Hu 2025-03-31  366  		return -EFAULT;
3dcb524d785373 Ivan Hu 2025-03-31  367  
ff6301dabc3ca2 Ivan Hu 2016-08-25  368  	if (getwakeuptime.time) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  369  		if (copy_to_user(getwakeuptime.time, &efi_time,
ff6301dabc3ca2 Ivan Hu 2016-08-25  370  				sizeof(efi_time_t)))
ff6301dabc3ca2 Ivan Hu 2016-08-25  371  			return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  372  	}
ff6301dabc3ca2 Ivan Hu 2016-08-25  373  
ff6301dabc3ca2 Ivan Hu 2016-08-25  374  	return 0;
ff6301dabc3ca2 Ivan Hu 2016-08-25  375  }
ff6301dabc3ca2 Ivan Hu 2016-08-25  376  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
