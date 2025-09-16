Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83263090FB
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758027727; cv=none; b=WJSIcTAhh1UFst7/M6HC0cJ1YRhVHgycIRDVZS7F5VZ6VlWsEzwLj+UQkvwtlEEXlMtvJxSVopqBbg99XBK4fRTK8lHVqOwe8QMWNtaATaLk4eVVoCgTJA48IClq1LTwZctvtm+bLtPdsWmVrYG31LyWtlhnpoivKJIem6l79Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758027727; c=relaxed/simple;
	bh=uHfBfyVKPd381oRLeS4Q6h4d4NZSN7NQktCF/xT95dI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jDZbWv3+W2voogHZIPq4AgYiAGVEnJaYpYMXPX7lnxtFmoISVwLd3rBqiOCKVnOGEXgTY1qyD3QqXCI2c4E7cbS6VGMi8zGo0H8EXzmbIZMdbfeXY5OGi+jbQ5NgvgotSDvjqUzFPfSEXP8d3yyBpwEaZzZiQPSazHjC17DGKNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPZlnjqi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPZlnjqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758027725; x=1789563725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uHfBfyVKPd381oRLeS4Q6h4d4NZSN7NQktCF/xT95dI=;
  b=BPZlnjqirmu9JCHb7N/sFl5MgluVD9AyNFVqE1ilyVMmAJaNAhxIVYt7
   lAsEg5k+ExYntJDHtl3TUC2SI/KrjYIk+E+fT+xPaASJmDj5pRYGTeEpf
   iHwrNPjBJDCPl3WTPXBhvBNia6Mokm3FX7FMDfkS5xpn72CUZqn8p/2tO
   +d4U8eEcck/5IqGubOaH4+17SZ824gOz+dlayBZDagG3fz+ws6oSzi+fi
   3bbQIT49w8S4MnJc9yh3dm0DwTU+D2D40wwuh1X1RJcKtW+gBGgr7XpNl
   DCltT7FYtLqomU7vTXV2EsNtMYtatSBfcnAH8B3HRdPKI5aC7j+rr2WMk
   g==;
X-CSE-ConnectionGUID: 8Am+oegmTFe9fSOBTmhIBQ==
X-CSE-MsgGUID: UENX55tHRrqNF0t9Pc0Gzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="77745462"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="77745462"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 06:02:05 -0700
X-CSE-ConnectionGUID: bLVcyrSrT7G40U4iHT1w1A==
X-CSE-MsgGUID: NgyX/KM7RjS0i+3bqL3FbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="175358639"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Sep 2025 06:02:02 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyVJn-0000I7-0Q;
	Tue, 16 Sep 2025 13:01:59 +0000
Date: Tue, 16 Sep 2025 21:01:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/6] arm64: dts: apple: Add J414 and J416 Macbook Pro
 device trees
Message-ID: <202509162043.HXCPB62Y-lkp@intel.com>
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
config: arm64-randconfig-051-20250916 (https://download.01.org/0day-ci/archive/20250916/202509162043.HXCPB62Y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509162043.HXCPB62Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509162043.HXCPB62Y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,t8103-pinctrl']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@39b008000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@39b008000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: pwm@39b030000 (apple,t6020-fpwm): compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: spi@39b104000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,t8103-spi']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,t8103-pinctrl']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@39b008000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@39b008000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: pwm@39b030000 (apple,t6020-fpwm): compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: spi@39b104000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,t8103-spi']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,t8103-pinctrl']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@39b008000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@39b008000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: pwm@39b030000 (apple,t6020-fpwm): compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: spi@39b104000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,t8103-spi']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,t8103-pinctrl']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@39b008000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@39b008000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: pwm@39b030000 (apple,t6020-fpwm): compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: spi@39b104000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,t8103-spi']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: spi@39b108000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
