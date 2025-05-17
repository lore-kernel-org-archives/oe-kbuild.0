Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660522147FB
	for <oe-kbuild@lists.linux.dev>; Sat, 17 May 2025 18:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747506549; cv=none; b=eCuWaK6qzHacVBuHzxhjFW9vACIb6U78dKCnfawqzBEZzePc319AdCpN2o36MFoJtnABUOG3g0OnpkRcUjahxWWVQhB0Lt5Nw8WDBx/PIJ4pixdvtGDWZn/AR6jw8Dj2C/YBcGvaZH+foffTCFfPpwXhODFpnvfsdG3d8scFMk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747506549; c=relaxed/simple;
	bh=cxJNrkSTfnBEgeIxIaHg58++DXK5HHKf2eLI5ktdSf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E28Gqwc7Su3WGxCmUE9fc7HnByeMNs512cAkVgqry+vtJZhRGWsyYY+ItSw9N5k7uXMEgkeRJZf4Th9BFe1wKF5qHK1BNciYZsft6ySuMzauSdjFCOpdmQEuy2KWTVER9WWs4lXFcX6DHEVnIYgbSIXKMdU3wxHTdZKBIoftGMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZIK8Yfe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZIK8Yfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747506547; x=1779042547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cxJNrkSTfnBEgeIxIaHg58++DXK5HHKf2eLI5ktdSf0=;
  b=nZIK8Yfe0XTeEJejCHt9V4TeiCRdfVbw4YmGmhn1G9scU1z/gBRwboZW
   59Az36nVaUmG+CP/Zr1YtMNEdbrMeI4WmEGbenkI/a/wXMa96cdK09A/+
   n7PpGzyF8S5utsvt93gTx8k4Vu70QJXG2LAyQ2aMWUcDMmFWBDvWUoc2d
   RBq1zrq55FFgFZIzsGWZG733AdGpfpKmlgxWrqs9rpwEQzuc34MUHDnOO
   +sJXSLVlxmAN974ruCi+nIzsQ8UEEYcV4eOeCC2jWSBXTPDP4PmgCCzwi
   yBipFRGffsMd7Go4y9+TH7iG8j0DXQXnY9jTn7xfiLOVquH/QVo0tpKve
   A==;
X-CSE-ConnectionGUID: TSFvIu6WQMmBddmMhfiGPA==
X-CSE-MsgGUID: 0iBJeN8aT1KV2bi2hbNJUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="53128794"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="53128794"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 11:29:07 -0700
X-CSE-ConnectionGUID: Cu4V4mz2RoybwRA2euS4RA==
X-CSE-MsgGUID: iX+joStsRwqbJANw8LyVkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="138889651"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 May 2025 11:29:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGMHP-000KL9-2n;
	Sat, 17 May 2025 18:29:03 +0000
Date: Sun, 18 May 2025 02:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [iommu:core 48/49] ERROR: modpost: "arm_smmu_make_bypass_ste"
 [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
Message-ID: <202505180231.YmCBcToL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Rolf Eike Beer <eb@emlix.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: Lu Baolu <baolu.lu@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git core
head:   5e2ff240b31a37226260587e33707efc3c41e451
commit: e436576b0231542f6f233279f0972989232575a8 [48/49] iommu: make inclusion of arm/arm-smmu-v3 directory conditional
:::::: branch date: 30 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-002-20250517 (https://download.01.org/0day-ci/archive/20250518/202505180231.YmCBcToL-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180231.YmCBcToL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505180231.YmCBcToL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
>> ERROR: modpost: "arm_smmu_make_bypass_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_make_abort_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_make_cdtable_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_make_s2_domain_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_make_s1_cd" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_make_sva_cd" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_write_entry" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_get_ste_used" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
>> ERROR: modpost: "arm_smmu_get_cd_used" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
