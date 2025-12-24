Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4551DED5C
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 04:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766549152; cv=none; b=R1bIP7x4V1mDShvcvP/c42zGzCH7DIkjWeAdyI77lqwV/SN8DYtKAN2sWo4SSpPkFIg4gc4uVXMS+YO9hRz7Z0uTvyR1pYl3flldDUAwGDPsNPPoxPOBJDk4Zvs83FHp7tFelwrs2NF8U7pebIVGCG91P1zBbuHRqY0EWcNkmZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766549152; c=relaxed/simple;
	bh=ovlnzC6zii+GHpzSrk4NJFfmaUkOzqn61Doa0MvtmUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eci74xkvjfAk/cXOx3Hq1+FOZv8LrALCHI9i9PDolX2Lyve0KyLoYx3neXCSIMfT1Dcy8MLP2uJedQiiQweE04wF+fOSasJ0wtN6a6c3bT7c1KnsgCIKK5mmiqy5xxEt/zAzh+lDn90utJmNf8qyNOt4TyzVy9B3jM1a7C0UnMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDUT+uwy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDUT+uwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766549150; x=1798085150;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ovlnzC6zii+GHpzSrk4NJFfmaUkOzqn61Doa0MvtmUw=;
  b=EDUT+uwyTG95s77yjRpBV0/lGTnA5K+bO++EVAOTCbQETCcw4c3tfcis
   erW6EnwDX4i0D0w93fapEh+Gg7l7v/tolQ+t+/jPlAcsCZEYHhEyUy0bt
   YqDu6RzXA1TaYoh0YbFNs1QS8hQZu5Y0dmJS0IFTmepAsP+BpvYrDYWGg
   bUE0durGbg97QnUvFHtWGK19pNRxBbs9oPrDKkRuyl586b4xjJf5rtF/q
   LKTNQKCAN5qaGo5KR3Wpo2d4Jr4cLGumQmh9pK46R6gUPlk8B9kTndvrB
   IRLwIV6RrfQfAS3qlGpvUYMdTrsvT8du0O5O2Z4FQ1HCy4wuUDWjWw5tO
   A==;
X-CSE-ConnectionGUID: EMJ4HvMzQXy5bP5VJXnjCQ==
X-CSE-MsgGUID: +eB3HmT+TSWRoZtwAsX8Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="85812542"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="85812542"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 20:05:49 -0800
X-CSE-ConnectionGUID: 3/TXKBY4RyShEh01lbE0Cg==
X-CSE-MsgGUID: oj5t24P5SHqUSnPqGb2PMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199965692"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 23 Dec 2025 20:05:48 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYG8A-0000000066S-1Cxn;
	Wed, 24 Dec 2025 04:05:46 +0000
Date: Wed, 24 Dec 2025 05:05:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 26/128]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l):
 Unevaluated properties are not allowed ('ti,sdout-zero-fill' was unexpected)
Message-ID: <202512240507.EhM3q2xG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Martin Povišer" <povik+lin@cutebit.org>
CC: Janne Grunau <j@jannau.net>
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: ffa9a2cdd88ecf105f265f98776f925b24f016ec [26/128] arm64: dts: apple: t8103*: Put in audio nodes
:::::: branch date: 30 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/archive/20251224/202512240507.EhM3q2xG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240507.EhM3q2xG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512240507.EhM3q2xG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:121.10-125.5: Warning (unit_address_vs_reg): /soc/usb@382280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:141.10-145.5: Warning (unit_address_vs_reg): /soc/usb@502280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j274.dts:105.14-114.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j274.dts:116.14-125.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('ti,sdout-zero-fill' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VCP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VD_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VL-supply' is a required property
--
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:121.10-125.5: Warning (unit_address_vs_reg): /soc/usb@382280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:141.10-145.5: Warning (unit_address_vs_reg): /soc/usb@502280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j293.dts:237.14-247.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j293.dts:249.14-258.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:488.26-492.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,pdm-slot-no' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,pdm-slot-no', 'ti,sdout-pull-down' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VCP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VD_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VL-supply' is a required property
--
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:121.10-125.5: Warning (unit_address_vs_reg): /soc/usb@382280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:141.10-145.5: Warning (unit_address_vs_reg): /soc/usb@502280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j313.dts:133.14-142.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j313.dts:144.14-153.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-zero-fill' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-zero-fill' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): 'VCP-supply' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
