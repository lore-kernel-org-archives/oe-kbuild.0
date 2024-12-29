Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254281E50B
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Dec 2024 13:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735477916; cv=none; b=ndDooaf2fXOZC9y0+vp8P0CcGrfGmUgOtwjng/gW8DUQzvyxsetTgywbUpkllIpMDEpBulpLVqXU5qCk1qzG3qyhp4m1FAgsxUvpmRAgUmZHySkLxeseG0j2f5dQ44xoNUYRI/OTA1NFJFsnngAjVq3Qn53ENV9bYKYB9m2bJFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735477916; c=relaxed/simple;
	bh=9lynoyb1abRbkRz13Wqgv3Z5j6/0V/KtS8w5AfJqZLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c5svjP/L1y74bkrISgaAncsKWrgUa80DeEKjILrFPUau3wKSLwgiehbTXa7ls/NpWhDtLYXcxk5aX50JYURuzC4m88pxBjYIgVHkhU2k+F/2512zvWpS5xktnAgsWx9dtNWlE96hvHJkrIm5hXHP6edUgUQWxMpSkw9++I02q5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwF56ZZD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwF56ZZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735477914; x=1767013914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9lynoyb1abRbkRz13Wqgv3Z5j6/0V/KtS8w5AfJqZLE=;
  b=FwF56ZZDwvQMM6RIGudAEnUb8Cg2u9Jku9SuhERjvWUbDf+7EsTIEkbk
   4bUXDuv4YBO9cL/qvHU3pz+eabFarl6RuvUmLk3ueid9hKgKG6qKXruAg
   UnpxrUt4iBoiUjuwSTi87fmJKUBLYcH+wFSRwpm8Da4OxBfOYFfpBLmgc
   WUqwj74wl9bbfm3E/v0E/MZVoVj4vVuItCTodZDxIpcdzdixnXjm1Px95
   O87R/gshNRKygmqzXJn6YdgYvOPvfPZigbWt6YvF7KH6whS5nvMAKDLll
   euRBmF9ZWHcGm/8dypPZRcP09bPaF7XQmtzKXxg6LcO0WF34GObgcJK+O
   g==;
X-CSE-ConnectionGUID: DdzwVceYSL6SsEvNSLrMEw==
X-CSE-MsgGUID: KRjr1C99STCXHgyqxLKzbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="39726771"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="39726771"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 05:11:53 -0800
X-CSE-ConnectionGUID: CcBGFtfLSdmt3koa31qrKw==
X-CSE-MsgGUID: xtNLtzjGR+GJXpSHaYiZZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="105535941"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Dec 2024 05:11:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRt5B-0004gO-2y;
	Sun, 29 Dec 2024 13:11:49 +0000
Date: Sun, 29 Dec 2024 21:11:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jic23-iio:testing 132/134]
 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb:
 adxl345@53: 'interrupt-names' is a dependency of 'interrupts'
Message-ID: <202412292018.7MGwjh2a-lkp@intel.com>
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
:::::: branch date: 21 hours ago
:::::: commit date: 22 hours ago
config: arm-randconfig-052-20241229 (https://download.01.org/0day-ci/archive/20241229/202412292018.7MGwjh2a-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412292018.7MGwjh2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412292018.7MGwjh2a-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: adxl345@53: 'interrupt-names' is a dependency of 'interrupts'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: accelerometer@53: 'interrupt-names' is a dependency of 'interrupts'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
