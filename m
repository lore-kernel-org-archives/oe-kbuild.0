Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B91D26E706
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 06:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758608109; cv=none; b=ePJw7T7BPFcjyAKSgRT9aLYIKWGMIJwCQAvSnRHHAQzj6+TnajumYNZoEqe1pWU9ljGeKQ/oszVEVHMBfxlOflFl3cx7aqmgxDEB2PzaNOhUtlW23W9mYuAqLptqWEpQ8PzA9SyGqf0jtdoEHEHWdgfc3dN0KpaERhOEgMdIsOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758608109; c=relaxed/simple;
	bh=jNZj4zFYDC649z1XTC8KSjI7wSH47AxeEYvJtQgulCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pD44T8eGJ/SGnSFeajnehlAg8CvkuK7SVtKlU0pheSq6/PAFb8/JpmTL0tHSMRJNaB4HJMZsjAMzvtrHPtJ3USqyu3ZziNUEd3/wjm8EEo07beoEVYH61lKjYLeDu+tcSLlILmlbshy0K+tpA0UEh25UxS31cHUPZrLLVWmJqSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYq+S8cr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYq+S8cr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758608108; x=1790144108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jNZj4zFYDC649z1XTC8KSjI7wSH47AxeEYvJtQgulCc=;
  b=IYq+S8crtSNKwmNKKHZqhatRfjs+MRCSSShaWPpbTlnHdNhQBBRBfvnI
   SDKA04fKCrtP05TaJ005yuGJvDkCE/FtB1clrmO00dCAIum6McsCkyRrt
   ZMFGnPdpU3Mpd95BQChsgBsXm9SWcDonigvT8C099J/7R2oUuUZmjrCRu
   3jFbIHEIdVb84Q6zyEFw+0v/dgnGkoY7LBt82CziGtGGBoxk3fRyjmoRf
   uoQglmNbW866/noFIHKoAHPt0pmF2DsAtARNudqY3t0N4TQ23oPneuJ+x
   BTKiEz93WJSgf0TEEhzNxE+j2jDdEpUpQDCv5ugQuMZYjktkxSmpLHi4I
   Q==;
X-CSE-ConnectionGUID: LZW4jtx7SWyvWD5imaNYsg==
X-CSE-MsgGUID: k6dTtf/+RrO5lqvLow2udA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60820397"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60820397"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 23:15:07 -0700
X-CSE-ConnectionGUID: 4G/5yt0jQ0m9vkgAiaVftg==
X-CSE-MsgGUID: 7WenhzdHSyaV/WCvrLXTwg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 22 Sep 2025 23:15:06 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0wIp-0000000045V-2TC0;
	Tue, 23 Sep 2025 06:15:03 +0000
Date: Tue, 23 Sep 2025 08:14:46 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] dts: aspeed: Add a dts for the nvidia msx4 hpm
Message-ID: <202509230841.VUyh9Csx-lkp@intel.com>
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
In-Reply-To: <20250918-msx1_devicetree-v1-2-18dc07e02118@nvidia.com>
References: <20250918-msx1_devicetree-v1-2-18dc07e02118@nvidia.com>
TO: Marc Olberding <molberding@nvidia.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: Marc Olberding <molberding@nvidia.com>

Hi Marc,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f5ae30d69d7543eee0d70083daf4de8fe15d585]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Olberding/dt-bindings-arm-aspeed-Add-Nvidia-msx4-board/20250919-071432
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250918-msx1_devicetree-v1-2-18dc07e02118%40nvidia.com
patch subject: [PATCH 2/2] dts: aspeed: Add a dts for the nvidia msx4 hpm
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-2052-20250922 (https://download.01.org/0day-ci/archive/20250923/202509230841.VUyh9Csx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230841.VUyh9Csx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509230841.VUyh9Csx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:634.36-638.7: Warning (unique_unit_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicate unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): lpc-snoop@80: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
