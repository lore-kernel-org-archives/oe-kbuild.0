Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CFD157A41
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 04:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731470419; cv=none; b=CQLMKlOlRybAW4fQ6EVcH/VI1roWDZllYT14t4Aex70KKrr5oIJngAmyZT44bNCHFk6KQYNZuCA7FTXrLvCRVa5SQvz6qDi6aQ9wb/0hfjCLb65/jUeRO6YTk5Bfs9Pm8Gk/Do70kTRQDbY1Ju4dt5PvVvc8aqORVUAppwPk+4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731470419; c=relaxed/simple;
	bh=9Ilo0ZFWZ+wU4bEJbhOrJt4THH91MWhP5ez2/39WV+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FFeiq/LDyLJmZxzFcKYfNYhELJqXpmz3eWGQLyVbjTK6BX/lbrI1ew/9BqXPI65LAwrfLkLNMtTaJksn3HtXnb2rKxTqtQqs3q9XkLTsFumcx1nz4znbnMPTPV1ZyaZ6lUvgvO8DZZ6/DlSEo9zE7KLVG40fPCpuiSWd3N7iNcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8lMoXXQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8lMoXXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731470418; x=1763006418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Ilo0ZFWZ+wU4bEJbhOrJt4THH91MWhP5ez2/39WV+w=;
  b=D8lMoXXQi+IPItELubNLSbfP/xepal+uWp9PnMBOv/5QrnJYn+6al780
   vW4vJHXQ/bi6tK77dFU89qcmF92aTn8dcxwskIMoOZM4oj6ICIFzcGMwc
   apUnTh6Vm/cgCVViwMvlX83v9sNzVVyQXcV09evUS+gYBKV003aV9qUV2
   om+/QXXMinYSl+oGq/GmxFD5YiUVksy7Jkt6Jg/CvpXOzdhGEKegWKX95
   csZMVRHxvfqzZmwkbQFYy6kazKrSAVxNVyzet3wTZrhzH/2wC/gEo/mQ7
   GcgtL5RaPGoO7fDiTGBubtZKOei8t2cyStsldzIdHqSqjse8yHfoXzrRr
   g==;
X-CSE-ConnectionGUID: Xn2lY5JNRW6nFJ2puUw2Nw==
X-CSE-MsgGUID: DYy2TeZDTVy10EL8cO8JrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31309275"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31309275"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 20:00:18 -0800
X-CSE-ConnectionGUID: vrrqXlPzRWCr59kBET/MuQ==
X-CSE-MsgGUID: KwsfS8qLRWiOgUzdPM/4Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="92692169"
Received: from lkp-server01.sh.intel.com (HELO c782e932e0d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Nov 2024 20:00:16 -0800
Received: from kbuild by c782e932e0d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB4Y9-000037-1m;
	Wed, 13 Nov 2024 04:00:13 +0000
Date: Wed, 13 Nov 2024 12:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 47/48]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pinctrl@ffe7f3c000:
 'resets' does not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
Message-ID: <202411131123.hSF1N3LE-lkp@intel.com>
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
commit: 21d95e9ecf0fa4e6ecef404bc5857c77ebc305d5 [47/48] riscv: dts: thead: Add various TH1520 peripheral resets
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: riscv-randconfig-052-20241113 (https://download.01.org/0day-ci/archive/20241113/202411131123.hSF1N3LE-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131123.hSF1N3LE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411131123.hSF1N3LE-lkp@intel.com/

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
