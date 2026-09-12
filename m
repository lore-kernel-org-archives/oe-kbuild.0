Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8897537F730
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Sep 2026 08:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789201850; cv=none; b=m8FnZmgJnsT0wogSDzKOnxsHQHcC3Q53pIugAOGzkV4jfVw+UMenvc1iHlLXF3JpA7XE4/WvrGzLhNxfZnSv3ZpSgfGTVwZ7T2n3XVbS395bPfKwNDqa9okYxlZy00nTVHtjZyoDUwTh/GgOlaxv9m+w1TGfCoe5dI3+bqWFzR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789201850; c=relaxed/simple;
	bh=XkbGHgnJDV3LAIGVfwdfct9roYHWrbaKE7Xh4tr5G4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AvUJ62ky4ZAZZkVKoslYULvv9lrmkBtOMmzmEt2BrUhIgdbSuB+iEl0rkRiPbJxbJinuRpwwKWXCdW0i3QwCijUj9IXiabOm9d4TQL2trKPAu6tqVurq2wzf5J9nZLAmK0hs6db8eo2xdnaY3qwSWDg262uMgu97eGxrN53PxrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDPUCZE4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDPUCZE4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789201847; x=1820737847;
  h=date:from:to:cc:subject:message-id;
  bh=XkbGHgnJDV3LAIGVfwdfct9roYHWrbaKE7Xh4tr5G4c=;
  b=bDPUCZE4AYU2iVh5QU2Fh+Ndeiz6lY7CU3NXDUwqO4T4/Hh8yJUT0Ho5
   ti63np4V1TngUxQVMzuY+kge7KBLBradZj6LjRByLDzMLsttEfKvyDUSc
   +zRgFInPqHVtbutlNs9Oj/Ae3W3gjsKuI6TJDRqA44HFBNZsPHETxJH4t
   PCUFQSbkEWo5SMtjiDXQIBPSDKOyTWSGureURFp3EYcRONQLcEC1hlrIz
   KTv3oC6u+rMOtI8wyN+AJxgnaUrf74CIMY//YOIwR0JWyw+ngXWd3iysk
   K7R+qA8u8veNa3tt1Ok7UxSW7MdYRl6DH3KzuzPAjL8k+5NRM4hnsgssI
   Q==;
X-CSE-ConnectionGUID: r1Ulwvi1QjOmMdt375heWA==
X-CSE-MsgGUID: XzBGelrEQoeRdVeNf85pEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="92159032"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="92159032"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 01:30:47 -0700
X-CSE-ConnectionGUID: ElPIWjqRT76jLvZRgmGQcQ==
X-CSE-MsgGUID: KGpnHz+FTfST6jQDcFecuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="274057058"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 12 Sep 2026 01:30:46 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5J8G-0000000011r-08RK;
	Sat, 12 Sep 2026 08:30:44 +0000
Date: Sat, 12 Sep 2026 10:30:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dtb: /
 (tibbo,ltpp3g2): compatible:0: 'tibbo,ltpp3g2' is not one of
 ['sunplus,sp7021-achip', 'sunplus,sp7021-demo-v3']
Message-ID: <202609121007.iwA6PqcE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Andrew Gaylard <ag@ffroot.co.za>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andrew-Gaylard/arm-dts-sunplus-add-peripheral-device-nodes-to-sp7021-dtsi/20260902-124544
head:   1a7abf611dc7e97818c1b084dbfdb9a1f63339a9
commit: 1a7abf611dc7e97818c1b084dbfdb9a1f63339a9 arm: sunplus: add Tibbo LTPP3G2 board support; update defconfig
date:   10 days ago
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm-randconfig-2053-20260907 (https://download.01.org/0day-ci/archive/20260912/202609121007.iwA6PqcE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121007.iwA6PqcE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609121007.iwA6PqcE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts:41.9-46.5: Warning (unit_address_vs_reg): /led/led@2: node has a unit name, but no reg or ranges property
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dtb: / (tibbo,ltpp3g2): compatible:0: 'tibbo,ltpp3g2' is not one of ['sunplus,sp7021-achip', 'sunplus,sp7021-demo-v3']
   	from schema $id: http://devicetree.org/schemas/arm/sunplus,sp7021.yaml
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dtb: /: failed to match any schema with compatible: ['tibbo,ltpp3g2', 'sunplus,sp7021']
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dtb: otp@af00 (sunplus,sp7021-ocotp): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/sunplus,sp7021-ocotp.yaml
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dtb: pinctrl@100 (sunplus,sp7021-pctl): pinmux_spi0-pins:sunplus,pins: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/sunplus,sp7021-pinctrl.yaml
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dtb: rtc@3a00 (sunplus,sp7021-rtc): 'charging-mode' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/sunplus,sp7021-rtc.yaml
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dtb: rtc@3a00 (sunplus,sp7021-rtc): charging-mode: b'\x00\x00\x00\x0e' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dtb: pwm@7a00 (sunplus,sp7021-pwm): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pwm/sunplus,sp7021-pwm.yaml
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dtb: ethernet@108000 (sunplus,sp7021-emac): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/sunplus,sp7021-emac.yaml
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dtb: ethernet@108000 (sunplus,sp7021-emac): clocks: [[4, 61], [4, 67], [4, 66], [4, 68]] is too long
   	from schema $id: http://devicetree.org/schemas/net/sunplus,sp7021-emac.yaml
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dtb: i2c-tps (i2c-gpio): 'sda-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dtb: i2c-tps (i2c-gpio): 'scl-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dtb: /i2c-tps/eeprom@50: failed to match any schema with compatible: ['at,24c16']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
