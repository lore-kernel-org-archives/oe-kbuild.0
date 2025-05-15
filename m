Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC69419D892
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 14:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317897; cv=none; b=iw8qYoEPJCN2t9sie2AJfQCDQj2M/2h+MJC9qPRxSg8+d4H0vJv0XvMD6501hqfdjUZDsgLVdTOZrIHiZrtY0WAFdgN4vxDCeJFNFyszrSxclkUhffba1byZNAVvzBKkmnUQ5xiAi8ClEqo1/dfV0pnzcMwq34IkUF/lZrGkdzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317897; c=relaxed/simple;
	bh=FeTBGMib+dv2Zv/XaaR9Zs1pdGhRhzstxUf2LMy9jgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LKjL10uwhIYYeLzHMLZXSYYcNfHXNKOpz006SpPxd4StUANoQuhxA6RgrU2T0swp5VjTH1p/u/NoPO6+d99KQyTo5yQi/m834QiryiwzM6XTO1zbLu06N/UoWOBJ5RjcygZlYgT1KR/6t3FLnx4PjQW+IsLwHmjtgpRUOIivJTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkbVAX4Z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkbVAX4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317896; x=1778853896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FeTBGMib+dv2Zv/XaaR9Zs1pdGhRhzstxUf2LMy9jgE=;
  b=DkbVAX4ZenQmggXo7t0142dpjBiypgkTe3rteWlWdiarS/yJLyFgV9TZ
   zMpXGOek/ALDtMJERW7HiHRF4QcCmiuDiRQQ7R56XG07SjAho7IDc8JNI
   SnPmuMU4uqRhyHTifOzfqMsm9n+z5/ORJdZz14oXSv5Fxk26xm42DT8BP
   wcqSfLkumQ/58OvQ7B3jdsa0mIM9jlkD3Z3TGUAEDbQANDTez6Uh+LpVb
   qK/T4hg0/T2YY2HtPGyoe2d0VWI661DRM8MU4gGZFYHdiMyL56Gb1V3V+
   RsDPFK1IxUUmlp0iU6OPG8Q80r5QQYW7E+7H3kotK1rhGU4GM2Hgf4l14
   Q==;
X-CSE-ConnectionGUID: 14owwt3+TpyXIpQalmK1VQ==
X-CSE-MsgGUID: YFTAKe0rRCuppfCEMx0bBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48943630"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48943630"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:04:52 -0700
X-CSE-ConnectionGUID: jhGRkNjXSBu8LoWblyT2KA==
X-CSE-MsgGUID: Srl9OkCXQCKu6oHk7+h0RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138778844"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 07:04:50 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZCa-0000FB-1t;
	Thu, 15 May 2025 14:04:48 +0000
Date: Thu, 15 May 2025 22:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dtb: mcc
 (arm,vexpress,config-bus): 'clock-controller' does not match any of the
 regexes: '^amp-.+$', '^energy(-.+)?$', '^pinctrl-[0-9]+$', '^power-.+$',
 '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$'
Message-ID: <202505150303.kzZqBHwk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Sudeep Holla <sudeep.holla@arm.com>

Hi Rob,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f35e33144ae5377d6a8de86dd3bd4d995c6ac65
commit: 04f08ef291d4b8d76f8d198bf2929ad43b96eecf arm/arm64: dts: arm: Use generic clock and regulator nodenames
date:   11 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-2051-20250514 (https://download.01.org/0day-ci/archive/20250515/202505150303.kzZqBHwk-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150303.kzZqBHwk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505150303.kzZqBHwk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dtb: / (arm,rtsm_ve,aemv8a): bus@8000000: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml#
>> arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dtb: mcc (arm,vexpress,config-bus): 'clock-controller' does not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^pinctrl-[0-9]+$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml#
--
   scripts/dtc/include-prefixes/arm/arm/vexpress-v2m-rs1.dtsi:419.9-490.7: Warning (simple_bus_reg): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/mcc: missing or empty reg/ranges property
   scripts/dtc/include-prefixes/arm/arm/vexpress-v2m-rs1.dtsi:366.13-376.9: Warning (graph_child_address): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/i2c@160000/dvi-transmitter@39/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dtb: / (arm,vexpress,v2f-1xv7,ca53x2): bus@8000000: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml#
   arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dtb: iofpga-bus@300000000 (simple-bus): mcc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dtb: dcc (arm,vexpress,config-bus): 'clock-controller', 'regulator-12v', 'regulator-vio' do not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^pinctrl-[0-9]+$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml#
--
   arch/arm64/boot/dts/arm/fvp-base-revc.dtb: / (arm,fvp-base-revc): bus@8000000: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml#
>> arch/arm64/boot/dts/arm/fvp-base-revc.dtb: mcc (arm,vexpress,config-bus): 'clock-controller' does not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^pinctrl-[0-9]+$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
