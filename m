Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F37188583
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Nov 2024 13:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732368169; cv=none; b=rJbOZ3Muen7HtpUknfTBO2Ss/lEeEpgTt/dpaavNtAOIKS+TLoIpOMmjM2jUlrG0qA6K6vKA9SxrpypYGA4NRWKOoIc1F4Jku+I6CaS3m1B1M5skQqs26h10meb7CxkEI2kB6pw0Oox7FO5Im1febqs4cdiBrpzcgm7VEmrfJz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732368169; c=relaxed/simple;
	bh=I8Wi5t78dgHxalfaG3xJjeqF8269sUL56oEyTqYo3hI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dz3pPfKCzi3GeiUx08Q6FKcfudqM9OuZldAUpvtUl21peHgyh5f9h7mnCIFdaCX2uOlrihv1Q5wmwUfBsD5xMKfldQmtvfPh7x5pSmGF8qSEW+feXF6yN57khqQ1aBsFZ2/y+JBvLJlB1fdvY+y4a8Hovxh07EYWuEjjBrZ4K6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCSGiC1n; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCSGiC1n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732368167; x=1763904167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8Wi5t78dgHxalfaG3xJjeqF8269sUL56oEyTqYo3hI=;
  b=UCSGiC1n2kqkcEr8ShQbcEJIaJGh3oi+8dPQdzuUSA42sRjUvpT2Dn8I
   sG8fLU7HL9CGXuhQjggKNR8XapTPsd5qXbjcKApebpFlBUkzT65gASLta
   WuH8FeergZ1nXg6yu4hAfsejStKadbBh1F4sahMz6ZlwsxZLSQ0uECgbZ
   ZKOs+9yr2OTlCRVuI8Ij5GlRYDQw7k2QyJrXN3Mf9lNmwoHvvdoL2tzIJ
   wpjlK6Xrlz1Ws2tvgXQmjVas38Xgq08+Y7FafB2Phh/XXfVQGfLh6MFJX
   ZM2mFpshiHZ16C2W1BvKPrfZvBgwGUl9/cCJLPlpa0k6VLAGjGVXPitEo
   g==;
X-CSE-ConnectionGUID: 4apNxwxHQIKLh++LoViGUQ==
X-CSE-MsgGUID: Fzh4JeIOTNuZC6C2kHpDqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="32381516"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="32381516"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 05:22:47 -0800
X-CSE-ConnectionGUID: 0pdt4xVKQAmAvh9JPMcbdQ==
X-CSE-MsgGUID: C4Xmxf6ZQy+pNkyBfgUZ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="91257002"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Nov 2024 05:22:46 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEq5z-0004dv-2z;
	Sat, 23 Nov 2024 13:22:43 +0000
Date: Sat, 23 Nov 2024 21:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 5/187]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to
 match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
Message-ID: <202411232155.lVgtLKD5-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   fc5046b01c4d686a823d497cd4abeaae227b62db
commit: 2f814d8cc992c2749d89d030ad9e71c747aa4e2d [5/187] arm64: dts: apple: t8112: Add SMC node to devicetree
:::::: branch date: 4 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20241118 (https://download.01.org/0day-ci/archive/20241123/202411232155.lVgtLKD5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411232155.lVgtLKD5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411232155.lVgtLKD5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112.dtsi:698.43-701.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: wifi@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
   arch/arm64/boot/dts/apple/t8112.dtsi:698.43-701.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:698.43-701.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: wifi@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
