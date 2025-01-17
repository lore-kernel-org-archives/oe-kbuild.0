Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C9D1F63CB
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jan 2025 10:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737109887; cv=none; b=qFzz9aR2/+Ed4ceYNjxWMsPl7QoTG/n98hG4Q9ytqPX64A1sGW3t1Wi2jEbLc9DRGbf4nTa0fbwX59kMFeaRfjMg1vmbXOjLXsXxwQKh36VoCF8u7bVdEnAdOHz3gaZl+78//VF1LYjH8HHiImA/zOrTHWPYLBnQP3YZ4DraWUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737109887; c=relaxed/simple;
	bh=RL0Nso8kKkThoNBmngWVblIpNBZVjQnok9xR8F2gICU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JxmCBkhjfqe842sSOCZUGo4asBHxkdaelDyMMk829g62I/d6vCPpMvF8FmRE6TrBSUR+V7u8HmGAjXjL9Aq6AaomyVUPpgsyJOaNEhmSBV5MTqcYNdfb1CU6iHgGbdJcwTRwTok+uabifUUPE9OrKTF6cewOzvCsvNxD5I8tcis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8NCX+Ka; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8NCX+Ka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737109885; x=1768645885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RL0Nso8kKkThoNBmngWVblIpNBZVjQnok9xR8F2gICU=;
  b=S8NCX+Ka0ZsvmzxR+iN7sgKe4oENHoguGBKUm4Q+iWrLkzrjl3iHnuT5
   roWGYKXDgHzF1LVRlNL3U2yysv+zEhCzpv87BamcaGB+LZfnRXEwfmEFD
   mHQ6daNdrvnd1uQEwyHN9akFSVrzDIoH3brJXs34G+fy3Rp606tRaLBUK
   XB8wAZOXE34/kaH8SNbEembFAyyUflSXdyzQDveVKxObCssURYuUsqZUn
   TChZ/8kWlhCoDTu1IRncTMVlmqbqbNdOAJFqcBjVGUNa84r37xTaR5icj
   bHokbx6RgdvORJfTGTWPM3UprN62u8tKd61HiDEl7ttyiG76wR7YWld2A
   w==;
X-CSE-ConnectionGUID: UxRzmLjESMi8CTY9iq++FQ==
X-CSE-MsgGUID: iz0wKmQQQ8KcTfOkUeXpRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37655126"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37655126"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 02:31:24 -0800
X-CSE-ConnectionGUID: y5jl/8m/SMaaXNjRSEMPNA==
X-CSE-MsgGUID: W9dAjkb/SqeywhHnIub0zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="106359937"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jan 2025 02:31:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYjdJ-000T4J-0j;
	Fri, 17 Jan 2025 10:31:21 +0000
Date: Fri, 17 Jan 2025 18:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/str-enable-disable 51/59]
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: gpio@140:
 Unevaluated properties are not allowed ('gpio-ranges', 'lte-disable-hog',
 'lte-reset-hog', 'sata-reset-hog', 'wlan_disable-hog' were unexpected)
Message-ID: <202501171858.Q8g7IO98-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/str-enable-disable
head:   bd2e2630d542c17294dcf6b292cfaeb576adbbbc
commit: 0cc7e1dcc1a2c4ff4d852743c07675e3e0af2ac2 [51/59] arm64: dts: marvell: armada-8040: Align GPIO hog name with bindings
:::::: branch date: 25 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171858.Q8g7IO98-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171858.Q8g7IO98-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501171858.Q8g7IO98-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: config-space@f2000000: $nodename:0: 'config-space@f2000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges', 'lte-disable-hog', 'lte-reset-hog', 'sata-reset-hog', 'wlan_disable-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
