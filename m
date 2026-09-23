Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4F9334C1C
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 23:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207457; cv=none; b=YYy1IIyNZqORJNd/WdtHvDzOviUt/Sbplw9xAk9W8AFag+/Y3I1TNEyvWyBZuDdkCSKj8HnDBW/hrXml7W+HXgU2ai5+/ADP5kFjDOBaMxkW2+vnnnZ4L0RjevEudcwApDbVN/3uHxsyRhyGiwtKcMWV2A8m4zvDIy+jOdeDP/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207457; c=relaxed/simple;
	bh=I7+iFF/V80YJgf77d0fXitkCpr+QRxw+StJLbdXWwqM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sMuGjSiCOSq2k5fVzYlpZYoQ4Aie++l9bsOaAuixxv20+6IbAgLs7fvebYvmho45WavvlJtJUfxhvwNwgy8WqmwIhlofkmNbNqHa/hrXJW0N6BkoswKij9+VFtrpWK+x8YHa4UBo42ZsbxPmzHE/Z7PaeZIVW6dhqP+8sssZMKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctgf0YEF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctgf0YEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790207455; x=1821743455;
  h=date:from:to:cc:subject:message-id;
  bh=I7+iFF/V80YJgf77d0fXitkCpr+QRxw+StJLbdXWwqM=;
  b=ctgf0YEFPDVhxvFKTI7NnLKefYHlu7cl0b/D2oa9m7+cY3boQQGpyR4E
   ICP9zruAsFWqW/yx8gg0NteX73CF5ON2w0NSGcIeq9EHL9FhRA4L8t2aK
   xlAvTHmfd353/R6Eh1Vgd7mwZXrfz7/WLtatxq17STDHOEe4XcMffUVeY
   5HBM4b/y2rv4KK4Zr/Cs4uaE3zVs5rLzWhB+F/6E2wwmjEGq6ovFymwu8
   bS18q98pLKjikx1toMK5kkiEHVSCR8XgV1mE7u+fEW11Hv/E/pUMrxJpt
   Gi8MK1xmsnD8xpm6lYfXzM2ZDz7o6YGhfQD00x3/oOaOddRjWIN7QHbPU
   w==;
X-CSE-ConnectionGUID: 3joUIfXYT2iKt6HI7Jsm/g==
X-CSE-MsgGUID: zIoij7GeTumYsNNl7GRcVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90978888"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="90978888"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 16:50:54 -0700
X-CSE-ConnectionGUID: DsiAnncuSAS/GxnujkKsLA==
X-CSE-MsgGUID: 0oCEfklHTfuS4R7PzhbYzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4951324"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 16:50:54 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Wjj-00000000Hy6-1HIg;
	Wed, 23 Sep 2026 23:50:51 +0000
Date: Thu, 24 Sep 2026 07:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/acpi/loongarch/iovt.c:274:5: error: redefinition of
 'iovt_iommu_configure_id'
Message-ID: <202609240721.IbsAVLuO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Bibo-Mao/ACPICA-actbl2-h-Add-bit-constants-of-the-Flags-field-in-the-IOVT-IOMMU-structure/20260922-201055, commit: 9659bdd0486bab092f117797485c1d4ab3b8be34"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Bibo Mao <maobibo@loongson.cn>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bibo-Mao/ACPICA-actbl2-h-Add-bit-constants-of-the-Flags-field-in-the-IOVT-IOMMU-structure/20260922-201055
head:   bb256436c3e08fd567947bf99b4ca3703f9f7523
commit: 9659bdd0486bab092f117797485c1d4ab3b8be34 ACPI: scan: Add support for LoongArch in acpi_iommu_configure_id()
date:   33 hours ago
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260924/202609240721.IbsAVLuO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240721.IbsAVLuO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609240721.IbsAVLuO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/loongarch/iovt.c:274:5: error: redefinition of 'iovt_iommu_configure_id'
     274 | int iovt_iommu_configure_id(struct device *dev, const u32 *id_in)
         |     ^
   include/linux/acpi_iovt.h:9:19: note: previous definition is here
       9 | static inline int iovt_iommu_configure_id(struct device *dev, const u32 *id_in)
         |                   ^
   1 error generated.


vim +/iovt_iommu_configure_id +274 drivers/acpi/loongarch/iovt.c

9659bdd0486bab0 Bibo Mao 2026-09-22  265  
9659bdd0486bab0 Bibo Mao 2026-09-22  266  /*
9659bdd0486bab0 Bibo Mao 2026-09-22  267   * iovt_iommu_configure_id - Set-up IOMMU configuration for a device.
9659bdd0486bab0 Bibo Mao 2026-09-22  268   *
9659bdd0486bab0 Bibo Mao 2026-09-22  269   * @dev: device to configure
9659bdd0486bab0 Bibo Mao 2026-09-22  270   * @id_in: optional input id const value pointer
9659bdd0486bab0 Bibo Mao 2026-09-22  271   *
9659bdd0486bab0 Bibo Mao 2026-09-22  272   * Returns: 0 on success, <0 on failure
9659bdd0486bab0 Bibo Mao 2026-09-22  273   */
9659bdd0486bab0 Bibo Mao 2026-09-22 @274  int iovt_iommu_configure_id(struct device *dev, const u32 *id_in)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
