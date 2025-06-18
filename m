Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2ED1DE4E5
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 13:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750255082; cv=none; b=KWDuDqFPCXXjc6vkskTI3h5byJ7qlJxtTx7c3d+DoqKzVP7cDBfGQ+AXwg8B9UY2r6osacdTDDSkHtiIQ7XHD0Kusc9rjJy65tEVEDX7LiIAkAi7qJffkShkj/RfLZ/C5ozLJ8lFbD0IGk57TIMAK5WoYw8PxjlL4WBDERGZyeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750255082; c=relaxed/simple;
	bh=vwTORYAMTDI1mdLbEiER9uGf2+ifHHuDcpVL1283a4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sCmHoNGpCA3LP2HHSZYmNUFG7TFwkAIifPhEz5hVMuWbEJDROLeySQk+Kke7sWsVeTaCTe7s/outPX54tqvl7XUauHTzM3S95hOIkMQyBC0Sca50NK0sPpiLEEKpdHns9f81anjDn1S/Noyn3uRqzMqTtdctGSzQWlCJSmEQyqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EmkKC6bU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmkKC6bU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750255079; x=1781791079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vwTORYAMTDI1mdLbEiER9uGf2+ifHHuDcpVL1283a4U=;
  b=EmkKC6bUZfO2Q48PBpEj1NN3jThlkb9tq12aGPq3OkXVnLz6X9NMagd9
   /uTgqMlfG6kmERBhffB5ZlTjQFpPgaR0pyS7YIFHpFoTphMroh0twEe8s
   S3WVFpvHByQqbXWtCjGI9Y9mNDCHuwPI9212SBopgSGvEh7MepVt8Xg4H
   TVSuBiH4A74tUwROPYvMq0tDE7PRL7V5cZtTiBqy+qRv7F5vyoKSvAtN3
   1KiWsB7cYUADolz66hCMH4/KiFbTAsoE9RkzuM+tkm9S31HKvIJWJU2qY
   dmkXorCt9DTI9Apma9zHSezRfMLevX7q8FkajP2nefOq0qyQf7BLF+A1B
   Q==;
X-CSE-ConnectionGUID: Qfka0/l8TMmDplAS2xWnAw==
X-CSE-MsgGUID: Hi+N/Fb/RX6Cc+UNT2zxSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52174622"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52174622"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 06:56:51 -0700
X-CSE-ConnectionGUID: JeiFPHdITO6W5iOLpFUdNw==
X-CSE-MsgGUID: 67XEZ9SsTpmR1ccZhDGrfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="173171729"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jun 2025 06:56:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRtHT-000JqW-2D;
	Wed, 18 Jun 2025 13:56:47 +0000
Date: Wed, 18 Jun 2025 21:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:iommu_pt_vtd 22/42]
 drivers/iommu/generic_pt/fmt/../pt_defs.h:203 pt_feature() warn: bitwise AND
 condition is false here
Message-ID: <202506182154.IDWMw4Rq-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   4245120afe2501de333527c4d900356914995527
commit: ce2d1e767e63032ccc921b5e133faec1d110c9d0 [22/42] iommupt: Add the x86 64 bit page table format
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250618 (https://download.01.org/0day-ci/archive/20250618/202506182154.IDWMw4Rq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506182154.IDWMw4Rq-lkp@intel.com/

smatch warnings:
drivers/iommu/generic_pt/fmt/../pt_defs.h:203 pt_feature() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:153 pt_iommu_x86_64_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:290 x86_64_set_dirty() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:653 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:653 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:612 increase_top() warn: missing unwind goto?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:738 pt_iommu_x86_64_map_pages() warn: impossible condition '(paddr > 18446744073709551615) => (0-u64max > u64max)'
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1003 pt_init_common() warn: bitwise AND condition is false here

vim +203 drivers/iommu/generic_pt/fmt/../pt_defs.h

aca014a8319ea4 Jason Gunthorpe 2024-06-28  199  
aca014a8319ea4 Jason Gunthorpe 2024-06-28  200  static inline bool pt_feature(const struct pt_common *common,
aca014a8319ea4 Jason Gunthorpe 2024-06-28  201  			      unsigned int feature_nr)
aca014a8319ea4 Jason Gunthorpe 2024-06-28  202  {
aca014a8319ea4 Jason Gunthorpe 2024-06-28 @203  	if (PT_FORCE_ENABLED_FEATURES & BIT(feature_nr))
aca014a8319ea4 Jason Gunthorpe 2024-06-28  204  		return true;
aca014a8319ea4 Jason Gunthorpe 2024-06-28  205  	if (!PT_SUPPORTED_FEATURE(feature_nr))
aca014a8319ea4 Jason Gunthorpe 2024-06-28  206  		return false;
aca014a8319ea4 Jason Gunthorpe 2024-06-28  207  	return common->features & BIT(feature_nr);
aca014a8319ea4 Jason Gunthorpe 2024-06-28  208  }
aca014a8319ea4 Jason Gunthorpe 2024-06-28  209  

:::::: The code at line 203 was first introduced by commit
:::::: aca014a8319ea4f628b410e382f8089230f5bb8c genpt: Generic Page Table base API

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
