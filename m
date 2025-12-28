Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A1819D065
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 08:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766911016; cv=none; b=RpUWtm8pB0XgzMtVNgpkLf21prSwEhoUv3ILOXxf7F0Uxs+ep+Dc009RMBP2Rrx3NnSQaNvAJsf47bcqqL1XEIlUw3dIGZ+11EfyZb791UHu6MkYfJAlka3mKCBhf9/JU6iIF0fSXkIkMm8bPOrTioQHeC+5P0XRwzAg6MLerD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766911016; c=relaxed/simple;
	bh=64HMmziOwrpgy1j6odsmbrle6MqHeZjxka5tmk+ohBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fbCnWm+NsezOyU72vspWFcWODmUTVAaNSqRxZAToRgm8fwOdrLhQpfkDCLvENl1yMnzZW7a5IeKV+HCl2s0KOet+qPFDS7vIw/1a0Qq8Xmt4nZD3c1zmNiOPtHT2ndK1cboOgjqbVU+LmzTuMPCWS3ZIRxvelDRr06dtdMvk5AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjyv/nUx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjyv/nUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766911014; x=1798447014;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=64HMmziOwrpgy1j6odsmbrle6MqHeZjxka5tmk+ohBE=;
  b=mjyv/nUxMm+r9KlgY17ExBHqH9YpPzUxqLDphAxhRf7s/R30AYPOF1p4
   8dNRp/VomLu44NEcluptwyKm2326N+gFWb5ZxhyHrs0Nl1U4yZQ6HyHA6
   PzwHyMvR+5zXUQvUxq75ft8ZlcKYT+OG5ScqkuvsMQ9L+My/mD4RI+xFI
   1UlxEvjwEuGkVvljXJKtE06QrWfgDHqPnpdVKdDPmPfjXTY3SHiGNxVgf
   Z7NuHj5qC32n+H508+Bpj2AmcS4QbEOeLmU3MrZXWMCXJm8p4VbCz9MeK
   HBZ26kkzWzc9/Mq9j7Wbwo5I9ZDUcsoWfDQNdaLXIN0F2QXG8dUJENljX
   A==;
X-CSE-ConnectionGUID: OITHvJ0JSpaGfv3YHJ2TEg==
X-CSE-MsgGUID: mk5xO1NOQKGQvdP0c0lG3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="68548018"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="68548018"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 00:36:52 -0800
X-CSE-ConnectionGUID: gdqTYjijTom/fAc8fiv6ZA==
X-CSE-MsgGUID: w5xbiWcuRZiay6jESHNNqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="201151320"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 28 Dec 2025 00:36:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZmGe-000000007S8-2FXT;
	Sun, 28 Dec 2025 08:36:48 +0000
Date: Sun, 28 Dec 2025 09:36:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 28/128]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38 (ti,sn012776):
 Unevaluated properties are not allowed ('SDZ-supply',
 'ti,sdout-force-zero-mask' were unexpected)
Message-ID: <202512280936.h4rVLloW-lkp@intel.com>
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
CC: James Calligeros <jcalligeros99@gmail.com>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: f72a75efa62b92dba271ea788afd830ad1b20404 [28/128] arm64: dts: apple: t8112: Put in audio nodes
:::::: branch date: 5 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/archive/20251228/202512280936.h4rVLloW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512280936.h4rVLloW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512280936.h4rVLloW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112-j413.dts:171.14-181.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j413.dts:183.14-192.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@39 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/apple/t8112-j415.dts:193.14-207.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j415.dts:209.14-218.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@39 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3a (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3a (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3b (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3b (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3c (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3c (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3d (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3d (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/apple/t8112-j493.dts:226.14-236.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j493.dts:238.14-247.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:503.26-507.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@39 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
