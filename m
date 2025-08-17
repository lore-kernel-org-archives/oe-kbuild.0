Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E861DDC23
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Aug 2025 21:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755466418; cv=none; b=d7NMIUzTQsKDJNRuLfULth90UqhEPpkyctoruJj1+46E+TJbV9wy33GHCa/DY6fLmO26ICk6Na8RYCIbj4y7uNpH8uP55HOOLZ1xYdIcLtAYAvzWTiLMX1FICsSwliRbEeKyat0UldS84zcMYNuuDEyTF5cIx8h8G1fFlmhOh4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755466418; c=relaxed/simple;
	bh=lcfhgHUVwynIXMj5GxRZor1em6Q3cYqSd2EsmVbTpnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R4D5c7XlcGa3mosTVTh/Jzb98BYPKDzy7PF3tsL3Da7D+hwzko882GKFq2SXqjwCABzRk5xbEL6XNOieEB7uhND+nGOg2hSiKt5aFA65Fz8n83He014n0ONnQZVnO8Nf4sq44I68O1ij+ilV/tBaC7KSvmjNKfZl3LmziCtqE2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3+LDfiN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3+LDfiN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755466416; x=1787002416;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lcfhgHUVwynIXMj5GxRZor1em6Q3cYqSd2EsmVbTpnE=;
  b=C3+LDfiNmKILUam+kJpGWyRa2DWIgrJb479LELffDqLIvxFKX+ud72qm
   q5+H35/BVF1XArVduCr0378MwY/hcSmAmWg/nkJ31iAUYFSZjZVOu8BhY
   1+gTtkeFTookVN/1J+HwOnwhsabkxtBz+xLnNVNRdmmPao6ZhwrWfJESu
   yVswB2EVQxnMgiJMsEq89vC9bqZA/q29/D11MNwZ6iBihAEPTTsiArM+Q
   V2XI0yidMSV3IvhFGV4uYO2St3cGwTEmR2lsdb0A5t4HFncWJcDYTu33e
   HWhFgbf+D933klMbNvfZXlmqM3L+Xd1npE0C5pat2E+hOWl3PwIiO2Qpc
   Q==;
X-CSE-ConnectionGUID: Z95TivdaSeeMGcuqiA13rg==
X-CSE-MsgGUID: 5k3AzEGkQoaAb01uP+mmYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57647552"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57647552"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 14:33:36 -0700
X-CSE-ConnectionGUID: 5YVgOYPXTYKUTYZ0goERfg==
X-CSE-MsgGUID: OLk+xpG8SqK9o/2VI0pG0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171863685"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 17 Aug 2025 14:33:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unl0O-000Dj7-0H;
	Sun, 17 Aug 2025 21:33:32 +0000
Date: Mon, 18 Aug 2025 05:33:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCHv2 3/3] mips: qca: use led-sources for WMAC LED
Message-ID: <202508180508.NnHzzIu9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250812192334.11651-4-rosenp@gmail.com>
References: <20250812192334.11651-4-rosenp@gmail.com>
TO: Rosen Penev <rosenp@gmail.com>
TO: linux-wireless@vger.kernel.org
CC: "Toke Høiland-Jørgensen" <toke@toke.dk>
CC: Johannes Berg <johannes@sipsolutions.net>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-mips@vger.kernel.org

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250815]
[cannot apply to ath/ath-next wireless/main wireless-next/main]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/dt-bindings-net-wireless-ath9k-add-led-bindings/20250813-032839
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250812192334.11651-4-rosenp%40gmail.com
patch subject: [PATCHv2 3/3] mips: qca: use led-sources for WMAC LED
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: mips-randconfig-052-20250818 (https://download.01.org/0day-ci/archive/20250818/202508180508.NnHzzIu9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508180508.NnHzzIu9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508180508.NnHzzIu9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts:111.3-13: Warning (reg_format): /ahb/wifi@180c0000/led:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts:110.6-113.4: Warning (unit_address_vs_reg): /ahb/wifi@180c0000/led: node has a reg or ranges property, but no unit name
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts:110.6-113.4: Warning (avoid_default_addr_size): /ahb/wifi@180c0000/led: Relying on default #address-cells value
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts:110.6-113.4: Warning (avoid_default_addr_size): /ahb/wifi@180c0000/led: Relying on default #size-cells value
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /: failed to match any schema with compatible: ['tplink,tl-wr1043nd-v1', 'qca,ar9132']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /: failed to match any schema with compatible: ['tplink,tl-wr1043nd-v1', 'qca,ar9132']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: uart@18020000 (ns8250): $nodename:0: 'uart@18020000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: uart@18020000 (ns8250): clock-names:0: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: uart@18020000 (ns8250): clock-names: ['uart'] is too short
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: uart@18020000 (ns8250): clock-names: 'oneOf' conditional failed, one must be fixed:
   	['uart'] is too short
--
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts:100.3-13: Warning (reg_format): /ahb/wifi@18100000/led:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts:99.6-101.4: Warning (unit_address_vs_reg): /ahb/wifi@18100000/led: node has a reg or ranges property, but no unit name
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts:99.6-101.4: Warning (avoid_default_addr_size): /ahb/wifi@18100000/led: Relying on default #address-cells value
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts:99.6-101.4: Warning (avoid_default_addr_size): /ahb/wifi@18100000/led: Relying on default #size-cells value
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: /: failed to match any schema with compatible: ['dragino,ms14']
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible:0: 'qca,ar7100-reset' is not one of ['qca,ar9132-reset', 'qca,ar9331-reset']
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible: ['qca,ar7100-reset'] is too short
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar7100-spi']
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: w25q128@0 (winbond,w25q128): $nodename:0: 'w25q128@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: w25q128@0 (winbond,w25q128): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
--
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts:116.3-13: Warning (reg_format): /ahb/wifi@18100000/led:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts:115.6-117.4: Warning (unit_address_vs_reg): /ahb/wifi@18100000/led: node has a reg or ranges property, but no unit name
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts:115.6-117.4: Warning (avoid_default_addr_size): /ahb/wifi@18100000/led: Relying on default #address-cells value
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts:115.6-117.4: Warning (avoid_default_addr_size): /ahb/wifi@18100000/led: Relying on default #size-cells value
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: /: failed to match any schema with compatible: ['tplink,tl-mr3020']
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible:0: 'qca,ar7100-reset' is not one of ['qca,ar9132-reset', 'qca,ar9331-reset']
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible: ['qca,ar7100-reset'] is too short
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar7100-spi']
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: s25sl032p@0 (spansion,s25sl032p): $nodename:0: 's25sl032p@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: s25sl032p@0 (spansion,s25sl032p): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spansion,s25sl032p', 'jedec,spi-nor'] is too long

vim +111 arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts

da1fe323261f6a Rosen Penev 2025-06-08  106  
da1fe323261f6a Rosen Penev 2025-06-08  107  &wifi {
da1fe323261f6a Rosen Penev 2025-06-08  108  	status = "okay";
72362f6bb15c45 Rosen Penev 2025-08-12  109  
72362f6bb15c45 Rosen Penev 2025-08-12 @110  	led {
72362f6bb15c45 Rosen Penev 2025-08-12 @111  		reg = <9>;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
