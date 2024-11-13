Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574E01607B2
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 03:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731468555; cv=none; b=JEm5+x6a4iJ+f6ywYeVn2l7CuDjIdP1VwYJUPgDehHsb3gFdFnklUQQwelxWz27ws1hlLeestAoevR2DYK+EFTt/LCMMFVodOAecUGCYh9sCoz7/CYOH9u0iuHjaCzPL8mwl/gWVYa346xmeddR8fV2C9BcYd5zfp0jVicSemDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731468555; c=relaxed/simple;
	bh=qTGLpTTsYX1fU34z37asACpCLpuZuTp350Ok3Bbv3hA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jD/PYVbhttX4q7DAvUqwnZPxRv4FPeZGK2Hc37KZ/d0CMMCyWdI6luy7F04GZk+55j5VVw61fGZK5C+977sEQUAevInuz446DUaw9GarFpcks+T+WmIJ22F2Xnf+RKK9Uyc7NrQWpfM0/dHJiq1xrZBo8J17GLrg67hHA2GUb78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2nI4nZA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2nI4nZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731468555; x=1763004555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qTGLpTTsYX1fU34z37asACpCLpuZuTp350Ok3Bbv3hA=;
  b=k2nI4nZAuA6Di/ENHA47QL9FCnaOZSNdG5ED49wzHV+1GZZik+AsBd2m
   AqJyrHkPUb6oTos1ly9mwPLCHmBeIF00MKkmZAswOnreOSmYK+QTd3lP9
   I+wSjGxLOYQmFiQV9P+h44H/ktvF+jCyFTILu3A4Dl7xhyH8YDOdaIz1N
   rP0EAGQcDWKZfbomEh0yghtEczJEtDXKeLWpm0afwXLGWhIUlrLGEiDa6
   rGEM/iywKh9p4xe0bD0OOwk4hCJEIE0cnmwpYs4gBbztm5NKBfWbb+Pyh
   ULQVpjwnCZGteqZ7UUpeNZEy/kI+3/90xNzcKSoyt8telaqJoI3AwiuWt
   w==;
X-CSE-ConnectionGUID: TZ2kCu9qTIiEUGmmW3DDYg==
X-CSE-MsgGUID: qmunAYddRz+MH0fMhILU5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42458590"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42458590"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 19:29:14 -0800
X-CSE-ConnectionGUID: 5GVfkyczT8CQty/DDqPMCw==
X-CSE-MsgGUID: 8UCftlbFSJm9LYRl2fVsZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="88123757"
Received: from lkp-server01.sh.intel.com (HELO c782e932e0d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2024 19:29:13 -0800
Received: from kbuild by c782e932e0d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB446-00001F-2c;
	Wed, 13 Nov 2024 03:29:10 +0000
Date: Wed, 13 Nov 2024 11:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 46/48]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb:
 /soc/reset-controller@ffff015000: failed to match any schema with
 compatible: ['thead,th1520-reset-ap']
Message-ID: <202411131115.T4FIgYpa-lkp@intel.com>
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
TO: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux th1520
head:   b0b9c5dfe5239c799b6da7dadef7586860b61313
commit: 7db57db617e392f554cd3837bff0749d249c6160 [46/48] riscv: dts: thead: Add TH1520 AON and AP reset controllers
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: riscv-randconfig-052-20241113 (https://download.01.org/0day-ci/archive/20241113/202411131115.T4FIgYpa-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131115.T4FIgYpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411131115.T4FIgYpa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'thead,misc-sysreg', 'vbus-supply' do not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/reset-controller@ffff015000: failed to match any schema with compatible: ['thead,th1520-reset-ap']
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/reset-controller@fffff44000: failed to match any schema with compatible: ['thead,th1520-reset-aon']
--
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'thead,misc-sysreg' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/reset-controller@ffff015000: failed to match any schema with compatible: ['thead,th1520-reset-ap']
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/reset-controller@fffff44000: failed to match any schema with compatible: ['thead,th1520-reset-aon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
