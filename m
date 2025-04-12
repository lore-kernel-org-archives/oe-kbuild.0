Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0AB15853B
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Apr 2025 10:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744455247; cv=none; b=r+iBOCAHTzilpeQG6rHryjUXQWNviJJDt4xckxBfizkIBd9g02lNTslhefqNABK4FfDNpeIEJ4KomoeW+Isa6opCjyzsAUefdS3RLzCyt3EUFGACBoU7sFWpzirNEvnQeLZcK/eB5ruHlQHhyA7BH0yjda8CQHX/6Qcj8l0jrdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744455247; c=relaxed/simple;
	bh=yW4AL1VN84Q1BmmRrXabcwl/zHId7j560RMJVfnszNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vm5WHAf9mp2aqtQ3qO4oWZdgzGbrXpykE9FW/JIEAyOT1pow2uptq3iLQermJ8e2j//geMMIPGy3rncRkg4JfL4JUykcdKS06Hi0iteXbozBMUNHNFBvNYWTG7hpzwSfGnpVddcqrCN13MfRSPPTS8RwzwCFFyGqx0h4hx3kL8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6Q0sx+o; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6Q0sx+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744455244; x=1775991244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yW4AL1VN84Q1BmmRrXabcwl/zHId7j560RMJVfnszNw=;
  b=b6Q0sx+oEDbwC1pWg+g3oSwHZt7Sz6Pfxbt2x1gBwL7k0SsWckTHLtnf
   dGYMEmgyle3DvORjJGMTzgF7m93B0Fn2f71isfvwJdYM5V1JdNo4RIEyD
   4F9qbv+yU17ddR91G5B4t38NTugz5m228ICwoR61YxFhsUd2URvaP9S+g
   dlWJxccWItXUQXuZcJp69cXSWIPNPpJtR3nYPRTFoIl43VjwZHVQ6l0Cq
   jNBastdj5zCMAlAiWyZTysq4BjWPYh6gRrI+TdWC8Xj2B40jop4DBC19n
   kqZsVqtx3fGn5u4UM2tTSG5WzDzU9W72FdMhldByjtvWKj3HMPohk6C3C
   g==;
X-CSE-ConnectionGUID: 9KsD1mM0RMmC3O8f35PB9w==
X-CSE-MsgGUID: w97I/eOwSzium+aU68J46g==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="46124083"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="46124083"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 03:54:03 -0700
X-CSE-ConnectionGUID: 7TB583v0Sam6AGU7ZTha6w==
X-CSE-MsgGUID: EBGLdo0dRVWiwr9nv3kyaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="129741033"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Apr 2025 03:54:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3YUp-000Bk6-3C;
	Sat, 12 Apr 2025 10:53:59 +0000
Date: Sat, 12 Apr 2025 18:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 221/221]
 arch/arm64/boot/dts/apple/t6022-j180d.dts:651.28-657.6: Warning
 (unit_address_vs_reg):
 /soc@2200000000/pcie@1680000000/pci@0,0/pci@0,0/pci@5,0/network@0,1: node
 has a unit name, but no reg or ranges property
