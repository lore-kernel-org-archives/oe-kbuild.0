Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527AE8462
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 04:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755059052; cv=none; b=DKc3D845OV/+3kxSXwZ4gUsOJPDXY9jMWX/FiihFa5SM4pLZFRzlrawZ2Ql83j11gsmUbG0yWkMz5SMTzn0XL5iVaqzaSKr2g99Ow/AEp07m7LCfzaNiFKghIy1o+XpQ4+/peLPqCd/Qh2wWHY5G6AC4VEgm7gCEA66kwMQZKzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755059052; c=relaxed/simple;
	bh=Z4MckP6SRNQujWbeFP8Lnac4a/b7PzeGQf80uPOiaOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=stq722wV1/8HjtJhv3sldZUwmBmsCo1FNsDeZTOfYlVDGmyKz+OgdLV1rtNJ1athW+1gFWtUpU+EO4Kj06QlFRN8d09CH0bPDWTaOvwGAF51h6aZAlRnB/Z+ozdv4ZOew+liBSCDNcnvyIYzW4qsD7fvNxA6+WDvmSLQg2yHl/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjz51Ptl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjz51Ptl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755059050; x=1786595050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z4MckP6SRNQujWbeFP8Lnac4a/b7PzeGQf80uPOiaOg=;
  b=mjz51PtlL95WK/sDp5S2YtyNawFmnRYw2H/PEjS1BFDdKY9PDTmrRYbQ
   J3Ctnnh8j7eawZAtkOiw3MWYkWVVMrJUIYDwgeY5UnBQpoNz7maBodGHC
   IJbUHwgDyl4PeTjCrVK06Wlde+nBvLaD/2SNHdg65Ce6ryXN/spSYpan9
   aEFSltwg43Sg8fnO8WaVWmIKUXPezRX0NbAXVOwJmeGaeXKK0oilVYtFo
   QAjCVj6ZNz2V5IaTys9rMtmZMUWyLRXrnX2ELqKbJ9LEliEvm6SoR7p42
   uD8gjChO/2VgV9XT8ZWf5qbyJ7CrHO6QufA7ZLy5uizpQKhw6cWm7/oLD
   g==;
X-CSE-ConnectionGUID: LFV12tUWRI+WyMh2xPfbpA==
X-CSE-MsgGUID: Y1FyPlARTm2tlH7PWroAPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61146211"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="61146211"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 21:24:09 -0700
X-CSE-ConnectionGUID: ZL+bcz2iTz+cVvYmFJyikA==
X-CSE-MsgGUID: Y+nCe/PvS4C3Gr4n4DH/sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="166250615"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Aug 2025 21:24:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um31w-0009Ws-1N;
	Wed, 13 Aug 2025 04:24:04 +0000
Date: Wed, 13 Aug 2025 12:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 358/801]
 arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@4809c000 (ti,omap2-hsmmc):
 'ti' is a required property
Message-ID: <202508131201.5dGssb6X-lkp@intel.com>
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
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250813/202508131201.5dGssb6X-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131201.5dGssb6X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508131201.5dGssb6X-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpmc@6e000000 (ti,omap2430-gpmc): 'ethernet@gpmc' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/gpmc@6e000000/ethernet@gpmc: failed to match any schema with compatible: ['smsc,lan91c94']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap2430-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/mcbsp@48076000: failed to match any schema with compatible: ['ti,omap2430-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/mcbsp@4808c000: failed to match any schema with compatible: ['ti,omap2430-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/mcbsp@4808e000: failed to match any schema with compatible: ['ti,omap2430-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/mcbsp@48096000: failed to match any schema with compatible: ['ti,omap2430-mcbsp']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@4809c000 (ti,omap2-hsmmc): 'bus-width', 'pbias-supply', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@4809c000 (ti,omap2-hsmmc): 'ti' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@4809c000 (ti,omap2-hsmmc): 'hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@4809c000 (ti,omap2-hsmmc): dma-names:0: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@4809c000 (ti,omap2-hsmmc): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@480b4000 (ti,omap2-hsmmc): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@480b4000 (ti,omap2-hsmmc): 'ti' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@480b4000 (ti,omap2-hsmmc): 'hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@480b4000 (ti,omap2-hsmmc): dma-names:0: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: mmc@480b4000 (ti,omap2-hsmmc): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/ti-omap-hsmmc.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: timer@0 (ti,omap2420-timer): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/usb_otg_hs@480ac000: failed to match any schema with compatible: ['ti,omap2-musb']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
