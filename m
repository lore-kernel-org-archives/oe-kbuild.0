Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4738188733
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Dec 2024 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734979071; cv=none; b=SqTn7H9eLYI76IG8NfXpfaMJJ+c9B57+OhqVn9ud3mTb81yMRlWdC1kG7sAsQ8y3jDXBTpgfOpiZYG8ZJ0lpvI0KQz6Uy5MlcIiJUwf2pbIgdxF/We8MZ31C6qnYVRzXEYfcHn5UUkzoKuccxvmhZKpCopJozBAlnAJBtdA1NJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734979071; c=relaxed/simple;
	bh=cD7xbf01aI8enYk2Zx0dYpW2wb8tUL+mxt9abwhg/J8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=brU+0o8vLItCWQSbEuA9uftyhN2uScrOvgOj8RhYZlzuR+0KDXVngk1Y9F1uD/6/Deg/eU3OyFYT5u5AdgUjRlYt/Z8p9MYcJdUBl9I9WhQ2msNLhrNWipqaw2Q2geGkMX73WC64oRl57vNJw0fwEizEEC6ydSK+tqIIpixgrjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBBuIvwn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBBuIvwn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734979069; x=1766515069;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cD7xbf01aI8enYk2Zx0dYpW2wb8tUL+mxt9abwhg/J8=;
  b=JBBuIvwnAPAX+TgTw0YDnlsR2GQKiwPwZ5siYaXELuxUzwljW4BRucyX
   dkQua4mkvmxonhN4N/Vg/wYZxkS0GPsqWgA80wzdtvwGDJvSXhe4lq+2y
   bTWO8fS4iFQhabgG9764rtzrsyDgz8ayfzQ9AJCBaLaLGbi4aRVHmNdP+
   vzFQzgOZDwInHxkHwBmAvUErWyZoOLeyVczI3AAzADlXko95cnuJXtFfh
   dnxCT+BhrP8Nu/w4YOgksEfZGV7LA2cHJVmicyvMcmP8ry0Kag9UZCZTb
   tNku5je+cJXnfeaSqCIHk9XEQnLuyw0u2pGnpc2WQw6ZxF1TxqmoumAjB
   g==;
X-CSE-ConnectionGUID: 90tb0rQtT3OPbQM38Dfa+A==
X-CSE-MsgGUID: z/P5UvyJTqiKRE3y9YqVLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35480055"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="35480055"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 10:37:48 -0800
X-CSE-ConnectionGUID: AggryJ8cTSCJzqunIOQC5A==
X-CSE-MsgGUID: RU8XhTbRSAK9ZAGqveT3bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="99638358"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Dec 2024 10:37:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPnJJ-0000YZ-0H;
	Mon, 23 Dec 2024 18:37:45 +0000
Date: Tue, 24 Dec 2024 02:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_dts_for_v6.14_v1 1/5]
 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: stmpe811@41:
 'blocks', 'id', 'irq-gpio', 'stmpe_touchscreen' do not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202412240221.gsnMPps3-lkp@intel.com>
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
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-052-20241220 (https://download.01.org/0day-ci/archive/20241224/202412240221.gsnMPps3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240221.gsnMPps3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412240221.gsnMPps3-lkp@intel.com/

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
