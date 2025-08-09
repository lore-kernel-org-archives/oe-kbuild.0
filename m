Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6609B1F8725
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 08:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754726860; cv=none; b=OyMyWxL3A/8v5VTAj3kSAUjGwszUvbck0OOI4dnZgyhSBzNVmyeHZHP3l3cNQ8W5GSbJuHcTKetJtszG3H0ZuqKGB7Yi9rF+e+r2bi/kzU0GDCjYdzruK7ib93WHTG7pu2/D991mXBDmE67aPeR3PCk58Dez0npmug+yCu7NULc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754726860; c=relaxed/simple;
	bh=9b12Cljfp88ofGyVueMyedmFofU/oXsapTVSt3cSF1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TeVjwMNIZH/CYuTrv2y6uumVjQGVl1WDyj+NdEO+YgfGWxtYVMyHgG2c0i5kxW6yf+D0lUvG2VXvRi1gVrK8q5MHODSFY6jl06RF9oOsRhhk5TqToOHdZtHrFgdY92/5eCsXgd6y8/YLNho4fxlZPq+eSrUu6aVc8n5mjmqdwbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KScAoxyz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KScAoxyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754726858; x=1786262858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9b12Cljfp88ofGyVueMyedmFofU/oXsapTVSt3cSF1Y=;
  b=KScAoxyz/FScObsKKo+z4MI/wvhrDh4JRyQs8ldLxQAQLRMPum9TeleN
   ImL/u5otUe6ypVWM1b/fBOaNBBSfnslHoe43ytGiSfcFZRkDEAmWCal7L
   umZRWITSOnOOprU+rFeuplu6O8FYqYyeT/iv7MCz8WrdaRDyyD0wENGG2
   AYkYdoXR5slM/aqEBzLXMXTv/GEtl96RRmVQy5XmsKve9YsASGInE6HnH
   mWRwafHRyNPoarY6EmRKDCrkDKVkl6rYN/Y7V8/dKQQdTb6CNIBlY5kK1
   za7pgJf9QG/pcyis5VzkrAv80wBml/DNFqAhGUaZ4EK8+J1Ih/bcf4eIr
   A==;
X-CSE-ConnectionGUID: yvXuc6QSQBWnQVU8bqP3cg==
X-CSE-MsgGUID: JpkdjIqYSTKfw+WiI/F1kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57024461"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57024461"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 01:07:38 -0700
X-CSE-ConnectionGUID: bbI623rIQCSonJzMGoCW9g==
X-CSE-MsgGUID: MqotrkCJRZqzTa7sacsVZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196479701"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 09 Aug 2025 01:07:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukec2-0004g8-0O;
	Sat, 09 Aug 2025 08:07:34 +0000
Date: Sat, 9 Aug 2025 16:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:asahi-wip 39/208]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: soc (simple-bus):
 display-subsystem: 'ranges' is a required property
Message-ID: <202508091545.vW9exyUw-lkp@intel.com>
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

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: 80c7edb7de07c0c583576b4d954f4fe830cfe505 [39/208] arm64: dts: apple: t8112: Add dcp/disp0 nodes
:::::: branch date: 6 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-052-20250804 (https://download.01.org/0day-ci/archive/20250809/202508091545.vW9exyUw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091545.vW9exyUw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508091545.vW9exyUw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112-j413.dts:160.14-179.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j413.dts:181.14-190.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:517.30-523.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:489.22-515.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:893.46-896.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmic@e/nvmem-layout/boot-error-count@f702: duplicate unit-address (also used in node /soc/spmi@23d714000/pmic@e/nvmem-layout/panic-count@f702)
   arch/arm64/boot/dts/apple/t8112-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:438.25-447.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@231304000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@231304000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@231304000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@23130c000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@23130c000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@23130c000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: mbox@231c08000 (apple,t8112-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j413', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j413', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
--
   arch/arm64/boot/dts/apple/t8112-j473.dts:115.14-124.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j473.dts:126.14-135.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:517.30-523.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:489.22-515.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:893.46-896.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmic@e/nvmem-layout/boot-error-count@f702: duplicate unit-address (also used in node /soc/spmi@23d714000/pmic@e/nvmem-layout/panic-count@f702)
   arch/arm64/boot/dts/apple/t8112-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:438.25-447.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@231304000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@231304000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@231304000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@23130c000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@23130c000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@23130c000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: mbox@231c08000 (apple,t8112-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@4b (cirrus,cs42l84): 'cirrus,ts-inv', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml#
--
   arch/arm64/boot/dts/apple/t8112-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:438.25-447.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:449.26-453.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j493.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@231304000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@231304000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@231304000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@23130c000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@23130c000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@23130c000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: mbox@231c08000 (apple,t8112-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j493', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j493', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
