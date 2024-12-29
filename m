Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD7B382
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Dec 2024 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735481116; cv=none; b=PbxPB8ftpC8n930vI7x3FDoB1T2jWKWcWw8sxePJlkaAw8Zi2iQsnLHy3L1et7XSzwTlSku2oRrUxWmNzP7n99iCdQeL3yXmMVZN6lgJtKOhPHE9L2b8/fTUmS5usV1CGiECJL56ITGaK1IhEXRT9N3KwgWLY/CCayv3KQfkRvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735481116; c=relaxed/simple;
	bh=3l0G/KPcVR+/dTstR/PgPNnxVPoWtIzeZo8uV/5nbx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EzS1vflElWyQ2x55S6BLKiXpxD/HHdXx01soDiHBNteQMSMtAIokh9a2BE8Q+vZAzYFgJZC0114NNSZWurlMVeh6ZIKwtLoc38J5lr6JFFvP288oo/zZeL/HItz93Wk1dHWmKGHI5gIQJwqgT68X6swBUVHqsxE+o9RZXoh0xKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PimKxaUe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PimKxaUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735481115; x=1767017115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3l0G/KPcVR+/dTstR/PgPNnxVPoWtIzeZo8uV/5nbx0=;
  b=PimKxaUe+OHjqzF+A9rx6F3YFQb71ofIf1hv+nm0geIRnPSi+Tkk2O1P
   3fi9CqlqQCmNcb24bgYMmn0ZBtv5ZUOMNvAd8XVztR7ZVrK+AklVOf2XV
   +YagLGaxwO6rf8KLdvVe8f5H91GyFOl4uiv3d1aH6mfKlP6/gWRfYx3xu
   KE243lmCxjPG8gvZwQn0UvWWJsgkMfhPIGx1mlRg1GFCYh3Vns5q7eMsc
   JLRPaHqGsfmcVwX6xepZBqPnMzTu3eCMg7Zk529E2AQUuP6VpzbXlPCw+
   rgxR55+wCEE9H/kXnAjBV6i6fa87GdIjMcgHwISLEqPnDGZT7ERfHiTfw
   w==;
X-CSE-ConnectionGUID: InohntbVT+u6r6lQGCbipw==
X-CSE-MsgGUID: o7WDKPCdSv+jdeyh8x9uvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="36015270"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="36015270"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 06:05:14 -0800
X-CSE-ConnectionGUID: +RWFEcyxT7+4usAyYPuarw==
X-CSE-MsgGUID: BapWCmrAQlSmOpeuEpqRYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105559969"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Dec 2024 06:05:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRtuo-0004ho-14;
	Sun, 29 Dec 2024 14:05:10 +0000
Date: Sun, 29 Dec 2024 22:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jic23-iio:testing 132/134] arch/arm/boot/dts/xilinx/zynq-zturn.dtb:
 accelerometer@53: 'interrupt-names' is a dependency of 'interrupts'
Message-ID: <202412292144.nZ9xgWkQ-lkp@intel.com>
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
TO: Lothar Rubusch <l.rubusch@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   627f3c41ca005398cf1e86a312c5043147ec7ea6
commit: ebf0aa3ed1dc94f2f66e19e5ea320eeacbbd518f [132/134] dt-bindings: iio: accel: adxl345: add interrupt-names
:::::: branch date: 22 hours ago
:::::: commit date: 23 hours ago
config: arm-randconfig-053-20241229 (https://download.01.org/0day-ci/archive/20241229/202412292144.nZ9xgWkQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 319b89197348b7cad1215e235bdc7b5ec8f9b72c)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412292144.nZ9xgWkQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412292144.nZ9xgWkQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-zturn.dtb: accelerometer@53: 'interrupt-names' is a dependency of 'interrupts'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
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
>> arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: accelerometer@53: 'interrupt-names' is a dependency of 'interrupts'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
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
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
