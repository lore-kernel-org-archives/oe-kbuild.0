Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A0516C451
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720144; cv=none; b=nPay4fP26ntpWLZO5Bo0s6h68uiMw8NWwTwWACcJ7UmR36p8gLMaMeqK6LwvidhOJ9X094iRx5FL9p87c7MHrRZKdsBbr2KZRK53SAe/PWnDY1wtiFR8Fq9Z++rwAsfIb9XWgGLjmoiN8qe6QZawWUB7PGyfM3NzKT46VECpZhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720144; c=relaxed/simple;
	bh=ki8TstncGegofyUZJEhbBgOmX6iyR357fUhdTSz/fa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pAhrFzxrg7n0XPSwMXBNQixnadfgu7N3r14jaWXYLzCgc1EvwPeUVRcnlsD0KC2qXJGS8ZsHe6COQY65D39k528Ff7q1C4v3Xm18oOxSzGjy+atDhQWJrrriJUJ6xsuzHmHvzlULTg3FXrgUl97/epzSoiMBGnH+AHDGShOlt7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=leG8uVrR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="leG8uVrR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720143; x=1765256143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ki8TstncGegofyUZJEhbBgOmX6iyR357fUhdTSz/fa8=;
  b=leG8uVrR93lNKtbKulLbMTDd7epIed+Mho4qn0qIzowvTJCINhoFc2Nn
   uhfvl9+xMtGWlEXVGthjtMPigqAPbOb5XjTbSflr09EUONDSz145JqGGQ
   jMIajWBl+LndX18hIGF218m43rG7CK0/G7/O1IXxECAWZCdEgqfUWCKNT
   EgDTsMVaCNz7ozk5iP2q9ybcEcWEY+O17vopWRwtKgy2Spumb/pXztKs0
   3RV+AgM4seQNNtzmyALO7a3v6jvRnKV2uecbL3wupKa2am/h4rBx/MSot
   DMgTBY7E4+JoYskduFiU/NzRUeGDMIqI8iJ9MvuiduFuUkyqs/6sElmsD
   w==;
X-CSE-ConnectionGUID: RAHXCV8vSJiqF5v2kHat8Q==
X-CSE-MsgGUID: gr6dOpDmTe6k0TuNrjFEwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51416686"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51416686"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:55:42 -0800
X-CSE-ConnectionGUID: 5j66BUcORB+2DRnUyieYMw==
X-CSE-MsgGUID: hzFEkz3VRlySu0oq6aGZjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99914609"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Dec 2024 20:55:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVo2-0003wT-0V;
	Mon, 09 Dec 2024 04:55:38 +0000
Date: Mon, 9 Dec 2024 12:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 23/186]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to
 match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3',
 'snps,dwc3']
Message-ID: <202412090544.Nj8YF1WE-lkp@intel.com>
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
head:   02d1d4710aa34dc69aed451dab7a261932418c95
commit: 868ad8bfae524d07c5499a61f90ad16e830382df [23/186] arm64: dts: apple: t600x: Add dwc3 nodes
:::::: branch date: 29 hours ago
:::::: commit date: 11 days ago
config: arm64-randconfig-051-20241208 (https://download.01.org/0day-ci/archive/20241209/202412090544.Nj8YF1WE-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412090544.Nj8YF1WE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412090544.Nj8YF1WE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spmi@2920a1300/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@702280000: iommus: [[131, 0], [132, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@b02280000: iommus: [[135, 0], [136, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@b02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@f02280000: iommus: [[139, 0], [140, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@1302280000: iommus: [[143, 0], [144, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spmi@2920a1300/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@702280000: iommus: [[145, 0], [146, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@b02280000: iommus: [[149, 0], [150, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@b02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@f02280000: iommus: [[153, 0], [154, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@1302280000: iommus: [[157, 0], [158, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spmi@2920a1300/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@702280000: iommus: [[131, 0], [132, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@b02280000: iommus: [[135, 0], [136, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@b02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@f02280000: iommus: [[139, 0], [140, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@1302280000: iommus: [[143, 0], [144, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spmi@2920a1300/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@702280000: iommus: [[145, 0], [146, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@b02280000: iommus: [[149, 0], [150, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@b02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@f02280000: iommus: [[153, 0], [154, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@1302280000: iommus: [[157, 0], [158, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spmi@2920a1300/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@702280000: iommus: [[146, 0], [147, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@b02280000: iommus: [[150, 0], [151, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@b02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@f02280000: iommus: [[154, 0], [155, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@1302280000: iommus: [[158, 0], [159, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@1302280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spmi@2920a1300/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spmi@2920a1300/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000: iommus: [[165, 0], [166, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@b02280000: iommus: [[169, 0], [170, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@b02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@f02280000: iommus: [[173, 0], [174, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@1302280000: iommus: [[177, 0], [178, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@1302280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000: iommus: [[248, 0], [249, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
