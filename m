Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113EE1DE8A7
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 20:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733171830; cv=none; b=K505jKkenFaqD5AxVgZaT+6A26e96qbB0IaFoEjT7nqZxzTfIrsMGsVJeydwPeIls5i5I5Tqh0704E3GQIe0SdljCQSXy7wK8gcL0Qvdioe6uM6w+kAB4B88ZSuDPJ9HqOEBKzdnjSlO8bk/6L4YGRSEApySQ+fqt3wOAeVFdyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733171830; c=relaxed/simple;
	bh=Dcv+L45LthErr/6YB4ddcP7JsH67+VuNo0HlDx4FpVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cBLBGZeYWred6mU2CpqGXD5I/sWuSX6jZ2Fut8q1iN1wTvUM7KLFPa8AFbW3srtaMtEonA78Rszas1YY8xiRcCdeQgW/2tCk6WPNrekN1ES7BP7jHr4N0T4FHWcf/A7bqmUJzKkIrBV31qRk2xH67YsScw5viNG5Fin8nFkBX4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnLScrDq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnLScrDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733171828; x=1764707828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dcv+L45LthErr/6YB4ddcP7JsH67+VuNo0HlDx4FpVc=;
  b=ZnLScrDqTUtpx6D72nYt9BGg6XJnm7aFvB1yYQsgYK3Pf+lJZBXAGlBC
   4Z4/04IlvZobUBm2wKGv5yQM30xPvQpQsJVkjsYKXHV+hLtNzvXVxviKK
   14jx40Foli2Bjp/oaajYPtrJctEBKEV4YC+iYZY7ugmyQjV06CwDSdQfV
   AnVcZRfhHTfxdnK37HcyTfgn9eT1g1MUhnmc/tPW1l5EW0F2PKfB6EZiF
   ArnfKd976FyoEabEd6ogolcK/oIBlYQQxWybW0wUEKHHXK+wYsqhmCuMX
   haJ89XPQpOUjVEmUa07xnEqgXJkiD727UeFv2OsNvqGho3BwvASuyAZxU
   A==;
X-CSE-ConnectionGUID: vNjHVPcTTEWxaFMIiDW/qw==
X-CSE-MsgGUID: cMJoMJobRDKzyG/6V4I7VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33490973"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="33490973"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 12:37:07 -0800
X-CSE-ConnectionGUID: PLA1CfmUQgG5AsV78ZC8LQ==
X-CSE-MsgGUID: Bjr6/KSpQES2MFj67JwzAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93308142"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 02 Dec 2024 12:37:06 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tID9u-0002sG-2o;
	Mon, 02 Dec 2024 20:36:46 +0000
Date: Tue, 3 Dec 2024 04:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-6.6 1455/1455] arch/loongarch/kernel/efi.c:220:5-11:
 WARNING: Unsigned expression compared with zero: status < 0
Message-ID: <202412030419.eW5bmks2-lkp@intel.com>
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
head:   9809e40d1abbcdf278f3db91f03a94507bdbb442
commit: 221e2e8bdbb851a519df0bac5a44298dae2b4612 [1455/1455] LoongArch: add kernel setvirtmap for runtime
:::::: branch date: 12 hours ago
:::::: commit date: 1 year ago
config: loongarch-randconfig-r053-20241112 (https://download.01.org/0day-ci/archive/20241203/202412030419.eW5bmks2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412030419.eW5bmks2-lkp@intel.com/

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
