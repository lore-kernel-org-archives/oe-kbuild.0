Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFCC332629
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 05:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576128; cv=none; b=WBZimSDK/BkZlxrn876rtizIvRUCYDcZJ5jjUE/VbGdHa430HWBwxM0fEnK7ZW/+/MyQ4suL33HNNiCeHtk/Z9F/kH7Wk+FP+iEDdK8qACAJVmAyXNgq7RxvA/HuYADp/SZDVwXNvMtRJO+n4pHUQ/51hhwifMuh24FmpVNgiVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576128; c=relaxed/simple;
	bh=JgIEnSnAzUh1QqW9gCKjn0tNx0gp64m9P2PCSo4GPws=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FS2VVFe2Wl6e+T5w/Op410zyAbozNwTxu5aOnmQ7pTAB++iU5v7RjpeqDkTqevJyjKDoAl2I7eT9865RFjQkSiEKTajO5AVKN4mlvG++yJl0xnzAXBCDleN2LrebQ5XM3/Hk4DVsp8N4sGgn2zd8ein9z39kkf6bCEBVfx9JJKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0aFYrMx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0aFYrMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783576127; x=1815112127;
  h=date:from:to:cc:subject:message-id;
  bh=JgIEnSnAzUh1QqW9gCKjn0tNx0gp64m9P2PCSo4GPws=;
  b=n0aFYrMx/phDpewXvglz8l+UFVBM5kNLWJBpjLta4x2FEMFQOfsug+TA
   sDOmjDhf/8WBtdVQ42dpctmzsls22ejiXNg5WTfIgoWlTjsA1fPGIzCoa
   /znV1e+LvRf1ufDgLxxYeNm51oXJ32oXdRMDXW4Hp8WE57KIBeaM6qwyC
   Yl6ycD+AZ1zLNQ4D+hHEEvAL5gsnnZyk41Rqyo+d1PonaEKnjCgUX3GMa
   jYgbtCOpoYZvRr37ty2Xz9LJrohMmCIbTvNuX4rI31ubax7+rFnXWGEBk
   peJPXuyZmyMw2p3fEvsCQMMcGGTB/caWZXzllj3G4KsmwhwNqQWP11acv
   g==;
X-CSE-ConnectionGUID: D2WmujEzQzyEr15XavPV0w==
X-CSE-MsgGUID: YyP4buoBTcOJDeAZDhAToA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101675940"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101675940"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 22:48:46 -0700
X-CSE-ConnectionGUID: mEASeyllSJWGjUoPZLEeRg==
X-CSE-MsgGUID: 676E4yOjRIeKmd74fgnP+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="277711667"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jul 2026 22:48:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whhcn-00000000HJv-1y1f;
	Thu, 09 Jul 2026 05:48:41 +0000
Date: Thu, 09 Jul 2026 13:46:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.18/linux 1/1]
 drivers/media/platform/intel/ipu-acpi.c:73:25: sparse: sparse: unsigned value
 that used to be signed checked against zero?
Message-ID: <202607091328.hDhinvap-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/media/platform/intel/ipu-acpi.c:73:25: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: hepengpx <pengpengx.he@intel.com>
CC: "sys_oak" <sys_oak@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   5100e1c74efeba843945492f8d5840e6166c0392
commit: d1a4a0a2fedfc816e1f7db99c4858dfc0b8fd300 [1/1] media: pci: intel: support PDATA in Kconfig/Makefile
:::::: branch date: 10 days ago
:::::: commit date: 3 months ago
config: i386-randconfig-r123-20260708 (https://download.01.org/0day-ci/archive/20260709/202607091328.hDhinvap-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091328.hDhinvap-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607091328.hDhinvap-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/platform/intel/ipu-acpi.c:73:25: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/media/platform/intel/ipu-acpi.c:79:16: sparse: signed value source
--
>> drivers/media/platform/intel/ipu-acpi-pdata.c:36:30: sparse: sparse: symbol 'acpi_subdev_pdata' was not declared. Should it be static?
>> drivers/media/platform/intel/ipu-acpi-pdata.c:43:21: sparse: sparse: symbol 'serdes_info' was not declared. Should it be static?

vim +73 drivers/media/platform/intel/ipu-acpi.c

02f6fe497a2baa Shahidan, Muhammad Shahmil 2026-04-08  68  
02f6fe497a2baa Shahidan, Muhammad Shahmil 2026-04-08  69  static int get_table_index(const char *acpi_name)
02f6fe497a2baa Shahidan, Muhammad Shahmil 2026-04-08  70  {
02f6fe497a2baa Shahidan, Muhammad Shahmil 2026-04-08  71  	int i;
02f6fe497a2baa Shahidan, Muhammad Shahmil 2026-04-08  72  
02f6fe497a2baa Shahidan, Muhammad Shahmil 2026-04-08 @73  	for (i = 0; i < ARRAY_SIZE(supported_devices); i++) {
02f6fe497a2baa Shahidan, Muhammad Shahmil 2026-04-08  74  		if (!strncmp(supported_devices[i].hid_name, acpi_name,
02f6fe497a2baa Shahidan, Muhammad Shahmil 2026-04-08  75  			     strlen(supported_devices[i].hid_name)))
02f6fe497a2baa Shahidan, Muhammad Shahmil 2026-04-08  76  			return i;
02f6fe497a2baa Shahidan, Muhammad Shahmil 2026-04-08  77  	}
02f6fe497a2baa Shahidan, Muhammad Shahmil 2026-04-08  78  
02f6fe497a2baa Shahidan, Muhammad Shahmil 2026-04-08  79  	return -ENODEV;
02f6fe497a2baa Shahidan, Muhammad Shahmil 2026-04-08  80  }
02f6fe497a2baa Shahidan, Muhammad Shahmil 2026-04-08  81  

:::::: The code at line 73 was first introduced by commit
:::::: 02f6fe497a2baa45f229a6c4039418e423e8ece6 Add IPU ACPI drivers

:::::: TO: Shahidan, Muhammad Shahmil <muhammad.shahmil.shahidan@intel.com>
:::::: CC: sys_oak <sys_oak@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