Message-ID: <202504121831.zz3sEorD-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   ceb29a7a5af1b1f599f0614570b5bedb02ef9764
commit: ceb29a7a5af1b1f599f0614570b5bedb02ef9764 [221/221] arm64: dts: apple: t6022-j180d: Add node for built-in PCIe devices
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-001-20250412 (https://download.01.org/0day-ci/archive/20250412/202504121831.zz3sEorD-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504121831.zz3sEorD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504121831.zz3sEorD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:601.28-603.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:605.34-607.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:609.22-611.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t6022-j180d.dts:651.28-657.6: Warning (unit_address_vs_reg): /soc@2200000000/pcie@1680000000/pci@0,0/pci@0,0/pci@5,0/network@0,1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6022-j180d.dts:427.14-443.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6022-j180d.dts:445.14-454.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:458.29-463.4: Warning (simple_bus_reg): /soc@200000000/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:320.39-339.4: Warning (simple_bus_reg): /soc@200000000/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:341.39-360.4: Warning (simple_bus_reg): /soc@200000000/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:320.44-339.4: Warning (simple_bus_reg): /soc@2200000000/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:341.44-360.4: Warning (simple_bus_reg): /soc@2200000000/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc@200000000/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +651 arch/arm64/boot/dts/apple/t6022-j180d.dts

9f43009a795f3b Hector Martin 2023-08-07  457  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  458  /* PCIe devices */
ceb29a7a5af1b1 Janne Grunau  2025-04-07  459  &port_ge00_die1 {
ceb29a7a5af1b1 Janne Grunau  2025-04-07  460  		bus-range = <0x01 0x09>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  461  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  462  	pci@0,0 {
ceb29a7a5af1b1 Janne Grunau  2025-04-07  463  		device_type = "pci";
ceb29a7a5af1b1 Janne Grunau  2025-04-07  464  		reg = <0x10000 0x00 0x00 0x00 0x00>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  465  		bus-range = <0x02 0x09>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  466  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  467  		#address-cells = <3>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  468  		#size-cells = <2>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  469  		ranges;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  470  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  471  		interrupt-controller;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  472  		#interrupt-cells = <1>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  473  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  474  		interrupt-map-mask = <0xffff00 0x00 0x00 0x07>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  475  		interrupt-map = <0x20000 0x00 0x00 0x01 &port_ge00_die1 0x00 0x00 0x00 0x00>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  476  				<0x20000 0x00 0x00 0x02 &port_ge00_die1 0x00 0x00 0x00 0x01>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  477  				<0x20000 0x00 0x00 0x03 &port_ge00_die1 0x00 0x00 0x00 0x02>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  478  				<0x20000 0x00 0x00 0x04 &port_ge00_die1 0x00 0x00 0x00 0x03>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  479  				<0x20800 0x00 0x00 0x01 &port_ge00_die1 0x00 0x00 0x00 0x01>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  480  				<0x20800 0x00 0x00 0x02 &port_ge00_die1 0x00 0x00 0x00 0x02>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  481  				<0x20800 0x00 0x00 0x03 &port_ge00_die1 0x00 0x00 0x00 0x03>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  482  				<0x20800 0x00 0x00 0x04 &port_ge00_die1 0x00 0x00 0x00 0x00>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  483  				<0x21000 0x00 0x00 0x01 &port_ge00_die1 0x00 0x00 0x00 0x02>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  484  				<0x21000 0x00 0x00 0x02 &port_ge00_die1 0x00 0x00 0x00 0x03>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  485  				<0x21000 0x00 0x00 0x03 &port_ge00_die1 0x00 0x00 0x00 0x00>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  486  				<0x21000 0x00 0x00 0x04 &port_ge00_die1 0x00 0x00 0x00 0x01>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  487  				<0x21800 0x00 0x00 0x01 &port_ge00_die1 0x00 0x00 0x00 0x03>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  488  				<0x21800 0x00 0x00 0x02 &port_ge00_die1 0x00 0x00 0x00 0x00>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  489  				<0x21800 0x00 0x00 0x03 &port_ge00_die1 0x00 0x00 0x00 0x01>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  490  				<0x21800 0x00 0x00 0x04 &port_ge00_die1 0x00 0x00 0x00 0x02>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  491  				<0x22000 0x00 0x00 0x01 &port_ge00_die1 0x00 0x00 0x00 0x00>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  492  				<0x22000 0x00 0x00 0x02 &port_ge00_die1 0x00 0x00 0x00 0x01>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  493  				<0x22000 0x00 0x00 0x03 &port_ge00_die1 0x00 0x00 0x00 0x02>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  494  				<0x22000 0x00 0x00 0x04 &port_ge00_die1 0x00 0x00 0x00 0x03>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  495  				<0x22800 0x00 0x00 0x01 &port_ge00_die1 0x00 0x00 0x00 0x01>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  496  				<0x22800 0x00 0x00 0x02 &port_ge00_die1 0x00 0x00 0x00 0x02>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  497  				<0x22800 0x00 0x00 0x03 &port_ge00_die1 0x00 0x00 0x00 0x03>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  498  				<0x22800 0x00 0x00 0x04 &port_ge00_die1 0x00 0x00 0x00 0x00>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  499  				<0x23000 0x00 0x00 0x01 &port_ge00_die1 0x00 0x00 0x00 0x02>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  500  				<0x23000 0x00 0x00 0x02 &port_ge00_die1 0x00 0x00 0x00 0x03>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  501  				<0x23000 0x00 0x00 0x03 &port_ge00_die1 0x00 0x00 0x00 0x00>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  502  				<0x23000 0x00 0x00 0x04 &port_ge00_die1 0x00 0x00 0x00 0x01>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  503  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  504  		/* pci-usba-dsp, internal USB-A port */
ceb29a7a5af1b1 Janne Grunau  2025-04-07  505  		pci@0,0 {
ceb29a7a5af1b1 Janne Grunau  2025-04-07  506  			device_type = "pci";
ceb29a7a5af1b1 Janne Grunau  2025-04-07  507  			reg = <0x20000 0x00 0x00 0x00 0x00>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  508  			bus-range = <0x03 0x03>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  509  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  510  			#address-cells = <3>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  511  			#size-cells = <2>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  512  			ranges;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  513  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  514  			interrupt-controller;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  515  			#interrupt-cells = <1>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  516  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  517  			interrupt-map-mask = <0 0 0 7>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  518  			interrupt-map = <0x30000 0x00 0x00 0x02 &port_ge00_die1 0x00 0x00 0x00 0x00>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  519  					<0x30000 0x00 0x00 0x03 &port_ge00_die1 0x00 0x00 0x00 0x01>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  520  					<0x30000 0x00 0x00 0x04 &port_ge00_die1 0x00 0x00 0x00 0x02>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  521  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  522  			/* not functional yet */
ceb29a7a5af1b1 Janne Grunau  2025-04-07  523  			reset-gpios = <&pinctrl_ap 6 GPIO_ACTIVE_LOW>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  524  		};
ceb29a7a5af1b1 Janne Grunau  2025-04-07  525  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  526  		/* pci-sata-dsp, internal AHCI controller */
ceb29a7a5af1b1 Janne Grunau  2025-04-07  527  		pci@1,0 {
ceb29a7a5af1b1 Janne Grunau  2025-04-07  528  			device_type = "pci";
ceb29a7a5af1b1 Janne Grunau  2025-04-07  529  			reg = <0x20800 0x00 0x00 0x00 0x00>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  530  			bus-range = <0x04 0x04>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  531  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  532  			#address-cells = <3>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  533  			#size-cells = <2>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  534  			ranges;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  535  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  536  			interrupt-controller;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  537  			#interrupt-cells = <1>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  538  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  539  			interrupt-map-mask = <0 0 0 7>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  540  			interrupt-map = <0x40000 0x00 0x00 0x01 &port_ge00_die1 0x00 0x00 0x00 0x00>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  541  					<0x40000 0x00 0x00 0x02 &port_ge00_die1 0x00 0x00 0x00 0x01>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  542  					<0x40000 0x00 0x00 0x03 &port_ge00_die1 0x00 0x00 0x00 0x02>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  543  		};
ceb29a7a5af1b1 Janne Grunau  2025-04-07  544  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  545  		/* pci-bio-dsp, I/O board USB-A ports */
ceb29a7a5af1b1 Janne Grunau  2025-04-07  546  		pci@2,0 {
ceb29a7a5af1b1 Janne Grunau  2025-04-07  547  			device_type = "pci";
ceb29a7a5af1b1 Janne Grunau  2025-04-07  548  			reg = <0x21000 0x00 0x00 0x00 0x00>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  549  			bus-range = <0x05 0x05>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  550  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  551  			#address-cells = <3>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  552  			#size-cells = <2>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  553  			ranges;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  554  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  555  			interrupt-controller;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  556  			#interrupt-cells = <1>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  557  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  558  			interrupt-map-mask = <0 0 0 7>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  559  			interrupt-map = <0x50000 0x00 0x00 0x01 &port_ge00_die1 0x00 0x00 0x00 0x01>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  560  					<0x50000 0x00 0x00 0x02 &port_ge00_die1 0x00 0x00 0x00 0x02>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  561  					<0x50000 0x00 0x00 0x04 &port_ge00_die1 0x00 0x00 0x00 0x00>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  562  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  563  			/* not functional yet */
ceb29a7a5af1b1 Janne Grunau  2025-04-07  564  			reset-gpios = <&pinctrl_ap 7 GPIO_ACTIVE_LOW>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  565  		};
ceb29a7a5af1b1 Janne Grunau  2025-04-07  566  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  567  		/* pci-lan-dsp, Qtion AQC113 10G etherner controller (0) */
ceb29a7a5af1b1 Janne Grunau  2025-04-07  568  		pci@3,0 {
ceb29a7a5af1b1 Janne Grunau  2025-04-07  569  			device_type = "pci";
ceb29a7a5af1b1 Janne Grunau  2025-04-07  570  			reg = <0x21800 0x00 0x00 0x00 0x00>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  571  			bus-range = <0x06 0x06>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  572  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  573  			#address-cells = <3>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  574  			#size-cells = <2>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  575  			ranges;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  576  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  577  			interrupt-controller;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  578  			#interrupt-cells = <1>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  579  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  580  			interrupt-map-mask = <0 0 0 7>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  581  			interrupt-map = <0x60000 0x00 0x00 0x01 &port_ge00_die1 0x00 0x00 0x00 0x02>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  582  					<0x60000 0x00 0x00 0x03 &port_ge00_die1 0x00 0x00 0x00 0x00>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  583  					<0x60000 0x00 0x00 0x04 &port_ge00_die1 0x00 0x00 0x00 0x01>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  584  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  585  			ethernet0: ethernet@0,0 {
ceb29a7a5af1b1 Janne Grunau  2025-04-07  586  				reg = <0x60000 0x0 0x0 0x0 0x0>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  587  				/* To be filled by the loader */
ceb29a7a5af1b1 Janne Grunau  2025-04-07  588  				local-mac-address = [00 10 18 00 00 00];
ceb29a7a5af1b1 Janne Grunau  2025-04-07  589  			};
ceb29a7a5af1b1 Janne Grunau  2025-04-07  590  		};
ceb29a7a5af1b1 Janne Grunau  2025-04-07  591  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  592  		/* pci-lan-b-dsp, Qtion AQC113 10G etherner controller (1) */
ceb29a7a5af1b1 Janne Grunau  2025-04-07  593  		pci@4,0 {
ceb29a7a5af1b1 Janne Grunau  2025-04-07  594  			device_type = "pci";
ceb29a7a5af1b1 Janne Grunau  2025-04-07  595  			reg = <0x22000 0x00 0x00 0x00 0x00>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  596  			bus-range = <0x07 0x07>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  597  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  598  			#address-cells = <3>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  599  			#size-cells = <2>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  600  			ranges;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  601  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  602  			interrupt-controller;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  603  			#interrupt-cells = <1>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  604  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  605  			interrupt-map-mask = <0 0 0 7>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  606  			interrupt-map = <0x70000 0x00 0x00 0x02 &port_ge00_die1 0x00 0x00 0x00 0x00>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  607  					<0x70000 0x00 0x00 0x03 &port_ge00_die1 0x00 0x00 0x00 0x01>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  608  					<0x70000 0x00 0x00 0x04 &port_ge00_die1 0x00 0x00 0x00 0x02>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  609  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  610  			ethernet1: ethernet@0,0 {
ceb29a7a5af1b1 Janne Grunau  2025-04-07  611  				reg = <0x70000 0x0 0x0 0x0 0x0>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  612  				/* To be filled by the loader */
ceb29a7a5af1b1 Janne Grunau  2025-04-07  613  				local-mac-address = [00 10 18 00 00 00];
ceb29a7a5af1b1 Janne Grunau  2025-04-07  614  			};
ceb29a7a5af1b1 Janne Grunau  2025-04-07  615  		};
ceb29a7a5af1b1 Janne Grunau  2025-04-07  616  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  617  		/* pci-wifibt-dsp, Broadcom BCM4388 Wlan/BT */
ceb29a7a5af1b1 Janne Grunau  2025-04-07  618  		pci@5,0 {
ceb29a7a5af1b1 Janne Grunau  2025-04-07  619  			device_type = "pci";
ceb29a7a5af1b1 Janne Grunau  2025-04-07  620  			reg = <0x22800 0x00 0x00 0x00 0x00>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  621  			bus-range = <0x08 0x08>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  622  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  623  			#address-cells = <3>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  624  			#size-cells = <2>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  625  			ranges;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  626  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  627  			interrupt-controller;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  628  			#interrupt-cells = <1>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  629  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  630  			interrupt-map-mask = <0 0 0 7>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  631  			interrupt-map = <0x80000 0x00 0x00 0x01 &port_ge00_die1 0x00 0x00 0x00 0x00>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  632  					<0x80000 0x00 0x00 0x02 &port_ge00_die1 0x00 0x00 0x00 0x01>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  633  					<0x80000 0x00 0x00 0x03 &port_ge00_die1 0x00 0x00 0x00 0x02>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  634  					<0x80100 0x00 0x00 0x01 &port_ge00_die1 0x00 0x00 0x00 0x00>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  635  					<0x80100 0x00 0x00 0x02 &port_ge00_die1 0x00 0x00 0x00 0x01>,
ceb29a7a5af1b1 Janne Grunau  2025-04-07  636  					<0x80100 0x00 0x00 0x03 &port_ge00_die1 0x00 0x00 0x00 0x02>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  637  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  638  			/* not functional yet */
ceb29a7a5af1b1 Janne Grunau  2025-04-07  639  			reset-gpios = <&pinctrl_ap 4 GPIO_ACTIVE_LOW>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  640  			pwren-gpios = <&smc_gpio 13 GPIO_ACTIVE_HIGH>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  641  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  642  			wifi0: wifi@0,0 {
ceb29a7a5af1b1 Janne Grunau  2025-04-07  643  				reg = <0x80000 0x0 0x0 0x0 0x0>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  644  				compatible = "pci14e4,4433";
ceb29a7a5af1b1 Janne Grunau  2025-04-07  645  				brcm,board-type = "apple,sumatra";
ceb29a7a5af1b1 Janne Grunau  2025-04-07  646  				apple,antenna-sku = "XX";
ceb29a7a5af1b1 Janne Grunau  2025-04-07  647  				/* To be filled by the loader */
ceb29a7a5af1b1 Janne Grunau  2025-04-07  648  				local-mac-address = [00 10 18 00 00 10];
ceb29a7a5af1b1 Janne Grunau  2025-04-07  649  			};
ceb29a7a5af1b1 Janne Grunau  2025-04-07  650  
ceb29a7a5af1b1 Janne Grunau  2025-04-07 @651  			bluetooth0: network@0,1 {
ceb29a7a5af1b1 Janne Grunau  2025-04-07  652  				compatible = "pci14e4,5f71";
ceb29a7a5af1b1 Janne Grunau  2025-04-07  653  				brcm,board-type = "apple,sumatra";
ceb29a7a5af1b1 Janne Grunau  2025-04-07  654  				// reg = <0x80100 0x0 0x0 0x0 0x0>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  655  				/* To be filled by the loader */
ceb29a7a5af1b1 Janne Grunau  2025-04-07  656  				local-bd-address = [00 00 00 00 00 00];
ceb29a7a5af1b1 Janne Grunau  2025-04-07  657  			};
ceb29a7a5af1b1 Janne Grunau  2025-04-07  658  		};
ceb29a7a5af1b1 Janne Grunau  2025-04-07  659  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  660  		/* pci-slot6-dsp, PCIe slot6 */
ceb29a7a5af1b1 Janne Grunau  2025-04-07  661  		pci@6,0 {
ceb29a7a5af1b1 Janne Grunau  2025-04-07  662  			device_type = "pci";
ceb29a7a5af1b1 Janne Grunau  2025-04-07  663  			reg = <0x23000 0x00 0x00 0x00 0x00>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  664  			bus-range = <0x09 0x09>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  665  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  666  			#address-cells = <3>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  667  			#size-cells = <2>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  668  			ranges;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  669  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  670  			interrupt-controller;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  671  			#interrupt-cells = <1>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  672  
ceb29a7a5af1b1 Janne Grunau  2025-04-07  673  			interrupt-map-mask = <0 0 0 7>;
ceb29a7a5af1b1 Janne Grunau  2025-04-07  674  		};
ceb29a7a5af1b1 Janne Grunau  2025-04-07  675  	};
ceb29a7a5af1b1 Janne Grunau  2025-04-07  676  };
ceb29a7a5af1b1 Janne Grunau  2025-04-07  677  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
