Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2CE2D8396
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 06:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758607389; cv=none; b=OaMGtjH5TDiFilIsmsNPt+EjxSSIAJQ87WYUm7HbsGD3odOeqABCMDk0vhBiZCeBdQE227N74WXj/WhYir6X37ruJbv3dF3bKvxYmGnsgh5aYJiuJXVXm+tX+292dQkNyC/pBhfVZ7iKR78a48eQ4m9JTkjyiVD2f7643CngE3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758607389; c=relaxed/simple;
	bh=k0/3oBnsXiLPxhxYF77XemFzCpyU+qXJELy3sKVhXnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iTOgL9+Rsc5yRitgolujOG4nt0N1giGPr48PH24fNT6El4RS0/S12Ym4V5f6z5kb8jr5yLZdZC245/8SWDhJHVCmR4JsKPfevEV/b1V8/L0wV/oFQb277So3nes1DZA5iJCJXH0Oq453HDqX2Iw2T1GOfPFroeZOj2I2v+g8OeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Udz5dhbk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Udz5dhbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758607387; x=1790143387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k0/3oBnsXiLPxhxYF77XemFzCpyU+qXJELy3sKVhXnI=;
  b=Udz5dhbkZVrcCvIotXApAK6tlT5Hq6w/qMp9aU3w3y8PO+wxL31PpKM8
   sYZKON87gNaGC+6ztAWeDQvk6CGGC7JX0yDYvvrD0P7AzDhfPzWdaWnPW
   BsYx6VkKRZmomZQtxOW+Yo00GNxC3rovmmLSOEF+/keR7I8dgOxNGJ5Xc
   eMpfsfptsvap08+qGFo0kss+ISP73zVxi1ZY9PzMWHG3WBYvz/7P9SXPw
   xvLqybHyG8EksEa3G1tPSvDCWLsLLV6qhJXxrsqKoeGU0pxmdDVrzELDI
   zn/83ogx2V0Gc0CjW5soEYHCDGPWg3SzpyOtRsUbjTcrcIiR9OhwZSGCB
   w==;
X-CSE-ConnectionGUID: S2hptdsITHW66+mgiEdoSQ==
X-CSE-MsgGUID: hva764ioQ/mhysZvyvdDsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86314018"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="86314018"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 23:03:06 -0700
X-CSE-ConnectionGUID: P9xgAf14Q7W4+dQnVr9Xyg==
X-CSE-MsgGUID: uRTDENc5Ty6BclR5ajT40w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="200376378"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 22 Sep 2025 23:03:05 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0w7D-0000000045J-1zQy;
	Tue, 23 Sep 2025 06:03:03 +0000
Date: Tue, 23 Sep 2025 08:02:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 24/140]
 arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000/rtc: failed to
 match any schema with compatible: ['apple,smc-rtc']
Message-ID: <202509230859.0E8vFiKq-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 307adce46a44a4e8df04d1a4da7f08a736e83870 [24/140] arm64: dts: apple: t8112: Add smc_rtc node
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250923/202509230859.0E8vFiKq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230859.0E8vFiKq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509230859.0E8vFiKq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: pmic@e (apple,stowe-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: pmic@e (apple,stowe-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
