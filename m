Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B342AD16
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 07:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758353489; cv=none; b=j/YLs+ivwNfH6w4ZqXGeJ2nWxUd9Bxgcv9dpkjpQIJjn/JjIaWQ8AKTtqmfUljhAcr2i/ek2/VbXJ4/Un1cao9y1Pk+gLjfQKoW+blNYaZ5FlfBXU66OzGcIsujHrkYZM+GcWFTA+ovhBeGeucex25u8ZcU/gsXdTuI3Mj/PwEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758353489; c=relaxed/simple;
	bh=esYRJVA7cF8Cq2fSxPP+FKPh7WxYJIFwsJa+C4cj76w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gwjOMpUxO6oVjgV8y4WWPiiKjW21KoBQdH4M8eQTHxABJoytSxdgIJQC9FPQTajj/LPm8Ibh4qlkf9v1i5l7HFVVhmwUwuMv9Cv14g3Ji+C74sp0Iq3MOouogJSSeb+2J3ce6H2oZ0XKU8C+sfmPlpqIKoX0iPpoPI0MNkx2sPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tc7Ft7JJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tc7Ft7JJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758353488; x=1789889488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=esYRJVA7cF8Cq2fSxPP+FKPh7WxYJIFwsJa+C4cj76w=;
  b=Tc7Ft7JJO8qQ7Rd2Lo6KfGxmAjYBRysUQq6b3mtHC+K8wfXATVh2XfAm
   pGxn0kf2rF+UA5MxVjbxEuFZ7kWSIxhEh8DsiZX+/cNncbbOVXTxsO5os
   LFooFTzpH8H57YnxBJL35ETADvz66KuHs9HUSm1/OZPCBZvMZ39LaazG1
   e8yRw5Jdg6EiXug54lBxFdgwWFIrrmFi6chpwJnpC3jc6wUEnR/b3mFzK
   Nzmva1XDYgb0sxMbXFcSrA0QDSgdTt5R2l8f8LO3nQRZMfzSfsE+gju6H
   d482GooGyUxV03ETKW/VLZIRZy5LOff18Ij/F31ElBpPPQtpBbAU5wQor
   w==;
X-CSE-ConnectionGUID: mTHVXCdUTSS95Szm0pxm5A==
X-CSE-MsgGUID: iv5SABG8Q5Goe/Pj/XtRmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="71798083"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="71798083"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 00:31:27 -0700
X-CSE-ConnectionGUID: 4wFQMKC3TPW3AR9CI0iu5w==
X-CSE-MsgGUID: mxrpWGb+RWOyGahN4KkDxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="206967674"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Sep 2025 00:31:26 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzs43-00058F-2Q;
	Sat, 20 Sep 2025 07:31:23 +0000
Date: Sat, 20 Sep 2025 15:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: add device tree for ASRock Rack
 ALTRAD8 BMC
Message-ID: <202509201510.lcZz9fT7-lkp@intel.com>
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
In-Reply-To: <20250917180428.810751-3-rebecca@bsdio.com>
References: <20250917180428.810751-3-rebecca@bsdio.com>
TO: Rebecca Cran <rebecca@bsdio.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-aspeed@lists.ozlabs.org
TO: linux-kernel@vger.kernel.org
CC: Rebecca Cran <rebecca@bsdio.com>

Hi Rebecca,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5aca7966d2a7255ba92fd5e63268dd767b223aa5]

url:    https://github.com/intel-lab-lkp/linux/commits/Rebecca-Cran/dt-bindings-arm-aspeed-add-ASRock-Rack-ALTRAD8-board/20250918-020746
base:   5aca7966d2a7255ba92fd5e63268dd767b223aa5
patch link:    https://lore.kernel.org/r/20250917180428.810751-3-rebecca%40bsdio.com
patch subject: [PATCH v2 2/2] ARM: dts: aspeed: add device tree for ASRock Rack ALTRAD8 BMC
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-052-20250918 (https://download.01.org/0day-ci/archive/20250920/202509201510.lcZz9fT7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201510.lcZz9fT7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509201510.lcZz9fT7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts:578.16-581.6: Warning (unique_unit_address_if_enabled): /ahb/spi@1e630000/flash@0/partitions/code@400000: duplicate unit-address (also used in node /ahb/spi@1e630000/flash@0/partitions/tfa@400000)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: /ahb/apb/pwm-tacho-controller@1e786000: failed to match any schema with compatible: ['aspeed,ast2500-pwm-tacho']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: fan@0: aspeed,fan-tach-ch: b'\x00\x08' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: fan@1: aspeed,fan-tach-ch: b'\x01\t' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: fan@2: aspeed,fan-tach-ch: b'\x02\n' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: fan@3: aspeed,fan-tach-ch: b'\x03\x0b' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: fan@4: aspeed,fan-tach-ch: b'\x04\x0c' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: fan@5: aspeed,fan-tach-ch: b'\x05\r' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: fan@6: aspeed,fan-tach-ch: b'\x06\x0e' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: fan@7: aspeed,fan-tach-ch: b'\x07\x0f' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: lpc@1e789000 (aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: lpc@1e789000 (aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: kcs@24 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2500-ibt-bmc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: gpio@1c (nxp,pca9557): '#address-cells', '#size-cells', 'gpio@0', 'gpio@1', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
