Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B247323F42
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 22:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758060909; cv=none; b=GZpNzGY08EFPqeBTnv0e6XM2blfH/xgY/gQ1173aMGkPqUtx0JbxO7rMBn9vamn4zbltA5Kzy3NblgJDR2iSgm7o4/2dmJcMnarykBl904fKbiBt90kT+TOKwL2ghx7BJ+Z/zP2rQM9kK7GJQETJee03dT0HoAmPKHJu6+Pp+9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758060909; c=relaxed/simple;
	bh=kUEihFqhC2MS8Ri+AmE0JaC1mYTy2jrkwGUrikmIoWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B1uRFhzeUXJKVhYJqIQ98rZpSIXQyleDXWxLiYFJCY+3EnvaRxYVXvMfxSs+o56jubechYyXJmc1D7+h5JELqNV7jSB61V8UXbM4DOc1One7TTkoxUO8aZk4xkVW/nFQWDtOXo6zIsjGugEJKATcoihqx7oEi+sv4OqFPactqhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuzZRYro; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuzZRYro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758060905; x=1789596905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kUEihFqhC2MS8Ri+AmE0JaC1mYTy2jrkwGUrikmIoWE=;
  b=EuzZRYrozzfAiXkXjcBmUnc9BGSf6VSr1xOv6ZhWDCWtqvW3QqanbMG2
   Qwb3oiN8WhlzTiZ2xrQtfQDSc325vSz5pwSQl+qUPw9V2bPb6dnClv071
   KMZ4ZmSV3tUuN/ip7AOXqgAA3Cotj17OYy7fVDu7qmKw6fjAMfdKm47AK
   5NWgmdkBKONXvwjPF1B6000WiyFDMosFsO2yPZbb4ubJJc1uagRKB383K
   aZNp4ZFVoNmX4hIy4zA5Qja38XOfUVF33kI2tY2kFp4ZO+YFpcN+X9sl+
   TNU8Y5O6qkzGMyDXqwhtXoeSjoG2wcrwKI3ZHrHNo6XPRNta2HKhm2Pto
   Q==;
X-CSE-ConnectionGUID: dPj09ve6QjWBiiwZEqr72Q==
X-CSE-MsgGUID: 0KTJDNekTOC9CqW+EogG2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="59577334"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="59577334"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 15:15:04 -0700
X-CSE-ConnectionGUID: EbuqhR53QAWZK/yFeCrMJg==
X-CSE-MsgGUID: 7H279/FrRfehiX/M1EqmNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="174992609"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Sep 2025 15:15:03 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uydwy-0000mt-2n;
	Tue, 16 Sep 2025 22:15:00 +0000
Date: Wed, 17 Sep 2025 06:14:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 5/6] arm64: dts: apple: Add J474s, J475c and J475d
 device trees
Message-ID: <202509170529.WN5CMUn6-lkp@intel.com>
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
config: arm64-randconfig-051-20250916 (https://download.01.org/0day-ci/archive/20250917/202509170529.WN5CMUn6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170529.WN5CMUn6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509170529.WN5CMUn6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: pwm@39b030000 (apple,t6020-fpwm): compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: spi@39b104000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,t8103-spi']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: spi@39b108000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
--
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@39b008000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@39b008000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: pwm@39b030000 (apple,t6020-fpwm): compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: spi@39b104000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,t8103-spi']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: spi@39b108000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
--
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@39b008000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@39b008000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: pwm@39b030000 (apple,t6020-fpwm): compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: spi@39b104000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,t8103-spi']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: spi@39b108000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
