Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2672E271A94
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Aug 2025 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322376; cv=none; b=lPDkTzxJbEArCl+tMxlzqKnDzhfUlasIUlhUtPAxpqbPCDZqatiQ0BOC48pxWIa3JNN+To+f+ZdmXV63TzynXbRdQLsy6SOkrO7wrQdxIhIg3RbXWrLPynpGAfCkv5dCa5+gfHhc8O8+iNvfY0MvjnMXkkI9eq0dD1Vp2nRPOgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322376; c=relaxed/simple;
	bh=yHOPOATrJPv8nBya9C77nSN7Z6920CBxHypor3VjPhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ov5AhbhiGfEmx5WjD1Xxbm1G+wwbxMjSQsKz48Q2LxojH933bthLrb2JBxWOgRuHttfAD+Qrxk+/SV5H3PWSVI1GqVhEiXLHz2VMEmHuBFs6zA7Cjh09drl7ifjW0vzQp55R9JELiz1cM+JdX8dm1JM7M6TCJ8Wdoqa90oW6wMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9w0YvpV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9w0YvpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754322373; x=1785858373;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yHOPOATrJPv8nBya9C77nSN7Z6920CBxHypor3VjPhI=;
  b=e9w0YvpVnmteX7XTFV1+IV0qs/Qk1K3QzihD13CBAx+4ji3Lx06W5k51
   +Lq/lRAn/0z1BwSAllXl4kOHkWwbIo6EQ2uE8wlGZQgj1+o2yOgqKYHng
   +GFUb/XoeCCIxw4KGDLun1anY7RTJA5k8dEm2thDC0ClNetIDZAmIPosl
   EexOs/jhkmU/3MIfXpKkYzlnma13oAtOWrbE6zeF2Xg64bOmoaGrfTn7g
   XhunD18W27L6kz3blWCT8JvEbDYF9dY8ZkwQh2l2BQWA5zP91WG/xx5pb
   bdpy7gH80yVuY/agx7fQDjt2doOmvXPRtKQFKKpJrnYRwn+cIRgUbW+iF
   Q==;
X-CSE-ConnectionGUID: aBIVz/R1R6aS4V0ZEFoJTg==
X-CSE-MsgGUID: QvAC+rQ9SPqHdLo8MiHJEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56732899"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56732899"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 08:46:12 -0700
X-CSE-ConnectionGUID: 0tsM9XQqRE+nB8tb/v8f4Q==
X-CSE-MsgGUID: hgsYBxWNRDq81ZhnZijGxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164193902"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 04 Aug 2025 08:46:11 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uixO2-00006h-10;
	Mon, 04 Aug 2025 15:46:07 +0000
Date: Mon, 4 Aug 2025 23:45:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:asahi-wip 4/208]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b (ti,sn012776):
 compatible: ['ti,sn012776', 'ti,tas2764'] is too long
Message-ID: <202508042359.yc6AOlqc-lkp@intel.com>
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

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: 42d39ba8c339379b508a1b43f759e0b5ca32bcb0 [4/208] arm64: dts: apple: t8112*: Put in audio nodes
:::::: branch date: 20 hours ago
:::::: commit date: 7 days ago
config: arm64-randconfig-052-20250804 (https://download.01.org/0day-ci/archive/20250804/202508042359.yc6AOlqc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508042359.yc6AOlqc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508042359.yc6AOlqc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112.dtsi:810.46-813.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmic@e/nvmem-layout/boot-error-count@f702: duplicate unit-address (also used in node /soc/spmi@23d714000/pmic@e/nvmem-layout/panic-count@f702)
   arch/arm64/boot/dts/apple/t8112.dtsi:429.25-438.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@39 (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /sound: failed to match any schema with compatible: ['apple,j413-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /sound: failed to match any schema with compatible: ['apple,j413-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8112-j473.dts:103.14-112.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j473.dts:114.14-123.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:810.46-813.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmic@e/nvmem-layout/boot-error-count@f702: duplicate unit-address (also used in node /soc/spmi@23d714000/pmic@e/nvmem-layout/panic-count@f702)
   arch/arm64/boot/dts/apple/t8112.dtsi:429.25-438.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@4b (cirrus,cs42l84): 'cirrus,ts-inv', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /sound: failed to match any schema with compatible: ['apple,j473-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /sound: failed to match any schema with compatible: ['apple,j473-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8112-j493.dts:188.14-207.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j493.dts:209.14-218.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:810.46-813.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmic@e/nvmem-layout/boot-error-count@f702: duplicate unit-address (also used in node /soc/spmi@23d714000/pmic@e/nvmem-layout/panic-count@f702)
   arch/arm64/boot/dts/apple/t8112.dtsi:429.25-438.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:440.26-444.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@39 (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
