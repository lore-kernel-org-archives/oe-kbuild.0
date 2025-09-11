Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC39246788
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757597751; cv=none; b=dv/owZk1i6h0IC2tT98YoT939hanZHppe5P+Pd3bpXnYQRlYSRv1md0D27K9nL1alt7Bgy/aPC5oVPdaCYF3G/kYN2ETpad8Q9lTnWh/AabsQMPvPomDyZRBVQdP8OREHDlg/KZNCJMnKsWqren/E/RkYckP87Fu1bKOFDQfq/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757597751; c=relaxed/simple;
	bh=6w9hNBCjr9XsI8mIKPAE+tALSOSQ43VUtFuawLCL+h8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dfzdY9mTUKaZ/rAx0/XO/mpATui6ZFyBExAjau8rWkyrcbq4NL0Lu8FPpMb1eFojx7+BPGKFaK2iJDipELpVaLC+CTUGfDIIBZ4W6//cVViZ0nyceC3nh2T1m25Wf/vtTnZm3DN0jglbCO7zU47JekBbzk9Up/r0IXBeRykVW14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QCasNUw+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCasNUw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757597749; x=1789133749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6w9hNBCjr9XsI8mIKPAE+tALSOSQ43VUtFuawLCL+h8=;
  b=QCasNUw++79z4XXHXrfA7DBeKejEmSUbWLymC+uy+JM7n3uvASRhNYch
   Kqfn7u8PsuoQ08zC3k47JfwDuc5fSkgGPePddXpUZWYL9lQOQ8hFrQHEQ
   zzEdUPRHdH5YApB1P2mK8boZoRqNg7QCCb7CyeLThpzP3sHbGRdIqdRxA
   LbhkZTtfBphSEKCD7Ch858TwWJLnLnOPJxeWm8Z5VW8b1/s2E/l+7UkV9
   G+Iv8KVi/Exk+diMaQ+woG58DsQ/gzB9Ts19mk+/ORJRDew/Un3WGeFm6
   3uckp5ApVprLC7cGD2l0yTCowTf5ZzsE3SqbfMl65VHLvqSLLToXeGgk1
   w==;
X-CSE-ConnectionGUID: HsH1b3QWTK6VpjmkwkoDnA==
X-CSE-MsgGUID: IeaXKmkxSAiCxhy95J0UlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82517209"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="82517209"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 06:35:48 -0700
X-CSE-ConnectionGUID: gZpkjkjvSDe51KQorpLVfA==
X-CSE-MsgGUID: oXQJmnctRvG3ccaf/ips6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="197374063"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Sep 2025 06:35:46 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwhSi-0000MS-0o;
	Thu, 11 Sep 2025 13:35:44 +0000
Date: Thu, 11 Sep 2025 21:34:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 16/18]
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000
 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200', 'pinctrl@204' do not match
 any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202509112112.8YbwEVgX-lkp@intel.com>
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
head:   9d928f1d404e339ec552b1fb749e1287533868cc
commit: f49c1fded333005467d9480d4cba62dfb8059501 [16/18] more wip wip wip
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-052-20250911 (https://download.01.org/0day-ci/archive/20250911/202509112112.8YbwEVgX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509112112.8YbwEVgX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509112112.8YbwEVgX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200', 'pinctrl@204' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-iomux0']
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: /soc/syscon@20002000/pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs-pinctrl']
--
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200', 'pinctrl@204' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-iomux0']
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: /soc/syscon@20002000/pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs-pinctrl']
--
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200', 'pinctrl@204' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-iomux0']
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: /soc/syscon@20002000/pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs-pinctrl']
--
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200', 'pinctrl@204' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-iomux0']
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: /soc/syscon@20002000/pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs-pinctrl']
--
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200', 'pinctrl@204' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-iomux0']
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: /soc/syscon@20002000/pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs-pinctrl']
--
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:261.24-435.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@200: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #address-cells value
   arch/riscv/boot/dts/microchip/mpfs.dtsi:437.23-443.6: Warning (avoid_default_addr_size): /soc/syscon@20002000/pinctrl@204: Relying on default #size-cells value
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'pinctrl@200', 'pinctrl@204' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: /soc/syscon@20002000/pinctrl@200: failed to match any schema with compatible: ['microchip,mpfs-pinctrl-iomux0']
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: /soc/syscon@20002000/pinctrl@204: failed to match any schema with compatible: ['microchip,mpfs-pinctrl']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
