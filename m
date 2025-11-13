Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F81320CD5
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069124; cv=none; b=EAWPa+g5EdTN4XymWWrgBE7FIxYeIciWQxAIfVNel6d5CP0LsXYBymwkD3InBQeOzcpN3x0DfjuhzWEYBotr7Nk9F5fr0FCBnX1g1rd7zuHvUPrSqso3aMsUN5ZVX2TPp7/OUx7JlqGRe+wLjQIMqDQEyi8/xX41UfuQO5jbUNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069124; c=relaxed/simple;
	bh=pneVE8xa8xEuOAavmTx1l86LXpXEByXQsLwSok07na0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ADweAQ1kKPl7AbS7Pk2PWtPWbhsklAF/bIB1KBgNbteBHedb5rjo21ELFNdo/a4FQUNt7Dw6KMRqap8s7GQzGjanXuNmaABn/ul/ysrlnC2OFLQ7XTI31l1b2dwB6I9xpnFzSrC5S2phGTdzXbrR3UE/dDXrf6E6Qz/3T3YKyE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUbAhL6r; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUbAhL6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069123; x=1794605123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pneVE8xa8xEuOAavmTx1l86LXpXEByXQsLwSok07na0=;
  b=bUbAhL6rmPBh3opqXJLsQ6I1FJ6wwBGe4t9kuKxS+3YFuMqpUGBeOz3K
   lGutwZuK1soEAlBIMC6hZpPQ1MW1q5NvbLEtWAcxFmb1FGbsIErwZRv+j
   yEgJD2r3dWqAxj4quc8o0fvmONrfoKtNrQPNNUUKw8tkGx1ZWIArTKazo
   wpZuYgLEUzV1Uzt4VbLfacwJN+XK7+O58BG6KTPJxI386p4vxcE2QDfqY
   lnm8Dhma0bp/W8vk60qKH0A8lnzHKUHikSXCDWGZdMTP0v1GcyViXiU8a
   orBUabTRmxo2lZRe7er+9r4SqVjuzbLQdVKi00Rn9fKHhbJSl9sulQH3J
   w==;
X-CSE-ConnectionGUID: xF7jVOqcRmGKeX+1Mte2lg==
X-CSE-MsgGUID: yQK/3sKVRuSTLMeuuIRSFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75842411"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="75842411"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:25:17 -0800
X-CSE-ConnectionGUID: kbN81a2JR0Gd2DLNCERGdg==
X-CSE-MsgGUID: kUlxuiyKQYOGgckGB8xNiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="213008649"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2025 13:25:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeob-0000000018a-2rNr;
	Thu, 13 Nov 2025 21:25:13 +0000
Date: Thu, 13 Nov 2025 22:25:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 16/21]
 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: pinctrl@41000000
 (microchip,pic64gx-pinctrl-gpio2): mux-mac0-gpio: {'function': ['gpio'],
 'groups': ['gpio_mdio0']} is not of type 'array'
Message-ID: <202511131152.20b6Xarn-lkp@intel.com>
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
head:   8e1ae5900153c6515e0da730b16dfee6fd1a3330
commit: 033b0229d78f8adc478f496b6fc37a44ecc75668 [16/21] split groups for gpio up so that all defaults exist to aid the tool
:::::: branch date: 20 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-2051-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131152.20b6Xarn-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev17+geee71adb5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131152.20b6Xarn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131152.20b6Xarn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controller@38400000 (microchip,pic64gx-ccc): compatible:0: 'microchip,mpfs-ccc' was expected
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controller@38400000 (microchip,pic64gx-ccc): compatible: ['microchip,pic64gx-ccc', 'microchip,mpfs-ccc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/clock-controller@38400000: failed to match any schema with compatible: ['microchip,pic64gx-ccc', 'microchip,mpfs-ccc']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clkcfg@3e001000 (microchip,pic64gx-clkcfg): compatible:0: 'microchip,mpfs-clkcfg' was expected
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-clkcfg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clkcfg@3e001000 (microchip,pic64gx-clkcfg): compatible: ['microchip,pic64gx-clkcfg', 'microchip,mpfs-clkcfg'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-clkcfg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/clkcfg@3e001000: failed to match any schema with compatible: ['microchip,pic64gx-clkcfg', 'microchip,mpfs-clkcfg']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: pinctrl@41000000 (microchip,pic64gx-pinctrl-gpio2): mux-mac0-gpio: {'function': ['gpio'], 'groups': ['gpio_mdio0']} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: pinctrl@41000000 (microchip,pic64gx-pinctrl-gpio2): mux-mac1-gpio: {'function': ['gpio'], 'groups': ['gpio_mdio1'], 'phandle': 25} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: pinctrl@41000000 (microchip,pic64gx-pinctrl-gpio2): mux-spi0-gpio: {'function': ['gpio'], 'groups': ['gpio_spi0'], 'phandle': 26} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: pinctrl@41000000 (microchip,pic64gx-pinctrl-gpio2): mux-can0-gpio: {'function': ['gpio'], 'groups': ['gpio_can0'], 'phandle': 27} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: pinctrl@41000000 (microchip,pic64gx-pinctrl-gpio2): mux-pcie-gpio: {'function': ['gpio'], 'groups': ['gpio_pcie'], 'phandle': 28} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: pinctrl@41000000 (microchip,pic64gx-pinctrl-gpio2): mux-qspi0-gpio: {'function': ['gpio'], 'groups': ['gpio_qspi'], 'phandle': 29} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: pinctrl@41000000 (microchip,pic64gx-pinctrl-gpio2): mux-uart3-gpio: {'function': ['gpio'], 'groups': ['gpio_uart3'], 'phandle': 30} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: pinctrl@41000000 (microchip,pic64gx-pinctrl-gpio2): mux-uart4-gpio: {'function': ['gpio'], 'groups': ['gpio_uart4'], 'phandle': 31} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: pinctrl@41000000 (microchip,pic64gx-pinctrl-gpio2): mux-can1-gpio: {'function': ['gpio'], 'groups': ['gpio_can1'], 'phandle': 32} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: pinctrl@41000000 (microchip,pic64gx-pinctrl-gpio2): mux-uart2-gpio: {'function': ['gpio'], 'groups': ['gpio_uart2']} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
