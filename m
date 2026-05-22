Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF37E37998A
	for <oe-kbuild@lists.linux.dev>; Fri, 22 May 2026 16:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466478; cv=none; b=m85/mqNXC328zcI3BPX6QzVpdaSImcsT1Hpu3Rto28hV/sQwnkX93lVy0XGY948aN/M+Kez7kdGrJeprDly9+zgzwvmrC0kyLl6jMg0rLFvsaPL96pcSzr4xHUpq2G80EJsyjJJlSygOr8J6GFatHk02FkvteAM4/aIUKOHAyFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466478; c=relaxed/simple;
	bh=8+16mzScJbh2lwV1J7DkI1CKwz1yJ0pynH8//9oTnvY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iWd7VNVk3XRUAuXpF1wDuuq0DeF5OqfvnMX8gmWKyw3BF/7Wo3h+iTvs+IErYNYvN57uxl/Yz/6g7qGyerJmK5b1oFNjI/WUJ9jGExroGWWcBYlk0G52JVpKeYll7MmtYbTE/kXpnjaro6MWibt5nus/LMHDuhXEN5IIM+xpHJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d22DybZU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d22DybZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779466473; x=1811002473;
  h=date:from:to:cc:subject:message-id;
  bh=8+16mzScJbh2lwV1J7DkI1CKwz1yJ0pynH8//9oTnvY=;
  b=d22DybZUg7Td345BF8ZW9JaZjgGn+M3u67sif32lJZnqRH0sL5Jnmvbx
   l7pfMLyvbiEikv3EITyvnT8p3mO3c0rLVbhovk7Y+uXlafTIFB//V8yMl
   6C8W7tvjIRdyjJDRHnafJq+zjxz32KrZ3vP55GG3sZO3vvhBwNM88YEz4
   ekVeTMIzgfRz9NsabZzsaW/dCbcX0uuW3lCdvWdv4aG1GlYP1K8wP1l5e
   +7UtDjVB2Jy6Y/I6R/Zl7uvzurkUfvGycD3lAEwIyzvFzAMngqx0TuR9h
   OA8hIgkgJzoyMkleKUbTMRh0XTJE4++cyZ8UPgeSJbcazPbFurJf0GrXj
   Q==;
X-CSE-ConnectionGUID: qogM4dr6T3ywPyH5WuqYIg==
X-CSE-MsgGUID: FmltOjtQS+qGwMUVZniaEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="79549201"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="79549201"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 09:14:32 -0700
X-CSE-ConnectionGUID: BErLHwmYTA+U89qoarjRlQ==
X-CSE-MsgGUID: +KW8D73OT+ehWca2kHwqZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="234597124"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 22 May 2026 09:14:30 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQSW4-00000000BO5-15TV;
	Fri, 22 May 2026 16:14:28 +0000
Date: Fri, 22 May 2026 18:14:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 23/114]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: aliases: 'disp0_piodma' does not
 match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
Message-ID: <202605221855.MYFvbKUb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 7a9b557bc6864063b525d75a613fa2ebc3ae4025 [23/114] arm64: apple: t8103: Add display controller related device tree nodes
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260522/202605221855.MYFvbKUb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221855.MYFvbKUb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605221855.MYFvbKUb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-j274.dts:110.14-119.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j274.dts:121.14-130.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:567.30-572.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:536.22-565.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: mbox@231c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('ti,sdout-zero-fill' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VCP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
--
   arch/arm64/boot/dts/apple/t8103-j293.dts:252.14-262.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j293.dts:264.14-273.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:567.30-572.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:536.22-565.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: mbox@231c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j293', 'apple,panel']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j293', 'apple,panel']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,pdm-slot-no' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,pdm-slot-no', 'ti,sdout-pull-down' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
--
   arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2c8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2d0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2d8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2e0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /sound: failed to match any schema with compatible: ['apple,j293-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /sound: failed to match any schema with compatible: ['apple,j293-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8103-j313.dts:148.14-157.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j313.dts:159.14-168.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:567.30-572.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:536.22-565.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: mbox@231c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j313', 'apple,panel']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j313', 'apple,panel']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-zero-fill' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-zero-fill' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
--
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2c8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2d0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2d8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2e0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /sound: failed to match any schema with compatible: ['apple,j313-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /sound: failed to match any schema with compatible: ['apple,j313-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8103-j456.dts:124.14-133.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:567.30-572.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:536.22-565.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: mbox@231c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j456', 'apple,panel']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j456', 'apple,panel']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: codec@48 (cirrus,cs42l83): 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: codec@48 (cirrus,cs42l83): 'VCP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: codec@48 (cirrus,cs42l83): 'VD_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: codec@48 (cirrus,cs42l83): 'VL-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
--
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2c8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2d0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2d8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2e0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /sound: failed to match any schema with compatible: ['apple,j456-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /sound: failed to match any schema with compatible: ['apple,j456-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8103-j457.dts:105.14-114.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:567.30-572.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:536.22-565.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: mbox@231c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j457', 'apple,panel']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j457', 'apple,panel']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48 (cirrus,cs42l83): 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48 (cirrus,cs42l83): 'VCP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48 (cirrus,cs42l83): 'VD_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48 (cirrus,cs42l83): 'VL-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
--
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2c8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2d0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2d8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2e0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /sound: failed to match any schema with compatible: ['apple,j457-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /sound: failed to match any schema with compatible: ['apple,j457-macaudio', 'apple,macaudio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
