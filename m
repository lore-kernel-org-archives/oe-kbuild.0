Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0EA14A0A8
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Apr 2025 05:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743744650; cv=none; b=n4tEhdMMVu6/ml/jW7/y9Xmp8RVJ/2Y8b3v7EHwDdRH4UVqr+2aBYUGxU1keAGYYsoHh6nMDNDwkq6V+TR51KvHPOcHDcXuQb2NY6IKlxU2Rj9ppof9NuT+YcgXHd/g1rQ0HU5HpHq8CmPnqdPhXWV74J95iSOfYumWEoPmVBAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743744650; c=relaxed/simple;
	bh=YmSnHq+qx/qcp5g6divUXY5skgvaTwn0jE5riq+HgBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H2hMvqV0w5Zp8/HRfDz/O9VASNLZDtm5n1oGGkDKr+GJ9PX0QgNVqMPN57amcz1T5ztzLlyCq3Z7Obk0EMVcACI6KLwS7VJ1mkiZcWYkdV3xyAHViUQcsk29jZHHv5CapK3dUB+8P/N5n66RmmCPGsqCEw6mmZZNZoUMW4x3/qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SH+ivvFy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SH+ivvFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743744647; x=1775280647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YmSnHq+qx/qcp5g6divUXY5skgvaTwn0jE5riq+HgBM=;
  b=SH+ivvFyvvxu2tiSNNMha9cMiPKzNhVIcvCOYC5phpcawqt30a6eXYkm
   7L88S616XKmRTkiHt8uzPouX/8Oon1Yx83aX5UpOm+7L+v45WOBeA5QyW
   F/inBk4z5IQbdvDe3uaIjGRFd+TO6syuk+jkXWj8jM7KDkkE4CHRfYj94
   s1G6a4vrJisZXWlmNBT4QX38WByTY7CZHcb7j+co3LMJFjsnf2Q2VKpz4
   JIJVRibPLN+zOyVa08XgzZgxCTLSuvkyt39Frwv+LLb+bnTYQFWTg/upM
   5uUPK4vJiSjHPzaxMAmRlJhanz2gjuxjz7K2Z8xtfFYi/0E85jDBaQhRs
   g==;
X-CSE-ConnectionGUID: XRIMPzozSdqCx5mC+1XFOw==
X-CSE-MsgGUID: J1b10G68R4yqVmQDKYj9Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45297737"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="45297737"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 22:30:45 -0700
X-CSE-ConnectionGUID: Ltmkv8l8QDmIuK2mUcHJUw==
X-CSE-MsgGUID: jyF/1eZZSW+/g1npFjQ2Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="127166904"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Apr 2025 22:30:44 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0Zda-00011J-0W;
	Fri, 04 Apr 2025 05:30:42 +0000
Date: Fri, 4 Apr 2025 13:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wsa:renesas/n1d/enablement 10/12]
 arch/arm/boot/dts/xilinx/zynq-cc108.dtb: mmc@e0100000: interrupts: [[0, 24,
 4]] is too short
