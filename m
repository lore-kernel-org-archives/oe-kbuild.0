Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A6D202F65
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Aug 2025 05:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756617315; cv=none; b=YH4ugA+OSO3dlSlypzRNho0pSNuuOVs5C2bKby9SMBnRQAeHfcoA9+Z4+kwdmhHHXe2WuYe6C/QQ6JE05IEgojuNXino9B2/d/GhRRPk02VfDBrBASpEVXJICOuQJc1D5mkqMkVl3NwjcUc7RFDGtcDT4s010b1Agxn0wyaQFPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756617315; c=relaxed/simple;
	bh=ENoVtW6DLjZhSjwtyyLZA40v4DnORozrKUFenowu5Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GQvPUW3L/bPK5JelUfKeViBQiBK1FhLSy8rZW1l1/51LMSwWntFjd7h/CXiXpcC6CoEM8kFqlx9acSdpSS5EjkWHq0mWSRHatU/bFFLPx4J6huRPe45IxCH7VzwP7+7U0Kag8ihUNAfRDOrMtAQh1toiJwKLvJdLFp2YRcpNmfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2KelL2d; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2KelL2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756617312; x=1788153312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ENoVtW6DLjZhSjwtyyLZA40v4DnORozrKUFenowu5Bw=;
  b=h2KelL2dCPfGQ3tsCfz5eo+6zvVgu8DxpmWR/rnRmORiVBHoFUx3DPHG
   vgPrz7wKj3aXq6is5aYd+YIbU1TbnFNJOAhqgBEIWZ8BNIrm2MDO9hcQH
   keY7HAB7sv29v8jLOEwCz+nZnsh2SJpyq9NYBZvNnUzrwVBXSZQXZc2gy
   VE04k2UMEHXtzNGPevolDEiMyLu+ZZ/MfQ1JFnYREmIMRFFuLDcR4Eh3F
   rOGC/CcLBFeUrw+0dqmNkMdQC6bJOVfLdFQPO08YjC/F+5/zGZQGTPe0o
   dvAxoSCcthwiJAWyFJNH6rq4uNAlX4Ig0WSoQMM3alra9Ba06s33juz5N
   Q==;
X-CSE-ConnectionGUID: 6xhRjzc2Ty+kSw0l3uYmHQ==
X-CSE-MsgGUID: 8Ls0VX6oQ/WbO+/ZU9sZ/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69554472"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="69554472"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 22:15:12 -0700
X-CSE-ConnectionGUID: 1THTWocvQgmqNoXLF9RxNg==
X-CSE-MsgGUID: QlHAqKv7RTWVhOcREyM9MA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Aug 2025 22:15:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usaP8-000Vxf-1V;
	Sun, 31 Aug 2025 05:15:03 +0000
Date: Sun, 31 Aug 2025 13:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:nomadik 1/2]
 arch/arm/boot/dts/xilinx/zynq-cc108.dtb: /axi/cache-controller@f8f02000:
 failed to match any schema with compatible: ['arm,pl310-cache']
