Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971C7190688
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 09:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736243062; cv=none; b=LCsHoU2WsTvECbAaKCqbb/AKXRYLzLRoyOWeiQFpkI8B93jeosIwyXSFqL0hzBiHwTnC+/L+Ax2QnNxohfuuyieKKl8raOjruDTejgvkjJzlGw6pUd2YKwRSyy0uRYqGLk6gIuyKT2+/dJpmaPM3PWoNFiCEswqzVOoM60tjUSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736243062; c=relaxed/simple;
	bh=7jj3iLRq/11nVKZt46xdflz0zBUc58aP6vquSH6j32Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WHjgIJ34P9CYNyk2SvmBouj61WL1F0GdHHjTrV8xH80kgiYp7ZGxGxniCQbffg7n+4k3gAFdJpMCovUPNMsUiM1tATTIvqL7q2bCSsKbHpN3smcXBcbhd/e0DRwlZAIyuBuVr20WWYSsYUBiilD/v8u80bbOfVSXbdqljSbH5Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAOtmvmS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAOtmvmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736243059; x=1767779059;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7jj3iLRq/11nVKZt46xdflz0zBUc58aP6vquSH6j32Q=;
  b=LAOtmvmSYj/DjFD6wJ1rp3XmuyOTjgngKvmiOA+4SWQcZfiKggRoldjG
   5wTZz6mn63RJ9Hjz9oNEJgTuv5fZEd5yheOOj4J8rH3HYzVcGpAdPgfES
   5qd7I10q/ygq/iU2N7Ncc7FXJvJWiMyiO/p19r1HSklF4IrWb6pcZcfAR
   qXdxBna0U6U3KdF70SXB4plOHxq4DRrGgUhHRTc2dbGnY/0ujAv2QPgZB
   l1+DpbFxVmV0Qz6RfvumOTCFhKrSze5NXMwXilRSPhKgRX2FchNUKm1hZ
   L8fnWsz92BlLuVcXbHjIfgQVDj+SjFU2bo++JheRJ37m/cHgKM6oayjeQ
   Q==;
X-CSE-ConnectionGUID: mcDpzrQWTpyPvU0tfrC2Xw==
X-CSE-MsgGUID: 0Q4/xJyVRIGnLqREd12JMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="58881756"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="58881756"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 01:44:19 -0800
X-CSE-ConnectionGUID: FLJSFBI+RyyP4S5GBrIH8g==
X-CSE-MsgGUID: kq1qTeWwShW5I61LH2VwBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133606373"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jan 2025 01:44:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV68F-000EVP-21;
	Tue, 07 Jan 2025 09:44:15 +0000
Date: Tue, 7 Jan 2025 17:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 10/191]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/i2c@23501c000/codec@4b:
 failed to match any schema with compatible: ['cirrus,cs42l84']
Message-ID: <202501071714.0FBQ6wld-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Martin Povišer" <povik+lin@cutebit.org>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   3579121c157a4c56e00b67dbb6eb45d963046590
commit: 2c404f1cd6dadd8a0e85d42f2c6e6b9ee223a8a4 [10/191] arm64: dts: apple: t8112*: Put in audio nodes
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-051-20250106 (https://download.01.org/0day-ci/archive/20250107/202501071714.0FBQ6wld-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071714.0FBQ6wld-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501071714.0FBQ6wld-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/i2c@23501c000/codec@3b: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/i2c@23501c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/i2c@23501c000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:686.28-762.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:726.43-729.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@38: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/i2c@235014000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/i2c@235014000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
--
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/i2c@23501c000/codec@3b: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/i2c@23501c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/i2c@23501c000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
