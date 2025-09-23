Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BDF23A984
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 01:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758591187; cv=none; b=hbIx+i176pP6tgICh6o5r8NQGmib3ZqIcNserOqwpEG5TsXPxS66ROjUBUG2ta8ev4iNskzFqihbSNDtgCXo8rEoVjNZvfLBZABIKxR3lSMz1ASNpt8ccVEwso2ju0dfCPKkQ7Tc8X1zfR2cHSwJ8fk91U1g8GWrOyL4IvvOXjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758591187; c=relaxed/simple;
	bh=i705ooW2TjaRHnxaWOuj8gY74QPhuLkDuX7J+b134BY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VEKEfYzXxlE2vxNB0Tbwfkuwk7ZNNTmQtO4Pl/YluCAOK0A5uxkyM2/Bw+teAK8Y5H1lxdyC/0YaEucf+jOluDsQzqciSLdxO+M/PNFQJzN4jX1Ie4LSTO/5WJrhLV2N8OjYW0JA4ospnBOi2WjRh/jUlGZ/BxKzMl513d9boLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLfy32d0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLfy32d0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758591185; x=1790127185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i705ooW2TjaRHnxaWOuj8gY74QPhuLkDuX7J+b134BY=;
  b=QLfy32d0Ll89eUOtpLAqspBM8zq9kiGSm8PIKSlc0o88i9ES+lBFpEpr
   5n6UYt6QjkGkqeiXX/RuemzDOxAIqjfohBhsAZbvMAzh76UuTdiO02mKX
   2wGKy4nDpaT3tIgH7t0ZcaT4CLd1b+5j3l9wzqAAQYe+kqHY9wC/EBZF0
   2gn0OzIZa0vdMaXC/UiemQpHDeO91aivVPQJT4GJk6hOg90jrDyDUdxqa
   NbDsX3XXmqcRrtYKtVzZ/ZvABxl0Z8wumeS+bQD9jescptZFFeqSMlRhs
   t6Bo3qhzCfH4kLFiR5wVNo3i7PJjVt91+Ktbh047MIWnFdMxfVICADHCQ
   Q==;
X-CSE-ConnectionGUID: aQopkeGJSJyzGUCF4x7UVg==
X-CSE-MsgGUID: a3WZyPE1RdyGFH3mDa6K2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="48435496"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="48435496"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 18:33:04 -0700
X-CSE-ConnectionGUID: akgZIWRwTUi/E1KDAUV11w==
X-CSE-MsgGUID: 3nW2C6AyRsO6eu0rIaO0jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="176228684"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 22 Sep 2025 18:33:04 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0rtt-0000000042X-21S0;
	Tue, 23 Sep 2025 01:33:01 +0000
Date: Tue, 23 Sep 2025 03:32:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 22/140]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/rtc: failed to
 match any schema with compatible: ['apple,smc-rtc']
Message-ID: <202509230340.ztf2mnby-lkp@intel.com>
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
commit: 6eeb18e3f504a024f9d777a379b3e57d584961cc [22/140] arm64: dts: apple: t8103: Add smc_rtc node
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250923/202509230340.ztf2mnby-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230340.ztf2mnby-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509230340.ztf2mnby-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: nvmem-layout (fixed-layout): 'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
