Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716D92EAE5
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 02:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754621505; cv=none; b=nINKYakFohbVLgYZljgEobWxLUolRJTmsTPc0NB+AdMO6DRlHUDa6E0WStpp03Xii5YQM3RxlB0/P1UjSlYzLabRrT1lNK+ptPuqxymc0V0EGoDEyYuPqPp1ZACHb5dOmNzmuYZzHK4mRaAkNXnEgkVaW3EaMJz8cCmkjuhuXFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754621505; c=relaxed/simple;
	bh=r98mmigBd2J4b0SJKR+7V1syADmhhMVNKUXRDW0hGgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YCO1kEjS8wJjjVccACohpucDMv64fdH68pWKHV6eyXLSo3f5iOK684cL25NCYnpyT9jht2mp3nlVLpyOPFlItZ4c36z+clWlji+L6u+AFYpw0YDhU8Y7mpFiqzAJSYkRnfItV0uNwDNZY5/jtk/VkOMn29x/N11cTyuQuYGZA30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQGK/qRz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQGK/qRz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754621500; x=1786157500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r98mmigBd2J4b0SJKR+7V1syADmhhMVNKUXRDW0hGgU=;
  b=JQGK/qRzXjd6jiuXQbt9/VbC9PH8ol0G+5wzisRA+vPZBR9C0xhOevI3
   5auU2BCpLMCYPhFWoIemRjkGIsd+3iodRf6UYWjy961gUsvwGb9/diarg
   u/NS/OP2YuZdhKNzLsFiMmI6HrIQTHNx/6aPxm7IsrIomzYbqDLpphq3k
   070Ne4/8yfY1HX9fhv78rfTjolgfsrKV3iuF81pMIqFvDG9JmnaTuOTOD
   hvg/lmaEP4h4Uctrkzu7lgko8O7693FAzawnMC02kz03pmFM1/S0LTukE
   ItSqjwMvsoN4Tuh5ci2lX5DtiTct75OxQz3aX6/Ig2dwkda/XfBYY86kx
   Q==;
X-CSE-ConnectionGUID: QGfFwwF8SASwEmbAMbueMw==
X-CSE-MsgGUID: mX1Bh3wbSa2jE7Uy6gwyOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56888381"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56888381"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 19:51:37 -0700
X-CSE-ConnectionGUID: CIRdOzojQ3S3QmbulAnXVA==
X-CSE-MsgGUID: 0SavVioESRmvxJvXD4gxIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="164732766"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2025 19:51:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukDCe-0003Tm-0C;
	Fri, 08 Aug 2025 02:51:33 +0000
Date: Fri, 8 Aug 2025 10:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:asahi-wip 27/208]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: soc (simple-bus):
 display-subsystem: 'ranges' is a required property
Message-ID: <202508081042.2KTGngLV-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: ced1985a92682971046726d28a0f6913743905b9 [27/208] arch: arm64: apple: Add display controller related device tree nodes
:::::: branch date: 4 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-052-20250804 (https://download.01.org/0day-ci/archive/20250808/202508081042.2KTGngLV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508081042.2KTGngLV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508081042.2KTGngLV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-j274.dts:113.14-122.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:503.30-508.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:473.22-501.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:847.46-850.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmic@f/nvmem-layout/boot-error-count@9f02: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmic@f/nvmem-layout/panic-count@9f02)
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:422.25-431.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:72.10-81.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:97.10-106.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: mbox@231c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml#
--
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:422.25-431.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:433.26-437.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:72.10-81.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:97.10-106.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j293.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: mbox@231c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml#
--
   arch/arm64/boot/dts/apple/t8103-j313.dts:114.14-131.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j313.dts:133.14-142.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:503.30-508.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:473.22-501.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:847.46-850.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmic@f/nvmem-layout/boot-error-count@9f02: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmic@f/nvmem-layout/panic-count@9f02)
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:422.25-431.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:72.10-81.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:97.10-106.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: mbox@231c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml#
--
   arch/arm64/boot/dts/apple/t8103-j456.dts:109.14-118.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:503.30-508.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:473.22-501.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:847.46-850.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmic@f/nvmem-layout/boot-error-count@9f02: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmic@f/nvmem-layout/panic-count@9f02)
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:422.25-431.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:72.10-81.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:97.10-106.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: mbox@231c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: codec@48 (cirrus,cs42l83): 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
--
   arch/arm64/boot/dts/apple/t8103.dtsi:473.22-501.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:847.46-850.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmic@f/nvmem-layout/boot-error-count@9f02: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmic@f/nvmem-layout/panic-count@9f02)
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:422.25-431.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:72.10-81.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:97.10-106.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j457.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: mbox@231c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48 (cirrus,cs42l83): 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48 (cirrus,cs42l83): 'VCP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
