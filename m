Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93201383C76
	for <oe-kbuild@lists.linux.dev>; Fri, 22 May 2026 21:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779485316; cv=none; b=M2vInS5788Kh7IQge2ORFgjEQOSiEsXAwvDGFwzcwqD2bu4FEv8ObqkzyVCmaog1Fj3AIuA/5CqS4vLRdkSeUUTl+yfYAan5RqFRJvSbEaxKZFTY6g1llj4nHQlECWUVyDOWs8v2nn5nN1vAUCEgWZ/tat3ptOlrr9YP36WIR+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779485316; c=relaxed/simple;
	bh=x4A6sUTw4bs9TkSCp1879ifAbyBbyZCJCoe5MCTifj8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k/0s7xMvptEuNPigQi/DRi2Z+qT/VBumWmZR/Jj4TUrNn/xSwTQpqsofDepNtCC7eTc+cRZ8ivgtgnS59A5s4o0nwowNd0IiaHRKUO//VpH/fFhBkZupyZG0GWMy8Fulw18TYM2MV+3PSClZzASBQI4e6FFdPL0EKssSMpRoPIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LljA9XHB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LljA9XHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779485313; x=1811021313;
  h=date:from:to:cc:subject:message-id;
  bh=x4A6sUTw4bs9TkSCp1879ifAbyBbyZCJCoe5MCTifj8=;
  b=LljA9XHBlrU+NQvnIzXsMrcl/0oeZPjXy4lEEIugNBKeggUlsv0iKgC7
   8cS0lHtYJqkg7+k5fzmyOZnRTBYXc9yRJ+gy6nj6I/q7+lmJu+hk1uFZp
   U4Qf1OYrgbhb3HFQmU5NtPT67CJCZMZrUZCT38Bus4+rgknTB38eLIqLD
   DsXkCJstV3VZSzQOx1SYG419st+iEGEJ+jZa4q/iTKdwFEiR1WDMqhWJL
   rvJoSpu/f32DjeX/jHX7D84eLD3V444K1HUSeaS6Tm0DKK0QXfSSnzQ9E
   J1wSCF+FxAvGuH99iTgX/Moh1zD5gAg8naiCDrKR6do3nFoNwm3IeTYWM
   w==;
X-CSE-ConnectionGUID: ud5W0u2dRwSDfxsgX05uPA==
X-CSE-MsgGUID: VxEguKZSSI2z12lLW5DiOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="79567726"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="79567726"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 14:28:33 -0700
X-CSE-ConnectionGUID: StxoOQ8nShqnkX54vwe79w==
X-CSE-MsgGUID: QvVH4IkLSSSmOW9PvczNsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="237986438"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 22 May 2026 14:28:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQXPx-00000000BPd-3c9j;
	Fri, 22 May 2026 21:28:29 +0000
Date: Fri, 22 May 2026 23:27:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 24/114]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: aliases: 'disp0_piodma' does not
 match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
Message-ID: <202605222352.kqH4XofO-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 02b59d6f6dfa27c839c0ab42a8553b7624ceeaa1 [24/114] arm64: apple: t600x: Add display controller related device tree nodes
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260522/202605222352.kqH4XofO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605222352.kqH4XofO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605222352.kqH4XofO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:506.14-520.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:522.14-531.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:219.29-224.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:191.21-217.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   panel: size (25) error for type phandle
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j314', 'apple,panel-mini-led', 'apple,panel']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j314', 'apple,panel-mini-led', 'apple,panel']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j314', 'apple,panel-mini-led', 'apple,panel']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:506.14-520.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:522.14-531.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:219.29-224.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:191.21-217.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   panel: size (25) error for type phandle
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j314', 'apple,panel-mini-led', 'apple,panel']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j314', 'apple,panel-mini-led', 'apple,panel']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j314', 'apple,panel-mini-led', 'apple,panel']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3a (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3a (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:506.14-520.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:522.14-531.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:219.29-224.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:191.21-217.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   panel: size (25) error for type phandle
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j316', 'apple,panel-mini-led', 'apple,panel']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j316', 'apple,panel-mini-led', 'apple,panel']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j316', 'apple,panel-mini-led', 'apple,panel']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3a (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3a (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:506.14-520.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:522.14-531.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:219.29-224.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:191.21-217.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   panel: size (25) error for type phandle
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j316', 'apple,panel-mini-led', 'apple,panel']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j316', 'apple,panel-mini-led', 'apple,panel']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j316', 'apple,panel-mini-led', 'apple,panel']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3a (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3a (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
--
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:395.14-404.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:406.14-415.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:219.29-224.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:191.21-217.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: pcie@590000000 (apple,t6000-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
--
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:395.14-404.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:406.14-415.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:219.29-224.4: Warning (simple_bus_reg): /soc@200000000/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:191.21-217.4: Warning (avoid_unnecessary_addr_size): /soc@200000000/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: soc@200000000 (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: pcie@590000000 (apple,t6000-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000 (apple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
