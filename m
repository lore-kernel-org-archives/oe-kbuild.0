Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F60615B115
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Dec 2024 19:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734549324; cv=none; b=CBMZl7G6L5R1lZ0nXhZGK9GjTWX3nXB/0pL6QknUO3hH0fcpJu8kzrKocxIkSoqMkD0nspS+VTEgrjnsscTA7ewWq9ljIDmLrziIhq8CwKKEAQxkIYBOKKeUi1BQpGJL1mRlD2rPzB24isiyN9FfzCAJD5tP0LaqGOPDettUs44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734549324; c=relaxed/simple;
	bh=DIPxearbpFv2nIuHSCd3Oole0If6DaGONg3FJbCCFNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DNzXuL2HDPXRY5BnP+Rg/UcBpMIuMaI9ydJEH7x5jhqoscdM87oo6N8vrQ403deM0IpUCVqaMCwhLVPnCCGDyeQPXMilLAagkWBnBaR726CQAkM4RAL53D36zcHL5N7xioBR7N5Bf5Q+SUgk8WVM4a9Jw+AcaYDguL2hpWGU4KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zm6A4oag; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zm6A4oag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734549321; x=1766085321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DIPxearbpFv2nIuHSCd3Oole0If6DaGONg3FJbCCFNQ=;
  b=Zm6A4oagwHDsZvI9PPN5JAJ2Rv94scCWkGGJR3D5LHgCfKt8OC+kHA9x
   bfhReNeNNnxQFpHN4NIuq4r5OqZSaTb/WpWSlfykRfnVHBjJ2jh2If4Tx
   CrvzIFgqY0ljwei0hQ4+o0QJntFWfMSI+ogQOhncabp/CBg8z5n3Ij5GM
   5BHh9BaiOHpnDpvWF8MtfkmvaCJTXyb5eBZ9YuJliikVRd9sQNS5nobI0
   agvv2a8uyWgIHaR/flO2lMSdJxPA88SGNb9HIk6YGlqsJBJF0PGV1RE40
   jNyrYrbMfjFdCpLqSuDB6lTnzuXd1qCRdXgADMMB1/rb64dIKlZmVwlS0
   Q==;
X-CSE-ConnectionGUID: z4on21OHRX2UCCmrMSPVEg==
X-CSE-MsgGUID: qXdE8UWgRsyq8NxRQ4h24Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="45535801"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="45535801"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 11:15:20 -0800
X-CSE-ConnectionGUID: n2Yshe6JQNa0e/FVOiDYDQ==
X-CSE-MsgGUID: brWyKb3cSESBB+CCYjPJfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97787727"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Dec 2024 11:15:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNzVs-000GZk-0V;
	Wed, 18 Dec 2024 19:15:16 +0000
Date: Thu, 19 Dec 2024 03:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: map_funcs.c:(.xiptext+0x107): dangerous relocation: windowed
 longcall crosses 1GB boundary; return may fail: memcpy_fromio
Message-ID: <202412190325.EK9uL1Hw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Julian Vetter <jvetter@kalrayinc.com>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Yann Sionneau <ysionneau@kalrayinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aef25be35d23ec768eed08bfcf7ca3cf9685bc28
commit: b660d0a2acb9053d627befbb259a397d26aa9582 New implementation for IO memcpy and IO memset
date:   7 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 7 weeks ago
config: xtensa-randconfig-r113-20241217 (https://download.01.org/0day-ci/archive/20241219/202412190325.EK9uL1Hw-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241219/202412190325.EK9uL1Hw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412190325.EK9uL1Hw-lkp@intel.com/

All errors (new ones prefixed by >>):

   cfi_cmdset_0001.c:(.xiptext+0x39e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x3b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b30)
   cfi_cmdset_0001.c:(.xiptext+0x3ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x3eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x413): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x438): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x441): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   cfi_cmdset_0001.c:(.xiptext+0x487): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x4aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x4cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfd4)
   cfi_cmdset_0001.c:(.xiptext+0x4d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_getlockstatus_oneblock':
   cfi_cmdset_0001.c:(.xiptext+0x517): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b30)
   cfi_cmdset_0001.c:(.xiptext+0x526): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x55f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_cmdset_0001.c:(.xiptext+0x578): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   cfi_cmdset_0001.c:(.xiptext+0x61e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0x62c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1488)
   cfi_cmdset_0001.c:(.xiptext+0x63a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x660): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b30)
   cfi_cmdset_0001.c:(.xiptext+0x66f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x686): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x69e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x6e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x706): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x710): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x736): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x757): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x76e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x788): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x79e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfd4)
   cfi_cmdset_0001.c:(.xiptext+0x7a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x7ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x7d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfd4)
   cfi_cmdset_0001.c:(.xiptext+0x7de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x7ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   cfi_cmdset_0001.c:(.xiptext+0x800): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x81c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_oneword':
   cfi_cmdset_0001.c:(.xiptext+0x8cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x8de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0x8ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1488)
   cfi_cmdset_0001.c:(.xiptext+0x8f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x91f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b30)
   cfi_cmdset_0001.c:(.xiptext+0x95e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x97c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x99e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x9ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x9c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfd4)
   cfi_cmdset_0001.c:(.xiptext+0x9cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x9db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   cfi_cmdset_0001.c:(.xiptext+0x9eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xa03): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   cfi_cmdset_0001.c:(.xiptext+0xb29): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xb3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0xb48): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1488)
   cfi_cmdset_0001.c:(.xiptext+0xb56): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0xb7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b30)
   cfi_cmdset_0001.c:(.xiptext+0xb90): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xbb6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xbf6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xc1f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xc3b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xc5e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xc94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b10)
   cfi_cmdset_0001.c:(.xiptext+0xcaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xce2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b10)
   cfi_cmdset_0001.c:(.xiptext+0xd00): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x30)
   cfi_cmdset_0001.c:(.xiptext+0xd66): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xd92): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xdb3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xdce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xdee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xdfe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xe16): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfd4)
   cfi_cmdset_0001.c:(.xiptext+0xe1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0xe2e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   cfi_cmdset_0001.c:(.xiptext+0xe3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xe56): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xe86): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xe90): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b30)
   cfi_cmdset_0001.c:(.xiptext+0xe9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xeb6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_otp_read':
   cfi_cmdset_0001.c:(.xiptext+0xf02): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0xf10): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1488)
   cfi_cmdset_0001.c:(.xiptext+0xf36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b30)
   cfi_cmdset_0001.c:(.xiptext+0xf4c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xf8c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfd4)
   cfi_cmdset_0001.c:(.xiptext+0xf94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/maps/map_funcs.o: in function `simple_map_write':
   map_funcs.c:(.xiptext+0x55): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   map_funcs.c:(.xiptext+0x5e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/maps/map_funcs.o: in function `simple_map_read':
   map_funcs.c:(.xiptext+0xc9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   map_funcs.c:(.xiptext+0xd2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/maps/map_funcs.o: in function `simple_map_copy_from':
   map_funcs.c:(.xiptext+0xfa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
>> map_funcs.c:(.xiptext+0x107): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_fromio
   drivers/mtd/maps/map_funcs.o: in function `simple_map_copy_to':
>> map_funcs.c:(.xiptext+0x127): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_toio

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
