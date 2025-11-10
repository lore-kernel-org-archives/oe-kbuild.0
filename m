Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD6F1A58D
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Nov 2025 00:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762734835; cv=none; b=LS8Dk7OWtTyak+3aRH+iQZ9VVu+4ZWDG6WI+ESQaDFHrrZWc3Rrj4sVYLtaU+WHonwqw/ImLFMVmiORD7eTGqe5HZwA3E3FNdGuqvw13H/5abVHSvsEaHn7RtSS69u3sVF61DSKSthcT8N24weA1ljL+YzrpyPU0r7u9wlGFjxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762734835; c=relaxed/simple;
	bh=jd8lfHdLSGZrpZkRxjFhMnnby2XDmDKf6QZgJfBljt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kZMmGTefrOVFdbmWJU29joJ9kYEEcqGqMSycr4eAVr9N3R7PSWHyFSa3ycWWvfXI/nmAHTR9OUPgj0lhv1YuKC5uoSHoN3RmcRATbTNeAJLDNqudIRYVgzDiELI1Lbn1fFpQpiDG+U2aTdSrSa5UJ3KrvTDB7XcYU8Y0hZFvrek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbtONt+q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbtONt+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762734833; x=1794270833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jd8lfHdLSGZrpZkRxjFhMnnby2XDmDKf6QZgJfBljt8=;
  b=MbtONt+qeF1VLG5fECUGwzT4ZUNs/GuPTlMvj1yLrCrT1Trp88twUFmW
   9UjEIba+nnTQ/UcNi1Mv2ZWqT7OL4LTBaV6nMSk6LXGettmxYZsRRSDqQ
   HABC8k55jYudQTvOXGIrZgjSHLlNSpF/YtSaVZf7IfUFLxHY326DWzENg
   ZS9atH0nSDRYOJQquUKn9pHkqWXMaQjb7wj3Olc0AH79lYY3bcLzEvYhy
   XytAik3m0r9UnBq5aUpEUoXfAh7MnHQ+Idrqj34QU62SUgiS1H5vaD16R
   zIYWOt7ExsTZfdSViGYzB0HLKbn/4AWZ2F80P/QRwAuicS9DUtxBELZGw
   A==;
X-CSE-ConnectionGUID: 4OLkbbIxSf6IrSmDq1f8nw==
X-CSE-MsgGUID: uwXnTXVKS5iD4f3g/j9AUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="90257179"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="90257179"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 16:33:52 -0800
X-CSE-ConnectionGUID: 5m13n8hETVe2bQRcntSLWw==
X-CSE-MsgGUID: cHg2cvY6Th6rzUVaXrFbWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="193554461"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 09 Nov 2025 16:33:51 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vIFqv-000000003wy-1M2h;
	Mon, 10 Nov 2025 00:33:49 +0000
Date: Mon, 10 Nov 2025 01:33:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /: failed to match
 any schema with compatible: ['tplink,tl-wr1043nd-v1', 'qca,ar9132']
