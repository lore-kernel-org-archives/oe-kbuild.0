Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7982E1A5B92
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 06:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758954239; cv=none; b=R2Umc3Yu/lrbfs+ir0xefrhTZdpdR8redXcRkctLW0UELYETFHEw3fnE5RYnhBylTjLNabdryCwP4JP4yxozaHscCne0isbQRpaQjwlyOZvWeocy6itMNQ60HWQGXrAOvOH3DZm0Lm7kEGm+IAY0exbwNNC7NVk5Zy3yXhZOrmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758954239; c=relaxed/simple;
	bh=Si3VtUi0otYaH0Sa+Z5qoZTI/WbW1Po7INWb8o+mNuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PkEXfQa/xq2iSJxTyWsRzcAW3I0x3EkXI3KsOuS+ZCysVE40iTSzRJXqrJp14KEwkl4hm4YnfltZUbGEqlFbZoic1QtXYUMx7/0xcXDqiMgQ7gAg5jTxB14L1kuQZHV4ipHvlEK+eLFeKHlfgSOUms34PreI0c5HI9UgEOWBo/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IO/hkiKG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IO/hkiKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758954238; x=1790490238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Si3VtUi0otYaH0Sa+Z5qoZTI/WbW1Po7INWb8o+mNuY=;
  b=IO/hkiKGzhuDKZsqjeKY3KDYPiXeYPuWhitinDgF5UpcPj59hjrLq4sD
   F14dYf4g0Ea2taXAt1mNBjtTCT88bOMJr/Z1pvJ4eH388JusYSo99gFXM
   4d2fpG2w5wEX/6m8FKpAZ2hqcEgiXRXuhMUZfP4d6kTTSC7rVQ5kBrTi8
   Yv74CBzwzP00dmzAl4UFufl1J3Bgnq2fuMpuIX1QWaY2g6ZKMVU4+YQuz
   KKLc/1krsCbouMm8/NlwxptJu5af79mqossgRgx5a84iS0Wpy4RqqPYWZ
   P2SubJ3NrZlscjTLKSUMaDq5GXZqap9A01N+SZ8jLLLMmhyOmRKMPyCEn
   w==;
X-CSE-ConnectionGUID: zAvJE6xHQdaxRXaQGY3D7w==
X-CSE-MsgGUID: vFnizSA+R5OgxaydtYrrZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="83890121"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="83890121"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 23:23:57 -0700
X-CSE-ConnectionGUID: cnRJ66T1StunV1HeGgxlAA==
X-CSE-MsgGUID: Oh1WT8SWQISDDrhz1OXzbw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 26 Sep 2025 23:23:56 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v2OLZ-000000005RJ-2sJw;
	Sat, 27 Sep 2025 06:23:53 +0000
Date: Sat, 27 Sep 2025 08:23:13 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 13/140]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000/gpio: failed to
 match any schema with compatible: ['apple,smc-gpio']
Message-ID: <202509270848.oa7ypijj-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>
CC: Alyssa Rosenzweig <alyssa@rosenzweig.io>
CC: Neal Gompa <neal@gompa.dev>
CC: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: bb68a65360cf8dd09633bee6af61b9a879bdfa89 [13/140] arm64: dts: apple: t8112: Add SMC node
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250927/202509270848.oa7ypijj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509270848.oa7ypijj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509270848.oa7ypijj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: pmic@e (apple,stowe-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
--
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: pmic@e (apple,stowe-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
