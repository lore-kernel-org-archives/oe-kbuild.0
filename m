Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3402FA0F5
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 10:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017751; cv=none; b=i0/OT6v38hMJZb5grKZr0IfgM9paDSAaIQQNbe811iUZpwqXcvVJkwAFMFq+DcDp0lzmOOuBpFM6P54+kJplnXnOrZbygbYkU6oafl6Z8YFUOLyVwy0do++Ni6TIOZuOS8R89iK/XK+0w+0qu8xg9jzF21ipTPd0UvjovRnxTAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017751; c=relaxed/simple;
	bh=1PHSO0hOqbmzh1Tn6PKmtJfurele4q0RBhXFPOHeMoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b4+16GzMdMu0jhAKBZd0CBQo/okJ+91P5m7opYgTq3HFsY3qx/TVC+/6KyiLlqAIsg8jP2dh5f+AQn10/b/E8XroUQO/qZetpqnII1IyIZ+7R+0cBTGRAaYSXM6uYNFc6OohRAbRi245GL8TKzNPluKoZ/CAxkvfWnuVtN3KPVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izLWPxKU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izLWPxKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758017749; x=1789553749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1PHSO0hOqbmzh1Tn6PKmtJfurele4q0RBhXFPOHeMoU=;
  b=izLWPxKU1k19hAV2SdAHLL1Xu1KYunrmBdvTE++RBT8ixIIR6+PE5pAg
   55HJQAGH466htJEontRHJgvHVXx6GlSWXukE6gqG9qIm03IUaFR3BWmAN
   J53cMSPJwoL924B+MFgZA0+vvHv2abMQVTFAKGIdaVXqtouZEtz3h7YK9
   gzFb70W4h8v3Kr+sKW+HMLfKdve1z35sp9r4Fe4ODvP7wS7TaI+6UZBth
   HmD/Quf6wACvruKqKhOvrZYfpY6gQmHdgJfalMwU5veo7Lj0tANDi2d1N
   4fWBDDOn5dX4fU9OaPBhOMlrBtVUUHk/1yiIJPuFIEezVfpU/xnz/wnc9
   g==;
X-CSE-ConnectionGUID: GT6vBTesSNekiruBkWCNfQ==
X-CSE-MsgGUID: GgzHelrXTo6iYkrv25KMjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="71392376"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="71392376"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 03:15:48 -0700
X-CSE-ConnectionGUID: LkklqKGvQc2xxNNghU+RKA==
X-CSE-MsgGUID: FXIMgVx/Qsm1RI/1GiNj+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="178908158"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Sep 2025 03:15:46 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uySit-0000BT-2Q;
	Tue, 16 Sep 2025 10:15:43 +0000
Date: Tue, 16 Sep 2025 18:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/6] arm64: dts: apple: Add J414 and J416 Macbook Pro
 device trees
Message-ID: <202509161749.Eo6BYAq1-lkp@intel.com>
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
In-Reply-To: <20250914-dt-apple-t6020-v2-4-1a738a98bb43@jannau.net>
References: <20250914-dt-apple-t6020-v2-4-1a738a98bb43@jannau.net>
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
patch link:    https://lore.kernel.org/r/20250914-dt-apple-t6020-v2-4-1a738a98bb43%40jannau.net
patch subject: [PATCH v2 4/6] arm64: dts: apple: Add J414 and J416 Macbook Pro device trees
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161749.Eo6BYAq1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161749.Eo6BYAq1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509161749.Eo6BYAq1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@39b008000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@39b008000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: pwm@39b030000 (apple,t6020-fpwm): compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: spi@39b104000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,t8103-spi']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: spi@39b108000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
--
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@39b008000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@39b008000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: pwm@39b030000 (apple,t6020-fpwm): compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: spi@39b104000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,t8103-spi']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: spi@39b108000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
--
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@39b008000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@39b008000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: pwm@39b030000 (apple,t6020-fpwm): compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: spi@39b104000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,t8103-spi']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: spi@39b108000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
--
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@39b008000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@39b008000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: pwm@39b030000 (apple,t6020-fpwm): compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: spi@39b104000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,t8103-spi']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