Message-ID: <202504041340.w0z9oh5b-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/n1d/enablement
head:   17b4fb2aac13dc15816c7989fdf136483e900806
commit: 759d2b7a1bcb6167602aaba0b098258e847933a4 [10/12] dt-bindings: mmc: arasan,sdhci: Add Renesas RZ/N1D
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-053-20250329 (https://download.01.org/0day-ci/archive/20250404/202504041340.w0z9oh5b-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504041340.w0z9oh5b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504041340.w0z9oh5b-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: ethernet@e000b000: ethernet-phy@1: Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
>> arch/arm/boot/dts/xilinx/zynq-cc108.dtb: mmc@e0100000: interrupts: [[0, 24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/xilinx/zynq-cc108.dtb: mmc@e0101000: interrupts: [[0, 47, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: etb@f8801000: clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: etb@f8801000: clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: etb@f8801000: clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
--
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: mmc@e0100000: interrupts: [[0, 24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: mmc@e0101000: interrupts: [[0, 47, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: pinctrl@700: gpio0-default:conf: 'io-standard' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/xlnx,pinctrl-zynq.yaml#
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: pinctrl@700: sdhci0-default:conf: 'io-standard' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/xlnx,pinctrl-zynq.yaml#
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: pinctrl@700: sdhci0-default:conf-cd: 'io-standard' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/xlnx,pinctrl-zynq.yaml#
--
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-microzed.dtb: mmc@e0100000: interrupts: [[0, 24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/xilinx/zynq-microzed.dtb: mmc@e0101000: interrupts: [[0, 47, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: pinctrl@700: usb0-default:conf: 'io-standard' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/xlnx,pinctrl-zynq.yaml#
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: etb@f8801000: clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: etb@f8801000: clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
--
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/i2c@e0004000/isl9305@68: failed to match any schema with compatible: ['isil,isl9305']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: ethernet@e000b000: ethernet-phy@0: Unevaluated properties are not allowed ('device_type', 'marvell,reg-init' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
>> arch/arm/boot/dts/xilinx/zynq-parallella.dtb: mmc@e0100000: interrupts: [[0, 24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/xilinx/zynq-parallella.dtb: mmc@e0101000: interrupts: [[0, 47, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: etb@f8801000: clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: etb@f8801000: clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: etb@f8801000: clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: hdmi-tx@39: 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: hdmi-tx@39: 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: /axi/i2c@e0004000/i2c-mux@74/i2c@7/hwmon@34: failed to match any schema with compatible: ['ti,ucd9248']
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: /axi/i2c@e0004000/i2c-mux@74/i2c@7/hwmon@35: failed to match any schema with compatible: ['ti,ucd9248']
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: /axi/i2c@e0004000/i2c-mux@74/i2c@7/hwmon@36: failed to match any schema with compatible: ['ti,ucd9248']
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: ethernet@e000b000: ethernet-phy@7: Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zc702.dtb: mmc@e0100000: interrupts: [[0, 24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zc702.dtb: mmc@e0101000: interrupts: [[0, 47, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: pinctrl@700: can0-default:conf: 'io-standard' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/xlnx,pinctrl-zynq.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: pinctrl@700: gem0-default:conf: 'io-standard' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/xlnx,pinctrl-zynq.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: pinctrl@700: gem0-default:conf-mdio: 'io-standard' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/xlnx,pinctrl-zynq.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: hdmi-tx@39: 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: hdmi-tx@39: 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: hdmi-tx@39: 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: /axi/i2c@e0004000/i2c-mux@74/i2c@7/ucd90120@65: failed to match any schema with compatible: ['ti,ucd90120']
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: ethernet@e000b000: ethernet-phy@7: Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zc706.dtb: mmc@e0100000: interrupts: [[0, 24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zc706.dtb: mmc@e0101000: interrupts: [[0, 47, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: pinctrl@700: gem0-default:conf: 'io-standard' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/xlnx,pinctrl-zynq.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: pinctrl@700: gem0-default:conf-mdio: 'io-standard' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/xlnx,pinctrl-zynq.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: pinctrl@700: gpio0-default:conf: 'io-standard' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/xlnx,pinctrl-zynq.yaml#
--
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: ethernet@e000b000: ethernet-phy@7: Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: mmc@e0100000: interrupts: [[0, 24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: mmc@e0101000: interrupts: [[0, 47, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: etb@f8801000: clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: etb@f8801000: clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: etb@f8801000: clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
--
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: mmc@e0100000: interrupts: [[0, 24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: mmc@e0101000: interrupts: [[0, 47, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: etb@f8801000: clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: etb@f8801000: clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: etb@f8801000: clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
--
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: mmc@e0100000: interrupts: [[0, 24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: mmc@e0101000: interrupts: [[0, 47, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: etb@f8801000: clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: etb@f8801000: clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: etb@f8801000: clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
--
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: /axi/i2c@e0005000/clock-generator@55: failed to match any schema with compatible: ['silabs,si570']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: ethernet@e000c000: ethernet-phy@7: Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: mmc@e0100000: interrupts: [[0, 24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: mmc@e0101000: interrupts: [[0, 47, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: etb@f8801000: clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: etb@f8801000: clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: etb@f8801000: clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
--
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: ethernet@e000b000: ethernet-phy@0: Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zed.dtb: mmc@e0100000: interrupts: [[0, 24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zed.dtb: mmc@e0101000: interrupts: [[0, 47, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: etb@f8801000: clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: etb@f8801000: clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: etb@f8801000: clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
--
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: accelerometer@53: 'interrupt-names' is a dependency of 'interrupts'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zturn.dtb: mmc@e0100000: interrupts: [[0, 24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zturn.dtb: mmc@e0101000: interrupts: [[0, 47, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: etb@f8801000: clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: etb@f8801000: clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: etb@f8801000: clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
--
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: accelerometer@53: 'interrupt-names' is a dependency of 'interrupts'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: mmc@e0100000: interrupts: [[0, 24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: mmc@e0101000: interrupts: [[0, 47, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: etb@f8801000: clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: etb@f8801000: clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: etb@f8801000: clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
--
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: ethernet@e000b000: ethernet-phy@0: Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zybo.dtb: mmc@e0100000: interrupts: [[0, 24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zybo.dtb: mmc@e0101000: interrupts: [[0, 47, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: etb@f8801000: clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: etb@f8801000: clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: etb@f8801000: clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
--
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: ethernet@e000b000: ethernet-phy@0: Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: mmc@e0100000: interrupts: [[0, 24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: mmc@e0101000: interrupts: [[0, 47, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: etb@f8801000: clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: etb@f8801000: clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: etb@f8801000: clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
