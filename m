Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8AA7464
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Sep 2025 22:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758322421; cv=none; b=A9E2dYcE0pYeklY1QbDOg7UEBDReeRMiNZRdldKTmQWUK+SJNf7gFNXvW5GKixwN08YEub9fP/NDtVz/rRW6qXEU22QFzh5zPpUJx7mjlPdazyV9/dmIUMS3+GMAb4bLI2W/QTIUYn+bmxTqhdrHmz8tcyyzVljEoUrXSphiusY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758322421; c=relaxed/simple;
	bh=HD1+6UHhLUYa4gOS5MGCaGJihuzXM8jIUOkrujC5M80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tzDQWM6i6G99PHq9GxawFlfG/2xjhuWze8F42YKofsC0tX1OQW8tez7glDhD5co9Yn0GdXyzoQej3Taf5/aSF7bCnQLaVHtFe+nU2EsM/tMctevfXIc4pBH1Fisj0bI6ochGRfUXXVn6R5Ukbd0ZZz4PvNoIuN/7wmbDyfI7K4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RISw5FBn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RISw5FBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758322419; x=1789858419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HD1+6UHhLUYa4gOS5MGCaGJihuzXM8jIUOkrujC5M80=;
  b=RISw5FBn6O7kjS6jD3CvKHNBah6Odcn5uJaUhCM6D+5AcnMkFEQSg/Md
   WKErL/GnGO9TNRb4uCBvRlBebKMUfPh6TLhFD+coQczWHKadrHh6Dpdm8
   gPI5+ueH3JHwMzuk8hMa8AWwpHwcOCmbVJgoTt8tC7Hocep/b0EmJbw1d
   k6jQnJVjVVKMjSdN3R8UOV/zbNeWz27fr+N3f2OnV2mJm9Dk8lzXmfROw
   mQnPO2Wy5tcE/kgAnX2DVDehaH7E6AR8CVxMPyN5eEGoMkuecDFjY01q/
   Ex/s1WQ7dp/CMUDhaZrP1BWmpREqeXnZeXNnfjqfynLFZlSkvgVp9GSWB
   w==;
X-CSE-ConnectionGUID: I2CV7QfkTR2XlaFhJHrvxg==
X-CSE-MsgGUID: wFiflID+RCi6najFmVPclg==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="71300916"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="71300916"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 15:53:38 -0700
X-CSE-ConnectionGUID: cB8zzedMQyeY7cTcOJwbtA==
X-CSE-MsgGUID: UN7uao/LSROA5NCnsaEuNA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Sep 2025 15:53:37 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzjyx-0004sF-0N;
	Fri, 19 Sep 2025 22:53:35 +0000
Date: Sat, 20 Sep 2025 06:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: add device tree for ASRock Rack
 ALTRAD8 BMC
Message-ID: <202509200648.bDYQtzfE-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-053-20250919 (https://download.01.org/0day-ci/archive/20250920/202509200648.bDYQtzfE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200648.bDYQtzfE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509200648.bDYQtzfE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts:578.16-581.6: Warning (unique_unit_address_if_enabled): /ahb/spi@1e630000/flash@0/partitions/code@400000: duplicate unit-address (also used in node /ahb/spi@1e630000/flash@0/partitions/tfa@400000)
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: /ahb/apb/pwm-tacho-controller@1e786000: failed to match any schema with compatible: ['aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: fan@0: aspeed,fan-tach-ch: b'\x00\x08' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: fan@1: aspeed,fan-tach-ch: b'\x01\t' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: fan@2: aspeed,fan-tach-ch: b'\x02\n' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dtb: fan@3: aspeed,fan-tach-ch: b'\x03\x0b' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
