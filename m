Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983E621170D
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 10:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748601369; cv=none; b=LyFKoo7WsUBgoymQps165TNQfDMbAGR4y758JUtb3Pdc4CgvZL6J0OlaNetV4rG4Qrr3f4uOK/1CP/uc9Ol62Ah8zbA9vcFJXVoZrROkhXa4aSjc/7Y7CeIBvsldjIsRyB22PU7Wmmg79uBZ/Sww8V/9kfxvxWABKHdRClLbybM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748601369; c=relaxed/simple;
	bh=yH2WrLB2C3fg95aQef1NGGISridFSfJVfqugEkeuVkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FW4JWGYWBsMwTW+2ZWO79KkPwKsF3riHYylEewWde9aNbLSvJXzO7sOZpQ3bt+gutGT0HaD6pb30OLLHbO4qzZpqZNsPvpxJuweBOSKdJArJWZSCrB3Xoq8zTgVglHF/mXnKN6hHY0iReOuGtoMJ7EkYDiM4JO8hQxnzSC3PZcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZN8Oqu1R; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZN8Oqu1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748601367; x=1780137367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yH2WrLB2C3fg95aQef1NGGISridFSfJVfqugEkeuVkI=;
  b=ZN8Oqu1RtjNbKLW65lvlevC28LaOb+v5F5+/xyBnhAJoUJZ/G8u4nfwK
   /T6BYoFifdJR7YfaPtPDjIa5U0hRj8hnQX3J1/GAIy+fLdAOITRzmTpc2
   xf3qfJD5scZ4lGQ7IlcnKJuv9keRsAGmKfcd8BGBEoHU47bdVM+dT/F8Q
   nvpVTLwRNyUaOG/gPbCDxZQd4iVPsWRx3HE0vbCdJGYnHoP9F9GCiauaG
   ys6AhgVpi2Nd+8sNwu71a6mKkfI3KWKJ2d0wLQVYpLmwDL0+Ay5vbJ87n
   SkM5MOB+ESEt95SHiVvz4p9ID4HhqjrCkyXzm5hRZDBNpLmX/egEdZ0WR
   w==;
X-CSE-ConnectionGUID: 9Cfwccj5TCq15dydmlN4/A==
X-CSE-MsgGUID: aiYFcOHjRGq7znJmUGSUvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50837039"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="50837039"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 03:36:07 -0700
X-CSE-ConnectionGUID: 5tS+mQrXQR+e48t+AUjVtQ==
X-CSE-MsgGUID: C8NOsghoR6Kj13FVIdp9kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="174724015"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 03:36:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKx5n-000XYa-07;
	Fri, 30 May 2025 10:36:03 +0000
Date: Fri, 30 May 2025 18:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] ARM: dts: aspeed: nvidia: gb200nvl: Add VCC Supply
Message-ID: <202505301828.p3eNrUVS-lkp@intel.com>
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
In-Reply-To: <20250525-dts-v1-1-9ac63ad3bf15@nvidia.com>
References: <20250525-dts-v1-1-9ac63ad3bf15@nvidia.com>
TO: Willie Thai <wthai@nvidia.com>
TO: wthai@nvidia.com
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: Deepak Kodihalli <dkodihalli@nvidia.com>
CC: Ed Tanous <etanous@nvidia.com>
CC: Leo Huang <leohu@nvidia.com>

Hi Willie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 13c9c6eabf033ed4f369ad4d29bdc58ed4a411e3]

url:    https://github.com/intel-lab-lkp/linux/commits/Willie-Thai/ARM-dts-aspeed-nvidia-gb200nvl-Add-VCC-Supply/20250526-022143
base:   13c9c6eabf033ed4f369ad4d29bdc58ed4a411e3
patch link:    https://lore.kernel.org/r/20250525-dts-v1-1-9ac63ad3bf15%40nvidia.com
patch subject: [PATCH 1/3] ARM: dts: aspeed: nvidia: gb200nvl: Add VCC Supply
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-052-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301828.p3eNrUVS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301828.p3eNrUVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505301828.p3eNrUVS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@24 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb@1e780000/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb@1e780000/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@280 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@300 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-mux@74 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-mux@74 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@380 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@480 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@500 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@780 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@800 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
