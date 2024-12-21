Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22E01A0B08
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 23:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734825602; cv=none; b=SMmg14XRbRjAnB7F7dk8pEC1C8WYRTPKQaDwHE6m4vSFD51z8dxK5x58bB9bx1cYoBE9wQPUlS7dHzxhYO5FfdhK6zBOEQM4xh9Xw1W0N7ebGGgFMyXnWcOdjD46XgJDLaMG6sDbFqLayv55h/SEdsiDicsEnMHJVBf3Lseiudc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734825602; c=relaxed/simple;
	bh=KFhLh46DXGjuLkmb9YW19Vf15YckZjVe7snsWSa0Zs0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZQ4uvmpXh0jRu3wMEGvl6SCJpr3UJRosdz6Qdhu10t8BV3yN+MmtCsqxhOQSPGdy1aqivIZ0qnlmMOOfDyaUkKyIW7HqkI53zcTV015LCOH5YSJbWLei3Ev7Cx+a3KUUlCeop/UGranauDEevT2LwdOlYIG7MRHHvhwcNvOXuCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHxLA0yU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHxLA0yU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734825600; x=1766361600;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KFhLh46DXGjuLkmb9YW19Vf15YckZjVe7snsWSa0Zs0=;
  b=YHxLA0yUX4LN1vbn2OJ/Fgfk7OGDljpddarrmWRzlA/LEhGDbWRIycGR
   g6A5H30ZvogdOasaq5VMcdQhfHip5Z9vy7wBGKYD+04L2ctQJEiGmwN5a
   RVzwi8FAzYjx6bEHR0AvPlqUBgMVKTXck0I1BU8emKtotQl5M3n+9NnRs
   7k08Kx1w1mwG102i907Q0fN4w1DYRRypRinNc+8Otvw7xgY/xB2Fd3ENB
   Dynyu7voELlu9BrheW0tUiXoOTK/mvnmgjLbr9K/xWgOKe/BOphCuagCy
   MXKBxDWvWKTYZBwAwpNSsILZIMdsfqwhkvfTeULq5MR6KJL+KfcQzJ/1v
   A==;
X-CSE-ConnectionGUID: J+zCNwzERMai4AUt9a3NYA==
X-CSE-MsgGUID: 3Nf5g2D1RSmexdFAfrtAAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35228226"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35228226"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 16:00:00 -0800
X-CSE-ConnectionGUID: nGXUcOheTXKw6KhJyjE+Gw==
X-CSE-MsgGUID: RKF+yIiDRy+5FF9iHikWng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98630858"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2024 15:59:57 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP9O0-0002Zz-0h;
	Sat, 21 Dec 2024 23:59:56 +0000
Date: Sun, 22 Dec 2024 07:59:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_dts_for_v6.14_v1 1/5]
 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: stmpe811@41:
 'blocks', 'id', 'irq-gpio', 'stmpe_touchscreen' do not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202412220750.z91Z9xVM-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_dts_for_v6.14_v1
head:   91e8b7cff8e9445c56b0e433a51f2fd360a9b070
commit: d5f9e83ca6319cb50da1acba954664c63c3df3cc [1/5] ARM: dts: socfpga_cyclone5_mcvevk: Drop unused #address-cells/#size-cells
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-052-20241220 (https://download.01.org/0day-ci/archive/20241222/202412220750.z91Z9xVM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220750.z91Z9xVM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412220750.z91Z9xVM-lkp@intel.com/

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
