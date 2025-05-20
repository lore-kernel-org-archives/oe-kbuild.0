Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ACE1EA7C9
	for <oe-kbuild@lists.linux.dev>; Tue, 20 May 2025 14:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751586; cv=none; b=X4wuDH/Oe04LL3Y/4X3t4Qd0aShGprk1sILn3eNlJ4C3Fmc9kt2gjuW4G6LDKFx73KW+CXqd4X63vU9gpSAuT4ipHohdo0Ebd7qgVFgMmO/FinOuusbAaMvOXh/kSS1uNfEp8mMEfsXFGE9ybr9ZgkKtnxk8g4sQVIT97TMKQ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751586; c=relaxed/simple;
	bh=PaAJvbqiZeyFNQVkYHV3JGmwI8Z4bS81z1vytYZRUCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pYa/7udrMaMhXB1etWwBgpVxIVIoypAwzzDFdzamcgVXUszJIw6DizcTG/wYJ8JTSAe4aTlHKCwu8MeX5lNTLO/uGd55ycssUYyYxspWo6hGtT4Ab181DhFqsjhM2mGQznmWw9i6vrbcO/hrsNJciOvQc9ErBVUzEfEB04RHO6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VplXA1Zo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VplXA1Zo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747751578; x=1779287578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PaAJvbqiZeyFNQVkYHV3JGmwI8Z4bS81z1vytYZRUCI=;
  b=VplXA1ZowpSa6C5X0uCJoEERjit1sUpdUw0YvmrswGR4KD6/phuJ6o19
   vaT8y/Kgf/zAxSuEUG9kPnd6+uOCQe+tpBawZXyHFZUWioME8pr4LcsTO
   Clpqrg8wD0zYhxdu9c5kWZ6NZz058CWL5M7aLLoraGJqRY4CQskhEVlq9
   KoJ79q3W/GWWITMW0VV7egCi3Ro+8LLcB+G+5DQF7WSUKup3fkD4ltigx
   A8O7kYnw/qf39BIbzzjomrl8uDkUOZsVPFJqy66coUMXYEvkjGmWl9lsA
   DUDe5V/h10vGR7VHf83NMw9QhrLfXaDrIu1JdSra4eFCHhqynr4SvQTC0
   w==;
X-CSE-ConnectionGUID: 6X7/mweURk2Zk3lRCQuQjw==
X-CSE-MsgGUID: 6Z4GHeoRS0OitL6kKyStBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="75091316"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="75091316"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:32:58 -0700
X-CSE-ConnectionGUID: 8oL2jPSWRsy7qHHGEis1Jw==
X-CSE-MsgGUID: wnmFLq4bR6SeIwCmqsk3cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140637712"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa008.jf.intel.com with ESMTP; 20 May 2025 07:32:55 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHO1V-0000yd-2O;
	Tue, 20 May 2025 14:32:53 +0000
Date: Tue, 20 May 2025 22:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [abelvesa:clk/imx 11/11]
 arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb:
 clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k',
 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
Message-ID: <202505202228.XVWwxLX2-lkp@intel.com>
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
TO: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: Abel Vesa <abel.vesa@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git clk/imx
head:   6a55647af3334f1d935ece67de4a838a864b53fc
commit: 6a55647af3334f1d935ece67de4a838a864b53fc [11/11] dt-bindings: clock: imx8m-clock: add PLLs
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2052-20250513 (https://download.01.org/0day-ci/archive/20250520/202505202228.XVWwxLX2-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505202228.XVWwxLX2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505202228.XVWwxLX2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[28], [29], [30], [31], [32], [33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[28], [29], [30], [31], [32], [33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[21], [22], [23], [24], [25], [26]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[21], [22], [23], [24], [25], [26]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[21], [22], [23], [24], [25], [26]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[21], [22], [23], [24], [25], [26]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[25], [26], [27], [28], [29], [30]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[25], [26], [27], [28], [29], [30]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[28], [29], [30], [31], [32], [33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[28], [29], [30], [31], [32], [33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[25], [26], [27], [28], [29], [30]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[25], [26], [27], [28], [29], [30]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts:48.9-58.5: Warning (graph_child_address): /connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts:361.14-467.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts:311.14-418.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts:277.14-364.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts:330.14-411.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[28], [29], [30], [31], [32], [33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[28], [29], [30], [31], [32], [33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[33], [34], [35], [36], [37], [38]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[33], [34], [35], [36], [37], [38]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[28], [29], [30], [31], [32], [33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[28], [29], [30], [31], [32], [33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[33], [34], [35], [36], [37], [38]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[33], [34], [35], [36], [37], [38]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[20], [21], [22], [23], [24], [25]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[20], [21], [22], [23], [24], [25]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[21], [22], [23], [24], [25], [26]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[21], [22], [23], [24], [25], [26]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:794.26-806.7: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/spba-bus@30800000/spi@30820000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[20], [21], [22], [23], [24], [25]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[20], [21], [22], [23], [24], [25]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[20], [21], [22], [23], [24], [25]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[20], [21], [22], [23], [24], [25]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[20], [21], [22], [23], [24], [25]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[20], [21], [22], [23], [24], [25]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts:309.14-416.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39], [40], [41], [42], [43]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39], [40], [41], [42], [43]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[51], [52], [53], [54], [55], [56]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[51], [52], [53], [54], [55], [56]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[40], [41], [42], [43], [44], [45]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[40], [41], [42], [43], [44], [45]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[40], [41], [42], [43], [44], [45]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[40], [41], [42], [43], [44], [45]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[53], [54], [55], [56], [57], [58]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[53], [54], [55], [56], [57], [58]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[33], [34], [35], [36], [37], [38]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[33], [34], [35], [36], [37], [38]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39], [40], [41], [42], [43]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39], [40], [41], [42], [43]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[39], [40], [41], [42], [43], [44]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[39], [40], [41], [42], [43], [44]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[36], [37], [38], [39], [40], [41]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[36], [37], [38], [39], [40], [41]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[41], [42], [43], [44], [45], [46]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[41], [42], [43], [44], [45], [46]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[45], [46], [47], [48], [49], [50]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[45], [46], [47], [48], [49], [50]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39], [40], [41], [42], [43]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39], [40], [41], [42], [43]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[43], [44], [45], [46], [47], [48]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[43], [44], [45], [46], [47], [48]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39], [40], [41], [42], [43]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39], [40], [41], [42], [43]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[43], [44], [45], [46], [47], [48]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[43], [44], [45], [46], [47], [48]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39], [40], [41], [42], [43]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39], [40], [41], [42], [43]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[36], [37], [38], [39], [40], [41]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[36], [37], [38], [39], [40], [41]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[41], [42], [43], [44], [45], [46]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[41], [42], [43], [44], [45], [46]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[41], [42], [43], [44], [45], [46]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[41], [42], [43], [44], [45], [46]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
