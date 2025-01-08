Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C70200106
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jan 2025 17:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736357997; cv=none; b=DfteYs+1D3uL2463DZlsIdE5Eu9ObNQR2RZUIDrWWLTpdGRmuFdLy16i8kMQMPf1FuGJ22a850XXHU/xwClUe64Jjv7pdiBURby4qhi/++SHJktj+P0AdrjTqmDuGK0Twisvme68S1csma55BP4j/8imCcHYMg78M/6JSeJNNu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736357997; c=relaxed/simple;
	bh=Bu4uk13iGE3/ijT8BCHNDBysDC1xl93eA9PO1wWTAmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U0UrAw1wRS+BSiEDIMQ+ALxyVA5sB0FgmK5xkH2xMA8LE4vQUIVsT9FYvm/Tbngpt8SzmIbpbLpvhuwQ3Uk1NFPobDrGPEHIKzO1RXKdiiEn+MwxI6pVptxwovEMz6+nAF0m0N4skFvjUPToIv/5mCOmtw3by79iL+V2Z6rQAaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlRn6b2+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlRn6b2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736357995; x=1767893995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bu4uk13iGE3/ijT8BCHNDBysDC1xl93eA9PO1wWTAmU=;
  b=IlRn6b2+JHUEjh+XKPnaldGXgU5OKgj9o//QClYxin3Q5IgO9d/lD+BM
   N7V3pwH79Om8g1RRxbmSPWHCA8B4zRHHyvVeEMDjc+42iHnrdbFERBF2b
   +GIy1X+kxaOzuT4diLEVvCCh5BBGZS7L3WZbOxKxnR0ZRdb+LeWzXE7Kq
   CsUUjiKfhuu3jn5/geLDdV9p2RYhzOKSezysDhsEuF+bCmVMF9cNg9DJe
   EIwHuUAtG6wHyGj7pCRpUyFhW4femodBHK1wv6hKxB0IfrYpzS8gIg4wy
   XVyFayvD3andBg54BxgZETCq80WktFXw7gIa/XbR5OA2RcJKndBndEyVm
   Q==;
X-CSE-ConnectionGUID: mbI8ex9yTPmlorqXux3Q8A==
X-CSE-MsgGUID: YG6vNFTjR1a4BhEqhKZZkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36758571"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36758571"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 09:39:54 -0800
X-CSE-ConnectionGUID: 48tZLdaiRba/pSMgyQ7GeA==
X-CSE-MsgGUID: ez1RzkKIRIWGdBhzdfQRrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134048261"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jan 2025 09:39:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVa23-000GSN-1U;
	Wed, 08 Jan 2025 17:39:51 +0000
Date: Thu, 9 Jan 2025 01:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 84/191]
 arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/i2c@23501c000/codec@4b:
 failed to match any schema with compatible: ['cirrus,cs42l84']
Message-ID: <202501090157.ueaCbtYM-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   3579121c157a4c56e00b67dbb6eb45d963046590
commit: f9f7b9ccc9c6706af68258c70981b159d6167771 [84/191] arm64: dts: apple: Add devicetree for Macbook Air (15-inch, M2, 2023)
:::::: branch date: 3 days ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-051-20250106 (https://download.01.org/0day-ci/archive/20250109/202501090157.ueaCbtYM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090157.ueaCbtYM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501090157.ueaCbtYM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3c: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/i2c@23501c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3d: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/i2c@23501c000/codec@3d: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/i2c@23501c000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d0d9300/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d0d9300/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: efuse@23d2c8000: compatible:0: 'apple,t8112-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: efuse@23d2c8000: Unevaluated properties are not allowed ('compatible', 'efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
