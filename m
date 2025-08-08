Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C040278E53
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754658241; cv=none; b=Ix4DDE5F1Q5Y8M9ja22IGmCIDcqS3dzOCAfgjjeXHPER9bIsHm+2wb3yeXpbtcTEqUOxgfsZytYFoFgWgpMafVqX4gmYGlV7l6cTw+JN9z+my3Nvure2xZQMf4hnEFsfjx4T1SPDKAnelANH8q/Y1q/ltKBtNiOiy9FEo3TG4bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754658241; c=relaxed/simple;
	bh=x/zmvc7HgUdJaVbdI82HGFYRpnojhHYYTw5/4rvhyO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=msdj/cBvQKaO0Kt71ywrMPG+6byZ6ZBsORsJuWql5MqA+y19YtQZQNRHitLULb1xcuAu53mutESfBMZI4Uqur8cnEOsh09EJVIAWDoiJy1RX0mA8Tsli1scYmkjOWEU8fVyy/XyHUFQawcRXNsdBrnKpEGqxoJN/tkwXX01zFFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hD10K73W; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hD10K73W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754658239; x=1786194239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x/zmvc7HgUdJaVbdI82HGFYRpnojhHYYTw5/4rvhyO8=;
  b=hD10K73WkbJYKbDGXTsaPxocOnPtAMMWgSWMlF4r/l3agZaIyitkJqUy
   TqDLFbeiSxEAezvOfHgwU9wwBHcfWDYO3BoEcP0oT11YK1KaKKfpVI+a3
   w/OGd3G5TmKISEuwPoKYtkIMmRhgLr9dcTlwc9TJORG+aSPsxCWaQYYi6
   +KQ8vhP5OjHgKmecfpV3yBU/AjhKwHYgigtleJmqN8Cd/mYPBzkollMGC
   CSGygZCf5V/596eI/vzN9EEnHU7eyRM2jw7K/sjlUa3MRWZt/CocdZG//
   FCUC61E22Wbl1xE0WQzn/Iwy0dhuBgNnh9BY9iCfgKXlmPHjDmWop3kSU
   A==;
X-CSE-ConnectionGUID: W+4qvDkkSnyz8YdpiyddXw==
X-CSE-MsgGUID: d64++RPVS9ut/ej7OObRuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68086559"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="68086559"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 06:03:58 -0700
X-CSE-ConnectionGUID: AJXlx1KVRj2l94fMLun1lg==
X-CSE-MsgGUID: HEeulH+3Qo2CJjHsJ9TVxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165655246"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 08 Aug 2025 06:03:56 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukMkv-0003xu-1O;
	Fri, 08 Aug 2025 13:03:39 +0000
Date: Fri, 8 Aug 2025 21:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 358/801]
 arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@4809c000 (ti,omap2-hsmmc):
 dma-names:0: 'rx' was expected
Message-ID: <202508082024.n76eVptC-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: c146041c939a120fd98dd208a992c1c1277a0b21 [358/801] dt-bindings: mmc: Convert ti-omap-hsmmc to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-054-20250807 (https://download.01.org/0day-ci/archive/20250808/202508082024.n76eVptC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508082024.n76eVptC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508082024.n76eVptC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/mcbsp@48076000: failed to match any schema with compatible: ['ti,omap2430-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/mcbsp@4808c000: failed to match any schema with compatible: ['ti,omap2430-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/mcbsp@4808e000: failed to match any schema with compatible: ['ti,omap2430-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/mcbsp@48096000: failed to match any schema with compatible: ['ti,omap2430-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@4809c000 (ti,omap2-hsmmc): 'bus-width', 'pbias-supply', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@4809c000 (ti,omap2-hsmmc): 'ti' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@4809c000 (ti,omap2-hsmmc): 'hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@4809c000 (ti,omap2-hsmmc): dma-names:0: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@4809c000 (ti,omap2-hsmmc): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@480b4000 (ti,omap2-hsmmc): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@480b4000 (ti,omap2-hsmmc): 'ti' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@480b4000 (ti,omap2-hsmmc): 'hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@480b4000 (ti,omap2-hsmmc): dma-names:0: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@480b4000 (ti,omap2-hsmmc): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: timer@0 (ti,omap2420-timer): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/usb_otg_hs@480ac000: failed to match any schema with compatible: ['ti,omap2-musb']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/wdt@49016000: failed to match any schema with compatible: ['ti,omap2-wdt']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
