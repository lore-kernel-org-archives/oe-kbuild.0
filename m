Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834F92500AE
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Nov 2024 07:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732521071; cv=none; b=fPatMxFt4fbckp0pYWs9iG+dBWFqOEXTLo3MkN5vwXi04+E/jEGPVwPHqbp8xpfl4qI0r/QqsSLga+OQ1whpARlOYxdSClcMgRvDNCbp30y+S762jXJU1qdBTHJ/tLnr/9B+mvbKFyr2P1KuZmphGt7BCdz6dXbUf8OO+hveL2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732521071; c=relaxed/simple;
	bh=7E8x94gfQa8Fa79yriyd/ukKHMJjnOdZ6wdcKJxQdGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jKxTI5kKdJRzJFJuESM1qdTscv7Edpzsh1xGnDvtsJyXBwUBSnR7egEgkcDvo7RIi7xfvjuICQ+GSz8030XW4ApK0hRzl6dpRR/1NbxqUKKoIYLrFa17EBXjS8dCGyP84/wlWV73j3hLzJdmS8De1VV26hjY61heRQN8rQGsTxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZyEKkuKu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZyEKkuKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732521068; x=1764057068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7E8x94gfQa8Fa79yriyd/ukKHMJjnOdZ6wdcKJxQdGU=;
  b=ZyEKkuKuBvt2OCAzbv6cwkbz3A7AQJ7pExtp+G3giYXEXY3nrn25CQ1t
   1uaqsc2qMGyqGBxJPRwA2K4j4wpFaj6kXg9rtZMewHLmHMKQI65kosQH2
   LilTsS5isOohMdWI/+s4HuNBVowOoLjralDhUZZbpV6YyfnNPflLGOOcn
   O1V/M5+6CkAbO92KV/642RhT5KXtf4SRXLKU8zsa+wPfLO9Of4Ynjligl
   MsFhRgJCKvBqVM6gNV28E/pwq3R7wngQdAAksBWC0zA3ngnXFdeg15aMf
   r9C7bwA4X7lthvZx6+xgrGHGU1Vt7jvNzuFWaakmY6FgeQRZHISGdGoLg
   A==;
X-CSE-ConnectionGUID: 2z76MAFpRwGLV0Hg6NyJJg==
X-CSE-MsgGUID: r5RyE02ZQlqpZKxf8q5rPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="36529712"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="36529712"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 23:51:08 -0800
X-CSE-ConnectionGUID: M4ejAi6VRYaNtcEFoSlWnw==
X-CSE-MsgGUID: eT+5/xcmS1mVfnRgrmLYEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="90818962"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Nov 2024 23:51:07 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFTs8-00062x-37;
	Mon, 25 Nov 2024 07:51:04 +0000
Date: Mon, 25 Nov 2024 15:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 47/48]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pinctrl@ffe7f3c000:
 'resets' does not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
Message-ID: <202411251557.LxnavGzh-lkp@intel.com>
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
TO: Emil Renner Berthing <kernel@esmil.dk>

tree:   https://github.com/esmil/linux th1520
head:   b0b9c5dfe5239c799b6da7dadef7586860b61313
commit: 21d95e9ecf0fa4e6ecef404bc5857c77ebc305d5 [47/48] riscv: dts: thead: Add various TH1520 peripheral resets
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: riscv-randconfig-052-20241113 (https://download.01.org/0day-ci/archive/20241125/202411251557.LxnavGzh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251557.LxnavGzh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411251557.LxnavGzh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pinctrl@ffe7f3c000: 'resets' does not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pinctrl@ffec007000: 'resets' does not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pwm@ffec01c000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/thead,th1520-pwm.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'thead,misc-sysreg', 'vbus-supply' do not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/reset-controller@ffff015000: failed to match any schema with compatible: ['thead,th1520-reset-ap']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/reset-controller@fffff44000: failed to match any schema with compatible: ['thead,th1520-reset-aon']
--
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: pinctrl@ffe7f3c000: 'resets' does not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: pinctrl@ffec007000: 'resets' does not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: pwm@ffec01c000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/thead,th1520-pwm.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'thead,misc-sysreg' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/reset-controller@ffff015000: failed to match any schema with compatible: ['thead,th1520-reset-ap']
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/reset-controller@fffff44000: failed to match any schema with compatible: ['thead,th1520-reset-aon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
