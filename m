Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F152222D3
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 07:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913286; cv=none; b=alxRAo/VNpU+toJSBBHIg3mms+rY1Q5jBQgXK6k0Fj9jK1qPFNSAKDLkhY5XGsE+SP7zCYi+gyZgUxqOMtkXNrdzpUJdh5uJxItTybSpSrPZMujH/ClSSSEHHsvSOUISvTiAvgEJCFVviHDdqS688bE1DNv9+bXEwxoxWgNIZx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913286; c=relaxed/simple;
	bh=97KvG57mB2JoDyipZMnG4uHFUkMm3R6DgMZEtMiUB0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N0AKmMA/GmrbN1iXd33YfEwjLtnhDE+k7810RRymOibPvSq8I9A0J6SjEOC/ps9hbl4Co0wjhqg2RruXCswiwumuIZEFLSnQoeOWcoAtzw2bWpYQOri1yBpY5RrEAB9FKgSDCNsDk0cCPaQ7tGNunvhpYeln6e3Mb9BZ8YaRyXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQBUg2cV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQBUg2cV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745913285; x=1777449285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=97KvG57mB2JoDyipZMnG4uHFUkMm3R6DgMZEtMiUB0E=;
  b=MQBUg2cV5g7iEZxo9Bh7+9WUHmfLPjxnnys5a1R1Z05uH68lvNc//2Xl
   B21+KnQO6tDsRHBqC0/n6pHUuDkTDCCPCkKBaMmxCUyFZRg1vaCmI/ruL
   r9lxdc0EOa8gvZb4qecxLdoUjUVUwlRSNxL/CT+d0XCT9LutwULNAL2a9
   S/cpNWypiTP7TgAr+Uyv86+1nNMK8i39WKpo+/Lh4FBzfC1clI/Zxskf1
   pSW8ksO27NicOdRqo5v7yoAGyPIIrLDrYOm/p5IZWQ+WpR9m3wvAzziRa
   DLDW9KEO/0wQoqprzJwz9vsO+eiMheTizWc3sK+l1ks4fL4Fjf8tH754N
   w==;
X-CSE-ConnectionGUID: dZ6ydUblS/uI/7jBTsjMwA==
X-CSE-MsgGUID: OC45n8r5SDSsVZaWABKhwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58896157"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="58896157"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 00:54:45 -0700
X-CSE-ConnectionGUID: rRSQyd8gQvCVOaNwy/H1uQ==
X-CSE-MsgGUID: Vl5EexcsTt2WRYJtf7nA5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="170985934"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Apr 2025 00:54:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9fnc-0000Z6-2X;
	Tue, 29 Apr 2025 07:54:40 +0000
Date: Tue, 29 Apr 2025 15:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 3/23]
 arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: cpu@0 (arm,cortex-a53):
 'cpu-release-addr' is a required property
Message-ID: <202504291522.IEUvANXM-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   10fc30eaf381cc8a6351129d7a48c4bf979f6002
commit: 273fc608bdabf8e42457518a310b2475dfa4f5b9 [3/23] dt-bindings: arm/cpus: Add schemas for "enable-method" dependencies
:::::: branch date: 4 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291522.IEUvANXM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504291522.IEUvANXM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504291522.IEUvANXM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/microchip/sparx5.dtsi:104.21-483.4: Warning (unit_address_vs_reg): /axi@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/microchip/sparx5.dtsi:124.30-138.5: Warning (unique_unit_address_if_enabled): /axi@600000000/syscon@600000000: duplicate unit-address (also used in node /axi@600000000/switch@600000000)
>> arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: cpu@0 (arm,cortex-a53): 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: cpu@1 (arm,cortex-a53): 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: syscon@600000000 (microchip,sparx5-cpu-syscon): mux-controller:#mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: mux-controller (mmio-mux): #mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: spi@600104000 (microchip,sparx5-spi): num-cs: 16 is greater than the maximum of 4
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: spi@600104000 (microchip,sparx5-spi): Unevaluated properties are not allowed ('reg-shift' was unexpected)
--
   arch/arm64/boot/dts/microchip/sparx5.dtsi:104.21-483.4: Warning (unit_address_vs_reg): /axi@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/microchip/sparx5.dtsi:124.30-138.5: Warning (unique_unit_address_if_enabled): /axi@600000000/syscon@600000000: duplicate unit-address (also used in node /axi@600000000/switch@600000000)
>> arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: cpu@0 (arm,cortex-a53): 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: cpu@1 (arm,cortex-a53): 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: syscon@600000000 (microchip,sparx5-cpu-syscon): mux-controller:#mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: mux-controller (mmio-mux): #mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: spi@600104000 (microchip,sparx5-spi): spi@e:reg:0:0: 14 is greater than the maximum of 3
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: spi@600104000 (microchip,sparx5-spi): num-cs: 16 is greater than the maximum of 4
--
   arch/arm64/boot/dts/microchip/sparx5.dtsi:104.21-483.4: Warning (unit_address_vs_reg): /axi@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/microchip/sparx5.dtsi:124.30-138.5: Warning (unique_unit_address_if_enabled): /axi@600000000/syscon@600000000: duplicate unit-address (also used in node /axi@600000000/switch@600000000)
>> arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: cpu@0 (arm,cortex-a53): 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: cpu@1 (arm,cortex-a53): 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: syscon@600000000 (microchip,sparx5-cpu-syscon): mux-controller:#mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: mux-controller (mmio-mux): #mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: spi@600104000 (microchip,sparx5-spi): num-cs: 16 is greater than the maximum of 4
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: spi@600104000 (microchip,sparx5-spi): Unevaluated properties are not allowed ('reg-shift' was unexpected)
--
   arch/arm64/boot/dts/microchip/sparx5.dtsi:104.21-483.4: Warning (unit_address_vs_reg): /axi@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/microchip/sparx5.dtsi:124.30-138.5: Warning (unique_unit_address_if_enabled): /axi@600000000/syscon@600000000: duplicate unit-address (also used in node /axi@600000000/switch@600000000)
>> arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: cpu@0 (arm,cortex-a53): 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: cpu@1 (arm,cortex-a53): 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: syscon@600000000 (microchip,sparx5-cpu-syscon): mux-controller:#mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: mux-controller (mmio-mux): #mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: spi@600104000 (microchip,sparx5-spi): spi@e:reg:0:0: 14 is greater than the maximum of 3
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: spi@600104000 (microchip,sparx5-spi): num-cs: 16 is greater than the maximum of 4
--
   arch/arm64/boot/dts/microchip/sparx5.dtsi:104.21-483.4: Warning (unit_address_vs_reg): /axi@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/microchip/sparx5.dtsi:124.30-138.5: Warning (unique_unit_address_if_enabled): /axi@600000000/syscon@600000000: duplicate unit-address (also used in node /axi@600000000/switch@600000000)
>> arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: cpu@0 (arm,cortex-a53): 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: cpu@1 (arm,cortex-a53): 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: syscon@600000000 (microchip,sparx5-cpu-syscon): mux-controller:#mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: mux-controller (mmio-mux): #mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: spi@600104000 (microchip,sparx5-spi): num-cs: 16 is greater than the maximum of 4
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: spi@600104000 (microchip,sparx5-spi): Unevaluated properties are not allowed ('reg-shift' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
