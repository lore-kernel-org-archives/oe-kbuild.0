Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A7C2309AE
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 23:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731540172; cv=none; b=hdFMQ16G4j0bC1i9tAEYhNvIY4/av+RY5/5bR1qPHwLoVzq9B69IQGm0jAg4Nz627b7HeXQd1O9p4tbnszQnNupTteBYBZkVw6R0qPWjveemPEwab1b6wTseuzb1DIR1g5cNMS5gvGr6F8xd0dw/4/0OyRRNnevMwC78OE0zz9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731540172; c=relaxed/simple;
	bh=2/J1AtnN6MroGXHNYo3JRElsUX6B2gtDIMC6MXvEF5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zu+8iUjOR81NEeRSd8M2tydhW6bIO+0oDHef+gZ9GFeNvLAN/8ADvA4kBJRIjMJ6TAjrpigHUxM6a3FB+AlbcikLzLrTDasXpS4TWrh3Fti/+90kqxa+Cfe1wqv/vVRUg5vX08n9Vs9h09YxotcL3A7hzhKHVHD4rKRjc+nqB38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhwweGZG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhwweGZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731540170; x=1763076170;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2/J1AtnN6MroGXHNYo3JRElsUX6B2gtDIMC6MXvEF5k=;
  b=VhwweGZGsyUYcTrdf4DIkEA+YhzB64G2+u2j52eoSXAMJeR3s9LpsIlH
   VDDW1QsZwwQmgB+/m5aH7VaUE5DLrhgtJ8IcR4ZwwNqMjqr7HW2kG6OX2
   yup4e6CokL6zAqpnO4vN9Y4VXKB3TUdwD7W2PJIaLeYLX1WMnC6Dmwv36
   4Qfx25iydl94vjNDsA/B1NJcNQbyo6GeMcRGF+53uRajmTglaSAAh37AP
   5uypnrlNnBqQFKn08Kd/u7K2gg8gULtsKclZA/rpVhCH6vQcLLef8GPPP
   aHiI9T1wGhXL/pOmg/8FDM8jo7ctpWdFArMCJ99hGXfPYlcXGyNDuwvQ3
   w==;
X-CSE-ConnectionGUID: 1xMztUwVRkSrCkypGdv6XQ==
X-CSE-MsgGUID: gD50yQHtS3mly0nQfKGQgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31614520"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31614520"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 15:22:50 -0800
X-CSE-ConnectionGUID: YrsU1205RKyY90uMrcSzDQ==
X-CSE-MsgGUID: G9doMiqqRL6WwmoIfcZWQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="118955827"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Nov 2024 15:22:48 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBMhC-0000qV-0b;
	Wed, 13 Nov 2024 23:22:46 +0000
Date: Thu, 14 Nov 2024 07:22:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_dts_for_v6.13_v2 2/4]
 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: stmpe811@41:
 'blocks', 'id', 'irq-gpio', 'stmpe_touchscreen' do not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202411140756.8KkyaB7k-lkp@intel.com>
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
TO: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
CC: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_dts_for_v6.13_v2
head:   e6ea5eb70e205d22ebfc3769ef40791dcb6a9a8f
commit: 5737f27fa6451ee7aed3cc0f8abf530d5f57a6b4 [2/4] ARM: dts: socfpga_cyclone5_mcvevk: Drop unused #address-cells/#size-cells
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-052-20241109 (https://download.01.org/0day-ci/archive/20241114/202411140756.8KkyaB7k-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140756.8KkyaB7k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411140756.8KkyaB7k-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: stmpe811@41: 'blocks', 'id', 'irq-gpio', 'stmpe_touchscreen' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: stmpe811@41: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
