Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D397F19F104
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Nov 2024 18:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732903784; cv=none; b=deJBCyJUMdZqrmiLDoPrBp77qrUyS+xobgOwr5mJdjfVJ/6gLPZjFrSwgpZKY6PpjJo6T6mLfMk8OcTTqgprKgiWrBIjl/Qilfy6g3r4HiH84pX3zC3vkR+Vwj8QZzdqJVz6usgT4UW8+ryFMWBGqUypDxMg2JnEDGq7+vrlfQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732903784; c=relaxed/simple;
	bh=aRsWTpqzbVIzIo1vsuU9O24XvINCCW+a6ivp6Rbn5qs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O0iB4EGEde2NbXI76AT1abwYK+Wy4P27jaNK6ZqN2uwNzaAL9lGr8Fk+8E8K6tKEYGFv12phQ/bnwfb5gOsm1CDwn/p45ZLXIDQlp5xss/FidWLgp4TrfYA4/iCRUW011MRa+NQ2OcsNNpDsShUA2hJD7u9hinz+mQqCb9Bhgmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ihYr1ERG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihYr1ERG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732903782; x=1764439782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aRsWTpqzbVIzIo1vsuU9O24XvINCCW+a6ivp6Rbn5qs=;
  b=ihYr1ERGTvMpRXM+un23papBrMieAghgqsv/AiUSLQSIs9OTbK6u9Xu9
   p9WP1xwI/C8jjB6UJ14t41AAxNc83aQ6MjoLhFfTE9wYNDg0si7o674UT
   nElSimMzxzhiuSEneUb5DzXq70wd34vs91lFzU7pvhvgTY0+MBu3yMmRx
   6opU62Nm1hX2hj7TiF12m5naIxf8jacwpQ1iLW5WG4hACvFqqfV9uo2al
   1xJEvaXf9jCDVpa4q1sffg6DINrWCEFRC9khlgQ9eHP8rP+EDsLFE9Fx6
   QiHnE3rw2K6Hp1htNPy5ace5/WtwHj7eygL9oYO5HiW7iEPGnOw+scsQD
   A==;
X-CSE-ConnectionGUID: 2jTJJZG+Rlm2dTSEPFeQHQ==
X-CSE-MsgGUID: NRmiwq6MTX2Z2qdfKDaukQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33296591"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="33296591"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 10:09:40 -0800
X-CSE-ConnectionGUID: 6mrQMyujTz6s+ihi6QbIUg==
X-CSE-MsgGUID: 2P64G1VZRmSYRQqCjuC4DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="92420745"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Nov 2024 10:09:38 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH5Qt-0000bZ-2X;
	Fri, 29 Nov 2024 18:09:35 +0000
Date: Sat, 30 Nov 2024 02:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-6.6 1562/1562] arch/loongarch/kernel/efi.c:220:5-11:
 WARNING: Unsigned expression compared with zero: status < 0
Message-ID: <202411300209.pfS7Frtb-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Hongchen Zhang <zhanghongchen@loongson.cn>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   429a19874eb589d27346ba7363fa091d7e4ff99a
commit: 221e2e8bdbb851a519df0bac5a44298dae2b4612 [1562/1562] LoongArch: add kernel setvirtmap for runtime
:::::: branch date: 8 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r064-20241129 (https://download.01.org/0day-ci/archive/20241130/202411300209.pfS7Frtb-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411300209.pfS7Frtb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/efi.c:220:5-11: WARNING: Unsigned expression compared with zero: status < 0

vim +220 arch/loongarch/kernel/efi.c

221e2e8bdbb851 liuyun      2023-12-02  206  
628c3bb40e9a8c Huacai Chen 2022-05-31  207  void __init efi_runtime_init(void)
628c3bb40e9a8c Huacai Chen 2022-05-31  208  {
221e2e8bdbb851 liuyun      2023-12-02  209  	efi_status_t status;
221e2e8bdbb851 liuyun      2023-12-02  210  
88d4d957edc707 Binbin Zhou 2022-12-10  211  	if (!efi_enabled(EFI_BOOT) || !efi_systab->runtime)
628c3bb40e9a8c Huacai Chen 2022-05-31  212  		return;
628c3bb40e9a8c Huacai Chen 2022-05-31  213  
628c3bb40e9a8c Huacai Chen 2022-05-31  214  	if (efi_runtime_disabled()) {
628c3bb40e9a8c Huacai Chen 2022-05-31  215  		pr_info("EFI runtime services will be disabled.\n");
628c3bb40e9a8c Huacai Chen 2022-05-31  216  		return;
628c3bb40e9a8c Huacai Chen 2022-05-31  217  	}
628c3bb40e9a8c Huacai Chen 2022-05-31  218  
221e2e8bdbb851 liuyun      2023-12-02  219  	status = set_virtual_map();
221e2e8bdbb851 liuyun      2023-12-02 @220  	if (status < 0)
221e2e8bdbb851 liuyun      2023-12-02  221  		return;
221e2e8bdbb851 liuyun      2023-12-02  222  
221e2e8bdbb851 liuyun      2023-12-02  223  	efi.runtime = READ_ONCE(efi_systab->runtime);
628c3bb40e9a8c Huacai Chen 2022-05-31  224  	efi.runtime_version = (unsigned int)efi.runtime->hdr.revision;
628c3bb40e9a8c Huacai Chen 2022-05-31  225  
628c3bb40e9a8c Huacai Chen 2022-05-31  226  	efi_native_runtime_setup();
628c3bb40e9a8c Huacai Chen 2022-05-31  227  	set_bit(EFI_RUNTIME_SERVICES, &efi.flags);
628c3bb40e9a8c Huacai Chen 2022-05-31  228  }
628c3bb40e9a8c Huacai Chen 2022-05-31  229  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
