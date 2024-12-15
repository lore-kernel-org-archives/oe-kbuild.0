Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F641C27
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Dec 2024 00:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734222223; cv=none; b=Smgodg8uBBI7P5Y0MFHqcezHmtpxDtONrxpnyKj740bwAFHY7tjlk7fwNCi9qMxMZ2xOQfwnnzfHjRPVJrOEabVf9heWbCFz9SWuK3Sy7U8917KZlM4VcMLa2/oONUeF1hMeoYORY1dLstLz7fwTsWHkrGoc1b2VMrxkQG0GXNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734222223; c=relaxed/simple;
	bh=2yw/vY82hyZBHzyrf9/5Vlmznv0noqdERapMHfNZoRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FluvSpHjGzsSUAbV+PMs2iKsdvs024+VcCUArs+9GxF87OQShq44zNgKFaKkw6feKyzP+bH4+owQNM+1KuRUNxerCQZAc9bfsvnRsy8BR8ftD210jUdY5bBe4pmBufObxY1QvHTvAWHo0b6QGUdOgLXjv8ZN2y2WXtiFg3EhdlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9E7pZLE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9E7pZLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734222221; x=1765758221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2yw/vY82hyZBHzyrf9/5Vlmznv0noqdERapMHfNZoRI=;
  b=f9E7pZLExyYBTZRhNWjxkT6izwRzmmciWJSSD69ilMnMHChd5jxnhC6l
   fcPje56wuR8tENglFQwm77pg7KHDCxX2+rxNB5ow89+dpNAf1s0FWgLup
   u11tsT7ZwZg+IiIhOy8XQ+4+YDBgCVtRpL/JSUY5MW33dRIVNxxDgkOWf
   qc3e8ykpXSWmw7FTyZIRD2Qwnu8L3QTfifS6sqzWpK1er+5OzYFyTkenD
   6pnhIUqcc/GQCJZ97eWZOHHJ/CjMQuPfrAQe7bijaRZQPrUiUx6AJiJyJ
   AmwH5ccNO2fPbijyKyjib0GZhzYHQCS53dxjKs9Gp2FTzUvo3EYTvnpmA
   A==;
X-CSE-ConnectionGUID: aA9qwUy8S8eKvKZNwJ5oeA==
X-CSE-MsgGUID: X5BHlRmOS9y/0djzwihzXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38574416"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38574416"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 16:23:40 -0800
X-CSE-ConnectionGUID: a8wKSjg/RhWCOCrq3i8Pqw==
X-CSE-MsgGUID: 8VO6g6RYSL2C36s+60sGCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101832297"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Dec 2024 16:23:40 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMcQ4-000DLC-2O;
	Sun, 15 Dec 2024 00:23:36 +0000
Date: Sun, 15 Dec 2024 08:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/libstub/x86-stub.c:276 apple_set_os() error:
 uninitialized symbol 'set_os'.
Message-ID: <202412150802.sMw7PhGG-lkp@intel.com>
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
TO: Aditya Garg <gargaditya08@live.com>
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Lukas Wunner <lukas@wunner.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a0e3919a2df29b373b19a8fbd6e4c4c38fc10d87
commit: 71e49eccdca6328eecc335ed8f5557bd0ed70fc6 x86/efistub: Call Apple set_os protocol on dual GPU Intel Macs
date:   5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-r073-20241208 (https://download.01.org/0day-ci/archive/20241215/202412150802.sMw7PhGG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412150802.sMw7PhGG-lkp@intel.com/

New smatch warnings:
drivers/firmware/efi/libstub/x86-stub.c:276 apple_set_os() error: uninitialized symbol 'set_os'.

Old smatch warnings:
drivers/firmware/efi/libstub/x86-stub.c:190 retrieve_apple_device_properties() error: uninitialized symbol 'p'.
drivers/firmware/efi/libstub/x86-stub.c:190 retrieve_apple_device_properties() error: uninitialized symbol 'p'.
drivers/firmware/efi/libstub/x86-stub.c:208 retrieve_apple_device_properties() error: uninitialized symbol 'new'.
drivers/firmware/efi/libstub/x86-stub.c:208 retrieve_apple_device_properties() error: uninitialized symbol 'new'.

vim +/set_os +276 drivers/firmware/efi/libstub/x86-stub.c

71e49eccdca6328 Aditya Garg 2024-06-30  258  
71e49eccdca6328 Aditya Garg 2024-06-30  259  static void apple_set_os(void)
71e49eccdca6328 Aditya Garg 2024-06-30  260  {
71e49eccdca6328 Aditya Garg 2024-06-30  261  	struct {
71e49eccdca6328 Aditya Garg 2024-06-30  262  		unsigned long version;
71e49eccdca6328 Aditya Garg 2024-06-30  263  		efi_status_t (__efiapi *set_os_version)(const char *);
71e49eccdca6328 Aditya Garg 2024-06-30  264  		efi_status_t (__efiapi *set_os_vendor)(const char *);
71e49eccdca6328 Aditya Garg 2024-06-30  265  	} *set_os;
71e49eccdca6328 Aditya Garg 2024-06-30  266  	efi_status_t status;
71e49eccdca6328 Aditya Garg 2024-06-30  267  
71e49eccdca6328 Aditya Garg 2024-06-30  268  	if (!efi_is_64bit() || !apple_match_product_name())
71e49eccdca6328 Aditya Garg 2024-06-30  269  		return;
71e49eccdca6328 Aditya Garg 2024-06-30  270  
71e49eccdca6328 Aditya Garg 2024-06-30  271  	status = efi_bs_call(locate_protocol, &APPLE_SET_OS_PROTOCOL_GUID, NULL,
71e49eccdca6328 Aditya Garg 2024-06-30  272  			     (void **)&set_os);
71e49eccdca6328 Aditya Garg 2024-06-30  273  	if (status != EFI_SUCCESS)
71e49eccdca6328 Aditya Garg 2024-06-30  274  		return;
71e49eccdca6328 Aditya Garg 2024-06-30  275  
71e49eccdca6328 Aditya Garg 2024-06-30 @276  	if (set_os->version >= 2) {
71e49eccdca6328 Aditya Garg 2024-06-30  277  		status = set_os->set_os_vendor("Apple Inc.");
71e49eccdca6328 Aditya Garg 2024-06-30  278  		if (status != EFI_SUCCESS)
71e49eccdca6328 Aditya Garg 2024-06-30  279  			efi_err("Failed to set OS vendor via apple_set_os\n");
71e49eccdca6328 Aditya Garg 2024-06-30  280  	}
71e49eccdca6328 Aditya Garg 2024-06-30  281  
71e49eccdca6328 Aditya Garg 2024-06-30  282  	if (set_os->version > 0) {
71e49eccdca6328 Aditya Garg 2024-06-30  283  		/* The version being set doesn't seem to matter */
71e49eccdca6328 Aditya Garg 2024-06-30  284  		status = set_os->set_os_version("Mac OS X 10.9");
71e49eccdca6328 Aditya Garg 2024-06-30  285  		if (status != EFI_SUCCESS)
71e49eccdca6328 Aditya Garg 2024-06-30  286  			efi_err("Failed to set OS version via apple_set_os\n");
71e49eccdca6328 Aditya Garg 2024-06-30  287  	}
71e49eccdca6328 Aditya Garg 2024-06-30  288  }
71e49eccdca6328 Aditya Garg 2024-06-30  289  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
