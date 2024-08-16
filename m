Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4A71B373E
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Aug 2024 16:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723827191; cv=none; b=iq40g+DeGSg6IkF40sSgYREYv67SE94dyJJtNA3PYCgPPxZlFht2yaYcMfDfv3OeM5wD6GplEAOF4bQI16H4ZSwYWpmQvc9GBrepvOW53gjmHaxru08mL/jWENiAqd8GbaJWyf2is9N7NawMCt7nNvtSqFb+GBag61FncFg1Onc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723827191; c=relaxed/simple;
	bh=l3SaM6GRTe6aGWt0ORQDltr5EKcSPdazl9aavPjIcHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ahK3+B26+dlN32AhEaxmvIFB/UZ4pgSl1pqj9AJl6L+wEawcBzftykTC14tmi2vbGDF/1p9CU1Q12TNIcEJHKxYp5CEXP/TqqwfqOY/NzFKKrY+JYzX/+p2YI7qwr1HOBvMcm5zGn3I8NWZMCFNOkK3NWxGWrHN5G71ZgWQlLwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKNRL8Lk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKNRL8Lk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723827188; x=1755363188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l3SaM6GRTe6aGWt0ORQDltr5EKcSPdazl9aavPjIcHI=;
  b=bKNRL8Lk6Mw0VtwzV/vn/ySageIJfxFLe6UI6FFCR/Z0aNhoFXTntU4S
   enTrJGNrTIErWqp9AsfNZ6m5aZ7zAO5zBJOJzFri9rHO6vGKF/cycSsVX
   Rd6utSJHvpf66bUl1A8pJVYQdj8eOx2+lc8+95mIxCQDOWdTC5n5h3Ikv
   sydmutd58FtBKDVZxCG9FhS0HjGEn2e9YHALayklZnx39/FtdxIFBmRM6
   L3BwOgtMv7vNIQ+whagPYltOtu9OaZjeJRSyzrW1wgyZ83TtHcdjc+Ae4
   SRTYzbat+rAd63zoNOV7Ysk+bFSXVdg/1oy4iUyY5KZRuVsSDgZjacPh4
   w==;
X-CSE-ConnectionGUID: MwQbp9VeQjue2io7NmbmIw==
X-CSE-MsgGUID: 8yu2XkI2R3+ePHpl7oQMkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33278895"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="33278895"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 09:53:07 -0700
X-CSE-ConnectionGUID: eGe3BgNHSti8sdmYzljUVA==
X-CSE-MsgGUID: CZ8Q1WPURd2IkJuns5XtRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="90498177"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Aug 2024 09:53:04 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf0CE-0006f0-3D;
	Fri, 16 Aug 2024 16:53:03 +0000
Date: Sat, 17 Aug 2024 00:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] dt-bindings: misc: aspeed,ast2400-cvic: Convert to
 DT schema
Message-ID: <202408170040.BsaW1L4m-lkp@intel.com>
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
In-Reply-To: <20240802-dt-warnings-irq-aspeed-dt-schema-v1-2-8cd4266d2094@codeconstruct.com.au>
References: <20240802-dt-warnings-irq-aspeed-dt-schema-v1-2-8cd4266d2094@codeconstruct.com.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>

Hi Andrew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Jeffery/dt-bindings-interrupt-controller-aspeed-ast2400-vic-Convert-to-DT-schema/20240803-071100
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240802-dt-warnings-irq-aspeed-dt-schema-v1-2-8cd4266d2094%40codeconstruct.com.au
patch subject: [PATCH 2/2] dt-bindings: misc: aspeed,ast2400-cvic: Convert to DT schema
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-051-20240806 (https://download.01.org/0day-ci/archive/20240817/202408170040.BsaW1L4m-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170040.BsaW1L4m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408170040.BsaW1L4m-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2400-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2400-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: sram@1e720000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: sram@1e720000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2400-video-engine']
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout.dtsi:9.11-12.4: Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@0/partitions/flash0@0)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout.dtsi:9.11-12.4: Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@0/partitions/flash0@0)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2400-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2400-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: sram@1e720000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: sram@1e720000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2400-video-engine']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dts:254.12-257.5: Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@0/partitions/flash0@0)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout.dtsi:9.11-12.4: Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@0/partitions/flash0@0)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge40.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge40.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge40.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2400-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge40.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2400-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge40.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge40.dtb: sram@1e720000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge40.dtb: sram@1e720000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge40.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2400-video-engine']
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout.dtsi:9.11-12.4: Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@0/partitions/flash0@0)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge100.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge100.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge100.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2400-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge100.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2400-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge100.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge100.dtb: sram@1e720000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge100.dtb: sram@1e720000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge100.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2400-video-engine']
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@0/partitions/flash0@0)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout.dtsi:9.11-12.4: Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@0/partitions/flash0@0)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: ethernet@1e660000: Unevaluated properties are not allowed ('mellanox,multi-host' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dts:17.9-19.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /: memory: False schema does not allow {'reg': [[2147483648, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /: memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-microsoft-olympus.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-microsoft-olympus.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-microsoft-olympus.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2400-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-microsoft-olympus.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2400-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-microsoft-olympus.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-microsoft-olympus.dtb: sram@1e720000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-microsoft-olympus.dtb: sram@1e720000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-microsoft-olympus.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2400-video-engine']
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2400-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2400-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: sram@1e720000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: sram@1e720000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2400-video-engine']
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2400-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2400-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dtb: sram@1e720000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dtb: sram@1e720000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2400-video-engine']
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-q71l.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-q71l.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-q71l.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2400-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-q71l.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2400-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-q71l.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-q71l.dtb: sram@1e720000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-q71l.dtb: sram@1e720000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-q71l.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2400-video-engine']
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: copro-interrupt-controller@1e6c2000: compatible:1: 'aspeed,cvic' was expected
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: copro-interrupt-controller@1e6c2000: $nodename:0: 'copro-interrupt-controller@1e6c2000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/misc/aspeed,ast2400-cvic.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2500-cvic', 'aspeed-cvic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2500-xdma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: sram@1e720000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
