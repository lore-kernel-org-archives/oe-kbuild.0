Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493D72D77E2
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758461128; cv=none; b=DyCR7MvoKsapyqnAH3FKKoQuVcAd1hMiX2jH5hZ0wREwxZ1x69nlft0tnEopAAixoHyjHAlZ1d4niEocvN/TwwbgQHABNsw7V46YRtx0SwFEpVdgQeXwHDyzpKMo7pSvcTX2Dxkb6KtwUSrskQwjyd9G39TXIcQ4RARrIqTz9Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758461128; c=relaxed/simple;
	bh=pPNauDQbBPBU9gs4o6HGq+OhaKOg9SK3E0QjTP3mfSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YJ7Ew5j7C/vSxsU96NtcnOBbZj5Pf3ps4rGsPtRAfuyV5NkkHvrhWaLI0stE7F8KwFZH1mwQQjDdkxeBdz9KmhdeOcuY6upFFN4dl2MaPOWX0xMBEyNQvHYZrWwL+Ts8DmIDy3f3QZgBqRUpsWOM75+l6p/2Dg2/FTpDCo89fFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/xmLAIc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/xmLAIc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758461126; x=1789997126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pPNauDQbBPBU9gs4o6HGq+OhaKOg9SK3E0QjTP3mfSw=;
  b=U/xmLAIcwfi1RgaWV0MK+ajhzNFu9JJBLF/IZSPtoH1hnFQqTOiM2SWP
   vt4AdIFBTJPcdpP1TUItYUicKbDvxXMc6PQbU9t/iuUhBcbn/yl6Dw1ez
   /NAEwRamxSwBbFGsAtF8nzWf7Pq7OE7TbA9MVpzYG2PhB8UJWgXDTzJ/+
   2x1bpCToicrNP3oyyNIuf5JYxBC/tQRK1GbzhDVfMSBC65yyWOLxSv6CP
   IIa+1PUtOS60D7tGsY5fyBcYxBCFtuXLd6PWNxB/wUIJx4SpQ6lB8opHc
   LwgnppC1FUnI3cflG6F9T6S2Vi6SjIgovIE+v9XSbICi6BJhz5lFytY6R
   w==;
X-CSE-ConnectionGUID: iNQAeA4rSOWSfCJwgOYjtA==
X-CSE-MsgGUID: VNnnSuKpSZ614ESX8qgK3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="71368863"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="71368863"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 06:25:25 -0700
X-CSE-ConnectionGUID: DHA6ZZJxSCmNsJbFHdysaw==
X-CSE-MsgGUID: SKPB0T29T8OegHbELSdQJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="177066063"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Sep 2025 06:25:24 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0K4A-0000l7-1Q;
	Sun, 21 Sep 2025 13:25:22 +0000
Date: Sun, 21 Sep 2025 21:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: add device tree for ASRock Rack
 ALTRAD8 BMC
Message-ID: <202509212140.97jyb4AK-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-053-20250919 (https://download.01.org/0day-ci/archive/20250921/202509212140.97jyb4AK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509212140.97jyb4AK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509212140.97jyb4AK-lkp@intel.com/

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
