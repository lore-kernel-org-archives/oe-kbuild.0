Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964F33B791
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 01:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731462305; cv=none; b=PiPUHz17Kx3l4HeHrcd/Xwjk3nINdoF1FMJJTEpeD0jyF1/wYrOyTkSfdib6cVKK6rPdrEo1RuuS+iNPSZ/W7+iMArmkfi5Zgda1oqDD5uEOysz9LPtR+Jh5DycKcxPmc83s+YMb0FgNj6B5rg/mFN+ANhRwldW0BgEo6bCQFL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731462305; c=relaxed/simple;
	bh=9Du8nBu8wgd85qkOsa5OYepQmV/qkcZx0W4e/SsxImQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NnMeqJe2EnAGJn+0t2Tss1ilX1RduF7zRLZ9WjX+Fi2gf8VV4nvQpfKGM1EZrj4dODB1JPv8VZGz+6CuBb9dhXOqFHVC29VXq8MzCiQRXaX3Q1yKJX2Pl/RBJ8faKeCM2/6hzHS7tuXreXkNdMaUdbmtqG3HSgLrizylSE8xl5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PleqaUGy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PleqaUGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731462304; x=1762998304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Du8nBu8wgd85qkOsa5OYepQmV/qkcZx0W4e/SsxImQ=;
  b=PleqaUGy1MQKcpnp77xRxECZylgSofMCIW96vvgt9rO5bPPdesw5tqW1
   2ux3KstXXS/W02HS/bvB7yeZR+NFt4B0JE8RTrj/JVzrfMZYi9DPY5YD5
   MKUin4/eZ0vYSTHGzdz6W/VSX16xvS3TFnxA2O9mbzmOMhWk7uQpVe2su
   t+kotxUeczIZG0Th17jqJQIN9asjmpAyx04NZ/GChOZcfd3TcvQhMLZSz
   qCJIYUjFizBbwiPjXsnhW2j2VxMP7RgHA1x1+2qIdTtZKZU6W3k5Ci/cH
   d6Z8FeSDxOtOLW+v0Rqi31PUZUzQJQev5NdvovP17+Jaq+SVrzmH//KcZ
   Q==;
X-CSE-ConnectionGUID: aRlOv6JLS3Wo6nkYFYpN+w==
X-CSE-MsgGUID: ejWijZ3YTXiHUhHNFp8CDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42739618"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="42739618"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 17:45:04 -0800
X-CSE-ConnectionGUID: +AU8MYnESHCgsrhaWLsxBQ==
X-CSE-MsgGUID: sgL00jPcQD6lntjdcAAU9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="92662198"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Nov 2024 17:45:02 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB2RH-0001vZ-2L;
	Wed, 13 Nov 2024 01:44:59 +0000
Date: Wed, 13 Nov 2024 09:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 37/48]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb:
 /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible:
 ['thead,th1520-misc-sysreg', 'syscon']
Message-ID: <202411130936.Wg443sLS-lkp@intel.com>
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
head:   b0b9c5dfe5239c799b6da7dadef7586860b61313
commit: a82aae031f0bc8928a1d647ecffbc4e5e2648604 [37/48] riscv: dts: thead: Add TH1520 USB nodes
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: riscv-randconfig-052-20241113 (https://download.01.org/0day-ci/archive/20241113/202411130936.Wg443sLS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130936.Wg443sLS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411130936.Wg443sLS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'thead,misc-sysreg' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
--
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