Message-ID: <202511100143.08KTI5Ny-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
commit: 61a6ba233fe1198e9eacc9ca1d1cbdb27f70cee5 dt-bindings: Unify "fsl,liodn" type definitions
date:   12 months ago
:::::: branch date: 83 minutes ago
:::::: commit date: 12 months ago
config: mips-randconfig-2051-20251110 (https://download.01.org/0day-ci/archive/20251110/202511100143.08KTI5Ny-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0ba7bfc34fa292a34b31f6338464744b5cad58a3)
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511100143.08KTI5Ny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511100143.08KTI5Ny-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /: failed to match any schema with compatible: ['tplink,tl-wr1043nd-v1', 'qca,ar9132']
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /: failed to match any schema with compatible: ['tplink,tl-wr1043nd-v1', 'qca,ar9132']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /interrupt-controller: failed to match any schema with compatible: ['qca,ar9132-cpu-intc', 'qca,ar7100-cpu-intc']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /interrupt-controller: failed to match any schema with compatible: ['qca,ar9132-cpu-intc', 'qca,ar7100-cpu-intc']
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: uart@18020000 (ns8250): $nodename:0: 'uart@18020000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: uart@18020000 (ns8250): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/apb/gpio@18040000: failed to match any schema with compatible: ['qca,ar9132-gpio', 'qca,ar7100-gpio']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/apb/gpio@18040000: failed to match any schema with compatible: ['qca,ar9132-gpio', 'qca,ar7100-gpio']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/apb/pll-controller@18050000: failed to match any schema with compatible: ['qca,ar9132-pll', 'qca,ar9130-pll']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/apb/pll-controller@18050000: failed to match any schema with compatible: ['qca,ar9132-pll', 'qca,ar9130-pll']
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: wdt@18060008 (qca,ar7130-wdt): $nodename:0: 'wdt@18060008' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/qca,ar7130-wdt.yaml
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: wdt@18060008 (qca,ar7130-wdt): Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qca,ar7130-wdt.yaml
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/apb/interrupt-controller@18060010: failed to match any schema with compatible: ['qca,ar9132-misc-intc', 'qca,ar7100-misc-intc']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/apb/interrupt-controller@18060010: failed to match any schema with compatible: ['qca,ar9132-misc-intc', 'qca,ar7100-misc-intc']
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar9132-spi', 'qca,ar7100-spi']
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar9132-spi', 'qca,ar7100-spi']
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/spi@1f000000/flash@0: failed to match any schema with compatible: ['s25sl064a']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /usb-phy: failed to match any schema with compatible: ['qca,ar7100-usb-phy']
--
   arch/mips/boot/dts/qca/ar9331.dtsi:263.21-274.5: Warning (simple_bus_reg): /ahb/usb@1b000100: simple-bus unit address format error, expected "1b000000"
   arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /: failed to match any schema with compatible: ['dptechnics,dpt-module']
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /interrupt-controller: failed to match any schema with compatible: ['qca,ar7100-cpu-intc']
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /ahb/apb/gpio@18040000: failed to match any schema with compatible: ['qca,ar7100-gpio']
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /ahb/apb/pll-controller@18050000: failed to match any schema with compatible: ['qca,ar9330-pll']
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /ahb/apb/interrupt-controller@18060010: failed to match any schema with compatible: ['qca,ar7240-misc-intc']
>> arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible:0: 'qca,ar7100-reset' is not one of ['qca,ar9132-reset', 'qca,ar9331-reset']
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml
>> arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible: ['qca,ar7100-reset'] is too short
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml
>> arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: switch@10 (qca,ar9331-switch): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/qca,ar9331.yaml
>> arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar7100-spi']
>> arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: w25q128@0 (winbond,w25q128): $nodename:0: 'w25q128@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
>> arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: w25q128@0 (winbond,w25q128): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /usb-phy: failed to match any schema with compatible: ['qca,ar7100-usb-phy']
--
   arch/mips/boot/dts/qca/ar9331.dtsi:263.21-274.5: Warning (simple_bus_reg): /ahb/usb@1b000100: simple-bus unit address format error, expected "1b000000"
   arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: /: failed to match any schema with compatible: ['dragino,ms14']
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: /interrupt-controller: failed to match any schema with compatible: ['qca,ar7100-cpu-intc']
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: /ahb/apb/gpio@18040000: failed to match any schema with compatible: ['qca,ar7100-gpio']
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: /ahb/apb/pll-controller@18050000: failed to match any schema with compatible: ['qca,ar9330-pll']
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: /ahb/apb/interrupt-controller@18060010: failed to match any schema with compatible: ['qca,ar7240-misc-intc']
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible:0: 'qca,ar7100-reset' is not one of ['qca,ar9132-reset', 'qca,ar9331-reset']
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible: ['qca,ar7100-reset'] is too short
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar7100-spi']
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: w25q128@0 (winbond,w25q128): $nodename:0: 'w25q128@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
>> arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: w25q128@0 (winbond,w25q128): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/mips/boot/dts/qca/ar9331_dragino_ms14.dtb: /usb-phy: failed to match any schema with compatible: ['qca,ar7100-usb-phy']
--
   arch/mips/boot/dts/qca/ar9331.dtsi:263.21-274.5: Warning (simple_bus_reg): /ahb/usb@1b000100: simple-bus unit address format error, expected "1b000000"
   arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/mips/boot/dts/qca/ar9331_omega.dtb: /: failed to match any schema with compatible: ['onion,omega']
   arch/mips/boot/dts/qca/ar9331_omega.dtb: /interrupt-controller: failed to match any schema with compatible: ['qca,ar7100-cpu-intc']
   arch/mips/boot/dts/qca/ar9331_omega.dtb: /ahb/apb/gpio@18040000: failed to match any schema with compatible: ['qca,ar7100-gpio']
   arch/mips/boot/dts/qca/ar9331_omega.dtb: /ahb/apb/pll-controller@18050000: failed to match any schema with compatible: ['qca,ar9330-pll']
   arch/mips/boot/dts/qca/ar9331_omega.dtb: /ahb/apb/interrupt-controller@18060010: failed to match any schema with compatible: ['qca,ar7240-misc-intc']
>> arch/mips/boot/dts/qca/ar9331_omega.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible:0: 'qca,ar7100-reset' is not one of ['qca,ar9132-reset', 'qca,ar9331-reset']
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml
>> arch/mips/boot/dts/qca/ar9331_omega.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible: ['qca,ar7100-reset'] is too short
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml
>> arch/mips/boot/dts/qca/ar9331_omega.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar7100-spi']
>> arch/mips/boot/dts/qca/ar9331_omega.dtb: w25q128@0 (winbond,w25q128): $nodename:0: 'w25q128@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
>> arch/mips/boot/dts/qca/ar9331_omega.dtb: w25q128@0 (winbond,w25q128): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/mips/boot/dts/qca/ar9331_omega.dtb: /usb-phy: failed to match any schema with compatible: ['qca,ar7100-usb-phy']
--
   arch/mips/boot/dts/qca/ar9331.dtsi:263.21-274.5: Warning (simple_bus_reg): /ahb/usb@1b000100: simple-bus unit address format error, expected "1b000000"
   arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /: failed to match any schema with compatible: ['openembed,som9331']
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /interrupt-controller: failed to match any schema with compatible: ['qca,ar7100-cpu-intc']
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /ahb/apb/gpio@18040000: failed to match any schema with compatible: ['qca,ar7100-gpio']
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /ahb/apb/pll-controller@18050000: failed to match any schema with compatible: ['qca,ar9330-pll']
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /ahb/apb/interrupt-controller@18060010: failed to match any schema with compatible: ['qca,ar7240-misc-intc']
>> arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible:0: 'qca,ar7100-reset' is not one of ['qca,ar9132-reset', 'qca,ar9331-reset']
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml
>> arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible: ['qca,ar7100-reset'] is too short
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml
>> arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: switch@10 (qca,ar9331-switch): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/qca,ar9331.yaml
>> arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar7100-spi']
>> arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: w25q64@0 (winbond,w25q64): $nodename:0: 'w25q64@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
>> arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: w25q64@0 (winbond,w25q64): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /usb-phy: failed to match any schema with compatible: ['qca,ar7100-usb-phy']
--
   arch/mips/boot/dts/qca/ar9331.dtsi:263.21-274.5: Warning (simple_bus_reg): /ahb/usb@1b000100: simple-bus unit address format error, expected "1b000000"
   arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: /: failed to match any schema with compatible: ['tplink,tl-mr3020']
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: /interrupt-controller: failed to match any schema with compatible: ['qca,ar7100-cpu-intc']
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: /ahb/apb/gpio@18040000: failed to match any schema with compatible: ['qca,ar7100-gpio']
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: /ahb/apb/pll-controller@18050000: failed to match any schema with compatible: ['qca,ar9330-pll']
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: /ahb/apb/interrupt-controller@18060010: failed to match any schema with compatible: ['qca,ar7240-misc-intc']
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible:0: 'qca,ar7100-reset' is not one of ['qca,ar9132-reset', 'qca,ar9331-reset']
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: reset-controller@1806001c (qca,ar7100-reset): compatible: ['qca,ar7100-reset'] is too short
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar7100-spi']
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: s25sl032p@0 (spansion,s25sl032p): $nodename:0: 's25sl032p@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: s25sl032p@0 (spansion,s25sl032p): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spansion,s25sl032p', 'jedec,spi-nor'] is too long
   	'spansion,s25sl032p' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'spansion,s25sl032p' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: s25sl032p@0 (spansion,s25sl032p): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
>> arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: /ahb/spi@1f000000/s25sl032p@0: failed to match any schema with compatible: ['spansion,s25sl032p', 'jedec,spi-nor']
   arch/mips/boot/dts/qca/ar9331_tl_mr3020.dtb: /usb-phy: failed to match any schema with compatible: ['qca,ar7100-usb-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
