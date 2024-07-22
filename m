Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A40D28E7
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jul 2024 05:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721625137; cv=none; b=i+O4BEewI9livyNqjwdWJV1HwF101jOlrDgVuINS6JdtwioX5GHTNzphcTvn/vE6l4QTPT7xPt13tz+SkG1zEqUfm0qTAYveESy4FuhusGOinyZi2E9YbG6g2CmIRnGcPdakgQVGUkP2AEbsqJwKB7zh3L9ss/RPXr6IfcncX8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721625137; c=relaxed/simple;
	bh=xRfLjkZVxC/MSFf/LJta1ia9JKAaijkEYevhbzBSzMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wt2Vz5qlTlXH7UaTrYWpJdVaPofqVa9Tn25D91+u8umBMDWdB+I5DZIwS+ws0e28YSqjJ2tCerehDzOUPh5PO+BhqED7xqiwNVLikDBeXYqLdmo22RQGAD86FZvbD9KY7GhgSBy2+evsWXsdqoB4gI6X7Ukio5AfG5QvaVA9FPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OoZBGCqQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OoZBGCqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721625135; x=1753161135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xRfLjkZVxC/MSFf/LJta1ia9JKAaijkEYevhbzBSzMM=;
  b=OoZBGCqQ1rWrznSlG7QLkxQOgt+QMR3EoP01p6s0W7fY2wEdty2DDvVq
   7/yp2Vs+wSLMa1GWSEIFOn+kHk9++aCQB/jjKlbVVfTno37OCYfEHsGuw
   EABOcGC8MEzSzMfAkyPwkdYuFVdyFuH05aKoCuZs2XK1kgFD12GHey4E8
   +iwDMmI5jzYG56hCgH8C8vACOi1ZJDouPh40MwC9p2dcrOPck67jO2leL
   JFAEH4jLFS/aFksZ+/y+OopxHyusFZQlnGdnIPACBRvx+7wScP8a4j4aF
   gfaj0K98jVaLnouPXOlLQLZ+1o0cy44H9mtaQR3PkO0vU7KLZHzqjC9cg
   A==;
X-CSE-ConnectionGUID: XE6/X4DCS7ykzM62IyBHZQ==
X-CSE-MsgGUID: iFGR3IpkSGW1i5gcatgMRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="22982510"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="22982510"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 22:12:14 -0700
X-CSE-ConnectionGUID: jRa+2eUhR9SwkeywId38jQ==
X-CSE-MsgGUID: Axbq53QDRHmV8edVPInLpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="55927462"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jul 2024 22:12:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVlLH-000kt2-18;
	Mon, 22 Jul 2024 05:12:11 +0000
Date: Mon, 22 Jul 2024 13:12:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 35/43]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb:
 /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible:
 ['thead,th1520-misc-sysreg', 'syscon']
Message-ID: <202407221339.OCKqmcQb-lkp@intel.com>
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
TO: Jisheng Zhang <jszhang@kernel.org>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux th1520
head:   350a58164ab57fa986bd3dadd6c975d3f6e39fcf
commit: 113f0bb150b8aec7b67c402436c92684aae78459 [35/43] riscv: dts: thead: Add TH1520 USB nodes
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: riscv-randconfig-051-20240722 (https://download.01.org/0day-ci/archive/20240722/202407221339.OCKqmcQb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407221339.OCKqmcQb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407221339.OCKqmcQb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'snps,axi-config', 'snps,fixed-burst', 'snps,multicast-filter-bins', 'snps,pbl', 'snps,perfect-filter-entries' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/syscon@ffec003000: failed to match any schema with compatible: ['thead,th1520-gmac-apb', 'syscon']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/syscon@ffec004000: failed to match any schema with compatible: ['thead,th1520-gmac-apb', 'syscon']
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'thead,misc-sysreg' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
--
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'snps,axi-config', 'snps,fixed-burst', 'snps,multicast-filter-bins', 'snps,pbl', 'snps,perfect-filter-entries' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/syscon@ffec003000: failed to match any schema with compatible: ['thead,th1520-gmac-apb', 'syscon']
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/syscon@ffec004000: failed to match any schema with compatible: ['thead,th1520-gmac-apb', 'syscon']
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'thead,misc-sysreg' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
