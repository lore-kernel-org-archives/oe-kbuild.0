Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC32B32D5C7
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 17:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758042573; cv=none; b=ZmKozHy9ItX81UrZEL4i750YlJhmMR3YwlLZi48DJrpOhrXWPiiFd5a5n2iFybV+t+UY1zdx+vlKVvoMq0+xQ37JfiORH0rnSIFonImeKbPQsQAt2CwXNeRfF1mApdmb9QIQFs/EvmAw4iaQ0mPWQ0mjWOLGyUlNTojI+ycbhss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758042573; c=relaxed/simple;
	bh=ifa455a/Zl9SEMv80XHMO4dqcxWjN3Tc6gKOVJXSDtc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qnXNHkTtBqa6aawo3vqNLS3v/wdvWJ86VC6PQw7jBkGEIuJlBLzOl2lKiqnHCvkzmAmaGMmppEOhi+bHHfcY37BRoJ48YL1/wv5VlACuXecb0Sv7XdA+i9P51S2MXu9qoJ6g68itGKKCDkddagtzLJB5dlCJhN9gF3uWoaLBljo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1nQdPZu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1nQdPZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758042571; x=1789578571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ifa455a/Zl9SEMv80XHMO4dqcxWjN3Tc6gKOVJXSDtc=;
  b=I1nQdPZu0TQv08fvzFMHYUheL8aElUGQJL3X+y2wY3zaIkndfMzDZmbB
   aotgBgEdwlFFsiSX8wq8dT/g7Y0bq1azFUtEixD3ioyv9NCT+A8aqAMWM
   HBknuvHlOJh1efBWA1Gtbn1x0bxeOuk32cvVgRQu19suJ0kqOGzTqOBjL
   BEG+ElzpRHf06HUNNbD975IBc/tNdLJ1mnG451+zp9XLyjagIMRGSyoFt
   IT0BU56zPD5WE77Ji90StGeICCEvP2241owCUO6Pa6g9ovFOC6iZ6a2rC
   wtrTE7sHwE9bzzDv+O+TSrdnNeTbjg67AMMW8TMkBzO28bM+VMS6YJfds
   w==;
X-CSE-ConnectionGUID: AXXLkg0pSEm+z68kTEJ5aw==
X-CSE-MsgGUID: sSHvIHFNQMSAdB8VVuAykw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="47908460"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="47908460"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 10:09:29 -0700
X-CSE-ConnectionGUID: /4ZjnOwJSBeXr+h5ov2D3g==
X-CSE-MsgGUID: xOIFTS5NTK279TiXf2Tyjg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Sep 2025 10:09:28 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyZBF-0000Xz-2I;
	Tue, 16 Sep 2025 17:09:25 +0000
Date: Wed, 17 Sep 2025 01:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 5/6] arm64: dts: apple: Add J474s, J475c and J475d
 device trees
Message-ID: <202509170040.Jn3hHKHJ-lkp@intel.com>
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
In-Reply-To: <20250914-dt-apple-t6020-v2-5-1a738a98bb43@jannau.net>
References: <20250914-dt-apple-t6020-v2-5-1a738a98bb43@jannau.net>
TO: Janne Grunau <j@jannau.net>
TO: Sven Peter <sven@kernel.org>
TO: Janne Grunau <j@jannau.net>
TO: Alyssa Rosenzweig <alyssa@rosenzweig.io>
TO: Neal Gompa <neal@gompa.dev>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Hector Martin <marcan@marcan.st>
TO: Marc Zyngier <maz@kernel.org>
CC: asahi@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Janne,

kernel test robot noticed the following build warnings:

[auto build test WARNING on eef7336dc6c11f80c08b55b09b24faf124baeb0d]

url:    https://github.com/intel-lab-lkp/linux/commits/Janne-Grunau/dt-bindings-arm-apple-Add-t6020x-compatibles/20250915-034102
base:   eef7336dc6c11f80c08b55b09b24faf124baeb0d
patch link:    https://lore.kernel.org/r/20250914-dt-apple-t6020-v2-5-1a738a98bb43%40jannau.net
patch subject: [PATCH v2 5/6] arm64: dts: apple: Add J474s, J475c and J475d device trees
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250916 (https://download.01.org/0day-ci/archive/20250917/202509170040.Jn3hHKHJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170040.Jn3hHKHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509170040.Jn3hHKHJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,t8103-pinctrl']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@39b008000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@39b008000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: pwm@39b030000 (apple,t6020-fpwm): compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: spi@39b104000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,t8103-spi']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,t8103-pinctrl']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@39b008000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@39b008000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: pwm@39b030000 (apple,t6020-fpwm): compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: spi@39b104000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,t8103-spi']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,t8103-pinctrl']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@39b008000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@39b008000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: pwm@39b030000 (apple,t6020-fpwm): compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: spi@39b104000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,t8103-spi']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
