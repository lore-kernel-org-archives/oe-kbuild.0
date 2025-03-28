Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CD11AA1EC
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Mar 2025 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743154529; cv=none; b=Kom3zi89aVrhiRTbqmv4lZXNyL4D/w1tUl58Q87/8/g2DiB+tBEaTzQ9yinRJ0j875w6KZNHfNRg2oqEAjMvBgVsR3FleJvlsETBKHZBISjIbVB0WD7d37NhcR+cW8pNRfWcaJPsnIwSe0+lPqs9JLx2oCb8l0VXo3NozzvKGGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743154529; c=relaxed/simple;
	bh=mTijILJSl9EO8NO4VSvlvhXodFEH0Bi/UJBZyI9oSxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RkCUyQ6KXt7DPPiiDjlLeh4nOrCa51jHl4mppcLr6VeLeaQ0hKA8yLXb7cM3ZvAc4vsIGcydk8KwYziPPFd/fejd19AcH80Z7n1RGxj2iYqLdV9lw9I66acdTAQTdHZvvEFkrLkQIQjikZsShmVXHYR2uadOmpshSHHfyZoOK/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pkf2jdSV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pkf2jdSV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743154528; x=1774690528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mTijILJSl9EO8NO4VSvlvhXodFEH0Bi/UJBZyI9oSxg=;
  b=Pkf2jdSVRiiXnY30TgvkU4WNmtz/o6bly8rUqoxLuKUzxKB4aUWfJCvT
   t2hxj5x2IWb+rZQUWvyciDaAOPWDjm6sC4MUTs8zVcVvJuXa4mgxRxbq6
   zzQ7yWPzsroCQ89LipC2DOGNKovFRvkhwWP60ZbGCQxEOt8dLPFty+35T
   b4QpIyPWbn+nhLOUbTqHpRoQu4R8yxcUQA277EJC1AzeuDtoOubWDKTkL
   aot/ToGJmANK4kHbPdkTFph5WqRhwkaXBf2tuHTIOdiBqdBd24O6duAoI
   mW3ioseyh/NH7JhwUDXeEi2X6WU43f4RcL8f2q3jfbMZ2/8K845TIyvWz
   Q==;
X-CSE-ConnectionGUID: ilQm0UPnStifappfy4isEw==
X-CSE-MsgGUID: 0iybFWFJS/CUsUMkwZi/vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="32115014"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="32115014"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 02:35:27 -0700
X-CSE-ConnectionGUID: PM6byZgmROW5d/GznDRPiw==
X-CSE-MsgGUID: 8XpSARanQ5unZ1paCC+mqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="126212504"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Mar 2025 02:35:03 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty679-0007JI-0r;
	Fri, 28 Mar 2025 09:34:59 +0000
Date: Fri, 28 Mar 2025 17:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/bcmbca-peripherals-arm 13/14]
 arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: /:
 dma-controller@ff859000:reg:0: [4286943232, 4096] is too short
Message-ID: <202503281736.QfRSxFrM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/bcmbca-peripherals-arm
head:   80a24d5a52c1453c91f4424a44bfd717bdb76211
commit: 983eda6da7c29a7625f43e9934d519e20816464a [13/14] ARM64: dts: bcm6858: Add BCMBCA peripherals
:::::: branch date: 10 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-053-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281736.QfRSxFrM-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503281736.QfRSxFrM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503281736.QfRSxFrM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi:284.3-29: Warning (reg_format): /dma-controller@ff859000:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 2)
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: /: dma-controller@ff859000:reg:0: [4286943232, 4096] is too short
   	from schema $id: http://devicetree.org/schemas/reg.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
