Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8A510F1
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jan 2025 16:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736614463; cv=none; b=spy48ILrh/yUevQThbwtwEZPZ7ORArt8Z4Dd3MI/P2Xk1d4U/VcaRFpssjFBBTDeGdQ05npXoO4LoMIEDhsljMQJrrJDOqEu0DBDRop2ToZZ/M7YNGVzgPQIwSM4PBksTckNdbHUnhNvaErIIKTT6AVZKSoKlIXHvda4KhIUkZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736614463; c=relaxed/simple;
	bh=eKfKHAUSrEBREswIigy4Zl5CcilOZ6RbPAdrDUf6mw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DwVyIICKoW8Kj9y+dXWX6nva/Dz1Ry/S4m/mb/23s2tW8FQD8i+7nxNvREjeX666JLcq76313kltNCW8VCgXdyHkNeAxDnX8cCfwiesWwCHPbdVzzbs+ZHCyn4bZltPOCCC4cpQDWou9zO86dWJ71YXfGLlURzT4BahzHguj0JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mCrsZXMf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mCrsZXMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736614461; x=1768150461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eKfKHAUSrEBREswIigy4Zl5CcilOZ6RbPAdrDUf6mw8=;
  b=mCrsZXMfnl3R8qJlAOgtUfyWi/fNp52QbQgA9Wjdi+KFkb8b0kODHXUL
   V5N8VWP0LB0a+RyccRtldjtcD24jzmWVc0g992uasqIkcyxEIsVNiwrEG
   oWPyB10tFMQdrX0ktJb1vFvPXr+yBnWZXTvPTivwkxXHTr55HLv9eMqpp
   H2huPGQDHyRyPtfKoRAiC/EUPsGDDuBxO/kXptUaK0x0SuzrQErNU8bam
   7d8YpFNYGwS34SVDkcYO4knNlfETwXOw6yrHnxHjPTxuNwOEk/6rR+E+U
   a678hlrIE34Hj3/m/2/MqZu7Z5Cuuq1uRqGAH7bzZG7IlgoNUBtJ7CZOs
   g==;
X-CSE-ConnectionGUID: ogo0DqxRRr2jaCf7YWTtWg==
X-CSE-MsgGUID: gOJAu5iTRiCwEq/pmiXNYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="37121847"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="37121847"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 08:54:18 -0800
X-CSE-ConnectionGUID: n3pUTbZRQ3CvcTOkYMR0mg==
X-CSE-MsgGUID: 7qkr5FQ3RlixxVmARZuqXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="134845342"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jan 2025 08:54:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWekY-000L0T-1U;
	Sat, 11 Jan 2025 16:54:14 +0000
Date: Sun, 12 Jan 2025 00:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [xilinx-xlnx:lkp_test 298/504] drivers/fpga/fpga-mgr.c:692:8-16:
 WARNING: please use sysfs_emit or sysfs_emit_at
Message-ID: <202501120054.h1T4BTDV-lkp@intel.com>
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
CC: git@amd.com
TO: Nava kishore Manne <nava.manne@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 389613c7cb702ddd4c935ad4e2a391cb6c0e5b94 [298/504] fpga: mgr: Add Xilinx ZynqMP Encrypted Bitstream loading support
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: m68k-randconfig-r064-20250111 (https://download.01.org/0day-ci/archive/20250112/202501120054.h1T4BTDV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501120054.h1T4BTDV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/fpga/fpga-mgr.c:692:8-16: WARNING: please use sysfs_emit or sysfs_emit_at

vim +692 drivers/fpga/fpga-mgr.c

514f457c746f21 Michal Simek       2023-12-08  686  
389613c7cb702d Nava kishore Manne 2023-12-08  687  static ssize_t key_show(struct device *dev,
389613c7cb702d Nava kishore Manne 2023-12-08  688  			struct device_attribute *attr, char *buf)
389613c7cb702d Nava kishore Manne 2023-12-08  689  {
389613c7cb702d Nava kishore Manne 2023-12-08  690  	struct fpga_manager *mgr = to_fpga_manager(dev);
389613c7cb702d Nava kishore Manne 2023-12-08  691  
389613c7cb702d Nava kishore Manne 2023-12-08 @692  	return snprintf(buf, ENCRYPTED_KEY_LEN + 1, "%s\n", mgr->key);
389613c7cb702d Nava kishore Manne 2023-12-08  693  }
389613c7cb702d Nava kishore Manne 2023-12-08  694  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
