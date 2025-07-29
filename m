Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6C678F5E
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Jul 2025 04:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753761877; cv=none; b=H3ECBvsFEt8NneldOzsmOom6xQVmTZtxh/NZ8HlM/QMKZ688UCFGroYmHvcEqNjsdbYQ3S24/T91BqmlZgsy1k9qNQR+c6BEhwL/eKOQmu9JVFPv+41uVy7lPaaM4br9lovmyU/T8S5x7hmF4gor1fx6OTVkPj1zEEsC9q7RzxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753761877; c=relaxed/simple;
	bh=LgBHX/v0GXgf1v5O8wnWzKf2YkNGUr4ZmZ45zLXu2Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nlrvzRu+n0M0gDk44J6whJju8Z74fKT2GORpuc56ZeDDD0dPSikimF4eozvDe4Au+z76pyzVMBAUNo+ZNBCJQP/diPTuv4df3c/EBw7X9i0kN6kkC/aC4QO79BZkwmAdNZxpjSt8+08NDG4uxHfpdzEaS+OuFHhyT2FNHenyz3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtUKDlTs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtUKDlTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753761875; x=1785297875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LgBHX/v0GXgf1v5O8wnWzKf2YkNGUr4ZmZ45zLXu2Ck=;
  b=VtUKDlTsWv/onO/vG6ad1TT+Lz9MQ/eG+9xYtBDYy9HHhy2ZIK1HIQBW
   CosWyRbv2UO3huuCsYFgaUrzDlZan1h0gQBDlViaFkQrVnftx0Ajeuyn+
   9Pn9EkMqvnS43vo1I+eLp5b+Ggj1cNgmWMbyIQmISEeMat99G4qO2JIJ2
   sw89xZcSElGtKtuy+8iVbNXbg6gsVKO9gnqMRxhx5xgP2O/BIJG+fzmf1
   w98VfRYcJbrChqF9IyTRKOkwJle5m8VrgUs5SZHPs2Zb/Zxe0YoE+rmmo
   N5CTzyWBAwWOK3dhv+6cRnVgM/k1FZHKtpUu7F9eayyn4bV9sN21LILS6
   Q==;
X-CSE-ConnectionGUID: XC8M2hKFTmSx7XML6vAeVg==
X-CSE-MsgGUID: ba0xGfTkQtOpb4DDYFW7BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55991568"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="55991568"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 21:04:35 -0700
X-CSE-ConnectionGUID: 194zcdPGR6SRJvJfRkqPLw==
X-CSE-MsgGUID: j4NhFpTpSUmc+WfetfiLgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="193579885"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jul 2025 21:04:31 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugbZk-0000yB-2F;
	Tue, 29 Jul 2025 04:04:28 +0000
Date: Tue, 29 Jul 2025 12:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 10/12]
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000
 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202507291107.05UopxQa-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   e31c789756041adbe4f51a4984015876f44cc305
commit: 3ed60434557a7fd7c8474c84d0e595e03dc93128 [10/12] riscv: dts: microchip: add pinctrl node to mpfs
:::::: branch date: 12 hours ago
:::::: commit date: 18 hours ago
config: riscv-randconfig-052-20250729 (https://download.01.org/0day-ci/archive/20250729/202507291107.05UopxQa-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 15.1.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291107.05UopxQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507291107.05UopxQa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.5-24: Warning (reg_format): /soc/syscon@20002000/pinctrl@200:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs.dtsi:259.23-262.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:259.23-262.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl']
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.5-24: Warning (reg_format): /soc/syscon@20002000/pinctrl@200:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs.dtsi:259.23-262.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:259.23-262.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl']
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.5-24: Warning (reg_format): /soc/syscon@20002000/pinctrl@200:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs.dtsi:259.23-262.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:259.23-262.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl']
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.5-24: Warning (reg_format): /soc/syscon@20002000/pinctrl@200:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs.dtsi:259.23-262.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:259.23-262.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl']
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.5-24: Warning (reg_format): /soc/syscon@20002000/pinctrl@200:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs.dtsi:259.23-262.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:259.23-262.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl']
--
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.5-24: Warning (reg_format): /soc/syscon@20002000/pinctrl@200:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs.dtsi:259.23-262.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:259.23-262.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
