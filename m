Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C101E885A
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 02:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766630288; cv=none; b=mUyUCUqvk3XcC26aeGrE0LEKMvQkDPS81t0K9+RXqwOvxcbwKkVSKcESMyNIogbrTrobYnXz9TqbiJlJ1jJJofdmfTNP7IQzygsErEIZoK1986tsX70PxVlcNUBjCK6j6WJyj1tQwiK2H/UMbwzha7D/67bVoWoz/+3JezS4myI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766630288; c=relaxed/simple;
	bh=S8/3oHXWe0lx/3EOdrEj6ns4I+erCk7yObK7ITxUeDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EL0PwnPO7PIjPnDz2G6dijTF+PAUTVXC3ubkHV2FvAJIiFbh7SonTVnvwxWzJC8O0MDS+ce/yyINWDA+4PnjRopoNvMF+TXqpW6H5RQn5/fteLqtuZYCZRIklUZZVWpdfLIsnRhe/MGSwoJJ5fa7IKDRhlE8jYTfTGykFO1h308=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvuCB584; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvuCB584"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766630287; x=1798166287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S8/3oHXWe0lx/3EOdrEj6ns4I+erCk7yObK7ITxUeDg=;
  b=gvuCB584zX79X3oT2SFUHTtrGy47RJ6CeIKAIK4iWOgOm5MegymLJDHs
   LVdhdVP7IgzS78v+IHIBR3BpNzG0YrYjn4Li7b+kryAlYINpaezjdM3aN
   ic+NAlnMsySOWKEprADxpOTE1RMjGtg3siikxp/99ND5S8rUdDVn9EHyk
   4/R8wHnbKLxyCPQJMgCL8TYlEYE+lLy4HcGJ24RwB+0ZIe5rjY7DFKejd
   t0cRIVYMZBBfRVT4pG2IAl9IQb8xRUrVAxlVA9Z11HT5oNnkqhcEIXqlA
   VkJobaee74CuBWbM8zaLEmPj8vgwOd7++W0OylAULj8R+wbzzg3/g9GUc
   Q==;
X-CSE-ConnectionGUID: ln/Ba814S3G10U9+TB5mbw==
X-CSE-MsgGUID: Mz+tkpk3QRW9eeePwTOrSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68524663"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="68524663"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:38:05 -0800
X-CSE-ConnectionGUID: VSNoWlk1QASnUQCle4CdOQ==
X-CSE-MsgGUID: O60WxtgqTpySZ2qNWWH/lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="200161114"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 24 Dec 2025 18:38:04 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYbEn-000000006RY-2j2w;
	Thu, 25 Dec 2025 02:38:01 +0000
Date: Thu, 25 Dec 2025 03:37:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 10/128]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: efuse@23d2c8000
 (apple,t8112-efuses): Unevaluated properties are not allowed
 ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28',
 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@...
Message-ID: <202512250354.I0CraeLn-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: 62c539c660c695d320c897db87ea08041c225a49 [10/128] arm64: dts: apple: t8112: Add eFuses node and ATC phy fuses
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/archive/20251225/202512250354.I0CraeLn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250354.I0CraeLn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512250354.I0CraeLn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j413.dtb: efuse@23d2c8000 (apple,t8112-efuses): compatible:0: 'apple,t8112-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: efuse@23d2c8000 (apple,t8112-efuses): Unevaluated properties are not allowed ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@382f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j415.dtb: efuse@23d2c8000 (apple,t8112-efuses): compatible:0: 'apple,t8112-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: efuse@23d2c8000 (apple,t8112-efuses): Unevaluated properties are not allowed ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@382f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j473.dtb: efuse@23d2c8000 (apple,t8112-efuses): compatible:0: 'apple,t8112-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: efuse@23d2c8000 (apple,t8112-efuses): Unevaluated properties are not allowed ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@382f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:503.26-507.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j493.dtb: efuse@23d2c8000 (apple,t8112-efuses): compatible:0: 'apple,t8112-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: efuse@23d2c8000 (apple,t8112-efuses): Unevaluated properties are not allowed ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@382f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