Message-ID: <202508311347.ja32k2zs-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git nomadik
head:   d799c1bdeaaf9bf59611bd8ca7ff53bcf88a18ab
commit: 093b543bb3142d3c9fc874fa7f42a3b10491c33d [1/2] ARM: l2x0: add L210 write allocate override flag
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-053-20250829 (https://download.01.org/0day-ci/archive/20250831/202508311347.ja32k2zs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac23f7465eedd0dd565ffb201f573e7a69695fa3)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250831/202508311347.ja32k2zs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508311347.ja32k2zs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-cc108.dtb: /axi/cache-controller@f8f02000: failed to match any schema with compatible: ['arm,pl310-cache']
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-cc108.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names:1: 'atclk' was expected
--
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: /axi/cache-controller@f8f02000: failed to match any schema with compatible: ['arm,pl310-cache']
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: pinctrl@700 (xlnx,pinctrl-zynq): gpio0-default:conf: 'io-standard' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/xlnx,pinctrl-zynq.yaml#
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: pinctrl@700 (xlnx,pinctrl-zynq): sdhci0-default:conf: 'io-standard' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/xlnx,pinctrl-zynq.yaml#
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: pinctrl@700 (xlnx,pinctrl-zynq): sdhci0-default:conf-cd: 'io-standard' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/xlnx,pinctrl-zynq.yaml#
   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: pinctrl@700 (xlnx,pinctrl-zynq): uart1-default:conf: 'io-standard' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-microzed.dtb: /axi/cache-controller@f8f02000: failed to match any schema with compatible: ['arm,pl310-cache']
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: pinctrl@700 (xlnx,pinctrl-zynq): usb0-default:conf: 'io-standard' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/xlnx,pinctrl-zynq.yaml#
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-microzed.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
--
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/i2c@e0004000/isl9305@68: failed to match any schema with compatible: ['isil,isl9305']
>> arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/cache-controller@f8f02000: failed to match any schema with compatible: ['arm,pl310-cache']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: ethernet@e000b000 (xlnx,zynq-gem): ethernet-phy@0: Unevaluated properties are not allowed ('marvell,reg-init' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
--
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: hdmi-tx@39 (adi,adv7511): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: hdmi-tx@39 (adi,adv7511): 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: hdmi-tx@39 (adi,adv7511): 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: /axi/i2c@e0004000/i2c-mux@74/i2c@7/hwmon@34: failed to match any schema with compatible: ['ti,ucd9248']
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: /axi/i2c@e0004000/i2c-mux@74/i2c@7/hwmon@35: failed to match any schema with compatible: ['ti,ucd9248']
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: /axi/i2c@e0004000/i2c-mux@74/i2c@7/hwmon@36: failed to match any schema with compatible: ['ti,ucd9248']
>> arch/arm/boot/dts/xilinx/zynq-zc702.dtb: /axi/cache-controller@f8f02000: failed to match any schema with compatible: ['arm,pl310-cache']
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc702.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names:1: 'atclk' was expected
--
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: hdmi-tx@39 (adi,adv7511): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: hdmi-tx@39 (adi,adv7511): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: hdmi-tx@39 (adi,adv7511): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: hdmi-tx@39 (adi,adv7511): 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: hdmi-tx@39 (adi,adv7511): 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zc706.dtb: /axi/cache-controller@f8f02000: failed to match any schema with compatible: ['arm,pl310-cache']
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc706.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names:1: 'atclk' was expected
--
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: /axi/cache-controller@f8f02000: failed to match any schema with compatible: ['arm,pl310-cache']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names:1: 'atclk' was expected
--
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: /axi/cache-controller@f8f02000: failed to match any schema with compatible: ['arm,pl310-cache']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names:1: 'atclk' was expected
--
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: /axi/cache-controller@f8f02000: failed to match any schema with compatible: ['arm,pl310-cache']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names:1: 'atclk' was expected
--
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: /axi/i2c@e0005000/clock-generator@55: failed to match any schema with compatible: ['silabs,si570']
>> arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: /axi/cache-controller@f8f02000: failed to match any schema with compatible: ['arm,pl310-cache']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names:1: 'atclk' was expected
--
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-zed.dtb: /axi/cache-controller@f8f02000: failed to match any schema with compatible: ['arm,pl310-cache']
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zed.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names:1: 'atclk' was expected
--
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: accelerometer@53 (adi,adxl345): 'interrupt-names' is a dependency of 'interrupts'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zturn.dtb: /axi/cache-controller@f8f02000: failed to match any schema with compatible: ['arm,pl310-cache']
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names:1: 'atclk' was expected
--
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: accelerometer@53 (adi,adxl345): 'interrupt-names' is a dependency of 'interrupts'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
>> arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: /axi/cache-controller@f8f02000: failed to match any schema with compatible: ['arm,pl310-cache']
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names:1: 'atclk' was expected
--
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-zybo.dtb: /axi/cache-controller@f8f02000: failed to match any schema with compatible: ['arm,pl310-cache']
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names:1: 'atclk' was expected
--
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: /axi/cache-controller@f8f02000: failed to match any schema with compatible: ['arm,pl310-cache']
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zybo-z7.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names:1: 'atclk' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
