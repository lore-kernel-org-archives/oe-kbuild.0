Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E2C201278
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779611526; cv=none; b=YMSNdqMcNgy4aXDDWSngpvAMmkHBnJIol7sNvw9dgC74FNRgGfzSND7ZZNlAp4EN7bb0gmeexfwac6RNfhIPQyk9RPXDazybF7vC1A7/apqFi+Kl3qH2zb/bgwpJzs48+UM4PyGdmLMRYB96Mtlyl0kTWZCfOyv0tJPRlvDeHDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779611526; c=relaxed/simple;
	bh=8plbhiDoCw1v3gZdNbW6o0oNNYKZk56GJc8el9MEUFg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k5Ipl68Jbo8Cn2Vx7dUc9LHXNGYXej1roKNY/BZjtpr9Ej6hMgVJCyuB3gm5rpHnny8N2QlACuLQTQaJas1V9MtmOanhBnTBiCvXAsBgmy9DJ1DJ2dkrVm6GHssTwO2FuHTalajsV2GjU+O/LPFXOk1r2I5AIDz//Ewl5sMtm7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkV7Quj7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkV7Quj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779611524; x=1811147524;
  h=date:from:to:cc:subject:message-id;
  bh=8plbhiDoCw1v3gZdNbW6o0oNNYKZk56GJc8el9MEUFg=;
  b=FkV7Quj7yvG7WHiuwat2UPQ8jzJhuas/DBqnXGCx6SZD5GaPZ153cC8E
   mT4GKCnkizNPsSphzITnJ4Dvb45qBHQn9riPBtb6EGZn5cBIYF6UGY/ue
   YjSJRyucJFjk8sVu4D1QMWuXKU+SuJQtiu8MUsXtI445j3QJ2poW0043s
   OqLZA+kmS//doEK0kPe1WKpQ+gTzJV80jxrlZdLbDzevXkhsDCxj+hM2p
   h97QSYNffMF/NukH+mCcyPCQRScEtJo9lV2IKjHaPM/6jJUCo0Waiffa+
   6fm0HGUNwvn8j2g8zAJenz2PIKYRUfUv9ff2pmyRreTrPeLTBEBCszjbK
   g==;
X-CSE-ConnectionGUID: s+oOCK5UR5+CIL1wekR/tg==
X-CSE-MsgGUID: IBkba0CwQJOkBW0VpJkNEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91581165"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="91581165"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 01:32:04 -0700
X-CSE-ConnectionGUID: Tbb/hfDmRfOJebkIhu0bRg==
X-CSE-MsgGUID: vYUGFvnnQKmvkEgoWnee7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="238277750"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 24 May 2026 01:32:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR4Fc-00000000Bvl-1sBB;
	Sun, 24 May 2026 08:32:00 +0000
Date: Sun, 24 May 2026 10:31:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 13/114]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000
 (apple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not
 match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202605241005.1Lv6Uoix-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 35f54dcd0f7374d7d69af856e58172400944d7ab [13/114] arm64: dts: apple: t8103: Mark MCA power states as externally-clocked
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260524/202605241005.1Lv6Uoix-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241005.1Lv6Uoix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605241005.1Lv6Uoix-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2b8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2c0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2c8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2d0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2d8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@2e0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
--
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2b8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2c0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2c8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2d0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2d8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@2e0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
--
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2b8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2c0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2c8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2d0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2d8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@2e0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
--
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2b8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2c0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2c8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2d0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2d8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@2e0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
--
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2b8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000 (apple,t8103-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2b8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2c0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2c8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2d0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2d8 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@2e0 (apple,t8103-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
